pipeline {
    agent any

	parameters {
        string(defaultValue: 'latest', name: 'version')
	}

    stages {
        stage('build') {
            steps {
                script {
                    image = docker.build("elnebuloso/google-closure-compiler", "--build-arg VERSION=${params.version} --pull --rm --no-cache -f Dockerfile .")
                    image.withRun("--entrypoint=''") {
                        version = sh(script: "closure-compiler --version", returnStdout: true).trim()
                    }
                }
            }
        }
    }

	post {
	    always {
            cleanWs()
	    }
	}
}