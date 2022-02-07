-- Revert qd-storage:qd_storage/table/puzzle_default_test from pg

begin;

    drop table qd_storage.puzzle_default_test;

commit;
