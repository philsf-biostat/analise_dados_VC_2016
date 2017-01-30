# requisitos --------------------------------------------------------------

source("scripts/descritivas.R")

traduzir_tabela <- function(x) {
  temp <- as.data.frame(print(x,printToggle = F, exact = T))
  temp <- temp[!names(temp) %in% "test"] # retirar coluna "test"
  temp <- pander_return(temp)
  temp <- gsub("level", "Categoria", temp)
  temp <- gsub("Overall", "Quantidade", temp)
  temp <- gsub("mean", "média", temp)
  temp <- gsub("\\(sd\\)", "(DP)", temp)
  temp <- gsub("= SIM ", "", temp)
}

# pander config -----------------------------------------------------------

library(pander)
panderOptions('table.style', 'rmarkdown')
panderOptions('table.split.table', 95)


# tabela 1 ----------------------------------------------------------------

tab1.output <- traduzir_tabela(tabela1)

# medicamentos ------------------------------------------------------------

med.output <- traduzir_tabela(medicamentos)
med.Genero.output <- traduzir_tabela(medicamentos.Genero)
med.Idade.output <- traduzir_tabela(medicamentos.Idade)

# comorbidades ------------------------------------------------------------

comorb.output <- traduzir_tabela(comorbidades)
comorb.idade.output <- traduzir_tabela(comorbidades.idade)
comorb.genero.output <- traduzir_tabela(comorbidades.genero)

# centros -----------------------------------------------------------------

centros.output <- traduzir_tabela(centros)
# centros.dabi.output <- traduzir_tabela(centros.dabi)
# centros.enoxa.output <- traduzir_tabela(centros.enoxa)
# centros.riva.output <- traduzir_tabela(centros.riva)
# centros.warfa.output <- traduzir_tabela(centros.warfa)
centro.tep.output <- traduzir_tabela(centro.tep)
centro.spt.output <- traduzir_tabela(centro.spt)
