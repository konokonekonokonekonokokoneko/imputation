library(mice)
# ディレクトリどうしようかな？調べるのがめんどいな　→直書きです
setwd("/Users/yasuchikaonuki/dev/work/imputation/date")
# コマンドラインオプション
args <- commandArgs(trailingOnly=TRUE)
# デフォルトはなし
# ファイルはこんな感じ
#           V1    V2     V3     V4     V5     V6    V7     V8    V9
#1     2018-03-03 10000  -0.37   1.10   2.41   0.81 -0.82   4.77 51.00
#2     2018-03-03 10001   2.05   2.32   2.04  -0.34 -0.35   5.21 51.00
# いよいよファイルを読みます
df <- read.csv(args[1], header=FALSE, na.strings=c("", "NULL"))
# V1とV2はいらない
df$V1 <- NULL
df$V2 <- NULL
# パラメータをチューニングする必要はあるかな？
imputed_Data <- mice(df, m=5, maxit=50, method='pmm', seed=500)
summary(imputed_Data)
completeData <- complete(imputed_Data, 2)
summary(completeData)
# 書き込みのディレクトリを変えよう
setwd("/Users/yasuchikaonuki/dev/work/imputation/imputated")
write.csv(completeData, args[2], row.names=FALSE, quote=FALSE, header=FALSE)