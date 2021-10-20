
# 010 CheapestElectricCars

Original Datasets from: [kaggle](https://www.kaggle.com/kkhandekar/cheapest-electric-cars?fbclid=IwAR0_1it-Db3IslU0N8CIyAZtnZmBqfDQXAeH6h04Z-xnvnfhe4CUeVlgDxk)

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
# Step 2 Examining your data prior to further exploration.
#### สำรวจข้อมูลทั้งหมดของ Dataset ว่ามีข้อมูลอะไรบ้าง
```{R}
worldcup <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/015-WorldCup/master/WorldCupMatches.csv")
str(worldcup)
```
| ลำดับ | ชื่อคอลัมน์          | รายละเอียด                                                             | ประเภท    | ตัวอย่างข้อมูล                |
|-------|----------------------|------------------------------------------------------------------------|-----------|-------------------------------|
| 1     | Year                 | ปีที่แข่งขัน                                                           | integer   | 1930                          |
| 2     | Datetime             | วันเวลาที่แข่งขัน                                                      | character | "13/7/1930 15:00"             |
| 3 | Stage                | ชื่อรอบที่แข่งขัน                                                      | character | "Group 1"                     |
| 4 | Stadium              | ชื่อสนามที่ใช้ในการแข่งขัน                                             | character | "Pocitos"                     |
| 5 | City                 | เมืองที่ตั้งของสนามแข่งขัน                                             | character | "Montevideo"                  |
| 6 | Home.Team.Name       | ชื่อทีมเจ้าบ้านในการแข่งขันนั้น                                        | character | "France"                      |
| 7 | Home.Team.Goals      | คะแนนประตูของทีมเจ้าบ้าน ในครึ่งแรก                                    | integer   | 4                             |
| 8 | Away.Team.Goals      | คะแนนประตูของทีมเยือน ในครึ่งแรก                                       | integer   | 1                             |
| 9 | Away.Team.Name       | ชื่อทีมเยือนในการแข่งขันนั้น                                           | character | "Mexico"                      |
| 10 | Win.conditions       | เงื่อนไขที่ชนะ สำหรับกรณีที่ชนะแบบพิเศษ เช่น ชนะเพราะการแข่งขันเวลานอก | character | Austria win after extra time  |
| 11 | Attendance           | จำนวนผู้ชมการแข่งขัน                                                   | integer   | 18346                         |
| 12 | Half.time.Home.Goals | คะแนนประตูของทีมเจ้าบ้าน ในครึ่งหลัง                                   | integer   | 3                             |
| 13 | Half.time.Away.Goals | คะแนนประตูของทีมเยือน ในครึ่งหลัง                                      | integer   | 1                             |
| 14 | Referee              | ชื่อผู้ตัดสิน                                                          | character | "LOMBARDI Domingo (URU)"      |
| 15 | Assistant.1          | ชื่อผู้ช่วยผู้ตัดสิน คนที่ 1                                           | character | "CRISTOPHE Henry (BEL)"       |
| 16 | Assistant.2          | ชื่อผู้ช่วยผู้ตัดสิน คนที่ 2                                           | character | "REGO Gilberto (BRA)"         |
| 17 | RoundID              | รหัสประจำของรอบการแข่งขัน                                              | integer   | 201                           |
| 18 | MatchID              | รหัสประจำของคู่การแข่งขันนั้นๆ                                         | integer   | 1096                          |
| 19 | Home.Team.Initials   | ชื่อย่อของทีมเจ้าบ้าน                                                  | character | "FRA"                         |
| 20 | Away.Team.Initials   | ชื่อย่อของทีมเยือน                                                     | character | "MEX"                         |


# Step 3 Clean Data 
#### ก่อนที่จะเริ่มทำโจทย์ต้องดูข้อมูลที่ได้มาก่อน แล้วถ้าได้ข้อมูลมาแล้วก็เอามาจัดการความเรียบร้อย โดยการเอาข้อมูลที่ได้มา clean เพื่อให้ได้ชุดข้อมูลที่เรียบร้อย 
```{R}
worldcup$Away.Team.Name <- worldcup$Away.Team.Name %>% str_remove('rn">')
worldcup$Home.Team.Name <- worldcup$Home.Team.Name %>% str_remove('rn">')
worldcup$Stadium <- worldcup$Stadium %>% str_remove('ฟฝ') %>% str_remove('ฟฝ') %>% str_remove('ï¿½') %>% str_remove('�') 
worldcup$City <- worldcup$City %>% str_remove('ฟฝ') %>% str_remove('ฟฝ') %>% str_remove('ï¿½') %>% str_remove('�') 
worldcup$Referee <- worldcup$Referee %>% str_remove('ฟฝ') %>% str_remove('ฟฝ') %>% str_remove('ï¿½') %>% str_remove('�') 
worldcup$Assistant.1 <- worldcup$Assistant.1 %>% str_remove('ฟฝ') %>% str_remove('ฟฝ') %>% str_remove('ï¿½') %>% str_remove('�') 
worldcup$Assistant.2 <- worldcup$Assistant.2 %>% str_remove('ฟฝ') %>% str_remove('ฟฝ') %>% str_remove('ï¿½') %>% str_remove('�') 
View(worldcup)
```

#### เมื่อ clean ข้อมูลเสร็จแล้ว เราสามารถใช้ glimpse function ในการเรียกดูข้อมูลได้
```{R}
glimpse(worldcup)
```

#### Result :
```{R}
Rows: 852
Columns: 20
$ Year                 <int> 1930, 1930, 1930, 1930, 1930, 1930, 1930, 1930, 1930, 1930, 1930, 1930, 1930, 1930, 1930, ~
$ Datetime             <chr> "13/7/1930 15:00", "13/7/1930 15:00", "14/7/1930 12:45", "14/7/1930 14:50", "15/7/1930 16:~
$ Stage                <chr> "Group 1", "Group 4", "Group 2", "Group 3", "Group 1", "Group 1", "Group 2", "Group 4", "G~
$ Stadium              <chr> "Pocitos", "Parque Central", "Parque Central", "Pocitos", "Parque Central", "Parque Centra~
$ City                 <chr> "Montevideo ", "Montevideo ", "Montevideo ", "Montevideo ", "Montevideo ", "Montevideo ", ~
$ Home.Team.Name       <chr> "France", "USA", "Yugoslavia", "Romania", "Argentina", "Chile", "Yugoslavia", "USA", "Urug~
$ Home.Team.Goals      <int> 4, 3, 2, 3, 1, 3, 4, 3, 1, 1, 6, 4, 1, 4, 3, 6, 6, 4, 3, 4, 3, 3, 5, 3, 7, 2, 3, 2, 1, 2, ~
$ Away.Team.Goals      <int> 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1, 1, 1, 2, 2, 2, 2, 2, 2, 1, 1, 1, 2, 1, 1, 1, ~
$ Away.Team.Name       <chr> "Mexico", "Belgium", "Brazil", "Peru", "France", "Mexico", "Bolivia", "Paraguay", "Peru", ~
$ Win.conditions       <chr> " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", ~
$ Attendance           <int> 4444, 18346, 24059, 2549, 23409, 9249, 18306, 18306, 57735, 2000, 42100, 25466, 12000, 700~
$ Half.time.Home.Goals <int> 3, 2, 2, 1, 0, 1, 0, 2, 0, 0, 3, 1, 1, 4, 2, 1, 3, 1, 0, 2, 2, 1, 1, 3, 3, 0, 1, 0, 0, 1, ~
$ Half.time.Away.Goals <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 2, 0, 2, 1, 1, 2, 0, 0, 1, 1, 0, 0, 0, ~
$ Referee              <chr> "LOMBARDI Domingo (URU)", "MACIAS Jose (ARG)", "TEJADA Anibal (URU)", "WARNKEN Alberto (CH~
$ Assistant.1          <chr> "CRISTOPHE Henry (BEL)", "MATEUCCI Francisco (URU)", "VALLARINO Ricardo (URU)", "LANGENUS ~
$ Assistant.2          <chr> "REGO Gilberto (BRA)", "WARNKEN Alberto (CHI)", "BALWAY Thomas (FRA)", "MATEUCCI Francisco~
$ RoundID              <int> 201, 201, 201, 201, 201, 201, 201, 201, 201, 201, 201, 201, 201, 201, 201, 202, 202, 405, ~
$ MatchID              <int> 1096, 1090, 1093, 1098, 1085, 1095, 1092, 1097, 1099, 1094, 1086, 1091, 1089, 1100, 1084, ~
$ Home.Team.Initials   <chr> "FRA", "USA", "YUG", "ROU", "ARG", "CHI", "YUG", "USA", "URU", "CHI", "ARG", "BRA", "PAR",~
$ Away.Team.Initials   <chr> "MEX", "BEL", "BRA", "PER", "FRA", "MEX", "BOL", "PAR", "PER", "FRA", "MEX", "BOL", "BEL",~
```

# Step 4 Defind a question
1. คู่ไหนที่ทีมเหย้าและทีมเยือน ยิงประตูในครึ่งหลังรวมกันเกิน 4 ลูก
2. สนามไหนที่ใช้ในการจัดแข่งขันบอลโลกทั้งหมด 10 ครั้ง
3. ผลรวมของจำนวนประตูในครึ่งแรก และ ผลรวมของจำนวนประตูในครึ่งหลัง ในปี 1930 มีค่าเท่าไหร่
4. การแข่งขันฟุตโลกในรอบไหนที่มีผู้เข้ารับชมเกิน 100,000 คน
5. ในการแข่งขันปีไหนที่มีจำนวนการยิงประตูรวมมากที่สุด

# Step 5 Do the Question 
### 1.) คู่ไหนที่ทีมเหย้าและทีมเยือน ยิงประตูในครึ่งหลังรวมกันเกิน 4 ลูก
```{R}
halfGoals <- worldcup %>% 
  distinct() %>% 
  select(Datetime,Home.Team.Name,Half.time.Home.Goals,Away.Team.Name,Half.time.Away.Goals) %>% 
  rename(Home.Team.Goals = Half.time.Home.Goals,Away.Team.Goals = Half.time.Away.Goals) %>% 
  filter(Away.Team.Goals + Home.Team.Goals > 4)
halfGoals <- halfGoals %>% 
  mutate(Total.Goals = Home.Team.Goals + Away.Team.Goals)
View(halfGoals)
```

#### Result : คู่ที่ทีมเหย้าและทีมเยือนยิงประตูครึ่งหลังรวมกันเกิน 4 ลูก ได้แก่ Austria Vs Switzerland ,  Portugal Vs Korea DPR , Yugoslavia Vs Zaire , Haiti Vs Poland , Brazil Vs Germany
```{R}
Datetime             Home.Team.Name  Home.Team.Goals  Away.Team.Name  Away.Team.Goals  Total.Goals
26/6/1954 17:00      Austria               5          Switzerland            4             9
23/7/1966 15:00      Portugal              2          Korea DPR              3             5
18/6/1974 19:30      Yugoslavia            6          Zaire                  0             6
19/6/1974 19:30      Haiti                 0          Poland                 5             5
8/7/2014 17:00       Brazil                0          Germany                5             5
```


### 2.) สนามไหนที่ใช้ในการจัดแข่งขันบอลโลกทั้งหมด 10 ครั้ง
```{R}
factor(worldcup$Stadium) 
stadium <- factor(worldcup$Stadium) 
summary(stadium) 
which(summary(stadium)==10)
```
#### Result : สนามที่ใช้ในการแข่งขันทั้งหมด 10 ครั้งคือสนาม 
```{R}
Estadio Centenario / Estadio do Maracana / Estadio Nacional / Nacional                                                                        
```

### 3.) ผลรวมของจำนวนประตูในครึ่งแรก และ ผลรวมของจำนวนประตูในครึ่งหลัง ในปี 1930 มีค่าเท่าไหร่
```{R}
totalGoals <- worldcup %>% 
  select(Year,Home.Team.Goals,Half.time.Home.Goals) %>% 
  filter(worldcup$Year == 1930) %>% 
  summarise(sum.Home.Team.1930 = sum(Home.Team.Goals), 
            sum.Half.Time.Home.Team.1930 = sum(Half.time.Home.Goals))
View(totalGoals)
```
#### Result : จำนวนประตูครึ่งแรกและครึ่งหลังในปี 1930 มีจำนวนประตูครึ่งแรกทั้งหมด 59 ประตู และ จำนวนประตูในครึ่งหลังมีทั้งหมด 27 ประตู
```{R}
sum.Home.Team.1930 || sum.Half.Time.Home.Team.1930
                59                              27
```
### 4.) การแข่งขันฟุตโลกในรอบไหนที่มีผู้เข้ารับชมเกิน 100,000 คน
```{R}
Attendance <- worldcup %>% 
  select(Year, Home.Team.Name, Away.Team.Name, Attendance)%>%filter(Attendance > 100000)
View(Attendance)
```
#### Result : รอบที่มีผู้เข้าชมเกิน 100,000 คน คือ
```{R}	
    Year      Home.Team.Name  Away.Team.Name   Attendance
1   1950      Brazil          Yugoslavi        142429
2   1950      Brazil          Sweden           138886
3   1950      Brazil          Spain            152772
4   1950      Uruguay         Brazil           173850
5   1970      Mexico          Soviet Union     107160
6   1970      Mexico          El Salvador      103058
7   1970      Mexico          Belgium          108192
8   1970      Italy           Germany FR       102444
9   1970      Germany FR      Uruguay          104403
10  1970      Brazil          Italy            107412
11  1986      Belgium         Mexico           110000
12  1986      Mexico          Paraguay         114600
13  1986      Iraq            Mexico           103763
14  1986      Mexico          Bulgaria         114580
15  1986      Argentina       England          114580
16  1986      Argentina       Belgium          114500
17  1986      Argentina       Germany FR       114600
```
### 5.) ในการแข่งขันปีไหนที่มีจำนวนการยิงประตูรวมมากที่สุด
```{R}
maximumGoals <- worldcup %>% 
  mutate(Total.Goals = worldcup$Home.Team.Goals + worldcup$Away.Team.Goals + worldcup$Half.time.Home.Goals + worldcup$Half.time.Away.Goals)
maximumGoals <- maximumGoals %>% 
  group_by(Year) %>% 
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
