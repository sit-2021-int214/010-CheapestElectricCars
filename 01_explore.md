
# 010 CheapestElectricCars

Original Datasets from: [kaggle](https://www.kaggle.com/kkhandekar/cheapest-electric-cars?fbclid=IwAR0_1it-Db3IslU0N8CIyAZtnZmBqfDQXAeH6h04Z-xnvnfhe4CUeVlgDxk)

### About's Products Datasets

This dataset contains content related to electric cars. With information such as brand and model name of the car including characteristics, capabilities of that car model, along with price information.

## Overview

We chose this dataset because we want to study the data of electric cars. Which contains information that currently, each car model, each brand, performance has been developed more.Because the trend of driving electric cars is getting more than in the past. There are more driving and selection options. which is necessary to bring information in which various fields of each model in the dataset are cleaned, analyzed and compared to find the best value.

## Steps
  1. Define a question.
  2. Exploring the dataset from many websites.
  3. Loading library and dataset are loaded from files ... which are compiled by…
  4. Explore the dataset from the original dataset
      - Delete a unit of data in each row.
      - Change the data type according to the data.
      - Rename columns to have units.
      - Check data that is NA.
      
 ## Define a question.
          1. รถคันไหนที่มีประสิทธิภาพสูงที่สุด
          2. รถคันไหนราคาสูงที่สุดเมื่อเปรียบเทียบเป็นเงินไทย
          3. รถยี่ห้อใดบ้างที่มีที่นั่งจำนวน 4 ที่นั่ง ที่มีราคาต่ำกว่าค่าเฉลี่ย
          4. จำนวนของรถที่มีที่นั่งน้อยที่สุดแตกต่างกับจำนวนของรถที่มีที่นั่งมากที่สุดกี่คัน
          5. มีรถยี่ห้อใดบ้างที่ขับเคลื่อนด้วยล้อหน้าคันใดบ้างที่มีความเร็วสูงกว่า 150 km/h
          6. ความเร่งและความเร็วสูงสุดที่ Tesla สามารถทำได้คือเท่าไหร่
          7. รถที่ราคาต่ำสุดในการขับเคลื่อนของล้อแต่ละแบบ
          8. รถคันใดที่มีความเร็วและประสิทธิภาพสูงสูด เมื่อเทียบกับรถคันอื่นๆในชุดข้อมูล
          9. ประสิทธิภาพโดยเฉลี่ยของรถทั้งหมด


## Explore Data

```{R}
vehicle <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/010-CheapestElectricCars/main/Cheapestelectriccars-EVDatabase.csv");
View(vehicle)
```

## Observe

```{R}
vehicle <- as_tibble(vehicle)
glimpse(vehicle)
View(vehicle)
```









