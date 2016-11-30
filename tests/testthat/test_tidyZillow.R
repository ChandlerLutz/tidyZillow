## c:/Dropbox/Rpackages/tidyZillow/tests/testthat/tidyZillow_works.R

##    Chandler Lutz
##    Questions/comments: cl.eco@cbs.dk
##    $Revisions:      1.0.0     $Date:  2016-11-30

##Test that tidy zillow works

library(readr)
zillow.state <- read_csv("http://files.zillowstatic.com/research/public/State/State_Zhvi_AllHomes.csv")

zillow.msa <- read_csv("http://files.zillowstatic.com/research/public/Metro/Metro_Zhvi_AllHomes.csv")

context("tidyZillow")

test_that("tidyZillow works", {
    expect_is(tidyZillow(zillow.state), "data.frame")
    expect_is(tidyZillow(zillow.msa), "data.frame")
})
