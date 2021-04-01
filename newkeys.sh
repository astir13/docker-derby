#!/usr/bin/bash
cd /keys
keytool -genkey -alias $HOSTNAME -keystore ServerKeyStore -storepass storepass
keytool -export -alias $HOSTNAME -keystore ServerKeyStore -rfc -file ServerCertificate -storepass storepass 
keytool -genkey -alias glucosafe -keystore ClientKeyStore -storepass storepass
keytool -export -alias glucosafe -keystore ClientKeyStore -rfc -file ClientCertificate -storepass storepass 
keytool -import -alias $HOSTNAME -file ServerCertificate -keystore ClientTrustStore -storepass storepass
keytool -import -alias $HOSTNAME -file ClientCertificate -keystore ServerTrustStore -storepass storepass
   
