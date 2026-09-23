pipeline {
  agent any
  environment {
    IMAGE = "ghcr.io/Shubham-casio21/enterprise-kubernetes-platform"
  }
  stages {
    stage('Validate') {
      steps { sh 'python3 -m py_compile app/app.py' }
    }
    stage('Build') {
      steps { sh 'docker build -t $IMAGE:$BUILD_NUMBER .' }
    }
    stage('Deploy') {
      steps {
        sh '''
          helm upgrade --install enterprise-platform helm/enterprise-platform \
            --namespace enterprise-demo --create-namespace \
            --set image.repository=$IMAGE --set image.tag=$BUILD_NUMBER
        '''
      }
    }
  }
}
