library(readr)
library(here)
library(stringr)

file_names <- list.files(here("data/clean"), pattern = ".*_clean\\.csv$", full.names = TRUE)
years <- 2013:2023
dat_list <- lapply(file_names, read_csv)
length(dat_list) == length(years) # Verify that they are the same
for (i in seq_along(years)) {
  dat_list[[i]]$year <- years[[i]]
}
dat <- Reduce(rbind, dat_list) # Unify data

# There was a problem with the data of 2016, a code was used, instead of DNI
codes_2016 <- dat$id[dat$year == 2016]
dat_2016 <- read_csv("data/raw/2016_peru-postulantes.csv")
dat[dat$year == 2016, ]$id <- dat_2016[[4]]

# Add zeros before the DNI numbers, for those with fewer numbers
add_leading_zeros_char <- function(char_vector, digits) {
  str_pad(char_vector, width = digits, side = "left", pad = "0")
}
dat$id <- add_leading_zeros_char(dat$id, 8)

write_csv(dat, here("data/full_identified_data.csv"))
