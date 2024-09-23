pipeline {
    agent any

    tools {
        maven 'Maven'  // Maven tool name defined in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from your GitHub repository
                git url: 'https://github.com/kasthuriChidambaram/APIAutomation-KarateFramework.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                // Compile and build the project using Maven from the ProjectRestAssured directory
                dir('APIAutomation-KarateFramework') {
                    sh 'mvn clean compile'
                }
            }
        }

        stage('Run Tests') {
            steps {
                // Run API tests with Cucumber and Rest Assured using Maven from the APIAutomation-KarateFramework directory
                dir('APIAutomation-KarateFramework') {
                    sh 'mvn test'
                }
            }
        }

        stage('Publish Test Results') {
            steps {
                // Publish Cucumber report in Jenkins from the APIAutomation-KarateFramework directory
                cucumber buildStatus: 'FAILURE',
                          fileIncludePattern: '**/APIAutomation-KarateFramework/target/*.json',
                          sortingMethod: 'ALPHABETICAL'
            }
        }

        stage('Archive Test Results') {
            steps {
                // Archive test results for reference in Jenkins from the APIAutomation-KarateFramework directory
                archiveArtifacts artifacts: '**/*.*', allowEmptyArchive: true

            }
        }
    }

    post {
        always {
            // Clean up the workspace after the pipeline execution
            cleanWs()
        }
        success {
            echo 'Build and tests succeeded!'
        }
        failure {
            echo 'Build or tests failed.'
        }
    }
}
