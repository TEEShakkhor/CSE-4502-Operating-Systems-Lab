#!/bin/bash

valid_emails=()
invalid_emails=()

email_pattern="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$"

for email in "$@"; do
  if [[ $email =~ $email_pattern ]]; then
    valid_emails+=("$email")
  else
    invalid_emails+=("$email")
  fi
done

echo "Valid email addresses:"
for valid_email in "${valid_emails[@]}"; do
  echo "$valid_email"
done

# Print invalid email addresses
echo "Invalid email addresses:"
for invalid_email in "${invalid_emails[@]}"; do
  echo "$invalid_email"
done
