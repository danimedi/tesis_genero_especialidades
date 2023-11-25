library(readr)
library(dplyr)

# My final objective is creating a data set with the variables: id,
# university, specialty, final grade, sex, final result

# Unify 2022 and 2023 data

postulantes_2022 <- read_csv("data/2022_peru-postulantes.csv")
ingresantes_2022 <- read_csv("data/2022_peru-ingresantes.csv")

dat_2022 <- left_join(
  postulantes_2022, ingresantes_2022,
  by = "No Doc.",
  suffix = c("_postulantes", "_ingresantes")
)

i <- c(1, 2, 3, 4, 5, 7, 8)
dat_2022 <- dat_2022[, i]


postulantes_2023 <- read_csv("data/2023_peru-postulantes.csv")
ingresantes_2023 <- read_csv("data/2023_peru-ingresantes.csv")

dat_2023 <- left_join(
  postulantes_2023, ingresantes_2023,
  by = "No Doc.",
  suffix = c("_postulantes", "_ingresantes")
)

i <- c(1, 2, 3, 4, 5, 7, 8)
dat_2023 <- dat_2023[, i]

new_names <- c(
  "id", "nombres", "universidad_postulantes", "especialidad_postulantes",
  "nota_final", "universidad_ingresantes", "especialidad_ingresantes"
)
colnames(dat_2022) <- new_names
colnames(dat_2023) <- new_names

dat_2022$year <- 2022
dat_2023$year <- 2023

dat_2022_2023 <- bind_rows(dat_2022, dat_2023)

no_ingreso <- is.na(dat_2022_2023$universidad_ingresantes) &
  is.na(dat_2022_2023$especialidad_ingresantes)

dat_2022_2023$ingreso <- !no_ingreso

# Obtain the gender from the name (2022, 2023 data)

library(stringr)
library(stringi)

dict <- read_csv("data/first_name-gender_dictionary.csv")
first_names <- dat_2022_2023$nombres |>
  str_to_lower() |>
  str_extract("\\w+") |>
  stri_trans_general(id = "Latin-ASCII")

dict_lookup <- dict$gender
dict_lookup <- setNames(dict_lookup, dict$name)

gender <- dict_lookup[first_names]
gender <- ifelse(gender == "F", 1, 0)
dat_2022_2023$gender <- gender

# Add the 2022, 2023 data to the old data set

full_old_data <- read_csv("data/2013-2021_data_base_clean.csv")
new_names <- c(
  "year", "gender", "universidad_postulantes", "universidad_ingresantes",
  "especialidad_postulantes", "especialidad_ingresantes", "ingreso"
)
colnames(full_old_data) <- new_names

i <- names(dat_2022_2023) %in% c("id", "nombres", "nota_final")
dat_2022_2023 <- dat_2022_2023[, !i]

dat <- bind_rows(full_old_data, dat_2022_2023)

write_csv(dat, "data/full_data.csv")
