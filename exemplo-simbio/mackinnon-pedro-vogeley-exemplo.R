library(iNEXT)
data("spider")
summary(spider)
spider
str(spider)
iNEXT(spider, q=0, datatype="abundance")
#----------------------------------------------
#Agora vamos importar os dados exemplo do simbio certo
#------------------------------------------------------------
library(readxl)
macki <- read_excel("exemplo-simbio/macki.xlsx")
View(macki)
dadograf <- iNEXT(macki$conta, q=0, datatype = "abundance")
ggiNEXT(dadograf, type=1, se=TRUE, facet.var="none", color.var="site", grey=FALSE)  
dadograf500 <- iNEXT(macki$conta, q=0, datatype = "abundance", endpoint = 500)
dadograf1000 <- iNEXT(macki$conta, q=0, datatype = "abundance", endpoint = 1000)
ggiNEXT(dadograf500, type=1, se=TRUE, facet.var="none", color.var="site", grey=FALSE)  
ggiNEXT(dadograf1000, type=1, se=TRUE, facet.var="none", color.var="site", grey=FALSE)  
