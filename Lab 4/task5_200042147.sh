#!/bin/bash
read -p "Enter the directory: " directory

if [ ! -d "$directory" ]; then
  echo "Directory not found: $directory"
  exit 1
fi

total_size=$(du -sh "$directory" | awk '{print $1}')

echo "Total size of '$directory': $total_size"
