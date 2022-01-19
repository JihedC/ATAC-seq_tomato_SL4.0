library(DiffBind)
library(readr)


samplesheet <- read_delim("/exports/humgen/jihed/ATAC-seq-snakemake/analysis/Diffbind/ATAC_DN1_Zbtb24_samplesheet.csv",
    ";", escape_double = FALSE, trim_ws = TRUE)
test <- dba(sampleSheet = samplesheet)
pdf(file = "/exports/humgen/mvukic/Diffbind/Diffbind_ATAC_DN1.pdf")
plot(test)
dev.off()


test_count <- dba.count(test)

pdf(file="/exports/humgen/mvukic/Diffbind/Diffbind_ATAC_DN1_read_count.pdf")
plot(test_count)
dev.off()

pdf(file="/exports/humgen/mvukic/Diffbind/Diffbind_atac_dn1_read_count_pca.pdf")
dba.plotPCA(test_count, label = c(DBA_CONDITION, DBA_ID))
dba.plotPCA(test_count, label = DBA_CONDITION)
dba.plotPCA(test_count, label = DBA_ID)
dev.off()



test_count <- dba.contrast(test_count, group1 = test_count$masks$WT, group2 = test_count$masks$KO, name1 = "WT", name2 = "KO")

test_analyze <- dba.analyze(test_count)

test_analyze <- dba.analyze(test_count, method=DBA_EDGER)

test_analyze <- dba.analyze(test_count, method=DBA_ALL_METHODS)

saveRDS(test_analyze, file="/exports/humgen/mvukic/Diffbind/Diffbind.rds")

pdf(file="/exports/humgen/mvukic/Venn_overlap_peaks.pdf")
dba.plotVenn(test_analyze,contrast=1,method=DBA_ALL_METHODS)
dev.off()


pdf(file="/exports/humgen/mvukic/MAplot_DESEQ2_EDGER.pdf")
par(mfrow=c(1,2))
dba.plotMA(test_analyze, method=DBA_DESEQ2, bNormalized = FALSE)
dba.plotMA(test_analyze, method=DBA_DESEQ2, bNormalized = TRUE)
dba.plotMA(test_analyze, method=DBA_EDGER, bNormalized = TRUE)
dba.plotMA(test_analyze, method=DBA_EDGER, bNormalized = FALSE)
dev.off()

pdf(file="/exports/humgen/mvukic/MAplot_DESEQ2_EDGER_inverted.pdf")
dba.plotMA(test_analyze, method=DBA_DESEQ2, bFlip = TRUE)
dba.plotMA(test_analyze, method=DBA_EDGER, bFlip = TRUE)
dev.off()


pdf(file="/exports/humgen/mvukic/Volcano_plot_ATAC_DN1_Zbtb24.pdf")
dba.plotVolcano(test_analyze)
dev.off()


report <- dba.report(test_analyze)
write.table(report, file="/exports/humgen/mvukic/ATAC_diffbind.txt", quote=F, sep="\t", row.names=F)
