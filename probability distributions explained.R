
#http://www.r-tutor.com/elementary-statistics/hypothesis-testing/upper-tail-test-population-mean-known-variance


# Binomial Prob (discrete)
# probability of probability of having x successful occurrences from an n number of trials.
# For example, what is the chance of having 4 correct answers from a 12 questions exams with 
# 5 possible options

# For 
x = 4
prob = 1/5
size = 12

# for point probability
dbinom(4, size = 12, prob = .2)

# for cummulative probability, use 
plot(
  pbinom(seq(0:12), size = 12, prob = .2))

# Poisson Distribution
# probability of independent events occurrences in an interval.
# Lambda is the mean occurrence per interval, then the probability of
# having x occurrences within a given interval

# i.e. if there are on average 12 cars / min crossing a bridge, what is the prob
# of having 17 or more cars crossing the bridge in a particular min

ppois(16, lambda = 12) # cumulative distribution from 0 until 16

1 - ppois(16, lambda = 12) # remaining prob... meaning 17 or more cars

# Normal Distribution
# given an average and a stdev

# test scores follow standard normal with mu = 72 and sigma = 15.2
# what is the prob of scoring 84 or more.

pnorm(83, mean = 72, sd = 15.2)
1 - pnorm(83, mean = 72, sd = 15.2)

# Meaning that 23.4% of the students are expected to have a score of 84 or more

# Chi Squared
# if there is a collection of random variables which follow standard normal
# the sum of all squared values of these variables is V with m degrees of freedom
# the mean is also m with variance 2m, meaning, sigma sqrt(2m)

# what do we have which is a sum of squared values ? > sum of sqrt of distances between
# mean and points... variance

# the coolest thing to notice, is now everything is connected
# density function - for point probabilities
# probability / distribution function - for cumulative distribution
# quartile function - for finding critical points
# random

par(2,1)
plot(seq(-4, 4, by = .1), dnorm(seq(-4, 4, by = .1), mean = 0, sd = 1 ))
plot(seq(-4, 4, by = .1), pnorm(seq(-4, 4, by = .1), mean = 0, sd = 1 ))
abline(v = qnorm(.025), col = "lightgray", lty = 3)

abline(v = qnorm(.99), col = "lightgray", lty = 3)

# t distribution
# this is also cool because one variable follows standard normal (z), which is usually the mean
# while the other variable follows chi-squared(v), which tends to be the variance.
# mean and variance are independent, so that t follows student t distribution.


# F Distribution
# if V1 and V2 are two chi-distribution independent variables (m1 and m2 degrees of freedom)
# then the resulting F value follows F distribution
# (v1/m1)/(v2/m2)
# most likely we should use it to compare variances
