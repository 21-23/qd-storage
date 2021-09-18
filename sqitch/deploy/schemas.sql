-- Deploy qd-storage:schemas to pg

begin;

    create schema qd_storage;

    create schema api;
    grant usage on schema api to auth;

commit;
