source("noms_ch_wrangling.R")
source("functions.R")

noms_cantons_raw <- read_delim("resources/2022_noms_cantons.csv", 
                           delim = "\"", escape_double = FALSE, 
                           trim_ws = TRUE) %>%
  clean_names() %>%
  select(-starts_with("x")) %>%
  filter(time_period == max(time_period))

list_cantons <- noms_cantons_raw %>%
  group_by(gdekt) %>%
  slice(1) %>%
  ungroup() %>%
  pull(gdekt)

noms_cantons <- noms_cantons_raw %>%
  select(lastname,gdekt,rang_kt,value) %>%
  rename(Nom = lastname,
         Rang = rang_kt,
         Total = value) %>%
  mutate(Name = Nom,
         Rank = Rang,
         Anzahl = Total,
         Nome = Nom,
         Posto = Rang,
         Totale = Total) %>%
  select(Rang,Nom,Total,
         Rank,Name,Anzahl,
         Posto,Nome,Totale,
         gdekt) %>%
  arrange(desc(Total))

folder_id_fr_name_cantons <- "249627"


#datalist = list()

#for (i in list_cantons) {
  
#  data <- noms_cant(noms_cantons,i)
  
#  file_name <- paste0("noms_",i)
  
#  write_csv(data,glue::glue("output/noms_cantons/{file_name}.csv"))
  
  
#}
