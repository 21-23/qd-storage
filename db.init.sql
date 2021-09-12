\set pg_storage_user `echo "$POSTGRES_STORAGE_USER"`
\set pg_storage_user_password `echo "'$POSTGRES_STORAGE_USER_PASSWORD'"`
\set pg_storage_db `echo "$POSTGRES_DB"`

create user :pg_storage_user with password :pg_storage_user_password;
grant all privileges on database :pg_storage_db TO :pg_storage_user;
