# Symfony template project

This is template project for symfony with Docker and docker-compose.

## Requirements

- Docker engine `>20.10`
- Docker compose `>2`

## Installation

1. Clone the project ;
2. Run `make copy-env` ;
3. Update `.env` file with your own values (especially `SYMFONY_VERSION` if you want anthother than the default one) ;
4. Run `make install-dev` ;

At this point you should have a working symfony project accessible on `localhost`.

## Start the project

Run `make start` to start the project.

## Make this stack you own

To make this stack you own :

- remove `.git` folder and re-initialize your own git repository ;
- remove `/apps/back/` from `.gitignore` ;
