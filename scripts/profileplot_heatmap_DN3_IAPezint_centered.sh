#! /bin/bash
#SBATCH  --job-name=Veronica_ATAC
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 02:00:00
#SBATCH --mem=20000

BIGWIG="/exports/humgen/jihed/bigwig_for_analysis/atac_data/DN3_Thymus"
BED="/exports/humgen/jihed/Coordinate_TOKEEP/mm10_rm/mm10_bed"

computeMatrix \
    reference-point \
    -S $BIGWIG/Morc3_thymus_WT_DN3.bw \
    $BIGWIG/Morc3_thymus_KO_DN3.bw \
    -R $BED/IAP_ez.bed \
    --afterRegionStartLength 2000 \
    --beforeRegionStartLength 2000 \
    --referencePoint center \
    --numberOfProcessors 10 \
    --binSize 10 \
    --skipZeros \
    -o DN3_ATAC_IAPezint_centered.gz

plotProfile --matrixFile DN3_ATAC_IAPezint_centered.gz --perGroup --outFileName profile_plot_DN3_ATAC_IAPezint_centered.pdf

plotHeatmap --matrixFile DN3_ATAC_IAPezint_centered.gz --outFileName heatmap_plot_DN3_ATAC_IAPezint_centered.pdf --colorMap Reds