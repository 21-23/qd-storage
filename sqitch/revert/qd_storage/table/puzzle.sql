-- Revert qd-storage:qd_storage/table/puzzle from pg

begin;

    drop table qd_storage.puzzle;
    drop type qd_storage.puzzle_type;

commit;
