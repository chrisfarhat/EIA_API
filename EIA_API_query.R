# script to access the EIA's beta API, convert data, then plot
# requires a unique API key which can be obtained at: http://www.eia.gov/beta/api/

require(RCurl)
require(plyr)
require(jsonlite)

#series
series = "ELEC.PRICE."
#Two letter state abbreviation
state = "TX"
#Type All = All, Residential = 
type = "ALL"
#Time A = Annual, M = Monthly, Q = Quarterly
time = "A"
#API Key
key <- scan("/Users/jim/Documents/R/private_EIA_API_key.txt", what = "character")

#Create API url 
id<-paste(series,state,"-",type,".",time, sep="")
api<-paste("http://api.eia.gov/series/data?api_key=",key,"&series_id=",id, sep="")

#Get data via RCurl
data_json<-getURL(api, followlocation = TRUE)

#Convert JSON format to R format, then flatten structure
data_nested <- fromJSON(data_json)
data_flat <- flatten(as.data.frame(data_nested))
data <- data_flat$series_data.data
data<-data.frame(data)
names(data)<-c('YEAR', 'ELEC.PRICE')
data$ELEC.PRICE<-as.numeric(data$ELEC.PRICE)
data$YEAR<-as.Date(data$YEAR, "%Y")

plot(data, main = id, type = "b")