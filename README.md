# HumanOmni: Human-Centric Omnimodal Large Language Model

[![ModelScope](https://img.shields.io/badge/ModelScope-HumanOmni-blue)](https://modelscope.cn/models/humanomni)
[![Hugging Face](https://img.shields.io/badge/HuggingFace-HumanOmni-yellow)](https://huggingface.co/humanomni)
[![arXiv](https://img.shields.io/badge/arXiv-2405.XXXXX-red)](https://arxiv.org/abs/2405.XXXXX)

<div align="center">
  <img src="figures/pipeline.png" width="800"/>
</div>

## Introduction
**HumanOmni** is the first unified framework for comprehensive understanding of human-centric scenes through multimodal fusion. Our solution addresses three core challenges:

🎯 **Key Innovations**:
- **Adaptive Fusion Mechanism**: Dynamic integration of visual, auditory and textual features
- **Temporal Synchronization**: Frame-accurate alignment of video and audio streams
- **Domain-Specific Pretraining**: Curriculum learning on 2.4M human-centric clips

💡 **Core Features**:
- 7B parameter base model with 3 modality-specific encoders
- 14.7 FPS real-time processing at 1080p resolution
- Support for 18+ human understanding tasks

## Model Versions
### Released Models
| Version    | Parameters | Modalities       | VRAM Requirement |
|------------|------------|------------------|------------------|
| 7B-Base    | 7B         | Video+Audio+Text | 24GB             |

### Upcoming Releases
```diff
+ 2B-Lite (Q3 2024): Pruned version for edge devices (2B params, 8GB VRAM)
+ 72B-Expert (Q4 2024): Enhanced reasoning model with RLHF tuning

## Performance
Here are some performance benchmarks of HumanOmni across various tasks:

<div align="center">
  <img src="figures/performance_task1.png" width="400"/>
  <img src="figures/performance_task2.png" width="400"/>
</div>
