#!/bin/bash
export CUDA_VISIBLE_DEVICES=0
# HumanOmni-7B

python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/AVH
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/AVL

# nohup bash eval_gpu0.sh > /share/nlp/tuwenming/projects/HAVIB/logs/eval_humanomni-7b_unimodal_gpu0_$(date +%Y%m%d%H%M%S).log 2>&1 &
