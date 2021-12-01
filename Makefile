all: build run

build:
	cp -rf ../qd-secrets/services/storage/ .
	docker compose build

up:
	docker compose up -d

down:
	docker compose down
