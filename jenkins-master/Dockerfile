FROM jenkins:1.625.2
MAINTAINER Baptiste Mathus <batmat@batmat.net>

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

ADD seed-job/ /usr/share/jenkins/ref/jobs/_seed-job

COPY add_maven_auto_installer.groovy  /usr/share/jenkins/ref/init.groovy.d/add_maven_auto_installer.groovy

# Install

# Secure instance

# configure Docker to use the swarm cluster
