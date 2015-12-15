#!/bin/bash

if [[ -z "$2" ]]
then
  OS_FLAVOR_NAME=eg-15
else
  OS_FLAVOR_NAME=$2
fi
export OS_FLAVOR_NAME

set -eou pipefail

echo "Provisioning new swarm node ''$1' with flavour '$OS_FLAVOR_NAME'"

export OS_IMAGE_NAME="Ubuntu 14.04"
source $HOME/.docker/openrc.sh
export OS_NETWORK_NAME=Ext-Net
export OS_SSH_USER="admin"

export SWARM_DISCOVERY="$3"

docker-machine create \
            -d openstack \
            --swarm \
            --swarm-discovery "$SWARM_DISCOVERY" \
          $1
