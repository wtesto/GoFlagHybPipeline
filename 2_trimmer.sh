#!/bin/bash

for R1 in *R1*
do
   R2=${R1//R1_001.fastq.gz/R2_001.fastq.gz}
   R1paired=${R1//.fastq.gz/_paired.fastq.gz}
   R1unpaired=${R1//.fastq.gz/_unpaired.fastq.gz}	
   R2paired=${R2//.fastq.gz/_paired.fastq.gz}
   R2unpaired=${R2//.fastq.gz/_unpaired.fastq.gz}	
   java -jar Trimmomatic-0.36/trimmomatic-0.36.jar PE -threads 10 -phred33 $R1 $R2 $R1paired $R1unpaired $R2paired $R2unpaired HEADCROP:7 \
                       ILLUMINACLIP:adapters.fasta:2:30:8 \
                       LEADING:20 \
                       TRAILING:20 \
                       SLIDINGWINDOW:20:20 \
                       MINLEN:40 \

done


mkdir unpairedReads
mv *unpaired.fastq.gz unpairedReads

mkdir cleanReads
mv *paired.fastq.gz cleanReads

mkdir rawReads
mv *fastq.gz rawReads

cd cleanReads
gunzip *.gz
cd ..
