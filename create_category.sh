#!/bin/bash

cd challenges

if [[ $# -ne 2 ]]
then
    echo "Usage: $0 <index> <category-name>"
    exit 1
fi

dir="$1_$2"

if [[ -e $dir ]]
then
    echo "$dir already exists"
    exit 2
fi

mkdir $dir
cat << EOF > $dir/category.yml
id: $2
name: $2
description-file: description.md
EOF
touch $dir/description.md
