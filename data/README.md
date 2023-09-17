## Base de datos (`full_data.csv`)

La base de datos contiene información extraída de [CONAREME](https://www.conareme.org.pe/web/) del 2013 al 2023. La información de los postulantes se registra desde el 2013, mientras que la de los ingresantes desde el 2016.

El proceso para crear la base de datos hasta el 2021 puede encontrarse en este repositorio: [peru_conareme_resultados](https://github.com/danimedi/peru_conareme_resultados), a partir de lo realizado en este repositorio se creó la base de datos `2013-2021_data_base.csv` que puede encontrarse en el siguiente repositorio: [mujeres_especialidades](https://github.com/danimedi/mujeres_especialidades). La base de datos final (`full_data.csv`) usa el mismo formato que la base de datos anteriormente mencionada, pero agrega información de los años 2022 y 2023.

Esta base de datos contiene la información pertinente a la investigación y no tiene identificadores personales de las personas por motivos de privacidad.

Cada una de las filas representa a un postulante en un año. Las columnas contienen información de diferentes variables con la siguiente información:

- `year`: año de postulación, del 2013 al 2020
- `gender`: género asignado a partir del primer nombre de la persona, `1` corresponde a género femenino, mientras que `0` corresponde a género masculino, `NA` se colocó cuando no se pudo asignar un género en base al primer nombre
- `universidad_postulantes` y `universidad_ingresantes` contienen información sobre la universidad de la persona en las tablas de postulantes o ingresantes de CONAREME, respectivamente (de no ingresar, `Universidad_ingresantes` queda sin contenido en esa fila)
- `especialidad_postulantes` y `especialidad_ingresantes` contienen información sobre la especialidad elegida el momento de postular o ingresar de las personas (de no ingresar, `especialidad_ingresantes` queda sin contenido en esa fila)
- `ingreso` indica `1` si se tiene información de que la persona ingresó, o `0` si es que no se tiene información de que la persona ingresó (antes del 2016 todos tienen `0` debido a que no se registraban los ingresantes)

## Diccionario de género (`first_name-gender_dictionary.csv`)

Contiene el diccionario utilizado para la asignación de género de los nombres, antes de ser de-identificados.

Cuenta con 2 columnas las cuales tienen la información de un *primer* nombre y su género. `F` para el género femenino y `M` para el género masculino.

Para crear este diccionario se obtuvo información de:

- https://github.com/MatthiasWinkelmann/firstname-database
- https://es.wikipedia.org/w/index.php?title=Categor%C3%ADa:Nombres_femeninos&oldid=133963810
- https://es.wikipedia.org/w/index.php?title=Categor%C3%ADa:Nombres_masculinos&oldid=133993197

Luego se unió la información y se eliminó o corrigió los nombres con género ambiguo (tanto femenino como masculino). Además, se agregó manualmente géneros a nombres de la base de datos principal que tenían género conocido.
