FROM phusion/baseimage:0.9.17
MAINTAINER bas@vwn.io

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN add-apt-repository -y ppa:jcfp/ppa \
	&& \
    apt-get -q update \
	&& \
    apt-get install -qy --force-yes \
	sabnzbdplus \
	sabnzbdplus-theme-classic \
	sabnzbdplus-theme-mobile \
	sabnzbdplus-theme-plush \
	par2 \
	python-yenc \
	unzip \
	unrar \
	&& \
    apt-get -y autoremove

VOLUME ["/config","/data"]

EXPOSE 8080 9090

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
