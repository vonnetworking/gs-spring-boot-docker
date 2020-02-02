.PHONY : docker_local_build docker_local_run build clean

build:
	gradle clean build

quick_build:
	./gradlew build

clean:
	gradle clean

docker_local_build:
	docker image build -t springboot-test:1.0 .

docker_local_run:
	docker container run -p 8083:8083 -d --name springboot springboot-test:1.0

docker_kill:
	-docker kill springboot

docker_rm:
	-docker rm springboot

docker_push:
	docker push springboot-test:1.0 vonnetworking/springboot-test:1.0

docker_local: docker_kill docker_rm docker_local_build docker_local_run

build_and_run_local: build docker_local

cleanup: clean docker_kill docker_rm
