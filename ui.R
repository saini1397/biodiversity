
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
    sidebarMenu(
      div(
        id = "sidebar_button",
        bsButton(
          inputId = "home",
          label = "Home",
          icon = icon("home"),
          style = "danger"
        )
      ),
      div(class = "inlay", style = "height:15px;width:100%;background-color:#ecf0f5"),
      menuItem(
        "Occurence Status",
        tabName = "Occurence Status",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s1", label = "",
            choices = unique(occ$license)
          )
        )
      ),
      menuItem(
        "License",
        tabName = "License",
        icon = icon("filter"),
        div(
          checkboxGroupInput(
            inputId = "s2", label = "",
            choices = unique(occ$license),
            selected = unique(occ$license)[1:5]
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
            choices = unique(occ$scientificName),
            selected = unique(occ$scientificName)[1:5],
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
            choices = unique(occ$basisOfRecord),
            selected = unique(occ$basisOfRecord)[1:5],
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
            start = min(occ$eventDate),
            end = max(occ$eventDate)
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
            min = min(occ$latitudeDecimal), max = max(occ$latitudeDecimal), value = max(occ$latitudeDecimal)
          ),
          sliderInput(
            inputId = "s61", label = "Select Longitude",
            min = min(occ$longitudeDecimal), max = max(occ$longitudeDecimal), value = max(occ$longitudeDecimal)
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
            choices = unique(occ$adminarea),
            selected = unique(occ$adminarea),
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
            choices = unique(occ$country),
            selected = unique(occ$country),
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
            choices = unique(occ$continent),
            selected = unique(occ$continent),
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
            choices = unique(occ$rightsHolder),
            selected = unique(occ$rightsHolder),
            multiple = TRUE
          )
        )
      )
    )
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
              
              withSpinner(
                dataTableOutput("data_table"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
            ),
            
            tabPanel(
              useShinyjs(),
              title = "Gallery",
              withSpinner(
                verbatimTextOutput("h"),
                type = 4,
                color = "#d33724",
                size = 0.7
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
              withSpinner(
                verbatimTextOutput("b"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
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