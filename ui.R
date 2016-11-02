# ui.R

# https://rstudio.github.io/leaflet/

# use control+f3 to debug reactivity
options(shiny.reactlog=TRUE) 

#==============================================================================

library(shiny)
library(leaflet)
library(RJSONIO)
library(DT)

fluidPage(theme = "paper.css",
    
    titlePanel("GeoExplorer"),
            
        tags$style(type="text/css", "
                   #loadmessage {
                   position: fixed;
                   top: 0px;
                   left: 0px;
                   width: 100%;
                   text-align: center;
                   font-weight: bold;
                   font-size: 100%;
                   color: #000000;
                   background-color: #d3d3d3;
                   z-index: 105;
                   }
                   "),
    
        mainPanel(
            conditionalPanel(condition="$('html').hasClass('shiny-busy')",
                             tags$div("Loading...",id="loadmessage")),
            tabsetPanel(
                tabPanel("Interactive Map", leafletOutput("map")),
                tabPanel("View Data", DT::dataTableOutput("table"))
            )
        ),

    title = "GeoExplorer"
    
)

