FROM maven:3.9-eclipse-temurin-21

ENV TOMCAT_VERSION=10.1.49
ENV CATALINA_HOME=/opt/tomcat

RUN apt-get update && apt-get install -y \
    curl \
    vim \
    tree \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/.m2 && chmod -R 777 /app/.m2
ENV MAVEN_CONFIG=/app/.m2
ENV HOME=/app

RUN curl -fsSL https://archive.apache.org/dist/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    -o /tmp/tomcat.tar.gz \
    && mkdir -p ${CATALINA_HOME} \
    && tar xzf /tmp/tomcat.tar.gz -C ${CATALINA_HOME} --strip-components=1 \
    && rm /tmp/tomcat.tar.gz \
    && rm -rf ${CATALINA_HOME}/webapps/* \
    && chmod -R 777 ${CATALINA_HOME} \
    && chmod +x ${CATALINA_HOME}/bin/*.sh

WORKDIR /app

CMD ["tail", "-f", "/dev/null"]