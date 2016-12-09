# resultados --------------------------------------------------------------

source("scripts/resultados.R")

# Markdown ----------------------------------------------------------------

cat(tab1.output, file = "resultados/tabela1.md", sep = "\n")
cat(med.output, file = "resultados/medicamentos.md", sep = "\n")
cat(med.sexo.output, file = "resultados/medicamentos_sexo.md", sep = "\n")
cat(comorb.output, file = "resultados/comorbidades.md", sep = "\n")
cat(centros.output, file = "resultados/centros.md", sep = "\n")
cat(centros.enoxa.output, file = "resultados/centros.enoxa.md", sep = "\n")

library(knitr)

# tabela 1 ----------------------------------------------------------------

pandoc("resultados/tabela1.md", format = c("latex", "docx"))

# medicamentos ------------------------------------------------------------

pandoc("resultados/medicamentos.md", format = c("latex", "docx"))
pandoc("resultados/medicamentos_sexo.md", format = c("latex", "docx"))


# medicamentos x sexo (CSV) -----------------------------------------------

write.csv2(print(medicamentos.Sexo, exact = T, printToggle = F), "resultados/med.sexo.csv")

# comorbidades ------------------------------------------------------------

pandoc("resultados/comorbidades.md", format = c("latex", "docx"))

# centros -----------------------------------------------------------------

pandoc("resultados/centros.md", format = c("latex", "docx"))
pandoc("resultados/centros.enoxa.md", format = c("latex", "docx"))

# centros (CSV) -----------------------------------------------------------
# Diferentes estratificações

write.csv2(print(centros.enoxa, exact = T, printToggle = F), "resultados/centros.enoxa.csv")
write.csv2(print(centros.dabi, exact = T, printToggle = F), "resultados/centros.dabi.csv")
write.csv2(print(centros.warfa, exact = T, printToggle = F), "resultados/centros.warfa.csv")
write.csv2(print(centros.riva, exact = T, printToggle = F), "resultados/centros.riva.csv")
write.csv2(print(centro.tep, exact = T, printToggle = F), "resultados/centro.tep.csv")
write.csv2(print(centro.spt, exact = T, printToggle = F), "resultados/centro.spt.csv")
write.csv2(print(centro.tvpp, exact = T, printToggle = F), "resultados/centro.tvpp.csv")

# graficos ----------------------------------------------------------------

source("scripts/graficos.R")