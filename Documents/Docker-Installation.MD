# Installing Docker in amazon ec2
```
1. yum install docker -y
2. service docker status
3. service docker status
```
###Some of the docker commands
```
docker pull <image>
docker ps
docker ps -a 
docker images
docker rmi
docker run -d --name <cont-name> -p (port to run in browser):(port to run the app inside docker) <image-name>
docker exec -it <cont-id/name> bash

```
#### Pulling tomcat image and setting up

1. docker pull tomcat
2. After docker run command you might face error in accessing the application. 
3. login to tomcat container. 
4. copy the contents of webapp.dist to webapps using ``` cp -R * ../webapps```
