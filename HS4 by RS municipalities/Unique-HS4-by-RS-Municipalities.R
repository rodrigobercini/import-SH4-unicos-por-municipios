#################
#### Access https://rpubs.com/rbercini/hs4-by-RS-municipality to check the interactive plot
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
colnames(UFs) <- c('Nome_UF', 'UF', 'Region')

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
  labs(title="Unique HS4 imported by RS Municipalities in 2019", 
       subtitle="Southeast municipalities seem to be the most diverse importers", 
       caption="source: MDIC") +
  xlab('Municipalities') +
  ylab('Count of HS4 imported') +
  labs(fill='Meso-Region') 

pl2 <- ggplotly(pl)
pl2
