Corr_plot <- function(Baby_names_df, start_year = 1990){

    library(tidyverse)
    library(GGally)

    plot_df_1 <- Baby_names_df %>% group_by(Year, Name) %>% summarise(Total_Babies = sum(Count)) %>%
        arrange(desc(Total_Babies)) %>% mutate(Rank = rank(Total_Babies)) %>%
        filter(Year == start_year) %>% head(25)

    plot_df_2 <- Baby_names_df %>% group_by(Year, Name) %>% summarise(Total_Babies = sum(Count)) %>%
        arrange(desc(Total_Babies)) %>% mutate(Rank = rank(Total_Babies)) %>%
        filter(Year == start_year+1) %>% head(25)

    plot_df_3 <- Baby_names_df %>% group_by(Year, Name) %>% summarise(Total_Babies = sum(Count)) %>%
        arrange(desc(Total_Babies)) %>% mutate(Rank = rank(Total_Babies)) %>%
        filter(Year == start_year+2) %>% head(25)

    plot_df_4 <- Baby_names_df %>% group_by(Year, Name) %>% summarise(Total_Babies = sum(Count)) %>%
        arrange(desc(Total_Babies)) %>% mutate(Rank = rank(Total_Babies)) %>%
        filter(Year == start_year+3) %>% head(25)




}