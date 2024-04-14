#!/bin/bash

read -p "Enter the path of the directory :" dir

for file in $(find $dir -type f)
do
    
    modify_time=$(stat -c %y $file | cut -d ' ' -f1)
    
    if [ ! -d $dir/$modify_time ]
    then
        mkdir $dir/$modify_time
    fi
   
    mv $file $dir/$modify_time
done