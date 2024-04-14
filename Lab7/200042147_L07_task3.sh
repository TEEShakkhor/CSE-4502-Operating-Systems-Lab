#!/bin/bash

directory="$1"
search_text="$2"
replace_text="$3"

find "$directory" -type f -exec sed -i "s/$search_text/$replace_text/g" {} +

echo "Text replaced in files under '$directory'."

