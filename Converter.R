# ler um arquivo
arquivo <- list.files("DATASUS", pattern = ".dbc")
caminho <- stringr::str_c("DATASUS/",arquivo)
saida <- stringr::str_c("CONVERSÕES/PAHUAB",stringr::str_sub(arquivo, start = 5, end = 8))
a <- read.dbc::read.dbc(caminho)
a <- dplyr::filter(a, PA_CODUNI == "4014111")
readr::write_rds(a, path = saida)

# Com for
arquivo <- list.files("DATASUS", pattern = ".dbc")
caminho <- NULL
saida <- NULL
a <- NULL
b <- NULL
for (i in 1 : length(arquivo))
{
caminho[i] <- stringr::str_c("DATASUS/",arquivo[i])
saida[i] <- stringr::str_c("CONVERSÕES/PAHUAB",stringr::str_sub(arquivo[i], start = 5, end = 8),".rds")
}

dados <- purrr::map(caminho, read.dbc::read.dbc)

for (i in 1 : length(arquivo))
{
b[[i]] <- dplyr::filter(dados[[i]], PA_CODUNI == "4014111")
}





saida <- stringr::str_c("CONVERSÕES/PAHUAB",stringr::str_sub(arquivo, start = 5, end = 8))
a <- read.dbc::read.dbc(caminho)
a <- dplyr::filter(a, PA_CODUNI == "4014111")
readr::write_rds(a, path = saida)
