FROM centos:7

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR ${CATALINA_HOME}
RUN echo nameserver 8.8.8.8 >> /etc/resolv.conf
RUN yum update -y && yum install -y java-1.8.0-openjdk && yum install -y wget && yum install -y git
RUN wget http://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz;
RUN tar -xf apache-tomcat-9.0.71.tar.gz  --strip-components=1;

WORKDIR $CATALINA_HOME/webapps
RUN wget https://tomcat.apache.org/tomcat-8.5-doc/appdev/sample/sample.war --no-check-certificate 

WORKDIR ../openjdk-10/lib
RUN wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.30/mysql-connector-java-8.0.30.jar
WORKDIR /usr/local/tomcat/lib
RUN wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.30/mysql-connector-java-8.0.30.jar

WORKDIR $CATALINA_HOME/webapps/
ADD WebContent/* $CATALINA_HOME/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
