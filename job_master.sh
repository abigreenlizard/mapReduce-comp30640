#!/bin/bash
start=$(date +%s)
if [ $# -eq 0 ]
  then
    echo "No target directory passed"
    exit
fi

for line in $(ls "$1"); do
  echo map.sh started on "$line"
  ./map.sh "$1/$line" &
done

limit=$(ls -1 $1 | wc -l) 
test=0

while [ "$test" -lt "$limit" ]; do
  read input < map_pipe
    if [ "$input" == "map finished" ]; then
      let "test++"
      echo $test of $limit processes finished
    else
      grep "$input" keys.txt || echo "$input" >> keys.txt 
      #cat > keys.txt <<< "$input" \
    fi
done

while read line; do
  ./reduce.sh "$line" &
done < keys.txt

limit=$(wc -l < keys.txt)
test=0

while [ "$test" -lt "$limit" ]; do
  read input < reduce_pipe
  echo "$input"
  let "test++"
done
#  echo start reduce number $i
#done
#
#for ((i=0;i<reduceNum;i++)); do
#  read rinput < reduce_pipe
#  echo $rinput
#done
#
end=$(date +%s)
echo "execution time = $((end-start))"
