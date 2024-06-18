Plot_Histogram <- function(Filtered_df){

    library(tidyverse)

    plot1 <- Filtered_df %>% group_by(Band) %>%  summarise(across(everything(), mean)) %>%
        select(Band, popularity, danceability, energy, loudness, acousticness, valence, tempo) %>%
        pivot_longer(cols = -Band, names_to = "feature", values_to = "mean_value") %>%
        ggplot() + geom_bar(aes(x = feature, y = mean_value, fill = Band), position = "dodge", stat = "identity")+
        labs(title = "Differences in the Discography of Metallica and Coldplay" , x = "Mean Song Values" ,
             y = "Musical Features") + theme_bw()

    plot1
}