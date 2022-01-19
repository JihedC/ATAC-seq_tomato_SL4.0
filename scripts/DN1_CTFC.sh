#! /bin/bash
#SBATCH  --job-name=Veronica_ATAC
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 02:00:00
#SBATCH --mem=20000

DN3="/exports/humgen/jihed/bigwig_for_analysis/atac_data/DN3_Thymus"
DN1="/exports/humgen/jihed/bigwig_for_analysis/atac_data/DN1_Veronica"
BED="/exports/humgen/jihed/Coordinate_TOKEEP/motifs"

computeMatrix \
    reference-point \
    -S $DN1/DN1WT1.bw \
    $DN1/DN1WT2.bw \
    $DN1/DN1KO1.bw \
    -R $BED/CTFC_fimo.txt\
    --afterRegionStartLength 2000 \
    --beforeRegionStartLength 2000 \
    --referencePoint center \
    --numberOfProcessors 10 \
    --binSize 10 \
    --skipZeros \
    -o DN1_ATAC_CTCF_centered.gz

plotProfile --matrixFile DN1_ATAC_CTCF_centered.gz --perGroup --outFileName profile_plot_DN1_ATAC_CTCF_centered.pdf

plotHeatmap --matrixFile DN1_ATAC_CTCF_centered.gz --outFileName heatmap_plot_DN1_ATAC_CTCF_centered.pdf --colorMap Reds