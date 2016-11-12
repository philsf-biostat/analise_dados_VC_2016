source("scripts/descritivas.R")

library(pander)
panderOptions('table.style', 'rmarkdown')


# tabela 1 ----------------------------------------------------------------

tab1.output <- capture.output(pander(print(tabela1, showAllLevels = T, printToggle = F)))
tab1.output <- gsub("level", "", tab1.output)
tab1.output <- gsub("Overall", "Global", tab1.output)
tab1.output <- gsub("mean", "média", tab1.output)
tab1.output <- gsub("\\(sd\\)", "(DP)", tab1.output)

# medicamentos ------------------------------------------------------------

med.output <- capture.output(pander(print(medicamentos, showAllLevels = T, printToggle = F)))
med.output <- gsub("level", "", med.output)
med.output <- gsub("Overall", "Global", med.output)

# comorbidades ------------------------------------------------------------

comorb.output <- capture.output(pander(print(comorbidades, showAllLevels = T, printToggle = F)))
comorb.output <- gsub("level", "", comorb.output)
comorb.output <- gsub("Overall", "Global", comorb.output)
