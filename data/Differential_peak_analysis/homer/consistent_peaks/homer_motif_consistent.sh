#! /bin/bash
#SBATCH  --job-name=Motifconsistent
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 40:00:00
#SBATCH --mem=20000


PEAKS="/exports/humgen/jihed/Coordinate_TOKEEP/atac_peaks/ATAC_Veronica_DN1"
GENOME="/exports/humgen/jihed/genomes/mm10"
OUTPUT="/exports/humgen/jihed/ATAC-seq-snakemake/analysis_Veronica_DN1_ATAC/motif"


echo START time : `date`

findMotifsGenome.pl $PEAKS/ATAC_DN1_KO_vs_WT_consistent $GENOME/mm10.reference.fa $OUTPUT/Homer_consistent_less_accessible_in_KO/ -size given

findMotifsGenome.pl $PEAKS/ATAC_DN1_WT_vs_KO_consistent $GENOME/mm10.reference.fa $OUTPUT/Homer_consistent_more_accessible_in_KO/ -size given

echo END time : `date`

