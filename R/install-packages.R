# This script installs and loads the packages required for ampviewer.

message("MEMORY USAGE install-packages.R 1: ", ceiling(pryr::mem_used() / 1e6), " MB")

installed_packages <- rownames(installed.packages())

# library(viridis)
# library(grid)
# library(parallel)
# library(formattable)
# library(pheatmap)
# library(d3heatmap)

cran_packages <- c(
  "DT",
  "Matrix",
  "ff",
  "RColorBrewer",
  "data.table",
  "digest",
  "dplyr",
  "forcats",
  "gdata",
  "ggbeeswarm",
  "ggforce",
  "ggplot2",
  "glue",
  "hdf5r",
  "janitor",
  # "lme4",
  "magrittr",
  "matrixStats",
  "pryr",
  "scales",
  "shiny",
  "shinydashboard",
  "stringr",
  "pbapply",
  "readr"
)

# Load packages, and install them if they are not installed.
if (!"pacman" %in% installed_packages) { install.packages("pacman") }
pacman::p_load(char = cran_packages, install = TRUE, update = FALSE)

github_repos <- c(
  "AnalytixWare/shinysky",
  "eclarke/ggbeeswarm",
  "tidyverse/ggplot2",
  "thomasp85/patchwork",
  "jefworks/liger"
)

for (github_repo in github_repos) {
  github_package <- strsplit(github_repo, "/")[[1]][2]
  if (!github_package %in% installed_packages) {
    devtools::install_github(github_repo)
  } else {
    pacman::p_load(char = github_package)
  }
}

# biocLite("qusage")

source("https://bioconductor.org/biocLite.R")
bioc_packages <- c(
  "HDF5Array"
)
for (bioc_package in bioc_packages) {
  if (!bioc_package %in% installed_packages) {
    biocLite(bioc_package, suppressUpdates = TRUE, suppressAutoUpdate = TRUE)
  }
}

message("MEMORY USAGE install-packages.R 2: ", ceiling(pryr::mem_used() / 1e6), " MB")