#!/bin/bash
while read line; do
  echo "$line"
  ./reduce.sh "$line" &
done < keys.txt

echo Finished loop

limit=$(wc -l < keys.txt)
test=0

while [ "$test" -lt "$limit" ]; do
  read input < reduce_pipe
  echo "$input"
  let "test++"
done
