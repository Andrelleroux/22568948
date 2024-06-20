C_Weight_Plot <- function(data, no_countries = 10){

    pacman::p_load(tidyverse)

    top_countries <- data %>% group_by(Year, Event, Sport, Medal) %>%
        filter(Sport == "Weightlifting") %>%
        count(Country) %>%
        mutate(Medal_Unique = 1) %>%
        group_by(Country) %>%
        summarise(Gold = sum(Medal == "Gold"),
                  Silver = sum(Medal == "Silver"),
                  Bronze = sum(Medal == "Bronze")) %>%
        mutate(Medal_Tally = 3 * Gold + 2 * Silver + Bronze) %>%
        arrange(desc(Medal_Tally)) %>% head(no_countries) %>%
        pull(Country) %>% as.vector()

    plot_df <- data %>% group_by(Year, Event, Sport, Medal) %>%
        filter(Sport == "Weightlifting") %>%
        count(Country) %>%
        mutate(Medal_Unique = 1) %>%
        group_by(Country, Year) %>%
        summarise(Gold = sum(Medal == "Gold"),
                  Silver = sum(Medal == "Silver"),
                  Bronze = sum(Medal == "Bronze")) %>%
        mutate(Medal_Tally = 3 * Gold + 2 * Silver + Bronze) %>%
        group_by(Country) %>%
        filter(Country %in% top_countries) %>%
        arrange(Year) %>%
        mutate(Cumulative_Medals = cumsum(Medal_Tally)) %>%

        ggplot(aes(x = Year, y = Cumulative_Medals, color = Country, group = Country)) +
        geom_line(alpha = 0.8, linewidth = 1) +
        geom_point(size = 1.5) +
        geom_vline(xintercept = 1967, color = "black", alpha = 1.3) +
        theme_minimal()+
        labs(title = "Cumulative Weightlifting Medal Tally Over Time",
             x = "Year", y = "Cumulative Medal Tally",
             caption = "Note: Vertical line represent the year in which the Olympic Commission banned performance-enhancing drugs")

    plot_df
}