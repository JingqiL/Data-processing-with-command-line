# !/bin/bash
jq '.' file.json #Spread .json to a well-formatted json file.
jq '.[]' file.json #Spread .json to a well-formatted ndjson file.
jq '.[] | {Var1: .var1, Var2: .var2}' file.json #Extract Items var1 and var2 from the previous json file as an ndjson.
jq '.[] | {Var1: .var1, Var2: .var2[].Items}' file.json #If var2 is an array then spread it and extract object 'Items' from object var2.
jq -s . file.json #Make a well-formatted json back to a one-line json.
jq 
