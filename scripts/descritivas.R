library(tableone)
tabela1 <- CreateTableOne(data = dados)
print(tabela1, showAllLevels = T)
