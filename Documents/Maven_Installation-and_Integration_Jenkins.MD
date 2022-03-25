# MAVEN INTEGRATION

1. Visit maven website  
2. Install maven in /opt of root user  
``` 
wget <maven_url(usually on homepage of maven website)> 
tar -xvzf <apache-maven-*>
```    
3. Setup Environment variables. Open ``` .bash_profile  ``` under root user. Add maven path and java path.Added below for your reference.
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
Give source .bash_profile   
4. Add java and maven in jenkins under global tool configuration.
   Under JDK Installation add java path. I have added my path.   
   Check the path by using find command. 
   
   ```
   find / -name java-11-*
   /usr/lib/jvm/java-11-openjdk-11.0.13.0.8-1.amzn2.0.3.x86_64
   ```
   For maven , 
   ``` /opt/apache-maven ```

   ###Maven Lifecycles
   Refer the url:https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html

   
