#!/bin/bash
set -e

echo Launching importer
docker-compose up jore-graphql-import
echo Launching geometry matcher
docker-compose up jore-geometry-matcher
echo Remove old containers
docker-compose rm -f jore-graphql-import
docker-compose rm -f jore-geometry-matcher

echo Success