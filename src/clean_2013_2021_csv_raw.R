library(readr)
library(dplyr)

dat <- read_csv("data/2013-2021_data_base_raw.csv")

# year ok
# gender ok
# universidad postulantes ok
# universidad ingresantes ok
# especialidad postulantes ok
# especialidad ingresantes ok
# ingreso -- no --

# Adapt the columns to the output data set
dat <- select(
  dat, year, gender, Universidad_postulantes, Universidad_ingresantes,
  `Especialidad/SubEspecialidad_postulantes`,
  `Especialidad/SubEspecialidad_ingresantes`
)
i <- is.na(dat$`Especialidad/SubEspecialidad_ingresantes`) &
  is.na(dat$Universidad_ingresantes)
dat$ingreso <- !i

# Make the columns the right type of vector
dat$gender <- ifelse(dat$gender == "F", 1, 0)
dat$ingreso <- as.numeric(dat$ingreso)

# ... and the right names
new_names <- c(
  "year", "gender", "Universidad_postulantes", "Universidad_ingresantes",
  "especialidad_subespecialidad_postulantes",
  "especialidad_subespecialidad_ingresantes", "ingreso"
)
names(dat) <- new_names

write_csv(dat, "data/2013-2021_data_base_clean.csv")
