#!/bin/bash

read -p "Enter a string: " input_string

if [ ${#input_string} -lt 1 ]; then
    echo "Error: Please provide at least one character as input."
    exit 1
fi

output_string=""

for ((i = 0; i < ${#input_string}; i++));do
    char="${input_string:i:1}"
    if [[ $char =~ [[:alpha:]] && $char =~ [aeiouAEIOU] ]]; then
        x=""
        output_string="${output_string}${x}"
    else
        output_string="${output_string}${char}"
    fi 
done

echo "Output string(Consonents only): $output_string"
