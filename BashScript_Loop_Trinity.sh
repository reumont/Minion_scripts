#!/bin/bash

TRINITYFOLDER=~/Programme/trinityrnaseq-Trinity-v2.8.4/ 
ASSEMBLY_BASE=03_Assemblies

if [ ! -e ${ASSEMBLY_BASE} ]
then
	mkdir ${ASSEMBLY_BASE}
fi

for R1 in 01_Data_Processed/*1P*
do
	R2=${R1//1P.fastq.gz/2P.fastq.gz}
	OUTDIR=${ASSEMBLY_BASE}/${R1//1P.fastq.gz/Trinity}
		
	echo ${TRINITY_FOLDER}/Trinity --seqType fq --max_memory 120G --min_contig_length 200 --CPU 56 --left 01_Data_Processed/$R1 --right 01_Data_Processed/$R2 --output ${OUTDIR} 
	


done


# Loop script to automatically run Trinity in a loop for fastq1_fw and fastq2_rv files.
# The folder of the local Trinity installation is used to start Trinity (TRINITYFOLDER)
# Processed and trimmed fastq files (*.fastq.gz) are located in the folder 01_Data_Processed/
# Trinity settings are for phylogenomic analyses (transcripts len >200 bp) 
# V.01 - 11.02.2019 - BMvR
