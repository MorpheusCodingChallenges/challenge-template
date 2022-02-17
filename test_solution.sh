#!/bin/bash

if [[ $# -ne 3 ]]
then
    echo "Usage: $0 <challenge> <task> <random-tests>"
    exit 1
fi

if [[ ! -d $1 ]]
then
    echo "$1 is not a directory"
    exit 2
fi

cd $1

time_limit=$(bc -l <<< "$(cat challenge.yml | grep time_limit: | cut -d' ' -f2) / 1000")
memory_limit=$(cat challenge.yml | grep memory_limit: | cut -d' ' -f2)

cnt=1
failed=0
total=0
for file in $(ls tests/$2 | cut -d. -f1 | sort | uniq)
do
    echo "======= STATIC TEST $cnt ======="
    if time timeout -s 9 $time_limit prlimit --as=$memory_limit python solution.py < tests/$2/$file.in | diff -Z --color=always - tests/$2/$file.out
    then
        echo -e "Test $cnt: \033[32mCORRECT\033[0m"
    else
        echo -e "Test $cnt: \033[31mFAILED\033[0m"
        failed=$((failed+1))
    fi

    cnt=$((cnt+1))
    total=$((total+1))
    echo
done

for i in $(seq 1 $3)
do
    echo "======= RANDOM TEST $i ======="

    testcase=$(python $2.py)

    if time ( jq -r .in <<< $testcase | timeout -s 9 $time_limit prlimit --as=$memory_limit python solution.py | diff -Z --color=always - <(jq -r .out <<< $testcase) )
    then
        echo -e "Test $i: \033[32mCORRECT\033[0m"
    else
        mkdir -p failed_tests
        jq -r .in > failed_tests/$i.in <<< $testcase
        jq -r .out > failed_tests/$i.out <<< $testcase

        echo -e "Test $i: \033[31mFAILED\033[0m"
        failed=$((failed+1))
    fi

    total=$((total+1))
    echo
done

if [[ $failed -eq 0 ]]
then
    echo -e "\033[32mAll $total Tests passed\033[0m"
else
    echo -e "\033[31m$failed of $total Tests failed\033[0m"
    exit 1
fi
