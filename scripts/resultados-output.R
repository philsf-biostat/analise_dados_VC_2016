# Markdown ----------------------------------------------------------------

cat(tab1.output, file = "resultados/tabela1.md", sep = "\n")
cat(med.output, file = "resultados/medicamentos.md", sep = "\n")
cat(comorb.output, file = "resultados/comorbidades.md", sep = "\n")

library(knitr)

# tabela 1 ----------------------------------------------------------------

pandoc("resultados/tabela1.md", format = c("latex", "docx"))

# medicamentos ------------------------------------------------------------

pandoc("resultados/medicamentos.md", format = c("latex", "docx"))

# comorbidades ------------------------------------------------------------

pandoc("resultados/comorbidades.md", format = c("latex", "docx"))
