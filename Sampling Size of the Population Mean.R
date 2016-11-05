# http://www.r-tutor.com/elementary-statistics/interval-estimation/sampling-size-population-mean

# this is an exercise to define minimum sample size required to have a sample
# mean estimate with a given confidence level.
# to get the proper amount of observations based on pop variance and error
# n = ((z.alpha.2)^2 * sigma^2) / E^2

# i.e.
sigma <- 9.48 # when only sigma, standard deviation. when sigma^2, variance
alpha.2 <- .05/2 # two tailed
conf_level <- c(1 - alpha.2)
E <- 1.2

# z(normal) related to the conf_level is
z.alpha.2 <- qnorm(conf_level)

n = ((z.alpha.2)^2 * sigma^2) / E^2

# z.alpha.2 is measureless, sigma also.... but sigma^2 is in cm

