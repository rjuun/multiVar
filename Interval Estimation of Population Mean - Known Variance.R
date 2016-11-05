# http://www.r-tutor.com/elementary-statistics/interval-estimation/interval-estimate-population-mean-known-variance

library(MASS)
height.response <- as.data.frame(na.omit(survey$Height))
colnames(height.response)[1] <- "height"

n <- length(height.response$height)
sigma <- sd(height.response$height)
mu <- mean(height.response$height)
SE <- sigma / sqrt(n)               # how does this relates to the variance we calculate for 10 days or 20
                                    # we use the same formula to adjust observed stdev from one year to 10 days

#Normalized height

n_height <- (height.response$height - mu) / sigma

height.response <- cbind(height.response, n_height)

# here we now construct the confidence interval at 95% - two tails
# this means that we discount from each tail 2.5%, so the limits of
# our confidence interval are 2.5% and 97.5%

conf_limits <- qnorm(c(0.025, 0.975))
E <- conf_limits*SE

# Notice that the confidence interval limits are given based on the normal
# distribution (+/- 1.96 for 95% two tailed test)
# The standard error (SE) is given in terms of the very measure of the original
# variable, in this case height in cm.


# This is important to notice that confidence intervals are constructed based on
# the same distribution function as the variable is being analised.


# first the histogram of the original data
library(ggplot2)
g <- ggplot(height.response, aes(x = height)) + geom_histogram(fill= "salmon", colour
                                                         = "white", binwidth=2)
g <- g + geom_vline(xintercept = mu+E)
g <- g + ggtitle(paste("Height Average = ", round(mu, 4), ", SE = ", round(E, 2), sep = " "))

# ... and here is the histogram of the normalized data
g_n <- ggplot(height.response, aes(x = n_height)) + geom_histogram(fill= "salmon", colour
                                                               = "white", binwidth=0.2)
g_n <- g_n + geom_vline(xintercept = conf_limits)
g_n <- gn + ggtitle(paste("Height Average = ", round(mu, 4), ", SE = ", round(E, 2), sep = " "))

# these libraries are necessary to arrange the graphs together
library(grid)
library(gridExtra)
grid.arrange(g, g_n, ncol = 1)

# notice the relationship between the original variable and the normalized data.
# original variable is in cm and then I plotted it in 2 cm intervals.
# normalized variable is agnostic, between +/- 4 so I plotted it in 0.2 intervals

# based on this, what we can say is, the sample mean is 172.28 (point estimate)
# Using the standard deviation of the sample to be that of the population
# (9.8 cm), the margin of error for a 95% confidence level (two tailed) is 1.34 cm. 
# That means that, actually, the real population mean lies between 171.1 and 173.7.
