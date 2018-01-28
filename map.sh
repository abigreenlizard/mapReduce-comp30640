#!/bin/bash
file="$1"

while read line; do
  key=$(echo "$line" | cut -d',' -f2)
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
