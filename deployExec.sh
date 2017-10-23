docker run --rm -it maven mvn --version
cd /
cd /Users/sharadmishra/Documents/Sharad/gitJenkinProjects/TestJavaApp
docker run -v maven mvn clean install
docker build -t TestRestDeploy /Users/sharadmishra/Documents/Sharad/gitJenkinProjects/TestJavaApp
docker run -d --name TestRestDeployCont -p 80:80 TestRestDeploy 
