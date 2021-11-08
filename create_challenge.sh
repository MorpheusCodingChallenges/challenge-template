#!/bin/bash

cd challenges

if [[ $# -ne 3 ]]
then
    echo "Usage: $0 <category> <index> <challenge-name>"
    exit 1
fi

category=$(basename $1)
if [[ ! -d $category ]]
then
    echo "$category is not a directory"
    exit 2
fi

dir="$category/$2_$3"

if [[ -e $dir ]]
then
    echo "$dir already exists"
    exit 3
fi

mkdir $dir
cat << EOF > $dir/challenge.yml
id: $3
name: $3
description-file: description.md
time_limit: 1000
memory_limit: 256000000
max_submissions: 50
max_filesize: 5000
release_ts: $(date -d "7 days" +"%F 00:00:00")
sunset_ts: $(date -d "21 days" +"%F 00:00:00")
price: 0
hidden: false
bonus:
  - score: 0
    coins: 0
    categories: []
    challenges: []

tasks:
  - id: task
    name: Task
    description-file: task.md
    random_tests: 20
    static_tests: tests/task
    score:
      score: 100
      penalty: 1
      min_score: 0
    generator:
      language: python
      version: 3.9.4
      files: [ generator.py ]

examples:
  - input: ""
    output: ""
    explanation: ""
EOF
touch $dir/description.md $dir/task.md $dir/solution.py
mkdir -p $dir/tests/task
touch $dir/tests/task/1.{in,out}
cat << EOF > $dir/generator.py
import json


print(json.dumps({"in": "", "out": ""}))
EOF
