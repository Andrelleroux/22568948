Corr_plot <- function(Baby_names_df, no_Years = 3, no_top = 25, conf_level = 0.95){

    library(tidyverse)
    library(GGally)

        top_25_names_corr <- Baby_names_df %>% group_by(Year, Name) %>%
            summarise(Total_Babies = sum(Count)) %>%
            arrange(desc(Total_Babies), .by_group = T) %>%
            group_by(Year) %>%
            mutate(Rank = rank(-Total_Babies))

        Add_future_plot <- top_25_names_corr %>% rename(Rank_Start = Rank) %>%
            left_join(
                top_25_names_corr %>%
                    rename(Rank_Later = Rank, Year_Later = Year) %>%
                    mutate(Year = Year_Later - no_Years) %>%
                    select(Name, Year, Rank_Later),
                by = c("Name", "Year")
            ) %>% arrange(Rank_Start, .by_group = T) %>% slice_head(n = no_top) %>%
            group_by(Year) %>%
            summarise(Correlation = cor(Rank_Start, Rank_Later, method = "spearman")) %>%
            ggplot(aes(x = Year, y = Correlation)) +
            geom_line(color = "gold", linewidth = 1) +
            geom_point(color = "purple", size = 3, alpha = 0.6) +
            theme_bw()+
            geom_smooth(alpha = 0.5, color = "royalblue", level = conf_level)+
            labs(title = "The Staying Power of Names Over Three Years")

        Add_future_plot


    }