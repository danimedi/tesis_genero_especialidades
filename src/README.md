
`add_2022_2023.R` contiene el código para agregar los datos de 2022 y 2023 a la base de datos final (`full_data.csv`).

`clean_2022_2023_csv.R` tiene el código usado para "limpiar" las bases de datos obtenidas del PDF luego de usar la herramienta [tabula](https://tabula.technology/) para extraer tablas en CSV de los PDFs. Nota: en este repositorio no se incluyen las bases de datos usadas en el código de este archivo por temas de privacidad.

`analysis.qmd` tiene el código del análisis de los datos

## Corrigiendo datos del 2021

Los datos del 2021 no estaban adecuadamente descargados, por este motivo se volvió a realizar la extracción de datos, el código usado para agregar estos datos es el siguiente: `add_fixed_2021_data.R`.
