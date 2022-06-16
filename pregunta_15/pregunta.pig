lines = LOAD 'data.csv' USING PigStorage(',') AS (ColId:INT, UserName:chararray, UserLastName:chararray, date:chararray,color:chararray,numb:INT);
colum = FOREACH lines GENERATE UserName, color;
filtered = FILTER colum BY color == 'blue' AND (UserName MATCHES '.*^[zZ].*');
STORE filtered INTO 'output' USING PigStorage(' ');
