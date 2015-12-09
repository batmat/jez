#!/bin/bash

NODECOUNT=2

SWARM_DISCOVERY="token://$(docker run --rm swarm create)"
echo "token => '$SWARM_DISCOVERY'"


if [[ "$1" = "do" ]]; then
  DRIVER="--driver digitalocean --digitalocean-access-token="$(cat ~/.docker/digitaloceantoken)

  #export DIGITALOCEAN_SIZE=64gb

elif [[ "$1" = "ovh" ]]; then
  DRIVER="--driver openstack"
  #OS_FLAVOR_NAME=eg-15
  export OS_FLAVOR_NAME=vps-ssd-1
  export OS_IMAGE_NAME="Ubuntu 14.04"
  export OS_NETWORK_NAME=Ext-Net
  export OS_SSH_USER="admin"

elif [[ "$1" == "vb" ]]; then
  DRIVER="--driver virtualbox"
else
  echo "Driver not specified"
  exit 1
fi

echo "Using driver: $DRIVER"

echo "Creating master"
docker-machine create \
            $DRIVER \
            --swarm \
            --swarm-master \
            --swarm-strategy "binpack" \
            --swarm-discovery "$SWARM_DISCOVERY" \
          swarm-master

echo "Creating nodes ($NODECOUNT)"

for nodeNumber in $(seq -w 1 $NODECOUNT)
  do
    echo -e "\tNode $nodeNumber"
    docker-machine create \
            $DRIVER \
            --swarm \
            --swarm-discovery "$SWARM_DISCOVERY" \
          swarm-node-$nodeNumber
  done
