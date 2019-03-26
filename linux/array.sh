#!/usr/bin/env bash

array=()

echo "use: ctrl+D to terminate reading lines:"
while read line
do
    array+=("$line")
done

echo "array length : ${#array[@]}"

for line in "${array[@]}"
do
    echo "get line: " $line
done

