# http://www.r-tutor.com/elementary-statistics/interval-estimation/interval-estimate-population-mean-known-variance

# First, my question is, why do we use normal distribution when we are verifying the
# confidence interval for a variable whose population variance is known, and 
# we use the tdist when the variance of the population is unknown.
# My idea is, tdist is fatter on the tails, so its safer...
# http://rpsychologist.com/d3/tdist/
# and apparently it is so... and according to the site above, the real advantage
# of using t_dist over normal is for sample size smaller than 30 observations
# and keep in mind that, whenever population variance is not known, go for 
# tdistribution

# define that we will have 2 graphs in1 column
par(mfrow = c(2,1))

# create a sequence for x variable
x <- seq(-3, 3, by = .1)

# count amount of observations
n <- length(x)
n <- 7


# set the density functions (probabilities) for each x point under a given distr
d_normal <- dnorm(x, mean = 0, sd = 1)
d_tdist <- dt(x, df = n)

# plot the graph, defining the xaxis to be the range of x and the yaxis range of 
# both normal and t distributions
plot(range(x), range(d_normal, d_tdist), type = "n")
points(x, d_normal, col = "black", pch = 1, cex = .2)
points(x, d_tdist, col = "red", pch = 4, , cex = .2)
abline(v = qnorm(.025), col = "lightgrey", lty = "dotted" )
abline(v = qnorm(.975), col = "lightgrey", lty = "dotted")

# clear the settings at the end of the session
par(op)

#########################
# So now we should assume the same previous exercise, but without assuming
# we know the population variance, and used the sample variance.

# the question was, what is the confidence interval for the observed mean height ?
library(MASS)
height.response <- na.omit(survey$Height)

# observed mean heith, meaning, mean height of the sample is 172.4
x_mu <- mean(height.response)
sd_mu <- sd(height.response)
n <- length(height.response) 

# the standard deviation of the sample mean is 9.84
# to construct the confidence interval around the 172.4 sample mean
# it is necessary to measure the standard error SE

SE <- sd_mu/sqrt(n)

# ... and multiply it by the corresponding t value (t-dist) associated with
# the desired confidence level to get the margin of error for the mean.
# To get the t values associated with a 95% confidence interval (2 tailed),
# it is necessary to get the 2.5% and 97.5% quantiles 

t_values <-  qt(c(.025, .975), df = n-1)
E <- t_values * SE

# ... lastly, the margin of error added around the sample mean  (right and left)

height_tdist <- dt(height.response, df = n-1, ncp = x_mu)

plot(height.response, height_tdist, col = "red", pch = 4, , cex = .2)
abline(v = x_mu + E[1], col = "lightgrey", lty = "dotted" )
abline(v = x_mu + E[2], col = "lightgrey", lty = "dotted")
