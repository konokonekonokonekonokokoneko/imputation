setwd("/Users/yasuchikaonuki/dev/work/imputation")
#load data
data <- iris
#Get summary
summary(iris)
#Generate 10% missing values at Random
library(missForest)
iris.mis <- prodNA(iris, noNA = 0.1)
#Check missing values introduced in the data
summary(iris.mis)
#remove categorical variables
iris.mis <- subset(iris.mis, select = -c(Species))
#install MICE
library(mice)
#md.pattern(iris.mis)
imputed_Data <- mice(iris.mis, m=5, maxit = 50, method = 'pmm', seed = 500)
summary(imputed_Data)
#check imputed values
imputed_Data$imp$Sepal.Width
#get complete data ( 2nd out of 5)
completeData <- complete(imputed_Data,2)
summary(completeData)


#build predictive model
#fit <- with(data = iris.mis, exp = lm(Sepal.Width ~ Sepal.Length + Petal.Width))
#combine results of all 5 models
#combine <- pool(fit)
#summary(combine)


