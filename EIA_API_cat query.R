require(RCurl)
require(plyr)
require(jsonlite)

#API Key
key <- scan("/Users/jim/Documents/R/private_EIA_API_key.txt", what = "character")

#Create API url 
api<-paste("http://api.eia.gov/category/?api_key=",key,"&category_id=371", sep="")

#Get data via RCurl
data_json<-getURL(api, followlocation = TRUE)

data_nested <- fromJSON(data_json)
data_flat <- flatten(as.data.frame(data_nested$category$childcategories))
