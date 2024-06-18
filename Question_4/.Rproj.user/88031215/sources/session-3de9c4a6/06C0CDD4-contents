Entering_Data <- function(data_root){

    library(tidyverse)

        Summer <- read_rds(glue::glue("{data_root}summer.rds")) %>% mutate(Season = "Summer")
        Winter <- read_rds(glue::glue("{data_root}winter.rds")) %>% mutate(Season = "Winter")
        GDP <- read_rds(glue::glue("{data_root}GDP.rds")) %>% select(Code, Population, `GDP per Capita`)

        Combined <- bind_rows(Summer, Winter) %>% left_join(GDP, by = c("Country" = "Code"))

        Combined

}