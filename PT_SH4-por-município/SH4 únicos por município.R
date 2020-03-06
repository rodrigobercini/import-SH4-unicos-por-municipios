#################
#### Acesse https://rpubs.com/rbercini/hs4_by_BR_municipality para checar o gráfico interativo (plotly)
#################
library(dplyr)
library(openxlsx)
library(ggplot2)
library(ggdark)
library(plotly)
library(readr)

df <- read.csv('IMP_2019_MUN.csv', sep=';')
municip <- read.xlsx('1_County_Codes.xlsx')
UFs <- read_delim("Brasil UFs.csv", ";", escape_double = FALSE, trim_ws = TRUE)

df <- df %>%
  group_by(CO_MUN) %>%
  summarise('SH4.Count'= n_distinct(SH4))

df <- merge(df, municip[ , c("Nome_Município", "Nome_UF", 'Código.Município.Completo.(MDIC)')], all=FALSE, by.x='CO_MUN', by.y='Código.Município.Completo.(MDIC)')

df <- merge(df, UFs, all=FALSE, by='Nome_UF')


df$Mun_UF <- paste(df$Nome_Município, df$UF, sep='/')

df <- head(df[order(df$SH4.Count, decreasing = TRUE),], 20)  


pl <- ggplot(df, aes(x = reorder(Mun_UF, -SH4.Count), y = SH4.Count)) +
  geom_col(aes(fill=Região_BR)) +
  dark_theme_light() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_cartesian(ylim=c(450, 1100)) +
  labs(title="SH4 únicos importados por municípios brasileiros in 2019", 
       subtitle="Municípios do Sudeste são os importadores mais diversos", 
       caption="fonte: MDIC") +
  xlab('Municípios') +
  ylab('SH4 únicos') +
  labs(fill = "Região")
pl

pl2 <- ggplotly(pl)
pl2
