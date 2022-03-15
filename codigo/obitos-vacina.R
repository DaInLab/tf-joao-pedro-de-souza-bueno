
if (!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)
covid_19_bauru_mortes <- read_excel("Documents\UNESP\IEAD-2022\covid-19-bauru-joao-pedro-bueno\dados\covid_19_bauru_mortes.xlsx", col_types=c("text"))
covid_19_bauru_mortes[is.na(covid_19_bauru_mortes)] <- c("0")
vacina_doses <- table(covid_19_bauru_mortes$vacina_doses)

barplot(sort(vacina_doses, decreasing=TRUE),
        horiz = FALSE,
        las = 1)
mtext(side = 1, text = "Nº de Mortes", line = 2)
mtext(side = 2, text = "Nº de Doses", line = 2)
box(bty = "L")