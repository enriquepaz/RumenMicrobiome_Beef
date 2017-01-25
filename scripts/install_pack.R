source("http://bioconductor.org/biocLite.R")

ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    biocLite(new.pkg)
  sapply(pkg, require, character.only = TRUE)
}

packages <- c("Heatplus")
ipak(packages)

ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, repos='http://cran.us.r-project.org')
  sapply(pkg, require, character.only = TRUE)
}

packages <- c("rmarkdown", "knitr", "ggplot2", "matrixStats", "plyr", "tidyr", "biom", 
              "gplots", "RColorBrewer", "vegan", "mvtnorm", "modeltools", "coin", "agricolae", "gam", 
              "gamlss", "gbm", "glmnet", "inlinedocs", "logging", "MASS", "nlme", "optparse", 
              "outliers", "penalized", "pscl", "robustbase")
ipak(packages)

devtools::install_github("gavinsimpson/ggvegan")