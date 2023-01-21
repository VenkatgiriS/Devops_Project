## Kubernetes Setup
Official AWS documentation:https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html

1. Pre-requisites:
    ```    
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    ```
   ```Setup aws ec2-instance (serves as management server)
   Install AWSCLI latest version(https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
   check: aws --version
   ```
2. Download kubectl and setup kubectl
   ```
    curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.7/2022-10-31/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    mv ./kubectl /usr/local/bin 
    kubectl version --short --client
    ```
3. Download eksctl and setup
    ```
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin
    eksctl version
    ```
4. Create IAM role and attach it to ec2-instance . This is responsible in permitting the k8's management server for setting up the cluster.
  a.Open IAM page.  
  b.Select roles on the left menu.Click on create role.
  c.Select 'aws service' and ec2 under user case and click next.  
  d.Search and select fullaccesses of 'iam', 'cloudformation' , 'ec2' and give this role name in the next page.  
  e. Go to ec2-instance page and select actions of management server. Select the modify IAMrole under security. Select the role which you have created and attach it to Mgmt-server.
  ##### If you get any errors like access denied , give full administration access to iam role.

### Cluster Creation
```
eksctl create cluster --name cluster-name  \
--region region-name \
--node-type instance-type \
--nodes-min 2 \
--nodes-max 2 \ 
--zones <AZ-1>,<AZ-2>

example:
eksctl create cluster --name kubernetes-Mgmt --region us-east-1 --node-type t2.small --nodes-min 2 --nodes-max 2  --zones us-east-1a,us-east-1b 
```
To see the logs or issues check
```eksctl utils describe-stacks --region=us-east-1 --cluster=k8-Mgmt```
5. Delete Cluster:
   ```eksctl delete cluster Mgmt-Server --region us-east-1```
Other Usefull Commands
```
kubectl get nodes
kubectl run tomcat --image=tomcat 
kubectl create deployment  demo-nginx --image=nginx --replicas=2 --port=80
# kubectl deployment regapp --image=valaxy/regapp --replicas=2 --port=8080
kubectl get all
kubectl get pod
kubectl expose deployment demo-nginx --port=80 --type=LoadBalancer
# kubectl expose deployment regapp --port=8080 --type=LoadBalancer
kubectl get services -o wide
kubectl delete pod/nginx-pod
kubectl describe service/demo-service
kubectl apply -f veritoPod.yml
kubectl cluster-info
```

##### Incase if facing any issue like ``` The connection to the server localhost:8080 was refused - did you specify the right host or port?``` or ```kubectl command not found ``` issues then change the ownership and copy the .kube file to the user who is running kubernetes commands and restart the server.
## Access cluster from Local machine
```
Pre-Req: Install Kubectl & awscli in the local machine
Create the .kube/config in the home directory of the local machine and copy the config file from the kubernetes Management server.
Add the same aws role of the eks management server in the local machine using aws configure.
```

