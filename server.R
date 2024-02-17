server <- (function(input, output) {
  
 # Table output. 
  
  output$data_table <- renderDataTable({
    occ  %>% select(scientificName,country,longitudeDecimal,latitudeDecimal,eventDate,basisOfRecord,occurrenceID,
                    kingdom,higherClassification,individualCount,family,taxonRank)  %>% 
      datatable(filter = 'top',  extensions = 'Buttons',options = list(
      scrollX = TRUE,
      pageLength = 25, autoWidth = TRUE,
      dom = 'Bfrtip',
      buttons = c('copy', 'csv', 'excel','pdf')
    ))
  })
  
  observe({
    if(is.null(input$s3)) return(NULL)
    if (input$s3 > 0)
    {
      print(campaigns_list)
      updateCheckboxGroupInput(session,"campaigns","Choose campaign(s):",choices=campaigns_list,selected=campaigns_list)
    }
  })
  
})  # End of Server function

