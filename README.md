# Biodiversity Application

<!-- badges: start -->

<!-- badges: end -->

The goal of Biodiversity Application is to produce a Biodiversity Analysis Dashboard using moduler framework. The 
Data which has been used is available in a .csv file however I have created a .RDS format and kept in project folder to 
avoid reimport of CSV.

## Access

The {Biodiversity Application} application is deployed to shinyapps.io. Link to Application is provided below.

``` r
https://cdiscdata.shinyapps.io/biodiversity/
```

``` r

```

The {Biodiversity Application} package could be accessed locally by cloning the [GitHub repository](https://github.com/saini1397/ installing locally.

## Steps to Run locally by downloading codes from Github Repository

You can also run This Biodiversity application loaclly by downloading from Gitrepo (link given above):

-   navigate to the root directory of the `{GitHub}` package
-   select and open app.R file
-   Run app.R


# General Work Process

## Packages Used

-   I have used `shiny`, `usethis`, `tidyverse` packages for dashboard development.
-   Few testcase have been written to test the functions. Test Cases are available in `{testthat folder}`
-   Modules has been created for UI and Server and all modules are called from app.R file.
-   Functions has been written and tested using testthat.
-   Used CSS for styling of Buttons etc.
-   All required packages are called from global.R file.
