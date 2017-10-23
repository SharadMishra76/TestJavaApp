docker run --rm -it maven mvn --version
cd /
cd /Users/sharadmishra/Documents/Sharad/gitJenkinProjects/TestJavaApp
#docker run  mvn clean install
docker build -t testrestdeploy /Users/sharadmishra/Documents/Sharad/gitJenkinProjects/TestJavaApp
docker run -d --name testrestdeploycont -p 80:80 testrestdeploy 
