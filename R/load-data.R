
message("MEMORY USAGE load-data.R 1: ", ceiling(pryr::mem_used() / 1e6), " MB")

# From BuenColors
solar_flare <- c(
  "#3361A5", "#2884E7", "#1BA7FF", "#76CEFF", "#FFFFFF", "#FFE060", 
  "#FA8E24", "#DA2828", "#A31D1D"
)

# Single-cell RNA-seq data -----------------------------------------
# meta <- readRDS("data/global_fine_clusters_website.rds")
# log2cpm <- readRDS("data/exprs_norm_noNorth_fan_filter_4123genes_2020-03-25.rds")
# all(meta$cell == colnames(log2cpm))
# log2cpm_rows <- rownames(log2cpm)
# log2cpm_cols <- colnames(log2cpm)
# log2cpm_dimnames_file <- "data/single-cells-dimnames.rda"
# log2cpm_file <- "data/exprs_norm_noNorth_fan_filter_4123genes_2020-03-25.rds.h5"
# save(list = c("log2cpm_rows", "log2cpm_cols"), file = log2cpm_dimnames_file)
# log2cpm <- HDF5Array::writeHDF5Array(log2cpm, name = "log2cpm", file = log2cpm_file)


log2cpm_dimnames_file <- "data/single-cells-dimnames.rda"
log2cpm_file <- "data/exprs_norm_noNorth_fan_filter_4123genes_2020-03-25.rds.h5"
meta <- readRDS("data/global_fine_clusters_website_2020-04-02.rds")
# Change "T/NK cell" to "T NK cell"
# meta$cell_type[which(meta$cell_type == "T/NK cell")] <- "T NK cell"

log2cpm <- HDF5Array::HDF5Array(file = log2cpm_file, name = "log2cpm")
stopifnot(all(meta$cell == colnames(log2cpm)))
load(log2cpm_dimnames_file)
rownames(log2cpm) <- log2cpm_rows
colnames(log2cpm) <- log2cpm_cols


# object_size(log2cpm)
# 19 MB

gene_symbols <- rownames(log2cpm)

message("MEMORY USAGE load-data.R 2: ", ceiling(pryr::mem_used() / 1e6), " MB")

        
possible_cell_types_rna <- c(
 "All cells" = "all",
 "Fibroblast" = "Fibroblast",
 "Myeloid" = "Myeloid",
 "T NK cell" = "T NK cell"
)

one_gene_symbol_default <- "SPP1"


# Upload statistics of differential analysis results
dg <- readRDS("data/all_integrative_cluster_top500_marker_2020-03-25.rds")
rownames(dg) <- seq(nrow(dg))
dg <- as.data.frame(dg)

# object_size(dg)
# 1.24 MB

# > head(dg)
# feature                   group   avgExpr     logFC  statistic       auc          pval          padj   pct_in   pct_out
# 1     RBP7 0:Inflammatory monocyte 0.2994023 0.2177861 2001022092 0.5638394  0.000000e+00  0.000000e+00 20.91078  9.418859
# 2   AGTRAP 0:Inflammatory monocyte 0.5907722 0.2176164 1988098420 0.5601978 1.295702e-211 8.140003e-211 41.02887 37.008994
# 3 TNFRSF1B 0:Inflammatory monocyte 1.0580693 0.8287626 2650365089 0.7468084  0.000000e+00  0.000000e+00 62.92368 19.307270
# 4    EFHD2 0:Inflammatory monocyte 0.8404470 0.3681388 2183407574 0.6152311  0.000000e+00  0.000000e+00 54.23136 40.204623
# 5      CDA 0:Inflammatory monocyte 0.2982927 0.2471031 2074336840 0.5844977  0.000000e+00  0.000000e+00 21.78001  5.586166
# 6    CDC42 0:Inflammatory monocyte 1.3693212 0.2190070 2083479919 0.5870740  0.000000e+00  0.000000e+00 77.87557 75.206041


dg <- dg[order(dg$auc, decreasing = TRUE),]
dg <- dg[, c(1,2,3,4,6,8,9)]

# > head(dg)
# feature  group   avgExpr     logFC       auc         padj pct_in
# 6991  MT-ND1 22:AT2 5.3011580 1.8509524 0.9924849 8.969916e-01    100
# 6787    GPAM 22:AT2 0.8716156 0.8521118 0.9908881 8.262396e-17    100
# 6625  SLC4A4 22:AT2 1.3654411 1.3218331 0.9889169 7.789974e-08    100
# 6873  SNHG19 22:AT2 1.3869015 1.3347687 0.9857940 5.846709e-06    100
# 6905    GRB7 22:AT2 0.8716156 0.8400680 0.9856998 1.804269e-09    100
# 6840   HOMEZ 22:AT2 0.8716156 0.8314812 0.9838829 9.719350e-07    100

