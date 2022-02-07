-- Deploy qd-storage:qd_storage/table/puzzle to pg

begin;

    create type qd_storage.puzzle_type as enum (
        'cssqd',
        'jsqd',
        'lodashqd'
    );

    create table qd_storage.puzzle (
        id uuid default gen_random_uuid() not null,
        type qd_storage.puzzle_type not null,
        author uuid not null,
        name text not null,
        description text,
        solution text not null,

        primary key (id),

        constraint fk_author
            foreign key (author)
            references qd_storage.user(id)
    );

commit;
