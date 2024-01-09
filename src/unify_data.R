library(readr)
library(here)

file_names <- list.files(here("data/clean"), pattern = ".*_clean\\.csv$", full.names = TRUE)
years <- 2013:2023
dat_list <- lapply(file_names, read_csv)
length(dat_list) == length(years) # Verify that they are the same
for (i in seq_along(years)) {
  dat_list[[i]]$year <- years[[i]]
}
dat <- Reduce(rbind, dat_list) # Unify data

# Remove the identifiers
dat <- dat[, c(-1, -2)]

write_csv(dat, "data/full_deidentified_data.csv")
