#library(tidyverse)
library(ggplot2)
library(readr)

# do NOT do this
# source("01-load_clean.R)
# there could be a lot of other stuff in the file

data <- readr::read_csv("data/titanic_clean.csv")

#eda

ggplot(data = data, aes(x=pclass, fill = as.factor(survived))) +
  geom_bar() +
  ggtitle("titanic")

ggsave("output/titanic1.png") # figures, images, output
# if you ever need it in multiple places, its already saved
# if you make a change, all you need to do is
# rerun this file (will update image)
# rerun the quarto report (will update image automatically)

ggplot(data, aes(x=survived))+
  geom_bar()

# ggsave("output/titanic2.png")
# you dont even need to save it, maybe you just want it for yourself
# select to save what you want