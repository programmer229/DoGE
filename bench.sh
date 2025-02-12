#!/bin/bash

# Output folder for saving the results
export OUT_FOLDER="eval_out"

# Custom model name for saving outputs
export model_name="DOGE-proxy-82M-checkpoint-5000"

# Path to your local Hugging Face model
export model_args="pretrained=./check_kek/DOGE-proxy-82M/checkpoint-5000"

# Task list from the EleutherAI LM Evaluation Harness
tasks=(
    "mmlu"            # Massive Multitask Language Understanding
    "ceval-valid"
    "race"
    "winogrande"
    "gsm8k"
    "commonsense_qa"
    "arc_easy"
    "arc_challenge"
    "humaneval"
    #"mbpp"
)

# Iterate through the tasks for zero-shot evaluation
for task in "${tasks[@]}"; do
    # Print the task name for tracking
    echo "Evaluating task: $task"

    # Run the evaluation
    lm_eval --model hf \
        --model_args $model_args \
        --tasks $task \
        --batch_size auto:4 \
        --num_fewshot 0 \
        --output_path $OUT_FOLDER/$model_name/$task
done
