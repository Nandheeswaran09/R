#loading packages

install.packages("FSelector") 
#informationgain,gainratio,#chi-square
install.packages("rpart") 
#tocreate descion_tree
install.packages("caret",dependencies = TRUE)
#datapreprocessing,featureselection,modeltraining,modelevalution,cross-validation
install.packages("dplyr")
#datamanipulation
install.packages("rpart.plot")
install.packages("xlsx")
install.packages("data.tree")
#create, manipulate, and visualize tree-like hierarchical data
install.packages("caTools")
#splitting data into training and test sets. 

# Download the archive manually
url <- "https://cran.r-project.org/src/contrib/Archive/ElemStatLearn/ElemStatLearn_2015.6.26.2.tar.gz"
download.file(url, destfile = "ElemStatLearn.tar.gz", mode = "wb")

# Install from the downloaded file
install.packages("ElemStatLearn.tar.gz", repos = NULL, type = "source")

install.packages("ElemStatLearn")


library(FSelector)
library(rpart)
library(caret)
library(dplyr)
library(rpart.plot)
library(xlsx)
library(data.tree)
library(caTools)
library(ElemStatLearn)


df<-read.csv("C:\\Users\\nandh\\Downloads\\archive (10)\\Students_Grading_Dataset.csv")
df<-data.frame(df)
View(df)

#select
df<-select(df,Final_Score,Total_Score,Grade,Gender)
df<-mutate(df,Final_Score=as.numeric(Final_Score),Total_Score=as.numeric(Total_Score),Grade=factor(Grade),Gender=factor(Gender))
View(df)


#splitting data fro train and test
set.seed(123)
split <- sample.split(df1$Gender, SplitRatio = 0.7)

# Create training and testing datasets
train_data <- subset(df, split == TRUE)
test_data  <- subset(df, split == FALSE)


#trainthe datasets
tree<-rpart(Gender~.,data = train_data)

#predict
tree.grade.predicted <- predict(tree,test_data,type='class')

#confusion
confusionMatrix(tree.grade.predicted,test_data$Gender)


#Visualizing the decsion trree
prp(tree)
