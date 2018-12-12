# コマンドラインオプションとcsv readのヘッダ指定のテストです
args <- commandArgs(trailingOnly = T)
# デフォルトはなし
args
# 更にファイルの読み込みの結果です
setwd("/Users/yasuchikaonuki/dev/work/imputation/date")
df <- read.csv(args[1], header=F, na.strings=c("", "NULL")) # なぜ配列の始まりが1なんだろう？コマンドラインオプションって結構多かったっけ？0は全部か
df
