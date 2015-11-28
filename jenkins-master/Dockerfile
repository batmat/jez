FROM jenkins:1.625.2
MAINTAINER Baptiste Mathus <batmat@batmat.net>

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# Install
# Secure instance

# Create seed job !

# configure Docker to use the swarm cluster (todo : test Nicolas' slave plugin)
