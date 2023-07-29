# library
library(tidyverse)
library(viridis)
library(dplyr)
library(ggplot2)
library(stringr)

# Create dataset
data <- data.frame(
  width=c(0.18,0.212,0.193,0.706,0.218,0.736,3.211,3.143),
  value1=c(2.28,2.65,3.16,3.86,2.21,4.68,6.22,6.42),
  value2=c(95.76,73.36,53.08,46.63,43.39,29.29,15.49,7.97),
  value3=c(0,0,0,0,0,0,0,0)
)

# Transform data in a tidy format (long format)
data <- data %>% gather(key = "observation", value="value", -c(1)) 
 
data$id <- rep(c(0.090,0.337,0.589,1.089,1.601,2.128,4.151,7.378),3)

nend = 9

p <- ggplot(data, aes(x=id, y=value, width=width)) +   
  geom_bar(aes(fill=observation), stat="identity", alpha=0.6) +
  geom_hline(aes(yintercept = y),data.frame(y = c(0:3) * 20),color = "grey12", alpha=0.5, size=0.2) + 
  scale_fill_viridis(discrete=TRUE) +

  ggplot2::annotate("text", x = c(8.95,8.95,8.95,8.95), y = c(0, 20, 40, 60), label = c("0", "20", "40", "60") , color="gray12", size=4 , angle=10, hjust=1) +
  xlim(0,nend) +
  ylim(-20,100) +
  theme_minimal() +
  theme(
    legend.position = "none",
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank()
  ) +
  coord_polar()

ggsave("ssp370.png", p, width = 6, height = 4,dpi=1200) 
