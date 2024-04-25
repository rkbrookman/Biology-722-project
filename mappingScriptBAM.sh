#!/bin/bash

# This script uses STAR to map all the reads against the Arabidopsis thaliana genome using the genome index generated previously. 
# It outputs sorted BAM files which can be used downstream for RSeQC and htseq-count.

for i in *_trimmed.fastq.gz

do

/usr/local-centos6/star/version-2.7.7a/bin/Linux_x86_64/STAR --runThreadN 10 \
--genomeDir /scratch/RowanBrookman/722_test/GenomeIndex \
--readFilesIn /scratch/RowanBrookman/722_project/fastq_files/merged_fastq_files/"$i" \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /scratch/RowanBrookman/722_project/STAR_outputs_BAM_fixed/
done
