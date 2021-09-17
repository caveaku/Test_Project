# Pull base image 
From tomcat:8 

# Maintainer 
MAINTAINER "ekabe2y8@gmail.com" 
EXPOSE 8080
COPY /var/lib/jenkins/workspace/Haplet-CI@2/webapp.war /usr/local/tomcat/webapps
