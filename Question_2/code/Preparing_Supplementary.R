Preparing_Supplementary <- function(data_root = "data/"){

    library(tidyverse)
    library(lubridate)

    Spotify <- read_rds(glue::glue("{data_root}Broader_Spotify_Info.rds")) %>%
        mutate(duration = duration_ms/1000) %>%
        select(name, artist, duration, danceability, energy, loudness, acousticness,
               instrumentalness, valence, tempo)



    Billboard_Charts <- read_rds(glue::glue("{data_root}charts.rds")) %>%
        filter(`peak-rank` <= 20) %>%
        mutate(grouped_date = lubridate::floor_date(date, "10 years")) %>%
        select(grouped_date, `peak-rank`, song, artist,) %>%
        group_by(song, artist) %>%
        arrange(grouped_date, .by_group = T) %>%
        slice_tail(n = 1)


    Combined <- Billboard_Charts %>% left_join(Spotify, by = c("song" = "name", "artist" = "artist")) %>%
        filter(!is.na(tempo)) %>%
        group_by(grouped_date, song) %>%
        summarise(across(c(duration, danceability, energy, loudness, acousticness,
                           instrumentalness, valence, tempo), mean, na.rm = T)) %>%
        mutate(danceability = danceability * 100,
               energy = energy * 100,
               loudness = (loudness + 30) * (100/30),
               acousticness = acousticness * 100,
               instrumentalness = instrumentalness * 100,
               valence = valence * 100)

    Combined

}