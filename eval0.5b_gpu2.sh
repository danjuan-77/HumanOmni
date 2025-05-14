#!/bin/bash
export CUDA_VISIBLE_DEVICES=2
# HumanOmni-0.5B

python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_6/AVSQA_av
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects//HAVIB/data/levels/level_6/AVSQA_v

# nohup bash eval0.5b_gpu2.sh > /share/nlp/tuwenming/projects/HAVIB/logs/eval_humanomni-0.5b_unimodal_gpu2_$(date +%Y%m%d%H%M%S).log 2>&1 &
