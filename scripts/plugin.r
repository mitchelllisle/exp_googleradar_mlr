library(httr)
library(jsonlite)

google_radar <- function(lat, lng, radius, type, key){
req <- GET(paste("https://maps.googleapis.com/maps/api/place/radarsearch/json?location=",lat,",",lng,"&radius=",radius,"&type=",type,"&key=",key, sep = ""))
req_df <- fromJSON(content(req, type = "text", encoding = "UTF-8"))
data.frame(cbind(req_df$results$place_id, req_df$results$geometry$location$lat, req_df$results$geometry$location$lng))
}
