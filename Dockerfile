FROM java

FROM maven:latest as build
WORKDIR /test
COPY . /test
RUN  mvn clean install
RUN curl -O http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz
RUN tar xzf apache-tomcat-7.0.55.tar.gz
WORKDIR /test
RUN ls /test/target/
COPY --from=build /test/target/TestRestDeploy.war apache-tomcat-7.0.55/webapps/
CMD apache-tomcat-7.0.55/bin/startup.sh --privileged=true && tail -f apache-tomcat-7.0.55/logs/catalina.out
EXPOSE 8080
