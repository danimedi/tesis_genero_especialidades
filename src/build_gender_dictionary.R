library(readr)
library(here)
library(stringr)
library(stringi)

# ----- First names gender database ----

# Get the data from the first names gender database.
# Check this link: https://github.com/MatthiasWinkelmann/firstname-database

firstnames_database <- read_csv2(here("data/gender_dictionary/firstnames.csv"))

get_first_names <- function(x) {
  x %>%
    str_extract("^\\w+") %>%
    str_to_lower() %>%
    stri_trans_general(id = "Latin-ASCII")
}

dat_res <- firstnames_database[, 1:2]
dat_res$gender <- ifelse(
  dat_res$gender %in% c("F", "1F", "?F"),
  "F",
  ifelse(
    dat_res$gender %in% c("M", "1M", "?M"),
    "M",
    "?"
  )
)

# There were duplicates of names with different information, I have to remove them

# But first, remove accents and put it in lower case
dat_res$name <- get_first_names(dat_res$name)

# This function is very useful for removing duplicates
remove_duplicates <- function(df) {
  names_count <- table(df$name)
  names_duplicated <- names(names_count[names_count > 1])

  gender_for_repeated_name <- vector("character", length(names_duplicated))
  for (i in seq_along(names_duplicated)) {
    name <- names_duplicated[i]
    gender_data <- df[df$name == name, "gender"]
    gender_data <- gender_data[!is.na(gender_data)]
    if (all(gender_data == gender_data[1])) {
      gender_for_repeated_name[i] <- gender_data[1]
    } else {
      gender_for_repeated_name[i] <- "?"
    }
  }
  dat_duplicated <- data.frame(
    name = names_duplicated, gender = gender_for_repeated_name
  )

  df <- df[!df$name %in% names_duplicated, ]
  df <- rbind(df, dat_duplicated)
  df
}

dat_res <- remove_duplicates(dat_res)

# ---- Add data from Wikipedia ----

# Check these links:
# https://es.wikipedia.org/wiki/Categor%C3%ADa:Nombres_femeninos
# https://es.wikipedia.org/wiki/Categor%C3%ADa:Nombres_masculinos

female_names <- read_lines(here("data/gender_dictionary/female_names.txt"))
male_names <- read_lines(here("data/gender_dictionary/male_names.txt"))

female_names <- get_first_names(female_names)
female_data <- data.frame(
  name = female_names,
  gender = rep("F", length(female_names))
)
dat_res <- rbind(dat_res, female_data)

male_names <- get_first_names(male_names)
male_data <- data.frame(
  name = male_names,
  gender = rep("M", length(male_names))
)
dat_res <- rbind(dat_res, male_data)

dat_res <- remove_duplicates(dat_res)

# ---- Add manual data ----

manual_data <- read_csv("data/gender_dictionary/manual_gender_names.csv")
dat_res <- rbind(dat_res, manual_data)
dat_res <- remove_duplicates(dat_res)

write_csv("data/first_name-gender_dictionary.csv")
