node('docker') {
    stage('git') {
        checkout scm
    }

    def amiName = ""
    def amiId

    stage('packer') {
        sh "packer build -var ami_name=${amiName} packer.json"
    }

    stage('delete ami') {
        sh "aws ec2 deregister-image --region ap-southeast-2 --image-id ${amiId}"
    }
}
