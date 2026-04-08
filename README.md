# Psy-Qwen-SFT: 心理咨询大模型指令微调项目

本项目基于 **Qwen3.5-0.8B** 基座模型，通过 **Supervised Fine-Tuning (SFT)** 技术，使用高质量心理咨询对话数据集 `PsyDTCorpus` 进行领域适配。

## 🚀 项目亮点

* **垂直领域适配**：针对多轮心理咨询场景，训练出具备专业共情能力和话术对齐的 AI 咨询师模型。
* **高效微调 (PEFT)**：采用 **LoRA (Low-Rank Adaptation)** 技术，仅训练 0.63% (5.4M) 的参数，极大降低了算力开销。
* **工程优化**：在 **NVIDIA A10** 云端算力实例上，通过 **8 步梯度累积 (Gradient Accumulation)** 和 4096 Token 的上下文窗口优化，成功攻克显存溢出 (OOM) 瓶颈。
* **端到端实现**：涵盖了从环境配置、数据预处理、模型微调到推理评估的全链路开发。

## 🛠️ 技术栈

* **Base Model**: Qwen3.5-0.8B
* **Frameworks**: [ms-swift](https://github.com/modelscope/ms-swift), PyTorch, Hugging Face Transformers
* **Hardware**: NVIDIA A10 (24GB VRAM) Cloud Instance
* **Dataset**: [YIRONGCHEN/PsyDTCorpus](https://modelscope.cn/datasets/YIRONGCHEN/PsyDTCorpus)

## 📊 训练结果

* **Final Loss**: 2.063
* **Token Accuracy**: > 51%
* **Training Time**: ~1h 20m

## 📖 如何复现

1. **克隆仓库**
   ```bash
   git clone [https://github.com/ChenLingD/Psy-Qwen-SFT.git](https://github.com/ChenLingD/Psy-Qwen-SFT.git)
   cd Psy-Qwen-SFT

2. **安装依赖**
   ```bash
   pip install --upgrade transformers peft accelerate ms-swift mistral_common

3. **运行训练**
   ```bash
   bash train.sh

4. **模型推理**
   ```bash
   swift infer --adapters ./output/psy-qwen-0.8b/v2-20260408-061615/checkpoint-375

Author: Chen Ling - Data Scientist at IBM | MS in CS @ UPenn
