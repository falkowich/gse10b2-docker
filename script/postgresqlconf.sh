#!/bin/bash

service postgresql restart ;\
su postgres sh -c "createuser -DRS root " ;\
su postgres sh -c "createdb -O root gvmd" ;\
su postgres sh -c "psql -d gvmd"   << EOSQL
    create role dba with superuser noinherit;
    grant dba to root;
    CREATE EXTENSION "uuid-ossp";
EOSQL
