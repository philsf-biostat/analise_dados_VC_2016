# Análise de dados Veronica Clemente

Dados de Veronica Clemente (Mestrado INTO 2016)

## Objetivo da análise ##

Estudo retrospectivo com dados de pacientes diagnosticados com TVP.

- Estatísticas descritivas
- Gráficos qualitativos

As análises serão feitas em um *dataset* resumido e anonimizado. Os dados brutos **não serão** disponibilizados neste repositório, apenas as figuras e o relatório.

### Características dos dados ###

A maior parte dos dados são categóricos, e devem ser resumidos com Frequência (proporção). Os dados numéricos serão resumidos como média (+- DP).

- A idade dos pacientes data de Nascimento será calculada tendo como base a primeira data de exame
- O IMC foi calculado para pacientes com dados completos
- Dados faltantes foram desconsiderados para as estatísticas sumárias

## Relatório ##

Todas as informações descritas abaixo estão sumarizadas no relatório. Este inclui uma sugestão de texto descrevendo a metodologia, e sugestões resumidas de descrição sintética dos resultados analisados.

- [Relatório (visualização)][]
- [Relatório (download PDF)][]
- [Relatório (download DOCX)][]

[Relatório (visualização)]: relatorio/analise_dados_VC_2016.md
[Relatório (download PDF)]: relatorio/analise_dados_VC_2016.pdf?raw=true
[Relatório (download DOCX)]: relatorio/analise_dados_VC_2016.docx?raw=true

## Resultados brutos ##

Abaixo estão os resultados "brutos". A apresentação dos mesmos foi compilada e formatada no relatório acima.

### Estatísticas descritivas ###

Sumário das estatísticas descritivas das variáveis.

- [tabela1][tabela1-viz] ([PDF][tabela1-pdf], [DOCX][tabela1-docx])
- [centros][centros-viz] ([PDF][centros-pdf], [DOCX][centros-docx])
- [medicamentos][med-viz] ([PDF][med-pdf], [DOCX][med-docx])
- [comorbidades][comorb-viz] ([PDF][comorb-pdf], [DOCX][comorb-docx])

[tabela1-viz]: resultados/tabela1.md
[tabela1-pdf]: resultados/tabela1.pdf?raw=true
[tabela1-docx]: resultados/tabela1.docx?raw=true
[centros-viz]: resultados/centros.md
[centros-pdf]: resultados/centros.pdf?raw=true
[centros-docx]: resultados/centros.docx?raw=true
[med-viz]: resultados/medicamentos.md
[med-pdf]: resultados/medicamentos.pdf?raw=true
[med-docx]: resultados/medicamentos.docx?raw=true
[comorb-viz]: resultados/comorbidades.md
[comorb-pdf]: resultados/comorbidades.pdf?raw=true
[comorb-docx]:  resultados/comorbidades.docx?raw=true

### Tabelas de associação ###

As tabelas abaixo associam variáveis categóricas, e estão disponíveis em PDF, DOCX e CSV.
Os arquivos CSV podem ser abertos diretamente no Excel, formatados e posteriormente colados no Word.

**Provisoriamente os arquivos podem ser salvos a partir de [resultados][]**

[resultados]: resultados/

- Medicamentos x Sexo (PDF, DOCX, CSV)
- Centros x medicamento
    - Dabigatrana (PDF, DOCX, CSV)
    - Enoxaparina (PDF, DOCX, CSV)
    - Rivaroxabana (PDF, DOCX, CSV)
    - Warfarina (PDF, DOCX, CSV)
- Centros x TEP (PDF, DOCX, CSV)
- Centros x SPT (PDF, DOCX, CSV)
- Centros x TVP Previa (PDF, DOCX, CSV)

### Figuras ###

Figuras descritivas das variáveis.

- [Centros][centros-alt]
    - [alternativa (Pareto)][centros-fig]
- [Medicamentos][med-fig]
- [Comorbidades][comorb-fig]

[centros-fig]: graficos/centros.png?raw=true
[centros-alt]: graficos/centros_o_alfabetica.png?raw=true
[med-fig]: graficos/medicamentos.png?raw=true
[comorb-fig]: graficos/comorbidades.png?raw=true
