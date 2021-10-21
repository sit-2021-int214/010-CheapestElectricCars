library(dplyr)
library(readr)      
library(ggplot2)
library(stringr)
library(assertive)

#Load data
Books <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")



#1 Find the highest-rated books of ebook and paperback type.
BookPaperback <- Books %>% filter(Type == "Paperback")
BookEbook <- Books %>% filter(Type == "ebook")
BookPaperback %>%filter(Price == max(BookPaperback$Price) ) %>% select(Book_title) 
BookEbook %>%filter(Price == max(BookEbook$Price) ) %>% select(Book_title) 



#2 Find books with more than 500 pages that have rating more than 4.5
Books %>%  select(Book_title , Price) %>% filter(Books$Rating > 4.5 & Books$Number_Of_Pages > 500)


#3 Search for books name related to JavaScript.
str_subset(Books$Book_title, "JavaScript")


#4 Find a ebook without reviews.
Books %>% filter(Books$Reviews == "0") %>% filter(Type == "ebook")  %>% select(Book_title)


#5 Find ebook books at the highest and lowest rating.
BookEbook <- Books %>% filter(Type == "ebook")
BookEbook %>%filter(Rating == max(BookEbook$Rating))%>% select(Book_title,Type,Price)
BookEbook %>%filter(Rating == min(BookEbook$Rating))%>% select(Book_title,Type,Price)


#6 Find books on programming that are Hardcover	.
ProgrammingBook <- Books %>% filter(Books$Type == "Hardcover") %>% select(Book_title , Price)
str_subset(ProgrammingBook$Book_title, "Programming") 


##ggplot
#1 Barplot

# Set data
count_BookType <-table(Books$Type)

# Create graph
barplot(count_BookType,
        main = "Number of Each Type Book",   # Title of graphs
        xlab = "Type of Books",       # X-Axis Title
        ylab = "Number of Books",    # Y-Axis Title
)


#2 Scatterplot

#set data
Books %>% filter(Books$Type == "Hardcover") 

# Create graph
scat_plot<-Books %>% filter(Books$Type == "Hardcover") %>% ggplot(aes(x=Rating,y=Price))+geom_point()
scat_plot


