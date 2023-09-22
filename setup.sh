#!/bin/bash

echo "**************************************"
echo "Setup Nginx & CodeIgniter Docker Image"
echo "**************************************"

echo "Enter Project name (e.g. ounchcms):"
read project_name
echo "Enter Port (e.g. 8080):"
read project_port
echo "Enter MySQL Host (e.g. localhost / host.docker.internal)"
read mysql_host
echo "Enter MySQL Database:"
read mysql_database
echo "Enter MySQL User:"
read mysql_user
echo "Enter MySQL User Password:"
read mysql_user_password
echo "Enter MySQL server port (e.g. 9906):"
read mysql_port

echo "Creating Project .env file"
cat <<EOF > .env
PROJECT_NAME=$project_name
PROJECT_PORT=$project_port
EOF

echo "Creating CI .env file"
cp -f ./app/env ./app/.env

if [[ ! -z "$mysql_host" ]]; then
    sed -i "" "s/database.default.hostname = .*/database.default.hostname = $mysql_host/" ./app/.env
fi
if [[ ! -z "$mysql_user" ]]; then
    sed -i "" "s/database.default.username = .*/database.default.username = $mysql_user/" ./app/.env
fi
if [[ ! -z "$mysql_user_password" ]]; then
    sed -i "" "s/database.default.password = .*/database.default.password = $mysql_user_password/" ./app/.env
fi
if [[ ! -z "$mysql_database" ]]; then
    sed -i "" "s/database.default.database = .*/database.default.database = $mysql_database/" ./app/.env
fi
if [[ ! -z "$mysql_database" ]]; then
    sed -i "" "s/database.default.DBDriver = .*/database.default.DBDriver = MySQLi/" ./app/.env
fi
if [[ ! -z "$mysql_port" ]]; then
    sed -i "" "s/database.default.port = .*/database.default.port = $mysql_port/" ./app/.env
fi    

echo "Building Docker Image"
make build

