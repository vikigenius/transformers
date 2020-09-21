#!/usr/bin/env bash

git clone https://github.com/NVIDIA/apex ~/apex &
pip install -e .
pip install -r examples/requirements.txt
wait

cp apex.patch ~/apex
cd ~/apex
git apply apex.patch
pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
cd ../transformers
