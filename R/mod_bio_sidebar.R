mod_bio_sidebar_ui <- function(id) {
  ns <- NS(id)



  div(
    width = 300,
    div(class = "inlay", style = "height:15px;width:100%;background-color:#ecf0f5"),
    div(id = "sidebar", sidebarMenu(
      div(
        id = "sidebar_button",
        bsButton(
          inputId = ns("reset"),
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
            inputId = ns("s2"), label = "",
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
            inputId = ns("s3"), label = "",
            choices = unique(occ$`Scientific Name`),
            selected = unique(occ$`Scientific Name`),
            multiple = TRUE
          )
        )
      ),
      menuItem(
        "Basis of Record",
        tabName = "Basis of Record",
        icon = icon("filter"),
        div(
          selectInput(
            inputId = ns("s4"), label = "",
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
            inputId = ns("s5"), label = "",
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
            inputId = ns("s6"), label = "Select Latitude",
            min = min(occ$`Latitude Decimal`), max = max(occ$`Latitude Decimal`), value = max(occ$`Latitude Decimal`)
          ),
          sliderInput(
            inputId = ns("s61"), label = "Select Longitude",
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
            inputId = ns("s7"), label = "Administrative areas",
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
            inputId = ns("s8"), label = "",
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
            inputId = ns("s9"), label = "",
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
            inputId = ns("s10"), label = "",
            choices = unique(occ$`Rights Holder`),
            selected = unique(occ$`Rights Holder`),
            multiple = TRUE
          )
        )
      )
    ))
  )
}
