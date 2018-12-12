library(mice)
setwd("/Users/yasuchikaonuki/dev/work/imputation")
df <- read.csv("track_A_1_100000.csv",header=T,na.strings=c("", "NULL"))
df$date <- NULL
df$キロ程 <- NULL
summary(df)
imputed_Data <- mice(df, m=5, maxit = 50, method = 'pmm', seed = 500)
summary(imputed_Data)
completeData <- complete(imputed_Data,2)
summary(completeData)
class(completeData)
write.csv(completeData, "mice_result_100000.csv", row.names=FALSE, quote=FALSE)