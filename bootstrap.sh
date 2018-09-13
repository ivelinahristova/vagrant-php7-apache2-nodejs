#!/usr/bin/env bash

apt-get update

# Adding base packages
apt-get -y install software-properties-common python-software-properties

# Adding PHP repository
add-apt-repository ppa:ondrej/php

# Repo update and package upgrade
apt-get -y update
apt-get -y upgrade

apt-get install -y php7.2

apt-get install apache2

echo -e "\n--- Installing PHP-specific packages ---\n"
sudo apt-get install -y --force-yes php7.2-xdebug php7.2-memcached php7.2-pgsql php7.2-common php7.2-dev php7.2-json php7.2-opcache php7.2-cli libapache2-mod-php7.2 php7.2 php7.2-mysql php7.2-fpm php7.2-curl php7.2-gd php7.2-mcrypt php7.2-mbstring php7.2-bcmath php7.2-zip
echo -e "\n--- Installed PHP packages ---\n"
php -m

sudo apt-get -y --force-yes install php-pear

echo -e "\n--- Installing Git ---\n"
sudo apt-get install -y --force-yes git unzip
echo -e "\n--- Installing Git Finish ---\n"
echo -e "\n--- Git Path: ---\n"
sudo which git

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
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

echo -e "\n--- Installing Composer ---\n"
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php

php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer

# Xdebug configuration
for f in /etc/php/7.2/mods-available/xdebug.ini
do
  echo "xdebug.remote_enable=true" >> $f
  echo "xdebug.remote_connect_back=true" >> $f
  echo "xdebug.idekey=MY_AWESOME_KEY" >> $f
done


if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant /var/www/html
fi

sudo service apache2 restart