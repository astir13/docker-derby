#!/usr/bin/bash
echo "didn't find /keys/ files => startin insecure"
cd /dbs
java -Djavax.stream.error.field=java.lang.System.out \
     org.apache.derby.drda.NetworkServerControl start -h 0.0.0.0 
