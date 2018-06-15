pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                script {
                    image = docker.build("elnebuloso/google-closure-compiler", "--pull --rm --no-cache -f Dockerfile .")

                    image.inside("--entrypoint=''") {
                        version = sh(script: "closure-compiler --version | grep -Eo '(v[0-9]{8})'", returnStdout: true).trim()
                    }

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${version}")
                        image.push()
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