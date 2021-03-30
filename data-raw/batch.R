library(readr)

files <- list.files("data-raw", pattern = ".zip")

projects <- gsub("PSI_download_| checked|\\.zip", "", files)

p1 <- paste0(projects, ' <- read_tsv("data-raw/', files, '")')

p2 <- paste0("save(", projects, ', file = "data/',projects, '.rda")')

p <- cbind(as.data.frame(p1),as.data.frame(p2))

Rfiles <- paste0("data-raw/", projects, ".R")

lapply(1:33, function(x){
  write.table(p[x,], file = Rfiles[x],
              sep = "\n",
              quote = FALSE,
              row.names = FALSE,
              col.names = FALSE)
})
