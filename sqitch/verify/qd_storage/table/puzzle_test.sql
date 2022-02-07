-- Verify qd-storage:qd_storage/table/puzzle-test on pg

begin;

    select * from qd_storage.puzzle_test limit 1;

rollback;
