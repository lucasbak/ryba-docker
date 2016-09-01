#!/bin/bash
# The project use an entrypoint.sh file to let user write custom actions before
# running any ryba command

# Default command is /ryba/ryba-cluster/bin/ryba

#Special Command to execute before running ryba

/ryba/ryba-cluster/bin/ryba $@
