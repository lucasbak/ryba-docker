
# RYBA DOCKER

This project aims at helping administrators to use [Ryba][ryba-site] in any 
environment by using docker.

# Set up

Build the container, set your cluster configuration and that's it !!! 

You can either pull directly the docker container or build the container yourself, if you want last dependencies.

## Pull

```bash
  docker pull lucasbak/ryba-docker
```

## Build

Simply run the following command to build the container

```bash
cd ./lib
docker-compose build
```

You need an internet connection to build the container.

## Ryba Users

### Set up Cluster configuration

Your ryba-cluster  config's layout should match [ryba-env-metal][ryba-env-metal-site] one.
i.e. have at least `conf` folder. Checkout the [ryba-env-metal example][ryba-env-metal-site]

```bash
# Currently in ryba-docker directory
cd ..
git clone https://github.com/ryba-io/ryba-env-metal
cd ryba-env-metal
./bin/vagrant up
cd ../ryba-docker/lib
docker-compose up -d
```

That's it. You now provisioned VM using Vagrant, and can deploy them using Ryba ! 

### Launch a command

Now that your configuration is ready here is how to use ryba:

```bash
cd /path/to/ryba-env-metal
docker exec bin/ryba install
```

## Ryba Developers

### Components

Best way to test your new services is in the ./lib folder of your environment. That's why it is mounted by default.

Mouting additional services or environments can be done trough volumes in the docker-compose.yaml file

[ryba-site]:(https://github.com/ryba-io/ryba)
[ryba-env-metal-site]: (https://github.com/ryba-io/ryba-env-metal)
[ryba-docker-site]: (https://github.com/lucasbak/ryba-docker)
[ryba-docker-site-example]: (https://github.com/lucasbak/ryba-docker/examples)
