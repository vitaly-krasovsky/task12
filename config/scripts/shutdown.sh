#!/bin/bash

sudo $INSTALL_PATH/httpd-2.2.9/bin/apachectl -k stop
$INSTALL_PATH/apache-tomcat-7.0.68/bin/shutdown.sh

sudo rm -r $INSTALL_PATH/apache-tomcat-7.0.68
sudo rm -r $INSTALL_PATH/httpd-2.2.9
sudo rm -r $INSTALL_PATH/httpd-2.2.9-src