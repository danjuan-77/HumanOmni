# HumanOmni: Human-Centric Omnimodal Large Language Model

[![ModelScope](https://img.shields.io/badge/ModelScope-HumanOmni-blue)](https://modelscope.cn/models/myroot/HumanOmni-7B)
[![Hugging Face](https://img.shields.io/badge/HuggingFace-HumanOmni-yellow)](https://huggingface.co/StarJiaxing/HumanOmni-7B)
[![arXiv](https://img.shields.io/badge/arXiv-2405.15111-red)](https://arxiv.org/abs/2501.15111)

<div align="center">
  <img src="figures/pipeline.png" width="800"/>
</div>

## Introduction
**HumanOmni** is the industry's first human-centric omnimultimodal large language model designed to achieve comprehensive understanding in human-centric scenes through joint visual-audio-linguistic reasoning. Unlike generic multimodal models, we address two key challenges: 
1) **Domain-specific capability**: Trained on 2.4M human-centric video clips with 14M instructions
2) **Adaptive fusion**: Features three specialized branches with instruction-guided dynamic fusion
3) **Audio-visual synergy**: Integrates environmental audio cues with visual understanding

## Model Versions
### Released Models
| Version    | Parameters | Modalities       | 
|------------|------------|------------------|
| 7B-Base-Instruct    | 7B         | Video+Audio+Text | 

### Upcoming Releases
+ 2B-Lite (Q3 2024): Pruned version for edge devices (2B params, 8GB VRAM)
+ 72B-Expert (Q4 2024): Enhanced reasoning model with RLHF tuning

## Performance
Here are some performance benchmarks of HumanOmni across various tasks:

<div align="center">
  <img src="figures/performance_task1.png" width="400"/>
  <img src="figures/performance_task2.png" width="400"/>
</div>

## Environment Setup
conda create -n humanomni python=3.10
conda activate humanomni
pip install -r requirements.txt
