#!/bin/bash

# redirecting logs
mysqld --user=mysql > /var/log/mysql.log 2>&1 &

# wait for mysql server to start
while ! mysqladmin ping --silent > /dev/null 2>&1; do
    sleep 1
done

DB_NAME="mydatabase"
DB_USER="myuser"
DB_PASSWORD="mypassword"
DB_HOST="localhost"

# setup database for the queries to execute
SETUP_DATABASE_COMMANDS="
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'$DB_HOST';
FLUSH PRIVILEGES;"

mysql -e "$SETUP_DATABASE_COMMANDS"

# store the contents of testcase in the variable
TESTCASE=$(cat)
SOURCE=$(<script.sql)

DB_NAME=$DB_NAME DB_USER=$DB_USER DB_PASSWORD=$DB_PASSWORD DB_HOST=$DB_HOST node /bin/pre-run/index.js "$TESTCASE" "$SOURCE"

# shutdown mysql server
# if we do not do this, then docker container will keep on running in the background
mysqladmin shutdown
