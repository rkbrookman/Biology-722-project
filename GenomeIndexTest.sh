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
