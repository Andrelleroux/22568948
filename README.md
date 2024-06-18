#An Explanation of the Thought Process During Coding

The purpose of this README markdown file is to explain my thinking
during the coding aspect of the final exam for Data Science Methods for
Economics and Finance in June 2024.

``` r
rm(list = ls()) # Clean your environment:
gc()
```

    ##          used (Mb) gc trigger (Mb) max used (Mb)
    ## Ncells 468478 25.1    1008315 53.9   660385 35.3
    ## Vcells 864704  6.6    8388608 64.0  1770092 13.6

``` r
library(tidyverse)
```

    ## Warning: package 'ggplot2' was built under R version 4.3.3

``` r
list.files('code/', full.names = T, recursive = T) %>% .[grepl('.R', .)] %>% as.list() %>% walk(~source(.))
```

##Question 1
