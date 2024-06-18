Create_Table = function(data){

    pacman::p_load(knitr, kableExtra)

    table <- data %>% filter(!is.na(`Share in EU allocations($ billion)`)) %>%
        mutate(Total_Individual_Commitments = `Total bilateral commitments($ billion)`,
                             EU_Contribution = `Share in EU commitments($ billion)`,
                             Total_Commitments = Total_Individual_Commitments + EU_Contribution,
                             Total_Individual_Allocations = `Total bilateral allocations($ billion)`,
                             EU_Allocation = `Share in EU allocations($ billion)`,
                             Total_Allocations = Total_Individual_Allocations + EU_Allocation,
                             Difference = Total_Commitments - Total_Allocations) %>%
        select(Country, Total_Commitments, Total_Individual_Allocations, Total_Allocations,
               `GDP in 2021($ billion)`, Difference) %>%
        arrange(desc(Difference)) %>% knitr::kable(caption = "Difference Between Promises and Results") %>%
            column_spec(1, bold = T) %>%
            footnote(general = "All numbers are in $ billions",
                     general_title = "Note: ",
                     footnote_as_chunk = T)

    table

}