# TOMCAT INSTALLATION
## Prerequisites

1. Install Java (amazon-linux-extras install <java-name>)
2. cd /opt
3. Install Tomcat using ```wget and tar -xvzf```under opt folder. (url: apache tomcat website)
4. cd to bin directory of tomcat and run ``` ./startup.sh ``` . Go to browser and check with instance-ip and port.

### Configure manager & host-manager and also add tomcat users in tomcat-users.xml to login.
Disable the code snippet which will allow only inside server machine under context.xml files.
1. /opt/tomcat/webapps/host-manager/META-INF/context.xml  
2. /opt/tomcat/webapps/manager/META-INF/context.xml  
Edit the context.xml files as shown below(adding comments to code)
```
<Context antiResourceLocking="false" privileged="true" >
  <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor"
                   sameSiteCookies="strict" />
<!--  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
  <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String$
</Context>
```
Now , add users in tomcat under tomcat-users.xml file. Below is the sample users snippet.
```
 <role rolename="manager-gui"/>
 <role rolename="manager-script"/>
 <role rolename="manager-jmx"/>
 <role rolename="manager-status"/>
 <user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
 <user username="deployer" password="deployer" roles="manager-script"/>
 <user username="tomcat" password="s3cret" roles="manager-gui"/>
```