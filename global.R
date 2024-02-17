#List All Libraries needed
my_packages = c("testthat","shiny","tidyverse","sqldf","shinydashboard","leaflet","plotly","shinythemes","shinyBS","DT","shinycssloaders","shinyjs","corrplot","leafpop","shinyWidgets","stringr","foreign")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, dependencies = TRUE)
  }
}

invisible(sapply(my_packages, install_if_missing))

# (.packages()) - To check the loaded libraries.
# Load All Required Libraries
lapply(my_packages, require, character.only = TRUE)

# Get the data
# source("R/getdata.R")