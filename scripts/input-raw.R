library(xlsx)
# dados.seq <- read.xlsx("../2016-10-26 TVP REV  2010 11 12 13 14.xlsx",1)

write.table(dados.raw, "dataset/vc-dados.dat")
rm(dados.raw)
