-- Revert qd-storage:qd_storage/table/user from pg

begin;

    drop table qd_storage.user;

commit;
