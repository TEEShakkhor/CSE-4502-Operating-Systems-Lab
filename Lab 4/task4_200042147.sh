#!/bin/bash

read -p "Enter the root directory: " root_dir
if [[ -z "$root_dir" ]]; then
    echo "Root directory name cannot be empty."
    exit 1
fi
mkdir -p "$root_dir"

read -p "Enter the number of subdirectories in each directory: " num_subdirs
read -p "Enter the number of files in each directory: " num_files
while true; do
      read -p "Enter the name for the directory in '$root_dir': " dir_name
      if [[ -z "$dir_name" ]]; then
        break
      fi

      mkdir -p "$root_dir/$dir_name"

      for ((i = 1; i <= num_files; i++)); do
          touch "$root_dir/$dir_name/file_$i.txt"
      done
      for ((i = 1; i <= num_subdirs; i++)); do
          read -p "Enter the name for a subdirectory in '$dir_name': " sub_dir_name
          if [[ -n "$sub_dir_name" ]]; then
             mkdir -p "$root_dir/$dir_name/$sub_dir_name"
             for ((j = 1; j <= num_files; j++)); do
                 touch "$root_dir/$dir_name/$sub_dir_name/file_$j.txt"
             done
          fi
      done
done

echo "Directory structure created in '$root_dir'."
