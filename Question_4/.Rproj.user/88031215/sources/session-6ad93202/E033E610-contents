Create_Table_Punching <- function(data, top_bot_size = 41){

    pacman::p_load(tidyverse, knitr, kableExtra)

    GDP <- read_rds(glue::glue("data/GDP.rds")) %>% select(Country, Code, Population, `GDP per Capita`)

    table_df <- data %>% group_by(Year, Event, Sport, Medal) %>%
        count(Country) %>%
        mutate(Medal_Unique = 1) %>%
        group_by(Country) %>%
        summarise(Gold = sum(Medal == "Gold"),
                  Silver = sum(Medal == "Silver"),
                  Bronze = sum(Medal == "Bronze")) %>%
        mutate(Medal_Tally = 3 * Gold + 2 * Silver + Bronze)%>%
        left_join(GDP, by = c("Country" = "Code")) %>%
        filter(!is.na(`GDP per Capita`)) %>%
        arrange(desc(`GDP per Capita`)) %>%
        mutate(Rank_GDP = rank(desc(`GDP per Capita`))) %>%
        mutate(Rank_Medals = rank(desc(Medal_Tally))) %>%
        mutate(Rank_Diff = Rank_GDP - Rank_Medals) %>%
        filter(Rank_Diff < -top_bot_size | Rank_Diff > top_bot_size) %>%
        arrange(desc(Rank_Diff)) %>%
        select(Country.y, Medal_Tally, `GDP per Capita`, Rank_GDP, Rank_Medals, Rank_GDP, Rank_Diff) %>%
        knitr::kable(caption = "Who Outperforms Economic Expectations in the Olympics?",
                     col.names = c("Country", "Medal Tally    ", "GDP per Capita    ", "GDP Rank    ",
                                   "Medals Rank    ", "Rank Difference"), label = NA) %>%
        column_spec(1, bold = T) %>% kable_styling(full_width = F, font_size = 12)

    table_df

}