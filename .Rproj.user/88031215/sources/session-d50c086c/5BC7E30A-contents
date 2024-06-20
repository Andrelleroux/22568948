Comparing_Features <- function(main_data, supp_data){

    library(tidyverse)

    merged_df <- main_data %>%
        rename(grouped_date = release_date,
               duration = duration_final,
               song = name) %>%
        mutate(grouped_date = lubridate::floor_date(grouped_date, "10 years")) %>%
        bind_rows(supp_data %>% mutate(Band = "Other")) %>%
        pivot_longer(cols = c(duration, danceability, energy, loudness,
                                valence, tempo), names_to = "Feature", values_to = "Value") %>%
        ggplot() +
        geom_violin(aes(x = grouped_date, y = Value, fill = Band), alpha = 0.5) +
        facet_wrap(~Feature, scales = "free_y")+
        theme_bw()+
        scale_fill_manual(values = c("Metallica" = "maroon", "Coldplay" = "yellow", "Other" = "lightblue"))+
        labs(title = "Musical Features of Coldplay and Metallica vs other Billboard Top 20 Songs",
             x = "Date", fill = "Artist")



    merged_df

}