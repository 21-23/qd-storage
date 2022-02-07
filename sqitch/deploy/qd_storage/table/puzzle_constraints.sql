-- Deploy qd-storage:qd_storage/table/puzzle-constraints to pg

begin;

    create table qd_storage.puzzle_constraints (
        puzzle uuid not null,
        time_limit interval not null,
        banned_characters character varying(16)[] not null,
        sandbox_time_limit interval not null,
        solution_length_limit integer,

        constraint fk_puzzle
            foreign key (puzzle)
            references qd_storage.puzzle(id)
    );

commit;
