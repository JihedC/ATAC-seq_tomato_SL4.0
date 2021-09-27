#! /bin/bash
#SBATCH  --job-name=Veronica_ATAC
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 40:00:00
#SBATCH --mem=20000

BIGWIG="/exports/humgen/jihed/bigwig_for_analysis/atac_data/DN1_Veronica"
IMMGEN="/exports/humgen/jihed/ATAC-seq-snakemake/analysis/toUCSC"
BED="/exports/humgen/jihed/ATAC-seq-snakemake/analysis_Veronica_DN1_ATAC/tcf7_diff_peaks"

computeMatrix \
    reference-point \
    -S $BIGWIG/DN1WT1.bw \
    $BIGWIG/DN1WT2.bw \
    $BIGWIG/DN1KO1.bw \
    $IMMGEN/ImmegenDN1A.bw \
    $IMMGEN/ImmegenDN1B.bw \
    -R $BED/tcf7_coordinates.txt \
    --afterRegionStartLength 1000 \
    --beforeRegionStartLength 1000 \
    --referencePoint center \
    --numberOfProcessors 10 \
    --binSize 10 \
    --skipZeros \
    -o DN1_tcf7_motif_all.gz 

plotProfile --matrixFile DN1_tcf7_motif_all.gz --perGroup --outFileName profile_plot_DN1_tcf7_motif_all.pdf

plotHeatmap --matrixFile DN1_tcf7_motif_all.gz --outFileName heatmap_plot_DN1_tcf7_motif_all.pdf --ccolorMap Reds