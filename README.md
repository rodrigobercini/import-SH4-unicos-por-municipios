# Brazil HS4 imports by municipalities
Consolidating HS4 count imported by brazilian municipalities

*The Harmonized Commodity Description and Coding System generally referred to as "Harmonized System" or simply "HS" is a multipurpose international product nomenclature developed by the World Customs Organization (WCO)."* 

Source: [WCO](http://www.wcoomd.org/en/topics/nomenclature/overview/what-is-the-harmonized-system.aspx)

![WikiMedia](https://upload.wikimedia.org/wikipedia/commons/4/4d/HS_Hierarchy_Structure_Rice.jpg)

Source: WikiMedia.

The number of unique HS4 imported/exported can be used as a loose proxy for economic complexity. This code takes raw trade data as input and outputs the brazilian municipalities with most unique HS4 imported in a specific year. 

# Data sources

The code is analyzing import data from [2019](http://www.mdic.gov.br/balanca/bd/comexstat-bd/mun/IMP_2019_MUN.csv). Refer to the official [MDIC website](http://www.mdic.gov.br/index.php/comercio-exterior/estatisticas-de-comercio-exterior/base-de-dados-do-comercio-exterior-brasileiro-arquivos-para-download) for further data: 

There were mismatches for about 1.000 municipalities regarding MDIC and IBGE databases. Through a series of Vlookups and general feature engineering, the spreadsheet below contains matching codes for MDIC and IBGE.

[Municipalities/states codes and names](https://drive.google.com/open?id=1FU_1V7yYW-jILYy-KPW7UgvtYfYU7jRk)

[States abbreviations and regions](https://drive.google.com/open?id=1BZd6-M2IULN6qCVi7GU-GBZOMwFOBFvX)

# Plots

To check the interactive plots, refer to:
https://rpubs.com/rbercini/hs4_by_BR_municipality and https://rpubs.com/rbercini/hs4-by-RS-municipality.

<img src="https://raw.githubusercontent.com/rodrigobercinimartins/Brazil-trade-HS4-by-municipality/master/HS4%20by%20BR%20municipalities/Plot.jpg" alt="drawing" width="600"/>

<img src="https://raw.githubusercontent.com/rodrigobercinimartins/Brazil-trade-HS4-by-municipality/master/HS4%20by%20RS%20municipalities/Plot.jpg" alt="drawing" width="600"/>
