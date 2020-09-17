#!/usr/bin/env bash

git clone https://github.com/NVIDIA/apex ~/apex &
conda create -n transformers python=3 -y
conda activate transformers
conda install pytorch faiss -c pytorch -y
pip install -e .
pip install -r requirements.txt
wait

cp apex.patch ~/apex
cd ~/apex
git apply apex.patch
pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
conda deactivate
cd ../transformers
