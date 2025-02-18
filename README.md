# Doremi-Updated: Smart Domain Reweighting for Generalization

## Overview
DoGE is a domain reweighting approach designed to improve generalization across domains. This repository extends DoGE with **Doremi-Updated**, which builds upon DoReMi with three key enhancements:
- **KL Divergence Regularization**: Encourages better representation alignment between teacher and student models.
- **Output Adjustment**: Returns an optimized reference model instead of just domain weights.
- **Resampling Instead of Reweighting**: Enhances stability by selecting samples adaptively.

## Installation
```bash
pip install -r requirements.txt
```

## Running Experiments

### **Train Different Models**
You can train different versions by running:
```bash
python src/run.py --config_json DoGE/config/doge_5.json --wandb_proj doge --wandb_run DOGE-proxy-82M --total_iterations 10000
```

Mapping of `config_json` to algorithms:

| Config JSON  | Model Type        |
|-------------|------------------|
| doge_5.json | Base Model       |
| doge_6.json | Doremi-Updated   |
| doge_7.json | DDK              |
| doge_8.json | DoReMi           |

For **larger models (768M)**, use:
```bash
python src/run.py --config_json DoGE/config/doge_9.json  # Doremi-Updated
python src/run.py --config_json DoGE/config/doge_10.json  # DDK
python src/run.py --config_json DoGE/config/doge_11.json  # Base Model
python src/run.py --config_json DoGE/config/doge_12.json  # DoReMi
```

### **Evaluation**
Once training is done, use:
```bash
bash.sh
```
Modify `model_args` to point to the directory containing the trained model. This will compute scores on **MMLU, Race, ARC, and other benchmarks**.
