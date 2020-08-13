#usando o método de Whitlock e Schluter
library(vcd)
library(readxl)
corruira_100 <- read_excel("R/mackinnon-aves/quadrat/corruira 100.xlsx")
View(corruira_100)
distribuicao <- table(corruira_100$n)
data.frame(Frequency = addmargins(distribuicao))
meandistribuicao <- mean(corruira_100$n)
meandistribuicao
expectedProportion <- dpois(0:3, lambda = meandistribuicao)
expectedFrequency <- expectedProportion * 96
hist(corruira_100$n, right = FALSE, xlab = "Number of individuals")
lines(expectedFrequency ~ c(0:3), lwd = 2)
distribFreq <- data.frame(nind = 0:3, obsFreq = as.vector(distribuicao), expFreq = expectedFrequency)
distribFreq
obsFreq <- tapply(distribFreq$obsFreq, distribFreq, sum)
expFreq <- tapply(distribFreq$expFreq, distribFreq, sum)
data.frame(obs = obsFreqGroup, exp = expFreqGroup)
saveChiTest <- chisq.test(obsFreq, p = expFreq/96)

#usando o método de bioquant
library(vcd)
library(readxl)
corruira_100 <- read_excel("R/mackinnon-aves/quadrat/corruira 100.xlsx")
View(corruira_100)
p = goodfit(corruira_100$n,type = "poisson")
summary(p)
