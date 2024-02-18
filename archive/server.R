server <- (function(input, output,session) {
  
 ## Reactive dataframe based on user input selection
  
  occd<-reactive ({
        occ %>% filter(License %in% input$s2) %>%  filter(`Scientific Name` %in% input$s3)  %>%
        filter(`Basis Of Record` %in% input$s4) %>% filter(`Event Date` %in% input$s5) %>% 
        filter( between(`Latitude Decimal`, min(`Latitude Decimal`), input$s6))  %>% 
        filter( between(`Longitude Decimal`, min(`Longitude Decimal`), input$s61)) %>% 
        filter(`Administrative Area` %in% input$s7) %>% filter(Country %in% input$s8) %>% 
        filter(Continent %in% input$s9)  %>% filter(`Rights Holder` %in% input$s10)
       
    })
 
  
  observeEvent(input$colselect, {
    
  # Output Table
  output$data_table <- renderDataTable({
    occd()  %>% select(one_of(input$colselect))  %>% 
      datatable(filter = 'top',  extensions = 'Buttons',options = list(
        scrollX = TRUE,
        pageLength = 25, autoWidth = FALSE,
        dom = 'Bfrtip',
        buttons = c('copy', 'csv', 'excel','pdf')
      )) 
  })
  
})
  
  # Leaflet Map Output 
  
  
 
  
  
  # For metrices
  
  output$bar1 <- renderPlotly({
    
    bar <- occd() %>% 
      mutate(month=format(`Event Date` ,format="%B") )
    
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
    
    bar2 <- sqldf("select distinct License,count(*) as totalocc from bar2
              group by License
              order by License")
    
    
    plotly::plot_ly(
      data = bar2,
      x = ~License,
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
    
    bar3 <- sqldf("select distinct `Collection Code`,count(*) as totalocc from bar3
              group by `Collection Code`
              order by `Collection Code`")
    
    
    plotly::plot_ly(
      data = bar3,
      x = ~`Collection Code`,
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
      group_by(`Basis Of Record`) %>% 
      summarise(totalocc=n()) %>% 
      ungroup()
  
    
    plotly::plot_ly(
      data = pie1,
      labels = ~`Basis Of Record`, 
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
      mutate(year=format(`Event Date`,format="%Y") )
    
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
        group_by(`Scientific Name`) %>% 
        summarise(Occurences=n()) %>% 
        ungroup()  
      
    }
    
    else if (grepl("Kingdom",input$tax3in)){  
      occd()  %>%  
        group_by(Kingdom) %>% 
        summarise(Occurences=n()) %>% 
        ungroup()  
      
    } 
    
    else if (grepl("Class",input$tax3in)){  
      occd()  %>%  
        group_by(Class) %>% 
        summarise(Occurences=n()) %>% 
        ungroup() 
      
    }
    
    else if (grepl("Family",input$tax3in)){  
      occd()  %>%  
        group_by(Family) %>% 
        summarise(Occurences=n()) %>% 
        ungroup() 
      
    }
    else if (grepl("Species",input$tax3in)){  
      occd()  %>%  
        group_by(`Taxon Rank`) %>% 
        summarise(Occurences=n()) %>% 
        ungroup() 
      
    }
    else if (grepl("Overall",input$tax3in)){  
      occd()  %>%  
        group_by(Kingdom,Class,Family,`Scientific Name` ,`Taxon Rank`) %>% 
        summarise(Occurences=n()) %>% 
        ungroup() 
      
    }
    
    
  })
  
  observeEvent(input$tax3in, {
    output$tax2 <- renderDataTable({
      taxt()  %>% 
        datatable(filter = 'top',  extensions = 'Buttons',options = list(
          scrollX = TRUE,
          pageLength = 25, 
          autoWidth = FALSE,
          dom = 'Bfrtip',
          buttons = c('copy', 'csv', 'excel','pdf')
        ))
    })
  })
  
  # End of taxonomy table
  
  
  
  # taxonomy PIE charct with drill down

    output$tax1 <- renderHighchart({
      
      
      #subset columns (not all needed)
      df<-occd() %>%
        select(Kingdom,Class,Family,`Scientific Name`,`Vernacular Name`)
      
      
      by_type<- df %>%
        group_by(Kingdom) %>%
        summarise(occurences = n())
      
      pie_chart<-by_type %>%
        #set up highchart object
        hchart("pie", 
               #mapping for pie chart
               hcaes(x = Kingdom, y = occurences, drilldown=Kingdom), 
               name="Occurences") %>%
               hc_title(text="By Kingdom Type")
      
      
      donut_chart<-pie_chart %>%
        hc_plotOptions(pie = list(innerSize="70%"))
      
      
      by_subtype1<- df %>%
        group_by(Kingdom,Class) %>%
        summarise(occurences = n()) %>%
        #create nested data at parent level 
        group_nest(Kingdom)  %>%
        mutate(
          #id should be set to parent level
          id = Kingdom,
          #type specifies chart type
          type = "column",
          #drilldown data should contain arguments for chart - use purrr to map
          data = purrr::map(data, mutate, name = Class, y  = occurences),
          data = purrr::map(data, list_parse)
        )
      
      drilldown_chart<-donut_chart %>%
        hc_drilldown(
          #map to data
          series = list_parse(by_subtype1),
          allowPointDrilldown = TRUE,
          #set stylings of data labels that offer drill down views
          activeDataLabelStyle = list(
            textDecoration="none",
            color="black"
          )
        ) 
      
      
      final_chart<-drilldown_chart %>%
        #relabel x Axis
        hc_xAxis(title = list(text="Type")) %>%
        #relabel y Axis
        hc_yAxis(title = list(text="# of Occurences")) %>%
        #reorder column charts by y Axis
        hc_plotOptions(column = list(
          dataSorting = list(enabled=TRUE)
        )
        ) %>%
        #customize drilldown & drillup events
        hc_chart(
          events = list(
            drilldown = JS(
              "function(){
               this.title.update({text: 'By Class Sub Type'})
               this.update({
                  xAxis:{visible:true},
                  yAxis:{visible:true}
               })
               }"
            ),
            drillup =  JS("function() {
              this.title.update({text: 'By Kingdom name Type'})
              this.update({
                xAxis:{visible:false},
                yAxis:{visible:false}
               })
             }")
          ))
      
      final_chart
        
    })
    
    
    # Reset on click of Reset Button on the top.
    observeEvent(input$reset, {
      shinyjs::reset("sidebar")
    })
    
    
    observe({
      
      shinyWidgets::updatePickerInput(session, "colselect",
                                      choices = c(names(occd())),
                                      selected = c(names(occd())[names(occd()) %in% c("Scientific Name","Country","Coordinates","Event Date","`Basis Of Record`","`Occurrence Identifier`","Kingdom","Higher Classification","Individual Count","Family","Taxon Rank")]  )   ,
                                      options = shinyWidgets::pickerOptions(
                                        actionsBox = TRUE,
                                        title = "Select Columns to Display",
                                        header = "Select Columns"
                                      ),
                                      choicesOpt = list(
                                        style = rep(("color: black; background: lightgrey; font-weight: bold;"),1000))
      )
      
    })
    
    
    

  
})  # End of Server function

