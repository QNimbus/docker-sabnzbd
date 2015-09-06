FROM qnimbus/docker-base:0.1
MAINTAINER B. van Wetten <bas@vwn.io>

#########################################
##         RUN INSTALL SCRIPT          ##
#########################################
ADD install.sh /tmp/
RUN chmod +x /tmp/install.sh && /tmp/install.sh

#########################################
##                 CLEANUP             ##
#########################################

# Clean up APT when done.
RUN apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

#########################################
##         EXPORTS AND VOLUMES         ##
#########################################

VOLUME ["/config","/data"]

EXPOSE 8080 9090

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
