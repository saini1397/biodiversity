server <- (function(input, output) {
  
 ## Reactive dataframe based on user input selection
  
  occd<-reactive ({
        occ %>% filter(license %in% input$s2) %>%  filter(scientificName %in% input$s3)  %>%
        filter(basisOfRecord %in% input$s4) %>% filter(eventDate %in% input$s5) %>% 
        filter( between(latitudeDecimal, min(latitudeDecimal), input$s6))  %>% 
        filter( between(longitudeDecimal, min(longitudeDecimal), input$s61)) %>% 
        filter(adminarea %in% input$s7) %>% filter(country %in% input$s8) %>% 
        filter(continent %in% input$s9)  %>% filter(rightsHolder %in% input$s10)
    
    
       
    })
  
  # Output Table
  output$data_table <- renderDataTable({
    occd()  %>% select(scientificName,country,coordinates,eventDate,basisOfRecord,occurrenceID,
                    kingdom,higherClassification,individualCount,family,taxonRank)  %>% 
      datatable(filter = 'top',  extensions = 'Buttons',options = list(
        scrollX = TRUE,
        pageLength = 25, autoWidth = TRUE,
        dom = 'Bfrtip',
        buttons = c('copy', 'csv', 'excel','pdf')
      ))
  })
  

  
  # Leaflet Map Output 
  
  
  # Leaflet Map Output 
  
  output$plotmap_output <- renderLeaflet({
    # Read data for Map
    map <- occd() %>% 
      mutate(Long=longitudeDecimal,Lat=latitudeDecimal,type="Occurence") %>% 
      group_by(country,Long,Lat) %>% 
      summarise(totalocc=n_distinct(id)) %>% 
      ungroup()

    
    leaflet() %>%
      addTiles() %>%  # Add default OpenStreetMap map tiles
      addMarkers(data=map,lng=map$Long, lat=map$Lat, popup=map$country) 

  })
  
  
  # For metrices
  
  output$bar1 <- renderPlotly({
    
    bar <- occd() %>% 
      mutate(month=format(eventDate,format="%B") )
    
    bar1 <- sqldf("select distinct month,count(*) as totalocc from bar
              group by month
              order by month")
    
    
    plotly::plot_ly(
      data = bar1,
      x = ~month,
      y = ~totalocc,
      type = "bar",
      marker = list(color = "green")
    ) %>%
      plotly::layout(
        yaxis = list(title = "Total Number of Occurences"),
        xaxis = list(title = "Month"),
        hovermode = "compare",
        margin = list(
          # l = 60,
          # r = 40,
          b = 10,
          t = 10,
          pad = 2
        )
      )
  })
  
  output$bar2 <- renderPlotly({
    
    bar2 <- occd() 
    
    bar2 <- sqldf("select distinct license,count(*) as totalocc from bar2
              group by license
              order by license")
    
    
    plotly::plot_ly(
      data = bar2,
      x = ~license,
      y = ~totalocc,
      type = "bar",
      marker = list(color = "yellow")
    ) %>%
      plotly::layout(
        yaxis = list(title = "Total No of Occurences"),
        xaxis = list(title = "License"),
        hovermode = "compare",
        margin = list(
          # l = 60,
          # r = 40,
          b = 10,
          t = 10,
          pad = 2
        )
      )
  })
  
  output$bar3 <- renderPlotly({
    
    bar3 <- occd()
    
    bar3 <- sqldf("select distinct collectionCode,count(*) as totalocc from bar3
              group by collectionCode
              order by collectionCode")
    
    
    plotly::plot_ly(
      data = bar3,
      x = ~collectionCode,
      y = ~totalocc,
      type = "bar",
      marker = list(color = "red")
    ) %>%
      plotly::layout(
        yaxis = list(title = "Total No of Occurences"),
        xaxis = list(title = "Dataset Type"),
        hovermode = "compare",
        margin = list(
          # l = 60,
          # r = 40,
          b = 10,
          t = 10,
          pad = 2
        )
      )
  })
  
  
  output$pie1 <- renderPlotly({
    
    pie1 <- occd() %>% 
      group_by(basisOfRecord) %>% 
      summarise(totalocc=n()) %>% 
      ungroup()
  
    
    plotly::plot_ly(
      data = pie1,
      labels = ~basisOfRecord, 
      values = ~totalocc,
      type = "pie"
    ) %>%
      plotly::layout(
        xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)
      )
  })
  
  output$line1 <- renderPlotly({
    
    line <- occd() %>% 
      mutate(year=format(eventDate,format="%Y") )
    
    line1 <- sqldf("select distinct year,count(*) as totalocc from line
              group by year
              order by year")
      plot_ly(data = line1) %>%
        plotly::add_trace(
          x = ~year,
          y = ~totalocc,
          type = "scatter",
          mode = "lines+markers"
        ) %>%
        plotly::layout(
          title = "",
          yaxis = list(title = "Total Number of Occurences"),
          xaxis = list(title = "Year"),
          hovermode = "compare"
        )
  
  })
  
  
  
  # Taxonomy table.
  
  
  taxt <- reactive({
    
    if (grepl("Scientific",input$tax3in)){  
      occd()  %>%  
        group_by(scientificName) %>% 
        summarise(Occurences=n()) %>% 
        ungroup()  
      
    }
    
    else if (grepl("Kingdom",input$tax3in)){  
      occd()  %>%  
        group_by(kingdom) %>% 
        summarise(Occurences=n()) %>% 
        ungroup()  
      
    } 
    
    else if (grepl("Class",input$tax3in)){  
      occd()  %>%  
        group_by(class) %>% 
        summarise(Occurences=n()) %>% 
        ungroup() 
      
    }
    
    else if (grepl("Family",input$tax3in)){  
      occd()  %>%  
        group_by(family) %>% 
        summarise(Occurences=n()) %>% 
        ungroup() 
      
    }
    else if (grepl("Species",input$tax3in)){  
      occd()  %>%  
        group_by(taxonRank) %>% 
        summarise(Occurences=n()) %>% 
        ungroup() 
      
    }
    else if (grepl("Overall",input$tax3in)){  
      occd()  %>%  
        group_by(scientificName,kingdom,class,family,taxonRank) %>% 
        summarise(Occurences=n()) %>% 
        ungroup() 
      
    }
    
    
  })
  
  observeEvent(input$tax3in, {
    output$tax3 <- renderDataTable({
      taxt()  %>% 
        datatable(filter = 'top',  extensions = 'Buttons',options = list(
          scrollX = TRUE,
          pageLength = 25, autoWidth = TRUE,
          dom = 'Bfrtip',
          buttons = c('copy', 'csv', 'excel','pdf')
        ))
    })
  })
  
  
})  # End of Server function

