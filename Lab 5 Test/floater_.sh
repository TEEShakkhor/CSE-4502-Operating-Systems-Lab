#!/bin/bash

x=$*
if [[ $1 =~ "-h" ]]; then
    echo "-/floater.sh prints the string representation of the floating -point quotient of two number that are not divisible by one another, up to n-significant digits"
    echo "--/floater.sh <number_1> <number_2> <number_3>"
    echo "--parameter 1: divident"
    echo "--parameter 2: Divisor"
    exit 1
fi

if [[ -z $1 ]]; then
    echo "-/floater.sh <number_1> <number_2> <number_3>"
    echo "For more info type floater.sh -h as parameter"
    exit 1
fi


if [[ $2 =~ 0 ]]; then
    echo "Division by zero error!!"
    echo "For more info type floater.sh -h as parameter"
    exit 1
fi

result=$(echo "scale=$3; $1/$2" | bc -l)

echo "The ceiling value of $1/$2 is: $result"