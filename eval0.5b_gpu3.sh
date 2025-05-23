#!/bin/bash
export CUDA_VISIBLE_DEVICES=3
# HumanOmni-0.5B

python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_5/AVLG
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_5/AVQA

# nohup bash eval0.5b_gpu3.sh > /share/nlp/tuwenming/projects/HAVIB/logs/eval_humanomni-0.5b_unimodal_gpu3_$(date +%Y%m%d%H%M%S).log 2>&1 &
