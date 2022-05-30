# Miscellaneous notes
* You cam probably skip this document if you are not doing development work.



## Commands
Quickref for command copypasta.

Create image from dockerfile:
```
$ sudo ./build-image.sh
```

Create container from image:
```
$ sudo ./init-container.sh
```

Open shell inside container:
```
sudo docker exec -it "$(cat $PWD/grabsite.cid)" "/usr/bin/bash"
```

### Image-related
List images:
```
sudo docker image ls
```
* [docker image ls](https://docs.docker.com/engine/reference/commandline/image_ls/)

Erase image:
```
sudo docker image rm IMAGE_ID_HERE
```
* [docker image rm](https://docs.docker.com/engine/reference/commandline/image_rm/)

### Container-related
List active containers:
```
sudo docker ps
```
* [docker ps](https://docs.docker.com/engine/reference/commandline/ps/)

List all containers:
```
sudo docker ps -a
```
* [docker ps](https://docs.docker.com/engine/reference/commandline/ps/)

List all containers:
```
sudo docker container ls
```
* [docker container ls](https://docs.docker.com/engine/reference/commandline/container_ls/)


Halt container execution:
```
sudo docker container stop CONTAINER_HERE

```
* [docker stop](https://docs.docker.com/engine/reference/commandline/container_stop/)

Destroy container:
```
sudo docker container rm CONTAINER_HERE
```
* [docker container rm](https://docs.docker.com/engine/reference/commandline/container_rm/)



Inspect container's files:
```
$ sudo docker run -ti --entrypoint /bin/bash IMAGE_NAME_HERE
```
```
$ sudo docker run -ti --entrypoint /bin/bash grab-site
```

Run shell inside container:
```
$ sudo docker run -ti --entrypoint /bin/bash IMAGE_NAME_HERE
```
```
$ sudo docker run -ti --entrypoint /bin/bash grab-site
```

## Tips and tricks




## Links
Links / sources / references / reading / etc.


### Grab-site
[archiveteam.grab-site repo](https://github.com/ArchiveTeam/grab-site)

[Script to autopause grab-site when disk space is low](https://github.com/ArchiveTeam/grab-site/blob/master/extra_docs/pause_resume_grab_sites.sh)


### Manpages
[useradd manpage](https://linux.die.net/man/8/useradd)

[groupadd manpage](https://linux.die.net/man/8/groupadd)

[usermod manpage](https://linux.die.net/man/8/usermod)

[git manpage](https://linux.die.net/man/1/git)

[bash manpage](https://linux.die.net/man/1/bash)


### Docker
[docker run](https://docs.docker.com/engine/reference/commandline/run/)

[docker tag](https://docs.docker.com/engine/reference/commandline/tag/)

[docker bind mounts](https://docs.docker.com/engine/reference/commandline/service_create/#add-bind-mounts-volumes-or-memory-filesystems)

[docker exec](https://docs.docker.com/engine/reference/commandline/exec/)

[docker container](https://docs.docker.com/engine/reference/commandline/container/)

[docker comtainer create](https://docs.docker.com/engine/reference/commandline/container_create/)

[docker-compose](https://docs.docker.com/engine/reference/commandline/compose/)

[docker-compose exec](https://docs.docker.com/engine/reference/commandline/compose_exec/)

[Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

[start containers automatically](https://docs.docker.com/config/containers/start-containers-automatically/)

[dockerfile reference](https://docs.docker.com/engine/reference/builder/)

[docker-compose reference](https://docs.docker.com/compose/compose-file/)


### Shell scripting
[bash cheatsheet](https://devhints.io/bash)

[bash hackers wiki](https://wiki.bash-hackers.org/start)

### Relevant / similar projects
[Suika.foolstack-docker](https://github.com/Suika/foolstack-docker)

[Suika.toyase-stack](https://github.com/Suika/toyase-stack)


### MariaDB
[MariaDB official container on dockerhub](https://hub.docker.com/_/mariadb)

[MariaDB Container Cheat Sheet](https://mariadb.com/kb/en/mariadb-container-cheat-sheet/)

[MariaDB.mariadb-docker](https://github.com/MariaDB/mariadb-docker)



## META CLUTTER
Spare symbols depot.

[NAME](URL)

[NAME](URL)

[NAME](URL)