getBarcodes <- function(path=".") {
  bc <- unique(gsub("_(Red|Grn).idat", "", list.files(path, patt = "idat")))
  names(bc) <- bc
  bc
}

library(ozymandias)

idatPath <- system.file("extdata", "", package="ozymandiasData", mustWork=TRUE)
targets <- read.csv(paste0(idatPath, "/HM450extras.csv"))
rownames(targets) <- targets$Basename
targets$Sample_Group <- "mixtures"
name <- "extraMixtures"

## process && save to disk:
rgSet <- processIDATs(targets, name, base=idatPath)
processMeth(rgSet, name)
processCNV(rgSet, name)

## what about 27k?
message("need to add a 27k test script too!")
