#!/bin/bash 

#SBATCH --job-name=grep

#SBATCH --cpus-per-task=1

#SBATCH --mem-per-cpu=12G

#SBATCH -o slurm.%j.out

#SBATCH -e slurm.%j.err

#SBATCH --mail-type=END

#SBATCH --mail-user=winona.oliveros01@estudiant.upf.edu

#SBATCH --export=ALL

#El $1 es el tamany de la window desitjada per el depth i el $2 es l'arxiu bam a analitzar i el $3 es el path sencer al arxiu de R 


module load mosdepth/0.2.3-foss-2016b

date

mosdepth.1 -t 4 -n -b $1 $2_$1 $2

date

module load R/3.4.2-foss-2016b 

date 

Rscript $3 $1 $2_$1.regions.bed.gz

date




