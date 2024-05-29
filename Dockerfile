FROM tomcat:10.0.27

COPY CoffeeShopp.war /usr/local/tomcat/webapps/CoffeeShopp.war

EXPOSE 8080

CMD ["catalina.sh", "run"]