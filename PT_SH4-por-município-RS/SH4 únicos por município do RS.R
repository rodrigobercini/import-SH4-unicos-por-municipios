#################
#### Acesse https://rpubs.com/rbercini/hs4-by-RS-municipality para checar o gráfico interativo (plotly)
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

df <- merge(df, municip[ , c("Nome_Município", "Nome_UF", 'Código.Município.Completo.(MDIC)', 'Nome_Mesorregião')], all=FALSE, by.x='CO_MUN', by.y='Código.Município.Completo.(MDIC)')

df <- merge(df, UFs, all=FALSE, by='Nome_UF')

df$Mun_UF <- paste(df$Nome_Município, df$UF, sep='/')

df <- df[df$UF=='RS',]

df <- head(df[order(df$SH4.Count, decreasing = TRUE),], 20)

pl <- ggplot(df, aes(x = reorder(Nome_Município, -SH4.Count), y = SH4.Count)) +
  geom_col(aes(fill=Nome_Mesorregião)) +
  dark_theme_light() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_cartesian(ylim=c(150, 750)) +
  labs(title="SH4 únicos importados por municípios do RS em 2019", 
       subtitle="Municípios da Região Metropolitana de POA são os importadores mais diversos", 
       caption="fonte: MDIC") +
  xlab('Municípios') +
  ylab('SH4 únicos') +
  labs(fill='Mesorregião') 
pl
pl2 <- ggplotly(pl)
pl2
