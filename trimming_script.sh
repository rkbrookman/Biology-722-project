#!/bin/bash

# This script uses trimmomatic to trim low quality bases and adapter sequences from raw reads 

for i in *.fastq.gz

do

java -jar /usr/local-centos6/trimmomatic/trimmomatic-0.36.jar SE -phred33 "$i" $(basename -s .fastq.gz "$i")_trimmed.fastq.gz ILLUMINACLIP:/usr/local-centos6/trimmomatic/adapters/TruSeq3-SE.fa:2:30:10 TRAILING:28 MINLEN:30

done

# These are single-end reads, so we need to use single end mode (the SE parameter) and the single-end adapters ('TruSeq3-SE.fa')
# Trimmomatic threw an error about not being able to detect the quality encoding the first time I ran the first version of the script, so I had to tell it what the quality encoding was with the '-phred33' parameter
# MINLEN:30 will throw away anything under 30 base pairs long. This is the parameter Garrett used to trim the PTI data, so I used it as well for consistency
# After looking at the fastqc reports, many samples saw a drop in the quality score toward the ends of reads, so I added the 'TRAILING:28' parameter to remove trailing bases of low quality.
