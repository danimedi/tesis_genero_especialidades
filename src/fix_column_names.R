library(readr)
library(here)

file_path <- "data/clean/2023_peru-postulantes.csv"
# Sort columns and change names
dat <- read_csv(here(file_path))
names(dat)
col_names <- c("id", "nombres", "universidad", "especialidad")

names(dat) <- col_names
View(head(dat))

write_csv(dat, file_path)
