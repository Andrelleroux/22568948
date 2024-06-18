#An Explanation of the Thought Process During Coding

The purpose of this README markdown file is to explain my thinking
during the coding aspect of the final exam for Data Science Methods for
Economics and Finance in June 2024.

``` r
rm(list = ls()) # Clean your environment:
gc()

library(tidyverse)
```

    ## Warning: package 'ggplot2' was built under R version 4.3.3

``` r
list.files('code/', full.names = T, recursive = T) %>% .[grepl('.R', .)] %>% as.list() %>% walk(~source(.))
```

##Question 1
