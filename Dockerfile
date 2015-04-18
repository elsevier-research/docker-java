#
# Oracle JDK 7 image
#

FROM 1science/alpine:3.1
MAINTAINER 1science Devops Team <devops@1science.org>

# Java Version
ENV JAVA_VERSION 7
ENV JAVA_UPDATE  80
ENV JAVA_BUILD   15
ENV JAVA_PACKAGE jdk   

# Install Glibc and Oracle JDK 7
RUN apk add --update wget ca-certificates && \
    cd /tmp && \
    wget "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" && \
    apk add --allow-untrusted glibc-2.21-r2.apk && \
    wget "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk" && \
    apk add --allow-untrusted glibc-bin-2.21-r2.apk && \
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" && \
    tar xzf "${JAVA_PACKAGE}-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" && \
    mkdir -p /usr/lib/jvm && \
    mv "/tmp/jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle" && \
    ln -s "java-${JAVA_VERSION}-oracle" /usr/lib/jvm/default-jvm && \
    ln -s /usr/lib/jvm/default-jvm/bin/java /usr/bin/java && \
    ln -s /usr/lib/jvm/default-jvm/bin/javac /usr/bin/javac && \
    apk del wget ca-certificates && \
    rm -f /tmp/* /var/cache/apk/* && \
    rm -rf /usr/lib/jvm/default-jvm/*src.zip \
           /usr/lib/jvm/default-jvm/lib/missioncontrol \
           /usr/lib/jvm/default-jvm/lib/visualvm \
           /usr/lib/jvm/default-jvm/lib/*javafx* \
           /usr/lib/jvm/default-jvm/jre/lib/plugin.jar \
           /usr/lib/jvm/default-jvm/jre/lib/ext/jfxrt.jar \
           /usr/lib/jvm/default-jvm/jre/bin/javaws \
           /usr/lib/jvm/default-jvm/jre/lib/javaws.jar \
           /usr/lib/jvm/default-jvm/jre/lib/desktop \
           /usr/lib/jvm/default-jvm/jre/plugin \
           /usr/lib/jvm/default-jvm/jre/lib/deploy* \
           /usr/lib/jvm/default-jvm/jre/lib/*javafx* \
           /usr/lib/jvm/default-jvm/jre/lib/*jfx* \
           /usr/lib/jvm/default-jvm/jre/lib/amd64/libdecora_sse.so \
           /usr/lib/jvm/default-jvm/jre/lib/amd64/libprism_*.so \
           /usr/lib/jvm/default-jvm/jre/lib/amd64/libfxplugins.so \
           /usr/lib/jvm/default-jvm/jre/lib/amd64/libglass.so \
           /usr/lib/jvm/default-jvm/jre/lib/amd64/libgstreamer-lite.so \
           /usr/lib/jvm/default-jvm/jre/lib/amd64/libjavafx*.so \
           /usr/lib/jvm/default-jvm/jre/lib/amd64/libjfx*.so

# Set build history
RUN echo -ne "- with `java -version 2>&1 | awk 'NR == 2'`\n" >> /root/.built           