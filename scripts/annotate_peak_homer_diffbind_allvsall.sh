#!/bin/bash
#SBATCH --partition=all
#SBATCH --job-name annotate_peaks_diffbind
#SBATCH --mem=15G
#SBATCH --time=01:00:00 
##SBATCH --error=annotate_peaks_diffbind.%J.err ##if not defined, redirected to standard output.
#SBATCH --output=annotate_peaks_diffbind.%J.out
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=j.chouaref@lumc.nl


PATH_TO_TXT="/exports/humgen/jihed/Coordinate_TOKEEP/atac_peaks/ATAC_Veronica_DN1"


annotatePeaks.pl $PATH_TO_TXT/DN1_KO_More_accessible_Diffbind.txt mm10 > $PATH_TO_TXT/DN1_KO_More_accessible_Diffbind.annotate.txt

annotatePeaks.pl $PATH_TO_TXT/DN1_KO_less_accessible_Diffbind.txt mm10 > $PATH_TO_TXT/DN1_KO_less_accessible_Diffbind.annotate.txt

