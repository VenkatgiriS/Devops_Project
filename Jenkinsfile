pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                sh '''
                echo "Hello World"
pwd
whoami
folder_name="git-play"
if [ -d "$folder_name" ]; then
    echo "Folder $folder_name exists. Removing..."
    sudo rm -r "$folder_name"
fi

echo "Creating folder $folder_name..."
sudo mkdir "$folder_name"

echo "Folder $folder_name created."

cd git-play/
sudo git clone --mirror https://github.com/VenkatgiriS/Devops_Project.git
pwd
ls
cd Devops_Project.git
pwd
ls
sudo git remote add --mirror=fetch secondary https://git-codecommit.us-east-1.amazonaws.com/v1/repos/CodeCommitRepo
sudo git fetch origin
sudo git push secondary https://aws_codecommit_user+1-at-506960532205:Up2yFYdiq3yFVeSeWDVSGJ6ADzvwA4I2k8BQhNzNr1w=@git-codecommit.us-east-1.amazonaws.com/v1/repos/CodeCommitRepo
                '''
            }
        }
        stage('Second Stage'){
            steps{
                echo "I am Venkat"
                sh 'pwd'
            }
        }
    }
}
