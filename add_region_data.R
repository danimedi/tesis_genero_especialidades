library(readr)
library(here)

dat <- read_csv(here("data/full_deidentified_data.csv"))
sort(table(dat$universidad)) # Visualize universities

# Distribute data in 5 regions: Lima, Norte, Centro, Sur, Oriente

lima_region <- c(
  "UPC", "Lima - UNFV", "UCS", "UNFV - Lima", "Lima - UPCH", "UPSJB",
  "Lima - URP", "USP", "Lima - UNMSM", "URP - Lima", "UCSUR", "UNMSM - Lima",
  "UNFV", "UPCH", "USMP", "URP", "UNMSM", "CONAREME"
)
norte_region <- c(
  "Norte - UNC", "NORTE", "UNC - Cajamarca", "Norte - UPAO", "UCV",
  "UNT - Trujillo", "UNC", "UNP", "UNPRG", "UNT", "UPAO"
)
centro_region <- c(
  "Centro - Ucontinental", "CENTRO 3", "CENTRO 2", "CENTRO 1", "UNCP",
  "UPLA", "UNSLGI"
)
sur_region <- c(
  "SUR", "Sur - UNSA", "UCSM - Arequipa", "UPT", "UNA", "UNSAAC", "UCSM", "UNSA"
)
oriente_region <- c("Oriente - UNAP", "UNAP - Iquitos", "UNAP")

dat$region <- ifelse(
  dat$universidad %in% lima_region,
  "Lima",
  ifelse(
    dat$universidad %in% norte_region,
    "Norte",
    ifelse(
      dat$universidad %in% centro_region,
      "Centro",
      ifelse(
        dat$universidad %in% sur_region,
        "Sur",
        ifelse(
          dat$universidad %in% oriente_region,
          "Oriente",
          "CONAREME"
        )
      )
    )
  )
)

write_csv(dat, "data/full_deidentified_data.csv")
