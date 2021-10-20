library(stringr)
library(ggplot2)


superstore_sales <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")
#1)
superstore_sales %>% glimpse()

#2.1)what is max sales on order in 2017
superstore_sales %>% filter(format(as.Date(Ship.Date, format="%d/%m/%Y"),"%Y") == 2017) %>% select(Sales) %>% max()
#2.2)How many data in dataset?
superstore_sales %>% count()
#2.3)what min on sales
superstore_sales$Sales %>% min()
#2.4)How many region in this data set
superstore_sales %>% distinct(Region) %>% count()
#2.5)How many data in Kentucky state
superstore_sales %>% filter(State == "Kentucky") %>% count()
#2.6)What min sales on Furniture category
superstore_sales %>% filter(Category == "Furniture") %>% select(Sales) %>% min()

#3)
superstore_sales %>% ggplot(aes(x=Category)) + geom_bar()+ggtitle("TotalCategory") + ylab("Number Of order")
superstore_sales %>% ggplot(aes(x=City,y=Sales)) + geom_point(aes(color=Sales))

#4)
install.packages("tidyverse")
install.packages("purr")
library(purr)

string1 <- c("a","b","c")
string1 %>% map(function(x) x = "c");

?map_dbl
