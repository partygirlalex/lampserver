#!/bin/bash

echo -e "\n\nUpdating Apt Packages and upgrading latest patches\n"
sudo apt-get update -y && sudo apt-get upgrade -y

echo -e "\n\nInstalling Apache2 Web server...\n"
sudo apt-get install apache2 -y

echo -e "Updating apache2.conf...\n" 
sudo chown -R vagrant:vagrant /etc/apache2/apache2.conf
echo -e "ServerName localhost" >> /etc/apache2/apache2.conf

echo -e "Restarting Apache...\n"
sudo systemctl restart apache2

echo -e "Adjusting firewall...\n"
sudo ufw allow in "Apache Full"

echo -e "\n\nInstalling PHP & Requirements\n"
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql -y

echo -e "\n\nPermissions for /var/www/html\n"
sudo chown -R vagrant:vagrant /var/www/html
echo -e "\n\n Delete default index.html\n"
rm /var/www/html/index.html
mv evt.html /var/www/html/index.html

echo -e "\n\nInstalling MySQL\n"
sudo apt-get install mysql-server -y
echo -e "\n\nSecure installation of MySQL\n"
mysql_secure_installation
# Must set root password and choose options for secure MySQL database here!!

echo -e "\n\nRestarting Apache\n"
sudo service apache2 restart

echo -e "\n\nLAMP Installation Completed!\n"

exit 0