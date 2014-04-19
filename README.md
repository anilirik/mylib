Деплой-инструкция
=====


1.Ставим JDK7

sudo add-apt-repository ppa:webupd8team/java

sudo apt-get update

sudo apt-get install oracle-java7-installer

sudo apt-get install oracle-java7-set-default

2.Ставим NetBeans
	
https://netbeans.org/downloads/

Во время установки не снимаем галочку для установки Glassfish.

3.Ставим и запускаем MongoDb

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

sudo apt-get update

sudo apt-get install mongodb-org

sudo service mongod start

sudo chkconfig mongod on

(более полная версия с комментариями http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/)

4.Заполняем базу данных книгами с помощью команды

mongo db books.js

5.Открываем NetBeans -> File -> Open Project

6.Нажимаем правой кнопкой на название проекта -> Clean and Build, затем снова нажимаем на проект и выбираем Run
