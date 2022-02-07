-- Deploy qd-storage:qd_storage/table/puzzle_default_test to pg

begin;

    create table qd_storage.puzzle_default_test (
        puzzle uuid not null,
        test uuid not null,

        primary key (puzzle, test),

        constraint fk_puzzle
            foreign key (puzzle)
            references qd_storage.puzzle(id),

        constraint fk_test
            foreign key (test)
            references qd_storage.puzzle_test(id)
    );

commit;
