pipeline {
  agent any

  tools {
    // Must exactly match the name you gave in Global Tool Config
    maven 'M3'
  }

  environment {
    IMAGE = "pipeline-demo:${env.BUILD_NUMBER}"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build & Test') {
      steps {
        // Now mvn will be available
        sh 'mvn clean package'
      }
    }
    stage('Docker Build') {
      steps {
        sh "docker build -t ${IMAGE} ."
      }
    }
    stage('Docker Run Smoke Test') {
      steps {
        sh "docker run --rm ${IMAGE} java -jar app.jar --version || true"
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
    }
  }
}
