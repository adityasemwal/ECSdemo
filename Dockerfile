FROM ubuntu:14.04

RUN  apt-get update -y
RUN  apt-get install default-jdk -y
RUN  apt-get install unzip vim -y
RUN  groupadd tomcat
RUN  useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
ADD  http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.39/bin/apache-tomcat-8.5.39.tar.gz /opt/
RUN  mkdir /opt/tomcat/
RUN  sudo tar xvf /opt/apache-tomcat-8.5.39.tar.gz -C /opt/tomcat --strip-components=1
COPY sample.war/ /opt/tomcat/webapps/
CMD  /opt/tomcat/bin/catalina.sh run
