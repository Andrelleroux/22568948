Make_Map_Data <- function(data){

    pacman::p_load(tidyverse, lwgeom, sf, rnaturalearth, rnaturalearthdata)

    european_countries <- c( "Albania", "Andorra", "Armenia", "Austria", "Belarus",
                             "Belgium", "Bosnia and Herzegovina", "Bulgaria", "Croatia", "Cyprus",
                             "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Georgia",
                             "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Italy",
                             "Kosovo", "Latvia", "Liechtenstein", "Lithuania", "Luxembourg", "Malta",
                             "Moldova", "Monaco", "Montenegro", "Netherlands", "North Macedonia", "Norway",
                             "Poland", "Portugal", "Romania", "San Marino", "Serbia", "Slovakia",
                             "Slovenia", "Spain", "Sweden", "Switzerland", "Turkey", "United Kingdom",
                             "Vatican City" )


    world_broad <- ne_countries(scale = "medium", returnclass = "sf")

    adapt_aid <- read_Data %>%
        mutate(Ratio_Commitment = (`Total bilateral commitments($ billion)` + `Share in EU commitments($ billion)`) /
                   `GDP in 2021($ billion)`) %>% mutate(Rank_Ratio_Commitment = min_rank(Ratio_Commitment)) %>%
        rename(name = Country)

    Merged <- left_join(world_broad, adapt_aid, by = c("name")) #%>%
        #mutate(Ratio_Commitment = ifelse(is.na(Ratio_Commitment),replace_na(Ratio_Commitment, 0), Ratio_Commitment))

    Merged

}