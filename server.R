server <- (function(input, output) {
  
 ## Reactive dataframe based on user input selection
  
  occd<-reactive ({
        occ %>% filter(license %in% input$s2) %>%  filter(scientificName %in% input$s3)  %>%
        filter(basisOfRecord %in% input$s4) %>% filter(eventDate %in% input$s5)
      
    })
  
  # Output Table
  output$data_table <- renderDataTable({
    occd()  %>% select(scientificName,country,longitudeDecimal,latitudeDecimal,eventDate,basisOfRecord,occurrenceID,
                    kingdom,higherClassification,individualCount,family,taxonRank)  %>% 
      datatable(filter = 'top',  extensions = 'Buttons',options = list(
        scrollX = TRUE,
        pageLength = 25, autoWidth = TRUE,
        dom = 'Bfrtip',
        buttons = c('copy', 'csv', 'excel','pdf')
      ))
  })
  

  
  
})  # End of Server function

