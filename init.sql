-- Create user with access from any host
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'Abc@123456789';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- Create your app database if not exists
CREATE DATABASE IF NOT EXISTS makemytripfinal;
