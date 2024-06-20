Data_Read <- function(data_root){

    library(tidyverse)

    Allocations <- read_csv(glue::glue("{data_root}Financial Allocations.csv"))
    Commitments <- read_csv(glue::glue("{data_root}Financial Commitments.csv"))

    Combined <- left_join(Commitments, Allocations, by = c("Country"))

    Combined
}