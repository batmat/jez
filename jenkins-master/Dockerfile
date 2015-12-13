FROM jenkins:1.625.2
MAINTAINER Baptiste Mathus <batmat@batmat.net>

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

ADD seed-job/ /usr/share/jenkins/ref/jobs/_seed-job

#default admin password : override!
ENV ADMIN_PASSWORD adminjenkins

COPY init_scripts/*.groovy  /usr/share/jenkins/ref/init.groovy.d/

# Install

# Secure instance

# configure Docker to use the swarm cluster
