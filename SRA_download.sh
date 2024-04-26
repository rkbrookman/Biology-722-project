#!/bin/bash

#This script reads through the SRA_numbers.txt file (which is just a text file where I wrote all of the SRA accession numbers required for the project) and then downloads them with prefetch
# Fastq-dump conversts them to fastq format, and the --gzip tag zips them
# In order for this script to work, miniconda and SRA toolkit are required

input="/scratch/RowanBrookman/722_project/SRA_numbers.txt"

while read -r line

do
  prefetch "$line"
  fastq-dump --gzip "$line"  
done < "$input"
