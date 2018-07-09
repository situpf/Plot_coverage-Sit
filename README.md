# Plot_coverage-Sit

This bash script calculates the coverage depth in a desired window, and then calling the R script it outputs a plot with the depth coverage on each chromosome. 

## FILES

* **Depth.sh** = Bash script for launching the depth analysis of a bam file, creating the corresponding bed for a window lenght and plotting the coverage accross the chromosomes with an Rscript included in the folder. 

* **Coverage_in_windows_singlepage.R** = Rscript for creating the plot from a bed file and a window length. 

## First step

Download the zip directory and decompress it, or clone this repository in your computer. Then move to the directory. In order to be able to run correctly the **Depth.sh** script you'll have to modify one of the first lines of it: 

> export PATH:$PATH="path/of/R/script/"

And specify the correct path to the directory where you have te Rscript stored in your computer. 

## Usage

To do the depth analysis you have to call the bash script from the terminal the following way: 

```bash
sbatch depth.sh <window_width> <file.bam> <desired/output/path>
```
The 3 arguments you have to provide are mandatory, if you use less than 3 arguments the program will break. Those arguments correspond to: 

* **<window_width>**:	Enter a value of the desired window width for calculating the depth coverage.
* **<file.bam>**:	Specify the input BAM file, enter the whole path.
* **<output/desired/path/>**:	Specify the desired path where you want to save the output files.

This is an example of the usage of this script:

```bash
sbatch depth.sh 100 /users/Desktop/bams/h_sap_2039.bam /users/Desktop/bams/results/
```
