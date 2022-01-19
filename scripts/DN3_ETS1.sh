#! /bin/bash
#SBATCH  --job-name=Veronica_ATAC
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 25:00:00
#SBATCH --mem=20000

DN3="/exports/humgen/jihed/bigwig_for_analysis/atac_data/DN3_Thymus"
DN1="/exports/humgen/jihed/bigwig_for_analysis/atac_data/DN1_Veronica"
BED="/exports/humgen/jihed/Coordinate_TOKEEP/motifs"

computeMatrix \
    reference-point \
    -S $DN3/Morc3_thymus_WT_DN3.bw \
    $DN3/Morc3_thymus_KO_DN3.bw \
    -R $BED/ETS1_fimo.txt\
    --afterRegionStartLength 2000 \
    --beforeRegionStartLength 2000 \
    --referencePoint center \
    --numberOfProcessors 10 \
    --binSize 10 \
    --skipZeros \
    -o DN3_ATAC_ETS1_centered.gz

plotProfile --matrixFile DN3_ATAC_ETS1_centered.gz --perGroup --outFileName profile_plot_DN3_ATAC_ETS1_centered.pdf

plotHeatmap --matrixFile DN3_ATAC_ETS1_centered.gz --outFileName heatmap_plot_DN3_ATAC_ETS1_centered.pdf --colorMap Reds