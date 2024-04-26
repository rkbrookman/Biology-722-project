#This script reads through the SRA_numbers.txt file (which is just a text file where I wrote all of the SRA accession numbers required for the project) and then downloads them with prefetch
# Fastq-dump conversts them to fastq format, and the --gzip tag zips them
# In order for this script to work, conda and SRA toolkit are required. So, first we need to install miniconda, then we can activate the NCBI environment and install the SRA toolkit:

conda create -n ncbi -env

conda activate ncbi -env

conda install -c bioconda sra-tools

#Now we can run the script to download our files:

#!/bin/bash

input="/scratch/RowanBrookman/722_project/SRA_numbers.txt"

while read -r line

do
  prefetch "$line"
  fastq-dump --gzip "$line"  
done < "$input"

# Note: the conda environment can be deactivated with 'conda deactivate'
