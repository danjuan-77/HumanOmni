#!/bin/bash
export CUDA_VISIBLE_DEVICES=1
# HumanOmni-7B
# Level 1
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_1/LAQA
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_1/LIQA
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_1/LVQA

# Level 2
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_2/MAIC
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_2/MVIC

# Level 3
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/AVH
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/AVL
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/AVM
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/AVR
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/VAH
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/VAR

# Level 4
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_4/AVC
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_4/AVLG
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_4/AVQA

# Level 5
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_5/AVLG
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-7B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_5/AVQA

# HumanOmni-0.5B
# Level 1
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_1/LAQA
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_1/LIQA
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_1/LVQA

# Level 2
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_2/MAIC
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_2/MVIC

# Level 3
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/AVH
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/AVL
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/AVM
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/AVR
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/VAH
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_3/VAR

# Level 4
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_4/AVC
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_4/AVLG
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_4/AVQA

# Level 5
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_5/AVLG
python eval.py --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B --task_path /share/nlp/tuwenming/projects/HAVIB/data/levels/level_5/AVQA

# nohup bash eval.sh > /share/nlp/tuwenming/projects/HAVIB/logs/eval_humanomni_gpu1_$(date +%Y%m%d%H%M%S).log 2>&1 &
