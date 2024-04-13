#!/bin/bash

x=$*
if [[ $1 =~ "-h" ]]; then
    echo "-./ sorterdude.sh sorts a list of N unsorted numbers in the order provided and optionally removes duplicate numbers from that list"
    echo "- Syntax: ./sorterdude.sh <number_1> <number_2> ..."
    echo "<number_n> <order> <unique>"
    echo "-- parameter 1 <number_1>: First number in  the list."
    echo "-- parameter 2 <number_2>: Second number in  the list."
    echo "-- ."
    echo "-- parameter N <number_N>: Nth number in  the list."
    echo "-- <order>: -a for ascending or -d for descending order of sorting."
    echo "-- <unique>(optional): -u to ensure each number appers exactly once in the sorted list"
    exit 1
fi

if [[ -z $1 ]]; then
    echo "Syntax Error!!"
    echo "Syntax: ./sorterdude.sh <number_1> <number_2>"
    echo "<number_N> <order>"
    echo "unique"
    echo "For more info type ./sorterdude.sh -h"
    exit 1
fi

if [[ $x =~ "-a" ]]; then
  sorted_numbers=($(printf "%s\n" "$@" | sort -n))
fi

if [[ $x =~ "-d" ]]; then
  sorted_numbers=($(printf "%s\n" "$@" | sort -nr))
fi

if [[ $x =~ "-u" ]]; then
  sorted_numbers=($(printf "%s\n" "${sorted_numbers[@]}" | uniq))
fi


echo "Sorted numbers:"
for i in "${sorted_numbers[@]}"; do
  if [[ $i =~ [0-9] ]]; then
      echo $i
  fi
done
