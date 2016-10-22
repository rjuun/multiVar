setwd("/Volumes/Vol1/Cloud_Juun/01 - Study/Professional/ARIMA/01/6 Multivariate Methods")
read.csv("mm_example1.csv", header = TRUE, dec = ".")
x <- read.csv("mm_example1.csv", header = TRUE, dec = ".")
stable_regime <- dnorm(x$x, mean = 0.01, sd = 0.005)
crisis_regime <- dnorm(x$x, mean = -0.01, sd = 0.02)
plot(crisis_regime)


install.packages("Quandl")
library(Quandl)
Quandl.api_key("P6QLMV4K3VrkT3jsdCP1")
data <- Quandl("WIKI/FB.11", start_date="2014-01-01", end_date="2014-12-31", collapse="monthly", transform="diff", meta = TRUE)
data
metadata <- metaData(data)
metadata
SIX/FR0000045072CHF4
credit_agricole <- Quandl("SIX/FR0000045072CHF4", start_date="2014-01-01", end_date="2014-12-31", collapse="monthly", transform="diff", meta = TRUE)
