pipeline {
    agent any

    environment {
        IMAGE_NAME = 'html-image'
        CONTAINER_NAME = 'html-container'
        PATH = "C:\\Program Files\\Docker\\Docker\\resources\\bin;${env.PATH}"
    }

    triggers {
        githubPush()
    }

    stages {
        stage('Repo Klonla') {
            steps {
                git url: 'https://github.com/tahirtolu/jenkins-html-auto.git', branch: 'main'
            }
        }

        stage('Docker Image Oluştur') {
            steps {
                echo "Docker Image oluşturuluyor..."
                bat "docker build -t %IMAGE_NAME% ."
            }
        }

        stage('Eski Container Durdur') {
            steps {
                echo "Eski container durduruluyor..."
                bat "docker rm -f %CONTAINER_NAME% || exit 0"
            }
        }

        stage('Yeni Container Oluştur') {
            steps {
                echo "Yeni container oluşturuluyor..."
                bat "docker run -d --name %CONTAINER_NAME% -p 9090:80 %IMAGE_NAME%"
            }
        }
    }

    post {
        success {
            echo "Yayın başarılı! http://localhost:9090"
        }
        failure {
            echo "Pipeline başarısız oldu!"
        }
    }
}
