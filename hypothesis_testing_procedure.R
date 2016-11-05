getwd()
setwd("/Users/juun/Downloads")
bmw <- read.xlsx("MM_testing.xlsx", sheetName = "Example 1",
          startRow = 2, endRow = 121, colIndex = c(1,2), header = TRUE)
colnames(bmw)[2] <- "price"

A <- matrix(c(3, 2, 0, 1, 1, 2), nrow=3, ncol = 2)

bmw
det(A)

# assumptions
# Our assumption is that bmw prices has a distribution around normal
# and average return of 2%. hypotesis h_null average return is 2%
h_null <- 0.02
# the alternative is that bmw averae prices are less than 2%
h_alt <- <0.02


# compute test statistic
# find sample mean and sd to compute the t_statistic

bmw_mu_bar <- mean(bmw$price)     # sample mean of bmw prices x_bar
bmw_sigma_bar <- sd(bmw$price)    # sample std deviation of bmw prices
n <- length(bmw$price)            # number of sample observations

test_stat <- (bmw_mu_bar - h_null) / (bmw_sigma_bar/sqrt(n))   # this is the z value where 

# can we plot the whole normal distribution of bmw prices with the t_stat which is to be tested

bmw_normal <- as.data.frame((bmw$price - bmw_mu_bar) / bmw_sigma_bar)
colnames(bmw_normal)[1] <- "price"

# Just to visualize what is going on, we now plot the histogram with the
# normalized (z) values for bmw_prices, and the 
g <- ggplot(bmw_normal, aes(x = price)) + geom_histogram(fill= "salmon", colour
                                                        = "white", binwidth=0.5)

g <- g + geom_vline(xintercept = test_stat)
g <- g + ggtitle(paste("bmw_mu = ", round(bmw_mu_bar, 4), ", t_stat = ", round(test_stat, 2), sep = " "))
g

# Remember that th

# find the p_value, probability value of this value being true
# this means, we need to find the what is the probability 
# to get a sample with average return equals the sample mean from 
# the greater the number of observations, the lower the standard error

pt(t_stat, )


# significance level, critical
# I should be able to take the sample
# plot it as in a distribution
# find the critical values 
# and calculate the


# Lets consider that this bmw data follows std dist



# what if population does not satisfy normality assumption (3 - p.23)
# not important for larger samples (>30), because 
# sample distribution of the empirical mean 
# 
# This is something for me to change:
# to take a quick look at the slides before the class.
# try to come up with the questions before the class (planning)


