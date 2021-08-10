CREATE DATABASE django_app;
CREATE USER testuser WITH PASSWORD 'testuser';
ALTER ROLE testuser SET client_encoding TO 'utf8';
ALTER ROLE testuser SET default_transaction_isolation TO 'read committed';
ALTER ROLE testuser SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE django_app TO testuser;

ALTER USER testuser CREATEDB;
ALTER DATABASE django_app OWNER TO testuser; -- # impostare come proprietario del db pls l’utente creato

\q
