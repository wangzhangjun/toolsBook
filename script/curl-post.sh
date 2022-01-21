#/bin/bash

USE_NAME=jack
AGE=10
SERVER_NAME=http://10.211.55.2:8000
JSON_STRING='{"username":"'"$USE_NAME"'","age":"'"$AGE"'"}'

curl -H "Content-Type: application/json" -X POST -d $JSON_STRING $SERVER_NAME
if [ $? == 0 ]
then
    echo "http success"
else
    echo "http error"
fi