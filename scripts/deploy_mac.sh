#!/bin/bash

SWARM_ENABLED=true
DOCKER_VERSION=18.06.3-ce-dind
NUM_WORKERS=3

# check if docker exists
if [ $(which docker) ] 
  then 
    echo "docker installed"
  else 
    echo "install docker: https://docs.docker.com/install/"
    exit 1
fi

# initialize swarm
if [ ${SWARM_ENABLED} == "false" ]
  then
    docker swarm init
fi

SWARM_TOKEN=$(docker swarm join-token -q worker)
echo $SWARM_TOKEN

SWARM_MASTER_IP=$(docker info | grep -w 'Node Address' | awk '{print $3}')
echo $SWARM_MASTER_IP

# boot workers and join them to the swarm
for i in $(seq "${NUM_WORKERS}"); do
	docker run -d --privileged --name worker-${i} --hostname=worker-${i} -p ${i}2375:2375 docker:${DOCKER_VERSION}
	docker --host=localhost:${i}2375 swarm join --token ${SWARM_TOKEN} ${SWARM_MASTER_IP}:2377
done

# show nodes:
docker node ls
