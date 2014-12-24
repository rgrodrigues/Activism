####outliers

outlierTest(fit) # Bonferonni p-value for most extreme obs

#delete case
df.ea.per <- df.ea.per[-c(388),]

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs

#delete case
df.ea.per <- df.ea.per[-c(108),]

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(145),]

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(244),] #246

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs

#delete case
df.ea.per <- df.ea.per[-c(387),] #391

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(371),] #374

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(195),] #197

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(370),] #375

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(227),] #230

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(367),] #372

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(367),] #373

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(243),] #248

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(111),] #112

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(241),] #247

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(175),] #178

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(236),] #242

#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(240),] #250
#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(228),] #234
#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs


#delete case
df.ea.per <- df.ea.per[-c(238),] #249
#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs

#delete case
df.ea.per <- df.ea.per[-c(358),] #371
#repeating regression
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
summary(fit)
#repeating Assessing Outliers
outlierTest(fit) # Bonferonni p-value for most extreme obs

df <- df.ea.per








####influencial observations
influence <- influencePlot(fit, id.n=5)
influence <- influence[abs(influence$StudRes)>2,]
influence[order(influence$StudRes),]
del.obs <- as.numeric(row.names(influence))






#apagar observações com maiores resíduos
df.ea.per <- df.ea.per[-del.obs,]

#regredir de novo
df.ea.per$ea <- rowMeans(subset(df.ea.per, select = c(11:15)), na.rm = TRUE)
df.ea.per$per <- rowMeans(subset(df.ea.per, select = c(1:5,7:9)), na.rm = TRUE)  
fit <- lm(ea~per,data=df.ea.per)
fit2 <- lm(ea~log2(per),data=df.ea.per)
summary(fit)
summary(fit2)

influencePlot(fit, id.n=10)
