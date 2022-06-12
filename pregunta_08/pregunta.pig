/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.tsv' AS (col1:chararray, col2:BAG{A:tuple(a1:chararray)}, col3:map[]);
try = FOREACH lines GENERATE FLATTEN(col2) AS D1, FLATTEN(col3) AS D2;
wod1= FOREACH try GENERATE(D1,D2) AS G1;
grouped = GROUP wod1 BY G1;
wordcount = FOREACH grouped GENERATE group, COUNT(wod1);
STORE wordcount INTO 'output' USING PigStorage(',');
