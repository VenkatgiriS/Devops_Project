# Installing Docker in amazon ec2
```
1. yum install docker -y
2. service docker status
3. service docker start
```
### Some of the docker commands
```
docker pull <image>
docker ps
docker ps -a 
docker images
docker rmi
docker rm $(docker ps -aq)
docker build -t Imagename:tag <filepath>
docker run -d --name <cont-name> -p (port to run in browser):(port to run the app inside docker) <image-name>
docker stop <cont-id>
docker start <cont-id>
docker tag 646f58a786c7 venkatgiri/mytomcat:1.1
docker push venkatgiri/mytomcat:1.1
docker exec -it <cont-id/name> bash
docker container prune(to delete all the stopped containers)
docker image prune -a (to delete all the unused images)
docker login -u venkatgiri -p venkat877
docker scan <imageName>
docker scan --file Dockerfile docker-scan:e2e
docker volume create my-vol
docker volume rm myvol2
docker system prune
docker system prune -a --volumes
```
#### Pulling tomcat image and setting up

1. docker pull tomcat
2. After docker run command you might face error in accessing the tomcat application. 
3. login to tomcat container. 
4. copy the contents of webapp.dist to webapps using ``` cp -R * ../webapps```

### Error

sudo chmod  777 /var/run/docker.sock


