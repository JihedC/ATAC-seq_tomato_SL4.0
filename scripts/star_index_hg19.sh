#!/bin/bash
#SBATCH --job-name=star_index_hg19
#SBATCH --time=24:00:00 # hh:mm:ss
#
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=60000 # 60G
#SBATCH --mail-user=j.chouaref@lumc.nl
#SBATCH --mail-type=ALL
#
#SBATCH --comment=Devepi

STAR --runThreadN 10 --runMode genomeGenerate \
    --genomeDir /exports/humgen/jihed/genomes/genomepy/hg19/star \
    --genomeFastaFiles /exports/humgen/jihed/genomes/genomepy/hg19/hg19.fa \
    --sjdbGTFfile /exports/humgen/jihed/genomes/genomepy/hg19/hg19.annotation.gtf \
    --sjdbOverhang {params.sjdb_overhang}