# Instalando biblioteca readxl para importar para o R arquivos com extensão .xls ou .xlsx.
if (!("readxl") %in% installed.packages()) install.packages("readxl")

# Carregando a biblioteca
library(readxl)
covid_19_bauru_mortes <- read_excel("Documents\UNESP\IEAD-2022\covid-19-bauru-joao-pedro-bueno\dados\covid_19_bauru_mortes.xlsx")

comorbidades <- table(covid_19_bauru_mortes$comorbidade)

# Histograma numero de mortes por tipo de hospital


barplot(comorbidades,
        main = "Mortes de Covid-19 em Bauru X Comorbidades",
        horiz = TRUE,
        las = 1)
mtext(side = 20, text = "Comorbidades", line = 60)
mtext(side = 1, text = "Nº de mortes", line = 2)
box(bty = "L")