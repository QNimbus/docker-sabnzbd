FROM qnimbus/docker-base:latest
MAINTAINER B. van Wetten <bas@vwn.io>

#########################################
##         RUN INSTALL SCRIPT          ##
#########################################
ADD install.sh /tmp/
RUN chmod +x /tmp/install.sh && /tmp/install.sh

#########################################
##                 CLEANUP             ##
#########################################

RUN rm -rf /tmp/*

#########################################
##         EXPORTS AND VOLUMES         ##
#########################################

VOLUME ["/config","/data"]

EXPOSE 8080 9090

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
