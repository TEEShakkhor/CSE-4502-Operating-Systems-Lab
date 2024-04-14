#!/bin/bash

num_days="$1"

find /mnt/c/Users/Shakkhor/Desktop/CSE4502_200042147 -type f -mtime -$num_days -print
