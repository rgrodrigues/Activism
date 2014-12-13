## merging students' data files

#install packages dplyr for data manipulation and tm for text mining
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")};library(dplyr) 
#if("tm" %in% rownames(installed.packages()) == FALSE) {install.packages("tm")};library(tm)
if("XLConnect" %in% rownames(installed.packages()) == FALSE) {install.packages("XLConnect")};library(XLConnect) #see http://en.wikibooks.org/wiki/R_Programming/Importing_and_exporting_data#Excel_.28xls.2Cxlsx.29

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_25') #set environment variable
library(rJava)
library(xlsxjars)
library(xlsx)
library(foreign)

#set working directory

print("Por favor escolha o disco")
disco <- choose.dir() #o utilizador escolhe a drive em que está a dropbox
disco <- gsub("\\","/",disco, fixed=TRUE) #mudar o \\ para /
pastaUC <- paste(disco,"Dropbox/_Aulas/14-15/1º Ciclo/EM I 5915/",sep="")
pastaDados <- paste (pastaUC, "Aval/Recolha de dados/Dados/",sep="")
pastaFicheiros <- paste(pastaDados, "Ficheiros/", sep="")
pastaProjeto <- paste(disco, "Dropbox/_Inv/WorkSpace/R/R_Projects/Activism/", sep="")

#### Obter a lista de ficheiros

fileFicheiros <- paste(pastaDados,c("NomesFicheiros.xlsx"), sep="") #ficheiro Excel que tem a lista de ficheiros
wb <- read.xlsx(fileFicheiros, 1) #conjunto de nomes de ficheiros
nomesFicheiros <- as.character(wb$NomeExcel)
nomesFicheiros <- wb$NomeExcel[wb$nomeExcel!=0]
nomesFicheiros <- as.character(subset(wb$NomeExcel,wb$NomeExcel!=0 & wb$NomeExcel !="")) #vetor com os nomes
nomesFicheiros <- gsub("Ã§", "ç", nomesFicheiros,fixed=TRUE)
     nomesFicheiros <- gsub("Ã£", "ã", nomesFicheiros,fixed=TRUE)
     nomesFicheiros <- gsub("Ã³", "ó", nomesFicheiros,fixed=TRUE)
numeroAlunos <- length(unique(nomesFicheiros, na.rm=TRUE)) #o número de alunos a partir do numero de nomesFicheiros

#### Ler os ficheiros Excel

setwd(pastaFicheiros)
wb <- read.xlsx(nomesFicheiros[1], 1, endRow=26) #ler a primeira folha do primeiro livro excel

        #variáveis e vetores operacionais
        vars <- names(wb) #nomes das variáveis
        outputFile <- paste(pastaDados,"TotalData.RData", sep="")
        outputFile2 <- paste(pastaProjeto,"DataActivism.RData", sep="")
        outputFile3 <- paste(pastaDados,"DataOther.RData", sep="")
        numeroVoltas <- seq(from=2, to=numeroAlunos) #ficheiros excel restantes

for(i in numeroVoltas) {
        wb2 <- read.xlsx(nomesFicheiros[i], 1, startRow=1, endRow=26)
        print(i); print(nomesFicheiros[i])
        wb <- merge(wb,wb2, all.x=TRUE, all.y=TRUE)
        print(names(wb))
}
rm(wb2)

##sort by Entrevistador

save(wb, file=outputFile)

##split files

