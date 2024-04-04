#!/bin/bash
if [ $# -eq 0 ]; then
	 echo "Error: Please provide a password."
         exit 1
fi
		
password="$1"
		
if [ ${#password} -lt 8 ]; then
	 echo "Weak Password->Password length should have at least 8 characters."
	 exit 2
fi
				
if ! [[ "$password" =~ [[:alpha:]] ]]; then
	 echo "Weak Password->Password should have an alphabet."
	 exit 3
fi
						
if ! [[ "$password" =~ [[:digit:]] ]]; then
	 echo "Weak Password->Password should have a number."
	 exit 4
fi
								
if ! [[ "$password" =~ [[:lower:]] ]]; then
	 echo "Weak Password->Password should have a lower-case letter."
	 exit 5
fi

if ! [[ "$password" =~ [[:upper:]] ]]; then
	 echo "Weak Password->Password should have an upper-case letter."
	 exit 6
fi

echo "Strong Password."
