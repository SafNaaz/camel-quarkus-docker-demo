softwares

java 17
maven 3.9
docker

create app

mvn io.quarkus:quarkus-maven-plugin:create -DprojectGroupId=com.example -DprojectArtifactId=camel-quarkus-docker-demo -DclassName="com.example.routes.MyRoute" -Dextensions="camel-quarkus-platform-http" -DbuildTool=maven

# Build the image
docker build -t camel-quarkus-demo .

# Run the container
docker run -p 8080:8080 camel-quarkus-demo

hit localhost:8080/hello

without docker

mvnw quarkus:dev

then hit same localhost

http://localhost:8080/q/dev-ui/extensions