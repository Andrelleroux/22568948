Ridge_plot <- function(Baby_names_df){

    library(tidyverse)
    library(ggridges)

    top_baby_names_df <- Baby_names_df %>% group_by(Name) %>% summarise(Total_Babies = sum(Count)) %>% arrange(desc(Total_Babies)) %>%
        head(10) %>% select(Name) %>% as.vector()

    plot_1_df <-  Baby_names_df %>% group_by(Year, Name) %>% summarise(Total_Babies = sum(Count)) %>%
        filter(Name == c(top_baby_names_df$Name))

    plot1 <- ggplot(plot_1_df, aes(x = plot_1_df$Year, y = plot_1_df$Name, fill = plot_1_df$Name)) +
        geom_density_ridges() +
        theme_ridges() +
        labs(title = "Prevalence of the Most Common Names Over Time", x = "Years", y = "10 Most Common Names")+
        theme(legend.position = "none")

    plot1
}