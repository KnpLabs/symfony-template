# Symfony template project

This is template project for symfony with Docker and docker-compose.

## Requirements

- Docker engine `>20.10`
- Docker compose `>2`

## Installation

1. Clone the project ;
2. Run `make copy-env` ;
3. Run `docker compose run base-php composer create-project symfony/skeleton:"6.2.*" back` (change `6.2.*` with any symfony version you want) ;
