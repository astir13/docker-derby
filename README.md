# Apache Derby Docker Image
This repository provides a Docker image for Apache Derby using OpenJDK JRE.

You can find the built images at https://hub.docker.com/r/az82/docker-derby/.

## Software Versions
* Derby: 10.15.2.0 (http://db.apache.org/derby/index.html)
* Base Image: Latest AdoptOpenJDK 11 JRE image with Debian slim (https://github.com/AdoptOpenJDK/openjdk-docker)

## Image Properties
* Exposes port _1527_
* Provides a volume _/dbs_ that will contain the Apache Derby databases
* Provides a volume _/keys_ that will contain the Derby security keystores and keys if you choose to use security
* _derby.log_ is redirected to _stdout_
* Basic health check that verifies that Derby is attached to the listen port

## Security
* If you want to use Derby sslAuthentication, you can start the server, then
** log into the docker's shell by use of the docker exec command with /bin/bash 
** change the default passwords in the /newkeys.sh script according to the Derby security guide https://db.apache.org/derby/docs/10.13/security/index.html
** execute command /newkeys.sh in the docker to generate all keys and keyshares needed
** find the newly generated keys in the _/keys_ volume mount on your docker host
** follow the Derby Security Guide for further information on how to use: https://db.apache.org/derby/docs/10.13/security/index.html
* enhance security by deleting the script with the passwords and the keystores not needed on the server, etc.
* restart the docker, the existence of the keys will make it a secure docker server requiring sslAuthentication for each access client
* if you mount the keys to a host directory, they will survive restartin the docker

## Build Status
* [Travis CI: ![Build Status](https://travis-ci.org/az82/docker-derby.svg?branch=master)](https://travis-ci.org/az82/docker-derby)
