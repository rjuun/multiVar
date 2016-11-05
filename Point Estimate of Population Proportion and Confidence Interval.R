# http://www.r-tutor.com/elementary-statistics/interval-estimation/point-estimate-population-proportion
# Point Estimate of Population Proportion and Confidence Interval

library(MASS)
gender.response <- na.omit(survey$Sex)

n <- length(gender.response)
k = sum(gender.response == "Female")

p_bar <- k/n

# but, again, this population proportion estimate is based on a sample.
# to estimate its confidence interval here are the steps:

# 1- define the conf_level and find z.alpha.2 associated with it

alpha.2 <- .05/2       # two tailed 
conf_level <- c(alpha.2, 1 - alpha.2)
z.alpha.2 <- qnorm(conf_level)

# 2- calculate the Standard Error (SE) for the population proportion
# usually, SE is calculated as
# SE <- sd_mu/sqrt(n)
# but for population proportion, it is the case that
# sqrt(p_bar*(1 - p_bar)/n)
SE <- sqrt(p_bar*(1 - p_bar)/n)

# 3- with the SE and the z.alpha.2 associated with the desired conf_level,
# margin of error is
E <- SE*z.alpha.2

# 4- ... lastly, the margin error is added to the population proportion
# to compose the confidence interval
p_bar + E

# What does it mean ?! the estimated population proportion of 50% being female,
# can actually be somewhat between 43% and 56%, when looking at the real population

# POPULATION PROPORTION SAMPLE SIZE
# further on, we can estimate a desirable number of observations that would comply
# In the case of a regular sample variable, we use the following formula
# n = (z.alpha.2^2 * sigma^2) / E^2
# to come to a desirable sample size a choosen conf_level
# in the case of Population Proportion, we use
# n = (z.alpha.2^2 * p*(1 - p)) / E^2
# provided that p is the probability (proportion) of the desired event
# and (1 - p) the probability (proportion) of the undesirable events

# considering a 95% conf_interval is the target

n = (z.alpha.2^2 * p_bar*(1 - p_bar)) / E^2
