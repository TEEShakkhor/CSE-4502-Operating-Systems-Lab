#!bin/bash

x=$*
declare -a listOfIntegers
declare -a listOfNonIntegers


for i in $x; do
    if [[ $i =~ ^[+-]?[0-9]*$ ]]; then
        listOfIntegers+=($i)
    else
        listOfNonIntegers+=($i)
    fi
done

echo "List of integers :["
for i in ${listOfIntegers[@]}; do
    echo $i
done

echo "List of non-integers :["
for i in ${listOfNonIntegers[@]}; do
    echo $i
done
