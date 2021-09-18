\set pg_storage_user `echo "$POSTGRES_STORAGE_USER"`
\set pg_storage_user_password `echo "'$POSTGRES_STORAGE_USER_PASSWORD'"`
\set pg_storage_db `echo "$POSTGRES_DB"`
\set pg_storage_jwt_secret `echo "'$PGRST_JWT_SECRET'"`

create extension pgcrypto;
create extension pgjwt;

create user :pg_storage_user with password :pg_storage_user_password;
grant all privileges on database :pg_storage_db TO :pg_storage_user;

alter database :pg_storage_db set qd_storage.jwt_secret to :pg_storage_jwt_secret;

create role auth nologin;
grant auth to :pg_storage_user;
