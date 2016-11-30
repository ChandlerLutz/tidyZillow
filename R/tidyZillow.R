## c:/Dropbox/Rpackages/tidyZillow/R/tidyZillow.R

##    Chandler Lutz
##    Questions/comments: cl.eco@cbs.dk
##    $Revisions:      1.0.0     $Date:  2016-11-30

##to tidy zillow data


#' Tidy zillow time series research data
#'
#' see \url{http://www.zillow.com/research/data/}
#'
#' @title Tidy zillow research time series data
#' @param zillow.df A dataframe from with the raw zillow
#' data
#' @param series.name a string with the series name. default is
#' "value"
#' @return a tidy dataframe with the zillow data
#' @author Chandler Lutz
#' @examples
#' ##state level data
#' library(readr)
#' zillow.state <- read_csv("http://files.zillowstatic.com/research/public/State/State_Zhvi_AllHomes.csv")
#' zillow.state <- tidyZillow(zillow.state, series.name = "ZillowState")
#' head(zillow.state)
#' @importFrom dplyr %>%
#' @export
tidyZillow <- function(zillow.df, series.name = "value") {


    ##The column names
    names.zillow <- names(zillow.df)
    ##The column names which match the times
    names.times <- names.zillow[grepl("[0-9]{4}-[0-9]{2}", names.zillow)]

    #clean the data
    zillow.out <- zillow.df %>%
        tidyr::gather_(key_col = "time", value_col = series.name,
                       gather_cols = names.times)
    zillow.out$time <- as.Date(paste0(zillow.out$time, "-01"))

    ##update the names by and the "Zillow" prefix
    names.zillow <- names(zillow.out)
    names.zillow[1:(ncol(zillow.out) - 2)] <- paste0(
        "Zillow",
        names.zillow[1:(ncol(zillow.out) - 2)])
    names(zillow.out) <- names.zillow

    return(zillow.out)


}
