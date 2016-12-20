FROM neowaylabs/jdk8

MAINTAINER Marcos Morelli <marcos.morelli@neoway.com.br>

ENV MAVEN_VERSION="3.3.9" \
    M2_HOME=/usr/lib/mvn

RUN apk add --update curl git && \
    cd /tmp && \
    curl -o apache-maven-$MAVEN_VERSION-bin.tar.gz http://ftp.unicamp.br/pub/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    tar -zxvf "apache-maven-$MAVEN_VERSION-bin.tar.gz" && \
    mv "apache-maven-$MAVEN_VERSION" "$M2_HOME" && \
    ln -s "$M2_HOME/bin/mvn" /usr/bin/mvn && \
    apk del curl && \
    rm -rf /tmp/* /var/cache/apk/*

CMD ["true"]
