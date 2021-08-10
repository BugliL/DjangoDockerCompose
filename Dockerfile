FROM python:3.9-slim-buster

ENV PATH="/scripts:/py/bin:$PATH"
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-utils postgresql-client musl-dev \
        gcc python3-dev musl-dev libxml2-dev libxslt-dev \
        nginx \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove \
    && apt-get clean
ENV DEBIAN_FRONTEND newt

COPY ./requirements.txt /requirements.txt
RUN python -m venv /py \
    && /py/bin/pip install --upgrade pip \
    && /py/bin/pip install --no-cache-dir -r /requirements.txt

WORKDIR /app
COPY ./src /app

COPY ./docker-config-files/uwsgi.ini /uwsgi.ini
COPY ./docker-config-files/uwsgi_params /uwsgi_params
COPY ./docker-config-files/nginx.conf /etc/nginx/sites-enabled/application_nginx.conf
COPY ./docker-config-files/run.sh /scripts/run.sh
RUN chmod +x /scripts/*

EXPOSE 8001

CMD ["run.sh"]