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
                    image.inside("--entrypoint=''") {
                        version = sh(script: "closure-compiler --version", returnStdout: true).trim()
                    }

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${version}")
                    }

                    if (params.version == 'latest') {
                        docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                            image.push()
                        }
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