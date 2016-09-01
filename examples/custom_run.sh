#!/bin/bash
docker run --net=host --name ryba --rm \
-v /custom_entrypoint.sh:/ryba/entrypoint.sh \
ryba/ryba-docker:1.0 "$@"
