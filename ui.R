# ui.R

# https://rstudio.github.io/leaflet/

# use control+f3 to debug reactivity
options(shiny.reactlog=TRUE) 

#==============================================================================

library(shiny)
library(leaflet)
library(RJSONIO)
library(DT)

fluidPage(theme = "darkly.css", # paper.css
    
    titlePanel("GeoExplorer"),
    
    sidebarLayout(
        sidebarPanel(
            h5("TODO:"),
            tags$ul(
                tags$li("Geocode assets"), 
                tags$li("Shade choropleth"), 
                tags$li("Style/size map markers"),
                tags$li("User interactivity"),
                tags$li("Reduce lag. Probably don't have to use subzone.")
            )
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Interactive Map", leafletOutput("map")),
                tabPanel("View Data", DT::dataTableOutput("table"))
            )
        )
    ), 
    title = "GeoExplorer"
    
)

