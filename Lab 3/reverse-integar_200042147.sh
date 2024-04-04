#!/bin/bash
if [ $# -eq 0 ]; then
   echo "Error!No input given"
   exit 1
fi
for num in "$@"; do
    reversed=""
    length=${#num}
    for (( i=$length-1; i>=0; i-- )); do
	    reversed="$reversed${num:i:1}"
    done
    echo "$reversed"
done







 




