-- Deploy qd-storage:qd_storage/table/user to pg

begin;

    create table qd_storage.user (
        id uuid default gen_random_uuid() not null,
        display_name text,
        auth_provider text not null,
        auth_provider_id text not null,

        primary key (auth_provider, auth_provider_id),

        constraint fk_auth_provider
            foreign key (auth_provider)
            references qd_storage.auth_provider(name)
    );

commit;
