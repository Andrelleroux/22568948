Plot_Pop_Box <- function(Filtered_df, no_songs = 1){

    library(tidyverse)

    filter_albums <- Filtered_df %>% group_by(album_final) %>%
        count(album_final) %>% filter(n > no_songs) %>% pull(album_final) %>%
        as.vector()

    plot1 <- Filtered_df %>% group_by(album_final) %>%
        filter(album_final %in% filter_albums) %>%
        arrange(by = release_date) %>%
        ggplot() +
        geom_boxplot(aes(x = album_final, y = popularity, fill = Band), alpha = 1.5) +
        theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
        labs(title = "Distriution of Coldplay and Metallica Albums", x = "Album Name", y = "Popularity")+
        geom_jitter(aes(x = album_final, y = popularity),color = "black", size = 0.8, alpha = 0.5)

    plot1
}