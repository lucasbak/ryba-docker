#!/bin/bash

# waiting for mariadb to be available
/bin/bash

supervisord -c /etc/supervisord.conf -n
