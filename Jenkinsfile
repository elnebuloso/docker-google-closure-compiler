pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                script {
                    image = docker.build("elnebuloso/google-closure-compiler", "--pull --rm --no-cache -f Dockerfile .")

                    image.inside("--entrypoint=''") {
                        version = sh(script: "closure-compiler --version", returnStdout: true).trim()
                    }
                }

                echo "${version}"
            }
        }
    }

	post {
	    always {
            cleanWs()
	    }
	}
}