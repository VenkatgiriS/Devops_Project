1.Create ec2-instance.(Amazon-Linux)
2.sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
3.sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
4.amazon-linux-extras install epel 
5.amazon-linux-extras install java-openjdk11
6.java -version
7.yum install jenkins
8.systemctl status jenkins
9.systemctl start jenkins
10.systemctl status jenkins