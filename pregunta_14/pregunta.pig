lines = LOAD 'data.csv' USING PigStorage(',') AS (ColId:INT, UserName:chararray, UserLastName:chararray, date:chararray,color:chararray,numb:INT);
colum = FOREACH lines GENERATE color;
filtered = FILTER colum BY NOT (color MATCHES '.*^[bB].*');
STORE filtered INTO 'output' USING PigStorage(',');
