if (!"mvtnorm" %in% installed.packages()) install.packages("mvtnorm")
library(mvtnorm)
if (!"xtable" %in% installed.packages()) install.packages("xtable")
library(xtable)

source("MultivarALAAMalt.R")

### PERFORMANCE DATA
hera_tot <- read.csv("ToT_team.csv")[, 2]
hera_mot <- read.csv("MoT_team.csv")[, 2]

### SMM DATA
smm1 <- read.csv("smm1_ToT_bd_matrix_team.csv")[, 2:101]
smm2 <- read.csv("smm2_ToT_bd_matrix_team.csv")[, 2:101]

### COVARIATES
team_smm1 <- read.csv("smm1_teamsmm.csv")[, 2]
team_smm2 <- read.csv("smm2_teamsmm.csv")[, 2]
relation <- read.csv("relation_cov.csv")[, 2]
goal <- read.csv("goal_cov.csv")[, 2]

### ALAAM REG 

### SMM 1: TASK-RELATED
n <- nrow(smm1)
adj <- as.matrix(smm1)

degree <-matrix( rowSums(adj), n, 1) 
two.star <- matrix( choose(degree,2),n,1) 
triangles <- rowSums( adj* (adj %*% t(adj) ))

covs <- cbind(
  degree, 
  two.star,
  triangles,
  goal,
  relation,
  team_smm1)

colnames(covs) <- c(
  "degree",
  "star",
  "transitive",
  "goal",
  "teamrelation",
  "team_smm")

install.packages("coda")
library(coda)

reg.1 <- BayesALAAM(y = hera_tot,   
                     ADJ = adj,           
                     covariates = covs,   
                     directed = FALSE,     
                     Iterations = 30000,   
                     saveFreq = 10000)      

write.res.table(burnin=1, 
                datamat=reg.1$Thetas, # the result from BayesALAAM
                thin=1, 
                tabname=NULL) 

reg.2 <- BayesALAAM(y = hera_mot,          
                    ADJ = adj,           
                    covariates = covs,   
                    directed = FALSE,     
                    Iterations = 30000,   
                    saveFreq = 10000)     

write.res.table(burnin=1, 
                datamat=reg.2$Thetas, # the result from BayesALAAM
                thin=1, 
                tabname=NULL) 

### SMM 2: TEAM-RELATED
n <- nrow(smm2)
adj <- as.matrix(smm2)

degree <-matrix( rowSums(adj), n, 1) 
two.star <- matrix( choose(degree,2),n,1) 
triangles <- rowSums( adj* (adj %*% t(adj) ))

covs <- cbind(
  degree, 
  two.star,
  triangles,
  goal,
  relation,
  team_smm2)

colnames(covs) <- c(
  "degree",
  "star",
  "transitive",
  "goal",
  "teamrelation",
  "team_smm")

reg.3 <- BayesALAAM(y = hera_tot,           
                    ADJ = adj,         
                    covariates = covs,   
                    directed = FALSE,    
                    Iterations = 30000,   
                    saveFreq = 10000)      

write.res.table(burnin=1,
                datamat=reg.3$Thetas, # the result from BayesALAAM
                thin=1, 
                tabname=NULL)

reg.4 <- BayesALAAM(y = hera_mot,           
                    ADJ = adj,          
                    covariates = covs,   
                    directed = FALSE,    
                    Iterations = 30000,
                    saveFreq = 10000)      

write.res.table(burnin=1, 
                datamat=reg.4$Thetas, # the result from BayesALAAM
                thin=1,
                tabname=NULL)







