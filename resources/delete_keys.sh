while read line; do
  if [ -e "$line" ]; then
    rm "$line"
  fi
done < keys.txt
