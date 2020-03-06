Find a English version of this README [here](https://github.com/rodrigobercinimartins/BR-unique-HS4-imports-by-municipalities/blob/master/EN_README.md).

# Importações de SH4 únicos por municípios brasileiros
Consolidando SH4 únicos importados por municípios brasileiros

*"O Sistema Harmonizado de Designação e de Codificação de Mercadorias, ou simplesmente Sistema Harmonizado (SH), é um método internacional de classificação de mercadorias, baseado em uma estrutura de códigos e respectivas descrições."*

Fonte: [MDIC](http://www.mdic.gov.br/index.php/comercio-exterior/negociacoes-internacionais/206-assuntos/categ-comercio-exterior/sgp-sistema-geral-de-preferencias/1799-sgp-nomenclatura-comum-do-mercosul-ncm)

![Sistema Harmonizado](http://investexportbrasil.dpr.gov.br/Imagens/ilustMCMEstrutura.gif)

Fonte: Invest Export Brasil.

O número de SH4 únicos importados/exportados pode ser usar como uma variável proxy frouxa para complexidade econômica. O código deste repositório toma os dados brutos do MDIC por município e consolida os municípios com maior número de SH4 únicos importados em um ano específico.

# Por que este código é necessário?

A partir do site do MDIC, só é possível extrair dados brutos contendo códigos de municípios, as tabelas não possuem nomes, estados ou regiões. O que o código faz é cruzar os dados brutos do MDIC com informações do IBGE, tornando possível uma análise mais completa das exportações/importações dos municípios.

# Fontes/Dados necessários

[Dados brutos de importações 2019](http://www.mdic.gov.br/balanca/bd/comexstat-bd/mun/IMP_2019_MUN.csv) O código em questão analisa dados de 2019. Consulte o [site oficial do MDIC](http://www.mdic.gov.br/index.php/comercio-exterior/estatisticas-de-comercio-exterior/base-de-dados-do-comercio-exterior-brasileiro-arquivos-para-download) para mais anos e para exportações. 

[Códigos e nomes de municípios e estados](https://drive.google.com/open?id=1FU_1V7yYW-jILYy-KPW7UgvtYfYU7jRk) Havia cerca de 1.000 municípios com códigos inconsistentes ao cruzar as tabelas do MDIC e do IBGE. Através de uma série de Procvs e engenheria de recursos, a tabela abaixo contém os códigos corretos e atualizados.

[Abreviações dos estados e regiões](https://drive.google.com/open?id=1BZd6-M2IULN6qCVi7GU-GBZOMwFOBFvX)

# Usos alternativos

A análise deste repositório focou no número de SH4 importados por municípios, porém com as tabelas consolidadas obtidas (contendo valores, nomes de municípios e regiões), é possível analisar uma infinidade de tendências do comércio international dos municípios.

# Gráficos

Para acessar os gráficos interativos (em inglês), consulte:
https://rpubs.com/rbercini/hs4_by_BR_municipality and https://rpubs.com/rbercini/hs4-by-RS-municipality.

<img src="https://raw.githubusercontent.com/rodrigobercinimartins/BR-unique-HS4-imports-by-municipalities/master/PT_SH4-por-munic%C3%ADpio/Plot.jpg" alt="drawing" width="500"/>

<img src="https://raw.githubusercontent.com/rodrigobercinimartins/BR-unique-HS4-imports-by-municipalities/master/PT_SH4-por-munic%C3%ADpio-RS/Plot.jpg" width="500"/>
