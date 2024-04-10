DATE=$(date +%y%m%d%H%M%S)
for file in $(find /mnt/c/Users/Shakkhor/Desktop/CSE4502_200042147/Lab04/ -type f);
do
filename=$(basename $file)
dir=$(dirname $file)
new_filename="$DATE""$filename"
mv $file "$dir""/""$new_filename"
done
