# Ansible Installation
1. Prerequisites: Python to be installed.Check:```python --version```.If Not installed execute the command ``` yum install python```
2. Check if pip is installed.Check : ``` pip -V ```. If not installed , execute ``` yum install pip ```.
3. Install Ansible.```pip install ansible```.Check: ```ansible --version```

### Integration with docker server
1. Create a user in ansible server and docker server ``` useradd ansibleadmin ``` and give password.
2. open and edit the visudo file and give ansibleadmin sudo permissions by editing the file as mentioned below in both the servers.
```
root    ALL=(ALL)       ALL
ansibleadmin   ALL=(ALL)       NOPASSWD: ALL
```
3. Enable password less authentication. Login to the ansible server with ```ansbileadmin``` user and give password from outside. You should be able to login.
4. On the ```ansibleadmin``` home directory , create ssh keys ```ssh-keygen``` and copy the public key ``` ssh-copy-id <private-ip> ```
5. You should be able to login from ansible to docker without password.

### Add docker host to ansible to perform commands from ansible server .
1. Create /etc/ansible/hosts file in ansible server.
2. Add docker-public-ip in that file.
Some of the commands
```
ansible all -m ping
ansible all -a uptime
ansible-playbook webapp.yml --check
ansible-playbook webapp.yml
ansible-playbook webapp.yml --limit ip-addr
```
### Integrate Jenkins with Ansible
1. Under manage jenkins , go to configure system .under ssh servers , add  ansible server.
2. Give ansibleadmin username with password and ip address. Test connection.
3. This ansible server dislays under publish over ssh option when you configure the job similar to docker jenkins job.

### After loading the artifacts to the ansible server , install docker and run container in it.
1. Login root and Install docker ``` yum install docker -y ```
2. Add ``` ansibleadmin``` user to docker group ```usermod -aG docker ansibleadm```. Check it: ```id ansibleadm ```
3. Try running docker commands as ansibleadmin user. If having any permission issues , fix it by giving permissions 
``` sudo chmod  777 /var/run/docker.sock ```. It will work now. 
4. Try to create docker file and copy the webapp into dockerfile.


Enter "ansible -m ping 34.207.126.103" when you get below error
```
ECDSA key fingerprint is SHA256:Midh1vnGikrz4AAgI4fYJO7rhyTcDJveRcNYm5etjIc.
ECDSA key fingerprint is MD5:19:59:a1:73:54:77:5d:d3:2a:91:93:13:28:7e:1d:53.
Are you sure you want to continue connecting (yes/no)? The authenticity of host '35.174.109.75 (35.174.109.75)' can't be established.
ECDSA key fingerprint is SHA256:jbUgo4h2Yzl+gdLr+cFfHIjNQ8Y3dFEtH5Ckc5Bve0c.
ECDSA key fingerprint is MD5:b3:5c:32:ad:90:45:f5:5d:ba:ed:05:8f:ce:a6:3c:58.
Are you sure you want to continue connecting (yes/no)? yes
```
