#!/bin/bash

directory="$1"

extensions=$(find "$directory" -type f | sed -n 's/.*\.//p' | sort | uniq -c)

while read -r line; do
  count=$(echo "$line" | awk '{print $1}')
  extension=$(echo "$line" | awk '{print $2}')
  echo "$extension: $count"
done <<< "$extensions"

total=$(echo "$extensions" | wc -l)
echo "Total File Types: $total"
