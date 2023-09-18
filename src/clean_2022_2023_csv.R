library(readr)

# 2022 ---------------

postulantes_2022 <- read_csv("tabula-2022_peru-postulantes.csv")
i <- c("No Doc.", "Nombres", "Universidad", "Especialidad/SubEspecialidad", "Examen")
postulantes_2022 <- postulantes_2022[, i]
names(postulantes_2022)[5] <- "Nota final"
write_csv(postulantes_2022, "clean-postulantes_2022.csv")

ingresantes_2022 <- read_csv("tabula-2022_peru-ingresantes.csv")
i <- c("No Doc.", "Nombres", "Universidad", "Especialidad/SubEspecialidad")
ingresantes_2022 <- ingresantes_2022[, i]
write_csv(ingresantes_2022, "clean-ingresantes_2022.csv")


# 2023 --------------

postulantes_2023_1 <- read_csv("tabula-2023_peru-postulantes-conareme.csv")
postulantes_2023_2 <- read_csv("tabula-2023_peru-postulantes-universidad.csv")
i <- c("No Doc.", "Nombres", "Universidad", "Especialidad/SubEspecialidad", "ENAM")
postulantes_2023_1 <- postulantes_2023_1[, i]
postulantes_2023_2 <- postulantes_2023_2[, i]
names(postulantes_2023_1)[5] <- "Nota final"
names(postulantes_2023_2)[5] <- "Nota final"
postulantes_2023 <- rbind(postulantes_2023_1, postulantes_2023_2)
write_csv(postulantes_2023, "clean-postulantes_2023.csv")

ingresantes_2023 <- read_csv("tabula-2023_peru-ingresantes.csv")
i <- c("No Doc.", "Nombres", "Universidad", "Especialidad/SubEspecialidad")
ingresantes_2023 <- ingresantes_2023[, i]
write_csv(ingresantes_2023, "clean-ingresantes_2023.csv")

