#!/usr/bin/env bash
# Add parent directory to python path to access lightning_base.py
export PYTHONPATH="../":"${PYTHONPATH}"

# the proper usage is documented in the README, you need to specify data_dir, output_dir and model_name_or_path
# run ./finetune.sh --help to see all the possible options
python finetune.py \
    --learning_rate=3e-5 \
    --fp16 \
    --fp16_opt_level=O1 \
    --gpus 8 \
    --do_train \
    --n_val 100 \
    --val_check_interval 0.5 \
    --eval_max_gen_length 30 \
    --eval_beams 4 \
    --num_train_epochs 6 \
    --model_name_or_path facebook/bart-large \
    "$@"
