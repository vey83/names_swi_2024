source("noms_cantons_wrangling.R")

#title_fr <- "Noms les plus fréquents dans le canton de XXX"

# Définir la liste des cantons et autres variables
list_cantons <- c("AG", "AI", "AR", "BE", "BL", "BS", "FR", "GE", "GL", "GR", "JU", "LU", "NE", "NW", "OW", "SG", "SH", "SO", "SZ", "TG", "TI", "UR", "VD", "VS", "ZG", "ZH")

#FR
#modeles_cantons <- "zeR1n
#folder_id_fr_name_cantons <- "25119"


#DE
#modeles_cantons <- "kQi1g"
#folder_id_fr_name_cantons <- "251194"


#IT
modeles_cantons <- "5xxIJ"
folder_id_fr_name_cantons <- "251208"


#File with id
chart_ids <- data.frame(canton = character(), ID = character(), stringsAsFactors = FALSE)
new_entry <- data.frame(canton = character(), ID = character(), stringsAsFactors = FALSE)

#Import chart_ids
#chart_ids <- read_csv("chart_ids_fr.csv")

create_or_update_canton_chart <- function(selected_canton) {
  
  url <- paste0("https://raw.githubusercontent.com/vey83/names_swi_2024/main/output/noms_cantons/noms_", selected_canton, ".csv")
  
  df <- read.csv(url)
  
  # Vérifier si chart_ids est un DataFrame et contient une colonne 'canton'
  if (is.data.frame(chart_ids) && "canton" %in% colnames(chart_ids)) {
    
    old_cantons <- chart_ids %>% filter(canton == selected_canton) %>% pull(canton)
    
    if (length(old_cantons) > 0) {
      
      selected_id <- chart_ids %>%
        filter(canton == selected_canton) %>%
        pull(ID)
      
      chart_id <- selected_id
      
      dw_data_to_chart(df, chart_id = chart_id)
      
      dw_publish_chart(chart_id = chart_id)
      
    } else {
      
      new_chart <- dw_copy_chart(copy_from = modeles_cantons)
      
      new_chart_id <- new_chart$id
      
      title <- excuse_my_title(selected_canton, cantons_full_name,"it")
      
      dw_edit_chart(chart_id = new_chart_id,
                    title = title,
                    folderId = folder_id_fr_name_cantons)
      
      dw_data_to_chart(df, chart_id = new_chart_id)
      
      dw_publish_chart(chart_id = new_chart_id)
      
      chart_ids <<- bind_rows(chart_ids, data.frame(canton = selected_canton, ID = new_chart_id, stringsAsFactors = FALSE))
      
      print(paste("Added chart for canton:", selected_canton, "with ID:", new_chart_id))
    }
  } else {
    stop("chart_ids is not a DataFrame or does not contain the column 'canton'")
  }
}


# Boucle pour créer ou mettre à jour les graphiques
for (canton in list_cantons) {
  create_or_update_canton_chart(canton)
}

write_csv(chart_ids, "chart_ids_it.csv")

##Fichier récapitulatif
chart_summary <- data.frame("",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "")

chart_summary <- data.frame(matrix(ncol = length(chart_summary), nrow = 0))

colnames(chart_summary) <- c("Typ","Vorlage","Titel","Sprache","ID","Link","Iframe","Script")


# Boucle pour créer le tableau récapitulatif des métadonnées des graphiques
for (i in 1:nrow(chart_ids)) {
  
  chart_id <- chart_ids$ID[i]
  
  # Récupérer les métadonnées du graphique
  metadata_chart <- DatawRappr::dw_retrieve_chart_metadata(chart_id)
  
  # Créer une nouvelle entrée de métadonnées
  new_entry <- data.frame(
    "Typ" = "Uebersicht",
    "Vorlage" = "alle",
    "Titel" = metadata_chart$content$title,
    "Sprache" = metadata_chart$content$language,
    "ID" = metadata_chart$id,
    "Link" = metadata_chart$content$publicUrl,
    "Iframe" = metadata_chart$content$metadata$publish$`embed-codes`$`embed-method-responsive`,
    "Script" = metadata_chart$content$metadata$publish$`embed-codes`$`embed-method-web-component`
  )
  
  # Ajouter la nouvelle entrée au tableau récapitulatif
  chart_summary <- rbind(chart_summary, new_entry)
}

write_xlsx(chart_summary, "excel_summaries/chart_summary_it.xlsx")
