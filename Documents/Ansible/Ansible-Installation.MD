# Ansible Installation
1. Prerequisites: Python to be installed.Check:```python --version```.If Not installed execute the command ``` yum install python```
2. Check if pip is installed.Check : ``` pip -V ```. If not installed , execute ``` yum install pip ```.
3. Install Ansible.```pip install ansible```.Check: ```ansible -version```

### Integration with jenkins
1. Create a user in ansible server ``` useradd ansibleadmin ``` and give password.
2. open visudo file and give ansibleadmin sudo permissions by editing the file as mentioned below.
```
root    ALL=(ALL)       ALL
ansibleadm   ALL=(ALL)       NOPASSWD: ALL
```
3. Login to the same server with ```ansbileadmin``` user and give password. On the ```ansibleadmin``` home directory , create ssh keys ```ssh-keygen```

### Add docker host to ansible to perform commands from ansible server .