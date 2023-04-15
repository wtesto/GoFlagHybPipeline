# GoFlagHybPipeline
Scripts for processing sequences from the GoFlag project in HybPiper

## A few comments
This is a collection of simple shell scripts that I use to process target-capture sequence data generated from the GoFlag (Geneology of Flagellate Plants) project and similar data sets using HybPiper. This workflow has worked for me on Mac OS and a variety of Linux distributions, but your mileage may vary! This assumes a basic understanding of bash scripting and command line experience and familiarity with the HybPiper workflow. Please consult Matt Johnson's excellent [HybPiper Github Repository](https://github.com/mossmatters/HybPiper) to learn more about how HybPiper works and its dependencies -- you should be able to easily modify these scripts as needed for a variety of run types. 

The GoFlag probe set is a universal target-capture probe set that is designed for generating ca. 400 nuclear low copy nuclear loci from bryophytes, lycophytes, ferns, and gymnosperms. If you want to learn more about the GoFlag probe set, please see [our paper](https://static1.squarespace.com/static/60f01ce3590ad927352e44af/t/60f55846860d895b483fc75f/1626691669161/2021Breinholt.pdf) describing it in Applications in Plant Sciences. And please cite that paper if you use those data or the probe set - thanks! 

Please use these scripts with caution and please let me know if you encounter any unexpected behavior -- I am glad to troubleshoot them and appreciate any feedback. 

## Workflow overview

This workflow is very simple and involves five shell scripts that preprocess GoFlag data for a HybPiper run, run HybPiper, and then process the output a HybPiper run for downstream analyses. The numbered prefixes in the script names indicate the order that they are to be run in. 

Additional files include:

- **adapters.fasta**: this is fasta file containing the Illumina i5 and i7 adapter sequences.

-**combinedTarget.fasta**: this is a fasta file containing sequence data for all 251 GoFlag references. For a complete list of the references and the number of loci covered by each, see **refSeqs.txt**. 
