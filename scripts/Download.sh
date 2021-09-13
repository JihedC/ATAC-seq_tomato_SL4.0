#!/bin/bash
#SBATCH --partition=all
#SBATCH --job-name Download
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=15G
#SBATCH --time=03:00:00 
##SBATCH --error=Seqtk.%J.err ##if not defined, redirected to standard output.
#SBATCH --output=Seqtk.%J.out
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=j.chouaref@lumc.nl

wget https://data.macrogen.com/~macro3/HiSeq02//20210908/HN00155645/DN1_KO_rep1_1.fastq.gz

wget https://data.macrogen.com/~macro3/HiSeq02//20210908/HN00155645/DN1_KO_rep1_2.fastq.gz

wget https://data.macrogen.com/~macro3/HiSeq02//20210908/HN00155645/DN1_WT_rep1_1.fastq.gz

wget https://data.macrogen.com/~macro3/HiSeq02//20210908/HN00155645/DN1_WT_rep1_2.fastq.gz

wget https://data.macrogen.com/~macro3/HiSeq02//20210908/HN00155645/DN1_WT_rep2_1.fastq.gz

wget https://data.macrogen.com/~macro3/HiSeq02//20210908/HN00155645/DN1_WT_rep2_2.fastq.gz