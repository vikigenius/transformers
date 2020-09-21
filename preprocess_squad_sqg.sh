#!/usr/bin/env bash
mkdir -p data/squad_sqg
aws s3 cp s3://lex-labs-python-wd/ML/SQG/SQuAD1.1/datasets/squad11_sqg.train.tsv data/

cat data/squad11_sqg.train.tsv | cut -f1 > source
cat data/squad11_sqg.train.tsv | cut -f2 > target

head -n 85000 source > data/squad_sqg/train.source
head -n 85000 target > data/squad_sqg/train.target

tail -n 2599 data/squad11_sqg.train.tsv | awk '!seen[$1]++' > valtest

split -n2 valtest

cat xaa | cut -f1 > data/squad_sqg/val.source
cat xaa | cut -f2 > data/squad_sqg/val.target
cat xab | cut -f1 > data/squad_sqg/test.source
cat xab | cut -f2 > data/squad_sqg/test.target

rm xaa xab source target
