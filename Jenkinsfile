pipeline {
    agent any 
    stages{
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
    post {
        success {
            mail bcc: '', body: 'Build Completed Successfully.', cc: '', from: '', replyTo: '', subject: 'Build Completed Successfully.', to: 'chaitanyagolhar35@gmail.com'
        }
        failure {
            emailext body: 'Build is failed.', subject: 'Build failed please check the pipeline.', to: 'chaitanyagolhar0305@gmail.com'
        }
    }
}
