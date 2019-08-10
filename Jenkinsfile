node {

    try {
        def app

        stage ('Checkout Git Branch') {

            checkout scm
        }

        stage ('Build Image') {

            app = docker.build('hello-world', "--build-arg env='development' .")
        }

        stage ('Push Image') {

            docker.withRegistry('https://711317688399.dkr.ecr.us-west-1.amazonaws.com', 'aws-agira-jayagopal') {

                app.push('v1')
            }
        }
    }

    catch(exception) {

        echo "${exception}"
    }
}
