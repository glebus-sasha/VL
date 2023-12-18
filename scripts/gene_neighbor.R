library(rtracklayer)

make_gene_neighbor_list <- function(df, gene_name, delta = 10) {
  # функция выбирает последний элемент с заданным геном и возвращяет списоок соседних генов
  # input: df - dataframe созданный из gtf
  #        gene_name 
  #        delta - число соседей в кажду сторону
  # output: gene_l
  gene_l <- df$gene
  gene_l <- gene_l[is.na(gene_l)==F]
  if (length(grep(gene_name, gene_l))==0){
    gene_l <- vector("list", length = 21)
    gene_l[1:length(gene_l)] <- NA
    return(gene_l)
  }
  else{
    gene_l <- unique(gene_l)
    up <- max(grep(gene_name, gene_l)) + delta
    down <- max(grep(gene_name, gene_l)) - delta
    return(gene_l[down:up])
  }
}


make_gene_neighbor_list_with_products <- function(df, gene_name, delta = 10) {
  # функция выбирает последний элемент с заданным геном и возвращяет списоок соседних генов и продуктов
  # input: df - dataframe созданный из gtf
  #        gene_name 
  #        delta - число соседей в кажду сторону
  # output: gene_l
  gene_l <- df$gene
  product_l <- df$product
  g_p_list <- as.list(paste(gene_l, product_l, sep = " |"))
  if (length(grep(gene_name, g_p_list))==0){
    g_p_list <- vector("list", length = 21)
    g_p_list[1:length(g_p_list)] <- NA
    return(g_p_list)
  }
  else{
    g_p_list <- unique(g_p_list)
    up <- max(grep(gene_name, g_p_list)) + delta
    down <- max(grep(gene_name, g_p_list)) - delta
    return(g_p_list[down:up])
  }
}

make_func <- function(path, gene_name, func = make_gene_neighbor_list){
  # функция ищет аннатированные гены в окресности запрашиваемого в gtf, по всем штаммав в папке
  # input:   path
  #          gene_name
  #          func - function for making list
  # output:  rez 
  files <- list.files(path, pattern = ".gtf", full.names=TRUE)
  strain <- list.files(path, pattern = ".gtf")
  rez <- data.frame(matrix(ncol = 21, nrow = 0))
  i <- 1
  for (f in files) {
    df <- import(f)
    s <- strain[i]
    rez[nrow(rez) + 1,] <- c(s,func(df, gene_name))
    i <- i + 1
  }
  return(rez)
}

rez <- make_func(path = "C:/VL/data/GTF_files/", gene_name = "metG", func = make_gene_neighbor_list_with_products)
#write.table(rez, sep="\t", file = "C:/VL_Cobetia/n_gene_products.tbl", row.names = F)

