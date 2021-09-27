#!/bin/bash
#SBATCH --job-name=Peak_calling_DN1
#SBATCH --time=1:0:0 # hh:mm:ss
#
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=6000 # 40G
#SBATCH --mail-user=j.chouaref@lumc.nl
#SBATCH --mail-type=ALL
#
#SBATCH --comment=Devepi
#SBATCH --partition=highmem

echo "Peak calling DN1A"
macs2 callpeak -t Runx1DN1A.sorted.bam -c DN1input1.sorted.bam --name
Runx1_DN1_A --outdir Runx1_DN1 --gsize mm

echo "Peak calling DN1A"

macs2 callpeak -t Runx1DN1B.sorted.bam -c DN1input2.sorted.bam --name
Runx1_DN1_B --outdir Runx1_DN1 --gsize mm

echo "Peak calling DN3A"

macs2 callpeak -t Runx1DN3A.sorted.bam -c DN3input1.sorted.bam --name
Runx1_DN3_A --outdir Runx1_DN3 --gsize mm

echo "Peak calling DN3B"

macs2 callpeak -t Runx1DN3B.sorted.bam -c DN3input2.sorted.bam --name
Runx1_DN3_B --outdire Runx1_DN3 --gsize mm