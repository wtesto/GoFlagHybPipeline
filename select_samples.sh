#!/bin/bash

###Place this script where your raw reads files are
###Make a .txt file names "sample_list.txt" with the plate and well numbers of your samples (e.g., P017_WB05)
###Include one sample per line
###Selected samples will be placed in a new directory called "selected_samples"
###You can then move those samples to the directory where you will perform your HybPiper analyses

ls -1 RAPiD* | grep -f sample_list.txt > subset.txt

mkdir selected_samples
for file in $(cat subset.txt); do 
	cp "$file" selected_samples/; 
done
