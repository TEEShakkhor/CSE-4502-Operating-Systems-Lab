#!/bin/bash

read -p "Enter the directory: " directory

if [ ! -d "$directory" ]; then
  echo "Directory not found: $directory"
  exit 1
fi

min_permission=644
i=0

while IFS= read -r -d '' file; do
    permissions=$(stat -c %a "$file")
    if [ "$permissions" -lt "$min_permission" ]; then
        i=$((i + 1))
        echo "Insecure permission: $file ($permissions)"
    fi
done < <(find "$directory" -type f -print0)

if [ "$i" -eq 0 ]; then
  echo "No insecure permissions found"
fi
