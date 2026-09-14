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

run: mvn-package
	@echo "\033[1;32m>> Deploying and starting Tomcat...\033[0m"
	$(COMPOSE) exec app cp target/app.war /opt/tomcat/webapps/ROOT.war
	$(COMPOSE) exec app /opt/tomcat/bin/catalina.sh run

stop-tomcat:
	$(COMPOSE) exec app /opt/tomcat/bin/catalina.sh stop

debug: mvn-package
	@echo "\033[1;33m>> Starting application in DEBUG mode...\033[0m"
	$(COMPOSE) exec app java $(MAVEN_DEBUG_OPTS) -cp target/app.jar com.camaguru.Main

env:
	$(COMPOSE) build
	$(COMPOSE) up -d --remove-orphans

dev: env
	@echo "\033[1;32m>> Installing/updating dependencies and starting application...\033[0m"
	$(COMPOSE) exec app mvn clean install
	$(COMPOSE) exec app java -cp target/app.jar com.camaguru.Main

fclean:
	@echo "\033[1;31m>> Removing containers, volumes, networks, images and local data...\033[0m"
	$(COMPOSE) down -v --rmi all --remove-orphans
	rm -rf infra/postgres/data
	rm -rf infra/media/uploads

.PHONY: build up down restart logs ps clean exec exec-db mvn-package mvn-test db-reset run debug