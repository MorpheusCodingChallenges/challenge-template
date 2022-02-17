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

testcase=$(python $2.py)
echo "======= INPUT =======" >&2
jq -r .in >&2 <<< $testcase
echo >&2
echo "======= OUTPUT =======" >&2
jq -r .out >&2 <<< $testcase
echo >&2
jq -r '"  - input: " + (.in | tojson) + "\n    output: " + (.out | tojson) + "\n    explanation: " + ("" | tojson)' <<< $testcase
