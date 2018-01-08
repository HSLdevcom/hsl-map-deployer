HSL Map Deployer
====================

Reverse proxy and deployer for `hsl-map` and `jore-` repositories.

### Prerequisites

Install `docker` and `docker-compose` 1.13.0+

Copy `Gotham Rounded` and `Gotham XNarrow` OpenType fonts to the `fonts` directory

Extract `fontstack.zip` to the `public` directory

### Run

Start database and import data:

```
docker compose up -d jore-postgis
docker-compose up jore-graphql-import
docker compose up jore-geometry-matcher
```

Deploy latest version:

```
docker-compose pull [service]
docker-compose up -d [service]
```
