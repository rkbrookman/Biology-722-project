#!/bin/bash

input="/scratch/RowanBrookman/722_project/SRA_numbers.txt"

while read -r line

do
  prefetch "$line"
  fastq-dump --gzip "$line"  
done < "$input"
