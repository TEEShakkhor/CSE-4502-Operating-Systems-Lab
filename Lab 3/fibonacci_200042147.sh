#!/bin/bash
if [ $# -eq 0 ]; then
	    echo "Error: Please provide a value."
	    exit 1
fi

n=$1

a=0
b=1

echo "Fibonacci Series up to $n terms:"
for (( i=0; i<n; i++ )); do
	    echo -n "$a "
	    echo
	    next=$((a + b))
	    a=$b
	    b=$next
done

