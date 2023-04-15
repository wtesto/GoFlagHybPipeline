#!/bin/bash


###Insert the taxon name for your reference of interest between the first two "/   /"
### Note that for some species (e.g., Polypodium hesperium), there are two references in the reference library
###For these species, indicate the reference number in the tag to disambiguate between them (e.g., "Polypodium_hesperium_2")


awk '/Thelypteris/ {print; getline; print}' combinedTarget.fasta > ref_seq.fasta

awk '/Woodsia_scopulina/ {print; getline; print}' combinedTarget.fasta >> ref_seq.fasta ###add additional ref if needed

sed -E "s/>L([0-9]*)_.*_.*_(.*_.*)_[1-2]__REF/>\2-\1/g" ref_seq.fasta > target.fa


rm ref_seq.fasta
