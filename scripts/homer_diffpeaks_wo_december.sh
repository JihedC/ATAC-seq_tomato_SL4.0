#! /bin/bash
#SBATCH  --job-name=MotifDec
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 40:00:00
#SBATCH --mem=20000


PEAKS="/exports/humgen/jihed/Coordinate_TOKEEP/atac_peaks/ATAC_Veronica_DN1/exclude_dec/"
GENOME="/exports/humgen/jihed/mm10"
OUTPUT="/exports/humgen/jihed/Snakemake_ChIP_seq_pipeline/results/motifs"


echo START time : `date`

findMotifsGenome.pl $PEAKS/DN1_less_accessible.txt $GENOME/mm10.fa $OUTPUT/less_accessible_in_KO_woDec/ -size given

findMotifsGenome.pl $PEAKS/DN1_more_accessible.txt $GENOME/mm10.fa $OUTPUT/more_accessible_in_KO_woDec/ -size given

echo END time : `date`
