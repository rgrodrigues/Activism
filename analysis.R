library(psych) #para testar fiabilidade
library(foreign)
library(lattice)
library(car)
library(MASS)

attach(Activism)

#primeira regressão

cor(Activism$ea,Activism$per)
fit <- lm(Activism$ea ~ Activism$per)
summary(fit)
plot(Activism$ea ~ Activism$per, xlab="EA - Environmental Activism", ylab="PER - Perceived Environment Responsability")
abline(fit, col="red") # fitression line (y~x)
dfbeta(fit) #check for Influential Observations

detach(ACtivism)

#maus resultados. tirar indicadores

new.per <- rowMeans(subset(df.per, select = c(1:5)), na.rm = TRUE)
new.ea <- rowMeans(subset(df.ea, select = c(1:5,7:9)), na.rm = TRUE)
df.ea.per$ea <- new.ea
df.ea.per$per <- new.per

#nova reg

cor(new.ea,new.per)
cor(subset(df.per, select = c(1:5)),subset(df.ea, select = c(1:5,7:9)))
fit <- lm(ea ~ per,data=df.ea.per)
summary(fit)


#reg com todas as vartiáveis independentes
fit <- lm(ea ~ per01+per02+per03+per04+per05,data=df.ea.per)
summary(fit)


          #fit <- lm(ea ~ per01+per02+per03+per04+per05+per06+per07,data=df.ea.per)
          #step <- stepAIC(fit, direction="both")
          #step$anova # display results 
          #summary(fit)
          #summary(step)




#sai per03

fit <- lm(ea ~ per01+per02+per04+per05+per06+per07,data=df.ea.per)
summary(fit)


#sai per06

fit <- lm(ea ~ per01+per02+per04+per05+per07,data=df.ea.per)
summary(fit)

#sai per01

fit <- lm(ea ~ per02+per04+per05+per07,data=df.ea.per)
summary(fit)



#####avaliação (http://www.statmethods.net/stats/rdiagnostics.html)
# Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs
qqPlot(fit, main="QQ Plot") #qq plot for studentized resid
leveragePlots(fit) # leverage plots
     #deleting cases
     df.ea.per <- df.ea.per[-c(388),]
     
     #repeating regression
     df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
     df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
     fit <- lm(ea~per,data=df.ea.per)
     summary(fit)
     #repeating Assessing Outliers
     outlierTest(fit) # Bonferonni p-value for most extreme obs

#residual plots
residualPlots(fit)
fit2 <- lm(ea~log2(per),data=df.ea.per)
summary(fit2)
residualPlots(fit2)

#Influential variables-Added-variableplots
avPlots(fit2, id.n=2, id.cex=0.7)
avPlots(fit, id.n=2, id.cex=0.7)

#Testing fornormality
qqPlot(fit2)

#Testing for heteroskedasticity Breush/Pagan and Cook/Weisberg score test for non-constant error variance. Null is constant variance
ncvTest(fit2)
ncvTest(fit)


#colinearity
vif(fit2)



#to solve heterokedasticity from http://stats.stackexchange.com/questions/84319/resolving-heteroskedasticity-in-linear-regression-models

fit3 <- rlm(ea~log2(per),data=df.ea.per)


write.csv(Activism,file="Activism.csv")

write.foreign(Activism,
              datafile="activism.dat",
              codefile="activism.sps",
              package="SPSS")