FROM java
FROM maven:latest
RUN echo $(pwd)
#RUN ls $(pwd)
RUN mkdir $(pwd)/project
COPY . $(pwd)/project
RUN ls $(pwd)/project
RUN  mvn clean install
RUN ls $(pwd)
RUN curl -O http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz
RUN tar xzf apache-tomcat-7.0.55.tar.gz
#COPY . apache-tomcat-7.0.55/
#RUN mvn clean install
ADD $(pwd):/project/target/*.war apache-tomcat-7.0.55/webapps/
CMD apache-tomcat-7.0.55/bin/startup.sh && tail -f apache-tomcat-7.0.55/logs/catalina.out
EXPOSE 8080
