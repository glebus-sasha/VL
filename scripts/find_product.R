if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("GenomicRanges")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("rtracklayer")

library(rtracklayer)
require(plyr)
require(dostats)
library(readr)

files <- list.files("C:/VL_Cobetia/data/NCBI/gtf", pattern = ".gtf", full.names=TRUE)
strain <- list.files("C:/VL_Cobetia/data/NCBI/gtf", pattern = ".gtf")
df  <- data.frame(import(files[1]))
df$strain <- NA
df$i <- NA
rez_df <- df[0,c("i","strain","seqnames", "start", "end", "gene_id", "transcript_id", "product", "protein_id", "gene")]
i <- 1


for (f in files) {
  df  <- data.frame(import(f))
  df2 <- df[grepl("alkaline", df$product),]
  if (length(df2)==0){
    break
  }
  else{
    df3 <- df2[,c("seqnames", "start", "end", "gene_id", "transcript_id", "product", "protein_id", "gene")]
    df3$strain <- strain[i]
    df3$i <- i
    df4 <- subset(df3, (df3$end - df3$start) > 20)
    rez_df <- rbind(rez_df, df4)
    i <- i + 1
  }
}
write.table(rez_df[,c("i","strain","seqnames", "start", "end", "gene_id", "transcript_id", "product", "protein_id", "gene")],
  file = "./find_product_rez.tbl", row.names = F, sep = "\t")

