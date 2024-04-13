#!/bin/bash

x=$*

if [[ $1 =~ "-h" ]]; then
    echo "-/reverse_integer.sh prints number in reverse order,each in new line."
    echo "--/reverse_integer.sh <number_1> <number_2>...<number_n>"
    echo "--parameter 1: First number to be printed in reverse"
    echo "--parameter 2: second number to be printed in reverse"
    exit 1
fi
if [[ $1 =~ "" ]]; then
    echo "Please provide the correct input format-"
    echo "integer_200042158,sh number" 
    exit 1
fi

for input_string in $x; do
    if [[ $input_string =~ [^0-9] ]]; then
        echo "Syntax Error!!"
        echo "--/reverse_integer.sh <number_1> <number_2>...<number_n>"
        echo "For more info type reverse_integer.sh -h as parameter"
        exit 1
    fi

    reversed_string=""
    length=${#input_string}

    if [ $length -lt 1 ]; then
        echo "Error: Please provide at least one integer as input."
        exit 1
    fi

    for ((j = length - 1; j >= 0; j--)); do
        reversed_string="${reversed_string}${input_string:j:1}"
    done

    echo "Reversed of ${input_string} is : $reversed_string"
done