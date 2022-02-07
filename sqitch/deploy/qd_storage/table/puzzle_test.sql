-- Deploy qd-storage:qd_storage/table/puzzle-test to pg

begin;

    create table qd_storage.puzzle_test (
        id uuid default gen_random_uuid() not null,
        input text not null,
        expected text not null,
        puzzle uuid not null,

        primary key (id),

        constraint fk_puzzle
            foreign key (puzzle)
            references qd_storage.puzzle(id)
    );

commit;
