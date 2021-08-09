export GRAALVM_HOME := "/Users/linux_china/.jenv/candidates/java/graalvm-21.2-java11"

build:
  mvn -DskipTests clean package

native-build:
  mvn -Pnative -DskipTests clean package

docker-build:
  mvn -DskipTests clean package -Pnative -Dnative-image.docker-build=true
  docker build -f src/main/docker/Dockerfile -t linuxchina/quarkus-demo .

docker-run:
  docker run -i --rm -p 8080:8080 linuxchina/quarkus-demo

debug:
  mvn compile quarkus:dev -Ddebug=true

buildpack:
   pack build quarkus-demo --path ./ --builder redhat/buildpacks-builder-quarkus-native:latest