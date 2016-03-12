#!/bin/bash

INSTALL_PATH="/home/kras/task12"
M2_PATH="/home/kras/.m2"

mkdir $INSTALL_PATH

cd ../binary/

tar -xvf apache-tomcat-7.0.68.tar.gz -C $INSTALL_PATH
tar -xvf httpd-2.2.9.tar.gz -C $INSTALL_PATH
mv $INSTALL_PATH/httpd-2.2.9 $INSTALL_PATH/httpd-2.2.9-src

binary=$(pwd)

cd $INSTALL_PATH/httpd-2.2.9-src

./configure --prefix=$INSTALL_PATH/httpd-2.2.9

make
make install

cd $binary

cp mod_jk-1.2.31-httpd-2.2.x.so $INSTALL_PATH/httpd-2.2.9/modules/

cd ../httpd/

cp workers.properties $INSTALL_PATH/httpd-2.2.9/conf/
cp mod_jk.conf $INSTALL_PATH/httpd-2.2.9/conf/
cp httpd.conf $INSTALL_PATH/httpd-2.2.9/conf/

cd ../mvn/

cp settings.xml $M2_PATH

cd ../tomcat/

cp tomcat-users.xml $INSTALL_PATH/apache-tomcat-7.0.68/conf/

sudo $INSTALL_PATH/httpd-2.2.9/bin/apachectl -k start
$INSTALL_PATH/apache-tomcat-7.0.68/bin/startup.sh


