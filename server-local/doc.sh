# install MySQL Server using docker, Docker Server 20.10.20, image: ubuntu/mysql:tag
$ docker run -d --name mysql-container -e TZ=UTC -p 30306:3306 -e MYSQL_ROOT_PASSWORD=password ubuntu/mysql:8.0-22.04_beta
# check port :.30306
$ netstat -an | grep LISTEN
# Note: you can connect only using MySQLWorkbench
ConnectionName: "myserver"
HostName: "localhost"
Port: "30306"
UserName: "root"
Password: "password"
# create schema and tables
copy all content of gdlsr.sql and paste to MySQLWorkbench script
run query
