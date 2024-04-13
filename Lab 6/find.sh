#!/bin/bash



lower_limit=$1
upper_limit=$2


is_perfect_square() {
  number=$1
  sqrt=$(echo "scale=0; sqrt($number)" | bc)
  sqrt=${sqrt%.*} 
  squared=$(($sqrt * $sqrt))
  if [ $squared -eq $number ]; then
    return 0  
  else
    return 1  
  fi
}

prev=0
current=1

while [ $current -le $upper_limit ]; do
  if [ $current -ge $lower_limit ]; then
    echo "Fibonacci: $current"
    if is_perfect_square $current; then
      echo "Perfect Square: $current"
    fi
  fi
  next=$(($prev + $current))
  prev=$current
  current=$next
done



