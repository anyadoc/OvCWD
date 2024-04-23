
library (tibble)#
library (tidyverse)#
library (dplyr)#
library (tidyr)
library(data.table)#

mdata <- read.csv("results/detectionprob_9133b2022_adp.csv", header = TRUE)
meanmdata <- by(mdata$dp, list(gr=as.numeric(gl(nrow(mdata), 100, nrow(mdata)))), 
                  FUN = function(x) colMeans(as.matrix(x)))

dpmdata <- fread("results/detectionprob_9133b2022_adp.csv",
                 select = c("dp"))
as_tibble(dpmdata)
dpmdata <- add_column(dpmdata, scenario = rep("9133b2022adp", 1000))
dpmdata <- add_column(dpmdata, mrun = 1:1000)
dpmdata$mrun <- ifelse(dpmdata$mrun %% 100 == 0, 1, 0)
dpmdata <- subset(dpmdata, mrun == 1)
dpmdata <- add_column(dpmdata, meandp = meanmdata)
#dfmdata = subset(dpmdata, select = c(-3,-5))
#dfmdata
#dpmdata