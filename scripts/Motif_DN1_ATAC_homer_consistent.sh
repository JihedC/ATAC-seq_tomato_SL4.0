#! /bin/bash
#SBATCH  --job-name=Motifconsistent
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 40:00:00
#SBATCH --mem=20000


PEAKS="/exports/humgen/jihed/Coordinate_TOKEEP/atac_peaks/ATAC_Veronica_DN1"
GENOME="/exports/humgen/jihed/mm10"
OUTPUT="/exports/humgen/jihed/Snakemake_ChIP_seq_pipeline/results/motifs"


echo START time : `date`

findMotifsGenome.pl $PEAKS/DN1_KO_More_accessible_Diffbind.annotate.txt $GENOME/mm10.fa $OUTPUT/Homer_consistent_less_accessible_in_KO/ -size given

findMotifsGenome.pl $PEAKS/DN1_KO_less_accessible_Diffbind.annotate.txt $GENOME/mm10.fa $OUTPUT/Homer_consistent_more_accessible_in_KO/ -size given

echo END time : `date`
