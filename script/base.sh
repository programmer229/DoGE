#!/bin/bash
#pip install -r requirements.txt
export WANDB_API_KEY="5acb06cc9fc290e1e466a3f8c9e8346ab75c0c59"

python src/run.py --config_json config/gpt_base/baseline.json --wandb_proj doge --wandb_run BASE-82M --total_iterations 20000
python src/run.py --config_json config/gpt_base/reweight_doge.json --wandb_proj doge --wandb_run DOGE-base-82M --total_iterations 20000
python src/run.py --config_json config/gpt_base/reweight_doremi50k.json --wandb_proj doge --wandb_run DOREMI50k-82M --total_iterations 20000
python src/run.py --config_json config/gpt_base/reweight_doremi10k.json --wandb_proj doge --wandb_run DOREMI10k-82M --total_iterations 20000
