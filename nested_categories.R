#newsted categories
library(RCurl)
library(plyr)
library(jsonlite)


#API Key
key <- scan("/Users/jim/Documents/R/private_EIA_API_key.txt", what = "character")
catID = "371"

############### Category Query ##################
cat_query <- function(key, catID)
 {
  catID <- toString(catID)
  api <- paste("http://api.eia.gov/category/?api_key=", key, "&category_id=", catID,"&out=json", sep = "")

  data_json<-getURL(api, followlocation = TRUE)

  data_nested <- fromJSON(data_json)
  data <- flatten(as.data.frame(data_nested$category$childcategories))
  return(data)
}

cat_query(data[1,1],key)
