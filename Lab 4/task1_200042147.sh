#!/bin/bash
dir1=$1
dir2=$2

diff $dir1 $dir2

#!/bin/bash

# Check if the script is provided with an argument for the number of days
if [ $# -ne 1 ]; then
  echo "Usage: $0 <number_of_days>"
  exit 1
fi

# Get the number of days from the command-line argument
num_days="$1"

# Use 'find' to locate files modified in the last N days
# Replace '/path/to/search' with the directory where you want to start the search
# Replace '-type f' with other options if you want to search for specific types of files
find /path/to/search -type f -mtime -$num_days -print

#!/bin/bash

# Check if the script is provided with arguments
if [ $# -ne 3 ]; then
  echo "Usage: $0 <directory> <search_text> <replace_text>"
  exit 1
fi

directory="$1"
search_text="$2"
replace_text="$3"

# Use 'find' to locate files in the specified directory and its subdirectories
# Use 'sed' to perform text replacement in each file
find "$directory" -type f -exec sed -i "s/$search_text/$replace_text/g" {} +

echo "Text replaced in files under '$directory'."

/mnt/c/Users/Shakkhor/Desktop/CSE4502_200042147/


#!/bin/bash

# Specify the source directory where you want to sort files
source_directory="/path/to/source_directory"

# Specify the destination directories based on modification date
today_directory="/path/to/destination_directory/today"
last_7_days_directory="/path/to/destination_directory/last_7_days"
last_30_days_directory="/path/to/destination_directory/last_30_days"

# Create the destination directories if they don't exist
mkdir -p "$today_directory"
mkdir -p "$last_7_days_directory"
mkdir -p "$last_30_days_directory"

# Use 'find' to locate files in the source directory
# Based on their modification date, move them to the appropriate destination directory
find "$source_directory" -type f -mtime -1 -exec mv {} "$today_directory" \;
find "$source_directory" -type f -mtime +1 -mtime -7 -exec mv {} "$last_7_days_directory" \;
find "$source_directory" -type f -mtime +7 -mtime -31 -exec mv {} "$last_30_days_directory" \;

echo "Files sorted into destination directories based on modification date."
