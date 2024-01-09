library(readr)
library(here)

year <- 2023
dat_postulante <- read_csv(here("data/clean", paste0(year, "_peru-postulantes.csv")))
dat_ingresante <- read_csv(here("data/clean", paste0(year, "_peru-ingresantes.csv")))
dat_ingresante <- dat_ingresante[[1]]
sum(is.na(dat_ingresante)) # Check missing data

dat_postulante$ingreso <- ifelse(dat_postulante$id %in% dat_ingresante, 1, 0)
View(head(dat_postulante, n = 20))
write_csv(dat_postulante, here("data/clean", paste0(year, "_clean.csv")))

# For those before 2016
year <- 2015
file_name <- paste0(year, "_peru-postulantes.csv")
dat_postulante <- read_csv(here("data/clean", file_name))
dat_postulante$ingreso <- NA
write_csv(dat_postulante, here("data/clean", paste0(year, "_clean.csv")))
