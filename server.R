# server.R

#==============================================================================

# geojson must be in lng/lat. use Mapbox to convert
geoData <- RJSONIO::fromJSON("gis/mp2014-subzone.min.json") 

# load map markers data i.e. cat killings in yishun
data <- read.csv("cat.csv") 

function(input, output, session) {
    
    output$map <- renderLeaflet({
        
        # prep map markers
        points <- cbind(data$longitude, data$latitude)  
        
        # initialise map and center on SG
        leaflet(data) %>% setView(lng = 103.804402, lat = 1.350411, zoom = 11) %>%
            
            # map tile styling 
            addProviderTiles("MtbMap") %>%
            addProviderTiles("Stamen.TonerLines",
                             options = providerTileOptions(opacity = 0.35)) %>%
            addProviderTiles("Stamen.TonerLabels") %>%
            
            # add choropleth overlay
            addGeoJSON(geoData, weight = 2, color = "#444444", fill = FALSE) %>%
            
            # plot map markers. alternatively use circles.
            addMarkers(
                clusterOptions = markerClusterOptions()
            )
        
    })
    
    output$table <- DT::renderDataTable({
        
        datatable(data, options = list(pageLength = 10),
                  extensions = 'Responsive')
        
    })
        
}