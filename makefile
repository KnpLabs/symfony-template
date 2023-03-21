
help: ## Display this current help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ General

.PHONY=install-dev copy-env install-symfony start

copy-env: ## Copy .env.dist to .env
	cp -n .env.dist .env

install-dev: ## Install project
	cp -n .env.dist .env
	docker compose build
	docker compose run -T --rm --no-deps php composer install
	make start

start: ## Start project
	docker compose up -d

install-symfony: ## Install symfony
    docker compose run base-php composer create-project symfony/skeleton:"6.2.*" back
