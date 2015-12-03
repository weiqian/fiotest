#!/bin/bash

# admin node config file
my_dir=$(dirname "$0")
vm_hosts=$my_dir/vm_hosts
ret_path=$my_dir/testresult
testcases=$my_dir/testcases
file1=$my_dir/diskio.sh
file2=$my_dir/global.ini
testconf=$my_dir/test.conf
job_path=/root/fio_job

# ssh option
ssh_option="-o ConnectTimeout=1"

function fire_jobs()
{
  local func="fire_jobs"
  local conf_file=$1
  for host in `cat $vm_hosts`
  do
  {
    cmd="bash $job_path/diskio.sh $conf_file"
    echo "ssh $ssh_option $host $cmd </dev/null"
    ssh $ssh_option $host $cmd </dev/null
  } &
  done
  wait
  echo "$func: finish"
}

function prepare_env()
{
  local func="prepare_env"
  
  if [ -z "$vm_hosts" ]
  then
    echo "$func: $vm_hosts not found! Please exec update.sh first!"
    exit 1
  fi

  for host in `cat $vm_hosts`
  do
  {
    cmd1="hostname $host; rm -rf ${job_path}.backup; test -d $job_path && mv $job_path ${job_path}.backup; mkdir -p $job_path"
    cmd2="test -z $(which fio) && yum -y install fio"
    ssh $ssh_option $host $cmd1
    ssh $ssh_option $host $cmd2
    scp -r $ssh_option $testcases $host:$job_path  >/dev/null
    scp $ssh_option $file1 $host:$job_path  >/dev/null
    scp $ssh_option $file2 $host:$job_path  >/dev/null
  } &
  done
  wait
  echo "$func: finish"
}

function collect_ret()
{
  local func="collect_ret"
  for host in `cat $vm_hosts`
  do
  {
    scp $ssh_option $host:$job_path/*.txt $ret_path  >/dev/null
  } &
  done
  wait
  echo "$func: finish"
}

prepare_env
for item in `cat $testconf`
do
{
  if [ "${item:0:1}" = "#" ]
  then
    continue
  fi
  fire_jobs $item 
  collect_ret $item
}
done

