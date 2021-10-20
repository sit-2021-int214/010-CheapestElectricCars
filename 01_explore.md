
# 010 CheapestElectricCars

Original Datasets from: [kaggle](https://www.kaggle.com/kkhandekar/cheapest-electric-cars?fbclid=IwAR0_1it-Db3IslU0N8CIyAZtnZmBqfDQXAeH6h04Z-xnvnfhe4CUeVlgDxk)

### About's Products Datasets

This dataset contains content related to electric cars. With information such as brand and model name of the car including characteristics, capabilities of that car model, along with price information.

## Overview

We chose this dataset because we want to study the data of electric cars. Which contains information that currently, each car model, each brand, performance has been developed more.Because the trend of driving electric cars is getting more than in the past. There are more driving and selection options. which is necessary to bring information in which various fields of each model in the dataset are cleaned, analyzed and compared to find the best value.

## Steps
  1. Define a question.
  2. Exploring the dataset from many websites.
  3. Loading library and dataset are loaded from files ... which are compiled by...
  4. Explore the dataset from the original dataset.
      - Delete a unit of data in each row.
      - Change the data type according to the data.
      - Rename columns to have units.
      - Check data that is NA.



# Step 1 Loading library and dataset
```{R}
#library
library(readr)
library(stringr)
library(dplyr)

#Dataset
read_csv("https://raw.githubusercontent.com/sit-2021-int214/015-WorldCup/master/worldcupclean.csv")
worldcup <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/015-WorldCup/master/worldcupclean.csv")
View(worldcup)
```

  summarise(Goals = sum(Total.Goals))
maximumGoals <- maximumGoals %>% 
  filter(Goals == max(Goals))
View(maximumGoals)
```
#### Result : ปีที่มีจำนวนการยิงประตูรวมมากที่สุดคือปี 2014 มีจำนวนประตูทั้งหมด 280 ประตู
```{R}
     Year   Goals
1    2014   280
```
