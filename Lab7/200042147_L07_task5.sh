#!/bin/bash

read -p "Enter the path of text file :" file

sed -i '/^$/d' $file

