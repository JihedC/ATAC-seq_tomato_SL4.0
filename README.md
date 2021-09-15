# DN1 ATAC-seq 

We performed ATAC-seq on 50000 DN1 WT and KO DN1 cells obtained from OP-9 co-culture. To perform the experiment, we used [this protocol](docs/Fast-ATAC-seq_MV.docx).
Details of the experiment, such as number of qPCR cycles, index of primers can be found in [this powerpoint](docs/Overview_DN1_ATAC.pptx).

The report of sequencing from Macrogen can be found [here](docs/HN00155645_report_sequencing.pdf).

The analysis was done using our [ATAC Snakemake pipeline](https://git.lumc.nl/dsanleongranado/ATAC-seq-snakemake)

The raw data was archived in the SHARK LTS: `/exports/archive/hg-groep-vandermaarel/Lucia/ATAC_seq/ATAC_Veronica_2021_DN1` 

## Analysis

### Peak calling
With MACS2 peak calling we obtained the peaks identfied for 2xWT and 1xKO:

| name | peaks |
| ---- | ----- |
| WT1  | 28992 |
| WT2  | 24902 |
| KO1  | 37473 |

The peaks and the genome tracks can be found on [UCSC](http://genome-euro.ucsc.edu/cgi-bin/hgTracks?db=mm10&lastVirtModeType=default&lastVirtModeExtraState=&virtModeType=default&virtMode=0&nonVirtPosition=&position=chr6%3A124841162%2D124911751&hgsid=274563084_3DHBVW3a35r0EP6V4SmNVnPDbggR).

### Differential peak analysis
The differential peak analysis was done with [Homer](scripts/Homer_differential_peak_calling.sh), we observed the following differentially expressed peaks:

| type                  | number |
| --------------------- | ------ |
| Less accessible in KO | 2046   |
| More accessible in KO | 269    |


To validate the differential peaks, I made this heatmap:

![](data/Heatmap_differential_peaks.png)

I annotated the differential peaks:
    - [less accessible](data/Differential_peak_analysis/homer/Homer_differentially_accessible_peaks.xlsx) (Sheet1)
    - [more accessible](data/Differential_peak_analysis/homer/Homer_differentially_accessible_peaks.xlsx) (Sheet2)

### Motif analysis

Using the coordinate of the differential peaks, I performed a motif analysis using HOMER.

The results can be found here:
    - [less accessible](data/motif/less_accessible_in_KO/knownResults.html)
    - [more accessible](data/motif/more_accessible_in_KO/knownResults.html)

The motif analysis is interesting because we can see that amond the TF found in the less accessible loci induced by MORC3 loss, we find Runx1 and Tcf7.     

I used FIMO to identify all the potential binding sites of the follwing TF:

    - TCF7: CCACATCAAAGG
    - RUNX1: CWAACCACAR


 There are 70110 occurences of TCF7 motif genome wide. 
 If we take a window of 1000bp upstream and downstream the less accessible peaks, there are 197 (10%) differentially accessible peaks that overlap with a TCF7motif.


 There are 85689 occurences of the Runx1 motif genome wide. 
  If we take a window of 1000bp upstream and downstream the less accessible peaks, there are 338 (17%) differentially accessible peaks that overlap with a TCF7motif.
