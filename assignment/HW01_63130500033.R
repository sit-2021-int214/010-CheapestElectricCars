
#Exercise 1
value <- c(10.4,5.6,3.1,6.4,21.7)
mean(value) # 9.44
sum(value) # 47.2
median(value) #6.4
sd(value) #7.33846
var(value) #53.853

----------------------------------------------------------
  
#Exercise 2
# List of Marvel movies (Order by Marvel Phase released)
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
             "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
             "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
             "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
             "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
             "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

# List of released year of Marvel movies
years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
           2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)

# Or using Function
years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

#2.1
marvel_movies <- data.frame(names,years)
View(marvel_movies)

#2.2
length(names) #27
names[19] #"Avengers: Infinity War"
?frequency

# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
modeOfYears <- getmode(years)
print(modeOfYears) 
#จากฟังก์ชันจะได้คำตอบคือปี2017แต่เมื่อพิจารณาด้วยสายตาแล้ว
#จะได้ว่าปีที่มีการปล่อยภาพยนกมามีที่สุดมีจำนวน2ปีคือ ปี2017 และปี2021

