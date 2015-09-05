#!/usr/bin/env bash

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Configure user nobody to match unRAID's settings
export DEBIAN_FRONTEND="noninteractive"

add-apt-repository -y ppa:jcfp/ppa
apt-get update -q
apt-get install -qy --force-yes	sabnzbdplus \
			        sabnzbdplus-theme-classic \
			        sabnzbdplus-theme-mobile \
			        sabnzbdplus-theme-plush \
			        par2 \
			        python-yenc \
			        unzip \
			        unrar

# Disable SSH
rm -rf /etc/service/sshd /etc/service/cron /etc/service/syslog-ng /etc/my_init.d/00_regen_ssh_host_keys.sh

#########################################
##                 CLEANUP             ##
#########################################

# Clean APT install files
apt-get -qy autoremove
apt-get clean -qy

rm -rf /var/lib/apt/lists/* /var/cache/* /var/tmp/*
