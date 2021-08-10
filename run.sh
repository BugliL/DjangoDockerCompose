#!/bin/sh

set -e

python manage.py collectstatic --noinput

uwsgi \
  --chdir /app \
  --socket :8000 \
  --workers 4 \
  --master \
  --enable-threads \
  --module progetto.wsgi

#  --protocol=http
