#! /bin/bash
#SBATCH  --job-name=Veronica_ATAC
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 40:00:00
#SBATCH --mem=20000

BIGWIG="/exports/humgen/jihed/bigwig_for_analysis/atac_data/DN1_Veronica"
BED="/exports/humgen/jihed/Coordinate_TOKEEP/atac_peaks/ATAC_Veronica_DN1"

computeMatrix \
    scale-regions \
    -S $BIGWIG/DN1WT1.bw \
    $BIGWIG/DN1WT2.bw \
    $BIGWIG/DN1KO1.bw \
    -R $BED/DN1_more_accessible_peaks.txt \
    $BED/DN1_less_accessible_peaks.txt \
    --afterRegionStartLength 1000 \
    --beforeRegionStartLength 1000 \
    --regionBodyLength 3000 \
    --numberOfProcessors 10 \
    --binSize 10 \
    --skipZeros \
    -o DN1_ATAC_DAL.gz

plotProfile --matrixFile DN1_ATAC_DAL.gz --perGroup --outFileName profile_plot_DN1_ATAC_DAL.pdf

plotHeatmap --matrixFile DN1_ATAC_DAL.gz --outFileName heatmap_plot_DN1_ATAC_DAL.pdf --colorMap Reds