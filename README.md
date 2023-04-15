# GoFlagHybPipeline
Scripts for processing sequences from the GoFlag project in HybPiper

## A few comments
This is a collection of simple shell scripts that I use to process target-capture sequence data generated from the GoFlag (Geneology of Flagellate Plants) project and similar data sets using HybPiper. This workflow has worked for me on Mac OS and a variety of Linux distributions, but your mileage may vary! This assumes a basic understanding of bash scripting and command line experience and familiarity with the HybPiper workflow. Please consult Matt Johnson's excellent [HybPiper Github Repository](https://github.com/mossmatters/HybPiper) to learn more about how HybPiper works -- you should be able to easily modify these scripts as needed for a variety of run types. 

The GoFlag probe set is a universal target-capture probe set that is designed for generating ca. 400 nuclear low copy nuclear loci from bryophytes, lycophytes, ferns, and gymnosperms. If you want to learn more about the GoFlag probe set, please see [our paper](https://static1.squarespace.com/static/60f01ce3590ad927352e44af/t/60f55846860d895b483fc75f/1626691669161/2021Breinholt.pdf) describing it in Applications in Plant Sciences. And please cite that paper if you use those data or the probe set - thanks! 

Please use these scripts with caution and please let me know if you encounter any unexpected behavior -- I am glad to troubleshoot them and appreciate any feedback. 

## A quick note on dependencies

Using the HybPiper workflow (and by extension, these scripts) requires a number of dependencies, which are outlined [here](https://github.com/mossmatters/HybPiper#dependencies). In addition, the **2_trimmer.sh** script runs **Trimmomatic**, which you will need to have installed -- you can find out more about that [here](https://github.com/usadellab/Trimmomatic). 

I recommend using conda to manage your HybPiper installation -- instructions on how to do this are provided [here](https://github.com/mossmatters/HybPiper#setup). Remember that if you do so, you will need to run *conda activate hybpiper* prior to running HybPiper (in this case with **4_runHybPiper.sh**). 

## Workflow overview

This workflow is very simple and involves five shell scripts that preprocess GoFlag data for a HybPiper run, run HybPiper, and then process the output a HybPiper run for downstream analyses. The numbered prefixes in the script names indicate the order that they are to be run in. The workflow is designed to **run in a single directory** with all of the files in this repository, plus your zipped .fastq files. 

Additional files include:

- **adapters.fasta**: this is fasta file containing the Illumina i5 and i7 adapter sequences.

- **combinedTarget.fasta**: this is a fasta file containing sequence data for all 251 GoFlag references. For a complete list of the references and the number of loci covered by each, see **refSeqs.txt**. Custom target files can be generated from this file using the **1_extractSequences.sh** script.

- **refSeqs.txt**: this is a text file listing all 251 of the GoFlag references, which were obtained from 1KP transcriptomes and whole genome sequences. 

- **selectSamples.sh** this is an additional shell script that can be used at the start of the workflow to select raw reads files for a subset of samples and place them in a separate directory so they can be easily moved to the working directory to be analyzed. 

- **target.fa** this is an example custom target file generated from **combinedTarget.fasta** using the **1_extractSequences.sh** script. 


### (optional step): Move subset of samples with **selectSamples.sh**

Many times, we only want to process some of the many samples for which we have data stored in some directory. To help speed up the process of finding the files I want and copying them over, I wrote **selectSamples.sh**, which is a very simple shell script that I use to subset samples. Please read the comment lines at the start of the script for instructions on how to use it. Of course, you can copy the file that you want to process to the working directory other ways! 

Briefly: 

1. Make a text file named **sample_list.txt** with the plate and well number of your files, with one sample per line. 
2. Copy **selectSamples.sh** and **sample_list.txt** to the directory where your raw reads files are. 
3. Run **selectSamples.sh**. The subset of files that you want will now be in a new directory called */selected_samples*.
4. Copy the files in */selected_samples* to your working directory and you are ready to go! 


### Step 1: Generate a custom reference file using **1_extractSequences.sh**

The assembly step of HybPiper requires a target sequence file in order to be able to map the reads. This must be a fasta file and it has to be in a specific format that enables HybPiper to identify which locus is which. **combinedTarget.fasta** contains sequences from all 251 GoFlag references, but you will want to select one or perhaps a few of these to build a custom target file for your analysis. To do so, you need to identify which references you want in your custom target file and then use **1_extractSequences.sh** to build the file from **combinedTarget.fasta. 

Here's how to do it: 

1. First, check the list of references in **refSeqs.txt** to find the best fit(s) for your 

