# Docker for Django production
Django application for production Docker container.  
This configuration use `NGINX` for requests and `uwsgi` for running `Django` application.

    NGINX    < ------------ >     UWSGI      < ------------- > DJANGO