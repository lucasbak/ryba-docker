# RYBA DOCKER

This project aims at helping administrators to use [Ryba][ryba-site] in any 
environment by using docker.

# Set up

Build the container, set your cluster configuration and that's it !!! 

## Build

Simply run the following command to build the container
```bash
docker build  -t ryba/ryba-docker:1.0 .
```
N.B.-1: It assumes you use docker native. For adminsitrators using docker-machine
initiate environment first by running
 - on docker-machine
 ```bash
  eval "$(docker-machine env my_machine)"
 ```
 N.B.-2: For boot2docker instructions refer to doc, you should use docker-machine
instead.

## Ryba Users

### Set up Cluster configuration
The `CONFIG_PATH` environment variable must be set your cluster configuration path.
You can set it on your profile file, or you can set it manually in the run-env.sh file.
Open the run.sh file and replace the value of `CONFIG_PATH` to your ryba-cluster
project.

Your ryba-cluster  config's layout should match [ryba-cluster][ryba-cluster-site] one.
i.e. have at least `conf` folder. Checkout the [ryba-cluster example][ryba-cluster-site]

### Launch a command
Now that your configuration is ready you can use ryba right now.
```bash
cd /my/local/path/ryba-docker
bin/ryba install 
```

## Ryba Developers

### Components
You can also use ryba-docker to test the integration of your new ryba component.
For this, add the new component (ie. /my/computer/ryba/new_component)
inside the `components` file. One line per component you want to integrate.

### Operations

You can override the command executed by the file ryba in the `bin` folder.
For this you can set the `CUSTOM_RUN_FILE` environment variable. 
```bash
  export CUSTOM_RUN_FILE=/Users/ryba/ryba-docker/examples/custom_run.sh
  bin/ryba install
```
A use case might be to overwrite the entrypoint.sh file if you need to execute 
some specials command inside the container before running ryba.
Checkout [the example][ryba-docker-site-example].

[ryba-site]:(https://github.com/ryba-io/ryba)
[ryba-cluster-site]: (https://github.com/ryba-io/ryba-cluster)
[ryba-docker-site]: (https://github.com/lucasbak/ryba-docker)
[ryba-docker-site-example]: (https://github.com/lucasbak/ryba-docker/examples)
