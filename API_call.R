#function that will create an API call when the series ID is known

require(RCurl)
API_call<-function(series_ID, key){
#API Key

#key <- scan("/Users/jim/Documents/R/private_EIA_API_key.txt", what = "character")
#series_ID <- "371"

#Create API url 
api<-paste("http://api.eia.gov/category/?api_key=",key,"&category_id=",series_ID, sep="")

#Get data via RCurl
data_json<-getURL(api, followlocation = TRUE)

return(data_json)
}