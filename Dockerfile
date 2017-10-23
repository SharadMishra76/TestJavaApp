FROM java
FROM maven:latest
COPY . /
RUN mvn clean install
RUN curl -O http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz
RUN tar xzf apache-tomcat-7.0.55.tar.gz
ADD ./target/TestRestDeploy.war apache-tomcat-7.0.55/webapps/
CMD apache-tomcat-7.0.55/bin/startup.sh && tail -f apache-tomcat-7.0.55/logs/catalina.out
EXPOSE 8080
