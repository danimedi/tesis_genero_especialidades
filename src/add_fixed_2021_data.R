library(readr)
library(here)
library(stringr)
library(stringi)

full_dat <- read_csv(here("data/full_data.csv"))
dat_2021 <- read_csv(here("data/2021_peru-postulantes.csv"))
dict <- read_csv(here("data/first_name-gender_dictionary.csv"))

# First, assign gender based on the names using the dictionary
first_names <- dat_2021$nombres |>
  str_to_lower() |>
  str_extract("\\w+") |>
  stri_trans_general(id = "Latin-ASCII")

dict_lookup <- dict$gender
dict_lookup <- setNames(dict_lookup, dict$name)

gender <- dict_lookup[first_names]
gender <- ifelse(gender == "F", 1, 0)
dat_2021$gender <- gender

# Remove the previous 2021 data
i <- full_dat$year == 2021
full_dat <- full_dat[!i, ]

# Add the 2021 data
dat_2021$year <- 2021
names(dat_2021) <- (c("nombres", "especialidad_postulantes", "gender", "year"))
dat_2021 <- dat_2021[, -1]
full_dat <- merge(full_dat, dat_2021, by = names(dat_2021), all = TRUE)

# Save the result
write_csv(full_dat, "data/full_data.csv")
