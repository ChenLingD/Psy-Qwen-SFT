#!/bin/bash

# 使用 swift sft 进行心理咨询模型微调
# 环境：NVIDIA A10 (24GB VRAM)
# 技术点：LoRA, 梯度累积, 长文本处理

CUDA_VISIBLE_DEVICES=0 swift sft \
  --model Qwen/Qwen3.5-0.8B \
  --dataset "YIRONGCHEN/PsyDTCorpus#1000" \
  --tuner_type lora \
  --output_dir output/psy-qwen-0.8b \
  --learning_rate 1e-4 \
  --num_train_epochs 3 \
  --per_device_train_batch_size 1 \
  --gradient_accumulation_steps 8 \
  --max_length 4096 \
  --truncation_strategy right
