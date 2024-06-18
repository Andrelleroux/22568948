Plot_Pop_Box <- function(Filtered_df){

    library(tidyverse)

    plot1 <- Filtered_df %>% group_by(album_final) %>% ggplot() +
        geom_boxplot(aes(x = album_final, y = popularity, fill = Band), alpha = 1.5) +
        theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
        labs(title = "Distriution of Coldplay and Metallica Albums", x = "Album Name", y = "Popularity")+
        geom_jitter(aes(x = album_final, y = popularity),color = "black", size = 0.8, alpha = 0.5)



    plot1
}