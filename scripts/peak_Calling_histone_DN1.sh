#!/bin/bash
#SBATCH --job-name=Peak_calling_DN1
#SBATCH --time=2:0:0 # hh:mm:ss
#
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=6000 # 40G
#SBATCH --mail-user=j.chouaref@lumc.nl
#SBATCH --mail-type=ALL
#
#SBATCH --comment=Devepi


macs2 callpeak -t GATADN1.sorted.bam -c inputDN1.sorted.bam --name GATA3_DN1 --outdir GATA3_DN1 --gsize mm

macs2 callpeak -t H3K27me3DN1rep1.sorted.bam -c inputDN1.sorted.bam --name H3K27me3DN1rep1 --outdir H3K27me3DN1 --gsize mm

macs2 callpeak -t H3K27me3DN1rep2.sorted.bam -c inputDN1.sorted.bam --name H3K27me3DN1rep2 --outdir H3K27me3DN1 --gsize mm

macs2 callpeak -t H3K27me3DN1rep3.sorted.bam -c inputDN1.sorted.bam --name H3K27me3DN1rep3 --outdir H3K27me3DN1 --gsize mm

macs2 callpeak -t H3K27me3DN1rep4.sorted.bam -c inputDN1.sorted.bam --name H3K27me3DN1rep4 --outdir H3K27me3DN1 --gsize mm

macs2 callpeak -t H3K27me3DN1rep5.sorted.bam -c inputDN1.sorted.bam --name H3K27me3DN1rep5 --outdir H3K27me3DN1 --gsize mm

macs2 callpeak -t H3K4me2DN1rep1.sorted.bam -c inputDN1.sorted.bam --name H3K4me2DN1_rep1 --outdir H3K4me2DN1 --gsize mm

macs2 callpeak -t H3K4me2DN1rep2.sorted.bam -c inputDN1.sorted.bam --name H3K4me2DN1_rep2 --outdir H3K4me2DN1 --gsize mm

macs2 callpeak -t H3K4me2DN1rep3.sorted.bam -c inputDN1.sorted.bam --name H3K4me2DN1_rep3 --outdir H3K4me2DN1 --gsize mm

macs2 callpeak -t H3K9AcDN1rep1.sorted.bam -c inputDN1.sorted.bam --name H3K9AcDN1rep1 --outdir H3K9AcDN1 --gsize mm

macs2 callpeak -t H3K9AcDN1rep2.sorted.bam -c inputDN1.sorted.bam --name H3K9AcDN1rep2 --outdir H3K9AcDN1 --gsize mm

macs2 callpeak -t H3K9AcDN1rep3.sorted.bam -c inputDN1.sorted.bam --name H3K9AcDN1rep3 --outdir H3K9AcDN1 --gsize mm

macs2 callpeak -t PU1DN1.sorted.bam -c inputDN1.sorted.bam --name PU1DN1 --outdir PU1DN1 --gsize mm

