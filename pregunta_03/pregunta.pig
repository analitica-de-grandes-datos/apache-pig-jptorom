/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' AS (letra:chararray, fecha:chararray, num:int);
numeros = FOREACH lines GENERATE num;
ordered = ORDER numeros By num asc;
ordered = LIMIT ordered 5;
STORE ordered INTO 'output' USING PigStorage(',');
