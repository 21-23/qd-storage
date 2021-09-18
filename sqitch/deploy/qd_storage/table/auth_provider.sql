-- Deploy qd-storage:qd_storage/table/auth_provider to pg

begin;

    create table qd_storage.auth_provider (
        name text not null,

        primary key (name),

        constraint name_must_be_not_empty
            check (name <> '')
    );

commit;
