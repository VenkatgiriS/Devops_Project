FROM tomcat
RUN mv /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/
COPY ./webapp.war /usr/local/tomcat/webapps/