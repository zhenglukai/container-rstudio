#!/bin/bash

# Name
NAME="rstudio-server"

# CPU options
CPU_SHARES="8"
CPU_SETS="0-$[$CPU_SHARES-1]"
CPU_MEMS="0"
MEM="24g"



# Prepare docker
#docker info
#docker pull ubuntu

# HACK Workaround: needed to get infrastructure stuff outside of docker context to work
#PWD="$(pwd)"
#mkdir -p etc
#alias cp='cp'
#cp -r -f /etc/ldap.conf etc/ldap.conf
#cp -r -f /etc/ldap etc/ldap
#cp -r -f /etc/pam.d etc/pam.d
#cp -r -f /etc/nsswitch.conf etc/nsswitch.conf
#su -c "cp -r -f /etc/nslcd.conf etc/nslcd.conf"
#su -c "chmod 666 etc/nslcd.conf"
#mkdir -p etc/ssl/certs
#cp -r -f /etc/ssl/certs/I* etc/ssl/certs/

# Build docker
docker build --rm=true --cpu-shares=$CPU_SHARES --cpuset-cpus=$CPU_SETS --cpuset-mems=$CPU_MEMS --memory=$MEM --tag=$NAME .
