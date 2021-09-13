#!/bin/bash
#SBATCH --job-name=maketagdir
#SBATCH --time=48:00:00 # hh:mm:ss
#SBATCH --mem-per-cpu=40000 # 40G
#SBATCH --mail-user=j.chouaref@lumc.nl
#SBATCH --mail-type=ALL
#
#SBATCH --comment=Devepi

module load genomics/ngs/samtools/1.11/gcc-8.3.1

FOLDER="/exports/humgen/jihed/ATAC-seq-snakemake/analysis_Veronica_DN1_ATAC"
PEAKS="/exports/humgen/jihed/ATAC-seq-snakemake/analysis_Veronica_DN1_ATAC/peaks"
TAGS="/exports/humgen/jihed/ATAC-seq-snakemake/analysis_Veronica_DN1_ATAC/homer"


makeTagDirectory /exports/humgen/jihed/ATAC-seq-snakemake/analysis_Veronica_DN1_ATAC/homer/tag_ko \
    /exports/humgen/jihed/ATAC-seq-snakemake/analysis_Veronica_DN1_ATAC/mappedDataDir/DN1KO1/DN1KO1.bam

makeTagDirectory /exports/humgen/jihed/ATAC-seq-snakemake/analysis_Veronica_DN1_ATAC/homer/tag_wt \
    /exports/humgen/jihed/ATAC-seq-snakemake/analysis_Veronica_DN1_ATAC/mappedDataDir/DN1WT1/DN1WT1.bam \
    /exports/humgen/jihed/ATAC-seq-snakemake/analysis_Veronica_DN1_ATAC/mappedDataDir/DN1WT2/DN1WT2.bam   


mergePeaks $PEAKS/DN1WT1_peaks.narrowPeak $PEAKS/DN1WT2_peaks.narrowPeak $PEAKS/DN1KO1_peaks.narrowPeak -d given > $TAGS/DN1_WT_KO_merged_peaks.txt 

getDifferentialPeaks $TAGS/DN1_WT_KO_merged_peaks.txt $TAGS/tag_ko $TAGS/tag_wt > ATAC_DN1_KO_vs_WT 

getDifferentialPeaks $TAGS/DN1_WT_KO_merged_peaks.txt $TAGS/tag_wt $TAGS/tag_ko > ATAC_DN1_WT_vs_KO  

