CREATE USER marne WITH encrypted password '12345'

ALTER USER marne createdb;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA PUBLIC TO MARNE;

create database uvv with owner = marne
 template = template0
 encoding = UTF8
 lc_collate = 'pt_BR.UTF-8'
 lc_ctype = 'pt_BR.UTF-8'
 allow_connections = true;
