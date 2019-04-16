#!/bin/bash

for R1 in *1P*
do
	R2=${R1//1P.fastq.gz/1P_rename.fastq.gz}
	zcat $R1 | awk '{print (NR%4 == 1) ? "@" ++i "/1": $0}' | gzip -c9 > $R2

done


# Loop script to automatically rename fastq files correctly wiht /1 and /2 flags for Trinity runs (Paired forward = 1P)
# It is applied if following error message pops up: "Error, pairs.K25.stats is empty. Be sure to check your fastq reads and ensure that the read names are identical except for the /1 or /2 designation. at /gpfs/hps/soft/rhel7/trinityrnaseq/2.4.0/util/insilico_read_normalization.pl line 904."
# V.01 - 11.02.2019 - BMvR
