#!/bin/bash

# This script uses STAR to map all the reads against the Arabidopsis thaliana genome using the genome index generated previously. 

for i in *_trimmed.fastq.gz

do

/usr/local-centos6/star/version-2.7.7a/bin/Linux_x86_64/STAR --runThreadN 10 \
--genomeDir /scratch/RowanBrookman/722_test/GenomeIndex \
--readFilesIn /scratch/RowanBrookman/722_project/fastq_files/merged_fastq_files/"$i" \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /scratch/RowanBrookman/722_project/STAR_outputs_BAM_fixed/
done

# The parameter --readFilesCommand zcat is needed since I used gzipped fastq files as input
# The parameter --outSAMtype BAM SortedByCoordinate outputs a sorted BAM file that can be used downstream with RSeQC and htseq-count (default output is a SAM file)
