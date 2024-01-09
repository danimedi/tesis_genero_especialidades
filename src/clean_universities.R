library(readr)
library(here)

dat <- read_csv(here("data/full_deidentified_data.csv"))
sort(table(dat$universidad)) # Detect wrong universities

collapse_into_one <- function(x, input, output) {
  ifelse(x %in% input, output, x)
}

# USMP
dat$universidad <- collapse_into_one(
  x = dat$universidad,
  input = c("AUSMP", "SUSMP"),
  output = "USMP"
)

# URP
dat$universidad <- collapse_into_one(
  x = dat$universidad,
  input = c("DITHURP", "HURP", "ILLOURP - Lima", "OSURP", "ROSARUIORP", "ROSURP", "AURP", "SURP"),
  output = "URP"
)

# UNMSM
dat$universidad <- collapse_into_one(
  x = dat$universidad,
  input = c("EMMAUNMSM", "N FEURNMASNMDEZ", "OUNMSM", "RRESUNMSM", "SABINUANMSM", "SUNMSM", "EDESUNMSM"),
  output = "UNMSM"
)

# UPCH
dat$universidad <- collapse_into_one(
  x = dat$universidad,
  input = c("ENASUPCH", "IUPCH", "SUPCH"),
  output = "UPCH"
)

# USMP
dat$universidad <- collapse_into_one(
  x = dat$universidad,
  input = c("GOUSMP", "LESUSMP"),
  output = "USMP"
)

# UNT
dat$universidad <- collapse_into_one(
  x = dat$universidad,
  input = c("HUNT"),
  output = "UNT"
)

# UNSA
dat$universidad <- collapse_into_one(
  x = dat$universidad,
  input = c("IKUNSA", "LESUNSA", "OUNSA", "IEUNSA"),
  output = "UNSA"
)

# UPAO
dat$universidad <- collapse_into_one(
  x = dat$universidad,
  input = c("LINDAUPAO", "RIOUPAO", "RUPAO", "SUPAO", "HUPAO"),
  output = "UPAO"
)

# UNCP
dat$universidad <- collapse_into_one(
  x = dat$universidad,
  input = c("NUNCP"),
  output = "UNCP"
)

sort(table(dat$universidad)) # Detect wrong universities

write_csv(dat, "data/full_deidentified_data.csv")
