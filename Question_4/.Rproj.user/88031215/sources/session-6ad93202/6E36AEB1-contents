Stacked_Medal_Plot <- function(data){

    library(tidyverse)

    find_top_9 <- data %>% group_by(Year, Event, Sport, Medal) %>%
        count(Country) %>% mutate(Medal_Unique = 1) %>% group_by(Country) %>%
        summarise(Gold = sum(Medal == "Gold"),
                  Silver = sum(Medal == "Silver"),
                  Bronze = sum(Medal == "Bronze")) %>%
        mutate(Medal_Tally = 3 * Gold + 2 * Silver + Bronze) %>%
        filter(Country != "GDR" & Country != "URS") %>%
        arrange(desc(Medal_Tally)) %>%
        head(9) %>% pull(Country) %>% as.vector()

    plot_df <- data %>% group_by(Year, Event, Sport, Medal, Season) %>%
        count(Country) %>% mutate(Medal_Unique = 1) %>% group_by(Country, Season, Year) %>%
        summarise(Gold = sum(Medal == "Gold"),
                  Silver = sum(Medal == "Silver"),
                  Bronze = sum(Medal == "Bronze")) %>%
        mutate(Medal_Tally = 3 * Gold + 2 * Silver + Bronze) %>%
        filter(Country %in% find_top_9) %>%
        ggplot() + geom_area(aes(x = Year, y = Medal_Tally, fill = Season)) +
        labs(title = "Stacked Area Chart for the 9 Most Succesful Olympic Countries",
             x = "Year", y = "Medal Tally per Olympic games", color = "Olympic Cycle",
             caption = "Note: Eastern Germany and the Soviet Union are excluded") +
        theme_bw()+
        facet_wrap(~Country)

    plot_df
}