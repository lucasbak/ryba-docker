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

## Run

Open the run.sh file and replace the value of `CONFIG_PATH` to your ryba-cluster
project.
Your ryba-cluster  config's layout should match [ryba-cluster][ryba-cluster-site] one.
i.e. have at least `conf` folder.

## Development Mode

You can also use ryba-docker to test the integration of your new ryba component.
For this in run.sh add the new component path (ie. /my/computer/ryba/new_component)
inside the `components` file. One line per component to test

[ryba-site]:(https://github.com/ryba-io/ryba)
