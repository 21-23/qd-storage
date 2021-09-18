-- Revert qd-storage:qd_storage/table/auth_provider from pg

begin;

    drop table qd_storage.auth_provider;

commit;
