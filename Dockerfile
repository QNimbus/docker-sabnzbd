FROM qnimbus/docker-base:0.1
MAINTAINER B. van Wetten <bas@vwn.io>

#########################################
##         RUN INSTALL SCRIPT          ##
#########################################
ADD install.sh start.sh / 
RUN chmod +x /install.sh /start.sh && /install.sh && rm -rf /install.sh

#########################################
##         EXPORTS AND VOLUMES         ##
#########################################

VOLUME ["/config","/data"]

EXPOSE 8080 9090

CMD ["/start.sh"] 

#########################################
##                 CLEANUP             ##
#########################################

# Clean up APT when done.
RUN apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

