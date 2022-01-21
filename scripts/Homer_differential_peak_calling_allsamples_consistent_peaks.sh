#!/bin/bash
#SBATCH --job-name=diffpeak
#SBATCH --time=48:00:00 # hh:mm:ss
#SBATCH --mem-per-cpu=40000 # 40G
#SBATCH --mail-user=j.chouaref@lumc.nl
#SBATCH --mail-type=ALL
#
#SBATCH --comment=Devepi

PEAKS="/exports/humgen/jihed/Snakemake_ChIP_seq_pipeline/results/macs2/Intervene_results/sets"
OUTPUT="/exports/humgen/jihed/Snakemake_ChIP_seq_pipeline/results"
TAGS="/exports/humgen/jihed/Snakemake_ChIP_seq_pipeline/results/mapped"

mergePeaks $PEAKS/1111_DN1KO1_Jul_peaks_DN1KO2_Jul_peaks_DN1KO1_Dec_peaks_DN1KO3Jul_peaks.bed \
    $PEAKS/111_DN1WTBJul_peaks_DN1WT_Dec_peaks_DN1WTAJul_peaks.bed -d given > $OUTPUT/consistent_WT_KO_merged_DN1_peaks.txt

getDifferentialPeaks $OUTPUT/consistent_WT_KO_merged_DN1_peaks.txt $TAGS/DN1KO $TAGS/DN1WT > $OUTPUT/ATAC_DN1_KO_vs_WT_consistent

getDifferentialPeaks $OUTPUT/consistent_WT_KO_merged_DN1_peaks.txt $TAGS/DN1WT $TAGS/DN1KO > $OUTPUT/ATAC_DN1_WT_vs_KO_consistent  
    