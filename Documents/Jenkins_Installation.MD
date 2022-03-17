1.Create ec2-instance.(Amazon-Linux)  
Add Jenkins repository from redhat   
2. ```sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/ redhat-stable/jenkins.repo```  

3.```sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key```    

4.```amazon-linux-extras install epel```     
5.```amazon-linux-extras install java-openjdk11```      
Checking Java Version to see java is installed properly or not  
6.```java -version```    
Installing Jenkins from yum repository  
7.```yum install jenkins```  
Check Jenkins status  
8.```systemctl status jenkins```    
Start jenkins status  
9.```systemctl start jenkins```  
10.```systemctl status jenkins```    

#### Access Jenkins at  
```<host-ip>:8080``` in any browser