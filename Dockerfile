FROM java
FROM maven:latest
RUN echo $(pwd)
COPY . $(pwd):/project
RUN -v $(pwd):/project -w /project mvn clean install
RUN curl -O http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz
RUN tar xzf apache-tomcat-7.0.55.tar.gz
#COPY . apache-tomcat-7.0.55/
#RUN mvn clean install
ADD $(pwd):/project/target/*.war apache-tomcat-7.0.55/webapps/
CMD apache-tomcat-7.0.55/bin/startup.sh && tail -f apache-tomcat-7.0.55/logs/catalina.out
EXPOSE 8080
