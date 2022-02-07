-- Verify qd-storage:qd_storage/table/puzzle_default_test on pg

begin;

    select * from qd_storage.puzzle_default_test limit 1;

rollback;
