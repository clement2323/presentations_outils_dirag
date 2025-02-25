test <- function(nom_etude,role){
  #nom_etude <- "esane_entreprise"  
  #role <- "insee"
  print(nom_etude)
  print(role)
  return_filename <- function(dir, string) {
    paste0(dir, "/", grep(string, list.files(dir), value = TRUE))
  }
  source(return_filename("codes", nom_etude), encoding = "UTF-8")
  table_demandes <- read.csv(return_filename("metadonnees/demandes", 
                                             nom_etude), encoding = "UTF-8")
  vecteur_demande <- table_demandes[1,]
  metadonnees_tables <- read.csv(return_filename("metadonnees/metadonnees_tables", 
                                                 nom_etude), encoding = "UTF-8")
  metadonnees_etude <- fromJSON(return_filename("metadonnees/metadonnees_etudes", 
                                                nom_etude))
  paste0("metadonnees/roles/role_", 
         role, ".json")%>% print()
  metadonnees_role <- fromJSON(paste0("metadonnees/roles/role_", 
                                      role, ".json"))
  
  liste_demande <-(renvoyer_table_from_demande(vecteur_demande))
  table_agrege <- liste_demande$table
  params <-liste_demande$params
  
  prompt <- BoutadE::preparer_prompt(table_agrege = table_agrege,
                                     metadonnees_tables = metadonnees_tables,
                                     metadonnees_etude = metadonnees_etude,
                                     metadonnees_role = metadonnees_role,
                                     params)
  cat(prompt)
  rep <- ask_ollama(prompt,"mistral-small")
  markdown::mark_html(rep)%>%kable()
  
}
