attach(df)

#number of observations

nobs

#descriptive sattistics of ea and per

library(prettyR)
describe(df,num.desc=c("mean","median","var","sd","valid.n"),xname=NA,
         vname.space=20,fname.space=30,maxfac=10,show.pc=TRUE,horizontal=FALSE)



detach(df)
