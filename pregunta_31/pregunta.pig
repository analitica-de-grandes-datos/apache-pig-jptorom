/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.csv' USING PigStorage(',') AS (ColId:INT, UserName:chararray, UserLastName:chararray, date:chararray ,color:chararray,numb:INT);
fechas = FOREACH lines GENERATE date as fec;
todate_data= FOREACH fechas GENERATE ToDate(fec,'yyyy-MM-dd') as (date_time: DateTime);
c = FOREACH todate_data GENERATE ToString(date_time, 'yyyy') as fecnac;
grouped = GROUP c BY fecnac;
wordcount= FOREACH grouped GENERATE group, COUNT(c);
STORE wordcount INTO 'output' USING PigStorage(',');
