#!/bin/bash

# video + audio
python inference.py --modal video_audio \
  --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B \
  --video_path ./data/test.mp4 \
  --instruct "Describe this video."

# video only
python inference.py --modal video \
  --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B \
  --video_path ./data/test.mp4 \
  --instruct "Describe this video."

# audio only
python inference.py --modal audio \
  --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B \
  --video_path ./data/test.mp4 \
  --instruct "Describe this video."

# # image 
# python inference.py --modal image \
#   --model_path /share/nlp/tuwenming/models/StarJiaxing/HumanOmni-0.5B \
#   --image_path /share/nlp/tuwenming/projects/Ola/data/vision_qa_image.jpg \
#   --instruct "Describe this picture."