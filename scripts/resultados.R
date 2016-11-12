source("scripts/descritivas.R")

library(pander)
panderOptions('table.style', 'rmarkdown')


# tabela 1 ----------------------------------------------------------------

tab1.output <- capture.output(pander(print(tabela1, showAllLevels = T, printToggle = F)))
tab1.output <- gsub("mean", "média", tab1.output)
tab1.output <- gsub("\\(sd\\)", "(DP)", tab1.output)
cat(tab1.output, file = "resultados/tabela1.md", sep = "\n")

# medicamentos ------------------------------------------------------------

med.output <- capture.output(pander(print(medicamentos, showAllLevels = T, printToggle = F)))
cat(med.output, file = "resultados/medicamentos.md", sep = "\n")

# comorbidades ------------------------------------------------------------

comorb.output <- capture.output(pander(print(comorbidades, showAllLevels = T, printToggle = F)))
cat(comorb.output, file = "resultados/comorbidades.md", sep = "\n")
