# Installation instructions:
# 1. Install DEBrowser and its dependencies by running the lines below
# in R or RStudio.

if (!requireNamespace("BiocManager", quietly=TRUE))
  install.packages("BiocManager")
BiocManager::install("debrowser")

# 2. Load the library

library(debrowser)

# 3. Prepare data for DEBrowser

if (!require("tidyverse")) install.packages("tidyverse"); library(tidyverse)

genefilelist <- list.files(path="SARTools", pattern="*.genes.tsv", full.names=T)
genefiles <- lapply(genefilelist, read_tsv)
samplenames <- gsub("SARTools/S2_DRSC_CG8144_", "", genefilelist)
samplenames <- gsub("SARTools/S2_DRSC_","", samplenames)
samplenames <- gsub(".genes.tsv", "", samplenames)
samplenames <- gsub("-","_", samplenames) # DEBrowser doesn't like -
samplenames


genefiles
genefiles %>%
  bind_cols() %>%
  select(gene_id, starts_with("expected_count")) -> genetable
colnames(genetable)[2:7] <- as.list(samplenames) 


head(genetable)
write_tsv(genetable, path="genetable.tsv")

transcriptfilelist <- list.files(path="SARTools", pattern="*.transcripts.tsv", full.names=T)
transcriptfiles <- lapply(transcriptfilelist, read_tsv)

transcriptfiles %>%
  bind_cols() %>%
  select(transcript_id, starts_with("expected_count")) -> transcripttable
colnames(transcripttable)[2:7] <- as.list(samplenames)

head(transcripttable)
str(transcripttable)
write_tsv(transcripttable, path="transcripttable.tsv")

## Also need to reformat the target.txt file to match the sample names
transcripts_target <- read_delim("SARTools/transcripts.target.txt", 
                                 "\t", escape_double = FALSE, trim_ws = TRUE)
transcripts_target
colnames(transcripttable) <- gsub("-","_", colnames(transcripttable))
colnames(transcripttable)
transcripts_target$label[1:3] <- colnames(transcripttable)[5:7]
transcripts_target$label[4:6] <- colnames(transcripttable)[2:4]
metadata <- select(transcripts_target, c(label, batch, Treatment))
colnames(metadata) <- c("sample","batch","condition")
write_tsv(metadata, path="metadata.tsv")
metadata

colnames(transcripttable) %in% metadata$sample


# 4. Start DEBrowser

startDEBrowser()

# 5. Data Exploration with DE Browser

#1 Load the Count Data File and the Metadata File
#2 Filter the data using CPM, CPM<1, in at least 3 samples (half of the samples)
#3 Batch correct the data using TMM normalization, Combat correction method, condition as Treatment, batch as Batch
#4 Visualize the PCA plot by changing Color field to "condition", and Shape field to "batch"
#5 Go to DE Analysis and Add New Comparison
#   Set the Condition 1 samples to the Untreated and Condition 2 to the RNAi samples
#   Chose the appropriate DE Method, and leave the parameters on the default settings
#   Go to Main Plots and explore the MA and Volcano plots

# 6. Confirm that RNAi experiment worked 

#1 Load in the gene results and metadata
#2 Filter and batch correct as above
#3 Run the appropriate DE Analysis 
#4 Go to the Tables and sort by log10padjust search for FBgn0261552 - this is the *pasilla* gene
