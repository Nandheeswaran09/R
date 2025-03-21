grad <- read.csv("C:\\Users\\nandh\\Downloads\\housing.csv\\housing.csv")
grad

head(grad)
plot(log(grad$Midterm_Score,grad$Final_Score))

#splittting the data
set.seed(2)
install.packages("caTools")
library(caTools)

split<- sample.split(grad,SplitRatio=0.7)
split


#train,test
train <- subset(grad,split=="TRUE")
TEST <- subset(grad,split=="FALSE")

View(train)
View(TEST)


#createmodel
Model <- lm(median_house_value~.,data = train)
summary(Model)

pred <- predict(Model,TEST)
View(pred)
