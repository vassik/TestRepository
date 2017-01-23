node {
   def mvnHome
   stage('Downloading changes') { // for display purposes
      git "https://github.com/vassik/ThingML.git"
      //git "https://github.com/vassik/TestRepository.git"
   }
   stage('Building Compilers') {
      // Run the maven build
       sh "mvn -Dmaven.test.failure.ignore clean install"
      // echo "Building Compilers"
   }
   stage('Building TestJar') {
       sh("cd testJar/ && mvn  -Dmaven.test.failure.ignore clean install && cd ..")
       //echo "Building TestJar"
   }
   stage('Testing') {
		//echo "Testing"
		//sh "export MASTER_SSH_PORT=22"
		//sh "export"
       sh "./testframework/test.py"
   }
   stage('Publishing HTML Report') {
      publishHTML (target: [
          allowMissing: false,
          alwaysLinkToLastBuild: false,
          keepAll: true,
          reportDir: 'htmlreports',
          reportFiles: 'index.html',
          reportName: "Test Execution Report"
        ])      
   }
}
