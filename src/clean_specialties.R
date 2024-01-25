library(readr)
library(here)

dat <- read_csv(here("data/full_deidentified_data.csv"))
sort(unique(dat$especialidad))

collapse_into_one <- function(x, input, output) {
  ifelse(x %in% input, output, x)
}

# Administración y gestión en salud
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = c("ADMINISTRACION  Y GESTION EN SALUD", "ADMINISTRACION EN SALUD"),
  output = "ADMINISTRACION Y GESTION EN SALUD"
)

# Anestesiología cardiovascular
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = "ANESTESIOLOGIA Y TERAPIA INTENSIVA CARDIOVASCU",
  output = "ANESTESIOLOGIA CARDIOVASCULAR"
)

# Cirugía de cabeza y cuello
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = "CIRUGIA DE CABEZA Y CUELLO",
  output = "CIRUGIA DE CABEZA, CUELLO Y MAXILOFACIAL"
)

# Cirugía de colon, recto y ano
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = "CIRUGIA DE COLON,  RECTO Y ANO",
  output = "CIRUGIA DE COLON, RECTO Y ANO"
)

# Cirugía oncológica de mamas, tejidos
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = "CIRUGIA ONCOLOGICA DE MAMAS, TEJIDOS BLANDOS Y",
  output = "CIRUGIA ONCOLOGICA DE MAMAS, TEJIDOS"
)

# Cirugía oncológica de cabeza y cuello
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = "CIRUGIA ONCOLOGICA DE CABEZA Y CUELL",
  output = "CIRUGIA ONCOLOGICA DE CABEZA Y CUELLO"
)

# Cirugía plástica
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = "CIRUGIA PLASTICA",
  output = "CIRUGIA PLASTICA Y RECONSTRUCTIVA"
)

# Cirugía de tórax y cardiovascular
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = "CIRUGIA TORACICA Y CARDIOVASCULAR",
  output = "CIRUGIA DE TORAX Y CARDIOVASCULAR"
)

# Hematología
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = "HEMATOLOGIA CLINICA",
  output = "HEMATOLOGIA"
)

# Medicina de enfermedades infecciosas
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = c(
    "MEDICINA DE ENFERMEDADES INFECCIOSAS Y TROPIC",
    "MEDICINA DE ENFERMEDADES INFECCIOSA"
  ),
  output = "MEDICINA DE ENFERMEDADES INFECCIOSAS Y TROPICALES"
)

# Medicina física y de rehabilitación
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = c("MEDICINA DE REHABILITACION"),
  output = "MEDICINA FISICA Y DE REHABILITACION"
)

# Medicina ocupacional
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = "MEDICINA OCUPACIONAL Y DEL MEDIO AMBI",
  output = "MEDICINA OCUPACIONAL Y DEL MEDIO AMBIENTE"
)

# Psiquiatría del niño
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = c("PSIQUIATRIA DEL NIÃ‘O Y DEL ADOLESCENT", "PSIQUIATRIA DE NIÑOS Y ADOLESCENTES"),
  output = "PSIQUIATRIA DEL NIÑO Y DEL ADOLESCENTE"
)

# Pediatría de emergencias
dat$especialidad <- collapse_into_one(
  x = dat$especialidad,
  input = c("EMERGENCIAS PEDIATRICAS"),
  output = "PEDIATRIA DE EMERGENCIAS Y DESASTRES"
)

sort(unique(dat$especialidad))

write_csv(dat, here("data/full_deidentified_data.csv"))
