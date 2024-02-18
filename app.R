library(shiny)
source("global.R", local = T)
source("R/mod_bio_map.R")
source("R/mod_bio_sidebar.R")

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
    mod_bio_sidebar_ui("bio_table_ui_1")
  ),
  dashboardBody(
    tags$head(
      tags$link(
        rel = "stylesheet",
        type = "text/css",
        href = "bio.css"
      )
    ), tabBox(
      width = NULL,
      height = 400,
      mod_bio_table_ui("bio_table_ui_1"),
      mod_bio_map_ui("bio_table_ui_1")
    )
  )
)




server <- function(input, output, session) {
  mod_bio_table_server("bio_table_ui_1")
  mod_bio_map_server("bio_table_ui_1")
}

shinyApp(ui = ui, server = server)
