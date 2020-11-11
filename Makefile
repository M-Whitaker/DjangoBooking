build: down
	docker-compose build

up: build
	docker-compose up -d

up-non-daemon: build
	docker-compose up

down:
	docker-compose down

start:
	docker-compose start

stop:
	docker-compose stop

restart:
	docker-compose stop && docker-compose start

shell-nginx:
	docker exec -ti nginx /bin/sh

shell-web:
	docker exec -ti django /bin/sh

shell-db:
	docker exec -ti postgres /bin/sh -c "psql --username=django_admin --dbname=django_db"

log-nginx:
	docker-compose logs --follow nginx

log-web:
	docker-compose logs --follow web

log-db:
	docker-compose logs --follow db

collectstatic:
	docker exec django /bin/sh -c "python manage.py collectstatic --noinput"

runtests:
	make build
	make up
	docker exec django /bin/sh -c "python manage.py test --keepdb"
	make stop

test:
	docker exec django /bin/sh -c "python manage.py test --keepdb"