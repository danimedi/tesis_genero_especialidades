## Limpieza de datos

### Obtención de datos y unificación

Los datos originales se obtuvieron de la [página web de CONAREME](https://www.conareme.org.pe/web/). Estos datos se encuentran en formato PDF, estos archivos fueron colocados en una [carpeta Drive](https://drive.google.com/drive/folders/1e4MtL0uBSwDoeJs7bZjQH9q3Dop9anFb?usp=sharing). Se usó el programa [Tabula](https://tabula.technology/) para extraer las tablas en archivos CSV. Estos archivos extraidos también se encuentran en la misma [carpeta Drive](https://drive.google.com/drive/folders/1e4MtL0uBSwDoeJs7bZjQH9q3Dop9anFb?usp=sharing).

### Diccionario de género

Se usó una base de datos para obtener el género a partir del primer nombre. Los links y los detalles de la obtención de esta base de datos se encuentran en el archivo con el código con el que se arma esta base de datos, que se encuentra en `build_gender_dictionary.R`.

### Extracción y limpieza

Estos archivos CSV fueron usados como fuente de datos. En primer lugar se seleccionaron las columnas con información relevante para la investigación. Para esto se usó el código del archivo `simplify_raw_csv.R`.

Luego, se cambiaron los nombres de las columnas de forma estandarizada. Esto se realizó con el código en `fix_column_names.R`.

Luego, se agregó la columna de ingreso (si los postulantes ingresaron o no en su postulación) con el código en `add_ingreso_column.R`. 

Luego, se asigno el género con el código en `assign_gender.R`.

Finalmente, se juntó toda la información en una sola base de datos y también se retiraron los identificadores (número identificador y nombres). Código en `unify_data.R`.

Nota: antes de unificar los datos, se creó una segunda base de datos que cuenta con los datos identificados, esto con el fin de asignar el género mediante otros medios. El código de este proceso se encuentra en: `create_identified_file.R`.

### Limpieza de variables

Algunos nombres de especialidades se escriben ligeramente diferente en distintos años, el código en `clean_specialties.R` soluciona este problema.

También hubo problemas con algunos nombres de universidades, esto se corrigió con el código en `clean_universities.R`.

Para mayor facilidad al trabajar con las especialidades quirúrgicas, se agregó una columna de especialidad quirúrgica con el código en `add_surgical_specialty_column.R`.

Posteriormente se agregó una columna con la información del tipo de especialidad (opciones: quirúrgica, clínica, médico-quirúrgica, laboratorio o diagnóstica), el código se encuentra en `add_specialty_type_column.R`.

Además, se agregó una columna que indica si la especialidad es una especialidad realmente o una subespecialidad. Esto en el código en `add_subspecialty_column.R`.

Debido a que los datos sobre la universidad eran inconsistentes, se agregó una columna sobre los datos de la región geográfica. Esto está en el código en `add_region_data.R`

### Análisis

El código del análisis se encuentra en el archivo `analysis.qmd`. 
