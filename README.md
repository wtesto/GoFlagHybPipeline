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

1. First, check the list of references in **refSeqs.txt** to find the best options for your dataset. Keep in mind that the number of loci represented in the refetence is indicated in the first column. 

2. Using a text editor, open **1_extractSequences.sh** and type in the taxon name of your reference (or an unambiguous portion of the name) in the indicated space following the first *awk* command on line 9. In the provided example, this is currently *Thelypteris*, which is an unambiguous part of the name of one of the references, *Thelypteris acuminata*. If you wish you add second reference, do the same on line 11 (you can copy and paste line 11 if you wish to have more than two refertences!). *If you only want to use one reference,* **comment out line 11.**

3. Once you have specified your desired references, save **1_extractSequences.sh** and then run it. You should create a new **target.fa** 

Check your new **target.fa** to make sure it looks good, and then move on to the next step. 

(If you are not familiar with shell scripts, you can run this script (and the rest of them) in the terminal with the command *bash [name of script]* - in this case, it would be *bash 1_extractSequences.sh* . There are lots of other ways to run them of course, but that is the most basic.)


### Step 2: Trim and quality check your raw reads using **2_trimmer.sh**

Now that you have your reference file built, you need to clean up your raw read files before starting the HybPiper workflow. **2_trimmer.sh** does this using **Trimmomatic** (check the *Dependencies* section above). This script is very basic -- it runs Trimmomatic, organizes the outfiles, and then unzips the cleaned read files so they can be processed further. 

**Before running this step**, please check the trimmomatic settings by opening **2_trimmer.sh** and ensure that the appropriate parameters are selected. 

Once you run **2_trimmer.sh**, you will end up with three new directories: 

- */unpairedReads* will contain the reads that Trimmomatic was unable to pair for each sample

- */cleanReads* will contain the cleaned, trimmed reads. 

- */rawReads* will contain the unprocessed, raw reads. 

The contents of */cleanReads* will be unzipped fastq files, which will be ready for processing in HybPiper. 


### Step 3: Rename clean read files with **3_renamer.sh**

**3_renamer.sh** takes the unwieldy, long names of the fastq files in the */cleanReads* directory and shortens them to just retain the plate number, well number, and sequencing direction (forward or reverse). It also creates a new subdirectory called */backupReads* with --you guessed it-- backups of the cleaned fastq files. Finally, the script creates a list of the all of the samples in */cleanReads* and places this file (called *namelist.txt*) in the main working directory. HybPiper will use *namelist.txt* to identify the samples to process in the next step. 


### Step 4: Run HybPiper with **4_runHybPiper.sh**

Prior to running this script, you will need to activate HybPiper (assuming you installed it with conda) with *conda activate hybpiper*. 

**4_runHybPiper.sh** does exactly what it sounds like -- it runs HybPiper. **Note**: the *intronerate* option is currently on in this script. 

**Please consult the** [HybPiper Wiki](https://github.com/mossmatters/HybPiper/wiki/) to see the various run options and compare these to the options currently specified in **4_runHybPiper.sh**. You may want to adjust these settings to suit your needs. 

Note, this script will run in the interactive mode, meaning that you cannot close the terminal without interrupting the run. To avoid this, you can place these commands inside a SLURM script (if you have access to a SLURM scheduler). Alternatively, there are several options for either detaching the session or otherwise avoiding interruption of the run if your terminal session is interrupted. One option is to use the **nohup** (no hangup) command, which you can do like this: 

*nohup bash 4_runHybPiper.sh &*

Depending on the size of your data set and computational resources, this step should take a long time -- hours or even days. Once finished, you will end up with multi-fasta files for each locus. Remember that these are unaligned and they will need to be aligned prior to tree building. 


### Step 5: Cleaning up missing loci with **5_deleteBadSeqs.sh**

Locus recovery is almost always quite variable, with at least a few loci failing to be assembled for many or even all of your samples. **5_deleteBadSeqs** identifies loci with fewer than a set threshold number of sequences and deletes these fasta files. It then renumbers the fasta files for the remaining loci, which is helpful for downstream tree building analyses, especially if you use array jobs. 

*Important*: because the loci will be renumbered after this step, you may want to refer to the outfiles of the *hybpiper stats* commands run in **4_runHybPiper.sh** if you want to evaluate specific loci. 

The script is currently set to delete loci that contain sequences from fewer than 25% of the samples. To change the threshold, open **5_deleteBadSeqs.sh** in a text editor and modify the fraction assigned to the variable *cutoff* on line 3. 

After running this step, the */FASTAs* directory will contain only loci that pass this filter. This is not the only quality control you should use, though -- you should also review the putative paralogous loci identified in *paralog_report.tsv*. You may want to do additional checks, as well. 

After you are satisfied with the quality of your multi-FASTA files, you can continue with downstream analyses. Good luck! 

