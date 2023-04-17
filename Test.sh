#!/bin/bash
sudo su -
yum update -y
sudo yum install mysql-server -y
sudo systemctl start mysql.service
amazon-linux-extras install nginx1 -y