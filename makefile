-include .env

help: ## Display this current help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ General

.PHONY=install-dev copy-env start

copy-env: ## Copy .env.dist to .env
	cp -n .env.dist .env

start: ## Start project
	docker compose up -d

stop: ## Stop project
	docker compose stop

install-dev: ## Install symfony
	@echo -n "Are you sure to reinstall Symfony (current Symfony project will be lost?) [y/N] " && read ans && [ $${ans:-N} = y ]
	@echo "Installing Symfony version \"${SYMFONY_VERSION}\""
	rm -rf apps/back && mkdir apps/back
	docker compose run --rm --no-deps composer-install composer create-project symfony/skeleton\:${SYMFONY_VERSION} back
	docker-compose stop
	make start
