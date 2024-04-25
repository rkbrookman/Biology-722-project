#!/bin/bash

#This script runs fastqc on all files in the directory ending in .fastq.gz

for i in *.fastq.gz

do

/usr/local-centos6/fastqc/fastqc "$i"

done

#The following variation was used to run fastqc after trimming the reads:

for i in *trimmed.fastq.gz

do

/usrt/local-centos6/fastqc/fastqc "$i"

done
