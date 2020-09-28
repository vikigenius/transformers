#!/usr/bin/env bash
mkdir -p data/pubmedqa_sqg
aws s3 cp s3://lex-labs-python-wd/ML/SQG/PubmedQA_Processed/pubmedqa_pq_pairs.tsv data/

cat data/pubmedqa_pq_pairs.tsv | cut -f1 > source
cat data/pubmedqa_pq_pairs.tsv | cut -f2 > target

head -n 138000 source > data/pubmedqa_sqg/train.source
head -n 138000 target > data/pubmedqa_sqg/train.target

tail -n 2199 data/pubmedqa_pq_pairs.tsv > valtest

split -n2 valtest

cat xaa | cut -f1 > data/pubmedqa_sqg/val.source
cat xaa | cut -f2 > data/pubmedqa_sqg/val.target
cat xab | cut -f1 > data/pubmedqa_sqg/test.source
cat xab | cut -f2 > data/pubmedqa_sqg/test.target

rm xaa xab source target valtest
