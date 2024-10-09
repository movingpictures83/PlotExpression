### R code from vignette source 'GOexpress-UsersGuide.Rnw'

###################################################
### code chunk number 5: GOexpress-UsersGuide.Rnw:201-203
###################################################
library(GOexpress) # load the GOexpress package
set.seed(4543) # set random seed for reproducibility

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {

AlvMac <- readRDS(paste(pfix, parameters["dataset", 2], sep="/"))
BP.5 <- readRDS(paste(pfix, parameters["results", 2], sep="/"))
xvar <- parameters["xvar", 2]

pdf(outputfile)

if ("geneid" %in% rownames(parameters)) {
geneid <- parameters["geneid", 2]
expression_plot(
    gene_id = geneid, result = BP.5, eSet=AlvMac,
    x_var =xvar, title.size=1.5, axis.text.angle=90,
    legend.title.size=10, legend.text.size=10, legend.key.size=15)
}
else {
genesym <- parameters["genesym", 2]
expression_plot_symbol(
    gene_symbol = genesym, result = BP.5, eSet=AlvMac,
    x_var =xvar, title.size=1.5, 
    legend.title.size=10, legend.text.size=10, legend.key.size=15)

}
}
