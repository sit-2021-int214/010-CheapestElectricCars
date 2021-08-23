# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer1 : Survey

1.) หาว่ามีเพศไหนทำแบบสำรวจนี้เยอะกว่ากัน
```{R}
 table(survey$Sex)
```
#มีจำนวนเท่ากันคือ 118 คน

2.) หาว่าอายุเฉลี่ยของคนทำ survey คือเท่าไหร่
```{R}
mean(survey$Age)
```
#มีอายุเฉลี่ย 20

3.) หาค่าเฉลี่ยความสูงของคนทำ survey 
```{R}
mean(survey$Height,na.rm = TRUE)
```
#อายุเฉลี่ยคือ 20 ปี

4.) หามีผู้ทำ survey สูบบุหรี่จัดกี่คน
```{R}
table(survey$Smoke)
```
#มีผู้สูบบุหรี่จัด 11 คน

5.) ผู้ที่มีชีพจรเต้นด้วยอัตราน้อยที่สุด ว่าเต้นเท่าไหร่
```{R}
min(survey$Pulse,na.rm =  TRUE)
```
#35

### Answer2 : Cats
1.) แมวตัวที่ 5 มีน้ำหนักเท่าไหร่
```{R}
cats[5,"Hwt"]
```
#แมวตัวที่ 5 น้ำหนัก 7.3 kg

2.) แมวตัวผู้ ตัวเมีย ต่างกันกี่ตัว
```{R}
table(cats$Sex)
```
#F47 M97 97-47 = 50

3.) หาค่าเฉลี่ยของน้ำหนักตัวของแมวตัวผู้ 
```{R}
mcats <- cats[48:length(cats$Sex),]
mean(mcats$Bwt)
```
#น้ำหนักตัวเฉลี่ยของแมวตัวผู้อยู่ที่ 2.9 kg.

4.) น้ำหนักรวมของแมวทุกตัว
```{R}
sum(cats$Bwt)
```
#392.2 kg.

5.) แมวเพศเมียมีค่าเฉลี่ยน้ำหนักหัวใจอยู่ที่เท่าไหร่
```{R}
fcats <- cats[1:47,]
mean(fcats$Hwt)
```
#9.202128 g.


### Team: 010 นอนชนะ

1. กาญจนาพร   ชื่นมณีรัตน์     StudentID: 63130500005
2. ชยากร      งามโอฬารเลิศ   StudentID: 63130500017
3. ณัฐณิชา     ธรรมโชติ      StudentID: 63130500033
4. ณัฐธิดา      มีบุญ         StudentID: 63130500034
