# Hypothesis Testing - Population Mean with known variance

h_null <- 2       # hypothetized value
x_bar <- 2.1      # sample mean
sigma <- 0.25     # population stdev
n <- 35           # number of observations


t_statistic <- (x_bar - h_null) / (sigma/sqrt(n)) # test statistic

# to compute the confidence interval with a confidence level of 95%
# significance level (alpha) is associated with the following critical level
alpha <- 0.05
z.alpha <- qnorm(1-alpha)
# this means that, 95% of the samples, would have a mean that corresponds
# to an stadndardized z.alpha = 1.64.

# since the measured mean of this sample (standardized - t_statistic) is greater than the
# critical value, we reject the null hypothesis that there is at the most 2 grams
# of sat fat in each cookie. There is on average more than 2 grams.

# Another way of doing the same exercise is to calculate 
p_value <- pnorm(t_statistic, lower.tail = FALSE) # This brings only the
                                                  # cumulative prob of 


# now, how to interpret it ?
# the company claims that there are at the most 2 grams of saturated fat
# per cookie.
# from a sample of 35 cookies (observations), we have measured an average
# of 2.1 grams of saturated fat.
# Considering a stdev of 0.25, the probability of the sample average being
# less than 2 grams, with 95% confidence level, is 
