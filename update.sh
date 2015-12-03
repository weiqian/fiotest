#!/bin/bash

# admin node config file
my_dir=$(dirname "$0")
vm_hosts=$my_dir/vm_hosts
cat /etc/hosts | awk '{ print $2 }'  | sed -e '/^$/d' | sed -e '/localhost/d' >$vm_hosts
find testcases/ -name "*ini" | awk -F / '{ print $2 }' >test.conf
