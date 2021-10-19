library("dplyr")
library("readr")
library("assertive")
library("stringr")
library(DescTools)

#Explore Data
Superstore <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")

glimpse(Superstore)
#9,800 rows, 18 Columns


