library(dplyr)
library(leaflet)

df <- read.csv("otagomap.csv")
colnames(df)[1] <- "farm"

df$type <- LETTERS[df$region]

# If you want to set your own colors manually:
pal <- colorFactor(
  palette = c('red', 'blue', 'green'),
  domain = df$type
)

## OR automatically generate color palettes
pal <- colorFactor(
  palette = 'Dark2',
  domain = df$type
)

# Create leaflet map
leaflet(df) %>%
  addTiles() %>%
  addCircles(lng = ~longitude, 
             lat = ~latitude, 
             color = ~pal(type), 
             radius = 3000)





