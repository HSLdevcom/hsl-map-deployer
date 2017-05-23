HSL Map Deployer
====================

Reverse proxy and deployer for `hsl-map` and `jore-graphql` repositories.

### Prerequisites

Install `docker` and `docker-compose` 1.10.0+

Set `FONTSTACK_PASSWORD` environment variable

### Run

Start all services:

```
docker-compose up
```

Rebuild and restart a service:

```
docker-compose up --build publisher
```

