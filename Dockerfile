# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "kojibello058@gmail.com" 
COPY ./webapp/target/.war /usr/local/tomcat/webapps

