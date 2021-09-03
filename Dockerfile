# Pull base image 
From tomcat:8 

# Maintainer 
MAINTAINER "kojibello058@gmail.com" 
COPY ./webapp/target/webapp.* /usr/local/tomcat/webapps

