#!/bin/bash
set -e

INSTANCE=${1:-1}

echo Instance is set to $INSTANCE

if [ $INSTANCE = 1 ]; then
    CONNECTION_STRING = postgres://postgres:postgres@jore-postgis:5432/postgres
else
    CONNECTION_STRING = postgres://postgres:postgres@jore-postgis-i2:5432/postgres
fi

echo Postgis connection string is set to $CONNECTION_STRING

echo Launching importer
docker-compose up jore-graphql-import -e PG_CONNECTION_STRING=$CONNECTION_STRING
echo Launching geometry matcher
docker-compose up jore-geometry-matcher -e PG_CONNECTION_STRING=$CONNECTION_STRING
echo Remove old containers
docker-compose rm -f jore-graphql-import
docker-compose rm -f jore-geometry-matcher

echo Instance $INSTANCE was successfully updated!