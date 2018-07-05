#!/bin/bash 

#SBATCH --job-name=plot_cov

#SBATCH --cpus-per-task=1

#SBATCH --mem-per-cpu=8G

#SBATCH -o slurm.%j.out

#SBATCH -e slurm.%j.err

##SBATCH --mail-type=END

##SBATCH --mail-user=

# if less than three arguments supplied, display usage 
	if [  $# -le 2 ] || [ $1 == "--help" ] || [ $1 == "-h" ]
	then 

		echo -e "\nUsage:\nsbatch --export=PATH=\$PATH:path/of/R/script/ depth.sh <window_width> <file.bam> <output/desired/path/> \n" 
		echo 
		echo "OPTIONS: "
		echo
		echo "--export=PATH=\$PATH:path/of/R/script/		This is MANDATORY, you have to specify the path were you have stored the Rscript for creating the plot."
		echo
		echo "<window_width>:			Enter a value designing the desired window width for calculating the depth coverage."
		echo "<file.bam>:			Specify the input BAM file, enter the whole path."
		echo "<output/desired/path/>		Specify the desired path where you want to save the output files."
		echo
		exit 1
	fi 
 

export PATH:$PATH="path/of/R/script/"

echo $PATH	

module load mosdepth/0.2.3-foss-2016b

fbname=$(basename $2 | cut -d. -f1)

date

mosdepth.1 -t 4 -n -b $1 $3$fbname\_$1 $2

date

module load R/3.4.2-foss-2016b 

date 

coverage_in_windows_singlepage.R $1 $3$fbname\_$1.regions.bed.gz $3$fbname\_$1 

date




