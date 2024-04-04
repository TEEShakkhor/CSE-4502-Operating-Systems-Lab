#!/bin/bash
read -p "Enter input: " input

output=""

for (( i=0; i<${#input}; i++ )); do
	    char="${input:i:1}"

	    case $char in
		 [b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z])
			 output="${output}${char}"
			 ;;
	    esac
 done							   
 echo "$output"
