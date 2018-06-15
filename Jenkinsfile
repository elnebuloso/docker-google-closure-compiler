pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                script {
                    image = docker.build("elnebuloso/google-closure-compiler", "--pull --rm --no-cache -f Dockerfile .")

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("v20180610")
                        image.push()
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