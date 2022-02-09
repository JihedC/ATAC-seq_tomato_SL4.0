#! /bin/bash
#SBATCH  --job-name=PCAPlot
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 40:00:00
#SBATCH --mem=20000


BAM="/exports/humgen/jihed/Snakemake_ChIP_seq_pipeline/results/mapped/DN1_ATAC"

multiBamSummary --bamfiles bins $BAM/DN1KO1Jul.sorted.bam \
    $BAM/DN1KO2Jul.sorted.bam \
    $BAM/DN1KO3Jul.sorted.bam \
    $BAM/DN1KODec1.sorted.bam \
    $BAM/DN1WTAJul.sorted.bam \
    $BAM/DN1WTBJul.sorted.bam \
    $BAM/DN1WTDec1.sorted.bam \
    --binSize 1000 \
    --outRawCounts $BAM/raw_counts_atac.txt \
    --outFileName $BAM/multibamsummary_atac_dn1.npz 



