library(readr)
library(here)

# Extract the columns needed for the research: nombres,
# identificación, universidad, especialidad
extract_columns <- function(df, cols) {
  df[, cols]
}
file_name <- "2022_peru-postulantes.csv"
dat <- read_csv(here("data/raw", file_name))

# ---- "POSTULANTES" -----

# Check the columns to extract (id, names, university, specialty)
dat <- extract_columns(dat, c(3, 6, 7, 9))
View(head(dat))


# Check that data is not missing (the columns selected)
lapply(dat, \(x) sum(is.na(x)))

# Save it
write_csv(dat, here("data/clean", file_name))

# ---- "INGRESANTES" ----
# Just extract a list of the document numbers
file_name <- "2022_peru-ingresantes.csv"
dat <- read_csv(here("data/raw", file_name))
dat <- extract_columns(dat, 2)
View(head(dat))
lapply(dat, \(x) sum(is.na(x)))
write_csv(dat, here("data/clean", file_name))
