#!/bin/bash

source_dir="./source_fold"


target_dir="./target_fold"

mkdir -p "$target_dir"

organize_files() {
      extension="$1"
      find "$source_dir" -type f -iname "*.$extension" -exec mv {} "$target_dir/$extension/" \;
}

extension_list_file="./extensions.txt"

if [ -f "$extension_list_file" ]; then
    while IFS= read -r extension; do
        mkdir -p "$target_dir/$extension"
        organize_files "$extension"
    done < "$extension_list_file"

    echo "Files organized into subdirectories based on extensions."
else
  echo "Error: The extension list file '$extension_list_file' does not exist."
fi

