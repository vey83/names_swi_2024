
noms_cant <- function(data,selected_canton) {
  
  data_to_plot <- data %>%
    filter(gdekt == selected_canton) %>%
    slice(1:100) %>%
    select(-gdekt)
  
  return(data_to_plot)
  
}

excuse_my_french_title <- function(canton) {
  
  if (canton %in% c("JU", "TI")) {
    title <- paste0("Noms de famille les plus fréquents dans le canton du ", canton)
  } else if (canton == "VS") {
    title <- paste0("Noms de famille les plus fréquents en ", canton)
  } else if (canton %in% c("AG", "AI", "AR", "UR", "OW")) {
    title <- paste0("Noms de famille les plus fréquents dans le canton d'", canton)
  } else {
    title <- paste0("Noms de famille les plus fréquents dans le canton de ", canton)
  }
  
  return(title)
}
