
ui <- dashboardPage(
  skin = "black",
  title = "covid19",
  
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
            choices = unique(occ$license)
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
            choices = unique(occ$scientificName)
          )
        )
      ),
      menuItem(
        "Basis of Record",
        tabName = "Basis of Record",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s4", label = "",
            choices = "dummy"
          )
          
        )
      ),
      menuItem(
        "Year",
        tabName = "Year",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s5", label = "",
            choices = "dummy"
          )
        )
      ),
      menuItem(
        "Month",
        tabName = "Month",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s6", label = "",
            choices = "dummy"
          )
        )
      ),
      menuItem(
        "Location",
        tabName = "Location",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s7", label = "",
            choices = "dummy"
          )
        )
      ),
      menuItem(
        "Administrative areas (gadm org)",
        tabName = "Administrative areas (gadm org)",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s8", label = "",
            choices = "dummy"
          )
        )
      ),
      menuItem(
        "Country or Area",
        tabName = "Country or Area",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s9", label = "",
            choices = "dummy"
          )
        )
      ),
      menuItem(
        "Continent",
        tabName = "Continent",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s10", label = "",
            choices = "dummy"
          )
        )
      ),
      menuItem(
        "Dataset",
        tabName = "Dataset",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s11", label = "",
            choices = "dummy"
          )
        )
      ),
      menuItem(
        "Publisher",
        tabName = "Publisher",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s12", label = "",
            choices = "dummy"
          )
        )
      ),
      menuItem(
        "IUCN Global Red List History",
        tabName = "IUCN Global Red List History",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s13", label = "",
            choices = "dummy"
          )
        )
      ),
      menuItem(
        "Issues and Flags",
        tabName = "Issues and Flags",
        icon = icon("filter"), 
        div(
          selectInput(
            inputId = "s13", label = "",
            choices = "dummy"
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
                verbatimTextOutput("a"),
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
              withSpinner(
                verbatimTextOutput("c"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
            ),
            tabPanel(
              useShinyjs(),
              title = "Download",
              withSpinner(
                verbatimTextOutput("d"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
            )
          )
        )
      )
    )),
    
    
  )
)