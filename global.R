#List All Libraries needed
my_packages = c("systemfonts","expss","purrr","DT","testthat","shiny","tidyverse","sqldf","leaflet","shinydashboard","plotly","shinythemes","shinyBS","DT","shinycssloaders","shinyjs","corrplot","shinyWidgets","stringr","foreign")

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

occ = readRDS("occurence.rds") %>%  mutate(coordinates=paste0(latitudeDecimal,"N, ",longitudeDecimal,"E"),
                                           adminarea=paste0(country," - ",countryCode),
                                           class=if_else(grepl("|",higherClassification),str_to_title(word(family, 1,sep="\\|")),higherClassification),
                                           family=if_else(grepl("_",family),str_to_title(word(family, 2,sep="\\_")),family),
                                           taxonRank = if_else(is.na(taxonRank), "Unknown", taxonRank),
                                           kingdom = if_else(is.na(kingdom), "Unknown", kingdom),
                                           class = if_else(is.na(class), "Unknown", class),
                                           scientificName = if_else(is.na(scientificName), "Unknown", scientificName),
                                           vernacularName = if_else(is.na(vernacularName), "Unknown", vernacularName),
                                           family = if_else(is.na(family), "Unknown", family)
                                           
)

  
mul = readRDS("multimedia.rds")






