
arquivo <- list.files("DATASUS", pattern = ".dbc")
caminho <- stringr::str_c("DATASUS/",arquivo)
saida <- stringr::str_c("CONVERSÕES/PAHUAB",stringr::str_sub(arquivo, start = 5, end = 8))
a <- read.dbc::read.dbc(caminho)
a <- dplyr::filter(a, PA_CODUNI == "4014111")
readr::write_rds(a, path = saida)
