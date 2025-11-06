#!/bin/bash
# Run the original start script
/home/debian/splice-node/docker-compose/validator/start.sh "$@"

# Wait for Docker to finish creating networks
sleep 2

# Fix iptables rule order
/home/debian/splice-node/docker-compose/validator/fix-docker-snat.sh
