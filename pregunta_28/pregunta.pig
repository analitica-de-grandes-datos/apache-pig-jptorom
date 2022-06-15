/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.csv' USING PigStorage(',') AS (ColId:INT, UserName:chararray, UserLastName:chararray, date:chararray ,color:chararray,numb:INT);
fechas = FOREACH lines GENERATE date as fec;
todate_data= FOREACH fechas GENERATE ToDate(fec,'yyyy-MM-dd') as (date_time: DateTime);
c = FOREACH todate_data GENERATE GetYear(date_time) as dateStr1, ToString(date_time, 'yy') as (dateStr2:chararray);
DUMP c;
