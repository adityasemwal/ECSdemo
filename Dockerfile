FROM ubuntu:14.04

RUN  apt-get update -y
RUN  apt-get install default-jdk -y
RUN  apt-get install unzip vim -y
RUN  groupadd tomcat
RUN  useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
ADD  http://apache.mirrors.ionfish.org/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz /opt/
RUN  mkdir /opt/tomcat/
RUN  sudo tar xvf /opt/apache-tomcat-9.0.30.tar.gz -C /opt/tomcat --strip-components=1
COPY sample.war/ /opt/tomcat/webapps/
CMD  /opt/tomcat/bin/catalina.sh run
