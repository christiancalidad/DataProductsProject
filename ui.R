library(shiny)
library(plotly)

DatosDia <- read.delim("Base_Diaria.csv", header=TRUE, sep=",", encoding = "UTF-8")

navbarPage("Car Accidents in Medellin City",
                   tabPanel("Documentation",
                            h2("Guide"),
                            p("Trough this application you can analyze behavor of automovilistic accidents in Medellín City - Colombia,"),
                              p("To use it, please follow the next steps: "), 
                              p("- Select the date range from January 2014 to December 2017."),
                              p("- Select the time scale you want to visualice"),
                              p("- Click on Refresh Button")
                   ),
                 tabPanel("Plot",
                          fluidPage(dateInput(inputId = "Fecha1", "Visualice From", value = "2014-01-01", min = "2014-01-01", max = "2017-12-30", format = "yyyy-mm-dd", language = "es"),dateInput(inputId = "Fecha2", "Visualice to", value = "2017-12-31", min = "2014-01-02", max = "2017-12-31", format = "yyyy-mm-dd", language = "es"),
                            selectInput(inputId = "Periodo", "Scale", c("Daily"="Diario", "Weekly"="Semanal","Monthly"="Mensual")),
                            submitButton('Refresh'), plotlyOutput("SerieDiaria") )
                  
      
                   )
                 )
