environnement <-""
source("Setup.R")
rm(list=ls());gc()


#Test a prompt/role
etude <-"titanic"
ecrire_etude(etude,ollama= FALSE)


vecteur_role <- c("yoda","ado","beauf","insee","blase")
source("fonctions.R")
test("titanic","beauf")


for(role in vecteur_role){
  # role <- "optimiste"
  ecrire_etude(etude,ollama= TRUE,model_name="mistral-small",role = role)
}


