#!/bin/bash
#pip install -r requirements.txt
export WANDB_API_KEY="5acb06cc9fc290e1e466a3f8c9e8346ab75c0c59"

python src/run.py --config_json config/doge.json --wandb_proj doge --wandb_run DOGE-proxy-82M --total_iterations 10000
