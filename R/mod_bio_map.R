#' R Module for the Biodiversity Map Tab Panel.
#'
#' @description
#' R Module for the Biodiversity Map Tab Panel .
#'
#' @import shiny
#' @rdname mod_bio_map

mod_bio_map_ui <- function(id) {
  ns <- NS(id)
  tabPanel(
    useShinyjs(),
    title = "Map",
    withSpinner(
      leafletOutput(ns("plotmap_output"), height = 600),
      type = 4,
      color = "#2E8B57",
      size = 0.7
    )
  )
}


mod_bio_map_server <- function(id) {
  moduleServer(id = id, module = function(input, output, session) {
    occd <- reactive({
      occ %>%
        filter(License %in% input$s2) %>%
        filter(`Scientific Name` %in% input$s3) %>%
        filter(`Basis Of Record` %in% input$s4) %>%
        filter(`Event Date` %in% input$s5) %>%
        filter(between(`Latitude Decimal`, min(`Latitude Decimal`), input$s6)) %>%
        filter(between(`Longitude Decimal`, min(`Longitude Decimal`), input$s61)) %>%
        filter(`Administrative Area` %in% input$s7) %>%
        filter(Country %in% input$s8) %>%
        filter(Continent %in% input$s9) %>%
        filter(`Rights Holder` %in% input$s10)
    })

    # Leaflet Map Output

    output$plotmap_output <- renderLeaflet({
      # Read data for Map
      map <- occd() %>%
        mutate(Long = `Longitude Decimal`, Lat = `Latitude Decimal`, type = "Occurence") %>%
        group_by(Country, Long, Lat) %>%
        summarise(totalocc = n_distinct(Identifier)) %>%
        ungroup()


      leaflet() %>%
        addTiles() %>%
        addMarkers(data = map, lng = map$Long, lat = map$Lat, popup = map$Country)
    })
  })
}
