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
    -S $BIGWIG/ImmegenDN1A.bw \
    $BIGWIG/ImmegenDN1B.bw \
    -R $BED/gencode.vM27.annotation.gtf \
    --afterRegionStartLength 5000 \
    --beforeRegionStartLength 5000 \
    --regionBodyLength 5000 \
    --numberOfProcessors 10 \
    --binSize 10 \
    --skipZeros \
    -o DN1_ATAC_Veronica.gz

plotProfile --matrixFile DN1_ATAC_Veronica.gz --perGroup --outFileName profile_plot_DN1_ATAC_Immgen.pdf

plotHeatmap --matrixFile DN1_ATAC_Veronica.gz --outFileName heatmap_plot_DN1_ATAC_Immgen.pdf --colorMap Reds