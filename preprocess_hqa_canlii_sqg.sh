#!/usr/bin/env bash

mkdir -p data/hqa_canlii_sqg
cat data/hqa_canlii.tsv | cut -f3 > source
cat data/hqa_canlii.tsv | cut -f2 > target

head -n 2900 source > data/hqa_canlii_sqg/train.source
head -n 2900 target > data/hqa_canlii_sqg/train.target

tail -n 94 data/hqa_canlii.tsv > valtest

cat valtest | cut -f3 > data/hqa_canlii_sqg/val.source
cat valtest | cut -f2 > data/hqa_canlii_sqg/val.target
cat valtest | cut -f3 > data/hqa_canlii_sqg/test.source
cat valtest | cut -f2 > data/hqa_canlii_sqg/test.target

rm source target valtest
