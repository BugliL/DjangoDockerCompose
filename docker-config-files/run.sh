#!/bin/sh

cd /app || echo "impossibile cambiare cartella"

python manage.py collectstatic --no-input
python manage.py migrate

# avvio sostituito con uwsgi
#python manage.py runserver 0.0.0.0:8000
uwsgi --ini /uwsgi.ini & nginx -g 'daemon off;'

