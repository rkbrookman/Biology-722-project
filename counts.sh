#!/bin/bash

# This script counts aligned reads 

for i in *.bam

do

/usr/local/bin/htseq-count --format bam --order pos --stranded reverse --type=gene "$i" /home/grdstd8/Arabidopsis_thaliana.TAIR10.58.gff3 > $(basename "$i" .sortedByCoord.out.bam).counts.gene_type.txt

done

# The '--format bam' tells htseq we're using a BAM file as input
# The '--order pos' tells htseq our BAM file is sorted by coordinate
# '--stranded reverse' indicates the strandedness of our experiment. Since Mine et al. (2018) prepared their library using the dutp method, the library is reversed. I confirmed this with the 'infer_experiment.py' script from RSeQC.
# The '--type=gene' tag is needed since I used a gff3 file instead of a gtf file. The defualt for this parameter is 'exon', which works for gtf files but didn't work for me. After playing around with different tags, I found that type=gene gave me the output I wanted (counts mapped to genes)
