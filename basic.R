install.packages("dplyr")
library(dplyr)

install.packages("nycflights13")
library("nycflights13")

View(flights)
head(flights)

#filter
f1 <- filter(flights,month==07)
View(f1)

f2 <- filter(flights,day==2,dep_time>500)
View(f2)

#using and or not operator
f3 <- filter(flights[day==6 & month==2 & dep_time>600])
View(f3)

#mutate and transmute
over <- mutate(flights,over=arr_delay-dep_delay)
View(over)


over <- transmute(flights,over=arr_delay-dep_delay)
View(over)

#summarise
summarise(flights,avg_air_time = mean(air_time,na.rm=T))


a<-flights %>% select(-year) %>% arrange(desc(dep_time))
a
a
a
print(a)  


install.packages('tidyr')
library('tidyr')
wide <- data.frame(
  CUSTOMER_ID <- c(1:250),
  PRODUCT_NANE <-c(LETTERS,20)
)

