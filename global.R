# List All Libraries needed
my_packages <- c("labelled", "highcharter", "htmlwidgets", "expss", "purrr", "DT", "testthat", "shiny", "tidyverse", "sqldf", "leaflet", "shinydashboard", "plotly", "shinythemes", "shinyBS", "DT", "shinycssloaders", "shinyjs", "corrplot", "shinyWidgets", "stringr", "foreign")

install_if_missing <- function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, dependencies = TRUE)
  }
}

invisible(sapply(my_packages, install_if_missing))

# (.packages()) - To check the loaded libraries.
# Load All Required Libraries
lapply(my_packages, require, character.only = TRUE)

# Get the data

occ <- readRDS("occurence.rds") %>% mutate(
  Coordinates = paste0(latitudeDecimal, "N, ", longitudeDecimal, "E"),
  adminarea = paste0(country, " - ", countryCode),
  Class = if_else(grepl("|", higherClassification), str_to_title(word(family, 1, sep = "\\|")), higherClassification),
  family = if_else(grepl("_", family), str_to_title(word(family, 2, sep = "\\_")), family),
  taxonRank = if_else(is.na(taxonRank), "Unknown", taxonRank),
  kingdom = if_else(is.na(kingdom), "Unknown", kingdom),
  Class = if_else(is.na(Class), "Unknown", Class),
  scientificName = if_else(is.na(scientificName), "Unknown", scientificName),
  vernacularName = if_else(is.na(vernacularName), "Unknown", vernacularName),
  family = if_else(is.na(family), "Unknown", family),
  longitudeDecimal = if_else(is.na(longitudeDecimal), 0, longitudeDecimal),
  latitudeDecimal = if_else(is.na(latitudeDecimal), 0, latitudeDecimal)
)



setnames(occ, c(
  "Identifier",
  "Occurrence Identifier",
  "Catalog Number",
  "Basis Of Record",
  "Collection Code",
  "Scientific Name",
  "Taxon Rank",
  "Kingdom",
  "Family",
  "Higher Classification",
  "Vernacular Name",
  "Previous Identifications",
  "Individual Count",
  "Life Stage",
  "Sex",
  "Longitude Decimal",
  "Latitude Decimal",
  "Geodetic Datum",
  "Data Generalizations",
  "Coordinate Uncertainty In Meters",
  "Continent",
  "Country",
  "Country Code",
  "State Province",
  "Locality",
  "Habitat",
  "Recorded By",
  "Event Identifier",
  "Event Date",
  "Event Time",
  "Sampling Protocol",
  "Behavior",
  "Associated Taxacity",
  "References",
  "Rights Holder",
  "License",
  "Modified Date",
  "Coordinates",
  "Administrative Area",
  "Class"
))
