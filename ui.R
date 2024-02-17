
#### -----------------------------Header---------------------####
# Program Name : ui.r
# Program Purpose : To make shiny User Interface 
# Created By : Deepak Saini
# Created Date : Oct-2020
#
#

#-----------------------------------------------------------------


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
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "License",
        tabName = "License",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "Scientific Name",
        tabName = "Scientific Name",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "Basis of Record",
        tabName = "Basis of Record",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "Year",
        tabName = "Year",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "Month",
        tabName = "Month",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "Location",
        tabName = "Location",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "Administrative areas (gadm org)",
        tabName = "Administrative areas (gadm org)",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "Country or Area",
        tabName = "Country or Area",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "Continent",
        tabName = "Continent",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "Dataset",
        tabName = "Dataset",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "Publisher",
        tabName = "Publisher",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "IUCN Global Red List History",
        tabName = "IUCN Global Red List History",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          )
        )
      ),
      menuItem(
        "Issues and Flags",
        tabName = "Issues and Flags",
        icon = icon("paint-roller"), br(),
        div(
          div(
            selectInput(
              inputId = "status", label = "Occurence Status",
              choices = "dummy"
            )
          ),
          bsButton(
            "p1",
            label = "Everything",
            icon = icon("hand-point-right"),
            style = "success"
          ), br(),
          div(
            bsButton(
              "p2",
              label = "Present",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
          ),
          div(
            bsButton(
              "p3",
              label = "Absent",
              icon = icon("hand-point-right"),
              style = "success"
            ), br()
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
              
              div(column(
                width = 12, div(valueBoxOutput("vbox1")),
                div(valueBoxOutput("vbox2"))
              )),
              div(column(
                width = 12, div(valueBoxOutput("vbox3")),
                div(valueBoxOutput("vbox4"))
              ))
            ),
            
            tabPanel(
              useShinyjs(),
              title = "Gallery",
              withSpinner(
                dataTableOutput("data_table"),
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
                leafletOutput("plotmap_output", height = 600),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
            ),
            tabPanel(
              useShinyjs(),
              title = "Metrices",
              withSpinner(
                leafletOutput("plotmap_output", height = 600),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
            ),
            tabPanel(
              useShinyjs(),
              title = "Download",
              withSpinner(
                leafletOutput("plotmap_output", height = 600),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
            )
          )
        )
      )
    )),
    
    hidden(div(id = "p1div", fluidRow(
      div(
        column(
          width = 12,
          tabBox(
            width = NULL,
            height = 400,
            tabPanel(
              useShinyjs(),
              title = "Forecasting Confirmed Cases (14 Days)",
              withSpinner(
                plotlyOutput("plotp1_output", height = "100%", width = "100%"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
            )
          )
        )
      )
    ))),
    
    hidden(div(id = "p2div", fluidRow(
      div(
        column(
          width = 12,
          tabBox(
            width = NULL,
            height = 400,
            tabPanel(
              useShinyjs(),
              title = "Forecasting Death Cases (14 Days)",
              withSpinner(
                plotlyOutput("plotp2_output", height = "100%", width = "100%"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
            )
          )
        )
      )
    ))) , 
    
    hidden(div(id = "summarydiv", fluidRow(
      div(
        column(
          width = 12,
          tabBox(
            width = NULL,
            height = 400,
            tabPanel(
              useShinyjs(),
              title = "Daily Cumulative Cases",
              withSpinner(
                plotlyOutput("plotsummary_output", height = "100%", width = "100%"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
            )
          )
        )
      )
    ))) ,
    
    hidden(div(id = "comparisondiv", fluidRow(
      div(
        column(
          width = 12,
          tabBox(
            width = NULL,
            height = 400,
            tabPanel(
              useShinyjs(),
              title = "Compare Top Ten States by Cases",
              withSpinner(
                plotlyOutput("plotcomparison_output", height = "100%", width = "100%"),
                type = 4,
                color = "#d33724",
                size = 0.7
              )
            )
          )
        )
      )
    )))
    
  )
)