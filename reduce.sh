#!/bin/bash
number=$(wc -l < map_out/"$1")
./P.sh sendReduce
echo "$1 $number" > reduce_pipe
./V.sh sendReduce
