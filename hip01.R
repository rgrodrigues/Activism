library(Rcmdr)

attach(df)

leveneTest(ea,egm)

t.test(ea~egm,var.equal=FALSE) 
boxplot(ea,egm)

sum(egm=="Yes")


detach(df)
