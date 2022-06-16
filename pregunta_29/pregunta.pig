/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código en Pig para manipulación de fechas que genere la siguiente 
salida.

   1971-07-08,jul,07,7
   1974-05-23,may,05,5
   1973-04-22,abr,04,4
   1975-01-29,ene,01,1
   1974-07-03,jul,07,7
   1974-10-18,oct,10,10
   1970-10-05,oct,10,10
   1969-02-24,feb,02,2
   1974-10-17,oct,10,10
   1975-02-28,feb,02,2
   1969-12-07,dic,12,12
   1973-12-24,dic,12,12
   1970-08-27,ago,08,8
   1972-12-12,dic,12,12
   1970-07-01,jul,07,7
   1974-02-11,feb,02,2
   1973-04-01,abr,04,4
   1973-04-29,abr,04,4

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.csv' USING PigStorage(',') AS (ColId:INT, UserName:chararray, UserLastName:chararray, date:chararray ,color:chararray,numb:INT);
fechas = FOREACH lines GENERATE date as fec;
todate_data= FOREACH fechas GENERATE ToDate(fec,'yyyy-MM-dd') as (date_time: DateTime);
colum = FOREACH todate_data GENERATE ToString(date_time, 'yyyy-MM-dd') as (fechacompleta:chararray) ,ToString(date_time, 'MMM') as (nombremes:chararray),ToString(date_time, 'MM') as (mes:chararray), ToString(date_time, 'M') as (messimple:chararray);
colum = FOREACH colum GENERATE fechacompleta, REPLACE (nombremes,'Jan','ene') AS nombremes, mes, messimple;
colum = FOREACH colum GENERATE fechacompleta, REPLACE (nombremes,'Apr','abr') AS nombremes, mes, messimple;
colum = FOREACH colum GENERATE fechacompleta, REPLACE (nombremes,'Aug','ago') AS nombremes, mes, messimple;
colum = FOREACH colum GENERATE fechacompleta, REPLACE (nombremes,'Dec','dic') AS nombremes, mes, messimple;
colum = FOREACH colum GENERATE fechacompleta, LOWER(nombremes), mes, messimple;
STORE colum INTO 'output' USING PigStorage(',');
