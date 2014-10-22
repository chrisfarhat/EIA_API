#EIA API Wrapper function file

source(API_call.R)

key <- scan("/Users/jim/Documents/R/private_EIA_API_key.txt", what = "character")
series_ID <- "371"

data_json<-API_call(series_ID, key)