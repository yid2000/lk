DIR_ENV=/home/jenkins/share/$DEPLOY_ENV/$BUILD_NUMBER
echo "Deploying to $DIR_ENV.."
mkdir -p $DIR_ENV
cp java/springboot/idea/webapp/demo/target/demo-0.0.1-SNAPSHOT.jar $DIR_ENV/demo.jar
