renv::init()

project_setup <- function(){
  folders <- c('data', 'results', 'figures', 'scripts')
  mainDir <- getwd()
  sapply(folders, function(subDir){
    dir.create(file.path(mainDir, subDir))
  })
}

project_setup()

install.packages("rmarkdown")
install.packages("markdown")
install.packages("pacman")
install.packages("htmlwidgets")
install.packages("shiny")
install.packages("stringi")
install.packages("stringr")
install.packages("formatR")
install.packages("tidyverse")
install.packages("DT")
install.packages("ggrepel")
install.packages("BiocManager")
BiocManager::install("DESeq2")
tinytex::install_tinytex()
.libPaths()
renv::snapshot() 

counts <- read.delim(params$"data/metadata.txt")
metadata <- read.delim(params$"data/counts.txt")
