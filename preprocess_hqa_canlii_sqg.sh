#!/usr/bin/env bash

mkdir -p data/hqa_canlii_sqg
awk '$2!=""' data/hqa_canlii.tsv > temp
cat temp | cut -f1 > source
cat temp | cut -f2 > target

head -n 3000 source > data/hqa_canlii_sqg/train.source
head -n 3000 target > data/hqa_canlii_sqg/train.target

tail -n 23 temp | awk '!seen[$1]++' > valtest

cat valtest | cut -f1 > data/hqa_canlii_sqg/val.source
cat valtest | cut -f2 > data/hqa_canlii_sqg/val.target
cat valtest | cut -f1 > data/hqa_canlii_sqg/test.source
cat valtest | cut -f2 > data/hqa_canlii_sqg/test.target

rm source target valtest
