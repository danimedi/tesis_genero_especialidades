library(readr)
library(here)

dat <- read_csv(here("data/full_deidentified_data.csv"))

specialties <- unique(dat$especialidad)
sort(specialties)

surgical_specialties <- specialties[grepl(specialties, pattern = "^CIRUGIA")]
surgical_specialties <- c(
  surgical_specialties,
  "GINECOLOGIA ONCOLOGICA", "GINECOLOGIA Y OBSTETRICIA", "NEUROCIRUGIA",
  "NEUROCIRUGIA PEDIATRICA", "OFTALMOLOGIA", "OFTALMOLOGIA ONCOLOGICA",
  "OFTALMOLOGIA PEDIATRICA Y ESTRABISMO", "ORTOPEDIA Y TRAUMATOLOGIA",
  "OTORRINOLARINGOLOGIA", "UROLOGIA", "UROLOGIA ONCOLOGICA",
  "UROLOGIA PEDIATRICA"
)

dat$especialidad_quirurgica <- ifelse(
  dat$especialidad %in% surgical_specialties, 1, 0
)

write_csv(dat, here("data/full_deidentified_data.csv"))
