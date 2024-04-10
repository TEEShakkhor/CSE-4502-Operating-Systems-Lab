#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <source_directory> <destination_directory> <size_threshold_in_bytes>"
  exit 1
fi

search_dir="$1"
dest_dir="$2"
size_limit="$3"

if [ ! -d "$d_dir" ]; then
  mkdir -p "$d_dir"
fi

find "$search_dir" -type f -size +"$size_limit"c -exec mv -t "$dest_dir" {} +

echo "Large files than $size_limit bytes was moved to $dest_dir."

