#! /bin/sh

if [ "$PRODUCTION" = "true" ]; then 
    python manage.py collectstatic --no-input; hypercorn project.asgi:application -b 0.0.0.0:8000 & celery worker --app=base.tasks
else
    python manage.py runserver 0.0.0.0:8000 & celery worker --app=base.tasks
fi
