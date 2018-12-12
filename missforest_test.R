setwd("/Users/yasuchikaonuki/dev/work/imputation")
df <- read.csv("track_A_1_100000.csv",header=T,na.strings=c("", "NULL"))
df[!complete.cases(df),]
# まあこの辺は削ってしまいます
df$date <- NULL
df$キロ程 <- NULL
library(missForest)
imp.mf <- missForest(df,
                     maxiter = 10,
                     ntree = 100,
                     mtry = floor(sqrt(ncol(df))),
                     verbose = TRUE)
imp.mf$OOBerror
imp.mf
imp.mf[!complete.cases(imp.mf),]
write.csv(imp.mf$ximp, "result_100000.csv", row.names=FALSE, quote=FALSE)
