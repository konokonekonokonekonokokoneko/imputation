setwd("/Users/yasuchikaonuki/dev/work/imputation")
library(missForest)
library(mi)
#load data
data <- iris
#seed missing values ( 10% )
iris.mis <- prodNA(iris, noNA = 0.1)
summary(iris.mis)
#imputing missing value with mi
mi_data <- mi(iris.mis, seed = 335)
summary(mi_data)
mi_data <- mi(iris.mis, seed = 335)