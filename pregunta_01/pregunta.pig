/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' AS (letra:chararray, fecha:chararray, num:int);
r = FOREACH lines GENERATE letra as word;
grouped = GROUP r BY word;
wordcount= FOREACH grouped GENERATE group, COUNT(r);
STORE wordcount INTO 'output';
