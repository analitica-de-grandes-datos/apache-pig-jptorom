/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.tsv' AS (col1:chararray, col2:BAG{A:tuple(a1:chararray)}, col3:map[]);
try = FOREACH lines GENERATE FLATTEN(col3) as word;
grouped = GROUP try BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(try);
STORE wordcount INTO 'output' USING PigStorage(',');
