#!/bin/bash
CACHE=$1

docker build "${CACHE}"  -t ryba/ryba-docker:1.0 .
