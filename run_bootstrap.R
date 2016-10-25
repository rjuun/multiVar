###############################
## 
## TITLE : what is the code doing
##
###############################

##input data   !!  save input data in the same folder with this script
inputFile = "inputFile_bootstrap.csv"


## parameters to define
data <- read.csv(inputFile)
n <- length(data$data)
simulations <- 100
sd_sample_list <- as.data.frame(c())


#######   proceeding   ############
for (i in 1:simulations) {
  sample <- sample(data$data, n, replace = TRUE)
  sd_sample <- sd(sample)
  sd_sample_list <-  c(sd_sample_list, sd_sample)
  
}

conf_interval <- c(quantile(as.numeric(sd_sample_list), names = FALSE, probs = c(0.025, 0.975)))
print(conf_interval) 
summary(as.numeric(sd_sample_list))
rank(conf_interval)

g <- hist(as.numeric(sd_sample_list), breaks = 10)
g <- g + geom_abline(conf_interval)
##save output data


