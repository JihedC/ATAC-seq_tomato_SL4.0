#! /bin/bash
#SBATCH  --job-name=heatmap_Pu1
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 10:00:00
#SBATCH --mem=40000

BIGWIG="/exports/humgen/jihed/Snakemake_ChIP_seq_pipeline/results/bigwig"
BED="/exports/humgen/jihed/Coordinate_TOKEEP/chip_peaks/Thymus_chIP_seq"

computeMatrix \
    reference-point \
    -S $BIGWIG/DN1KO1Jul_rpkm.bw \
    $BIGWIG/DN1KO2Jul_rpkm.bw \
    $BIGWIG/DN1KO3Jul_rpkm.bw \
    $BIGWIG/DN1KODec1_rpkm.bw \
    $BIGWIG/DN1WTAJul_rpkm.bw \
    $BIGWIG/DN1WTBJul_rpkm.bw \
    $BIGWIG/DN1WTDec1_rpkm.bw \
    -R $BED/Pu1_ChiP_peaks \
    --afterRegionStartLength 1000 \
    --beforeRegionStartLength 1000 \
    --referencePoint center \
    --numberOfProcessors 10 \
    --binSize 10 \
    --skipZeros \
    -o DN1_ATAC_PU1_diffbind_centered.gz

plotProfile --matrixFile DN1_ATAC_PU1_diffbind_centered.gz --perGroup --outFileName profile_plot_DN1_ATAC_PU1_centered.pdf

plotHeatmap --matrixFile DN1_ATAC_PU1_diffbind_centered.gz --outFileName heatmap_plot_DN1_ATAC_PU1_centered.pdf --colorMap Reds