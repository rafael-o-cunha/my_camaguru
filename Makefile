COMPOSE=docker compose \
	--env-file infra/.env \
	-f infra/docker-compose.yml

APP_CONTAINER=camaguru_app

MAVEN_DEBUG_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up -d --remove-orphans

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) restart

logs:
	$(COMPOSE) logs -f

ps:
	$(COMPOSE) ps

clean:
	$(COMPOSE) down -v
	rm -rf infra/postgres/data

exec:
	docker exec -it $(APP_CONTAINER) bash

exec-db:
	docker exec -it camaguru_db bash

mvn-package:
	$(COMPOSE) exec app mvn clean package

mvn-test:
	$(COMPOSE) exec app mvn test

db-reset:
	$(COMPOSE) down -v
	rm -rf infra/postgres/data
	$(COMPOSE) up -d

run:
	@echo "\033[1;32m>> Starting application...\033[0m"
	docker compose --env-file infra/.env -f infra/docker-compose.yml exec app mvn tomcat7:run

debug:
	@echo "\033[1;33m>> Starting application in DEBUG mode...\033[0m"
	$(COMPOSE) exec app bash -c 'MAVEN_OPTS="$(MAVEN_DEBUG_OPTS)" mvn tomcat7:run'