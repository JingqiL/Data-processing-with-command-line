# !/bin/bash

#Spread .json to a well-formatted json file.
jq '.' file.json 

#Spread .json to a well-formatted ndjson file.
jq '.[]' file.json

#Extract Items var1 and var2 from the previous json file as an ndjson.
jq '.[] | {Var1: .var1, Var2: .var2}' file.json 

#If var2 is an array then spread it and extract object 'Items' from object var2.
jq '.[] | {Var1: .var1, Var2: .var2[].Items}' file.json

#Make a well-formatted json back to a one-line json.
jq -s . file.json

#Use map and group_by to do simple calculation on data. 
#This code counts the number of Items which pubcounty
jq '[.] | map({Country: .pubcountry}) | .[]' 1.ndjson| jq -s . | jq 'group_by(.Country) | map({Country: .[].Country, Count: length}) | unique' > 2.json

#Make well-formatted .ndjson back to one line .ndjson.
jq -c '.' file

#export .ndjson to .csv. USE -r TO KEEP THE ORIGINAL FORMAT IN THE FILE.
jq -r '. | [.Var1,.Var2] | @csv' file.ndjson > file.csv

#Delete columns.
jq '. | del(.ar1,.var2)' file.ndjson > file1.ndjson

#Select records that meet conditions.
jq '. | select(.var1 == .var2)' file.ndjson > file1.ndjson


