#!/bin/bash
export CUDA_VISIBLE_DEVICES=1
# HumanOmni-7B

python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/VAH
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_4/AVC

# nohup bash eval_gpu1.sh > /share/nlp/tuwenming/projects/HAVIB/logs/eval_humanomni-7b_unimodal_gpu1_$(date +%Y%m%d%H%M%S).log 2>&1 &
