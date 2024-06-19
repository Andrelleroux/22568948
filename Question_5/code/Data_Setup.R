Database_Connect <- function(dataroot){

    remotes::install_github("HanjoStudy/dbbasic")
    library(tidyverse)
    library(dbbasic)

    usethis::edit_r_environ()

    #gp_user = exam
    #gp_pass = e4oSSMr6TXgASfkoysY5
    #gp host= 102.222.21.138
    #gp port= 5010

    conn <- db_connect(db = "psql_datascience")
    DBI::dbDisconnect(conn)

}