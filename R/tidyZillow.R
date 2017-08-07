## c:/Dropbox/Rpackages/tidyZillow/R/tidyZillow.R

##    Chandler Lutz
##    Questions/comments: cl.eco@cbs.dk
##    $Revisions:      1.0.0     $Date:  2016-11-30

##to tidy zillow data


#' Tidy zillow time series research data using data.table
#'
#' see \url{http://www.zillow.com/research/data/}
#'
#' @title Tidy zillow research time series data
#' @param zillow.df A dataframe from with the raw zillow
#' data
#' @param series.name a string with the series name. default is
#' "value"
#' @return a tidy data.table with the zillow data
#' @author Chandler Lutz
#' @examples
#' ##state level data
#' library(data.table)
#' url <- "http://files.zillowstatic.com/research/public/State/State_Zhvi_AllHomes.csv"
#' zillow.state <- fread(url)
#' zillow.state <- tidyZillow(zillow.state, series.name = "ZillowState")
#' head(zillow.state)
#' @export
tidyZillow <- function(zillow.df, series.name = "value") {

    ##The column names
    names.zillow <- names(zillow.df)
    ##The column names which match the times
    names.times <- names.zillow[grepl("[0-9]{4}-[0-9]{2}", names.zillow)]
    ##The id columns
    names.id <- names.zillow %>% .[!(. %in% names.times)]

    ##Initialize the time column to pass R CMD check with data.table
    time <- NULL

    zillow.out <- zillow.df %>%
        ##set as data.table
        setDT %>%
        ##melt
        melt(id.vars = c(names.id),
             variable.name = "time",
             variable.factor = FALSE,
             value.name = c(series.name)) %>%
        ##Create the time column
        .[, time := as.Date(paste0(time, "-01"))]

    return(zillow.out)


}
