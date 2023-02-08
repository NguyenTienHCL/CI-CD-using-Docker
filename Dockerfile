FROM tomcat:latest

LABEL maintainer="Tien"

ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

EXPOSE 8888

CMD ["catalina.sh", "run"]
