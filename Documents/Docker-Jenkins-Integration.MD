1. Create dockeradmin user
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
