# Plot_coverage-Sit

## FILES

* **Depth.sh** = Bash script for launching the depth analysis of a bam file, creating the corresponding bed for a window lenght and plotting the coverage accross the chromosomes with an Rscript included in the folder. 

* **Coverage_in_windows_singlepage.R** = Rscript for creating the plot from a bed file and a window length. 

## First step

In order to be able to run correctly the **Depth.sh** script you'll have to modify one of the first lines of it: 

> export PATH:$PATH="path/of/R/script/"

And specify to correct path to the directory where you have te Rscript stored in your computer. 

## Usage

