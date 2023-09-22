include .env

.PHONY: build up down composer

build:
	sudo docker-compose -p ${PROJECT_NAME} build

up:
	docker-compose -p ${PROJECT_NAME} up -d
	docker exec app_${PROJECT_NAME} sh -c "composer install"
	docker exec app_${PROJECT_NAME} sh -c "php spark migrate"
	docker exec app_${PROJECT_NAME} sh -c "php spark migrate:status"

down:
	docker-compose -p ${PROJECT_NAME} down
