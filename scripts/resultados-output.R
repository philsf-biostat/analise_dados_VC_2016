# setup --------------------------------------------------------------
library(knitr)
source("scripts/resultados.R")

# locale BR ---------------------------------------------------------------

suppressWarnings(Sys.setlocale("LC_NUMERIC", "pt_BR.UTF-8"))

# tabela 1 ----------------------------------------------------------------

cat(pander_return(tab1), file = "resultados/tabela1_genero.md", sep = "\n")
pandoc("resultados/tabela1_genero.md", format = c("latex", "docx"))
write.csv2(tab1, "resultados/tabela1_genero.csv")

cat(pander_return(tab2), file = "resultados/tabela1.md", sep = "\n")
pandoc("resultados/tabela1.md", format = c("latex", "docx"))
write.csv2(tab2, "resultados/tabela1.csv")

# medicamentos ------------------------------------------------------------

cat(med.output, file = "resultados/medicamentos.md", sep = "\n")
pandoc("resultados/medicamentos.md", format = c("latex", "docx"))
write.csv2(print(medicamentos, exact = T, printToggle = F), "resultados/medicamentos.csv")

cat(med.Genero.output, file = "resultados/medicamentos_Genero.md", sep = "\n")
pandoc("resultados/medicamentos_Genero.md", format = c("latex", "docx"))
write.csv2(print(medicamentos.Genero, exact = T, printToggle = F), "resultados/medicamentos_Genero.csv")

cat(med.Idade.output, file = "resultados/medicamentos_Idade.md", sep = "\n")
pandoc("resultados/medicamentos_Idade.md", format = c("latex", "docx"))
write.csv2(print(medicamentos.Idade, exact = T, printToggle = F), "resultados/medicamentos_Idade.csv")

# comorbidades ------------------------------------------------------------

cat(comorb.output, file = "resultados/comorbidades.md", sep = "\n")
pandoc("resultados/comorbidades.md", format = c("latex", "docx"))
write.csv2(print(comorbidades, exact = T, printToggle = F), "resultados/comorbidades.csv")

cat(comorb.genero.output, file = "resultados/comorbidades_genero.md", sep = "\n")
pandoc("resultados/comorbidades_genero.md", format = c("latex", "docx"))
write.csv2(print(comorbidades.genero, exact = T, printToggle = F), "resultados/comorbidades_genero.csv")

cat(comorb.idade.output, file = "resultados/comorbidades_idade.md", sep = "\n")
pandoc("resultados/comorbidades_idade.md", format = c("latex", "docx"))
write.csv2(print(comorbidades.idade, exact = T, printToggle = F), "resultados/comorbidades_idade.csv")

# centros -----------------------------------------------------------------

cat(centros.output, file = "resultados/centros.md", sep = "\n")
pandoc("resultados/centros.md", format = c("latex", "docx"))
write.csv2(print(centros, exact = T, printToggle = F), "resultados/centros.csv")

cat(centro.tep.output, file = "resultados/centro.tep.md", sep = "\n")
pandoc("resultados/centro.tep.md", format = c("latex", "docx"))
write.csv2(print(centro.tep, exact = T, printToggle = F), "resultados/centro.tep.csv")

cat(centro.spt.output, file = "resultados/centro.spt.md", sep = "\n")
pandoc("resultados/centro.spt.md", format = c("latex", "docx"))
write.csv2(print(centro.spt, exact = T, printToggle = F), "resultados/centro.spt.csv")

# graficos ----------------------------------------------------------------

source("scripts/graficos.R")

# locale padrão -----------------------------------------------------------

Sys.setlocale("LC_NUMERIC", "C")
