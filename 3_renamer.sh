#!/bin/bash

cd cleanReads/

for i in *.fastq;
do
	cp $i $(echo $i | sed "s/.*\(P[0-9]*\)_\(W[A-Z][0-9][0-9]\).*\(R[12]\)_[0-1].*\.fastq/\1\2-\3.fastq/");
done


mkdir backupReads

mv *paired.fastq backupReads

ls *R1.fastq > namelist.txt

sed -i -e "s|-.*||g" namelist.txt

mv namelist.txt ../