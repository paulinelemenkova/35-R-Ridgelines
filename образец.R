# library
library(ggridges)
library(ggplot2)
 
# 1 пример
# Data
head(diamonds)
 
# basic example
ggplot(diamonds, aes(x = price, y = cut, fill = cut)) +
  geom_density_ridges() +
  theme_ridges() + 
  theme(legend.position = "none")


# 2 пример
library(ggplot)
set.seed(1)

# Create an example dataset
dat <- data.frame(group = c(rep("A",100), rep("B",100)),
                  pweight = runif(200),
                  val = runif(200))

# Create an example of an unweighted joyplot
ggplot(dat, aes(x = val, y = group)) + geom_density_ridges(scale= 0.95)

