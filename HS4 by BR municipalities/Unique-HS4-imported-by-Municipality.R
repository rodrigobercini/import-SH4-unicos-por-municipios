library(dplyr)
library(openxlsx)
library(ggplot2)
library(ggdark)
library(plotly)
library(readr)


setwd("C:/Users/Andréa/Desktop/Programming/International Trade/")
df <- read.csv('By County and HS4/IMP/IMP_2019_MUN.csv', sep=';')
municip <- read.xlsx('1_County_Codes.xlsx')
UFs <- read_delim("Brasil UFs.csv", ";", escape_double = FALSE, trim_ws = TRUE)
colnames(UFs) <- c('Nome_UF', 'UF', 'Region')

df <- df %>%
  group_by(CO_MUN) %>%
  summarise('SH4.Count'= n_distinct(SH4))

df <- merge(df, municip[ , c("Nome_Município", "Nome_UF", 'Código.Município.Completo.(MDIC)')], all=FALSE, by.x='CO_MUN', by.y='Código.Município.Completo.(MDIC)')

df <- merge(df, UFs, all=FALSE, by='Nome_UF')


df$Mun_UF <- paste(df$Nome_Município, df$UF, sep='/')

df <- head(df[order(df$SH4.Count, decreasing = TRUE),], 20)  


pl <- ggplot(df, aes(x = reorder(Mun_UF, -SH4.Count), y = SH4.Count)) +
  geom_col(aes(fill=Region)) +
  dark_theme_light() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_cartesian(ylim=c(450, 1100)) +
  labs(title="Unique HS4 imported by Brazilian Municipalities in 2019", 
       subtitle="Southeast municipalities seem to be the most diverse importers", 
       caption="source: MDIC") +
  xlab('Municipalities') +
  ylab('Count of HS4 imported')
pl

pl2 <- ggplotly(pl)
pl2
