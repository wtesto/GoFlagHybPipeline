#!/bin/bash


while read name; 
do hybpiper assemble -t_dna target.fa -r ./cleanReads/$name-*.fastq --prefix $name --bwa --run_intronerate;
done < namelist.txt


hybpiper stats  -t_dna target.fa gene namelist.txt --stats_filename hybpiper_stats --seq_lengths_filename seq_lengths

hybpiper stats  -t_dna target.fa supercontig namelist.txt --stats_filename hybpiper_supercontig_stats --seq_lengths_filename supercontig_seq_lengths

hybpiper recovery_heatmap seq_lengths.tsv --heatmap_dpi 300 --heatmap_filename recovery_heatmap

hybpiper recovery_heatmap supercontig_seq_lengths.tsv --heatmap_dpi 300 --heatmap_filename supercontig_recovery_heatmap

hybpiper retrieve_sequences dna -t_dna target.fa --sample_names namelist.txt --fasta_dir FASTAs

hybpiper retrieve_sequences supercontig -t_dna target.fa --sample_names namelist.txt --fasta_dir FASTAs

hybpiper paralog_retriever namelist.txt -t_dna target.fa



