#!/bin/bash
set -e

echo Will run instance 1 and 2

echo Stopping instance 1 dependencies

docker-compose stop jore-graphql
docker-compose rm -f jore-graphql
docker-compose stop jore-tileserver
docker-compose rm -f jore-tileserver

echo Running instance 1 import

./run-import.sh 1

echo Startint instance 1 dependencies

docker-compose up -d jore-graphql
docker-compose up -d jore-tileserver

echo Done with instance 1

echo Sleeping for 35 minutes

sleep 35m

echo Stopping instance 3 dependencies

docker-compose stop jore-graphql-i2
docker-compose rm -f jore-graphql-i2
docker-compose stop jore-tileserver-i2
docker-compose rm -f jore-tileserver-i2

echo Running instance 2

./run-import.sh 2

echo Startint instance 2 dependencies

docker-compose up -d jore-graphql-i2
docker-compose up -d jore-tileserver-i2

echo Done with instance 2
echo Exiting