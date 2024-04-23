library(ggplot2)
library(rempsyc)

dpdata <- read.csv("dpplot.csv", header = TRUE)
#head(dpdata)
dpdata1 <- dpdata[which(dpdata$year== 2015), ]
p1 <- nice_violin(
  data = dpdata1,
  group = "grp",
  response = "dp",
  obs = TRUE,
  ytitle = "detection probability"
  
)

p1 + scale_x_discrete(limits=c("fawn", "adult", "all")) +
  ylim(0,15) +
  labs(title = "9133B: 2015")