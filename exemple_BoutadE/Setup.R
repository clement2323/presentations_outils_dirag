if (environnement == "local"){
    Sys.setenv(no_proxy = "")
    Sys.setenv(https_proxy ="http://proxy-rie.http.insee.fr:8080")
    Sys.setenv(http_proxy ="http://proxy-rie.http.insee.fr:8080")
}

# à mettre dans un setup
devtools::install_github("clement2323/boutade")
library(BoutadE)

devtools::install_github("clement2323/ollamax")
library(ollamax) #??ollamax

# Autres packages
packages <- c(
  "dplyr","data.table","tidyverse","arrow",
  "ggplot2","patchwork","knitr","pbapply",
  "rmdformats","devtools","jsonlite"
)

tmp <- sapply(packages,installer_package)
tmp <- sapply(packages,function(pkg) library(pkg, character.only = TRUE))
