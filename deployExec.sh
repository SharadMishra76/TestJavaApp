docker run --rm -it maven mvn --version
cd /
cd /Users/sharadmishra/Documents/Sharad/gitJenkinProjects/TestJavaApp
#docker run  mvn clean install
docker build -t testrestdeploy1 /Users/sharadmishra/Documents/Sharad/gitJenkinProjects/TestJavaApp
docker run -d --name testrestdeploycont1 -p 80:80 testrestdeploy1 
