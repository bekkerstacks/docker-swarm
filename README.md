# docker-swarm
Deploys a Docker Swarm in Docker

## Usage

Deploy a Swarm:

```
$ bash deploy.sh
```

List the Nodes:

```
$ docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
lkyjkvuc5uobzgps4m7e98l0u *   docker-desktop      Ready               Active              Leader              19.03.1
6djgz804emj89rs8icd53wfgn     worker-1            Ready               Active                                  18.06.3-ce
gcz6ou0s5p8kxve63ihnky7ai     worker-2            Ready               Active                                  18.06.3-ce
ll8zfvuaek8q4x9nlijib0dfa     worker-3            Ready               Active                                  18.06.3-ce
```
