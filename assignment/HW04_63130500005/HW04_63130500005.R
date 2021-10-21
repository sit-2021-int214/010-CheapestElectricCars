library(dplyr)
library(readr)
library(assertive)
library(stringr)
library(DescTools)
install.packages("lubridate")
install.packages("tidyr")
library(lubridate)
library(ggplot2)


#Explore Data
superstore <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")


View(superstore)
glimpse(superstore)
#9,800 rows, 18 Columns



#1
superstore %>% group_by(Segment) %>% summarise(Sales = mean(Sales,na.rm = TRUE))


#2
max_sale_of_category <- superstore %>% group_by(Category) %>% summarise(total_sale = sum(Sales)) 
max_sale_of_category %>% select(Category,total_sale) %>% filter(total_sale ==max(total_sale))



#3
superstore <- superstore %>% rename(orderdate =`Order Date`)
superstore %>% mutate(year = year(dmy(superstore$orderdate))) %>% filter(year >= 2017 && year <= 2018) %>% summarise(total_sale = sum(Sales))

#or

year <- year(dmy(superstore$orderdate))
str(year)
superstore %>% filter(year >= 2017 && year <= 2018) %>% summarise(total_sale = sum(Sales))


#4
citywithQ <- str_subset(superstore$City, "[q]") %>% glimpse() 
table(citywithQ)


#5
superstore <- superstore %>% rename(customerId = `Customer ID`)
superstore <- superstore %>% rename(customerName = `Customer Name`)
sum_sale <- superstore %>% group_by(customerName) %>% summarise(sum_sale = sum(Sales)) %>% summarise(max_sale = max(sum_sale))
sum_sale %>% select(customerName, sum_sale) %>% filter(sum_sale > 25043)
superstore %>% group_by(customerId) %>% select(customerId,customerName) %>% filter(customerName == "Sean Miller") 


#6
sum_region <- superstore %>% group_by(Region) %>% summarise(sum_sale = sum(Sales)) %>% glimpse()
data.frame(sum_region)


## Part 4: Visualization with GGplot2

#1
superstore %>% ggplot(aes(x=Segment))+geom_bar() + ggtitle("Segments") + ylab("Number of people in Segment")

#2
scater <- superstore %>% filter(Sales>1000) %>% ggplot(aes(x=`Order ID`,y=Sales)) + geom_point(aes(color=Category))
scater




















