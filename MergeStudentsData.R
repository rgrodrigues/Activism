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
          ouputfileXlx <- paste(pastaDados,"DadosTotais.xlsx",sep="")
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
wb <- wb[order(wb$Entrevistador),]

####Manipulação de variáveis

     ##Inserir ID único

     nobs <- nrow(wb) #númerototal de observações
     id <- seq(1:nobs) #criação variável id
     wb <- cbind(id,wb) #inserir variável id à esquerda das varáveis existentes

     ##incluir níveis dos fatores (F1 a F5) e Q8

     niveisF1 <- c("Masculino","Feminino")
     niveisF3 <- c("Solteira/o","Casada/o - União de facto","Divorciada/o - 
                   Separada/o", "Viúva/o")
     niveisF4 <- c("4º Ano","6º Ano","9º Ano","12º Ano","Barcharlato","Licenciatura","Mestrado","Doutoramento")
     niveisF5 <- c("Grande cidade", "Cidade Pequena", "Área rural")
     
     niveisNS <- c("Não","Sim")
     
     wb$F1 <- factor(wb$F1, levels=c(1,2), labels=niveisF1)
     wb$F3 <- factor(wb$F3, levels=seq(1,4), labels=niveisF3)
     wb$F4 <- factor(wb$F4, levels=seq(1,8), labels=niveisF4)
     wb$F5 <- factor(wb$F5, levels=seq(1,3), labels=niveisF5)
     wb$Q8 <- factor(wb$Q8, levels=c(0,1), labels=niveisNS)

     ##Inverter variáveis Q6 e Q7

     wb$Q6 <- 8-wb$Q6
     wb$Q7 <- 8-wb$Q7

     ##Limpeza do grupo de variáveis Q10 a Q14 (tem alguns x em vez de números)
          
     wb$Q10 <- as.numeric(wb$Q10)
     wb$Q11 <- as.numeric(wb$Q11)
     wb$Q12 <- as.numeric(wb$Q12)
     wb$Q13 <- as.numeric(wb$Q13)
     wb$Q14 <- as.numeric(wb$Q14)

     ##Fatores Q26 a Q29
     #Mudei no excel as palavras não e sim por números: AndreiaBizarro BrunoDuarte DanielSilva PauloSardinha
          
     wb$Q26 <- factor(wb$Q26, levels=c(0,1), labels=niveisNS)
     wb$Q27 <- factor(wb$Q27, levels=c(0,1), labels=niveisNS)
     wb$Q28 <- factor(wb$Q28, levels=c(0,1), labels=niveisNS)
     wb$Q29 <- factor(wb$Q29, levels=c(0,1), labels=niveisNS)


     ##carateres especias em LocalEntrevista
     
     levels(wb$LocalEntrevista) <- gsub("Ã§", "ç", levels(wb$LocalEntrevista),fixed=TRUE)
     levels(wb$LocalEntrevista) <- gsub("Ã£", "ã", levels(wb$LocalEntrevista),fixed=TRUE)
     levels(wb$LocalEntrevista) <- gsub("Ã³", "ó", levels(wb$LocalEntrevista),fixed=TRUE)
     levels(wb$LocalEntrevista) <- gsub("Ã©", "é", levels(wb$LocalEntrevista),fixed=TRUE)
     levels(wb$LocalEntrevista) <- gsub("Ãº", "ú", levels(wb$LocalEntrevista),fixed=TRUE)


     ##mudar nomes às variáveis
     
     names(wb)[c(48,49,50,51,52)] <- c("sex","age","civil","education","live")
     names(wb)[c(5,6,7,8,9,10,11)] <- c("per01","per02","per03","per04","per05",
                                        "per06","per07")
     names(wb)[c(12,13)] <- c("member.volunteer","which.org")
     names(wb)[c(14,15,16,17,18,19)] <- c("reason01","reason02","reason03",
                                          "reason04","reason.other","reason.other.which")
     names(wb)[c(20,21,22,23,24,25,26,27,28,29)] <- c("ea01","ea02","ea03",
                                                      "ea04","ea05","ea06","ea07","ea08","ea09","ea10")
      

####Validar valores das variáveis




####salvar ficheiro total
save(wb, file=outputFile)
write.xlsx(wb,file=ouputfileXlx)


##split files

Activism <- subset(wb, select=c(id,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,
                                Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,
                                Q26,Q27,Q28,Q29,F1,F2,F3,F4,F5,))


save(Activism, file=outputFile2)

eohappy <- subset(wb, select=c(id,Q30,Q31,Q32,Q33,Q34,Q35,Q36,Q37,Q38,Q39,Q40,
                               Q41,Q42,Q43,F1,F2,F3,F4,F5))
save(eohappy, file=outputFile3)
