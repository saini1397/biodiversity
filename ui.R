
ui <- dashboardPage(
  skin = "black",
  title = "Biodiversity",
  
  dashboardHeader(
    title = span("Biodiversity"),
    titleWidth = 300,
    tags$li(
      a(
        strong("GitHub Codes !!"),
        height = 40,
        href = "https://github.com/saini1397/biodiversity",
        title = "",
        target = "_blank"
      ),
      class = "dropdown"
    )
  ),
  
  dashboardSidebar(
    width = 300,
    div(class = "inlay", style = "height:15px;width:100%;background-color:#ecf0f5"),
    div(id="sidebar",sidebarMenu(
      div(
        id = "sidebar_button",
        bsButton(
          inputId = "reset",
          label = "Reset",
          icon = icon("home"),
          style = "danger"
        )
      ),
      div(class = "inlay", style = "height:15px;width:100%;background-color:#ecf0f5"),
      menuItem(
        "License",
        tabName = "License",
        icon = icon("filter"),
        div(
          checkboxGroupInput(
            inputId = "s2", label = "",
            choices = unique(occ$License),
            selected = unique(occ$License)
          )
        )
      ),
      menuItem(
        "Scientific Name",
        tabName = "Scientific Name",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s3", label = "",
            choices = unique(occ$`Scientific Name`),
            selected = unique(occ$`Scientific Name`),
            multiple = TRUE
          ))
      ),
      menuItem(
        "Basis of Record",
        tabName = "Basis of Record",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s4", label = "",
            choices = unique(occ$`Basis Of Record`),
            selected = unique(occ$`Basis Of Record`),
            multiple = TRUE
          )
          
        )
      ),
      menuItem(
        "Year",
        tabName = "Year",
        icon = icon("filter"), 
        div(
          dateRangeInput(
            inputId="s5", label = "",
            start = min(occ$`Event Date`),
            end = max(occ$`Event Date`)
          )
        )
      ),
      menuItem(
        "Coordinates",
        tabName = "Coordinates",
        icon = icon("filter"), 
        div(
          sliderInput(
            inputId = "s6", label = "Select Latitude",
            min = min(occ$`Latitude Decimal`), max = max(occ$`Latitude Decimal`), value = max(occ$`Latitude Decimal`)
          ),
          sliderInput(
            inputId = "s61", label = "Select Longitude",
            min = min(occ$`Longitude Decimal`), max = max(occ$`Longitude Decimal`), value = max(occ$`Longitude Decimal`)
          )
        )
      ),
      menuItem(
        "Administrative areas (gadm org)",
        tabName = "Administrative areas (gadm org)",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s7", label = "Administrative areas",
            choices = unique(occ$`Administrative Area`),
            selected = unique(occ$`Administrative Area`),
            multiple = TRUE
          )
        )
      ),
      menuItem(
        "Country or Area",
        tabName = "Country or Area",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s8", label = "",
            choices = unique(occ$Country),
            selected = unique(occ$Country),
            multiple = TRUE
          )
        )
      ),
      menuItem(
        "Continent",
        tabName = "Continent",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s9", label = "",
            choices = unique(occ$Continent),
            selected = unique(occ$Continent),
            multiple = TRUE
          )
        )
      ),
      menuItem(
        "Publisher",
        tabName = "Publisher",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s10", label = "",
            choices = unique(occ$`Rights Holder`),
            selected = unique(occ$`Rights Holder`),
            multiple = TRUE
          )
        )
      )
    ))
  ),
  
  dashboardBody(
    tags$head(
      tags$link(
        rel = "stylesheet",
        type = "text/css",
        href = "bio.css"
      )
    ),
    
    
    
    div(id = "home1", fluidRow(
      div(
        column(
          width = 12,
          tabBox(
            width = NULL,
            height = 400,
            tabPanel(
              useShinyjs(),
              title = "Table",
              div(
                div(column(width=4,
                                                                                 
                                                                                 shinyWidgets::pickerInput(
                                                                                   inputId = "colselect", label = "Select Columns:",
                                                                                   choices = c("Scientific Name","Country","Coordinates"),
                                                                                   multiple = TRUE,
                                                                                   selected=NULL,
                                                                                   options = shinyWidgets::pickerOptions(
                                                                                     actionsBox = TRUE,
                                                                                     title = "Select Columns to Display",
                                                                                   ),width = "100%"
                                                                                 )
                                                                                 
                                                                                 )),br(),br(),br(),
                div(
              withSpinner(
                dataTableOutput("data_table"),
                type = 4,
                color = "#d33724",
                size = 0.7
              ))
              )
            ),
            tabPanel(
              useShinyjs(),
              title = "Map",
              withSpinner(
                leafletOutput("plotmap_output", height = 600),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
            ),
            tabPanel(
              useShinyjs(),
              title = "Taxonomy",
              br(),div(style="border:1px solid black;","TAXONOMIC DISTRIBUTION OF OCCURRENCES",withSpinner(
                highchartOutput("tax1", height = "100%", width = "90%"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
              ),
              
              br(),br(),br(),br(),div(style="border:1px solid black;","TAXONOMIC DISTRIBUTION TABLE OF OCCURRENCES",
                                      div( column(width=4,br(),"Select Grouping Category from the Dropdown: ") ,column(width=4, selectInput(
                                        inputId = "tax3in", label = "",
                                        choices = c("Scientific Name","Kingdom","Class","Family","Species","Overall"),
                                        selected = "Overall"
                                      ))  ),
                                      div(withSpinner(
                dataTableOutput("tax2", height = "100%", width = "90%"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )))
            ),
            tabPanel(
              useShinyjs(),
              title = "Metrices",
              br(),div(style="border:1px solid black;","Number of Occurences by Month",withSpinner(
                plotlyOutput("bar1", height = "100%", width = "90%"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )),br(),br(),br(),br(),div(style="border:1px solid black;","Number of Occurences per Basis of Record",withSpinner(
                plotlyOutput("pie1", height = "100%", width = "90%"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )),br(),br(),br(),br(),br(),div(style="border:1px solid black;","Number of Occurences by Year",withSpinner(
                plotlyOutput("line1", height = "100%", width = "90%"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )),br(),br(),br(),br(),br(),div(style="border:1px solid black;","Number of Occurences by License",withSpinner(
                plotlyOutput("bar2", height = "100%", width = "90%"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )),br(),br(),br(),br(),br(),div(style="border:1px solid black;","Total Number of Occurences by Dataset",withSpinner(
                plotlyOutput("bar3", height = "100%", width = "90%"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )),br(),
              
            )
          )
        )
      )
    )),
    
    
  )
)