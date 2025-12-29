FROM tomcat:10.1
COPY target/java-app.war /usr/local/tomcat/webapps/
EXPOSE 8080

