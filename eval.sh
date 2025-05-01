#!/bin/bash
export CUDA_VISIBLE_DEVICES=1

python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_1/LAQA