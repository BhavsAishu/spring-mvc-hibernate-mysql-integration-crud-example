# this is multi stage 
FROM maven:3-jdk-8-alpine as base 
WORKDIR /app
COPY . . 
RUN mvn clean install -DskipTests
 

FROM tomcat:9
WORKDIR webapps
COPY --from=base /app/target/spring-mvc-hibernate-example.war .
RUN rm -rf ROOT && mv spring-mvc-hibernate-example.war ROOT.war
