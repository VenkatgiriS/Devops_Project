Create ec2-instance.(Amazon-Linux)
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
amazon-linux-extras install epel 
amazon-linux-extras install java-openjdk11
java -version
yum install jenkins
systemctl status jenkins
systemctl start jenkins
systemctl status jenkins