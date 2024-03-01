library(readr)
library(here)
library(stringr)
library(stringi)

# Functions to use the dictionary
dict <- read_csv(here("data/first_name-gender_dictionary.csv"))
clean_first_names <- function(names) {
  names |>
    str_to_lower() |>
    str_extract("\\w+") |>
    stri_trans_general(id = "Latin-ASCII")
}
assign_gender <- function(clean_names, dict) {
  dict_lookup <- dict$gender
  dict_lookup <- setNames(dict_lookup, dict$name)
  gender <- dict_lookup[clean_names]
  gender <- ifelse(
    gender == "?", NA, ifelse(
      gender == "F", 1, ifelse(
        gender == "M", 0, NA
      )
    )
  )
  gender
}

# Assign gender
file_path <- "data/clean/2023_clean.csv"
dat <- read_csv(here(file_path))
x <- clean_first_names(dat$nombres)
x <- assign_gender(x, dict)
dat$genero <- x
View(head(dat, n = 20))
write_csv(dat, here(file_path))
