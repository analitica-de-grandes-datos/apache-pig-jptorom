lines = LOAD 'data.csv' USING PigStorage(',') AS (ColId:INT, UserName:chararray, UserLastName:chararray, date:chararray,color:chararray,numb:INT);
colum = FOREACH lines GENERATE REGEX_EXTRACT(color,'([^b].*)',1) AS D1;
filtered = FILTER colum BY D1 is not null;
STORE filtered INTO 'output' USING PigStorage(',');
