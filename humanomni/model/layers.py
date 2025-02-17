import torch
import torch.nn as nn
import torch.nn.functional as F


class LayerNorm(nn.Module):
    """LayerNorm that supports two data formats: channels_last (default) or channels_first.
    The ordering of the dimensions in the inputs. channels_last corresponds to inputs with
    shape (batch_size, height, width, channels) while channels_first corresponds to inputs
    with shape (batch_size, channels, height, width).
    """

    def __init__(self, normalized_shape, eps=1e-6, data_format="channels_last"):
        super().__init__()
        self.weight = nn.Parameter(torch.ones(normalized_shape))
        self.bias = nn.Parameter(torch.zeros(normalized_shape))
        self.eps = eps
        self.data_format = data_format
        if self.data_format not in ["channels_last", "channels_first"]:
            raise NotImplementedError
        self.normalized_shape = (normalized_shape,)

    def forward(self, x):
        if self.data_format == "channels_last":
            return F.layer_norm(x, self.normalized_shape, self.weight, self.bias, self.eps)
        elif self.data_format == "channels_first":
            u = x.mean(1, keepdim=True)
            s = (x - u).pow(2).mean(1, keepdim=True)
            x = (x - u) / torch.sqrt(s + self.eps)
            x = self.weight[:, None, None] * x + self.bias[:, None, None]
            return x


class LayerNorm2d(nn.Module):
    """2D Layer Normalization module.
    
    Applies Layer Normalization over a 4D input tensor (batch_size, channels, height, width).
    Normalizes the input tensor along the channel dimension.
    """

    def __init__(self, num_channels, eps=1e-6):
        super().__init__()
        self.weight = nn.Parameter(torch.ones(num_channels))
        self.bias = nn.Parameter(torch.zeros(num_channels))
        self.eps = eps

    def forward(self, x):
        u = x.mean(1, keepdim=True)
        s = (x - u).pow(2).mean(1, keepdim=True)
        x = (x - u) / torch.sqrt(s + self.eps)
        x = self.weight.view(1, -1, 1, 1) * x + self.bias.view(1, -1, 1, 1)
        return x


class RegStage(nn.Module):
    """RegNet stage (sequence of blocks with the same output shape).
    
    Args:
        in_channels (int): Number of input channels.
        out_channels (int): Number of output channels.
        stride (int): Stride of the first block. Default: 2
        depth (int): Number of blocks. Default: 1
        groups (int): Number of groups in conv layers. Default: 1
        width_per_group (int): Width of each group. Default: 64
        bottleneck_ratio (float): Bottleneck ratio. Default: 1.0
        se_ratio (float): SE ratio. Default: 0.25
        activation (nn.Module): Activation function. Default: nn.ReLU
    """

    def __init__(
        self,
        in_channels,
        out_channels,
        stride=2,
        depth=1,
        groups=1,
        width_per_group=64,
        bottleneck_ratio=1.0,
        se_ratio=0.25,
        activation=nn.ReLU,
    ):
        super().__init__()
        self.in_channels = in_channels
        self.out_channels = out_channels
        self.stride = stride
        self.depth = depth
        
        # Calculate group width and bottleneck channels
        group_width = int(width_per_group * groups)
        bottleneck_channels = int(round(out_channels * bottleneck_ratio))
        
        # Create blocks
        self.blocks = nn.Sequential()
        for i in range(depth):
            block_stride = stride if i == 0 else 1
            block = self._make_block(
                in_channels if i == 0 else out_channels,
                out_channels,
                bottleneck_channels,
                block_stride,
                groups,
                se_ratio,
                activation,
            )
            self.blocks.add_module(f"block{i + 1}", block)

    def _make_block(
        self,
        in_channels,
        out_channels,
        bottleneck_channels,
        stride,
        groups,
        se_ratio,
        activation,
    ):
        """Create a RegNet block."""
        return RegBlock(
            in_channels,
            out_channels,
            bottleneck_channels,
            stride,
            groups,
            se_ratio,
            activation,
        )

    def forward(self, x):
        return self.blocks(x)


class RegBlock(nn.Module):
    """RegNet block with optional SE."""

    def __init__(
        self,
        in_channels,
        out_channels,
        bottleneck_channels,
        stride=1,
        groups=1,
        se_ratio=None,
        activation=nn.ReLU,
    ):
        super().__init__()
        
        self.conv1 = nn.Conv2d(in_channels, bottleneck_channels, kernel_size=1, bias=False)
        self.bn1 = nn.BatchNorm2d(bottleneck_channels)
        self.act1 = activation(inplace=True)
        
        self.conv2 = nn.Conv2d(
            bottleneck_channels,
            bottleneck_channels,
            kernel_size=3,
            stride=stride,
            padding=1,
            groups=groups,
            bias=False,
        )
        self.bn2 = nn.BatchNorm2d(bottleneck_channels)
        self.act2 = activation(inplace=True)
        
        self.conv3 = nn.Conv2d(bottleneck_channels, out_channels, kernel_size=1, bias=False)
        self.bn3 = nn.BatchNorm2d(out_channels)
        
        # SE layer
        self.se = SELayer(out_channels, se_ratio) if se_ratio else None
        
        # Shortcut
        if stride != 1 or in_channels != out_channels:
            self.shortcut = nn.Sequential(
                nn.Conv2d(in_channels, out_channels, kernel_size=1, stride=stride, bias=False),
                nn.BatchNorm2d(out_channels),
            )
        else:
            self.shortcut = nn.Identity()
        
        self.act3 = activation(inplace=True)

    def forward(self, x):
        identity = self.shortcut(x)
        
        out = self.conv1(x)
        out = self.bn1(out)
        out = self.act1(out)
        
        out = self.conv2(out)
        out = self.bn2(out)
        out = self.act2(out)
        
        out = self.conv3(out)
        out = self.bn3(out)
        
        if self.se is not None:
            out = self.se(out)
        
        out += identity
        out = self.act3(out)
        
        return out


class SELayer(nn.Module):
    """Squeeze-and-Excitation layer."""

    def __init__(self, channels, reduction_ratio):
        super().__init__()
        reduced_channels = max(1, int(channels * reduction_ratio))
        self.avg_pool = nn.AdaptiveAvgPool2d(1)
        self.fc1 = nn.Conv2d(channels, reduced_channels, kernel_size=1)
        self.act = nn.ReLU(inplace=True)
        self.fc2 = nn.Conv2d(reduced_channels, channels, kernel_size=1)
        self.sigmoid = nn.Sigmoid()

    def forward(self, x):
        identity = x
        x = self.avg_pool(x)
        x = self.fc1(x)
        x = self.act(x)
        x = self.fc2(x)
        x = self.sigmoid(x)
        return identity * x
