#! /bin/bash
#SBATCH  --job-name=deeptools_consistent
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 40:00:00
#SBATCH --mem=80000

BIGWIG="/exports/humgen/jihed/bigwig_for_analysis/atac_data/DN1_Veronica"
BED="/exports/humgen/jihed/Snakemake_ChIP_seq_pipeline/results"

computeMatrix \
    reference-point \
    -S $BIGWIG/DN1KO1Jul_rpkm.bw \
    $BIGWIG/DN1KO2Jul_rpkm.bw \
    $BIGWIG/DN1KO3Jul_rpkm.bw \
    $BIGWIG/DN1KODec1_rpkm.bw \
    $BIGWIG/DN1WTAJul_rpkm.bw \
    $BIGWIG/DN1WTBJul_rpkm.bw \
    $BIGWIG/DN1WTDec1_rpkm.bw \
    -R $BED/ATAC_DN1_KO_more_accessible_consistent.txt \
    $BED/ATAC_DN1_KO_less_accessible_consistent.txt \
    --afterRegionStartLength 1000 \
    --beforeRegionStartLength 1000 \
    --referencePoint center \
    --numberOfProcessors 10 \
    --binSize 10 \
    --skipZeros \
    -o DN1_ATAC_DAL_homer_consistent_centered.gz

plotProfile --matrixFile DN1_ATAC_DAL_homer_consistent_centered.gz --perGroup --outFileName profile_plot_DN1_ATAC_DAL_homer_consistent_centered.pdf

plotHeatmap --matrixFile DN1_ATAC_DAL_homer_consistent_centered.gz --outFileName heatmap_plot_DN1_ATAC_DAL_homer_consistent_centered.pdf --colorMap Reds
