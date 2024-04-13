#!bin/bash
x=$*

if [[ -z $1 ]]; then
    echo "-/among_primes.sh <number_1> <number_2>"
    exit 1
fi

num1=$1
num2=$2
for (( i=$num1; i<=$num2; i++ )) ; do
    flag=0
    for (( j=2; j<$i; j++ )) ; do
        if [ $(($i%$j)) -eq 0 ] ; then
            flag=1
            break
        fi
    done
    if [ $flag -eq 0 ] ; then
        echo $i
    fi
done