#!/bin/bash

input_string=$1

clean_string=$(echo "$input_string" | tr -d ' ' | tr '[:upper:]' '[:lower:]')

reverse_string=$(echo "$clean_string" | rev)

if [ "$clean_string" == "$reverse_string" ]; then
  echo "I am groot"
else
  echo "I am groot!Try again!"
fi

