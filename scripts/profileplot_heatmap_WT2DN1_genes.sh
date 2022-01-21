#! /bin/bash
#SBATCH  --job-name=Veronica_ATAC
#SBATCH --mail-type=ALL
#SBATCH --mail-user j.chouaref@lumc.nl
#SBATCH -t 40:00:00
#SBATCH --mem=20000

BIGWIG="/exports/humgen/jihed/bigwig_for_analysis/atac_data/DN1_Veronica"
BED="/exports/humgen/jihed/mm10"

computeMatrix \
    scale-regions \
    -S $BIGWIG/DN1KO1Jul_rpkm.bw \
    $BIGWIG/DN1KO2Jul_rpkm.bw \
    $BIGWIG/DN1KO3Jul_rpkm.bw \
    $BIGWIG/DN1KODec1_rpkm.bw \
    $BIGWIG/DN1WTAJul_rpkm.bw \
    $BIGWIG/DN1WTBJul_rpkm.bw \
    $BIGWIG/DN1WTDec1_rpkm.bw \
    -R $BED/gencode.vM27.annotation.gtf \
    --afterRegionStartLength 5000 \
    --beforeRegionStartLength 5000 \
    --regionBodyLength 5000 \
    --numberOfProcessors 10 \
    --binSize 10 \
    --skipZeros \
    -o DN1_ATAC_Veronica.gz

plotProfile --matrixFile DN1_ATAC_Veronica.gz --perGroup --outFileName profile_plot_DN1_ATAC_Veronica.pdf

plotHeatmap --matrixFile DN1_ATAC_Veronica.gz --outFileName heatmap_plot_DN1_ATAC_Veronica.pdf --colorMap Reds