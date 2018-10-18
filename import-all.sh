#!/bin/bash
set -e

echo Will run instance 1 and 2

echo Running instance 1

docker-compose stop jore-graphql
docker-compose rm -f jore-graphql
./run-import.sh 1
docker-compose up -d jore-graphql

echo Done with instance 1

echo Sleeping for 20 minutes

sleep 20m

echo Running instance 2

docker-compose stop jore-graphql-i2
docker-compose rm -f jore-graphql-i2
./run-import.sh 2
docker-compose up -d jore-graphql-i2

echo Done with instance 2
echo Exiting