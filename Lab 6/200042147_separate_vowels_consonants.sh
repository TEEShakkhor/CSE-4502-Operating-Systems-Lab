#!/bin/bash

input_string=$1

if [ ${#input_string} -lt 1 ]; then
    echo "Error: Please provide at least one character as input."
    exit 1
fi

vowels=""
consonants=""

for ((i = 0; i < ${#input_string}; i++));do
    char="${input_string:i:1}"
    if [[ $char =~ [[:alpha:]] && $char =~ [aeiouAEIOU] ]]; then
            vowels="${vowels}${char}"
    else
            consonants="${consonants}${char}"
    fi
done

echo "Vowels: $vowels"
echo "Consonants: $consonants"
