#query explorer

library(RCurl)
library(plyr)
library(jsonlite)


#API Key
key <- scan("/Users/jim/Documents/R/private_EIA_API_key.txt", what = "character")

############### Category Query ##################
api <- paste("http://api.eia.gov/category/?api_key=", key, "&category_id=714755","&out=json", sep = "")

data_json<-getURL(api, followlocation = TRUE)

data_nested <- fromJSON(data_json)
data_flat <- flatten(as.data.frame(data_nested$category$childcategories))
data_flat

############### Series Categories Query ##################
series = "ELEC.PRICE."
state = "OH"
type = "ALL"
time_step = "A"

id<-paste(series,state,"-",type,".",time_step, sep="")
api<-paste("http://api.eia.gov/series/categories/?series_id=",id,"&api_key=",key,"&out=json", sep="")
data_json<-getURL(api, followlocation = TRUE)

data_nested <- fromJSON(data_json)

############### Series Query ##################
series = "ELEC.PRICE."
state = "OH"
type = "ALL"
time_step = "A"

id <- paste(series,state,"-",type,".",time_step, sep="")
api <- paste("http://api.eia.gov/series/?series_id=",id,"&api_key=",key,"&out=json", sep = "")
data_json<-getURL(api, followlocation = TRUE)
data_nested <- fromJSON(data_json)

data_series <- data_nested$series
data <- as.data.frame(data_series$data)

names(data)<-c('YEAR', 'ELEC.PRICE')

data$ELEC.PRICE<-as.numeric(data$ELEC.PRICE)
data$YEAR<-as.Date(data$YEAR, "%Y")

#graph test
plot(data, main = id, type = "b")

