#!/bin/bash

PROJECT_REPOSITORY="https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip"
PROJECT_DIRECTORY="linux-site-dio-main"

apt-get update
apt-get upgrade -y
apt-get install apache2 -y
apt-get install unzip -y

cd /tmp
wget "$PROJECT_REPOSITORY"
unzip main.zip
cd "$PROJECT_DIRECTORY"
CP -R * /var/www/html/