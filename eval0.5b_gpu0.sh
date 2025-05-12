#!/bin/bash
export CUDA_VISIBLE_DEVICES=0
# HumanOmni-0.5B

python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/AVH
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/AVL

# nohup bash eval0.5b_gpu0.sh > /share/nlp/tuwenming/projects/HAVIB/logs/eval_humanomni-0.5b_unimodal_gpu0_$(date +%Y%m%d%H%M%S).log 2>&1 &
