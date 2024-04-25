#!/bin/bash

# This script uses trimmomatic to trim raw reads 

for i in *.fastq.gz

do

java -jar /usr/local-centos6/trimmomatic/trimmomatic-0.36.jar SE -phred33 "$i" $(basename -s .fastq.gz "$i")_trimmed.fastq.gz ILLUMINACLIP:/usr/local-centos6/trimmomatic/adapters/TruSeq3-SE.fa:2:30:10 TRAILING:28 MINLEN:30

done
