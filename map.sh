#!/bin/bash
file="$1"
#lineNum=$(wc -l < "$file")

while read line; do
  key=$(echo "$line" | cut -d',' -f7)
#  key=$(echo "$key" | xargs)
  if [ "$key" == "Product3 " ]; then
    key="Product3"
  fi
  if [ ! -e "map_out/$key" ] ; then
      touch "map_out/$key"
  fi
  ./P.sh "sendKey"
  echo "$key 1" >> "map_out/$key" 
  echo "$key" > map_pipe 
  ./V.sh "sendKey" 
done < "$file"

./P.sh "sendFinished"
echo "map finished" > map_pipe 
./V.sh "sendFinished" 

#while read line; do
#  key=$(echo "$line" | cut -d',' -f2)
#  if [ "$key" = "Product1" ]; then
#    ./P.sh "$key"
#    echo "Product1 1" >> Product1 
#    echo "Product1 1" > map_pipe 
#  elif [ "$key" = "Product2" ]; then
#    echo "Product2 1" >> Product2
#    echo "Product2 1" > map_pipe 
#  elif [ "$key" = "Product3" ]; then
#    echo "Product3 1" >> Product3
#    echo "Product3 1" > map_pipe 
#  fi
#done < "$file"
#./V.sh


#for ((i=0;i<lineNum;i++)); do
#  read line

  
  #  sed "${i}q;d" "$file" | cut -d',' -f2 \

#while read line; do
#  cut -d',' -f2 "$line" >> testfile.txt
#  1 >> testfile.txt
#done < "$file"

#cut -d',' -f2 "$file" >> map.txt
#sed 's/$/ 1/' map.txt
