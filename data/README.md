# Datos

La base de datos contiene información extraída de [CONAREME](https://www.conareme.org.pe/web/) del 2013 al 2023. La información de los postulantes se registra desde el 2013, mientras que la de los ingresantes desde el 2016.

El proceso de extracción y limpieza de los datos se encuentra en el `README.md` file en la carpeta `src`. En este archivo se describe el proceso de obtención y limpieza de los datos. En la presente carpeta se encuentran varios de los archivos intermediarios obtenidos durante este proceso. La base de datos final usada para la realización del estudio se encuentra en el siguiente archivo: `full_deidentified_data.csv`. A continuación se procederá a describir esta base de datos.

## Base de datos: `full_deidentified_data.csv`

Cada una de las filas representa a un postulante en un año. Las columnas contienen información de diferentes variables con la siguiente información:

- `universidad`: universidad de postulación
- `especialidad`: especialidad de postulación
- `ingreso`: resultado de postulación, `1` significa que sí ingresó, `0` significa que no ingresó.
- `genero`: género del postulante. `1` es femenino, `0` es masculino.
- `year`: año de postulación
- `especialidad_quirurgica`: tipo de especialidad. `1` significa especialidad quirúrgica, `0` significa especialidad clínica. Variable obtenida a partir de la especialidad.
- `especialidad_tipo`: tipo de especialidad, categorizada en cuatro: `"clinica"`, `"medico_quirurgica"`, `"quirurgica"`, `"laboratorio_diagnostica"`. Variable obtenida a partir de la especialidad.
- `subespecialidad`: grado de especialización. `1` para las subespecialidades, `0` para las especialidades solamente. Variable obtenida a partir de la especialidad.
- `region`: región de postulación, variable obtenida a partir de la universidad de postulación.

## Diccionario de género (`first_name-gender_dictionary.csv`)

Contiene el diccionario utilizado para la asignación de género de los nombres, antes de ser de-identificados.

Cuenta con 2 columnas las cuales tienen la información de un *primer* nombre y su género. `F` para el género femenino y `M` para el género masculino.

Para crear este diccionario se obtuvo información de:

- https://github.com/MatthiasWinkelmann/firstname-database
- https://es.wikipedia.org/w/index.php?title=Categor%C3%ADa:Nombres_femeninos&oldid=133963810
- https://es.wikipedia.org/w/index.php?title=Categor%C3%ADa:Nombres_masculinos&oldid=133993197

El proceso también de armado de este diccionario también se describe en el `README.md` file en la carpeta `src`.
