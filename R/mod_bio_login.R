#' R Module for the Biodiversity Login page.
#'
#' @description
#' R Module for the Biodiversity Login page .
#'
#' @import shiny
#' @rdname mod_bio_login

mod_bio_login_ui <- function(id) {
  ns <- NS(id)
  tabPanel(
    useShinyjs(),
    title = "Download Data",
    includeHTML("www/login.htm")
  )
}
