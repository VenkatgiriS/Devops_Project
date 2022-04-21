1.Create ec2-instance.(Amazon-Linux)  

Add Jenkins repository from redhat   
2. ```sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo```  

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
    
#### Access Jenkins at  
```<host-ip>:8080``` in any browser

#### Go to ``` /var/lib/jenkins/secrets/initialAdminPassword ``` and access the initial password. Enter it and download suggested plugins.

# Jenkins Crumb Issue  
Important:Make sure to enable proxy for compatibility under crumb issuer.
### 1st Way(If it doesn't work go for second)  
0. Stop the jenkins
1. cd /var/lib/jenkins  
2. nano config.xml  
3. edit the code in the below manner
```
<useSecurity>false</useSecurity>
  <!--<authorizationStrategy class="hudson.security.FullControlOnceLoggedInAuthorizationStrategy">
    <denyAnonymousReadAccess>true</denyAnonymousReadAccess>
  </authorizationStrategy>
  <securityRealm class="hudson.security.HudsonPrivateSecurityRealm">-->
```
4. Start the jenkins again and check  

### 2nd Way  
curl -v -X GET http://52.91.163.88:8080/crumbIssuer/api/json --user admin:admin

curl -X POST http://52.91.163.88:8080/configureTools/ --user admin:admin -H 'Jenkins-Crumb: fd782d8ae6168ccf4ff775a581eb336d36a2d00a829849011fa24abf7072aa86'