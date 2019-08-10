@NonCPS
def helmLint(Map args) {
    // lint helm chart
    sh "helm lint ${args.chart_dir} --set version=${args.chart_version}, image.tag=${args.tag}"
}

def helmDeploy(Map args) {
    try {

        // Configure helm client and confirm tiller process is installed

        if (args.dry_run) {
            println "Running dry-run deployment"

            sh "helm install --dry-run --debug -n ${args.name} ${args.chart_dir} --set image.tag=${args.tag},version=${args.version} --tiller-namespace=${args.namespace} --namespace=${args.namespace}"
        } else {
            println "Running deployment"
            sh "helm upgrade --install ${args.name} ${args.chart_dir} --set image.tag=${args.tag},version=${args.version} --tiller-namespace=${args.namespace} --namespace=${args.namespace}"

            echo "Application ${args.name} successfully deployed. Use helm status ${args.name} to check."
        }
    }

    catch(exception) {

        echo "${exception}"
    }
}

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

            docker.withRegistry('https://711317688399.dkr.ecr.us-west-1.amazonaws.com', 'ecr:us-west-1:aws-agira-jayagopal') {

                app.push('v1')
            }
        }

        stage('Deploy image to Integration Environment') {

            // Run helm chart linter
            helmLint(
                chart_dir     : 'helm',
                chart_version : 'development',
                tag           : 'v1'
            )

            // Deploy using Helm chart
            helmDeploy(
                dry_run       : false,
                name          : 'hello-world',
                chart_dir     : 'helm',
                tag           : 'v1',
                version       : 'development',
                namespace     : 'development'
            )
        }
    }

    catch(exception) {

        echo "${exception}"
    }
}
