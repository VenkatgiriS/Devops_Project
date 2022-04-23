1. Create dockeradmin user in docker server
   ``` 
   useradd dockeradmin 
   passwd dockeradmin
   ```
2. Add dockeradmin user to docker group
   ``` usermod -aG dockeradmin docker ```
3. In ec2 machines password authentication is generally disabled.Enable it in ```nano /etc/ssh/sshd_config``` and edit ```PasswordAuthentication```.
4. Reload sshd service.```service sshd reload```
5. check password login is working or not.
   ``` ssh dockeradmin@hostname ```
6. Install Publish over ssh plugin in Jenkins.
7. Afer that , goto manage jenkins > configure system > scroll down to bottom and select SSH SERVERS > Add Host details and give hostname public-ip or private-ip if jenkins and docker in same network. Give password and test connection.
-------
9. If we want ssh-key authentication we should generate ssh-key in dockeradmin user profile and add the public key in jenkins.

### Jenkins Job to build and deploy the war file on docker server

1. Create a new job.
2. Give the git directory details.
3. Give maven build options and give pom.xml and clean install command
4. under post build steps , select publish artifacts over ssh option and give the details.
(Source files: After building the artifacts , it will be stored under jenkins workspace/webapps EX:webapp/target/webapp.war)
(Remove Prefix, EX:webapp/target/)

### Docker Permission errors . Follow as below
[ansibleadmin@Docker-Server ~]$ docker build -t jarapp:1.01 .
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/build?buildargs=%7B%7D&cachefrom=%5B%5D&cgroupparent=&cpuperiod=0&cpuquota=0&cpusetcpus=&cpusetmems=&cpushares=0&dockerfile=Dockerfile&labels=%7B%7D&memory=0&memswap=0&networkmode=default&rm=1&shmsize=0&t=jarapp%3A1.01&target=&ulimits=null&version=1": dial unix /var/run/docker.sock: connect: permission denied
[ansibleadmin@Docker-Server ~]$ sudo chmod 666 /var/run/docker.sock
