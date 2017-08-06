build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

daemon:
	docker-compose daemon

shell-api:
	docker-compose exec api /bin/sh

tail-api:
	docker-compose exec api influx

test-api:
	docker-compose exec api /bin/sh -c go test

cleanup:
	docker rm -v $$(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $$(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null

.PHONY:
	build up daemon down cleanup \
	shell-api tail-api test-api
