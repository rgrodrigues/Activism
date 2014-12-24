#repor o df ao seu estado original

load("DataActivism.RData")
load("TotalData.RData")
nobs <- nrow(Activism)

attach(Activism)
df.per <- data.frame(Activism$per01,Activism$per02,Activism$per03,Activism$per04,Activism$per05,Activism$per06,Activism$per07)
df.ea <- data.frame(Activism$ea01,Activism$ea02,Activism$ea03,Activism$ea04,Activism$ea05,Activism$ea06,Activism$ea07,Activism$ea08,Activism$ea09,Activism$ea10)
detach(Activism)
df.ea.per <- data.frame(df.ea,df.per)
names(df.ea.per) <- c("ea01","ea02","ea03","ea04","ea05","ea06","ea07","ea08",
                      "ea09","ea10","per01","per02","per03","per04","per05","per06","per07")
df.ea.per$egm <- Activism$egm
library(data.table)
setattr(df.ea.per$egm,"levels",c("No","Yes"))


new.per <- rowMeans(subset(df.per, select = c(1:5)), na.rm = TRUE)
new.ea <- rowMeans(subset(df.ea, select = c(1:5,7:9)), na.rm = TRUE)
df.ea.per$ea <- new.ea
df.ea.per$per <- new.per
fit <- lm(ea~per,data=df.ea.per)
fit2 <- lm(ea~log2(per),data=df.ea.per)
summary(fit)
summary(fit2)
layout(matrix(1:4, nrow = 2))
plot(fit,ask = FALSE)
layout(1)

#remove outlier
df.ea.per <- df.ea.per[-c(388),]
new.per <- rowMeans(subset(df.ea.per, select = c(1:5)), na.rm = TRUE)
new.ea <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)
df.ea.per$ea <- new.ea
df.ea.per$per <- new.per

#atualizar df.per e df.ea
attach(Activism)

df.ea <- subset(df.ea.per, select = c(1:5,7:9))
df.per<- subset(df.ea.per, select = c(1:5))
df <- subset(df.ea.per, select=18:20)
df$id <- as.factor(seq(1,nobs))
df <- cbind(df,sex,age,civil,education,live)
detach(Activism)
save(df,file="data.Rdata")
