# !/bin/bash
jq '.' file.json #Spread .json to a well-formatted json file.
jq '.[]' file.json #Spread .json to a well-formatted ndjson file.
jq '.[] | {Var1: .var1, Var2: .var2}' file.json #Extract Items var1 and var2 from the previous json file as an ndjson.
jq '.[] | {Var1: .var1, Var2: .var2[].Items}' file.json #If var2 is an array then spread it and extract object 'Items' from object var2.
jq -s . file.json #Make a well-formatted json back to a one-line json.
#Use map and group_by to do simple calculation on data. 
jq '[.] | map({Country: .pubcountry}) | .[]' 1.ndjson| jq -s . | jq 'group_by(.Country) | map({Country: .[].Country, Count: length}) | unique' > 2.json
#This code counts the number of Items which pubcounty
jq -c '.' file #Make well-formatted .ndjson back to one line .ndjson.

