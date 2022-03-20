# MAVEN INTEGRATION

1. Visit maven website  
2. Install maven in /opt of root user  
``` 
wget <maven_url(usually on homepage of maven website)> 
tar -xvzf <apache-maven-*>
```    
3. Setup Environment variables. Open ``` .bash_profile  ``` under root user. Add maven path.
```
# .bash_profile
JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.13.0.8-1.amzn2.0.3.x86_64
MAVEN_HOME=/opt/apache-maven
M2=/opt/apache-maven/bin
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:$JAVA_HOME:$MAVEN_HOME:$M2
```