https://docs.docker.com/engine/install/linux-postinstall/
Pre. Add user to the docker group
```bash
sudo usermod -aG docker $USER
```
0. Start docker daemon
```bash
sudo systemctl is-active docker
sudo systemctl start docker
sudo systemctl is-active docker || sudo systemctl start docker
```
1. Create a docker image
```bash
sudo docker build -t getting-started -f Dockerfile.mojosdk .
# or the below to confirm the docker daemon is active before running the command
sudo systemctl start docker && sudo docker build -t getting-started -f Dockerfile.mojosdk .
```
2. Changing a tag of an image
```bash
docker tag mojo-sdk:latest mojo-sdk:0.6
```
2. Export an image
```bash
docker save -o <image_name>.tar <image_name>:<tag>
```
2. Import the image
```bash
docker load -i <image_name>.tar
```
2. list image names:
```bash
docker images
```
3. Access Container Shell
```bash
docker exec -it <container_name> /bin/bash
```
3. Execute a command inside the container
```bash
docker run --rm my-app-minimal
```

3. Create a docker container
```bash
sudo docker run docker_image
```
4. Rename a container 
```bash
docker rename <container_tag> mojo
```
4. List running containers
```bash
docker ps -a
```
5. Stop a container
```bash
docker stop <container_tag>
```
6. Convert a container to an image
```bash
docker commit <container_tag> image_distribution/image_name:image_tag
```
6. Start a container
```bash
docker container start <container_name>
```
Volumes:
1. Create volume:
```bash
docker volume create <volume_name>
```
2. Run a container with a volume:
```bash
docker run -d -v host_or_docker_volume:docker_volume docker_image
# docker build -t mojo-sdk:r0.6 -f Dockerfile.mojosdk --no-cache .
# docker volume create --opt type=none --opt device=/home/hajsf/Dockers/mojoDocker/Projects --opt o=bind mojoProjects

# docker run -d --publish (or -dp) host_domain_and_port:docker_exposed_port --name docker_container --mount source=<volume_name>,target=<path_in_docker> docker_image:image_tag
```
3. See the volumes at the host machine:
```bash
sudo -i
cd /var/lib/docker/volumes/
```
3. Export volume
```bash
docker run --rm -v <volume_name>:/data -v /tmp:/backup alpine tar -czvf /backup/<volume_name>.tar.gz /data
```
3. Import volume
```bash
docker run --rm -v <volume_name>:/data -v /tmp:/backup alpine tar -xzvf /backup/<volume_name>.tar.gz -C /
```
4.Stop the Container:

```bash
docker container stop mojo-sdk
```
5. Remove the Container (while keeping its data):

```bash
docker container rm -v mojo-sdk
```



Docker Garbage Collector:
```bash
docker system df -v
```
1. Disk Usage by Docker:
To view disk usage by Docker:
```bash
docker system df
```
2. Docker Image Sizes:
To list all Docker images and their respective sizes:
```bash
docker images -a
```
3. Docker Container Sizes:
To display the size of running containers:
```bash
docker ps -s
```
4. Docker Volume Sizes:
To list Docker volumes and their sizes:
```bash
docker volume ls -q | xargs docker volume inspect --format '{{ .Name }}: {{ .Mountpoint }}'
```

Clean up all
```bash
docker system prune -a
```

Stopping and Removing Containers
1. Stop all running containers:
```bash
docker stop $(docker ps -aq)
```
2. Remove all stopped containers:
```bash
docker container prune -a
// or
docker rm $(docker ps -aq)
```
3. Remove specific container
```bash
docker container rm <container_id>
```

Removing Images
1. Remove specific image
```bash
$ docker image remove <IMAGE_ID>
```
1. Remove dangling (unused) images:
```bash
docker image prune -a
```

2. Remove all images (Use with caution, as this will delete all your local Docker images):
```bash
docker rmi $(docker images -aq)
```

3. Remove all images without a tag
```bash
docker rmi $(docker images -f "dangling=true" -q)
```

Cleaning Volumes
1. Remove unused volumes:
```bash
docker volume prune -a
```

Clearing Cache and Temporary Files
1. Clear all unused data (including containers, networks, volumes, and images not referenced by any container):
```bash
docker system prune -a
```

MNetworks Cleanup
1. Remove all networks:
```bash
docker network prune -a
```



