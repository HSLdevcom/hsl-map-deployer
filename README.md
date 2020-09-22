# HSL Map Deployer
> :warning: **Deprecated as Map project use Docker Swarm and Azure**: Could be updated to run a dev environment

Reverse proxy and deployer for `hsl-map` and `jore-` repositories.

### Prerequisites

Install `docker` and `docker-compose` 1.13.0+

Copy `Gotham Rounded` and `Gotham XNarrow` OpenType fonts to the `fonts` directory

Extract `fontstack.zip` to the `public` directory

Create `postgres` directory

Set FTP_USERNAME and FTP_PASSWORD environment variables using:

export FTP_USERNAME=myusername
export FTP_PASSWORD=mysecretpassword

These values are automatically exported to jore-graphql-import at runtime.

### Run

Start database and import data:

```
docker-compose up -d jore-postgis
./run-import.sh
```

Start services:

```
docker-compose up -d proxy
docker-compose up -d jore-graphql
docker-compose up -d jore-tileserver
docker-compose up -d publisher
docker-compose up -d publisher-ui
docker-compose up -d routemap
docker-compose up -d generator-server
docker-compose up -d generator-ui
docker-compose up -d web-ui
docker-compose up -d site
```

### Update

Deploy latest image:

```
docker-compose pull [service]
docker-compose up -d [service]
```

Import latest data:

```
docker-compose up jore-graphql-import && docker-compose up jore-geometry-matcher
```
