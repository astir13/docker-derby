#!/usr/bin/bash
echo "starting Derby in secure mode with /keys/ServerKeyStore and /keys/ServerTrustStore that were found"
cd /dbs
java -Djavax.net.ssl.keyStore=/keys/ServerKeyStore \
     -Djavax.net.ssl.keyStorePassword=Zul1f3r \
     -Djavax.net.ssl.trustStore=/keys/ServerTrustStore \
     -Djavax.net.ssl.trustStorePassword=Zul1f3r \
     -Djavax.stream.error.field=java.lang.System.out \
     org.apache.derby.drda.NetworkServerControl start -h 0.0.0.0 -ssl peerAuthentication
