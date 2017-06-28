#!/bin/bash
sed 's/^/[/' file.json #Add a [ at the beginning.
sed 's/$/]/' file.json #Add a ] at the end.
sed 's/,\]/]/g' file.json #Replace all ,] to ]. If without g, only replace the first obs then.
sed '
