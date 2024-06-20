# 22568948 Data Science Practical Exam

In this markdown folder I will explain my thinking and working for the
coding aspect of the Data Science Methods for Economics and Finance
final exam in June 2024. I will work through the questions one by one
and talk through the code that I wrote to complete it.

``` r
rm(list = ls()) # Clean your environment:
gc()
setwd("C:/Users/andre/OneDrive/Documents/Masters_2024_stuff/Data_Science/Data_Science_Exam/22568948")

library(tidyverse)
```

##Question 1

It is firstly important that the working directory of the project is
properly allocated as the directory is used to create folders and
projects.

``` r
#Firstly I create the Texevier project for writing the report and coding in Question 1
#Texevier::create_template_html(directory = glue::glue("{getwd()}/"), template_name = "Question_1")

#Secondly I fetch the functions that I wrote from the code folder in Question 1
list.files('Question_1/code/', full.names = T, recursive = T) %>% .[grepl('.R', .)] %>% as.list() %>% walk(~source(.))
```

The first command that is run is to create a Texevier HTML project under
the title Question_1 wherein I complete the question. The second is to
fetch the functions that I create while writing the report for question
1.

``` r
Baby_names_df <- Data_Reading("Question_1/data/Baby_Names_By_US_State.rds")
```

This function simply read the data from the given rds file into a
dataframe that can be used in the report. No data transformations take
place in this function.

``` r
plot_corr <- Corr_plot(Baby_names_df)
plot_corr
```

![](README_files/figure-markdown_github/unnamed-chunk-4-1.png)

This function transforms the base dataframe to a format that can be used
to plot the Spearman correlation over time. The first step is to rank
the most popular names from each year across the United States. This is
done by grouping by year and name and them summarising to get to get the
totals. Then we arrange the totals in descending order according to the
totals of each name in each year. We can then rank by group to get the
ranking in each year.

Once we have this we can rename the rank variable and mutate the year to
be *no_Years* years earlier (where *no_Years* can be set, default is 3).
We can then left_join the dataframe with the renamed and mutated
dataframe to get the rank of the names in the start year and the later
year. We then arrange by the rank in the start year and use “slice_head”
to get the top *no_top* names per year (where *no_top* can be set, the
default is 25). Correlation is then calculated between the ranks of the
names in the start year and their rank x years later, the Spearman
method is used.

This is then plotted using a geometric line graph to show the changes in
correlation over time, geometric points are added to highlight the exact
points in time and finally a geom_smooth plot is used to show a smoothed
mean across time with a confidence interval of *conf_level* (where
*conf_level* can be set, the default is 0.95).

``` r
plot_ridge <- Ridge_plot(Baby_names_df)
plot_ridge
```

![](README_files/figure-markdown_github/unnamed-chunk-5-1.png)

This first step in this function is to take the same base dataframe and
group by name and summarise by count to get the total count of babies
per baby name. Using arrange and head we can get the top *no_names* most
used names (where *no_names* can be set, default is 15).

Then I can group by Year and Name to summarise by count and filter for
the top *no_names* names in each year. I then use the ggridges package
to plot a density ridge plot for the popularity of the most popular
names over time. Using alpha = 0.5 to make the graphs more see through.

##Question 2

``` r
#Firstly Create the Texevier project
#Texevier::create_template_html(directory = glue::glue("{getwd()}/"), template_name = "Question_2")
```

##Question 3

``` r
#Firstly Create the Texevier project
#Texevier::create_template(directory = glue::glue("{getwd()}/"), template_name = "Question_3_1")
```

##Question 4

``` r
#Firstly Create the Texevier project
#Texevier::create_template_html(directory = glue::glue("{getwd()}/"), template_name = "Question_4")
```

##Question 5

``` r
#Firstly Create the Texevier project
#Texevier::create_template_html(directory = glue::glue("{getwd()}/"), template_name = "Question_5")
```
