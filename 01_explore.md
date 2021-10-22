
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
          5. มีรถยี่ห้อใดบ้างที่ขับเคลื่อนด้วยล้อหน้าและมีความเร็วสูงกว่า 150 km/h
          6. ความเร่งและความเร็วสูงสุดที่ Tesla สามารถทำได้คือเท่าไหร่
          7. รถคันใดที่มีราคาต่ำสุดในการขับเคลื่อนของล้อแต่ละแบบ และรถคันดังกล่าวมีความเร็วสูงสุดเป็นเท่าใด
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
#highest top speed
vehicle %>% select(Name,`TopSpeed(km/h)`)%>% filter(`TopSpeed(km/h)` == max(`TopSpeed(km/h)`))

#highest range
vehicle %>% select(Name,`Range(km)`)%>%filter(`Range(km)` == max(`Range(km)`))

#highest efficiency
vehicle %>% select(Name,`Efficiency(Wh/km)`)%>%filter(`Efficiency(Wh/km)` == max(`Efficiency(Wh/km)`))

#highest FastChargeSpeed
vehicle %>% select(Name,`FastChargeSpeed(km/h)`)%>%filter(`FastChargeSpeed(km/h)` == max(`FastChargeSpeed(km/h)`,na.rm = T))

#lowest Acceleration
vehicle %>%select(Name,`Acceleration(sec)`)%>% filter(`Acceleration(sec)` == max(`Acceleration(sec)`))
```
Result : 
```{R}
#------------ **highest top speed** ---------------
  Name TopSpeed(km/h)
1 Tesla Roadster                    410

#------------ **highest range** -------------------
  Name Range(km)
1 Tesla Roadster                    970

#------------ **highest efficiency** --------------
  Name Efficiency(Wh/km)
1   Mercedes EQV 300 Long           281
2   Mercedes EQV 300 Extra-Long     281

#------------ **highest FastChargeSpeed** ---------
  Name FastChargeSpeed(km/h)
1 Lucid Air Pure                    1410

#------------lowest Acceleration--------------
  Name Acceleration(sec)
1 Renault Kangoo Maxi ZE 33         22.4
```
  //Explain
   - รถที่มีประสิทธิภาพในด้านความสามารถในการทำความเร็วสูงสุดคือ Tesla Roadster โดยมีความเร็วสูงสุดที่ทำได้อยู่ที่ 410 km/h
   - รถที่สามารถวิ่งได้ระยะทางมากที่สุดใน 1 การชาร์จพลังงานคือ Tesla Roadster โดยระยะทางที่วิ่งได้คือ 970 km
   - รถที่มีประสิทธิภาพสูงสุดคือ Mercedes EQV 300 Long และ Mercedes EQV 300 Extra-Long โดยทั้งสองคันมีประสิทธิภาพอยู่ที่ 281 Wh/km
   - รถที่มีความเร็วในการชาร์จสูงสุดคือ Lucid Air Pure และมีความเร็วในการชาร์จอยู่ที่ 1410 km/h
   - รถที่มีอัตราการเร่งถึงความเร็วสูงสุด ซึ่งใช้เวลาน้อยที่สุดในการเร่งคือ Renault Kangoo Maxi ZE 33 ซึ่งมีอัตราเร่งถึงความเร็วสูงสุดอยู่ที่ 22.4 sec

### 2) รถคันไหนราคาสูงที่สุดเมื่อเปรียบเทียบเป็นเงินไทย (20/10/21 uk = 46.17 บาท ,eu = 38.75 บาท)
```{R}
vehicle %>% select(Name,`PriceinUK(Â£)`)%>%filter(`PriceinUK(Â£)`*46.17 == max(`PriceinUK(Â£)`*46.17,na.rm = T))
```
Result :
```
    Name              PriceinUK(Â£)
1 Tesla Roadster         189000
```
  //Explain
   - อัตราการแลกเปลี่ยนเงินตรา ณ วันที่ 20 ตุลาคม 2564 (uk = 46.17 บาท ,eu = 38.75 บาท)
   - ราคาของรถที่ได้จากการคำนวณโดยแปลงเป็นค่าเงินของอังกฤษ คือ 189,000 ปอนด์ จะต้องนำไปคูณกับค่าเงินที่เป็นอัตราการแลกเปลี่ยนจะได้ 
   ```189000 * 46.17 = 8,726,130 ```
   - ยี่ห้อของรถที่ราคาสูงที่สุดเมื่อเปรียบเทียบเป็นเงินไทย คือ Tesla Roadster โดยราคาจะอยู่ที่ **8,726,130 บาท** 

### 3) รถยี่ห้อใดบ้างที่มีที่นั่งจำนวน 4 ที่นั่ง ที่มีราคาต่ำกว่าค่าเฉลี่ย
```{R}
vehicle %>%select(Name,NumberofSeats,`PriceinUK(Â£)`) %>%filter(NumberofSeats == 4 & `PriceinUK(Â£)` < mean(`PriceinUK(Â£)`,na.rm = T))
```
Result :
```
    Name                 NumberofSeats   PriceinUK(Â£)
1  BMW i3 120 Ah                 4         31305
2  BMW i3s 120 Ah                4         32305
3  Honda e                       4         27660
4  Volkswagen ID.3 Pro S         4         38800
5  Smart EQ forfour              4         19795
6  Honda e Advance               4         30160
7  Fiat 500e Cabrio              4         26645
8  Fiat 500e Hatchback 42 kWh    4         23995
9  Fiat 500e Hatchback 24 kWh    4         20495
10 Mini Cooper SE                4         26000
```
   //Explain
   
     - รถพลังงานไฟฟ้าซึ่งมีจำนวนที่นั่ง 4 ที่นั่ง ที่มีราคาต่ำกว่าค่าเฉลี่ยมียี่ห้อดังต่อไปนี้
   - BMW ซึ่งประกอบไปด้วยรถ 2 รุ่น คือ BMW i3 120 Ah โดยมีราคาอยู่ที่ 31305 ปอนด์  และ BMW i3s 120 Ah โดยมีราคาอยู่ที่ 32305 ปอนด์
   - Honda ซึ่งประกอบไปด้วยรถ 2 รุ่น คือ Honda e โดยมีราคาอยู่ที่ 27660 ปอนด์ และ Honda e Advance โดยมีราคาอยู่ที่ 30160 ปอนด์
   - Volkswagen โดยเป็นรถรุ่น Volkswagen ID.3 Pro S ซึ่งมีราคาอยู่ที่ 38800 ปอนด์
   - Smart โดยเป็นรถรุ่น Smart EQ forfour ซึ่งมีราคาอยู่ที่ 19795 ปอนด์
   - Fiat ซึ่งประกอบไปด้วยรถ 3 รุ่น คือ Fiat 500e Cabrio โดยมีราคาอยู่ที่ 26645 ปอนด์, Fiat 500e Hatchback 42 kWh โดยมีราคาอยู่ที่ 23995 ปอนด์ และ Fiat 500e Hatchback 24 kWh โดยมีราคาอยู่ที่ 20495 ปอนด์
   - Mini โดยเป็นรถรุ่น Mini Cooper SE ซี่มีราคาอยู่ที่ 26000 ปอนด์
    
### 4) จำนวนของรถที่มีที่นั่งน้อยที่สุดแตกต่างกับจำนวนของรถที่มีที่นั่งมากที่สุดกี่คัน
```{R}
vehicle %>% filter(NumberofSeats == max(NumberofSeats)) %>% count() - vehicle %>% filter(NumberofSeats == min(NumberofSeats)) %>% count()
```
Result :
```
    n
1   30
```
   //Explain
   - รถที่มีจำนวนที่นั่งน้อยที่สุดและรถที่มีจำนวนที่นั่งมากที่สุด มีจำนวนแตกต่างอยู่ที่ 30 คัน
  
    
### 5) มีรถยี่ห้อใดบ้างที่ขับเคลื่อนด้วยล้อหน้าและมีความเร็วสูงกว่า 150 km/h
```{R}
vehicle %>%filter(Drive == "Front Wheel Drive" & `TopSpeed(km/h)` > 150) %>% select(Name)
```
Result :
```
         Name
1   Nissan Leaf e+
2   Mercedes EQA 250
3   Kia e-Soul 64 kWh
4   Hyundai IONIQ Electric
5   Hyundai Kona Electric 64 kWh
6   Hyundai Kona Electric 39 kWh
7   Mercedes EQV 300 Long
8   Lexus UX 300e
9   Kia e-Soul 64 kWh
10  Kia e-Soul 39 kWh
11  Nissan Ariya 63kWh
12  Nissan Ariya 87kWh
13  MG MG5 EV
14  Mercedes EQV 300 Extra-Long
15  Kia e-Niro 64 kWh
16  Kia e-Niro 39 kWh
17  Seres 3 
18  Hyundai Kona Electric 39 kWh
19  Hyundai Kona Electric 64 kWh
20  MG MG5 Electric
21  Polestar 2 Standard Range Single Motor
22  Polestar 2 Long Range Single Motor
23  Renault Megane E-Tech Electric
24  MG MG5 EV Long Range
```
  //Explain
    -
    
### 6) ความเร่งและความเร็วสูงสุดที่ Tesla สามารถทำได้คือเท่าไหร่
```{R}
vehicle %>% filter(str_detect(Name,"Tesla") & (`TopSpeed(km/h)` == max(`TopSpeed(km/h)`) & `Acceleration(sec)` == min(`Acceleration(sec)`)))%>%select(`TopSpeed(km/h)`,`Acceleration(sec)`)
```
Result :
```
        TopSpeed(km/h)   Acceleration(sec)
1            410               2.1
```
   //Explain
   - จากรถพลังงานไฟฟ้ายี่ห้อ tesla ทั้งหมดนั้น รถคันที่สามารถทำความดร็วได้สูงที่สุด มีความเร็วอยู่ที่ 410 km/h และมีความเร่งดีที่สุดอยู่ที่ 2.1 sec
    
### 7) รถคันใดที่มีราคาต่ำสุดในการขับเคลื่อนของล้อแต่ละแบบ และรถคันดังกล่าวมีความเร็วสูงสุดเป็นเท่าใด
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
  #Front Wheel Drive
          Name                          Subtitle                       Acceleration(sec)   TopSpeed(km/h)   Range(km)   Efficiency(Wh/km)   FastChargeSpeed(km/h)
1 Fiat 500e Hatchback 24 kWh    Battery Electric Vehicle |  23.8 kWh          9.5               135           165             144                   260
      Drive              NumberofSeats   PriceinGermany(â‚¬)   PriceinUK(Â£)
  Front Wheel Drive             4               23560              20495
  
  #All Wheel Drive
       Name                         Subtitle                   Acceleration(sec)  TopSpeed(km/h)  Range(km)   Efficiency(Wh/km)   FastChargeSpeed(km/h)         Drive
1 Skoda Enyaq iV 80X    Battery Electric Vehicle |  77 kWh            6.9             160            405            190                   500               All Wheel Drive
NumberofSeats   PriceinGermany(â‚¬)   PriceinUK(Â£)
      5               47000               42000

  #Rear Wheel Drive
             Name                    Subtitle                  Acceleration(sec)  TopSpeed(km/h)  Range(km)   Efficiency(Wh/km)   FastChargeSpeed(km/h)         Drive
1 Smart EQ fortwo coupe  Battery Electric Vehicle|  16.7 kWh          11.6             130           100            167                    NA              Rear Wheel Drive
NumberofSeats   PriceinGermany(â‚¬)   PriceinUK(Â£)
      2               18460               19200

```
   //Explain
   - รถที่ขับเคลื่อนด้วยล้อหน้า ซึ่งมีราคาต่ำที่สุดคือ Fiat 500e Hatchback 24 kWh โดยมีความเร็วสูงสุดอยู่ที่ 135 km/h
   - รถที่ขับเคลื่อน 4 ล้อ ซึ่งมีราคาต่ำที่สุดคือ Skoda Enyaq iV 80X โดยมีความเร็วสูงสุดอยู่ที่ 160 km/h
   - รถที่ขับเคลื่อนด้วยล้อหลัง ซึ่งมีราคาต่ำที่สุดคือ Smart EQ fortwo coupe โดยมรความเร็วสูงสุดอยู่ที่ 130 km/h

### 8) รถคันใดที่มีประสิทธิภาพสูงสูด เมื่อเทียบกับรถคันอื่นๆในชุดข้อมูล
```{R}
vehicle %>% filter(`Efficiency(Wh/km)` == max(`Efficiency(Wh/km)`))
```
Result :
```
   Name                                         Subtitle          Acceleration(sec)  TopSpeed(km/h)  Range(km)   Efficiency(Wh/km)   FastChargeSpeed(km/h)       Drive
1  Mercedes EQV 300 Long Battery        Electric Vehicle|  90 kWh       12.1            160             320            281                 280           Front Wheel Drive
2  Mercedes EQV 300 Extra-Long Battery  Electric Vehicle|  90 kWh       12.1            160             320            281                 280            Front Wheel Drive
  
          NumberofSeats     PriceinGermany(â‚¬)      PriceinUK(Â£)
1               7               71388                   70665 
2               7               72281                     NA
```
   //Explain
   - รถที่มีประสิทธิภาพสูงที่สุดเมื่อเปรียบเทียบกับคันอื่นๆในชุดข้อมูลเดียวกันคือ Mercedes EQV 300 Long Battery และ Mercedes EQV 300 Extra-Long Battery โดยรถทั้ง 2 คันนั้นมีประสิธิภาพและสมรรถนะต่างๆที่เท่ากัน แตกต่างกันเพียงราคาเท่านั้น

### 9) ประสิทธิภาพโดยเฉลี่ยของรถทั้งหมด
```{R}
vehicle %>% summarise(mean(`Efficiency(Wh/km)`))
```
Result :
```
        mean(`Efficiency(Wh/km)`)
1               194.2722
```
   //Explain
   - ประสิทธิภาพโดยเฉลี่ยของรถพลังงานไฟฟ้าทุกคันในข้อมูลชุดนี้คือ 194.2722 Wh/km

