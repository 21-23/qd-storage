-- Deploy qd-storage:qd_storage/function/authenticate to pg

begin;

    create function api.authenticate(json)
    returns json as $$
        insert into qd_storage.user (
            display_name,
            auth_provider,
            auth_provider_id,
            auth_token
        )
            select
                ($1->>'displayName')::text                as display_name,
                ($1->>'authProvider')::text               as auth_provider,
                ($1->>'authProviderId')::text             as auth_provider_id,
                (select token from api.get_token('user')) as auth_token
        on conflict on constraint unique_provider_id do update
            set auth_token = excluded.auth_token
        returning row_to_json(qd_storage.user.*);
    $$ language sql volatile security definer;

    grant execute on function api.authenticate(json) to auth;

commit;
