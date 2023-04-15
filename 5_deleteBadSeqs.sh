#!/bin/bash

declare -i cutoff=0.25

num_seqs=$(wc -l < namelist.txt)

min_num_seqs=$((( $num_seqs)*$cutoff))

col_count=$(head -n1 seq_lengths.tsv | grep -o $'\t' | wc -l)

col_count=$((col_count+1))


for ((i=2; i <= $col_count; i++));

do
header=$(cut -f$i seq_lengths.tsv | head -n 1)

counter=$(cut -f$i seq_lengths.tsv | grep -x "0" | wc -l)

echo "$header $counter" >> zeroes_count.txt;
done


for i in $(seq $min_num_seqs $num_seqs); 

do 
grep  " "$i zeroes_count.txt | cut -f1 -d " " >> loci_to_delete.txt
done

cd FASTAs/

for file in *.FNA; do 
    mv -- "$file" "${file%.FNA}.fasta"
done


while read name; 
do rm $name*.fasta
done < ../loci_to_delete.txt

sed -i -r 's/\s.+//g' *.fasta


rm ../zeroes_count.txt

echo "Don't forget to check for paralog loci!"

cd ../
