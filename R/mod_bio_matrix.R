mod_bio_matrix_ui <- function(id) {
  ns <- NS(id)
  tabPanel(
    useShinyjs(),
    title = "Map",
    withSpinner(
      dataTableOutput(ns("plotmap_output")),
      type = 4,
      color = "#d33724",
      size = 0.7
    )
  )
}


mod_bio_matrix_server <- function(id) {
  moduleServer(id=id,module=function(input, output, session) {
    
    
    
    occd <- reactive ({
      occ %>% 
        filter(License %in% input$s2) %>%  filter(`Scientific Name` %in% input$s3)  %>%
        filter(`Basis Of Record` %in% input$s4) %>% filter(`Event Date` %in% input$s5) %>% 
        filter( between(`Latitude Decimal`, min(`Latitude Decimal`), input$s6))  %>% 
        filter( between(`Longitude Decimal`, min(`Longitude Decimal`), input$s61)) %>% 
        filter(`Administrative Area` %in% input$s7) %>% filter(Country %in% input$s8) %>% 
        filter(Continent %in% input$s9)  %>% filter(`Rights Holder` %in% input$s10)
      
    })
    
    p <- reactive({
      # Read data for Map
      occd() %>% 
        datatable(filter = 'top',  extensions = 'Buttons',options = list(
          scrollX = TRUE,
          pageLength = 25, autoWidth = FALSE,
          dom = 'Bfrtip',
          buttons = c('copy', 'csv', 'excel','pdf')
        )) 
      
      
      
    })
    output$plotmap_output <- renderDataTable(p())
    
  })
}