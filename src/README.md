## Limpieza de datos

### Obtención de datos y unificación

Los datos originales se obtuvieron de la [página web de CONAREME](https://www.conareme.org.pe/web/). Estos datos se encuentran en formato PDF, estos archivos fueron colocados en una [carpeta Drive](https://drive.google.com/drive/folders/1e4MtL0uBSwDoeJs7bZjQH9q3Dop9anFb?usp=sharing). Se usó el programa [Tabula](https://tabula.technology/) para extraer las tablas en archivos CSV. Estos archivos extraidos también se encuentran en la misma [carpeta Drive](https://drive.google.com/drive/folders/1e4MtL0uBSwDoeJs7bZjQH9q3Dop9anFb?usp=sharing).

### Extracción y limpieza

Estos archivos CSV fueron usados como fuente de datos. En primer lugar se seleccionaron las columnas con información relevante para la investigación. Para esto se usó el código del archivo `simplify_raw_csv.R`.

Luego, se cambiaron los nombres de las columnas de forma estandarizada. Esto se realizó con el código en `fix_column_names.R`.

Luego, se agregó la columna de ingreso (si los postulantes ingresaron o no en su postulación) con el código en `add_ingreso_column.R`.

Luego, se asigno el género con el código en `assign_gender.R`.

Finalmente, se juntó toda la información en una sola base de datos y también se retiraron los identificadores (número identificador y nombres). Código en `unify_data.R`.

### Limpieza de variables

Algunos nombres de especialidades se escriben ligeramente diferente en distintos años, el código en `clean_specialties.R` soluciona este problema.

También hubo problemas con algunos nombres de universidades, esto se corrigió con el código en `clean_universities.R`.

Para mayor facilidad al trabajar con las especialidades quirúrgicas, se agregó una columna de especialidad quirúrgica con el código en ``

### Análisis

El código del análisis se encuentra en el archivo `analysis.qmd`. 
