FROM adoptopenjdk:11-jre-hotspot

MAINTAINER Stefan Pielmeier "stefan<at>symlinux.com"

ADD newkeys.sh /root/newkeys.sh

# prepare the entrypoint script just to start the supervisord
ADD entrypoint.sh /entrypoint.sh
RUN chmod 700 /entrypoint.sh
ADD startsecure.sh /startsecure.sh
RUN chmod 700 /startsecure.sh
ADD startunsecure.sh /startunsecure.sh
RUN chmod 700 /startunsecure.sh

ENV DERBY_VERSION=10.15.2.0
ENV DERBY_HOME=/derby
ENV DERBY_LIB=${DERBY_HOME}/lib
ENV CLASSPATH=${DERBY_LIB}/derby.jar:${DERBY_LIB}/derbynet.jar:${DERBY_LIB}/derbytools.jar:${DERBY_LIB}/derbyoptionaltools.jar:${DERBY_LIB}/derbyclient.jar

RUN \
    apt-get update && apt-get install -y supervisor wget netcat && \
    wget https://dist.apache.org/repos/dist/release/db/derby/db-derby-${DERBY_VERSION}/db-derby-${DERBY_VERSION}-bin.tar.gz && \
    tar xzf /db-derby-${DERBY_VERSION}-bin.tar.gz && \
    mv /db-derby-${DERBY_VERSION}-bin /derby && \
    rm -Rf /*.tar.gz ${DERBY_HOME}/demo ${DERBY_HOME}/javadoc ${DERBY_HOME}/docs ${DERBY_HOME}/test ${DERBY_HOME}/*.html ${DERBY_HOME}/KEYS \
    apt-get purge wget netcat && \
    rm -rf /var/lib/apt/lists/* \

WORKDIR /dbs
VOLUME ["/keys"]
VOLUME ["/dbs"]
EXPOSE 1527

HEALTHCHECK CMD nc -z localhost 1527 || exit 1

CMD ["/entrypoint.sh"]
