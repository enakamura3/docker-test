# docker tests

## docker

- some useful commands

### images

```bash
# list images
docker images

# filter not tagged images
docker images -f "dangling=true"

# filter only ids
docker images -q

# delete images
docker rmi [docker-image-id]

# delete not used and not tagged images
docker image prune -f

# delete used to not and not tagged images
docker rmi $(docker images -f "dangling=true")
```

### system

```bash
# delete unused data (images, containers, network)
docker system prune -f

# delete unused data (images, containers, network and volumes)
docker system prune --volumes -f
```

## network

```bash

# list
docker network ls

# create
docker network create -d [drive] [name]

# delete
docker network rm [network-id]
```

## Dockerfile

- default file name: Dockerfile

- some commands:

```bash
# how to run
docker build .

# how to run Dockerfile with different name
docker build -f AnotherDockerFile .

# it can be a path too
docker build -f ./../some-folder/DockerFileMaroto .

# you can tag it too. The result will be a 'kakaroto:latest' image. The version is not mandatory
docker build -f MarotoFile -t maroto .

# you can tag it too. The result will be a 'kakaroto:1.0.0' image
docker build -f MarotoFile -t maroto:1.0.0 .

# docker uses cache by default, so you can force to not use it, and run like the first time
docker build --no-cache -f MarotoFile -t maroto .
```

## docker-compose

- default file name: docker-compose.yml

- some commands:

```bash
# how to run
docker-compose build
docker-compose up
docker-compose up --build

# using another file name
docker-compose -f maroto-compose.yml build

# using another path
docker-compose -f folder/maroto-compose.yml build

# by default the root directory is the directory where the yml file is.
# so if you need to set another directory as hour root directory  
docker-compose -f folder/maroto-compose.yml --project-directory . build

# set another project name. the project name is used in every image and container name.
# by default is the directory name where the yml file is located
docker-compose -f folder/maroto-compose.yml -p maroto --project-directory . build

# docker uses cache to do it too, so if you want to make a fresh image:
docker-compose -f folder/maroto-compose.yml -p maroto --project-directory . build --no-cache

# docker can create intermediate containers to build your image, so if you want to delete it:
docker-compose -f folder/maroto-compose.yml -p maroto --project-directory . build --no-cache --force-rm

# after build, you need to run it. Just replace 'build' for 'up'
docker-compose -f folder/maroto-compose.yml -p maroto --project-directory . up

# docker will create a permanent container, so you need to force to create a new one
docker-compose -f folder/maroto-compose.yml -p maroto --project-directory . up --force-recreate

# if you want to delete de containers, replace the 'up' for 'rm -f'
docker-compose -f folder/maroto-compose.yml -p maroto --project-directory . rm -f
```

I prefer to 'build' first, and then 'up' the compose after
