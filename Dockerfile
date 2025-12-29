FROM tomcat:10.1-jdk17
COPY target/java-app.war /usr/local/tomcat/webapps/java-app.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

