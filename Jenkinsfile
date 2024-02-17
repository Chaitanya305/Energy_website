pipeline {
    agent any 
    stages{
        stage ("clonig-repo"){
            steps{
                sh '''
                if !( ls -ld Energy_website );then 
                    git clone https://github.com/Chaitanya305/Energy_website.git
                fi
                '''
            }
        }
        stage ("deployement"){
            steps{
                script{
                    dir('Energy_website/k8s') {
                        withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'K8S', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                            sh "kubectl apply -f deployment.yml"
                            sh "kubectl apply -f service.yml"
                        }
                    }
                }    
                
            }
        }
    }
}
