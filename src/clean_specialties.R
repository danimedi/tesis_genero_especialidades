library(readr)

dat <- read_csv("data/full_data.csv")

collapse_into_one <- function(x, input, output) {
  ifelse(x %in% input, output, x)
}

# Administración y gestión en salud
dat$especialidad_postulantes <- collapse_into_one(
  x = dat$especialidad_postulantes,
  input = c("ADMINISTRACION  Y GESTION EN SALUD", "ADMINISTRACION EN SALUD"),
  output = "ADMINISTRACION Y GESTION EN SALUD"
)

# Anestesiología cardiovascular
dat$especialidad_postulantes <- collapse_into_one(
  x = dat$especialidad_postulantes,
  input = "ANESTESIOLOGIA Y TERAPIA INTENSIVA CARDIOVASCU",
  output = "ANESTESIOLOGIA CARDIOVASCULAR"
)

# Cirugía de cabeza y cuello
dat$especialidad_postulantes <- collapse_into_one(
  x = dat$especialidad_postulantes,
  input = "CIRUGIA DE CABEZA Y CUELLO",
  output = "CIRUGIA DE CABEZA, CUELLO Y MAXILOFACIAL"
)

# Cirugía de colon, recto y ano
dat$especialidad_postulantes <- collapse_into_one(
  x = dat$especialidad_postulantes,
  input = "CIRUGIA DE COLON,  RECTO Y ANO",
  output = "CIRUGIA DE COLON, RECTO Y ANO"
)

# Cirugía oncológica de mamas, tejidos
dat$especialidad_postulantes <- collapse_into_one(
  x = dat$especialidad_postulantes,
  input = "CIRUGIA ONCOLOGICA DE MAMAS, TEJIDOS BLANDOS Y",
  output = "CIRUGIA ONCOLOGICA DE MAMAS, TEJIDOS"
)

# Cirugía plástica
dat$especialidad_postulantes <- collapse_into_one(
  x = dat$especialidad_postulantes,
  input = "CIRUGIA PLASTICA",
  output = "CIRUGIA PLASTICA Y RECONSTRUCTIVA"
)

# Cirugía de tórax y cardiovascular
dat$especialidad_postulantes <- collapse_into_one(
  x = dat$especialidad_postulantes,
  input = "CIRUGIA TORACICA Y CARDIOVASCULAR",
  output = "CIRUGIA DE TORAX Y CARDIOVASCULAR"
)

# Hematología
dat$especialidad_postulantes <- collapse_into_one(
  x = dat$especialidad_postulantes,
  input = "HEMATOLOGIA CLINICA",
  output = "HEMATOLOGIA"
)

# Medicina de enfermedades infecciosas
dat$especialidad_postulantes <- collapse_into_one(
  x = dat$especialidad_postulantes,
  input = "MEDICINA DE ENFERMEDADES INFECCIOSAS Y TROPIC",
  output = "MEDICINA DE ENFERMEDADES INFECCIOSA"
)

# Medicina ocupacional
dat$especialidad_postulantes <- collapse_into_one(
  x = dat$especialidad_postulantes,
  input = "MEDICINA OCUPACIONAL Y DEL MEDIO AMBI",
  output = "MEDICINA OCUPACIONAL Y DEL MEDIO AMBIENTE"
)

# Psiquiatría del niño
dat$especialidad_postulantes <- collapse_into_one(
  x = dat$especialidad_postulantes,
  input = "PSIQUIATRIA DEL NIÃ‘O Y DEL ADOLESCENT",
  output = "PSIQUIATRIA DEL NIÑO Y DEL ADOLESCENTE"
)

sort(unique(dat$especialidad_postulantes))

write_csv(dat, "data/full_data.csv")
