
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
          1. รถคันไหนที่มีประสิทธิภาพสูงที่สุดในแต่ละด้าน
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
## Data Cleaning
```{R}
vehicle <- distinct(vehicle)
vehicle$Acceleration<-vehicle$Acceleration %>% str_remove("sec") %>% str_trim() %>% as.numeric() 
vehicle$TopSpeed<-vehicle$TopSpeed %>% str_remove("km/h") %>% str_trim() %>% as.numeric()
vehicle$Range<-vehicle$Range %>% str_remove("km") %>% str_trim() %>%as.numeric()
vehicle$Efficiency<-vehicle$Efficiency %>% str_remove("Wh/km") %>% str_replace("-","0") %>% str_trim() %>% as.numeric()
vehicle$FastChargeSpeed<-vehicle$FastChargeSpeed %>% str_remove("km/h") %>% str_trim() %>% as.numeric()
vehicle$NumberofSeats<-vehicle$NumberofSeats %>% as.numeric()
vehicle$PriceinGermany<-vehicle$PriceinGermany %>% str_remove("â,¬") %>% str_remove(",") %>% as.numeric()
vehicle$PriceinUK<-vehicle$PriceinUK %>% str_remove("Â£") %>% str_remove(",") %>% as.numeric()

vehicle <- vehicle %>% rename(`Acceleration(sec)` = Acceleration)
vehicle <- vehicle %>% rename(`TopSpeed(km/h)` = TopSpeed)
vehicle <- vehicle %>% rename(`Range(km)` = Range)
vehicle <- vehicle %>% rename(`Efficiency(Wh/km)` = Efficiency)
vehicle <- vehicle %>% rename(`FastChargeSpeed(km/h)` = FastChargeSpeed)
vehicle <- vehicle %>% rename(`PriceinGermany(â,¬)` = PriceinGermany)
vehicle <- vehicle%>% rename(`PriceinUK(Â£)` = PriceinUK)
```

## Explore Analysis
### 1) รถคันไหนที่มีประสิทธิภาพสูงที่สุดในแต่ละด้าน
```{R}
---------highest top speed---------------
vehicle %>% select(Name,`TopSpeed(km/h)`)%>% filter(`TopSpeed(km/h)` == max(`TopSpeed(km/h)`))

---------highest range-------------------
vehicle %>% select(Name,`Range(km)`)%>%filter(`Range(km)` == max(`Range(km)`))

---------highest efficiency--------------
vehicle %>% select(Name,`Efficiency(Wh/km)`)%>%filter(`Efficiency(Wh/km)` == max(`Efficiency(Wh/km)`))

---------highest FastChargeSpeed---------
vehicle %>% select(Name,`FastChargeSpeed(km/h)`)%>%filter(`FastChargeSpeed(km/h)` == max(`FastChargeSpeed(km/h)`,na.rm = T))

---------lowest Acceleration-------------
vehicle %>%select(Name,`Acceleration(sec)`)%>% filter(`Acceleration(sec)` == max(`Acceleration(sec)`))
```
Result : 
 - รถที่มีประสิทธิภาพในด้านความสามารถในการทำความเร็วสูงสุดคือ Tesla Roadster โดยมีความเร็วสูงสุดที่ทำได้อยู่ที่ 410 km/h
 - รถที่สามารถวิ่งได้ระยะทางมากที่สุดใน 1 การชาร์จพลังงานคือ Tesla Roadster โดยระยะทางที่วิ่งได้คือ 970 km
 - รถที่มีประสิทธิภาพสูงสุดคือ Mercedes EQV 300 Long และ Mercedes EQV 300 Extra-Long โดยทั้งสองคันมีประสิทธิภาพอยู่ที่ 281 Wh/km
 - รถที่มีความเร็วในการชาร์จสูงสุดคือ Lucid Air Pure และมีความเร็วในการชาร์จอยู่ที่ 1410 km/h
 - รถที่มีอัตราการเร่งถึงความเร็วสูงสุด ซึ่งใช้เวลาน้อยที่สุดในการเร่งคือ Renault Kangoo Maxi ZE 33 ซึ่งมีอัตราเร่งถึงความเร็วสูงสุดอยู่ที่ 22.4 sec
```
------------highest top speed---------------
  Name TopSpeed(km/h)
1 Tesla Roadster                    410

------------highest range-------------------
  Name Range(km)
1 Tesla Roadster                    970

------------highest efficiency--------------
  Name Efficiency(Wh/km)
1   Mercedes EQV 300 Long           281
2   Mercedes EQV 300 Extra-Long     281

------------highest FastChargeSpeed---------
  Name FastChargeSpeed(km/h)
1 Lucid Air Pure                    1410

------------lowest Acceleration-------------
  Name Acceleration(sec)
1 Renault Kangoo Maxi ZE 33         22.4
```

### 2) รถคันไหนราคาสูงที่สุดเมื่อเปรียบเทียบเป็นเงินไทย
```{R}
vehicle %>% select(Name,`PriceinUK(Â£)`)%>%filter(`PriceinUK(Â£)`*46.17 == max(`PriceinUK(Â£)`*46.17,na.rm = T))
```
Result :
```
[1] Name          PriceinUK(Â£)
<0 rows> (or 0-length row.names)
```

### 3) รถยี่ห้อใดบ้างที่มีที่นั่งจำนวน 4 ที่นั่ง ที่มีราคาต่ำกว่าค่าเฉลี่ย
```{R}
vehicle %>%select(Name,NumberofSeats,`PriceinUK(Â£)`) %>%filter(NumberofSeats == 4 & `PriceinUK(Â£)` < mean(`PriceinUK(Â£)`,na.rm = T))
```
Result :
```

```

### 4) จำนวนของรถที่มีที่นั่งน้อยที่สุดแตกต่างกับจำนวนของรถที่มีที่นั่งมากที่สุดกี่คัน
```{R}
vehicle %>% filter(NumberofSeats == max(NumberofSeats)) %>% count() - vehicle %>% filter(NumberofSeats == min(NumberofSeats)) %>% count()
```
Result :
```

```

### 5) มีรถยี่ห้อใดบ้างที่ขับเคลื่อนด้วยล้อหน้าคันใดบ้างที่มีความเร็วสูงกว่า 150 km/h
```{R}
vehicle %>%filter(Drive == "Front Wheel Drive" & `TopSpeed(km/h)` > 150) %>% select(Name)
```
Result :
```

```

### 6) ความเร่งและความเร็วสูงสุดที่ Tesla สามารถทำได้คือเท่าไหร่
```{R}
vehicle %>% filter(str_detect(Name,"Tesla") & (`TopSpeed(km/h)` == max(`TopSpeed(km/h)`) & `Acceleration(sec)` == min(`Acceleration(sec)`)))%>%select(`TopSpeed(km/h)`,`Acceleration(sec)`)
```
Result :
```

```

### 7) รถที่ราคาต่ำสุดในการขับเคลื่อนของล้อแต่ละแบบ
```{R}
frontvehicle <- vehicle%>%filter(Drive == "Front Wheel Drive")
allvehicle <- vehicle %>% filter(Drive == "All Wheel Drive")
rearvehicle <- vehicle %>% filter(Drive == "Rear Wheel Drive")
vehicle %>% filter(Drive == "Front Wheel Drive" &`PriceinUK(Â£)` == min(frontvehicle$`PriceinUK(Â£)`,na.rm = T))
vehicle %>% filter(Drive == "All Wheel Drive" & `PriceinUK(Â£)` == min(allvehicle$`PriceinUK(Â£)`,na.rm = T))
vehicle %>% filter(Drive == "Rear Wheel Drive" & `PriceinUK(Â£)` == min(rearvehicle$`PriceinUK(Â£)`,na.rm = T))
```
Result :
```

```

### 8) รถคันใดที่มีความเร็วและประสิทธิภาพสูงสูด เมื่อเทียบกับรถคันอื่นๆในชุดข้อมูล
```{R}
vehicle %>% filter(`Efficiency(Wh/km)` == max(`Efficiency(Wh/km)`))
```
Result :
```

```

### 9) ประสิทธิภาพโดยเฉลี่ยของรถทั้งหมด
```{R}
vehicle %>% summarise(mean(`Efficiency(Wh/km)`))
```
Result :
```

```





