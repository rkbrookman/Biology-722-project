#!/bin/bash

# This script counts aligned reads 

for i in *.bam

do

/usr/local/bin/htseq-count --format bam --order pos --stranded reverse --type=gene "$i" /home/grdstd8/Arabidopsis_thaliana.TAIR10.58.gff3 > $(basename "$i" .sortedByCoord.out.bam).counts.gene_type.txt

done
