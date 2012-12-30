EIA_API
=======

An R wrapper for the U.S. Energy Information Administration (EIA) datasets through their beta API. In order to access the EIA API, an unique API key is required. It may be obtained at: http://www.eia.gov/beta/api/ .

Currently this script is a proof of concept and downloads annual average residential electricity prices for Texas that are availalbe from the EIA API. Then, the JSON output is formatted into a dataframe and displayed as a line plot. 

Future updates will allow for multiple datasets to be downloaded and compared, along with extensible navigation of the datasets provided through the API by state, timestep, and dataset. 
