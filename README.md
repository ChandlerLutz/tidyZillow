To tidy Zillow research data time series. See
http://www.zillow.com/research/data/

# Instillation and usage

	     #install.packages("devtools")
	     library(devtools)
	     install_github("ChandlerLutz/tidyZillow")

	     ##state level data
         library(data.table)
         zillow.state <-   fread("http://files.zillowstatic.com/research/public/State/State_Zhvi_AllHomes.csv")
         zillow.state <- tidyZillow(zillow.state, series.name = "ZillowState")
         head(zillow.state)
