# resultados --------------------------------------------------------------

source("scripts/resultados.R")

# locale BR ---------------------------------------------------------------

suppressWarnings(Sys.setlocale("LC_NUMERIC", "pt_BR.UTF-8"))

# Markdown ----------------------------------------------------------------

cat(pander_return(tab1), file = "resultados/tabela1.md", sep = "\n")
cat(med.output, file = "resultados/medicamentos.md", sep = "\n")
cat(med.Genero.output, file = "resultados/medicamentos_Genero.md", sep = "\n")
cat(med.Idade.output, file = "resultados/medicamentos_Idade.md", sep = "\n")
cat(comorb.output, file = "resultados/comorbidades.md", sep = "\n")
cat(comorb.genero.output, file = "resultados/comorbidades_genero.md", sep = "\n")
cat(comorb.idade.output, file = "resultados/comorbidades_idade.md", sep = "\n")

cat(centros.output, file = "resultados/centros.md", sep = "\n")
# cat(centros.dabi.output, file = "resultados/centros.dabi.md", sep = "\n")
# cat(centros.enoxa.output, file = "resultados/centros.enoxa.md", sep = "\n")
# cat(centros.riva.output, file = "resultados/centros.riva.md", sep = "\n")
# cat(centros.warfa.output, file = "resultados/centros.warfa.md", sep = "\n")
cat(centro.tep.output, file = "resultados/centro.tep.md", sep = "\n")
cat(centro.spt.output, file = "resultados/centro.spt.md", sep = "\n")
cat(finalidade_meds.output, file = "resultados/finalidade_meds.md", sep = "\n")

library(knitr)

# tabela 1 ----------------------------------------------------------------

pandoc("resultados/tabela1.md", format = c("latex", "docx"))
write.csv2(tab1, "resultados/tabela1.csv")

# medicamentos ------------------------------------------------------------

pandoc("resultados/medicamentos.md", format = c("latex", "docx"))
pandoc("resultados/medicamentos_Genero.md", format = c("latex", "docx"))
pandoc("resultados/medicamentos_Idade.md", format = c("latex", "docx"))

# medicamentos x Genero e Idade(CSV) -----------------------------------------------
write.csv2(print(medicamentos.Genero, exact = T, printToggle = F), "resultados/medicamentos_Genero.csv")
write.csv2(print(medicamentos.Idade, exact = T, printToggle = F), "resultados/medicamentos_Idade.csv")

# finalidade meds ---------------------------------------------------------
pandoc("resultados/finalidade_meds.md", format = c("latex", "docx"))
write.csv2(print(finalidade_meds, exact = T, printToggle = F), "resultados/finalidade_meds.csv")

# comorbidades ------------------------------------------------------------

pandoc("resultados/comorbidades.md", format = c("latex", "docx"))
write.csv2(print(comorbidades, exact = T, printToggle = F), "resultados/comorbidades.csv")
pandoc("resultados/comorbidades_genero.md", format = c("latex", "docx"))
write.csv2(print(comorbidades.genero, exact = T, printToggle = F), "resultados/comorbidades_genero.csv")
pandoc("resultados/comorbidades_idade.md", format = c("latex", "docx"))
write.csv2(print(comorbidades.idade, exact = T, printToggle = F), "resultados/comorbidades_idade.csv")

# centros -----------------------------------------------------------------

pandoc("resultados/centros.md", format = c("latex", "docx"))
# pandoc("resultados/centros.enoxa.md", format = c("latex", "docx"))
# pandoc("resultados/centros.dabi.md", format = c("latex", "docx"))
# pandoc("resultados/centros.warfa.md", format = c("latex", "docx"))
# pandoc("resultados/centros.riva.md", format = c("latex", "docx"))
pandoc("resultados/centro.tep.md", format = c("latex", "docx"))
pandoc("resultados/centro.spt.md", format = c("latex", "docx"))

# centros (CSV) -----------------------------------------------------------
# Diferentes estratificações

# write.csv2(print(centros.enoxa, exact = T, printToggle = F), "resultados/centros.enoxa.csv")
# write.csv2(print(centros.dabi, exact = T, printToggle = F), "resultados/centros.dabi.csv")
# write.csv2(print(centros.warfa, exact = T, printToggle = F), "resultados/centros.warfa.csv")
# write.csv2(print(centros.riva, exact = T, printToggle = F), "resultados/centros.riva.csv")
write.csv2(print(centro.tep, exact = T, printToggle = F), "resultados/centro.tep.csv")
write.csv2(print(centro.spt, exact = T, printToggle = F), "resultados/centro.spt.csv")

# graficos ----------------------------------------------------------------

source("scripts/graficos.R")

# locale padrão -----------------------------------------------------------

Sys.setlocale("LC_NUMERIC", "C")
