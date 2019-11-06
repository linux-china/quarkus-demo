export GRAALVM_HOME := "/Users/linux_china/.jenv/candidates/java/graalvm-19.2.0.1"

build:
  mvn -DskipTests clean package

native_build:
  mvn -Pnative -DskipTests clean package

docker_build: native_build
  docker build -f src/main/docker/Dockerfile -t linuxchina/quarkus-demo .
  
debug:
  mvn compile quarkus:dev -Ddebug=true