#list is used to handle a tupple
#add apend a tupple(row) in a data frame
#vector - homogeneous elements  ->  2D - matrix
#list - heterogeneous element  ->  2D - dataframe
a <- format(233.123456789, digits = 9) #round - off thw 9th digit
print(a)

#Q1)
url <- "https://raw.githubusercontent.com/fivethirtyeight/data/master/daily-show-guests/daily_show_guests.csv"
daily <- read.csv(url)
head(daily ,10)
library(dplyr)
colnames(daily)

#Q2)
daily_renamed <- daily %>%
  rename(
    year = YEAR,
    job = GoogleKnowlege_Occupation,
    date = Show,
    category = Group,
    guest_name = Raw_Guest_List
  )
daily_renamed <- rename(daily ,
      year = YEAR,
      job = GoogleKnowlege_Occupation,
      date = Show,
      category = Group,
      guest_name = Raw_Guest_List
    )
colnames(daily_renamed)

#Q3)
subset <- select(daily_renamed, c(year,date,guest_name))
print(subset)
report <- daily_renamed %>% select(year,date,guest_name)
print(report)

#Q4)
ans <- daily_renamed %>% select(-year)
print(ans)

#Q5)
subset <- filter(daily_renamed, job=='actor' & guest_name=='ABC')
print(subset)
subset <- daily_renamed[daily_renamed$job=='actor'&daily_renamed$guest_name=='ABC',]
print(subset)
actor <- daily_renamed %>% filter(job=='actor' & guest_name=='ABC')
print(actor)


#Q6)
daily_renamed <- arrange(daily_renamed ,date)
print(select(daily_renamed, c(year,date,guest_name)))
daily_renamed$date <- as.Date(daily_renamed$date, format = "%Y-%m-%d")
sorted <- daily_renamed %>% arrange(date)
print(sorted)


#Q7)
sorted_experience <- sorted %>%
  mutate(Experience = "Unknown")  # Set default value for the new column
print(sorted_experience)





datestring <- c("January 10, 2012 10:40","December 9, 2011 10:40")
x <- strptime(datestring,"%B %d, %Y %H:%M")
print(x)

x <- list(2,"a","b",TRUE)
class(x[[1]])

x <- c(17,14,4,5,13,12,10)
x[x>=11]<-4
x





f <- function(x){
  y<-2
  y^2 + g(x)
}
g <- function(x){
  x^y
}
y <- 10
f(2+3)
g <- function(x){
  a <- 3
  x + a + y
}
g(2)



x <- matrix(1:6, 2 ,3)
i <- 2
j <- 3
for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print(x[i+j])
  }
}