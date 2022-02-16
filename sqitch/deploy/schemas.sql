-- Deploy qd-storage:schemas to pg

begin;

    create schema qd_storage;
    grant usage on schema qd_storage to auth;

    create schema api;
    grant usage on schema api to auth;

commit;
