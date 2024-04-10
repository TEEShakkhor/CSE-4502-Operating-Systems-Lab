
#!/bin/bash

# Check if the required arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 file_list.txt target_directory"
    exit 1
fi

file_list="$1"
target_directory="$2"
missing_files_dir="missing_files"

if [ ! -d "$target_directory" ]; then
    echo "Target directory '$target_directory' does not exist."
    exit 1
fi
mkdir $missing_files_dir

while read -r filename; do

  if [ -e $target_directory/$filename ]; then
     echo "File '$filename' exists in the target directory."
  else   
     touch $missing_files_dir/$filename
  fi
done<$file_list

echo "Script completed."

