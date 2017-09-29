#!/usr/bin/env bash

apt-get update

# Adding base packages
apt-get -y install software-properties-common python-software-properties

# Adding PHP repository
add-apt-repository ppa:ondrej/php

# Repo update and package upgrade
apt-get -y update
apt-get -y upgrade

apt-get install -y php7

apt-get install apache2

echo -e "\n--- Installing PHP-specific packages ---\n"
sudo apt-get install -y --force-yes php7.0-common php7.0-dev php7.0-json php7.0-opcache php7.0-cli libapache2-mod-php7.0 php7.0 php7.0-mysql php7.0-fpm php7.0-curl php7.0-gd php7.0-mcrypt php7.0-mbstring php7.0-bcmath php7.0-zip
echo -e "\n--- Installed PHP packages ---\n"
php -m

curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get -y --force-yes install nodejs

echo -e "\n--- Node JS Version: "
nodejs -v
echo -e "\n"
echo -e "\n--- npm Version: "
npm -v
echo -e "\n"

npm install --global gulp-cli
echo -e "\n--- Gulp Version: "
gulp -v

if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant /var/www/html
fi

sudo service apache2 restart