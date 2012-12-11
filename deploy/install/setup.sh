cd ~

# DNS settings
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf

apt-get -y update
apt-get -y upgrade

apt-get -y install python-pip
apt-get -y install git-core
apt-get -y install python-dev
apt-get -y install build-essential
apt-get -y install libxml2-dev
apt-get -y install libxslt-dev

# install mysql server with default password 'root'
echo 'mysql-server-5.1 mysql-server/root_password password root' | debconf-set-selections
echo 'mysql-server-5.1 mysql-server/root_password_again password root' | debconf-set-selections
apt-get -y install mysql-server

apt-get -y install libmysqlclient-dev
apt-get -y install mysql-client
apt-get -y install apache2
apt-get -y install libapache2-mod-wsgi
apt-get -y install tcl8.4

# create tiler place database
echo "CREATE DATABASE tilerplace default character set utf8;" > tmp.sql
mysql -u root -p'root' < tmp.sql
rm tmp.sql

apt-get -y install libjpeg8-dev
apt-get -y install zlib1g-dev
apt-get -y install libfreetype6-dev
apt-get -y install liblcms1-dev
ln -s /usr/lib/x86_64-linux-gnu/libfreetype.so /usr/lib/
ln -s /usr/lib/x86_64-linux-gnu/libz.so /usr/lib/
ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib/
ln -s /usr/lib/x86_64-linux-gnu/liblcms.so /usr/lib/

wget http://www.unixwiz.net/tools/lockrun.c
gcc lockrun.c -o lockrun
mv ./lockrun /usr/local/bin/
rm lockrun.c

reboot
