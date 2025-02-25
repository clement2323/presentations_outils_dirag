environnement <-"local"
source("Setup.R")
rm(list=ls());gc()

for(etude in c("titanic","esane_entreprise")){
  #etude = "titanic"
  vecteur_role <- c("yoda","ado","beauf","insee","blase")
  for(role in vecteur_role){
    # role <- "optimiste"
    ecrire_etude(etude,ollama= TRUE,model_name="mistral-small",role = role)
  }
}

source("fonctions.R")

test("titanic","ado")
test("titanic","beauf")
test("titanic","insee")
test("titanic","yoda")
test("titanic","blase")

#Test a prompt/role
