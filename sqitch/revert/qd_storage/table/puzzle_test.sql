-- Revert qd-storage:qd_storage/table/puzzle-test from pg

begin;

    drop table qd_storage.puzzle_test;

commit;
