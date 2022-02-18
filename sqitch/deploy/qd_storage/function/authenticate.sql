-- Deploy qd-storage:qd_storage/function/authenticate to pg

begin;

    create function api.authenticate(json)
    returns json as $$
        with user_id as (
            select gen_random_uuid() as id
        )
        insert into qd_storage.user (
            id,
            display_name,
            auth_provider,
            auth_provider_id,
            auth_token
        )
            select
                user_id.id as id,
                ($1->>'displayName')::text as display_name,
                ($1->>'authProvider')::text as auth_provider,
                ($1->>'authProviderId')::text as auth_provider_id,
                (
                    select token
                    from api.get_token(
                        'user',
                        jsonb_build_object('user-id', user_id.id)
                    )
                ) as auth_token
            from user_id
        on conflict on constraint unique_provider_id do update
            set auth_token = excluded.auth_token
        returning row_to_json(qd_storage.user.*);
    $$ language sql volatile security definer;

    grant execute on function api.authenticate(json) to auth;

commit;
