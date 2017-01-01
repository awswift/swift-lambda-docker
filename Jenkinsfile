def doit() {
    stage('git') {
        checkout scm
    }


    stage('packer') {
        def amiName = "swiftda-temp-${env.BUILD_ID}"
        def cred = [$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASSWORD']    
        withCredentials([cred]) {
            sh "packer build -var ami_name=${amiName} src/packer.json | tee packer.log"            
        }
    }

    stage('delete ami') {
        def amiId = sh(returnStdout: true, script: "grep 'amazon-ebs: AMI: ' packer.log | tr -s ' ' | cut -d ' ' -f 4").trim()
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