# library(xlsx)
# dados.seq <- read.xlsx("../2016-10-26 TVP REV  2010 11 12 13 14.xlsx",1)

library(rio)

dados.seq <- import(file = "../2016-10-26 TVP REV  2010 11 12 13 14.xlsx", which = 1)
dados.seq$ANO <- 2010
dados.raw <- dados.seq

dados.seq <- import(file = "../2016-10-26 TVP REV  2010 11 12 13 14.xlsx", which = 2)
dados.seq$ANO <- 2011
dados.raw <- rbind(dados.raw, dados.seq)

dados.seq <- import(file = "../2016-10-26 TVP REV  2010 11 12 13 14.xlsx", which = 3)
dados.seq$ANO <- 2012
dados.raw <- rbind(dados.raw, dados.seq)

dados.seq <- import(file = "../2016-10-26 TVP REV  2010 11 12 13 14.xlsx", which = 4)
dados.seq$ANO <- 2013
dados.raw <- rbind(dados.raw, dados.seq)

dados.seq <- import(file = "../2016-10-26 TVP REV  2010 11 12 13 14.xlsx", which = 5)
dados.seq$ANO <- 2014
dados.raw <- rbind(dados.raw, dados.seq)

# str(dados.raw)

write.table(dados.raw, "dataset/vc-dados.dat")
rm(dados.raw, dados.seq)
