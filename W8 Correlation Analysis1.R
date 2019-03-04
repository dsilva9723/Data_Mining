library(tidyverse)
#12.4----
weather <- read_csv("https://www.iun.edu/~cisjw/ds/files/data/weather.csv")

normalize <- function(v, range=1){
  v.norm = (v - min(v,na.rm=TRUE)) / (max(na.omit(v))-min(v)) * range
  return(v.norm)
}

weather.norm <- weather %>% 
  mutate_if(is.numeric, normalize)

pairCorr <- function(x,y) {
  length <- length(x)
  mu_x <- mean(x)
  mu_y <- mean(y)
  sd_x <- sd(x)
  sd_y <- sd(y)
  sum <- 0
  for (i in 1:length){
    sum <- sum +(x[i]-mu_x) *(y[i] - mu_y)
  }
  corr <- sum/((length-1) * sd_x * sd_y)
  return(corr)
}

pairCorr(weather.norm$temperature,weather.norm$humidity)
#The strength of correlation between temperature and humidity is 0.3150818,
#which falls into the level of no correlation since it is in the range of 0 - .4.
#It also has a positive correlation. 

#12.6----
titanic <- read_csv("https://www.iun.edu/~cisjw/ds/files/data/train.csv")

table(titanic$Survived, titanic$Sex, dnn = c("survived","Sex"))
ctable <- table(titanic$Survived, titanic$Sex, dnn = c("Survived","Sex"))
summary(ctable)

#There is a x^2 value of 344.9 at a sig. level of 5.54, which is not greater than 0.05. 
#There is an extremely strong correlation between sex and survived.  