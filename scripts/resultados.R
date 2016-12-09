# requisitos --------------------------------------------------------------

source("scripts/descritivas.R")

traduzir_tabela <- function(x) {
  temp <- pander_return(print(x,printToggle = F, exact = T))
  temp <- gsub("level", "Categoria", temp)
  temp <- gsub("Overall", "Quantidade", temp)
  temp <- gsub("mean", "média", temp)
  temp <- gsub("\\(sd\\)", "(DP)", temp)
}

# pander config -----------------------------------------------------------

library(pander)
panderOptions('table.style', 'rmarkdown')

# tabela 1 ----------------------------------------------------------------

tab1.output <- traduzir_tabela(tabela1)

# medicamentos ------------------------------------------------------------

med.output <- traduzir_tabela(medicamentos)
med.sexo.output <- traduzir_tabela(medicamentos.Sexo)

# comorbidades ------------------------------------------------------------

comorb.output <- traduzir_tabela(comorbidades)

# centros -----------------------------------------------------------------

centros.output <- traduzir_tabela(centros)
centros.enoxa.output <- traduzir_tabela(centros.enoxa)