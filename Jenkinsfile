def doit() {
    stage('git') {
        checkout scm
    }

    def amiName = "swiftda-temp-${env.BUILD_ID}"
    def amiId

    stage('packer') {
        def cred = [$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASSWORD']
        withCredentials([cred]) {
            sh "packer build -var ami_name=${amiName} src/packer.json"            
        }
    }

    stage('delete ami') {
        sh "aws ec2 deregister-image --region ap-southeast-2 --image-id ${amiId}"
    }
}

node('mini') {
    ansiColor('xterm') {
        timestamps {
            timeout(30) {
                doit()
            }
        }
    }
}