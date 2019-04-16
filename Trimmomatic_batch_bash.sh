#!/bin/bash

for R1 in *_1*
do
	R2=${R1//_1.fastq.gz/_2.fastq.gz}
	R1paired=${R1//.fastq.gz/P.fastq.gz}
	R1unpaired=${R1//.fastq.gz/U.fastq.gz}	
	R2paired=${R2//.fastq.gz/P.fastq.gz}
	R2unpaired=${R2//.fastq.gz/U.fastq.gz}	
	java -jar /home/test/Programme/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 42 $R1 $R2 $R1paired $R1unpaired $R2paired $R2unpaired ILLUMINACLIP:IlluminaAdapters_022019.fas:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:30 MINLEN:70

done


# Loop script to automatically run Trimmomatic on several fastq.gz files, naming equals the --baseout flag (P=paired, U=unpaired)
# Naming of variables 2-6 is based on the command take old variable and name new ones based on the first variable 
# V.01 - 11.02.2019 - BMvR
