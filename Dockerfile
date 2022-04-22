# get the image of tomcat and run war file
FROM tomcat:8.0-alpine

LABEL maintainer="xero00@github.com"

ADD sample.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
