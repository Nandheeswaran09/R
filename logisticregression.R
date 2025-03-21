data <- read.csv("C:\\Users\\nandh\\Downloads\\housing.csv\\housing.csv")
data
data <- read.csv("C:\\Users\\nandh\\Downloads\\housing.csv\\housing.csv")
df <- data.frame(data) 

head(data)
ocean <- ifelse(df$ocean_proximity == "NEAR BAY", 1, 0)

#split

library(caTools)
split<- sample.split(df,SplitRatio = 0.8)
View(Split)

#test
train<- subset(df,split == "TRUE")
test <- subset(df,split=="FALSE")

View(train)
View(test)


#creatmodel
model <-glm(ocean ~ median_house_value+median_income ,data = df,family = 'binomial')

summary(model)



res<-predict(model,type= "response")
res

#res <- predict(model,train,type="response")
#res

# Convert probabilities to class labels (1 if > 0.5, else 0)
predicted_class <- ifelse(res > 0.5, 1, 0)


# Create confusion matrix
conf_matrix <- table(Predicted = res, Actual = df$ocean)

# Display the confusion matrix
print(conf_matrix)


# Calculate Accuracy
accuracy <- mean(predicted_class == ocean)

# Print Accuracy as %
print(paste("Accuracy:", round(accuracy * 100, 2), "%"))
