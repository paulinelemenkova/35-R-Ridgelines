# Library
library(ggridges)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(forcats)
library(RColorBrewer)
library(viridis)
library(viridisLite)

df <- read_csv("FAOSTAT_Prices.csv")
head(df)

# 1
ggplot(df, aes(x = Year, y = Item, fill = Item)) +
  geom_density_ridges() +
  theme_ridges() +
  theme(legend.position = "none")

# 2
ggplot(df, aes(x = Value, y = Item, fill = after_stat(x))) +
  geom_density_ridges_gradient(scale = 1.0, rel_min_height = 0.01) +
  scale_fill_viridis(option = "C") +
  labs(title = 'Producer prices in major agriculture products of India (USD$/Tonne): 2000-2023') +
    theme(
      legend.position="none",
      panel.spacing = unit(0.1, "lines"),
      strip.text.x = element_text(size = 8)
    )
