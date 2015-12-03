#!/bin/bash
my_dir=$(dirname "$0")
host=$(hostname)
testname=$1
testini=${my_dir}/testcases/$testname
result=${testname%%.*}
fio $testini --output ${my_dir}/${result}.${host}.txt >/dev/null
