
# to produce the histogram of the stocks

setwd("/Volumes/Vol1/Cloud_Juun/01 - Study/Professional/ARIMA/01/6 Multivariate Methods/")

returns <- read.xlsx("DAX-data.xls",
      sheetName = "Returns", startRow = 3, endRow = 122, header = TRUE)
prices <- read.xlsx("DAX-data.xls",
                     sheetName = "prices", startRow = 3, endRow = 123, header = TRUE)


summary(returns)

mu <- mean(returns$siemens)
mse <- mean((returns$siemens - mu)^2)

  g <- ggplot(returns, aes(x = siemens)) + geom_histogram(fill= "salmon", colour
                                                       = "white", binwidth=0.01)
  g <- g + geom_vline(xintercept = quantile(returns$siemens), size = .2)
  g <- g + ggtitle(paste("mu = ", round(mu, 4), ", MSE = ", round(mse, 2), sep = " "))
  g

  =========================================================
# Now we want to standardize the data as for t-distribution
# t-distribution(mu, sd)

# to make it easier, first define henkel as   
  henkel <- returns$henkel  
  
# first we want to standardize henkel returns
henkel_mu <- mean(returns$henkel)
henkel_sd <- sd(returns$henkel)
henkel_mu
henkel_sd

# from every observation, now we extract the mu and divide by sd
std_henkel <- (returns$henkel - henkel_mu)/henkel_sd
std_henkel

# just to check, one can test the mean and sd of the std variable
mean(std_henkel)
sd(std_henkel)

# calculate the degrees of freedom
#need to come back here for the procedure
v <- 10

tdist_henkel <- (
  lgamma( (v+1) / 2 ) / ( sqrt( (v-2) * pi * ( v/2) ) ) 
  * (1 + ( (std_henkel^2) / (v-2) ) ) ^ ( (-v+1) / 2 )
)

tdist_henkel <- as.data.frame(tdist_henkel)

g <- ggplot(tdist_henkel, aes(x = tdist_henkel)) + geom_histogram(fill= "salmon", colour
                                                                 = "white", binwidth=0.01)

g


===============================
  # Now we are looking for the maximum likelihood estimates of mean
  
  
  
  # find the estimates of the mean by the method of movements