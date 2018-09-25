FROM hub.c.163.com/wuxukun/maven-aliyun:3-jdk-8 
ADD pom.xml /tmp/build/ 
ADD src /tmp/build/src 

RUN cd /tmp/build && mvn clean package \        
&& mv target/*.jar /app.jar \        
&& cd / && rm -rf /tmp/build
VOLUME /tmp
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]

