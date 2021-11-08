#!/bin/bash

if [[ $# -ne 2 ]]
then
    echo "Usage: $0 <challenge> <task>"
    exit 1
fi

if [[ ! -d $1 ]]
then
    echo "$1 is not a directory"
    exit 2
fi

cd $1

mkdir -p tests/$2

idx=0
for file in $(ls tests/$2)
do
    num=$(echo $file | cut -d. -f1)
    idx=$((idx > num ? idx : num))
done
idx=$((idx + 1))

testcase=$(python $2.py)
echo "======= INPUT ======="
echo $testcase | jq -r .in | tee tests/$2/$idx.in
echo
echo "======= OUTPUT ======="
echo $testcase | jq -r .out | tee tests/$2/$idx.out
