#! /bin/bash
#SBATCH  --job-name=Veronica_ATAC
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 40:00:00
#SBATCH --mem=20000

BIGWIG="/exports/humgen/jihed/bigwig_for_analysis/atac_data/DN1_Veronica"
IMMGEN="/exports/humgen/jihed/ATAC-seq-snakemake/analysis/toUCSC"
BED="/exports/humgen/jihed/ATAC-seq-snakemake/analysis_Veronica_DN1_ATAC/runx1_diff_peaks/"

computeMatrix \
    reference-point \
    -S $BIGWIG/DN1WT1.bw \
    $BIGWIG/DN1WT2.bw \
    $BIGWIG/DN1KO1.bw \
    $IMMGEN/ImmegenDN1A.bw \
    $IMMGEN/ImmegenDN1B.bw \
    -R $BED/runx1_less_accessible.txt \
    $BED/runx1_nooverlap_57.txt \
    --afterRegionStartLength 1000 \
    --beforeRegionStartLength 1000 \
    --referencePoint center \
    --numberOfProcessors 10 \
    --binSize 10 \
    --skipZeros \
    -o DN1_runx1_motif.gz 

plotProfile --matrixFile DN1_runx1_motif.gz --perGroup --outFileName profile_plot_DN1_runx1_motif.pdf

plotHeatmap --matrixFile DN1_runx1_motif.gz --outFileName heatmap_plot_DN1_runx1_motif.pdf --colorMap Reds