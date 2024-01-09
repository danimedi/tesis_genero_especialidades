library(readr)
library(here)

dat <- read_csv(here("data/full_deidentified_data.csv"))

specialties <- unique(dat$especialidad)
sort(specialties)

surgical <- specialties[grepl(specialties, pattern = "^CIRUGIA")]
surgical <- c(surgical, "NEUROCIRUGIA", "NEUROCIRUGIA PEDIATRICA")
surgical_medical <- c(
  "DERMATOLOGIA", "DERMATOLOGIA PEDIATRICA", "GINECOLOGIA Y OBSTETRICIA",
  "EMERGENCIAS PEDIATRICAS", "MEDICINA DE EMERGENCIAS Y DESASTRES",
  "OFTALMOLOGIA", "OFTALMOLOGIA ONCOLOGICA", "OFTALMOLOGIA PEDIATRICA Y ESTRABISMO",
  "OTORRINOLARINGOLOGIA", "ORTOPEDIA Y TRAUMATOLOGIA", "UROLOGIA",
  "UROLOGIA ONCOLOGICA", "UROLOGIA PEDIATRICA", "GINECOLOGIA ONCOLOGICA",
  "PEDIATRIA DE EMERGENCIAS Y DESASTRES"
)
labs_diagnosis <- c(
  "ANATOMIA PATOLOGICA", "GENETICA MEDICA", "MEDICINA NUCLEAR", "RADIOLOGIA",
  "PATOLOGIA CLINICA", "PATOLOGIA ONCOLOGICA"
)

dat$especialidad_tipo <- ifelse(
  dat$especialidad %in% surgical,
  "quirurgica",
  ifelse(
    dat$especialidad %in% surgical_medical,
    "medico_quirurgica",
    ifelse(
      dat$especialidad %in% labs_diagnosis,
      "laboratorio_diagnostica",
      "clinica"
    )
  )
)

write_csv(dat, here("data/full_deidentified_data.csv"))
