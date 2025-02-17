from humanomni import model_init, mm_infer
from humanomni.utils import disable_torch_init
from transformers import BertModel, BertTokenizer
bert_model = "bert-base-uncased"
bert_tokenizer = BertTokenizer.from_pretrained(bert_model)
model_path = './HumanOmni_7B'
disable_torch_init()
#modal = 'video'
modal = 'video_audio'
model, processor, tokenizer = model_init(model_path)
instruct = "How would you describe the stitches formed by the sewing machine?"
video_path = '/mnt/data/jiaxing.zjx/datasets/Oryx-SFT-DATA/video/oryx_0000000059.mp4'
video_tensor = processor['video'](video_path)
audio = processor['audio'](video_path)[0]
# audio = None
output = mm_infer(video_tensor, instruct, model=model, tokenizer=tokenizer, modal=modal, question=instruct,bert_tokeni=bert_tokenizer,do_sample=False, audio=audio)
print(output)