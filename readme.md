# Django-Booking System

## Basic Usage

1. Then run **`make up`** to start up the project for first time.
2. Use/update environment variables from envs folder.

Checkout the [commands](#commands) section for more usage.

## Preview

A default Django project resides in `src` directory. So, when you start the project, you will see the following screen in `80` port:

## Commands

To use this project, run this commands:

1. `make up` to build the project and starting containers.
2. `make build` to build the project.
3. `make start` to start containers if project has been up already.
4. `make stop` to stop containers.
5. `make shell-web` to shell access web container.
6. `make shell-db` to shell access db container.
7. `make shell-nginx` to shell access nginx container.
8. `make logs-web` to log access web container.
9. `make logs-db` to log access db container.
10. `make logs-nginx` to log access nginx container.
11. `make collectstatic` to put static files in static directory.
12. `make log-web` to log access web container.
13. `make log-db` to log access db container.
14. `make log-nginx` to log access nginx container.
15. `make restart` to restart containers.

## Build Status

[![Build Status](https://dev.azure.com/matt43121/templ_docker_django/_apis/build/status/Docker%20Compose?branchName=master)](https://dev.azure.com/matt43121/templ_docker_django/_build/latest?definitionId=3&branchName=master)
