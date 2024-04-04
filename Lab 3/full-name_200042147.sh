#!/bin/bash
read -p "Enter your first name: " first_name
read -p "Enter your middle name: " middle_name
read -p "Enter your last name: " last_name

read -p "Hi $last_name, Do you want to display your full name? (y/n): " choice

choice_lower=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

if [ "$choice_lower" == "y" ]; then
	    full_name="$first_name $middle_name $last_name"
	    echo "Your full name is: $full_name"
elif [ "$choice_lower" == "n" ]; then
	    echo "Thank you $last_name for your time!"
else
	    echo "Please enter 'y' or 'n'."
fi
