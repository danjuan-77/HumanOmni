#!/bin/bash

python inference.py --modal video_audio \
  --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B \
  --video_path ./data/test.mp4 \
  --instruct "Describe this video."