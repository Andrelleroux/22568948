Data_Filtering <- function(Musictaste_df){

    library(tidyverse)

    filtered_df <- Musictaste_df %>%
        mutate(Band = ifelse(is.na(explicit), "Metallica", "Coldplay")) %>%
        mutate(album_final = ifelse(Band == "Metallica", album, album_name)) %>%
        mutate(duration_final = ifelse(Band == "Metallica", duration_ms/1000, duration)) %>%
        filter(!grepl("Remaster", album_final) & !grepl("Live", name) & !grepl("Deluxe", album_final) &
                   !grepl("Live", album_final) & !grepl("Edit", name) | album_final == "...And Justice For All") %>%
        distinct(name, .keep_all = T) %>% select(-album, -album_name, -duration_ms, -duration, -explicit) %>%
        mutate(danceability = danceability * 100, energy = energy * 100, loudness = (loudness + 30) * (100/30),
               acousticness = acousticness * 100, instrumentalness = instrumentalness * 100, valence = valence * 100)

    filtered_df

}