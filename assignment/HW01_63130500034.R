##Exercise 1##

ex1 <- c(10.4, 5.6, 3.1, 6.4, 21.7)
ex1
mean(ex1)
median(ex1)
sum(ex1)
sd(ex1)
var(ex1)
#average = 9.44
#sum = 47.2
#median = 6.4
#sd = 7.33846
#variance = 53.853



##Exercise 2##

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


#explain why you using this data structure 
#=Make it easier to see information

##Finding the information##
#The numbers of movies 
#= 27
length(names)

#Finding the 19th movies name 
#= Avengers: Infinity War 
movies <- data.frame(names,years)
movies

#Which year is most released movies 
#= 2017, 2021
table(years)
sort(table(years))

