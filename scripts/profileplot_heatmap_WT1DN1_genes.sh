#! /bin/bash
#SBATCH  --job-name=Veronica_ATAC
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 40:00:00
#SBATCH --mem=20000

BIGWIG="/exports/humgen/jihed/bigwig_for_analysis/atac_data/DN1_Veronica"
BED="/exports/humgen/jihed/genomes/annotation"

computeMatrix \
    scale-regions \
    -S $BIGWIG/DN1WT1.bw \
    -R $BED/gencode.vM27.annotation.gtf \
    --afterRegionStartLength 5000 \
    --beforeRegionStartLength 5000 \
    --regionBodyLength 5000 \
    --numberOfProcessors 10 \
    --binSize 10 \
    --skipZeros \
    -o WT1_DN1_ATAC_Veronica.gz

plotProfile --matrixFile WT1_DN1_ATAC_Veronica.gz --perGroup --outFileName profile_plot_WT1_DN1_ATAC_Veronica.pdf

plotHeatmap --matrixFile WT1_DN1_ATAC_Veronica.gz --outFileName heatmap_plot_WT1_DN1_ATAC_Veronica.pdf --colorMap Reds