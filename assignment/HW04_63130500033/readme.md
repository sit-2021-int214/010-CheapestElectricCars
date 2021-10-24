# R-Assignment 4

**Created by Name-Surname (ID: xxxxxxxxxx)**

Choose Dataset: Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)

### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2

## Part 1: Explore the dataset

```
# Library
library(dplyr)
library(readr)
library(stringr)
install.packages("ggplot2")
library(ggplot2)

# Dataset
topBooks <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

```

ภายใน dataset ประกอบไปด้วยข้อมูลจำนวน 271 ข้อมูล และ 7 คอลัมน์



## Part 2: Learning function from Tidyverse

- Function `select()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for select columns

```
starwars %>% select(name,height)
```
** You can sepearate this part or combine in part of `Transform data with dplyr and finding insight the data`

## Part 3: Transform data with dplyr and finding insight the data

1.ราคาเฉลี่ยของหนังสือทั้งหมดเป็นเท่าไหร่

```
topBooks$Price %>% mean()
```

Result:

```
[1] 54.54186
```
//Explain

2.หนังสือโดยเฉลี่ยแล้วมีทั้งกี่หน้า

```
mean(topBooks$Number_Of_Pages)
```

Result:

```
[1] 475.0775
```
//Explain

3.หนังสือที่มีจำนวนหน้ามากที่สุดและน้อยที่สุดคือหนังสือเล่นใด มีราคาเท่าไหร่ และหนังสือนั้นมีกี่หน้า

```
#หนังสือที่จำนวนหน้ามากที่สุด
topBooks %>% filter(Number_Of_Pages==max(Number_Of_Pages)) %>% select(Book_title,Price,Number_Of_Pages)

#หนังสือที่จำนวนหน้าน้อยที่สุด
topBooks %>% filter(Number_Of_Pages==min(Number_Of_Pages)) %>% select(Book_title,Price,Number_Of_Pages)
```

Result:

```
#หนังสือที่จำนวนหน้ามากที่สุด
                                              Book_title       Price     Number_Of_Pages
1 The Art of Computer Programming, Volumes 1-4a Boxed Set   220.3853                3168

#หนังสือที่จำนวนหน้าน้อยที่สุด
                                    Book_title       Price     Number_Of_Pages
1 Responsive Web Design Overview For Beginners     11.26765                50
```
//Explain

4.ในหนังสือแต่ละประเภท(type) หนังสือเล่มใดที่มีความนิยมสูงสุด

```
topBooks %>% select(Rating,Book_title,Type) %>% group_by(Type) %>% filter(Rating == max(Rating)) %>% select(Book_title,Rating)
```

Result:

```
Type                    Book_title                                                       Rating
#<chr>                  <chr>                                                            <dbl>
#1 ebook                 Your First App: Node.js                                         5   
#2 Kindle Edition        The Principles of Object-Oriented JavaScript                    4.35
#3 Unknown Binding       How to Think Like a Computer Scientist: Learning with Python    4.11
#4 Paperback             Designing Data-Intensive Applications: The Big Ideas Behind ~   4.72
#5 Boxed Set - Hardcover The Art of Computer Programming, Volumes 1-3 Boxed Set          4.49
#6 Hardcover             The Art of Computer Programming, Volumes 1-4a Boxed Set         4.77
```
//Explain

5.ชื่อหนังสือเล่มใดบ้างที่มีคำว่า Network

```
str_subset(topBooks$Book_title,"Network")
```

Result:

```
#[1] "Make Your Own Neural Network: An In-depth Visual Introduction For Beginners"
#[2] "High Performance Browser Networking"                                        
#[3] "Make Your Own Neural Network"                                               
#[4] "Communication Networks: Fundamental Concepts and Key Architectures"     

```
//Explain

6.หนังสือที่ได้รับความนิยมสูงสุดคือเล่มใด และมีเรทติ้ง จำนวนคนรีวิว ชนิดของหนังสือ และราคาเท่าใด

```
topBooks %>% filter(Rating==max(Rating)) %>% select(Book_title,Rating,Reviews,Type,Price)
```

Result:

```
                Book_title       Rating      Reviews       Type        Price
#1 Your First App: Node.js            5            0      ebook     25.85588
```
//Explain

## Part 4: Visualization with GGplot2
### 1.) กราฟแสดงความสัมพันธ์ระหว่างชนิดของหนังสือกับจำนวนของหนังสือในแต่ละชนิด
```
numberOfBooks_eachType <- table(topBooks$Type)
ggplot(topBooks,aes(x=Type))+geom_bar()+ggtitle("Number of Book in each type")+xlab("Type of Book")+ylab("Number of Books")

```
Result:

![totalCategory](plot1.png)

### 2.) กราฟแสดงความสัมพันธ์ระหว่างราคากับจำนวนหน้าของหนังสือประเภท ebook
```
eBook<-topBooks %>% filter(topBooks$Type == "ebook") 
eBook %>% ggplot(aes(x=Number_Of_Pages,y=Price))+geom_point()

```
Result:

![point](plot2.png)


