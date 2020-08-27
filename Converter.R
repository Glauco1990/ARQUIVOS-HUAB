# Ler varios arquivos
arquivo <- list.files("DATASUS", pattern = ".dbc")

caminho <- NULL
saida <- NULL
a <- NULL
b <- NULL

for (i in 1 : length(arquivo))
{
  caminho[i] <- stringr::str_c("DATASUS/",arquivo[i])
  saida[i] <- stringr::str_c("../../PACOTES/DATASUSHUAB/data-raw/RDS/",stringr::str_sub(arquivo[i], end = 2),"HUAB",stringr::str_sub(arquivo[i], start = 5, end = 8),".rds")
}

dados <- purrr::map(caminho, read.dbc::read.dbc)

for (i in 1 : length(arquivo))
{
  ifelse(stringr::str_sub(arquivo[i], end = 2) == "LT", b[[i]] <- dplyr::filter(dados[[i]], CNES == "4014111"),
  ifelse(stringr::str_sub(arquivo[i], end = 2) == "PA", b[[i]] <- dplyr::filter(dados[[i]], PA_CODUNI == "4014111"),
  ifelse(stringr::str_sub(arquivo[i], end = 2) == "PF", b[[i]] <- dplyr::filter(dados[[i]], CNES == "4014111"),
  ifelse(stringr::str_sub(arquivo[i], end = 2) == "RD", b[[i]] <- dplyr::filter(dados[[i]], CNES == "4014111"),
  ifelse(stringr::str_sub(arquivo[i], end = 2) == "SP", b[[i]] <- dplyr::filter(dados[[i]], SP_CNES == "4014111"))))))

  readr::write_rds(b[[i]], path = saida[i], compress = "xz")
}
