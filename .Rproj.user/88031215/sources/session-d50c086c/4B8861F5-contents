Inputting_Data <- function(data_root){

    library(tidyverse)

    Metallica <- read_csv(glue::glue("{data_root}metallica.csv"))
    Coldplay <- read_csv(glue::glue("{data_root}Coldplay.csv"))

    combo_df <- bind_rows(Metallica, Coldplay)

    combo_df
}