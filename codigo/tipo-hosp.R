# Instalando biblioteca readxl para importar para o R arquivos com extensão .xls ou .xlsx.
if (!("readxl") %in% installed.packages()) install.packages("readxl")

# Carregando a biblioteca
library(readxl)
#covid_19_bauru_mortes <- read_excel("Documents/UNESP/IEAD-2022/covid-19-bauru-joao-pedro-bueno/dados/covid_19_bauru_mortes.xlsx")
covid_19_bauru_mortes <- read_excel("./dados/covid_19_bauru_mortes.xlsx")

priv <- length(covid_19_bauru_mortes$tipo_hosp[which(covid_19_bauru_mortes$tipo_hosp=="privado")])

pub <- length(covid_19_bauru_mortes$tipo_hosp[which(covid_19_bauru_mortes$tipo_hosp=="público")])

unique(pub)
unique(priv)

dados <- table(covid_19_bauru_mortes$tipo_hosp)

# Histograma numero de mortes por tipo de hospital

barplot(dados, main="Mortes de Covid-19 por Tipo de Hospitais em Bauru", xlab = "Tipo de hospitais", ylab = "Nº de Mortes", col="green")


#Calcula o tempo de permanencia de cada paciente

covid_19_bauru_mortes$inicio_sintoma <- as.Date(covid_19_bauru_mortes$inicio_sintoma)
covid_19_bauru_mortes$data_obito <- as.Date(as.numeric(covid_19_bauru_mortes$data_obito), origin = "2020-01-01")

covid_19_bauru_mortes[["permanencia"]] <- difftime(covid_19_bauru_mortes$data_obito, covid_19_bauru_mortes$inicio_sintoma, units = "days")


#Calcula a média de permanência por tipo de hospital

perma_priv <- mean(covid_19_bauru_mortes$permanencia[which(covid_19_bauru_mortes$tipo_hosp=="privado")])

perma_pub <- mean(covid_19_bauru_mortes$permanencia[which(covid_19_bauru_mortes$tipo_hosp=="público")])

