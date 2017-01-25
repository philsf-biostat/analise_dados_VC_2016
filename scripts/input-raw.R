library(xlsx)

# a codificação dos dados está equivocada. nem latin1 nem utf8 funcionaram
dados.raw <- read.xlsx("../2016-12-06_TVP.xlsx",1 , encoding = "utf8")

write.csv2(dados.raw, "dataset/vc-dados.csv")
rm(dados.raw)
