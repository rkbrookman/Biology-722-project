#!/bin/bash

#This script uses STAR to generate a genome index for aligning reads against the Arabidopsis thaliana genome.

/usr/local-centos6/star/version_2.7.7a/bin/Linux_x86_64/STAR --runMode genomeGenerate \
--genomeDir /scratch/RowanBrookman/722_test/GenomeIndex \
--limitGenomeGenerateRAM 100000000000 \
--runThreadN 10 \
--genomeFastaFiles /scratch/RowanBrookman/722_test/Reference_Genome_TAIR10/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa \
--sjdbGTFfile /scratch/RowanBrookman/722_test/ArabidopsisGenomeAnnotations/Arabidopsis_thaliana.TAIR10.58.gff3 \
--sjdbGTFtagExonParentTranscript Parent \
--sjdbOverhang 100 \
--genomeSAindexNbases 12

# Both the refrence genome fasta files and gff3 annotation file were downloaded from Ensembl to ensure they matched
# The '--sjdbGTFtagExonParentTranscript Parent' was included according to the STAR manual because I used a gff3 file for annotations rather than a gtf file (which is the default, and has different formatting than a gff3 file)
# The --sjdbOverhang value of 100 is the default, which according to the STAR manual will work well in most instances. However, it also says the ideal value would be ReadLength-1, and if there are varying read lengths, max(ReadLength) -1. Since some of the fastqc outputs post-trim showed some samples had reads of length 100-101, I did 101-1 = 100. So in both cases, 100 works.
# The first time I tried to generate the genome index I got an error telling me I needed to use a value of 12 for --genomeSAindexNbases, so I added it to the script. But a look through the STAR manual indicated this parameter needs to be included for small genomes - which I forgot to consider initially, but makes sense considering Arabidopsis does have a small genome of only 5 chromosomes. 
