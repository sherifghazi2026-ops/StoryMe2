--
-- PostgreSQL database dump
--

\restrict M5sromKdzG1b6eygeiMQUlliicg85SBPQh9bvbgMWrfE9qYgSiKjjmNqndibRCc

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: graphql(text, text, jsonb, jsonb); Type: FUNCTION; Schema: graphql_public; Owner: supabase_admin
--

CREATE FUNCTION graphql_public.graphql("operationName" text DEFAULT NULL::text, query text DEFAULT NULL::text, variables jsonb DEFAULT NULL::jsonb, extensions jsonb DEFAULT NULL::jsonb) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;


ALTER FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) OWNER TO supabase_admin;

--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: auto_create_merchant_for_full_service(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.auto_create_merchant_for_full_service() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO profiles (id, full_name, phone, password, role, merchant_type, is_verified, active)
    VALUES (gen_random_uuid(), NEW.name, '01000000000', '1234', 'merchant', NEW.service_id, true, true)
      ON CONFLICT (phone) DO NOTHING;
        RETURN NEW;
        END;
        $$;


ALTER FUNCTION public.auto_create_merchant_for_full_service() OWNER TO postgres;

--
-- Name: auto_create_merchant_record(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.auto_create_merchant_record() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.role = 'merchant' THEN
        INSERT INTO merchants (id, user_id, name, phone, service_type, is_active, created_at, updated_at)
                  VALUES (
                                NEW.id, NEW.id, NEW.full_name, NEW.phone, NEW.merchant_type, true, NOW(), NOW()
                                          )
                                                ON CONFLICT (id) DO NOTHING;
                                                  END IF;
                                                    RETURN NEW;
                                                    END;
                                                    $$;


ALTER FUNCTION public.auto_create_merchant_record() OWNER TO postgres;

--
-- Name: auto_set_merchant_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.auto_set_merchant_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- إذا كان الطلب الجديد ليس له تاجر، والخدمة (service_type) محددة، قم بإيجاد التاجر المناسب
    IF NEW.merchant_id IS NULL AND NEW.service_type IS NOT NULL THEN
          SELECT id INTO NEW.merchant_id
                    FROM merchants
                              WHERE service_type = NEW.service_type
                                        LIMIT 1;
                                          END IF;
                                            RETURN NEW;
                                            END;
                                            $$;


ALTER FUNCTION public.auto_set_merchant_id() OWNER TO postgres;

--
-- Name: check_duplicate_field(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_duplicate_field() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- إذا كان هناك حقل مكرر بنفس الاسم لنفس الخدمة الفرعية، احذف القديم أولاً
    DELETE FROM service_fields 
      WHERE sub_service_id = NEW.sub_service_id 
          AND field_name = NEW.field_name 
              AND id != NEW.id;
                RETURN NEW;
                END;
                $$;


ALTER FUNCTION public.check_duplicate_field() OWNER TO postgres;

--
-- Name: copy_merchant_on_new_service(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.copy_merchant_on_new_service() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.type = 'full_service' AND NEW.full_service_id IS NOT NULL THEN
      -- انسخ التاجر من الخدمة الشاملة المرتبطة
          INSERT INTO profiles (id, full_name, phone, password, role, merchant_type, is_verified, active, created_at, updated_at)
              SELECT 
                    gen_random_uuid(),
                          p.full_name,
                                p.phone,
                                      p.password,
                                            'merchant',
                                                  NEW.id,  -- استخدام id الخدمة الجديدة
                                                        true,
                                                              true,
                                                                    NOW(),
                                                                          NOW()
                                                                              FROM profiles p
                                                                                  WHERE p.merchant_type = (SELECT service_id FROM full_services WHERE id = NEW.full_service_id)
                                                                                      AND p.role = 'merchant'
                                                                                          ON CONFLICT (phone) DO NOTHING;
                                                                                            END IF;
                                                                                              RETURN NEW;
                                                                                              END;
                                                                                              $$;


ALTER FUNCTION public.copy_merchant_on_new_service() OWNER TO postgres;

--
-- Name: copy_service_fields_on_new_sub(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.copy_service_fields_on_new_sub() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- انسخ الحقول من خدمة فرعية بنفس الاسم من خدمة شاملة أخرى
    INSERT INTO service_fields (service_id, field_name, field_label, field_type, is_required, sort_order, sub_service_name)
      SELECT 
          NEW.name,
              sf.field_name,
                  sf.field_label,
                      sf.field_type,
                          sf.is_required,
                              sf.sort_order,
                                  NEW.name
                                    FROM service_fields sf
                                      WHERE sf.sub_service_name = NEW.name;
                                        RETURN NEW;
                                        END;
                                        $$;


ALTER FUNCTION public.copy_service_fields_on_new_sub() OWNER TO postgres;

--
-- Name: copy_sub_services_on_new_service(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.copy_sub_services_on_new_service() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.type = 'full_service' AND NEW.full_service_id IS NOT NULL THEN
      -- انسخ الخدمات الفرعية من الخدمة الشاملة المختارة
          INSERT INTO sub_services (full_service_id, name, icon, sort_order, is_active, show_title, image_url)
              SELECT 
                    NEW.id,
                          ss.name,
                                ss.icon,
                                      ss.sort_order,
                                            ss.is_active,
                                                  ss.show_title,
                                                        ss.image_url
                                                            FROM sub_services ss
                                                                WHERE ss.full_service_id = NEW.full_service_id;
                                                                  END IF;
                                                                    RETURN NEW;
                                                                    END;
                                                                    $$;


ALTER FUNCTION public.copy_sub_services_on_new_service() OWNER TO postgres;

--
-- Name: delete_place_with_products(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_place_with_products(place_id_param bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
      DECLARE
        merchant_id_val TEXT;
        BEGIN
          -- الحصول على merchant_id المرتبط بالمكان
            SELECT merchant_id INTO merchant_id_val FROM places WHERE id = place_id_param;
              
                -- حذف المنتجات المرتبطة بالتاجر (إذا كان هناك تاجر)
                  IF merchant_id_val IS NOT NULL THEN
                      DELETE FROM products WHERE merchant_id = merchant_id_val;
                        END IF;
                          
                            -- حذف المكان نفسه
                              DELETE FROM places WHERE id = place_id_param;
                                
                                  RETURN TRUE;
                                  END;
                                  $$;


ALTER FUNCTION public.delete_place_with_products(place_id_param bigint) OWNER TO postgres;

--
-- Name: notify_sound_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.notify_sound_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- إرسال إشعار صامت لكل التجار
    PERFORM net.http_post(
        'https://exp.host/--/api/v2/push/send',
            json_build_object(
                  'to', (SELECT array_agg(expo_push_token) FROM profiles WHERE role = 'merchant' AND expo_push_token IS NOT NULL),
                        'title', 'تحديث التطبيق',
                              'body', 'جاري تحديث إعدادات الصوت...',
                                    'data', json_build_object(
                                            'type', 'sound_update',
                                                    'key', NEW.key,
                                                            'url', NEW.value
                                                                  ),
                                                                        'priority', 'default',
                                                                              'sound', null -- صامت
                                                                                  )
                                                                                    );
                                                                                      RETURN NEW;
                                                                                      END;
                                                                                      $$;


ALTER FUNCTION public.notify_sound_update() OWNER TO postgres;

--
-- Name: set_order_merchant_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_order_merchant_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF NEW.merchant_id IS NULL AND NEW.service_type IS NOT NULL THEN
        SELECT id INTO NEW.merchant_id
            FROM merchants
                WHERE service_type = NEW.service_type
                    LIMIT 1;
                      END IF;
                        RETURN NEW;
                        END;
                        $$;


ALTER FUNCTION public.set_order_merchant_id() OWNER TO postgres;

--
-- Name: sync_full_service_data(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sync_full_service_data(p_service_id text) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_source_service_id TEXT;
    v_target_full_service_id UUID;
      v_result JSONB;
        v_source_full_service_id UUID;
        BEGIN
          -- الحصول على الـ UUID للخدمة الحالية
            SELECT id INTO v_target_full_service_id FROM full_services WHERE service_id = p_service_id;
              
                -- تحديد الخدمة الأم (thomascook أو delivery)
                  SELECT service_id INTO v_source_service_id
                    FROM full_services 
                      WHERE service_id IN ('thomascook', 'delivery')
                        AND service_id != p_service_id
                          LIMIT 1;
                            
                              IF v_source_service_id IS NOT NULL AND v_target_full_service_id IS NOT NULL THEN
                                  SELECT id INTO v_source_full_service_id FROM full_services WHERE service_id = v_source_service_id;
                                      
                                          -- إضافة الخدمات الفرعية المفقودة فقط (بدون حذف)
                                              INSERT INTO sub_services (full_service_id, name, icon, sort_order, is_active, show_title, image_url)
                                                  SELECT 
                                                        v_target_full_service_id,
                                                              ss.name,
                                                                    ss.icon,
                                                                          ss.sort_order,
                                                                                ss.is_active,
                                                                                      ss.show_title,
                                                                                            ss.image_url
                                                                                                FROM sub_services ss
                                                                                                    WHERE ss.full_service_id = v_source_full_service_id
                                                                                                        AND NOT EXISTS (
                                                                                                              SELECT 1 FROM sub_services s2 
                                                                                                                    WHERE s2.full_service_id = v_target_full_service_id 
                                                                                                                          AND s2.name = ss.name
                                                                                                                              );
                                                                                                                                  
                                                                                                                                      -- إضافة الحقول المفقودة فقط (بدون حذف)
                                                                                                                                          INSERT INTO service_fields (service_id, field_name, field_label, field_type, is_required, sort_order, sub_service_name, config)
                                                                                                                                              SELECT 
                                                                                                                                                    ss_new.name,
                                                                                                                                                          sf.field_name,
                                                                                                                                                                sf.field_label,
                                                                                                                                                                      sf.field_type,
                                                                                                                                                                            sf.is_required,
                                                                                                                                                                                  sf.sort_order,
                                                                                                                                                                                        ss_new.name,
                                                                                                                                                                                              sf.config
                                                                                                                                                                                                  FROM sub_services ss_new
                                                                                                                                                                                                      CROSS JOIN service_fields sf
                                                                                                                                                                                                          WHERE ss_new.full_service_id = v_target_full_service_id
                                                                                                                                                                                                              AND sf.service_id IN (SELECT name FROM sub_services WHERE full_service_id = v_source_full_service_id)
                                                                                                                                                                                                                  AND NOT EXISTS (
                                                                                                                                                                                                                        SELECT 1 FROM service_fields sf2 
                                                                                                                                                                                                                              WHERE sf2.service_id = ss_new.name 
                                                                                                                                                                                                                                    AND sf2.field_name = sf.field_name
                                                                                                                                                                                                                                        );
                                                                                                                                                                                                                                          END IF;
                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                              v_result := jsonb_build_object('success', true, 'message', 'تم التحديث بنجاح');
                                                                                                                                                                                                                                                RETURN v_result;
                                                                                                                                                                                                                                                END;
                                                                                                                                                                                                                                                $$;


ALTER FUNCTION public.sync_full_service_data(p_service_id text) OWNER TO postgres;

--
-- Name: update_modified_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_modified_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = NOW();
        RETURN NEW;
        END;
        $$;


ALTER FUNCTION public.update_modified_column() OWNER TO postgres;

--
-- Name: upsert_full_service_with_subs(text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.upsert_full_service_with_subs(p_service_id text, p_service_name text, p_icon text DEFAULT 'briefcase'::text, p_color text DEFAULT '#8B5CF6'::text) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
        DECLARE
          v_full_service_id UUID;
            v_source_service_id TEXT;
              v_source_full_service_id UUID;
                v_result JSONB;
                BEGIN
                  -- 1. إضافة أو تحديث الخدمة في جدول services
                    INSERT INTO services (id, name, type, icon, color, is_active, is_visible)
                      VALUES (p_service_id, p_service_name, 'full_service', p_icon, p_color, true, true)
                        ON CONFLICT (id) DO UPDATE SET
                            name = EXCLUDED.name,
                                icon = EXCLUDED.icon,
                                    color = EXCLUDED.color,
                                        updated_at = NOW()
                                          RETURNING id INTO v_full_service_id;
                                            
                                              -- 2. إضافة أو تحديث الخدمة في جدول full_services
                                                INSERT INTO full_services (service_id, name, icon, color, is_active)
                                                  VALUES (p_service_id, p_service_name, p_icon, p_color, true)
                                                    ON CONFLICT (service_id) DO UPDATE SET
                                                        name = EXCLUDED.name,
                                                            icon = EXCLUDED.icon,
                                                                color = EXCLUDED.color,
                                                                    updated_at = NOW()
                                                                      RETURNING id INTO v_full_service_id;
                                                                        
                                                                          -- 3. نسخ الخدمات الفرعية من خدمة أم إذا كانت الخدمة جديدة
                                                                            IF NOT EXISTS (SELECT 1 FROM sub_services WHERE full_service_id = v_full_service_id LIMIT 1) THEN
                                                                                -- تحديد الخدمة الأم (أول خدمة شاملة موجودة غير نفسها)
                                                                                    SELECT service_id INTO v_source_service_id
                                                                                        FROM full_services 
                                                                                            WHERE service_id != p_service_id 
                                                                                                LIMIT 1;
                                                                                                    
                                                                                                        IF v_source_service_id IS NOT NULL THEN
                                                                                                              SELECT id INTO v_source_full_service_id FROM full_services WHERE service_id = v_source_service_id;
                                                                                                                    
                                                                                                                          -- نسخ الخدمات الفرعية
                                                                                                                                INSERT INTO sub_services (full_service_id, name, icon, sort_order, is_active, show_title, image_url)
                                                                                                                                      SELECT 
                                                                                                                                              v_full_service_id,
                                                                                                                                                      ss.name,
                                                                                                                                                              ss.icon,
                                                                                                                                                                      ss.sort_order,
                                                                                                                                                                              ss.is_active,
                                                                                                                                                                                      ss.show_title,
                                                                                                                                                                                              ss.image_url
                                                                                                                                                                                                    FROM sub_services ss
                                                                                                                                                                                                          WHERE ss.full_service_id = v_source_full_service_id
                                                                                                                                                                                                                ON CONFLICT (full_service_id, name) DO NOTHING;
                                                                                                                                                                                                                      
                                                                                                                                                                                                                            -- نسخ الحقول المخصصة
                                                                                                                                                                                                                                  INSERT INTO service_fields (service_id, field_name, field_label, field_type, is_required, sort_order, sub_service_name, config)
                                                                                                                                                                                                                                        SELECT 
                                                                                                                                                                                                                                                ss_new.name,
                                                                                                                                                                                                                                                        sf.field_name,
                                                                                                                                                                                                                                                                sf.field_label,
                                                                                                                                                                                                                                                                        sf.field_type,
                                                                                                                                                                                                                                                                                sf.is_required,
                                                                                                                                                                                                                                                                                        sf.sort_order,
                                                                                                                                                                                                                                                                                                ss_new.name,
                                                                                                                                                                                                                                                                                                        sf.config
                                                                                                                                                                                                                                                                                                              FROM sub_services ss_new
                                                                                                                                                                                                                                                                                                                    CROSS JOIN service_fields sf
                                                                                                                                                                                                                                                                                                                          WHERE ss_new.full_service_id = v_full_service_id
                                                                                                                                                                                                                                                                                                                                AND sf.service_id IN (SELECT name FROM sub_services WHERE full_service_id = v_source_full_service_id)
                                                                                                                                                                                                                                                                                                                                      ON CONFLICT (service_id, field_name) DO NOTHING;
                                                                                                                                                                                                                                                                                                                                          END IF;
                                                                                                                                                                                                                                                                                                                                            END IF;
                                                                                                                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                                                                                                                                v_result := jsonb_build_object(
                                                                                                                                                                                                                                                                                                                                                    'success', true,
                                                                                                                                                                                                                                                                                                                                                        'service_id', p_service_id,
                                                                                                                                                                                                                                                                                                                                                            'full_service_id', v_full_service_id,
                                                                                                                                                                                                                                                                                                                                                                'message', 'Service upserted successfully'
                                                                                                                                                                                                                                                                                                                                                                  );
                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                      RETURN v_result;
                                                                                                                                                                                                                                                                                                                                                                      END;
                                                                                                                                                                                                                                                                                                                                                                      $$;


ALTER FUNCTION public.upsert_full_service_with_subs(p_service_id text, p_service_name text, p_icon text, p_color text) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
    -- Regclass of the table e.g. public.notes
    entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

    -- I, U, D, T: insert, update ...
    action realtime.action = (
        case wal ->> 'action'
            when 'I' then 'INSERT'
            when 'U' then 'UPDATE'
            when 'D' then 'DELETE'
            else 'ERROR'
        end
    );

    -- Is row level security enabled for the table
    is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

    subscriptions realtime.subscription[] = array_agg(subs)
        from
            realtime.subscription subs
        where
            subs.entity = entity_
            -- Filter by action early - only get subscriptions interested in this action
            -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
            and (subs.action_filter = '*' or subs.action_filter = action::text);

    -- Subscription vars
    working_role regrole;
    working_selected_columns text[];
    claimed_role regrole;
    claims jsonb;

    subscription_id uuid;
    subscription_has_access bool;
    visible_to_subscription_ids uuid[] = '{}';

    -- structured info for wal's columns
    columns realtime.wal_column[];
    -- previous identity values for update/delete
    old_columns realtime.wal_column[];

    error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

    -- Primary jsonb output for record
    output jsonb;

    -- Loop record for iterating unique roles (outer loop)
    role_record record;
    -- Loop record for iterating unique selected_columns within a role (inner loop)
    cols_record record;
    -- Subscription ids visible at the role level (before fanning out by selected_columns)
    visible_role_sub_ids uuid[] = '{}';

begin
    perform set_config('role', null, true);

    columns =
        array_agg(
            (
                x->>'name',
                x->>'type',
                x->>'typeoid',
                realtime.cast(
                    (x->'value') #>> '{}',
                    coalesce(
                        (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                        (x->>'type')::regtype
                    )
                ),
                (pks ->> 'name') is not null,
                true
            )::realtime.wal_column
        )
        from
            jsonb_array_elements(wal -> 'columns') x
            left join jsonb_array_elements(wal -> 'pk') pks
                on (x ->> 'name') = (pks ->> 'name');

    old_columns =
        array_agg(
            (
                x->>'name',
                x->>'type',
                x->>'typeoid',
                realtime.cast(
                    (x->'value') #>> '{}',
                    coalesce(
                        (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                        (x->>'type')::regtype
                    )
                ),
                (pks ->> 'name') is not null,
                true
            )::realtime.wal_column
        )
        from
            jsonb_array_elements(wal -> 'identity') x
            left join jsonb_array_elements(wal -> 'pk') pks
                on (x ->> 'name') = (pks ->> 'name');

    for role_record in
        select claims_role
        from (select distinct claims_role from unnest(subscriptions)) t
        order by claims_role::text
    loop
        working_role := role_record.claims_role;

        -- Update `is_selectable` for columns and old_columns (once per role)
        columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(columns) c;

        old_columns =
                array_agg(
                    (
                        c.name,
                        c.type_name,
                        c.type_oid,
                        c.value,
                        c.is_pkey,
                        pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                    )::realtime.wal_column
                )
                from
                    unnest(old_columns) c;

        if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
            -- Fan out 400 error per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where s.claims_role = working_role and (s.selected_columns is not distinct from working_selected_columns)),
                    array['Error 400: Bad Request, no primary key']
                )::realtime.wal_rls;
            end loop;

        -- The claims role does not have SELECT permission to the primary key of entity
        elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
            -- Fan out 401 error per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where s.claims_role = working_role and (s.selected_columns is not distinct from working_selected_columns)),
                    array['Error 401: Unauthorized']
                )::realtime.wal_rls;
            end loop;

        else
            -- Create the prepared statement (once per role)
            if is_rls_enabled and action <> 'DELETE' then
                if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                    deallocate walrus_rls_stmt;
                end if;
                execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
            end if;

            -- Collect all visible subscription IDs for this role (filter check + RLS check)
            visible_role_sub_ids = '{}';

            for subscription_id, claims in (
                    select
                        subs.subscription_id,
                        subs.claims
                    from
                        unnest(subscriptions) subs
                    where
                        subs.entity = entity_
                        and subs.claims_role = working_role
                        and (
                            realtime.is_visible_through_filters(columns, subs.filters)
                            or (
                              action = 'DELETE'
                              and realtime.is_visible_through_filters(old_columns, subs.filters)
                            )
                        )
            ) loop

                if not is_rls_enabled or action = 'DELETE' then
                    visible_role_sub_ids = visible_role_sub_ids || subscription_id;
                else
                    -- Check if RLS allows the role to see the record
                    perform
                        -- Trim leading and trailing quotes from working_role because set_config
                        -- doesn't recognize the role as valid if they are included
                        set_config('role', trim(both '"' from working_role::text), true),
                        set_config('request.jwt.claims', claims::text, true);

                    execute 'execute walrus_rls_stmt' into subscription_has_access;

                    if subscription_has_access then
                        visible_role_sub_ids = visible_role_sub_ids || subscription_id;
                    end if;
                end if;
            end loop;

            perform set_config('role', null, true);

            -- Inner loop: per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;

                output = jsonb_build_object(
                    'schema', wal ->> 'schema',
                    'table', wal ->> 'table',
                    'type', action,
                    'commit_timestamp', to_char(
                        ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                        'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
                    ),
                    'columns', (
                        select
                            jsonb_agg(
                                jsonb_build_object(
                                    'name', pa.attname,
                                    'type', pt.typname
                                )
                                order by pa.attnum asc
                            )
                        from
                            pg_attribute pa
                            join pg_type pt
                                on pa.atttypid = pt.oid
                            left join (
                                select unnest(conkey) as pkey_attnum
                                from pg_constraint
                                where conrelid = entity_ and contype = 'p'
                            ) pk on pk.pkey_attnum = pa.attnum
                        where
                            attrelid = entity_
                            and attnum > 0
                            and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
                            and (working_selected_columns is null or pa.attname = any(working_selected_columns) or pk.pkey_attnum is not null)
                    )
                )
                -- Add "record" key for insert and update
                || case
                    when action in ('INSERT', 'UPDATE') then
                        jsonb_build_object(
                            'record',
                            (
                                select
                                    jsonb_object_agg(
                                        -- if unchanged toast, get column name and value from old record
                                        coalesce((c).name, (oc).name),
                                        case
                                            when (c).name is null then (oc).value
                                            else (c).value
                                        end
                                    )
                                from
                                    unnest(columns) c
                                    full outer join unnest(old_columns) oc
                                        on (c).name = (oc).name
                                where
                                    coalesce((c).is_selectable, (oc).is_selectable)
                                    and (working_selected_columns is null or coalesce((c).name, (oc).name) = any(working_selected_columns) or coalesce((c).is_pkey, (oc).is_pkey))
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            )
                        )
                    else '{}'::jsonb
                end
                -- Add "old_record" key for update and delete
                || case
                    when action = 'UPDATE' then
                        jsonb_build_object(
                                'old_record',
                                (
                                    select jsonb_object_agg((c).name, (c).value)
                                    from unnest(old_columns) c
                                    where
                                        (c).is_selectable
                                        and (working_selected_columns is null or (c).name = any(working_selected_columns) or (c).is_pkey)
                                        and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                )
                            )
                    when action = 'DELETE' then
                        jsonb_build_object(
                            'old_record',
                            (
                                select jsonb_object_agg((c).name, (c).value)
                                from unnest(old_columns) c
                                where
                                    (c).is_selectable
                                    and (working_selected_columns is null or (c).name = any(working_selected_columns) or (c).is_pkey)
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                    and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                            )
                        )
                    else '{}'::jsonb
                end;

                -- Filter visible_role_sub_ids to those matching the current selected_columns group
                visible_to_subscription_ids = coalesce(
                    (
                        select array_agg(s.subscription_id)
                        from unnest(subscriptions) s
                        where s.claims_role = working_role
                          and (s.selected_columns is not distinct from working_selected_columns)
                          and s.subscription_id = any(visible_role_sub_ids)
                    ),
                    '{}'::uuid[]
                );

                return next (
                    output,
                    is_rls_enabled,
                    visible_to_subscription_ids,
                    case
                        when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                        else '{}'
                    end
                )::realtime.wal_rls;
            end loop;

        end if;
    end loop;

    perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS TABLE(wal jsonb, is_rls_enabled boolean, subscription_ids uuid[], errors text[], slot_changes_count bigint)
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
  WITH pub AS (
    SELECT
      concat_ws(
        ',',
        CASE WHEN bool_or(pubinsert) THEN 'insert' ELSE NULL END,
        CASE WHEN bool_or(pubupdate) THEN 'update' ELSE NULL END,
        CASE WHEN bool_or(pubdelete) THEN 'delete' ELSE NULL END
      ) AS w2j_actions,
      coalesce(
        string_agg(
          realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
          ','
        ) filter (WHERE ppt.tablename IS NOT NULL),
        ''
      ) AS w2j_add_tables
    FROM pg_publication pp
    LEFT JOIN pg_publication_tables ppt ON pp.pubname = ppt.pubname
    WHERE pp.pubname = publication
    GROUP BY pp.pubname
    LIMIT 1
  ),
  -- MATERIALIZED ensures pg_logical_slot_get_changes is called exactly once
  w2j AS MATERIALIZED (
    SELECT x.*, pub.w2j_add_tables
    FROM pub,
         pg_logical_slot_get_changes(
           slot_name, null, max_changes,
           'include-pk', 'true',
           'include-transaction', 'false',
           'include-timestamp', 'true',
           'include-type-oids', 'true',
           'format-version', '2',
           'actions', pub.w2j_actions,
           'add-tables', pub.w2j_add_tables
         ) x
  ),
  slot_count AS (
    SELECT count(*)::bigint AS cnt
    FROM w2j
    WHERE w2j.w2j_add_tables <> ''
  ),
  rls_filtered AS (
    SELECT xyz.wal, xyz.is_rls_enabled, xyz.subscription_ids, xyz.errors
    FROM w2j,
         realtime.apply_rls(
           wal := w2j.data::jsonb,
           max_record_bytes := max_record_bytes
         ) xyz(wal, is_rls_enabled, subscription_ids, errors)
    WHERE w2j.w2j_add_tables <> ''
      AND xyz.subscription_ids[1] IS NOT NULL
  )
  SELECT rf.wal, rf.is_rls_enabled, rf.subscription_ids, rf.errors, sc.cnt
  FROM rls_filtered rf, slot_count sc

  UNION ALL

  SELECT null, null, null, null, sc.cnt
  FROM slot_count sc
  WHERE NOT EXISTS (SELECT 1 FROM rls_filtered)
$$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
  SELECT
    realtime.wal2json_escape_identifier(nsp.nspname::text)
    || '.'
    || realtime.wal2json_escape_identifier(pc.relname::text)
  FROM pg_class pc
  JOIN pg_namespace nsp ON pc.relnamespace = nsp.oid
  WHERE pc.oid = entity
$$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: send_binary(bytea, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
BEGIN
  BEGIN
    generated_id := gen_random_uuid();

    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    INSERT INTO realtime.messages (id, binary_payload, event, topic, private, extension)
    VALUES (generated_id, payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
    col_names text[] = coalesce(
            array_agg(c.column_name order by c.ordinal_position),
            '{}'::text[]
        )
        from
            information_schema.columns c
        where
            format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
            and pg_catalog.has_column_privilege(
                (new.claims ->> 'role'),
                format('%I.%I', c.table_schema, c.table_name)::regclass,
                c.column_name,
                'SELECT'
            );
    table_col_names text[] = coalesce(
            array_agg(pa.attname),
            '{}'::text[]
        )
        from
            pg_attribute pa
        where
            pa.attrelid = new.entity
            and pa.attnum > 0;
    filter realtime.user_defined_filter;
    col_type regtype;
    in_val jsonb;
    selected_col text;
begin
    for filter in select * from unnest(new.filters) loop
        -- Filtered column is valid
        if not filter.column_name = any(col_names) then
            raise exception 'invalid column for filter %', filter.column_name;
        end if;

        -- Type is sanitized and safe for string interpolation
        col_type = (
            select atttypid::regtype
            from pg_catalog.pg_attribute
            where attrelid = new.entity
                  and attname = filter.column_name
        );
        if col_type is null then
            raise exception 'failed to lookup type for column %', filter.column_name;
        end if;
        if filter.op = 'in'::realtime.equality_op then
            in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
            if coalesce(jsonb_array_length(in_val), 0) > 100 then
                raise exception 'too many values for `in` filter. Maximum 100';
            end if;
        else
            -- raises an exception if value is not coercable to type
            perform realtime.cast(filter.value, col_type);
        end if;
    end loop;

    -- Validate that selected_columns reference columns the role can SELECT
    if new.selected_columns is not null then
        for selected_col in select * from unnest(new.selected_columns) loop
            if not selected_col = any(col_names) then
                raise exception 'invalid column for select %', selected_col;
            end if;
        end loop;
    end if;

    -- Apply consistent order to filters so the unique constraint on
    -- (subscription_id, entity, filters) can't be tricked by a different filter order
    new.filters = coalesce(
        array_agg(f order by f.column_name, f.op, f.value),
        '{}'
    ) from unnest(new.filters) f;

    -- Normalize selected_columns order so ARRAY['a','b'] and ARRAY['b','a'] are
    -- treated as the same subscription group in apply_rls
    new.selected_columns = (
        select array_agg(c order by c)
        from unnest(new.selected_columns) c
    );

    return new;
end;
$$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: wal2json_escape_identifier(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.wal2json_escape_identifier(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
  -- Prefix `\`, `,`, `.`, and any whitespace with `\`
  SELECT regexp_replace(name, '([\\,.[:space:]])', '\\\1', 'g')
$$;


ALTER FUNCTION realtime.wal2json_escape_identifier(name text) OWNER TO supabase_admin;

--
-- Name: allow_any_operation(text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_any_operation(expected_operations text[]) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT CASE
      WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
      ELSE raw_operation
    END AS current_operation
    FROM current_operation
  )
  SELECT EXISTS (
    SELECT 1
    FROM normalized n
    CROSS JOIN LATERAL unnest(expected_operations) AS expected_operation
    WHERE expected_operation IS NOT NULL
      AND expected_operation <> ''
      AND n.current_operation = CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END
  );
$$;


ALTER FUNCTION storage.allow_any_operation(expected_operations text[]) OWNER TO supabase_storage_admin;

--
-- Name: allow_only_operation(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_only_operation(expected_operation text) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT
      CASE
        WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
        ELSE raw_operation
      END AS current_operation,
      CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END AS requested_operation
    FROM current_operation
  )
  SELECT CASE
    WHEN requested_operation IS NULL OR requested_operation = '' THEN FALSE
    ELSE COALESCE(current_operation = requested_operation, FALSE)
  END
  FROM normalized;
$$;


ALTER FUNCTION storage.allow_only_operation(expected_operation text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Get the last path segment (the actual filename)
    SELECT _parts[array_length(_parts, 1)] INTO _filename;
    -- Extract extension: reverse, split on '.', then reverse again
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


ALTER FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint)::bigint as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text, sort_order text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.protect_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.protect_delete() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach (unchanged)
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT path_tokens[$1] AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $2 || '%%'
                  AND bucket_id = $3
                  AND array_length(objects.path_tokens, 1) <> $1
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT path_tokens[$1] AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $2 || '%%'
               AND bucket_id = $3
               AND array_length(objects.path_tokens, 1) = $1
             ORDER BY %I %s)
            LIMIT $4 OFFSET $5
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := split_part(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter), v_delimiter, levels);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := split_part(v_current.name, v_delimiter, levels);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    IF p_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        p_sort_column,
        v_cursor_op,
        p_sort_column,
        p_sort_order,
        p_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.custom_oauth_providers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    provider_type text NOT NULL,
    identifier text NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret text NOT NULL,
    acceptable_client_ids text[] DEFAULT '{}'::text[] NOT NULL,
    scopes text[] DEFAULT '{}'::text[] NOT NULL,
    pkce_enabled boolean DEFAULT true NOT NULL,
    attribute_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    authorization_params jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email_optional boolean DEFAULT false NOT NULL,
    issuer text,
    discovery_url text,
    skip_nonce_check boolean DEFAULT false NOT NULL,
    cached_discovery jsonb,
    discovery_cached_at timestamp with time zone,
    authorization_url text,
    token_url text,
    userinfo_url text,
    jwks_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT custom_oauth_providers_authorization_url_https CHECK (((authorization_url IS NULL) OR (authorization_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_authorization_url_length CHECK (((authorization_url IS NULL) OR (char_length(authorization_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_client_id_length CHECK (((char_length(client_id) >= 1) AND (char_length(client_id) <= 512))),
    CONSTRAINT custom_oauth_providers_discovery_url_length CHECK (((discovery_url IS NULL) OR (char_length(discovery_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_identifier_format CHECK ((identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text)),
    CONSTRAINT custom_oauth_providers_issuer_length CHECK (((issuer IS NULL) OR ((char_length(issuer) >= 1) AND (char_length(issuer) <= 2048)))),
    CONSTRAINT custom_oauth_providers_jwks_uri_https CHECK (((jwks_uri IS NULL) OR (jwks_uri ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_jwks_uri_length CHECK (((jwks_uri IS NULL) OR (char_length(jwks_uri) <= 2048))),
    CONSTRAINT custom_oauth_providers_name_length CHECK (((char_length(name) >= 1) AND (char_length(name) <= 100))),
    CONSTRAINT custom_oauth_providers_oauth2_requires_endpoints CHECK (((provider_type <> 'oauth2'::text) OR ((authorization_url IS NOT NULL) AND (token_url IS NOT NULL) AND (userinfo_url IS NOT NULL)))),
    CONSTRAINT custom_oauth_providers_oidc_discovery_url_https CHECK (((provider_type <> 'oidc'::text) OR (discovery_url IS NULL) OR (discovery_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_issuer_https CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NULL) OR (issuer ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_requires_issuer CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NOT NULL))),
    CONSTRAINT custom_oauth_providers_provider_type_check CHECK ((provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text]))),
    CONSTRAINT custom_oauth_providers_token_url_https CHECK (((token_url IS NULL) OR (token_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_token_url_length CHECK (((token_url IS NULL) OR (char_length(token_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_userinfo_url_https CHECK (((userinfo_url IS NULL) OR (userinfo_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_userinfo_url_length CHECK (((userinfo_url IS NULL) OR (char_length(userinfo_url) <= 2048)))
);


ALTER TABLE auth.custom_oauth_providers OWNER TO supabase_auth_admin;

--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: webauthn_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_challenges (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    challenge_type text NOT NULL,
    session_data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    CONSTRAINT webauthn_challenges_challenge_type_check CHECK ((challenge_type = ANY (ARRAY['signup'::text, 'registration'::text, 'authentication'::text])))
);


ALTER TABLE auth.webauthn_challenges OWNER TO supabase_auth_admin;

--
-- Name: webauthn_credentials; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_credentials (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    credential_id bytea NOT NULL,
    public_key bytea NOT NULL,
    attestation_type text DEFAULT ''::text NOT NULL,
    aaguid uuid,
    sign_count bigint DEFAULT 0 NOT NULL,
    transports jsonb DEFAULT '[]'::jsonb NOT NULL,
    backup_eligible boolean DEFAULT false NOT NULL,
    backed_up boolean DEFAULT false NOT NULL,
    friendly_name text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used_at timestamp with time zone
);


ALTER TABLE auth.webauthn_credentials OWNER TO supabase_auth_admin;

--
-- Name: merchant_product_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_product_prices (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    merchant_id uuid NOT NULL,
    template_product_id uuid,
    price numeric DEFAULT 0,
    is_available boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    all_merchant_product_id uuid,
    category_id uuid
);


ALTER TABLE public.merchant_product_prices OWNER TO postgres;

--
-- Name: merchants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchants (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    name text NOT NULL,
    phone text,
    service_type text NOT NULL,
    place_name text,
    address text,
    delivery_fee numeric DEFAULT 10,
    is_active boolean DEFAULT true,
    image_url text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    has_driver boolean DEFAULT false,
    name_ar text,
    name_en text
);


ALTER TABLE public.merchants OWNER TO postgres;

--
-- Name: template_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.template_products (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    image_url text,
    category text DEFAULT 'عام'::text,
    service_type text NOT NULL,
    is_approved boolean DEFAULT false,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    category_id uuid,
    price numeric DEFAULT 0
);


ALTER TABLE public.template_products OWNER TO postgres;

--
-- Name: all_merchant_products; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.all_merchant_products AS
 SELECT t.id,
    t.name,
    t.description,
    mpp.price,
    t.image_url,
    t.category,
    t.category_id,
    'approved'::text AS status,
    mpp.is_available,
    mpp.merchant_id,
    m.name AS merchant_name,
    t.service_type AS service_id,
    t.service_type AS service_name,
    mpp.created_at,
    mpp.created_at AS updated_at
   FROM ((public.template_products t
     JOIN public.merchant_product_prices mpp ON ((t.id = mpp.template_product_id)))
     JOIN public.merchants m ON ((mpp.merchant_id = m.id)))
  WHERE ((t.is_approved = true) AND (mpp.is_available = true));


ALTER VIEW public.all_merchant_products OWNER TO postgres;

--
-- Name: app_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_settings (
    id integer NOT NULL,
    splash_type text DEFAULT 'image'::text,
    splash_image_url text,
    splash_video_url text,
    splash_duration integer DEFAULT 3000,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    loading_type text DEFAULT 'image'::text,
    loading_video_url text,
    loading_image_url text,
    loading_gif_url text,
    splash_gif_url text,
    loading_duration integer DEFAULT 1500,
    loading_sound_url text,
    loading_sound_enabled boolean DEFAULT false,
    splash_sound_url text,
    splash_sound_enabled boolean DEFAULT false,
    app_version text DEFAULT 'ZID V1.0.0'::text,
    splash_text text DEFAULT 'مرحباً بك في زد'::text,
    splash_background_url text,
    app_logo_url text,
    duration_mode text DEFAULT 'auto'::text,
    splash_text_color text DEFAULT '#FFFFFF'::text,
    splash_bg_color text DEFAULT '#1a1a2e'::text,
    primary_color text DEFAULT '#4F46E5'::text,
    background_color text DEFAULT '#1a1a2e'::text,
    transparency integer DEFAULT 50,
    header_image_url text,
    background_image_url text,
    accent_color text DEFAULT '#8B5CF6'::text,
    header_color text DEFAULT '#4F46E5'::text,
    category_text_color text DEFAULT '#1F2937'::text,
    service_category_color text DEFAULT '#1F2937'::text,
    bg_opacity double precision DEFAULT 30,
    header_style_type text DEFAULT 'floating'::text,
    regions_icon text,
    assistant_icon_url text,
    card_opacity text DEFAULT '1.0'::text,
    customer_auth_opacity text DEFAULT '1.0'::text,
    customer_auth_background_url text,
    tab1_label text DEFAULT 'طلب'::text,
    tab1_icon text DEFAULT 'cart'::text,
    tab1_image text DEFAULT ''::text,
    tab2_label text DEFAULT 'عروض'::text,
    tab2_icon text DEFAULT 'pricetag'::text,
    tab2_image text DEFAULT ''::text,
    tab3_label text DEFAULT 'متجر Zid'::text,
    tab3_icon text DEFAULT 'storefront'::text,
    tab3_image text DEFAULT ''::text,
    tab4_label text DEFAULT 'طلباتي'::text,
    tab4_icon text DEFAULT 'list'::text,
    tab4_image text DEFAULT ''::text
);


ALTER TABLE public.app_settings OWNER TO postgres;

--
-- Name: app_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_settings_id_seq OWNER TO postgres;

--
-- Name: app_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_settings_id_seq OWNED BY public.app_settings.id;


--
-- Name: assistants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assistants (
    id integer NOT NULL,
    name text NOT NULL,
    specialty text,
    bio text,
    created_at timestamp with time zone DEFAULT now(),
    screen text,
    icon text,
    color text,
    "position" text,
    "order" integer DEFAULT 0,
    model text,
    role text DEFAULT 'general'::text,
    prompt text,
    service_id text,
    service_name text,
    is_active boolean DEFAULT true,
    welcome_message text,
    system_prompt text,
    updated_at timestamp without time zone,
    data_table text DEFAULT 'products'::text,
    data_columns text DEFAULT 'name, price, image_url'::text,
    data_filter text DEFAULT 'is_active = true'::text,
    service_display_name text,
    service_type_name text,
    service_description text,
    data_limit integer DEFAULT 50
);


ALTER TABLE public.assistants OWNER TO postgres;

--
-- Name: assistants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assistants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assistants_id_seq OWNER TO postgres;

--
-- Name: assistants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assistants_id_seq OWNED BY public.assistants.id;


--
-- Name: dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes (
    id bigint NOT NULL,
    restaurant_id bigint,
    name text NOT NULL,
    price numeric NOT NULL,
    description text,
    image_url text,
    created_at timestamp with time zone DEFAULT now(),
    merchant_id uuid,
    provider_id uuid,
    provider_type text,
    provider_name text,
    category text,
    ingredients text[],
    video_url text,
    rejection_reason text,
    is_available boolean DEFAULT true,
    status text DEFAULT 'pending'::text,
    merchant_name text,
    service_id text,
    images text[] DEFAULT '{}'::text[],
    updated_at timestamp without time zone DEFAULT now(),
    name_ar text,
    name_en text
);


ALTER TABLE public.dishes OWNER TO postgres;

--
-- Name: dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.dishes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.dishes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: full_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.full_services (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    service_id text NOT NULL,
    name text NOT NULL,
    icon text DEFAULT 'briefcase'::text,
    color text DEFAULT '#8B5CF6'::text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    image_url text
);


ALTER TABLE public.full_services OWNER TO postgres;

--
-- Name: home_chefs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_chefs (
    id bigint NOT NULL,
    name text,
    user_id uuid,
    bio text,
    image_url text,
    cover_image text,
    health_cert_url text,
    is_verified boolean DEFAULT false,
    specialties jsonb DEFAULT '[]'::jsonb,
    delivery_radius numeric DEFAULT 10,
    delivery_fee numeric DEFAULT 0,
    min_order numeric DEFAULT 0,
    is_active boolean DEFAULT true,
    dishes_count integer DEFAULT 0,
    rating numeric DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.home_chefs OWNER TO postgres;

--
-- Name: home_chefs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_chefs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_chefs_id_seq OWNER TO postgres;

--
-- Name: home_chefs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_chefs_id_seq OWNED BY public.home_chefs.id;


--
-- Name: item_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_prices (
    id bigint NOT NULL,
    item_id text,
    sub_service_name text,
    price double precision DEFAULT 0,
    qty integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone
);


ALTER TABLE public.item_prices OWNER TO postgres;

--
-- Name: item_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_prices_id_seq OWNER TO postgres;

--
-- Name: item_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_prices_id_seq OWNED BY public.item_prices.id;


--
-- Name: laundry_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laundry_items (
    id bigint NOT NULL,
    name text,
    iron_price numeric DEFAULT 0,
    clean_price numeric DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    image_url text,
    merchant_id text,
    description text,
    service_id text,
    prices jsonb DEFAULT '[]'::jsonb
);


ALTER TABLE public.laundry_items OWNER TO postgres;

--
-- Name: laundry_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.laundry_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.laundry_items_id_seq OWNER TO postgres;

--
-- Name: laundry_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.laundry_items_id_seq OWNED BY public.laundry_items.id;


--
-- Name: merchant_sub_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_sub_services (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    merchant_id uuid,
    sub_service_id uuid,
    is_active boolean DEFAULT true,
    show_title boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.merchant_sub_services OWNER TO postgres;

--
-- Name: offers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offers (
    id bigint NOT NULL,
    title text,
    description text,
    image_url text,
    is_approved boolean,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    merchant_id uuid,
    merchant_name text,
    service_type text,
    discount_percent integer,
    original_price numeric,
    offer_price numeric,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    status text DEFAULT 'pending'::text,
    admin_notes text,
    is_active boolean DEFAULT true,
    tour_package_details jsonb DEFAULT '{}'::jsonb
);


ALTER TABLE public.offers OWNER TO postgres;

--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.offers_id_seq OWNER TO postgres;

--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid,
    merchant_id uuid,
    driver_id uuid,
    total_price double precision DEFAULT 0,
    delivery_fee double precision DEFAULT 0,
    address_text text,
    location_lat double precision,
    location_lng double precision,
    payment_method text DEFAULT 'cash'::text,
    created_at timestamp with time zone DEFAULT now(),
    customer_name text,
    customer_phone text,
    merchant_name text,
    merchant_phone text,
    delivery_notes text,
    order_notes text,
    items jsonb DEFAULT '[]'::jsonb,
    "customerPhone" text,
    "serviceName" text,
    "serviceType" text,
    "totalPrice" numeric,
    description text,
    notes text,
    image_urls jsonb DEFAULT '[]'::jsonb,
    order_details jsonb DEFAULT '{}'::jsonb,
    pickup_fee numeric DEFAULT 0,
    has_pickup boolean DEFAULT false,
    pickup_address text,
    driver_name text,
    driver_phone text,
    merchant_place text,
    final_total numeric,
    subtotal numeric,
    voice_url text,
    raw_text text,
    updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
    accepted_at timestamp with time zone,
    customer_address text,
    service_name text,
    service_type text,
    delivered_at timestamp without time zone,
    cancelled_at timestamp without time zone,
    cancellation_reason text,
    price_set_at timestamp with time zone,
    driver_assigned_at timestamp with time zone,
    delivery_started_at timestamp with time zone,
    is_guest boolean DEFAULT false,
    guest_phone text,
    sub_service_id text,
    status text DEFAULT 'pending'::text,
    merchant_id_text text
);

ALTER TABLE ONLY public.orders REPLICA IDENTITY FULL;


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: otp_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otp_codes (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    phone text NOT NULL,
    code text NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.otp_codes OWNER TO postgres;

--
-- Name: places; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.places (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    address text,
    location_lat double precision,
    location_lng double precision,
    type text,
    is_assigned boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    merchant_id uuid,
    is_active boolean DEFAULT true,
    description text,
    merchant_name text,
    merchant_phone text,
    merchant_place text,
    phone text,
    updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()),
    image_url text,
    delivery_fee numeric DEFAULT 10
);


ALTER TABLE public.places OWNER TO postgres;

--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    service_id text,
    name text NOT NULL,
    image_url text,
    icon text DEFAULT 'cube'::text,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    name_en text,
    name_ar text
);


ALTER TABLE public.product_categories OWNER TO postgres;

--
-- Name: product_variants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variants (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    product_id uuid,
    name text NOT NULL,
    price numeric DEFAULT 0,
    display_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.product_variants OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    description text,
    price double precision DEFAULT 0 NOT NULL,
    image_url text,
    category text,
    service_id text,
    merchant_id uuid,
    is_available boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    status text DEFAULT 'pending'::text,
    rejection_reason text,
    merchant_name text,
    is_template boolean DEFAULT false,
    updated_at timestamp without time zone,
    rejectionreason text,
    video_url text,
    merchant_type text,
    service_name text,
    category_id uuid,
    name_ar text,
    name_en text,
    description_ar text,
    description_en text
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    full_name text NOT NULL,
    phone text NOT NULL,
    password text NOT NULL,
    role text DEFAULT 'user'::text,
    active boolean DEFAULT true,
    place_id uuid,
    place_name text,
    is_available boolean DEFAULT true,
    location_lat double precision,
    location_lng double precision,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    name text,
    service_area text,
    max_delivery_radius integer DEFAULT 10,
    health_cert_url text,
    merchant_type text,
    is_verified boolean DEFAULT false,
    verification_image text,
    verification_status text,
    rejection_reason text,
    business_license_url text,
    profile_completed boolean DEFAULT false,
    terms_accepted boolean DEFAULT false,
    terms_accepted_at timestamp without time zone,
    delivery_fee double precision DEFAULT 0,
    delivery_time integer DEFAULT 30,
    avatar_url text,
    average_rating double precision DEFAULT 0,
    reviews_count integer DEFAULT 0,
    address text,
    portfolio_images text[] DEFAULT '{}'::text[],
    bio text,
    avg_rating numeric DEFAULT 0,
    service_category text DEFAULT 'products'::text,
    bio_approved boolean DEFAULT false,
    portfolio_approved boolean DEFAULT false,
    image_url text,
    delivery_radius numeric DEFAULT 10,
    specialties text[] DEFAULT '{}'::text[],
    expo_push_token text,
    commercial_register text,
    tax_card text,
    image_approved boolean DEFAULT true,
    admin_level text DEFAULT 'basic'::text,
    image_url_pending text,
    documents jsonb DEFAULT '[]'::jsonb,
    documents_approved boolean DEFAULT false,
    region_id uuid,
    email text,
    firebase_uid text
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    name_en text,
    name_ar text
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: rest2_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rest2_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    image_url text,
    category text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    is_active boolean DEFAULT true,
    description text,
    service_id text,
    prices jsonb DEFAULT '[]'::jsonb,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.rest2_items OWNER TO postgres;

--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurants (
    id bigint NOT NULL,
    name text NOT NULL,
    image_url text,
    rating numeric DEFAULT 0,
    delivery_time text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.restaurants OWNER TO postgres;

--
-- Name: restaurants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.restaurants ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.restaurants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    order_id text,
    customer_id text,
    provider_id text,
    rating integer DEFAULT 0,
    comment text,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: service_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    name_en text,
    icon text,
    image_url text,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    name_ar text
);


ALTER TABLE public.service_categories OWNER TO postgres;

--
-- Name: service_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_fields (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    service_id text NOT NULL,
    field_name text NOT NULL,
    field_label text NOT NULL,
    field_type text DEFAULT 'text'::text,
    is_required boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    sub_service_name text,
    config jsonb DEFAULT '{}'::jsonb,
    sub_service_id uuid,
    field_options text[],
    is_visible boolean DEFAULT true,
    help_text text DEFAULT ''::text,
    placeholder text DEFAULT ''::text,
    show_when_field text,
    show_when_value text
);


ALTER TABLE public.service_fields OWNER TO postgres;

--
-- Name: service_fields_new; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_fields_new (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    sub_service_id uuid,
    field_name text NOT NULL,
    field_label text NOT NULL,
    field_type text DEFAULT 'text'::text NOT NULL,
    field_options text[] DEFAULT '{}'::text[],
    is_required boolean DEFAULT true,
    placeholder text,
    help_text text,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    show_when_field text,
    show_when_value text
);


ALTER TABLE public.service_fields_new OWNER TO postgres;

--
-- Name: service_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    service_id text NOT NULL,
    name text NOT NULL,
    image_url text,
    prices jsonb,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    item_sub_services jsonb,
    category text DEFAULT 'عام'::text,
    options jsonb DEFAULT '[]'::jsonb,
    price numeric DEFAULT 0,
    variant_prices jsonb DEFAULT '{}'::jsonb
);


ALTER TABLE public.service_items OWNER TO postgres;

--
-- Name: service_tracking_steps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_tracking_steps (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    service_id text,
    step_key text NOT NULL,
    label text NOT NULL,
    icon text DEFAULT 'time-outline'::text,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    image_url text,
    attachment_url text,
    description text
);


ALTER TABLE public.service_tracking_steps OWNER TO postgres;

--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id text NOT NULL,
    name text NOT NULL,
    type text DEFAULT 'regular'::text,
    screen text,
    icon text DEFAULT 'apps-outline'::text,
    color text DEFAULT '#6B7280'::text,
    category text DEFAULT 'other'::text,
    is_active boolean DEFAULT true,
    is_visible boolean DEFAULT true,
    has_items boolean DEFAULT false,
    has_pickup boolean DEFAULT false,
    items_collection text,
    sub_services jsonb DEFAULT '[]'::jsonb,
    image_url text,
    "order" integer DEFAULT 0,
    merchant_type text,
    merchant_role text DEFAULT 'merchant'::text,
    response_message text DEFAULT 'سيتم التواصل معك قريباً'::text,
    maintenance_text text DEFAULT 'جاري التحديث'::text,
    service_id text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    tracking_image text,
    has_video boolean DEFAULT false,
    items_type text DEFAULT 'products'::text,
    merchant_id uuid DEFAULT gen_random_uuid(),
    merchant_name text,
    header_image text,
    full_service_id uuid,
    tracking_icon_url text,
    data_table text,
    data_columns text DEFAULT 'name, price'::text,
    data_filter text DEFAULT 'is_active = true'::text,
    default_merchant_id uuid,
    product_source_type text DEFAULT 'service'::text,
    display_type text DEFAULT 'regular'::text,
    name_ar text,
    name_en text,
    description_ar text,
    description_en text
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: shop_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_products (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text,
    price numeric,
    image_url text,
    category text DEFAULT 'عام'::text,
    is_active boolean DEFAULT true,
    is_featured boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    images text[] DEFAULT '{}'::text[],
    description text,
    original_price numeric,
    discount_percent integer,
    updated_at timestamp with time zone,
    is_available boolean DEFAULT true
);


ALTER TABLE public.shop_products OWNER TO postgres;

--
-- Name: shop_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_reviews (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    product_id uuid,
    customer_name text,
    customer_id uuid,
    rating integer,
    comment text,
    created_at timestamp with time zone DEFAULT now(),
    is_approved boolean DEFAULT false,
    customer_image_url text
);


ALTER TABLE public.shop_reviews OWNER TO postgres;

--
-- Name: shop_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_settings (
    id integer NOT NULL,
    is_active boolean DEFAULT false,
    maintenance_message text DEFAULT 'المتجر قيد التجهيز'::text,
    banner_image text,
    banner_title text DEFAULT 'عروض خاصة'::text,
    banner_subtitle text DEFAULT 'خصومات ولفترة محدودة'::text,
    free_shipping boolean DEFAULT true,
    free_shipping_min_order numeric DEFAULT 200,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.shop_settings OWNER TO postgres;

--
-- Name: sub_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_services (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    full_service_id uuid,
    name text NOT NULL,
    description text,
    icon text DEFAULT 'document-text'::text,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    image_url text,
    show_title boolean DEFAULT true,
    tracking_icon_url text,
    name_ar text,
    name_en text
);


ALTER TABLE public.sub_services OWNER TO postgres;

--
-- Name: user_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tokens (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    expo_push_token text NOT NULL,
    platform text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.user_tokens OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_2026_06_07; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_06_07 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea,
    CONSTRAINT messages_payload_exclusive CHECK (((payload IS NULL) OR (binary_payload IS NULL)))
);


ALTER TABLE realtime.messages_2026_06_07 OWNER TO supabase_admin;

--
-- Name: messages_2026_06_08; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_06_08 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea,
    CONSTRAINT messages_payload_exclusive CHECK (((payload IS NULL) OR (binary_payload IS NULL)))
);


ALTER TABLE realtime.messages_2026_06_08 OWNER TO supabase_admin;

--
-- Name: messages_2026_06_09; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_06_09 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea,
    CONSTRAINT messages_payload_exclusive CHECK (((payload IS NULL) OR (binary_payload IS NULL)))
);


ALTER TABLE realtime.messages_2026_06_09 OWNER TO supabase_admin;

--
-- Name: messages_2026_06_10; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_06_10 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea,
    CONSTRAINT messages_payload_exclusive CHECK (((payload IS NULL) OR (binary_payload IS NULL)))
);


ALTER TABLE realtime.messages_2026_06_10 OWNER TO supabase_admin;

--
-- Name: messages_2026_06_11; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_06_11 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea,
    CONSTRAINT messages_payload_exclusive CHECK (((payload IS NULL) OR (binary_payload IS NULL)))
);


ALTER TABLE realtime.messages_2026_06_11 OWNER TO supabase_admin;

--
-- Name: messages_2026_06_12; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_06_12 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea,
    CONSTRAINT messages_payload_exclusive CHECK (((payload IS NULL) OR (binary_payload IS NULL)))
);


ALTER TABLE realtime.messages_2026_06_12 OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    selected_columns text[],
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb,
    metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: messages_2026_06_07; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_07 FOR VALUES FROM ('2026-06-07 00:00:00') TO ('2026-06-08 00:00:00');


--
-- Name: messages_2026_06_08; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_08 FOR VALUES FROM ('2026-06-08 00:00:00') TO ('2026-06-09 00:00:00');


--
-- Name: messages_2026_06_09; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_09 FOR VALUES FROM ('2026-06-09 00:00:00') TO ('2026-06-10 00:00:00');


--
-- Name: messages_2026_06_10; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_10 FOR VALUES FROM ('2026-06-10 00:00:00') TO ('2026-06-11 00:00:00');


--
-- Name: messages_2026_06_11; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_11 FOR VALUES FROM ('2026-06-11 00:00:00') TO ('2026-06-12 00:00:00');


--
-- Name: messages_2026_06_12; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_12 FOR VALUES FROM ('2026-06-12 00:00:00') TO ('2026-06-13 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: app_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_settings ALTER COLUMN id SET DEFAULT nextval('public.app_settings_id_seq'::regclass);


--
-- Name: assistants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistants ALTER COLUMN id SET DEFAULT nextval('public.assistants_id_seq'::regclass);


--
-- Name: home_chefs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_chefs ALTER COLUMN id SET DEFAULT nextval('public.home_chefs_id_seq'::regclass);


--
-- Name: item_prices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_prices ALTER COLUMN id SET DEFAULT nextval('public.item_prices_id_seq'::regclass);


--
-- Name: laundry_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laundry_items ALTER COLUMN id SET DEFAULT nextval('public.laundry_items_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
20260219120000
20260302000000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_challenges (id, user_id, challenge_type, session_data, created_at, expires_at) FROM stdin;
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_credentials (id, user_id, credential_id, public_key, attestation_type, aaguid, sign_count, transports, backup_eligible, backed_up, friendly_name, created_at, updated_at, last_used_at) FROM stdin;
\.


--
-- Data for Name: app_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_settings (id, splash_type, splash_image_url, splash_video_url, splash_duration, created_at, updated_at, loading_type, loading_video_url, loading_image_url, loading_gif_url, splash_gif_url, loading_duration, loading_sound_url, loading_sound_enabled, splash_sound_url, splash_sound_enabled, app_version, splash_text, splash_background_url, app_logo_url, duration_mode, splash_text_color, splash_bg_color, primary_color, background_color, transparency, header_image_url, background_image_url, accent_color, header_color, category_text_color, service_category_color, bg_opacity, header_style_type, regions_icon, assistant_icon_url, card_opacity, customer_auth_opacity, customer_auth_background_url, tab1_label, tab1_icon, tab1_image, tab2_label, tab2_icon, tab2_image, tab3_label, tab3_icon, tab3_image, tab4_label, tab4_icon, tab4_image) FROM stdin;
67	video	\N	https://ik.imagekit.io/vzuah6tku/Png/Project_05-17(1)(1)(1)_4K_HIGH_FR30.mp4?updatedAt=1779140142619	3000	2026-05-19 12:37:50.040117	2026-05-19 12:37:50.040117	image	\N	\N	\N	\N	1500	\N	f	\N	f	ZID V1.0.0	مرحباً بك في زد	\N	https://ik.imagekit.io/vzuah6tku/zayedid/pictures/appLogo_1779187416323_opbSPswBe.jpg	auto	#FFFFFF	#1a1a2e	#4F46E5	#1a1a2e	50	\N	\N	#8B5CF6	#4F46E5	#1F2937	#1F2937	30	floating	\N	\N	1.0	1.0	\N	طلب	cart		عروض	pricetag		متجر Zid	storefront		طلباتي	list	
66	video	\N	https://ik.imagekit.io/vzuah6tku/Png/Project_05-17(1)(1)(1)_4K_HIGH_FR30.mp4?updatedAt=1779140142619	3000	2026-05-19 12:35:35.707935	2026-05-19 12:35:35.707935	image	\N	\N	\N	\N	1500	\N	f	\N	f	ZID V1.0.0	مرحباً بك في زد	\N	https://ik.imagekit.io/vzuah6tku/zayedid/pictures/appLogo_1779187416323_opbSPswBe.jpg	auto	#FFFFFF	#1a1a2e	#4F46E5	#1a1a2e	50	\N	\N	#8B5CF6	#4F46E5	#1F2937	#1F2937	30	floating	\N	\N	1.0	1.0	\N	طلب	cart		عروض	pricetag		متجر Zid	storefront		طلباتي	list	
1	image	\N	\N	3000	2026-05-19 08:05:02.45414	2026-05-24 06:58:36.896	image	\N	\N	\N	\N	1500	\N	f	\N	f	ZID V1.0.0	مرحباً بك في زد	\N	https://ik.imagekit.io/vzuah6tku/zayedid/pictures/appLogo_1779341266852_UY1N_x9Sm.jpg	auto	#FFFFFF	#1a1a2e	#4F46E5	#FFFFFF	50	https://ik.imagekit.io/vzuah6tku/zayedid/pictures/headerImage_1779225906696_Wn23KSqew.jpg	https://ik.imagekit.io/vzuah6tku/zayedid/pictures/backgroundImage_1779605911298_A3qHCnIQI.jpg	#8B5CF6	#4F46E5	#1F2937	#1F2937	0.6	floating	https://ik.imagekit.io/vzuah6tku/zayedid/pictures/regionsIcon_1779187429988_Dd23JY6sX.jpg	https://ik.imagekit.io/vzuah6tku/zayedid/pictures/assistantIcon_1779341336641_NlPBJf8yT.jpg	1	1	https://ik.imagekit.io/vzuah6tku/zayedid/pictures/customerAuthBg_1779187307019_nZhWHPDrR.jpg	طلب	cart	https://ik.imagekit.io/vzuah6tku/tabs/tab_icon_1779290095879_o-sfV-l_z	عروض	pricetag	https://ik.imagekit.io/vzuah6tku/tabs/tab_icon_1779289435981_pzxTguFti	المتجر	storefront	https://ik.imagekit.io/vzuah6tku/tabs/tab_icon_1779289466870_9yYeDJ9vq	طلباتي	list	https://ik.imagekit.io/vzuah6tku/tabs/tab_icon_1779289479239_bFCOGHNoz
\.


--
-- Data for Name: assistants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assistants (id, name, specialty, bio, created_at, screen, icon, color, "position", "order", model, role, prompt, service_id, service_name, is_active, welcome_message, system_prompt, updated_at, data_table, data_columns, data_filter, service_display_name, service_type_name, service_description, data_limit) FROM stdin;
9	منجز المتجر	\N	\N	2026-05-16 05:34:29.185+00	eshop	chatbubble	#EC4899	bottom-right	0	openai/gpt-oss-20b	general	\N	\N	\N	t	اهلا بك في متجر Zid ، ازاي اقدر أساعدك..	{\n  "role": "system",\n  "content": "أنت \\"مُنْجِز\\"، المساعد الذكي والمستشار البيعي الشخصي لحساب \\"زيد\\" (نجوم زايد).\\n\\nأنت خدمة عملاء راقية وودودة.\\n\\n[أسلوبك]\\n- عامية مصرية محترمة، ودودة، وواضحة.\\n- ردودك مختصرة ومفيدة.\\n- استخدم إيموجي خفيف (🛍️ 🛒 ✅).\\n\\n[قواعد إضافة المنتجات - مهم جداً]\\n- لا تقول أبداً \\"تم إضافته\\" أو \\"أضفته\\" قبل استدعاء أداة add_product_to_cart بنجاح.\\n- عندما يظهر اهتمام العميل بمنتج، اسأله بهذه الصيغة بالظبط أو مشابهة جداً:\\n  \\"تحب أضيف [اسم المنتج] للسلة دلوقتي؟ لو موافق اكتب 'تمام' أو 'ضيف' 🛒\\"\\n\\n[قواعد استدعاء add_product_to_cart]\\nاستدعي الأداة فوراً فقط في الحالات دي:\\n- العميل يكتب \\"تمام\\" أو \\"ضيف\\" أو \\"ايوه\\" أو \\"نعم\\" أو \\"موافق\\" بعد سؤالك عن الإضافة.\\n- العميل يقول صراحة \\"أضف [المنتج]\\" أو \\"حطه في السلة\\" أو \\"عايز [المنتج]\\".\\n\\nبعد نجاح استدعاء الأداة، قل: \\"تمام، تم إضافة [اسم المنتج] للسلة بنجاح 🛒\\"\\n\\n[compare_products]\\nاستخدمها تلقائياً عند طلب المقارنة أو الحيرة بين منتجين أو أكثر.\\n\\nلا تخترع أي منتج أو سعر. كن لبقاً ومحترفاً دايماً."\n}	2026-06-01 15:23:26.025	shop_products	name, price, description, image_url, category	is_available::eq::true	\N	\N	\N	200
14	الشيف	\N	\N	2026-05-20 16:57:32.899+00	service	chatbubble	#4F46E5	bottom-right	0	llama-3.3-70b-versatile	general	\N	home_chef	الشيف المنزلي	t	أهلاً! أنا مُنجز. كيف أقدر أساعدك؟	أنت مساعد ذكي اسمك "مُنجز". رد بالعامية المصرية.	2026-05-20 16:58:21.018	all_merchant_products	name, price, description, image_url	home_chef	\N	\N	\N	100
15	منجز المطاعم	\N	\N	2026-05-24 21:18:29.706+00	service	chatbubble	#4F46E5	bottom-right	0	llama-3.3-70b-versatile	general	\N	restaurant	مطاعم	t	أهلاً! أنا مُنجز. كيف أقدر أساعدك؟	أنت مساعد ذكي اسمك "مُنجز". رد بالعامية المصرية.	2026-05-24 21:18:29.706	all_merchant_products	name, price, description, image_url	\N	\N	\N	\N	100
12	منجز السوبر ماركت	\N	\N	2026-05-16 21:18:42.473+00	service	chatbubble	#4F46E5	bottom-right	0	openai/gpt-oss-120b	general	\N	supermarket	سوبر ماركت	t	اهلا بك	أنت "مُنْجِز"، المساعد الذكي والمستشار البيعي الشخصي لحساب "زيد" \n\nأنت خدمة عملاء راقية وودودة.\n\n[أسلوبك]\n- عامية مصرية محترمة، ودودة، وواضحة.\n- ردودك مختصرة ومفيدة.\n- استخدم إيموجي خفيف (🛍️ 🛒 ✅).\n\n[قواعد إضافة المنتجات - مهم جداً]\n- لا تقول أبداً "تم إضافته" أو "أضفته" قبل استدعاء أداة add_product_to_cart بنجاح.\n- عندما يظهر اهتمام العميل بمنتج، اسأله بهذه الصيغة بالظبط: "تحب أضيف [اسم المنتج] للسلة دلوقتي؟ لو موافق اكتب 'تمام' أو 'ضيف' 🛒"\n\n[قواعد استدعاء add_product_to_cart]\nاستدعي الأداة فوراً فقط في الحالات دي:\n- العميل يكتب "تمام" أو "ضيف" أو "ايوه" أو "نعم" أو "موافق" بعد سؤالك عن الإضافة.\n- العميل يقول صراحة "أضف [المنتج]" أو "حطه في السلة" أو "عايز [المنتج]".\n\nبعد نجاح استدعاء الأداة، قل: "تمام، تم إضافة [اسم المنتج] للسلة بنجاح 🛒"\n\nلا تخترع أي منتج أو سعر. كن لبقاً ومحترفاً دايماً.\nوالتوصيل بيكون في خلال ٢٠ الي ٣٠ دقيقه	2026-05-28 17:14:18.862	all_merchant_products	id, name, price, description, image_url, merchant_id, service_id	service_id::eq::supermarket	\N	\N	\N	300
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dishes (id, restaurant_id, name, price, description, image_url, created_at, merchant_id, provider_id, provider_type, provider_name, category, ingredients, video_url, rejection_reason, is_available, status, merchant_name, service_id, images, updated_at, name_ar, name_en) FROM stdin;
3	\N	شاورما لحم سوري	140	لحم	\N	2026-03-28 19:53:24.157+00	\N	38b05fe8-9b97-4431-a5f9-76ab88323c70	restaurant	\N	\N	{}	https://ik.imagekit.io/vzuah6tku/zayedid/misc/dish_video_1774727573952_9RmL8ZHM7.mp4	\N	t	approved	\N	\N	{https://ik.imagekit.io/vzuah6tku/zayedid/misc/dish_1774727572471_ZnDWMWHBU.jpg}	2026-03-28 20:22:19.062	شاورما لحم سوري	شاورما لحم سوري
2	\N	شاورما سوري	120	عيش سوري	\N	2026-03-28 19:46:18.138+00	\N	38b05fe8-9b97-4431-a5f9-76ab88323c70	restaurant	\N	شاميه	{"لحم بلدي","عيش سوري"}	https://ik.imagekit.io/vzuah6tku/zayedid/misc/dish_video_1774727169429_PmSJk0CSl.mp4	\N	t	approved	\N	\N	{}	2026-03-28 20:22:22.969	شاورما سوري	شاورما سوري
1	\N	فراخ	500		\N	2026-03-27 05:40:51.435+00	\N	51108e8c-1e91-4eb8-aff1-7a45c6406760	restaurant	\N	\N	{}	\N	\N	t	approved	\N	\N	{}	2026-03-28 20:22:25.992	فراخ	فراخ
4	\N	فرخه متبله	300		\N	2026-04-08 17:00:26.19+00	\N	38b05fe8-9b97-4431-a5f9-76ab88323c70	restaurant	\N	\N	{فراخ,خبز}	\N	\N	t	approved	\N	\N	{}	2026-04-08 17:01:10.371	فرخه متبله	فرخه متبله
5	\N	برجر مكس	70		https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1776553944503_6xbxGNPL5.jpg	2026-04-18 23:12:27.358744+00	\N	38b05fe8-9b97-4431-a5f9-76ab88323c70	restaurant	مطعم انس	\N	\N	\N	\N	t	pending	\N	\N	{}	2026-04-18 23:12:27.358744	برجر مكس	برجر مكس
\.


--
-- Data for Name: full_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.full_services (id, service_id, name, icon, color, is_active, created_at, updated_at, image_url) FROM stdin;
c7205659-f582-40f1-9bbb-76dcfb40a337	delivery	توصيل طلبات	bicycle	#10B981	t	2026-05-01 11:00:48.470722+00	2026-05-01 11:00:48.470722+00	\N
9352bbce-8ae1-46e2-9964-2db4ce667326	travel	سياحة وسفر	briefcase	#8B5CF6	t	2026-04-30 07:31:09.186914+00	2026-05-03 04:31:14.62+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777560251186_5wqvCYGuh.jpg
\.


--
-- Data for Name: home_chefs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_chefs (id, name, user_id, bio, image_url, cover_image, health_cert_url, is_verified, specialties, delivery_radius, delivery_fee, min_order, is_active, dishes_count, rating, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: item_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_prices (id, item_id, sub_service_name, price, qty, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: laundry_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laundry_items (id, name, iron_price, clean_price, is_active, created_at, updated_at, image_url, merchant_id, description, service_id, prices) FROM stdin;
3	بنطلون	0	0	t	2026-03-20 08:25:01.978+00	2026-03-20 08:25:01.978+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1773995090362_KpcEsITxg.jpg	\N	\N	laundry	"[{\\"subService\\":\\"كي فقط\\",\\"price\\":25},{\\"subService\\":\\"كي وتنظيف\\",\\"price\\":35}]"
2	قميص	0	0	t	2026-03-20 08:24:15.895+00	2026-03-20 08:29:24.552+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1773994138237_wHN6YxhRIX.jpg	\N	\N	laundry	"[{\\"subService\\":\\"كي فقط\\",\\"price\\":20},{\\"subService\\":\\"كي وتنظيف\\",\\"price\\":30}]"
4	فستان	0	0	t	2026-03-24 10:23:10.466+00	2026-03-24 10:23:10.466+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774347773037__AQSAU9hR.jpg	\N	\N	\N	"[{\\"subService\\":\\"كي فقط\\",\\"price\\":30},{\\"subService\\":\\"غسيل وكوي\\",\\"price\\":45}]"
5	قميص	15	25	t	2026-03-25 12:54:11.302366+00	2026-03-25 12:54:11.302366+00	\N	\N	\N	\N	[]
6	بنطلون	20	30	t	2026-03-25 12:54:11.302366+00	2026-03-25 12:54:11.302366+00	\N	\N	\N	\N	[]
7	جاكيت	25	40	t	2026-03-25 12:54:11.302366+00	2026-03-25 12:54:11.302366+00	\N	\N	\N	\N	[]
8	بدلة	35	50	t	2026-03-25 12:54:11.302366+00	2026-03-25 12:54:11.302366+00	\N	\N	\N	\N	[]
9	فستان	30	45	t	2026-03-25 12:54:11.302366+00	2026-03-25 12:54:11.302366+00	\N	\N	\N	\N	[]
\.


--
-- Data for Name: merchant_product_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_product_prices (id, merchant_id, template_product_id, price, is_available, created_at, all_merchant_product_id, category_id) FROM stdin;
53735c5f-e417-4253-b3b3-1675d8d04525	ce1ba0b1-4e4a-44e6-a781-80f623a4c4e2	ebf31127-30c0-4295-9648-6b4016154d84	100	t	2026-05-26 14:24:32.876128+00	\N	\N
f54dd79d-3325-438f-93c9-9f95e1f6d830	18f24976-c616-4020-93ea-3eecbf105798	ebf31127-30c0-4295-9648-6b4016154d84	100	t	2026-05-26 14:24:32.876128+00	\N	\N
a65e9eba-9d8d-4356-8cb9-572da80b3d42	959f739f-5ae3-4811-a1ab-434012ff11e9	54fc22ee-475e-4faa-9852-e45f017b97c8	120	t	2026-05-26 14:24:32.876128+00	\N	\N
952ff618-d04c-48cc-ab23-e83a27b8a14a	42e2ac06-2524-42f2-9215-98ea3b4f3f56	54fc22ee-475e-4faa-9852-e45f017b97c8	120	t	2026-05-26 14:24:32.876128+00	\N	\N
eaf35c59-4558-4be8-be93-fd203a187398	1dae6ea9-580d-43ef-b657-4d398b4b4f44	54fc22ee-475e-4faa-9852-e45f017b97c8	120	t	2026-05-26 14:24:32.876128+00	\N	\N
953d6129-beaa-4251-bc2d-7bd72e199c70	959f739f-5ae3-4811-a1ab-434012ff11e9	e63d9711-a04b-4034-9098-bb6041d55cb3	90	t	2026-05-26 14:24:32.876128+00	\N	\N
db742635-fe16-497e-b3e8-21ee7c00e0fa	42e2ac06-2524-42f2-9215-98ea3b4f3f56	e63d9711-a04b-4034-9098-bb6041d55cb3	90	t	2026-05-26 14:24:32.876128+00	\N	\N
11b75734-f714-4b49-a978-fe2543c4505d	1dae6ea9-580d-43ef-b657-4d398b4b4f44	e63d9711-a04b-4034-9098-bb6041d55cb3	90	t	2026-05-26 14:24:32.876128+00	\N	\N
6be19695-fde7-4519-8e92-0de8ce0b69e0	959f739f-5ae3-4811-a1ab-434012ff11e9	ef41d5b3-3a0c-49e6-8b69-36fe59fe6651	45	t	2026-05-26 14:24:32.876128+00	\N	\N
cb90630e-bc1f-48cb-9ae0-00e9e9a03a31	42e2ac06-2524-42f2-9215-98ea3b4f3f56	ef41d5b3-3a0c-49e6-8b69-36fe59fe6651	45	t	2026-05-26 14:24:32.876128+00	\N	\N
1a837753-60a6-40e8-867e-9054108eaedf	1dae6ea9-580d-43ef-b657-4d398b4b4f44	ef41d5b3-3a0c-49e6-8b69-36fe59fe6651	45	t	2026-05-26 14:24:32.876128+00	\N	\N
d202b429-4aa7-420d-94e4-b7a7d2cc66ca	959f739f-5ae3-4811-a1ab-434012ff11e9	3e04bf55-5778-48d4-b7ac-3b919db52f9f	75	t	2026-05-26 14:24:32.876128+00	\N	\N
b34e42c5-9553-4fe6-88ea-4970f0baf9e2	42e2ac06-2524-42f2-9215-98ea3b4f3f56	3e04bf55-5778-48d4-b7ac-3b919db52f9f	75	t	2026-05-26 14:24:32.876128+00	\N	\N
a81d5206-07f1-40a2-b0d3-336fc4782eb2	1dae6ea9-580d-43ef-b657-4d398b4b4f44	3e04bf55-5778-48d4-b7ac-3b919db52f9f	75	t	2026-05-26 14:24:32.876128+00	\N	\N
2b2ead4c-6100-4a4d-9f2e-d7e3291e9e48	959f739f-5ae3-4811-a1ab-434012ff11e9	ed8b0f25-1bd6-4f20-b83a-09890cdef14e	80	t	2026-05-26 14:24:32.876128+00	\N	\N
61b81b3e-06eb-4779-8502-035cc23161ce	42e2ac06-2524-42f2-9215-98ea3b4f3f56	ed8b0f25-1bd6-4f20-b83a-09890cdef14e	80	t	2026-05-26 14:24:32.876128+00	\N	\N
d0fd3acc-6675-4472-b8aa-87efc2dc600c	1dae6ea9-580d-43ef-b657-4d398b4b4f44	ed8b0f25-1bd6-4f20-b83a-09890cdef14e	80	t	2026-05-26 14:24:32.876128+00	\N	\N
20eb55eb-eb17-40f9-a066-c7f13590f1e6	959f739f-5ae3-4811-a1ab-434012ff11e9	cb3c0177-8a35-40bc-9ac5-4b3a951f43d4	110	t	2026-05-26 14:24:32.876128+00	\N	\N
007e1c84-f46a-4051-a2ec-a700cc6d0af4	42e2ac06-2524-42f2-9215-98ea3b4f3f56	cb3c0177-8a35-40bc-9ac5-4b3a951f43d4	110	t	2026-05-26 14:24:32.876128+00	\N	\N
91d3290a-2ce0-4281-9161-921fde32835b	1dae6ea9-580d-43ef-b657-4d398b4b4f44	cb3c0177-8a35-40bc-9ac5-4b3a951f43d4	110	t	2026-05-26 14:24:32.876128+00	\N	\N
f44248b6-f092-49a9-b3d5-582de3d534d8	959f739f-5ae3-4811-a1ab-434012ff11e9	6032169d-633a-43de-91e3-eec39c15ad56	130	t	2026-05-26 14:24:32.876128+00	\N	\N
914d355b-c5a3-4cae-b9e4-d14164c8c1b4	42e2ac06-2524-42f2-9215-98ea3b4f3f56	6032169d-633a-43de-91e3-eec39c15ad56	130	t	2026-05-26 14:24:32.876128+00	\N	\N
56a57794-c452-4ae4-bc72-cf3d69ab824e	1dae6ea9-580d-43ef-b657-4d398b4b4f44	6032169d-633a-43de-91e3-eec39c15ad56	130	t	2026-05-26 14:24:32.876128+00	\N	\N
4f477210-34b5-4786-8dc0-0c96c9ae6e98	959f739f-5ae3-4811-a1ab-434012ff11e9	9bfd97b7-f803-45d2-a179-f3af1e535caf	20	t	2026-05-26 14:24:32.876128+00	\N	\N
a90a5a00-f98b-4881-8160-84761e484998	42e2ac06-2524-42f2-9215-98ea3b4f3f56	9bfd97b7-f803-45d2-a179-f3af1e535caf	20	t	2026-05-26 14:24:32.876128+00	\N	\N
dce75feb-7675-455b-a393-ada32dc76f6b	1dae6ea9-580d-43ef-b657-4d398b4b4f44	9bfd97b7-f803-45d2-a179-f3af1e535caf	20	t	2026-05-26 14:24:32.876128+00	\N	\N
6039e10d-1401-4d62-a08d-ed0c48c88b4f	959f739f-5ae3-4811-a1ab-434012ff11e9	b64e9c00-5df9-468f-9542-03ddf60ada2d	30	t	2026-05-26 14:24:32.876128+00	\N	\N
113200f8-d08a-4ca9-b90a-fabafa7b2973	42e2ac06-2524-42f2-9215-98ea3b4f3f56	b64e9c00-5df9-468f-9542-03ddf60ada2d	30	t	2026-05-26 14:24:32.876128+00	\N	\N
e5f431e1-84b8-4ff2-b774-ab1b0cee2378	1dae6ea9-580d-43ef-b657-4d398b4b4f44	b64e9c00-5df9-468f-9542-03ddf60ada2d	30	t	2026-05-26 14:24:32.876128+00	\N	\N
3058cf52-6fc1-4bb4-b9ca-39c40f8857a1	959f739f-5ae3-4811-a1ab-434012ff11e9	4f207a6b-b131-4e96-a36b-41f1f0080a85	35	t	2026-05-26 14:24:32.876128+00	\N	\N
f280eeee-9e1d-441e-afe2-6b6611a1ff58	42e2ac06-2524-42f2-9215-98ea3b4f3f56	4f207a6b-b131-4e96-a36b-41f1f0080a85	35	t	2026-05-26 14:24:32.876128+00	\N	\N
fed4a0eb-e7c1-4728-9cc7-e5ecd1ba45f4	1dae6ea9-580d-43ef-b657-4d398b4b4f44	4f207a6b-b131-4e96-a36b-41f1f0080a85	35	t	2026-05-26 14:24:32.876128+00	\N	\N
ef3f7a95-bf74-4eb5-8107-f89baacf2d2a	ce1ba0b1-4e4a-44e6-a781-80f623a4c4e2	f4d563fc-801c-420b-99e1-94c3a9acbf69	120	t	2026-05-26 14:24:32.876128+00	\N	\N
de732bed-ccd7-4c8e-ae5a-b4eab63790e2	18f24976-c616-4020-93ea-3eecbf105798	f4d563fc-801c-420b-99e1-94c3a9acbf69	120	t	2026-05-26 14:24:32.876128+00	\N	\N
15a5f195-7cae-4b8b-bd0e-af403e4cd4e2	ce1ba0b1-4e4a-44e6-a781-80f623a4c4e2	7560b86e-793c-4b8d-9960-aa46a3176c33	250	t	2026-05-26 14:24:32.876128+00	\N	\N
11690ca0-8e99-42c2-819b-2dadef15af26	18f24976-c616-4020-93ea-3eecbf105798	7560b86e-793c-4b8d-9960-aa46a3176c33	250	t	2026-05-26 14:24:32.876128+00	\N	\N
de9722f4-58de-4704-b95c-e074d1ea9fdd	ce1ba0b1-4e4a-44e6-a781-80f623a4c4e2	8869c4c1-e4dc-498e-a19d-c42cbad249db	95	t	2026-05-26 14:24:32.876128+00	\N	\N
a045fc9f-21f2-4a69-b0fc-72420a0cd252	18f24976-c616-4020-93ea-3eecbf105798	8869c4c1-e4dc-498e-a19d-c42cbad249db	95	t	2026-05-26 14:24:32.876128+00	\N	\N
e2427aa1-9591-4905-8af2-88fe0e7948d0	ce1ba0b1-4e4a-44e6-a781-80f623a4c4e2	f12d98f4-fb6d-4e1e-9e68-4954e2b76085	30	t	2026-05-26 14:24:32.876128+00	\N	\N
62bb0764-0a81-4b5c-8fec-2d4f624c22b6	18f24976-c616-4020-93ea-3eecbf105798	f12d98f4-fb6d-4e1e-9e68-4954e2b76085	30	t	2026-05-26 14:24:32.876128+00	\N	\N
09b5dee0-9a67-42a2-9960-bceb20251074	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	89acc8ed-850a-47f0-b821-3ad3316e36b0	50	t	2026-05-26 14:56:45.662747+00	\N	\N
6d7b9f25-4a8d-4082-aa84-fd6c830374ca	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	10067dc3-b750-4565-9a3b-d092a43746ef	50	t	2026-05-26 14:56:53.012697+00	\N	\N
b0f67030-4465-4caf-9e27-7d3c1392dbd4	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	cde42699-dfe2-46ab-8559-d643116ac769	50	t	2026-05-26 14:56:59.365796+00	\N	\N
5a89476b-f3c0-47b2-b1ef-f59374dbeedf	14c34717-0a25-4ed8-ad1b-df970d18b4dc	89acc8ed-850a-47f0-b821-3ad3316e36b0	55	t	2026-05-26 14:57:25.069769+00	\N	\N
b17c5cc2-5b25-4e80-b3c6-f2bc89d92226	14c34717-0a25-4ed8-ad1b-df970d18b4dc	10067dc3-b750-4565-9a3b-d092a43746ef	55	t	2026-05-26 14:57:32.397517+00	\N	\N
5505893e-ee70-4ffb-a460-107703a98b9c	14c34717-0a25-4ed8-ad1b-df970d18b4dc	cde42699-dfe2-46ab-8559-d643116ac769	55	t	2026-05-26 14:57:38.347155+00	\N	\N
\.


--
-- Data for Name: merchant_sub_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchant_sub_services (id, merchant_id, sub_service_id, is_active, show_title, created_at, updated_at) FROM stdin;
9500fcb5-8e57-40c5-ba8f-00edc225f036	ddf6af56-4979-46a5-a977-f01ce6ebaeec	20956352-1809-4e50-9a04-577781242eae	t	t	2026-05-05 14:56:00.239722+00	2026-05-05 14:56:04.713+00
\.


--
-- Data for Name: merchants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merchants (id, user_id, name, phone, service_type, place_name, address, delivery_fee, is_active, image_url, created_at, updated_at, has_driver, name_ar, name_en) FROM stdin;
1dae6ea9-580d-43ef-b657-4d398b4b4f44	1dae6ea9-580d-43ef-b657-4d398b4b4f44	الشيف	0100001234	home_chef	\N	\N	10	t	\N	2026-05-14 13:27:19.2098+00	2026-05-14 16:20:12.879328+00	f	الشيف	الشيف
af895294-c6d2-408b-9fbb-4f84b04c29b6	af895294-c6d2-408b-9fbb-4f84b04c29b6	مكوجي مهندسين	01299999999	dryclean		\N	30	t		2026-05-07 15:23:42.114872+00	2026-05-07 17:08:27.168385+00	f	مكوجي مهندسين	مكوجي مهندسين
09658374-d84c-4aab-a672-2db1ee353dc3	09658374-d84c-4aab-a672-2db1ee353dc3	Test	+201033343334	sabak	\N	\N	10	t	\N	2026-05-28 20:00:37.442947+00	2026-05-28 20:00:37.442947+00	f	Test	Test
18f24976-c616-4020-93ea-3eecbf105798	18f24976-c616-4020-93ea-3eecbf105798	حضرموت ٢	+201066666667	restaurant		\N	10	t		2026-05-24 20:45:26.33604+00	2026-05-28 22:43:22.288628+00	f	حضرموت ٢	حضرموت ٢
42e2ac06-2524-42f2-9215-98ea3b4f3f56	42e2ac06-2524-42f2-9215-98ea3b4f3f56	الشيف حسن	01022222222	home_chef		\N	50	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/الشيف_حسن/misc/merchant_42e2ac06-2524-42f2-9215-98ea3b4f3f56_1778074951717_G7nz74zQl.jpg	2026-05-06 13:41:07.650906+00	2026-05-09 19:06:15.087507+00	f	الشيف حسن	الشيف حسن
ce1ba0b1-4e4a-44e6-a781-80f623a4c4e2	ce1ba0b1-4e4a-44e6-a781-80f623a4c4e2	مطعم حضرموت	+201066666665	restaurant		\N	30	t		2026-05-24 20:44:50.079502+00	2026-05-28 22:43:48.795326+00	f	مطعم حضرموت	مطعم حضرموت
d87ca828-707e-485b-a81a-0428102f5ab4	d87ca828-707e-485b-a81a-0428102f5ab4	مترو ماركت	+201033333333	supermarket		\N	60	t		2026-05-17 06:16:10.600171+00	2026-05-28 22:44:12.943498+00	f	مترو ماركت	مترو ماركت
ddf6af56-4979-46a5-a977-f01ce6ebaeec	ddf6af56-4979-46a5-a977-f01ce6ebaeec	Thomas Cook Tours	+201000000001	travel		\N	10	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/thomas_cook_tours/profile/profile_1778014659036_yMNxJaxtH.jpg	2026-05-05 08:34:22.695468+00	2026-05-28 22:44:38.967612+00	f	Thomas Cook Tours	Thomas Cook Tours
cb273744-cf70-486d-b6e1-8c1c4932b140	cb273744-cf70-486d-b6e1-8c1c4932b140	مكوجي	+201099999999	dryclean		\N	40	t		2026-05-07 15:20:21.798484+00	2026-05-28 22:45:11.125451+00	f	مكوجي	مكوجي
959f739f-5ae3-4811-a1ab-434012ff11e9	959f739f-5ae3-4811-a1ab-434012ff11e9	Joe	+201200000000	home_chef		\N	3596	t		2026-05-09 19:13:31.299151+00	2026-05-28 22:45:26.429538+00	f	Joe	Joe
86946b4a-6c91-48d3-b6f9-4c7d7fbfc422	86946b4a-6c91-48d3-b6f9-4c7d7fbfc422	ترافيل فيو للسياحة	+201045645645	travel	\N	\N	10	t	\N	2026-05-30 14:20:04.397155+00	2026-05-30 14:21:11.344743+00	f	\N	\N
f8def2bc-f443-454d-b6c3-be460dcbc289	f8def2bc-f443-454d-b6c3-be460dcbc289	مكوجي	+201099999999	dryclean	\N	\N	10	t	\N	2026-06-09 01:39:41.651139+00	2026-06-09 01:39:41.651139+00	f	\N	\N
14c34717-0a25-4ed8-ad1b-df970d18b4dc	14c34717-0a25-4ed8-ad1b-df970d18b4dc	الهواري	+201022222222	supermarket		\N	10	t		2026-05-12 14:01:09.558576+00	2026-05-28 22:45:38.191967+00	f	الهواري	الهواري
cd392e2f-7c36-41e6-b98f-e81ffc3dc013	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	صن شاين	+201011111111	supermarket		\N	50	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/صن_شاين/misc/merchant_cd392e2f-7c36-41e6-b98f-e81ffc3dc013_1778001793590_NTF-0X7C8.jpg	2026-05-05 11:00:37.74374+00	2026-06-09 01:48:06.609833+00	t	صن شاين	صن شاين
\.


--
-- Data for Name: offers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offers (id, title, description, image_url, is_approved, created_at, updated_at, merchant_id, merchant_name, service_type, discount_percent, original_price, offer_price, start_date, end_date, status, admin_notes, is_active, tour_package_details) FROM stdin;
3	توصيل مجاني على خدمات المكوجي	ساري من يوم ١ مايو حتى ٥ مايو	https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777218619739_iP6B85CGN.jpg	\N	2026-04-26 15:50:27.006+00	2026-04-26 15:50:56.082+00	\N	إدارة Zid		\N	\N	\N	\N	\N	approved		t	{}
2	سندويتش برجر ب ٨٠ جنية بدلا من ١٠٠ جنية	هذا العرض ساري لفترة محدودة	https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777215794311_X3_GEPYkP.jpg	\N	2026-04-26 15:03:58.993+00	2026-04-26 16:49:36.082+00	c264e47a-f655-4db5-af8d-f6b12058118d	شيف	home_chef	20	100	80	\N	\N	approved		t	{}
1	خصم 20% على خدمة التنظيف	هذا العرض ساري حتى يوم الخميس ١٢ مايو	https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777217507854_1R_TEt8D1.jpg	\N	2026-04-26 14:23:28.936+00	2026-04-26 16:50:13.662+00	c264e47a-f655-4db5-af8d-f6b12058118d	شيف	home_chef	20	100	80	\N	\N	approved		t	{}
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, merchant_id, driver_id, total_price, delivery_fee, address_text, location_lat, location_lng, payment_method, created_at, customer_name, customer_phone, merchant_name, merchant_phone, delivery_notes, order_notes, items, "customerPhone", "serviceName", "serviceType", "totalPrice", description, notes, image_urls, order_details, pickup_fee, has_pickup, pickup_address, driver_name, driver_phone, merchant_place, final_total, subtotal, voice_url, raw_text, updated_at, accepted_at, customer_address, service_name, service_type, delivered_at, cancelled_at, cancellation_reason, price_set_at, driver_assigned_at, delivery_started_at, is_guest, guest_phone, sub_service_id, status, merchant_id_text) FROM stdin;
73b217b6-30b3-4462-9036-97eea50d1821	7930f3c1-261b-4f96-bd6b-8090c1529925	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	100	50	\N	\N	\N	cash_on_delivery	2026-06-09 02:03:24.202964+00	Sharo	+201033833119	صن شاين	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 50 ج", "جبنة رومي قديمة x1 = 50 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	150	\N	\N	\N	2026-06-09 02:03:48.414913+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	preparing	\N
8b55da79-d5aa-4db7-a49c-107e33ace0be	7930f3c1-261b-4f96-bd6b-8090c1529925	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	110	10	\N	\N	\N	cash_on_delivery	2026-06-09 02:13:54.407191+00	Sharo	+201033833119	الهواري	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 55 ج", "جبنة رومي قديمة x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	120	\N	\N	\N	2026-06-09 02:14:06.463307+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	preparing	\N
9a2661cf-60ab-4eba-9887-8ae6764fab2f	7930f3c1-261b-4f96-bd6b-8090c1529925	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	110	10	\N	\N	\N	cash_on_delivery	2026-06-09 02:16:46.481452+00	Sharo	+201033833119	الهواري	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 55 ج", "جبنة رومي قديمة x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	120	\N	\N	\N	2026-06-09 02:16:54.670489+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	preparing	\N
fb635fc0-5d18-4ffc-ab5b-b24acff4b39c	7930f3c1-261b-4f96-bd6b-8090c1529925	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	150	50	\N	\N	\N	cash_on_delivery	2026-06-09 02:26:34.571001+00	Sharo	+201033833119	صن شاين	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 50 ج", "جبنة رومي قديمة x1 = 50 ج", "أرز بسمتي هندي 1 كجم x1 = 50 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	200	\N	\N	\N	2026-06-09 02:27:00.857807+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
ebe8d757-5c81-491e-935a-30966160c6d1	7930f3c1-261b-4f96-bd6b-8090c1529925	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	100	50	\N	\N	\N	cash_on_delivery	2026-06-09 01:47:52.089093+00	Sharo	+201033833119	صن شاين	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 50 ج", "جبنة رومي قديمة x1 = 50 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	150	\N	\N	\N	2026-06-09 01:48:48.68248+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
81e2d711-c0a7-44d1-9389-c1035f46d492	7930f3c1-261b-4f96-bd6b-8090c1529925	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	110	10	\N	\N	\N	cash_on_delivery	2026-06-09 01:48:54.557979+00	Sharo	+201033833119	الهواري	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 55 ج", "جبنة رومي قديمة x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	120	\N	\N	\N	2026-06-09 01:49:05.57053+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	preparing	\N
7a46d755-6cfa-46c2-8f50-a35a93ca7999	7930f3c1-261b-4f96-bd6b-8090c1529925	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	100	50	\N	\N	\N	cash_on_delivery	2026-06-09 01:49:33.345965+00	Sharo	+201033833119	صن شاين	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 50 ج", "جبنة رومي قديمة x1 = 50 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	150	\N	\N	\N	2026-06-09 01:50:15.537398+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
8b93ae4e-7456-4916-814d-4531b4d3f661	7930f3c1-261b-4f96-bd6b-8090c1529925	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	110	10	\N	\N	\N	cash_on_delivery	2026-06-09 01:49:34.013577+00	Sharo	+201033833119	الهواري	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 55 ج", "جبنة رومي قديمة x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	120	\N	\N	\N	2026-06-09 01:50:15.687749+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
4037d2be-2d67-4d52-be27-20313dc32704	7930f3c1-261b-4f96-bd6b-8090c1529925	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	100	50	\N	\N	\N	cash_on_delivery	2026-06-09 01:56:11.733527+00	Sharo	+201033833119	صن شاين	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 50 ج", "جبنة رومي قديمة x1 = 50 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	150	\N	\N	\N	2026-06-09 01:57:06.178624+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
5adccc04-82e8-4796-954e-af7747584473	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	10	0	\N	\N	\N	cash_on_delivery	2026-06-08 19:06:58.222521+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	Ganna	مكوجي	dryclean	\N	2026-06-08 19:09:00.554	تم الإلغاء بواسطة العميل	\N	\N	\N	f	\N	\N	cancelled	\N
84c4393d-d26d-4e1e-8b60-f283ce4ca0b1	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	10	0	\N	\N	\N	cash_on_delivery	2026-06-08 22:37:23.031008+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	H	\N	\N	\N	f	\N	\N	cancelled	\N
59212067-769f-4cc1-a4ab-769d693281cf	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	10	0	\N	\N	\N	cash_on_delivery	2026-06-08 22:44:13.193083+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	H	\N	\N	\N	f	\N	\N	cancelled	\N
b0851be7-6389-46a2-8583-a6a620d21a9e	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	10	0	\N	\N	\N	cash_on_delivery	2026-06-08 22:44:55.176836+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	H	\N	\N	\N	f	\N	\N	cancelled	\N
906fd339-458b-4f21-99db-a9a45abd4714	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	10	0	\N	\N	\N	cash_on_delivery	2026-06-09 00:26:05.559502+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	2026-06-09 00:26:25.634	رفض بواسطة التاجر	\N	\N	\N	f	\N	\N	cancelled	\N
e6240763-fb07-4139-bd71-bbb9114e7467	7930f3c1-261b-4f96-bd6b-8090c1529925	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	110	10	\N	\N	\N	cash_on_delivery	2026-06-09 02:03:25.023729+00	Sharo	+201033833119	الهواري	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 55 ج", "جبنة رومي قديمة x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	120	\N	\N	\N	2026-06-09 02:03:44.740355+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	preparing	\N
de4e6bba-c286-4e5d-afda-0be4123aa878	7930f3c1-261b-4f96-bd6b-8090c1529925	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	100	50	\N	\N	\N	cash_on_delivery	2026-06-09 01:55:20.712388+00	Sharo	+201033833119	صن شاين	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 50 ج", "جبنة رومي قديمة x1 = 50 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	150	\N	\N	\N	2026-06-09 01:55:47.948769+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
5ecd56d9-1497-4584-8b14-514ad1121482	7930f3c1-261b-4f96-bd6b-8090c1529925	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	110	10	\N	\N	\N	cash_on_delivery	2026-06-09 01:55:23.280577+00	Sharo	+201033833119	الهواري	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 55 ج", "جبنة رومي قديمة x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	120	\N	\N	\N	2026-06-09 01:55:55.097859+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	cancelled	\N
91e5b00a-c034-45e4-aabf-8eb49bc1b229	7930f3c1-261b-4f96-bd6b-8090c1529925	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	110	10	\N	\N	\N	cash_on_delivery	2026-06-09 01:56:12.51523+00	Sharo	+201033833119	الهواري	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 55 ج", "جبنة رومي قديمة x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	120	\N	\N	\N	2026-06-09 01:57:06.330455+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
3716d98c-8dbc-4a23-8226-02de82c0aa4e	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	60	0	\N	\N	\N	cash_on_delivery	2026-06-09 00:55:06.673633+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x2 = 20ج", "بنطلون (كي وتنظيف) x2 = 40ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	H	\N	\N	\N	f	\N	\N	cancelled	\N
16ea3432-8e16-447c-811b-3dae11edf59a	7930f3c1-261b-4f96-bd6b-8090c1529925	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	110	10	\N	\N	\N	cash_on_delivery	2026-06-09 01:47:52.782809+00	Sharo	+201033833119	الهواري	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 55 ج", "جبنة رومي قديمة x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	120	\N	\N	\N	2026-06-09 01:48:48.839981+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
9d92287b-453b-4af9-95bb-c515a28ab7ef	7930f3c1-261b-4f96-bd6b-8090c1529925	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	100	50	\N	\N	\N	cash_on_delivery	2026-06-09 01:48:53.881285+00	Sharo	+201033833119	صن شاين	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 50 ج", "جبنة رومي قديمة x1 = 50 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	150	\N	\N	\N	2026-06-09 01:49:16.254067+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	starting	\N
5f657717-dd76-43b0-9cef-7c24e80aac5b	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	10	0	\N	\N	\N	cash_on_delivery	2026-06-09 00:54:48.208755+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	H	\N	\N	\N	f	\N	\N	cancelled	\N
7c01b371-f45f-479c-86af-00c78c7dd1a5	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	30	0	\N	\N	\N	cash_on_delivery	2026-06-09 01:17:26.37855+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج", "بنطلون (كي وتنظيف) x1 = 20ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	2026-06-09 01:17:29.862	رفض بواسطة التاجر	\N	\N	\N	f	\N	\N	cancelled	\N
0deef5e2-69a4-4983-8204-df3ddc3c9757	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	70	0	\N	\N	\N	cash_on_delivery	2026-06-09 01:24:35.325886+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج", "بنطلون (كي وتنظيف) x3 = 60ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	H	\N	\N	\N	f	\N	\N	cancelled	\N
9a9961ba-734f-496f-8948-46d00ea748dc	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	20	0	\N	\N	\N	cash_on_delivery	2026-06-09 01:34:07.268655+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي وتنظيف) x1 = 20ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	H	\N	\N	\N	f	\N	\N	cancelled	\N
0a9a5cc6-d8ad-4a07-a5b4-0217e82b5767	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	30	0	\N	\N	\N	cash_on_delivery	2026-06-09 01:35:08.929722+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x3 = 30ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	Hhh	\N	\N	\N	f	\N	\N	cancelled	\N
d3eaa741-ad05-443c-8664-c9d650115b8b	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	10	0	\N	\N	\N	cash_on_delivery	2026-06-09 01:37:07.753785+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	\N	\N	\N	\N	f	\N	\N	pending	\N
023fee38-1410-4575-9d00-374b6bf93a71	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	30	0	\N	\N	\N	cash_on_delivery	2026-06-08 19:18:49.992161+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج", "بنطلون (كي وتنظيف) x1 = 20ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	Ganna	مكوجي	dryclean	\N	\N	Ni	\N	\N	\N	f	\N	\N	cancelled	\N
b138a613-98b7-4c5e-98ca-57436b177a41	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	30	0	\N	\N	\N	cash_on_delivery	2026-06-08 19:19:50.824754+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج", "بنطلون (كي وتنظيف) x1 = 20ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	Ganna	مكوجي	dryclean	\N	\N	No	\N	\N	\N	f	\N	\N	cancelled	\N
a5052756-9e7a-439d-aab3-85dfc139f234	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	30	0	\N	\N	\N	cash_on_delivery	2026-06-08 19:21:11.630131+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج", "بنطلون (كي وتنظيف) x1 = 20ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	No	\N	\N	\N	f	\N	\N	cancelled	\N
3a527939-c85f-43e8-9cdd-6018e0fe0c1b	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	30	0	\N	\N	\N	cash_on_delivery	2026-06-08 19:33:03.110973+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج", "بنطلون (كي وتنظيف) x1 = 20ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	Hh	\N	\N	\N	f	\N	\N	cancelled	\N
3e66268b-361b-4ff3-9d8b-e24f7657d9e1	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	10	0	\N	\N	\N	cash_on_delivery	2026-06-08 20:02:06.101166+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	H	\N	\N	\N	f	\N	\N	cancelled	\N
c0d0bc31-191c-430f-afd1-f21c9d9ddca3	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	10	0	\N	\N	\N	cash_on_delivery	2026-06-08 22:11:50.827405+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	H	\N	\N	\N	f	\N	\N	cancelled	\N
2a7eefcb-cf8d-42d9-a6af-0dea0fc2f3a6	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	110	0	\N	\N	\N	cash_on_delivery	2026-06-09 01:38:17.449951+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x11 = 110ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	Hh	مكوجي	dryclean	\N	\N	\N	\N	\N	\N	f	\N	\N	pending	\N
38d64c47-df6a-409a-bbbd-0ae66cb6edcb	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	20	0	\N	\N	\N	cash_on_delivery	2026-06-08 20:12:06.331749+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي وتنظيف) x1 = 20ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	H	\N	\N	\N	f	\N	\N	cancelled	\N
846cb7de-d4f9-4fd5-b3f8-805d03daffc8	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	10	0	\N	\N	\N	cash_on_delivery	2026-06-08 22:22:22.682773+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	\N	\N	\N	\N	f	\N	\N	accepted	\N
5b75e442-79ef-4d40-a8ae-d58b0ea483da	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	10	0	\N	\N	\N	cash_on_delivery	2026-06-08 22:27:37.047107+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	H	\N	\N	\N	f	\N	\N	cancelled	\N
c7b0e482-3fe7-42b7-a48d-186898d68f11	\N	f8def2bc-f443-454d-b6c3-be460dcbc289	\N	10	0	\N	\N	\N	cash_on_delivery	2026-06-09 01:44:35.979561+00	Sharo	+201033833119	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-09 01:58:41.025625+00	\N	H	مكوجي	dryclean	\N	\N	\N	\N	\N	\N	f	\N	\N	pending	\N
813ee372-208d-4a82-8b65-aee2125f42e8	7930f3c1-261b-4f96-bd6b-8090c1529925	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	100	50	\N	\N	\N	cash_on_delivery	2026-06-09 02:13:53.382854+00	Sharo	+201033833119	صن شاين	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 50 ج", "جبنة رومي قديمة x1 = 50 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	150	\N	\N	\N	2026-06-09 02:14:04.100929+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	preparing	\N
0820b7b7-ef3d-42ea-84ec-8f9b2055c0f2	7930f3c1-261b-4f96-bd6b-8090c1529925	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	100	50	\N	\N	\N	cash_on_delivery	2026-06-09 02:16:45.795142+00	Sharo	+201033833119	صن شاين	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 50 ج", "جبنة رومي قديمة x1 = 50 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	150	\N	\N	\N	2026-06-09 02:16:57.039705+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	preparing	\N
e8872ef5-de58-4a16-97ee-74a059f321f5	7930f3c1-261b-4f96-bd6b-8090c1529925	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	100	50	\N	\N	\N	cash_on_delivery	2026-06-09 01:58:55.552916+00	Sharo	+201033833119	صن شاين	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 50 ج", "جبنة رومي قديمة x1 = 50 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	150	\N	\N	\N	2026-06-09 01:59:15.962645+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
b919f74b-9a3e-4599-8835-98414f8e7260	7930f3c1-261b-4f96-bd6b-8090c1529925	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	110	10	\N	\N	\N	cash_on_delivery	2026-06-09 01:58:56.793328+00	Sharo	+201033833119	الهواري	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 55 ج", "جبنة رومي قديمة x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	120	\N	\N	\N	2026-06-09 01:59:16.10155+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
8221cc66-07be-4392-a60a-624c531ee698	7930f3c1-261b-4f96-bd6b-8090c1529925	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	165	10	\N	\N	\N	cash_on_delivery	2026-06-09 02:26:33.790394+00	Sharo	+201033833119	الهواري	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 55 ج", "جبنة رومي قديمة x1 = 55 ج", "أرز بسمتي هندي 1 كجم x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	175	\N	\N	\N	2026-06-09 02:27:00.721234+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
1f64e0c0-3045-44c0-bfcb-b389798ea22c	7930f3c1-261b-4f96-bd6b-8090c1529925	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	100	50	\N	\N	\N	cash_on_delivery	2026-06-09 01:59:18.906855+00	Sharo	+201033833119	صن شاين	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 50 ج", "جبنة رومي قديمة x1 = 50 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	150	\N	\N	\N	2026-06-09 01:59:43.082135+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
6163cd20-71ea-4ecf-9610-ab571957918d	7930f3c1-261b-4f96-bd6b-8090c1529925	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	110	10	\N	\N	\N	cash_on_delivery	2026-06-09 01:59:19.793022+00	Sharo	+201033833119	الهواري	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1 = 55 ج", "جبنة رومي قديمة x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	120	\N	\N	\N	2026-06-09 01:59:43.220269+00	\N	Hh	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	cancelled	\N
\.


--
-- Data for Name: otp_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.otp_codes (id, phone, code, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.places (id, name, address, location_lat, location_lng, type, is_assigned, created_at, merchant_id, is_active, description, merchant_name, merchant_phone, merchant_place, phone, updated_at, image_url, delivery_fee) FROM stdin;
be964b07-07d8-46cc-9ac8-028877f1907c	مكوجي شحاته		\N	\N	laundry	f	2026-04-25 01:34:29.065+00	\N	t	\N	\N	\N	\N		2026-04-25 02:09:26.96+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777080866984_QVW3DY7Sx.jpg	10
fb8ec20e-b7d4-4def-bb25-a6579c9efac7	مخبز المدينة		\N	\N	bakery	f	2026-03-24 12:17:50.045+00	\N	t	\N	\N	\N	\N		2026-04-22 22:04:10.363+00	\N	10
22d9c566-63ea-4336-b90b-373fb731daf0	مطعم انس		\N	\N	restaurant	f	2026-03-27 04:29:47.967+00	\N	t	\N	\N	\N	\N		2026-03-27 04:29:47.967+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774585778515_Z_IwNCDa3.jpg	10
3c325912-2982-472f-b46b-6d50b18bb25d	مطعم الشامي		\N	\N	restaurant	f	2026-03-27 04:29:20.116+00	\N	t	\N	\N	\N	\N		2026-03-27 04:29:20.116+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774585746948_SN7UHPGJY.jpg	10
3e74b027-1470-467f-9914-e863a6483634	صيدلة الدكتور بوني		\N	\N	pharmacy	f	2026-03-23 18:13:11.68+00	\N	t	\N	\N	\N	\N		2026-03-23 18:13:49.883+00	\N	10
45ac0789-49ef-4a88-ad5c-dd90f1c2908e	سامح النجار		\N	\N	wood	f	2026-03-22 22:39:02.949+00	\N	t	\N	\N	\N	\N		2026-03-23 01:15:52.838+00	\N	10
728c8bb1-559e-4220-bc98-9225949d6dbf	سوبر ماركت صن شاين		\N	\N	supermarket	f	2026-03-23 18:28:01.518+00	\N	t	\N	\N	\N	\N		2026-04-26 11:40:56.289+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774503718703_Ljlq9UJBQ.jpg	10
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categories (id, service_id, name, image_url, icon, sort_order, is_active, created_at, updated_at, name_en, name_ar) FROM stdin;
f27e5b90-1271-4388-b590-48d1e31e9c46	supermarket	بقوليات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777994005104_C_VhC6MGh.jpg	sparkles	5	t	2026-05-05 15:13:42.115+00	2026-05-05 15:13:42.115+00	بقوليات	بقوليات
61487a79-87a4-4900-b8a1-17d1d9a1b58e	eshop	هدايا	https://ik.imagekit.io/vzuah6tku/zayedid/misc/category_1779647016078_h9sEsW95C.jpg	folder-outline	1	t	2026-05-24 17:42:48.167+00	2026-05-24 18:23:41.816+00	هدايا	هدايا
0f1ae380-b2ca-48d6-9fa1-ba5119592553	eshop	ملابس	https://ik.imagekit.io/vzuah6tku/zayedid/misc/category_1779647327250_fTNNm3ehe.jpg	folder-outline	2	t	2026-05-24 17:43:34.963+00	2026-05-24 18:28:51.12+00	ملابس	ملابس
a26a2604-be2d-4a32-bc8e-b7a9060d1c08	supermarket	خضروات وفاكهة	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777839948879_dqEXH76SB.jpg	nutrition	0	t	2026-05-03 19:27:30.528+00	2026-05-03 20:26:01.475+00	خضروات وفاكهة	خضروات وفاكهة
9fba4007-e0d4-4844-9e59-ed44bb3f357d	supermarket	ألبان	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777840046757_0DgryzXCV.jpg	archive	0	t	2026-05-03 19:17:06.401+00	2026-05-03 20:27:31.528+00	ألبان	ألبان
ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d	supermarket	أجبان	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777840187535_ddn6Re3nb.jpg	pizza	0	t	2026-05-03 19:46:00.72+00	2026-05-03 20:29:51.498+00	أجبان	أجبان
93c4c6f1-045b-4882-83f9-6136de6dad11	supermarket	مشروبات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777840225081_Z0MwJ_E8i.jpg	cafe	0	t	2026-05-03 18:01:07.192+00	2026-05-03 20:30:30.902+00	مشروبات	مشروبات
d01a5c53-917b-43ec-84e2-f41cddee4982	supermarket	معلبات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777994122090_YbNlb3I65.jpg	cube	0	t	2026-05-05 15:15:24.637+00	2026-05-05 15:15:24.637+00	معلبات	معلبات
fd3a39da-93bc-49f0-99f9-67ae6342566b	home_chef	مشويات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778078078772_9dilA4JbL.jpg	cube	0	t	2026-05-06 14:34:43.786+00	2026-05-06 14:34:43.786+00	مشويات	مشويات
ab2ad873-479a-4752-aab0-6bb08502308e	home_chef	أطباق رئيسية	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778091146280_dveKN6HQ07.jpg	cube	0	t	2026-05-06 18:12:33.868+00	2026-05-06 18:12:33.868+00	أطباق رئيسية	أطباق رئيسية
178cac64-62ab-4ac0-9b35-3e1e3f9475d4	restaurant	مقبلات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1779693800752_UGeY1nLNa.jpg	folder-outline	0	t	2026-05-25 07:20:50.881+00	2026-05-25 07:23:24.704+00	مقبلات	مقبلات
\.


--
-- Data for Name: product_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variants (id, product_id, name, price, display_order, created_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, price, image_url, category, service_id, merchant_id, is_available, created_at, status, rejection_reason, merchant_name, is_template, updated_at, rejectionreason, video_url, merchant_type, service_name, category_id, name_ar, name_en, description_ar, description_en) FROM stdin;
277d758d-bd21-4026-bba6-a5acded68d12	لبن جهينة كامل الدسم 1 لتر	لبن طازج كامل الدسم	0	\N	ألبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	لبن جهينة كامل الدسم 1 لتر	لبن جهينة كامل الدسم 1 لتر	\N	\N
984dcc5b-7c0c-4bd7-a4dd-3c9bd3d167dd	لبن دومتي كامل الدسم 1 لتر	لبن طازج كامل الدسم	0	\N	ألبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	لبن دومتي كامل الدسم 1 لتر	لبن دومتي كامل الدسم 1 لتر	\N	\N
860263c8-6193-4756-891c-0104e1ffd75b	زبادي دانون	زبادي دانون بالفواكه	0	\N	ألبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	زبادي دانون	زبادي دانون	\N	\N
c39da563-df73-463c-aad2-516e65f99c77	جبنة فيتا	جبنة فيتا بيضاء	0	\N	أجبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	جبنة فيتا	جبنة فيتا	\N	\N
48a19f38-a0e9-41f9-b629-ccf525eb5707	جبنة موتزاريلا	جبنة موتزاريلا للبيتزا	0	\N	أجبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	جبنة موتزاريلا	جبنة موتزاريلا	\N	\N
7bd23c69-c3c4-437e-980f-eae3b501d8a4	جبنة مثلثات	جبنة مثلثات كريمي	0	\N	أجبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	جبنة مثلثات	جبنة مثلثات	\N	\N
4fddc8df-d682-4c89-ab6d-892d9afd97ae	بيض بلدي (طبق 30 بيضة)	بيض بلدي طازج	0	\N	بيض	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	بيض بلدي (طبق 30 بيضة)	بيض بلدي (طبق 30 بيضة)	\N	\N
782dd38e-713d-4f21-be65-d9c23a0decbf	بيض أحمر (طبق 30 بيضة)	بيض أحمر طازج	0	\N	بيض	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	بيض أحمر (طبق 30 بيضة)	بيض أحمر (طبق 30 بيضة)	\N	\N
a41d83e0-09c7-4789-9ee9-5766293714c9	خبز شامي	خبز شامي طازج	0	\N	مخبوزات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	خبز شامي	خبز شامي	\N	\N
1be91f02-a265-4a2b-bf9d-598e97086736	خبز توست	خبز توست أبيض	0	\N	مخبوزات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	خبز توست	خبز توست	\N	\N
fd316fee-a97d-4a4b-b2b4-c7146377c63c	عيش فينو	عيش فينو طازج	0	\N	مخبوزات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	عيش فينو	عيش فينو	\N	\N
2db5264b-3ff5-40e2-acf5-8267aadbe3f9	أرز بسمتي هندي 1 كجم	أرز بسمتي	0	\N	بقوليات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	أرز بسمتي هندي 1 كجم	أرز بسمتي هندي 1 كجم	\N	\N
91ff6b47-bb42-400a-a4af-4670b89eb730	أرز مصري 1 كجم	أرز مصري	0	\N	بقوليات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	أرز مصري 1 كجم	أرز مصري 1 كجم	\N	\N
70809c9f-04f5-4f00-98b9-56538ce660b2	مكرونة إسباجيتي	مكرونة إيطالي	0	\N	بقوليات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	مكرونة إسباجيتي	مكرونة إسباجيتي	\N	\N
f0ca678c-438e-4d4e-b7b8-becae10146df	فول معلب	فول مدمس	0	\N	معلبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	فول معلب	فول معلب	\N	\N
8e90e495-1839-4c18-bd1c-beadf0d87da4	زيت عباد الشمس 1 لتر	زيت نباتي	0	\N	زيوت	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	زيت عباد الشمس 1 لتر	زيت عباد الشمس 1 لتر	\N	\N
ac4039f1-a1b8-4af0-a4bb-517bd6cb2449	زيت ذرة 1 لتر	زيت ذرة نقي	0	\N	زيوت	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	زيت ذرة 1 لتر	زيت ذرة 1 لتر	\N	\N
8d372db9-c6f2-4dc4-af10-60eec5c58658	سمن بلدي	سمن بلدي طبيعي	0	\N	زيوت	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	سمن بلدي	سمن بلدي	\N	\N
260538a2-4aa0-47d9-a9e8-de5eba5fbc10	زيت زيتون بكر	زيت زيتون بكر ممتاز	0	\N	زيوت	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	زيت زيتون بكر	زيت زيتون بكر	\N	\N
aaa579a0-605d-46d3-ad06-fbaf73bb5621	سكر أبيض 1 كجم	سكر ناعم	0	\N	بقالة	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	سكر أبيض 1 كجم	سكر أبيض 1 كجم	\N	\N
2d0c4dbe-9f6f-4a3e-b0ef-d70db7dc332a	ملح طعام	ملح طعام ناعم	0	\N	بقالة	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	ملح طعام	ملح طعام	\N	\N
c54936f3-77a4-4185-8f41-66a32b67c19d	شاي ليبتون	شاي أسود	0	\N	مشروبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	شاي ليبتون	شاي ليبتون	\N	\N
64d80ca9-3fff-4988-9426-ffe81f53b527	قهوة نسكافيه	قهوة سريعة الذوبان	0	\N	مشروبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	قهوة نسكافيه	قهوة نسكافيه	\N	\N
5ce4e6fd-278a-4ab6-860c-b2bba4a8877e	مياه معدنية نستله 1.5 لتر	مياه معدنية	0	\N	مشروبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	مياه معدنية نستله 1.5 لتر	مياه معدنية نستله 1.5 لتر	\N	\N
8e8ee7c0-4237-4eea-a8a5-1d2dfd48e39d	مسحوق غسيل أريال	مسحوق غسيل	0	\N	منظفات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	مسحوق غسيل أريال	مسحوق غسيل أريال	\N	\N
608d412d-3c99-4b83-bb27-8bf0820b19d3	صابون سائل	صابون سائل لليدين	0	\N	منظفات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	صابون سائل	صابون سائل	\N	\N
5a03cb3e-d21f-41ac-8e95-6b3478afcd52	كلوركس	مبيض ومنظف	0	\N	منظفات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	كلوركس	كلوركس	\N	\N
0573ed1b-6caf-4589-b0f2-ff834b7c91d8	تونة معلبة	تونة قطع	0	\N	معلبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	تونة معلبة	تونة معلبة	\N	\N
4d8dbf29-8a87-4eaa-aaef-f5c02aefac79	صلصة طماطم	صلصة طماطم طبيعية	0	\N	معلبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	صلصة طماطم	صلصة طماطم	\N	\N
67b5d2d4-9d9e-42b2-99e7-bb78f9f3b683	مربى فراولة	مربى طبيعي	0	\N	معلبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	مربى فراولة	مربى فراولة	\N	\N
6b989b96-32a0-486a-a492-82b08d6b549e	عدس أصفر	عدس أصفر مجروش	0		بقوليات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	f27e5b90-1271-4388-b590-48d1e31e9c46	عدس أصفر	عدس أصفر	\N	\N
2a0010c0-dad5-4469-880b-b55c5af0d63f	عصير برتقال طبيعي	عصير طازج	0		مشروبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	93c4c6f1-045b-4882-83f9-6136de6dad11	عصير برتقال طبيعي	عصير برتقال طبيعي	\N	\N
234c3198-995c-4a4c-99e5-946677990b19	بيبسي كولا	مشروب غازي	0		مشروبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	93c4c6f1-045b-4882-83f9-6136de6dad11	بيبسي كولا	بيبسي كولا	\N	\N
272023d3-9509-46fd-9aa9-3f1b19eacf89	كريم شعر فاتيكا		0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1777491950440_FqCQ1jwiD.jpg	عام	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	كريم شعر فاتيكا	كريم شعر فاتيكا	\N	\N
36230b28-eefb-455c-9bcc-f9b63a5aaba4	زبادي جهينة بلدي	زبادي بلدي طبيعي	0		ألبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	زبادي جهينة بلدي	زبادي جهينة بلدي	\N	\N
fdc18bdb-8227-45f7-924f-2a975f71f2a0	لبن خالي الدسم جهينة 1 لتر	لبن خالي الدسم	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1777337695580_gNvZLHBBG.jpg	ألبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	لبن خالي الدسم جهينة 1 لتر	لبن خالي الدسم جهينة 1 لتر	\N	\N
5e1de60f-da08-4cf5-bb55-915a66256117	لبن المراعي كامل الدسم 1 لتر	لبن طازج كامل الدسم	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778658633346_wBD6q0Pj1.jpg	ألبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	لبن المراعي كامل الدسم 1 لتر	لبن المراعي كامل الدسم 1 لتر	\N	\N
e224a464-42f6-4d6f-aab6-4cd4192508ba	فراوله	بلدي	0		خضروات وفاكهة	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	a26a2604-be2d-4a32-bc8e-b7a9060d1c08	فراوله	فراوله	\N	\N
360caed2-9316-433d-adf3-ba0599603267	جبنة شيدر مطبوخ	جبنة شيدر	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778658524565_wFk9X3ax-.jpg	أجبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d	جبنة شيدر مطبوخ	جبنة شيدر مطبوخ	\N	\N
4f2a8b51-40bb-4616-b05e-281bb72953cc	جبنة رومي قديمة	جبنة رومي بلدي	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778093074716_UwXFZMM3w.jpg	أجبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:32:42.752624+00	approved	\N	مترو ماركت	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d	جبنة رومي قديمة	جبنة رومي قديمة	\N	\N
4f4b1638-5134-4154-85be-0a3ea15b8e29	زبادي دانون	زبادي دانون بالفواكه	0	\N	ألبان	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	زبادي دانون	زبادي دانون	\N	\N
44e8add3-4e86-4833-9f1f-7ed77ec5f424	جبنة فيتا	جبنة فيتا بيضاء	0	\N	أجبان	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	جبنة فيتا	جبنة فيتا	\N	\N
e8f76d09-c14c-479d-81f2-74336026fdfb	جبنة موتزاريلا	جبنة موتزاريلا للبيتزا	0	\N	أجبان	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	جبنة موتزاريلا	جبنة موتزاريلا	\N	\N
85c9de03-8264-44cb-954d-1e4d95e5c2f2	جبنة مثلثات	جبنة مثلثات كريمي	0	\N	أجبان	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	جبنة مثلثات	جبنة مثلثات	\N	\N
47838e41-b569-4626-ae98-84e9dc6e4ac9	بيض بلدي (طبق 30 بيضة)	بيض بلدي طازج	0	\N	بيض	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	بيض بلدي (طبق 30 بيضة)	بيض بلدي (طبق 30 بيضة)	\N	\N
09e82d55-2307-43a9-a24b-62834350a8c2	بيض أحمر (طبق 30 بيضة)	بيض أحمر طازج	0	\N	بيض	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	بيض أحمر (طبق 30 بيضة)	بيض أحمر (طبق 30 بيضة)	\N	\N
01f0eade-25a3-4c5d-9678-1ee2c52213eb	خبز شامي	خبز شامي طازج	0	\N	مخبوزات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	خبز شامي	خبز شامي	\N	\N
8e96da6f-6306-498f-ba0f-3019cf2c431e	خبز توست	خبز توست أبيض	0	\N	مخبوزات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	خبز توست	خبز توست	\N	\N
9d61f6c6-fa15-420d-93d7-960a4aab8e01	عيش فينو	عيش فينو طازج	0	\N	مخبوزات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	عيش فينو	عيش فينو	\N	\N
7fd3462d-0499-4b5d-9074-237b59582753	أرز بسمتي هندي 1 كجم	أرز بسمتي	0	\N	بقوليات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	أرز بسمتي هندي 1 كجم	أرز بسمتي هندي 1 كجم	\N	\N
5acb26f7-9e5d-432d-b43c-71e00896c464	أرز مصري 1 كجم	أرز مصري	0	\N	بقوليات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	أرز مصري 1 كجم	أرز مصري 1 كجم	\N	\N
b0769406-d202-4550-bdbd-c28b2a5e730f	مكرونة إسباجيتي	مكرونة إيطالي	0	\N	بقوليات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	مكرونة إسباجيتي	مكرونة إسباجيتي	\N	\N
6e227807-7b90-4f8b-9460-9d7f535ddd5e	فول معلب	فول مدمس	0	\N	معلبات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	فول معلب	فول معلب	\N	\N
48c25347-29d0-4bff-92a8-616badafea73	زيت عباد الشمس 1 لتر	زيت نباتي	0	\N	زيوت	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	زيت عباد الشمس 1 لتر	زيت عباد الشمس 1 لتر	\N	\N
e9210223-bdb5-4361-8df1-572e896a8de2	زيت ذرة 1 لتر	زيت ذرة نقي	0	\N	زيوت	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	زيت ذرة 1 لتر	زيت ذرة 1 لتر	\N	\N
c8df427a-8353-4ca0-b3c9-001059c4ecfd	سمن بلدي	سمن بلدي طبيعي	0	\N	زيوت	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	سمن بلدي	سمن بلدي	\N	\N
36646c84-81df-45ce-91da-b4f58ae9e75a	لبن دومتي كامل الدسم 1 لتر	لبن طازج كامل الدسم	57		ألبان	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-26 14:57:58.377	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	لبن دومتي كامل الدسم 1 لتر	لبن دومتي كامل الدسم 1 لتر	\N	\N
74bbbccc-2d59-445c-a26a-947503fb41bb	زيت زيتون بكر	زيت زيتون بكر ممتاز	0	\N	زيوت	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	زيت زيتون بكر	زيت زيتون بكر	\N	\N
704b56d1-bf83-4d0e-9bc6-1cc23a2e6404	سكر أبيض 1 كجم	سكر ناعم	0	\N	بقالة	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	سكر أبيض 1 كجم	سكر أبيض 1 كجم	\N	\N
d45eb3ad-523b-4488-9abc-b06e7cddd45f	ملح طعام	ملح طعام ناعم	0	\N	بقالة	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	ملح طعام	ملح طعام	\N	\N
20b5b6cb-b378-43b6-b6eb-e690fe990214	شاي ليبتون	شاي أسود	0	\N	مشروبات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	شاي ليبتون	شاي ليبتون	\N	\N
9d199208-a34d-4945-83d1-c6578ee21526	قهوة نسكافيه	قهوة سريعة الذوبان	0	\N	مشروبات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	قهوة نسكافيه	قهوة نسكافيه	\N	\N
b963f279-5f25-4112-ace9-cdd8a3c75ee7	مياه معدنية نستله 1.5 لتر	مياه معدنية	0	\N	مشروبات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	مياه معدنية نستله 1.5 لتر	مياه معدنية نستله 1.5 لتر	\N	\N
92df2411-7925-4675-b4f6-198c1bb12da8	مسحوق غسيل أريال	مسحوق غسيل	0	\N	منظفات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	مسحوق غسيل أريال	مسحوق غسيل أريال	\N	\N
a012f6c8-23d6-428c-9010-ad94b405c86e	صابون سائل	صابون سائل لليدين	0	\N	منظفات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	صابون سائل	صابون سائل	\N	\N
62e1a11c-a45f-4479-9e36-36917bcb7c01	كلوركس	مبيض ومنظف	0	\N	منظفات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	كلوركس	كلوركس	\N	\N
db4a216e-4258-4461-b7db-faf75173f460	تونة معلبة	تونة قطع	0	\N	معلبات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	تونة معلبة	تونة معلبة	\N	\N
09fb6c6a-e721-4623-bc9f-6af3c0756e8e	صلصة طماطم	صلصة طماطم طبيعية	0	\N	معلبات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	صلصة طماطم	صلصة طماطم	\N	\N
eba120cc-c0f1-437b-bfa8-865973a18021	مربى فراولة	مربى طبيعي	0	\N	معلبات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	مربى فراولة	مربى فراولة	\N	\N
33ba334c-e7f1-43fe-9bdb-ab5f378901c9	عدس أصفر	عدس أصفر مجروش	0		بقوليات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	f27e5b90-1271-4388-b590-48d1e31e9c46	عدس أصفر	عدس أصفر	\N	\N
3dbaebaa-00c6-4c46-95f0-327281117f7b	عصير برتقال طبيعي	عصير طازج	0		مشروبات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	93c4c6f1-045b-4882-83f9-6136de6dad11	عصير برتقال طبيعي	عصير برتقال طبيعي	\N	\N
4f69344c-ae29-40b3-aac2-87ffae422ab6	بيبسي كولا	مشروب غازي	0		مشروبات	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	93c4c6f1-045b-4882-83f9-6136de6dad11	بيبسي كولا	بيبسي كولا	\N	\N
4d9e0bef-0b9f-43e8-a256-280113b0a484	كريم شعر فاتيكا		0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1777491950440_FqCQ1jwiD.jpg	عام	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	\N	كريم شعر فاتيكا	كريم شعر فاتيكا	\N	\N
e7bf3b3e-7f00-4c58-bca0-9d393cf64b27	زبادي جهينة بلدي	زبادي بلدي طبيعي	0		ألبان	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	زبادي جهينة بلدي	زبادي جهينة بلدي	\N	\N
08a4e31f-b910-49a9-a637-90da1d939b08	لبن خالي الدسم جهينة 1 لتر	لبن خالي الدسم	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1777337695580_gNvZLHBBG.jpg	ألبان	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	لبن خالي الدسم جهينة 1 لتر	لبن خالي الدسم جهينة 1 لتر	\N	\N
d7b35ced-9e12-4ee6-bac1-6fe96c9f2736	لبن المراعي كامل الدسم 1 لتر	لبن طازج كامل الدسم	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778658633346_wBD6q0Pj1.jpg	ألبان	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	لبن المراعي كامل الدسم 1 لتر	لبن المراعي كامل الدسم 1 لتر	\N	\N
194817d0-10a1-47af-8602-4828faae5a57	فراوله	بلدي	0		خضروات وفاكهة	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	a26a2604-be2d-4a32-bc8e-b7a9060d1c08	فراوله	فراوله	\N	\N
49981df7-1c7e-4b2e-b5bb-f3509ffd65df	جبنة شيدر مطبوخ	جبنة شيدر	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778658524565_wFk9X3ax-.jpg	أجبان	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d	جبنة شيدر مطبوخ	جبنة شيدر مطبوخ	\N	\N
9ae3b74c-c0f1-41c0-a1af-19f5e42625ed	عصير برتقال طبيعي	عصير طازج	0		مشروبات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	93c4c6f1-045b-4882-83f9-6136de6dad11	عصير برتقال طبيعي	عصير برتقال طبيعي	\N	\N
9bfbbbb8-e557-4fff-a093-981daa5eb3b5	جبنة رومي قديمة	جبنة رومي بلدي	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778093074716_UwXFZMM3w.jpg	أجبان	supermarket	14c34717-0a25-4ed8-ad1b-df970d18b4dc	t	2026-05-24 18:32:42.752624+00	approved	\N	الهواري	f	2026-05-24 18:32:42.752624	\N	\N	\N	\N	ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d	جبنة رومي قديمة	جبنة رومي قديمة	\N	\N
0ae77c9a-03c4-4db7-bfd0-b194d4312428	لبن جهينة كامل الدسم 1 لتر	لبن طازج كامل الدسم	0	\N	ألبان	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	لبن جهينة كامل الدسم 1 لتر	لبن جهينة كامل الدسم 1 لتر	\N	\N
6358a70e-3fca-488d-8cf1-deaba70a69a5	لبن دومتي كامل الدسم 1 لتر	لبن طازج كامل الدسم	0	\N	ألبان	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	لبن دومتي كامل الدسم 1 لتر	لبن دومتي كامل الدسم 1 لتر	\N	\N
595f9c22-c084-41ed-9b0b-85c03b8f9086	زبادي دانون	زبادي دانون بالفواكه	0	\N	ألبان	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	زبادي دانون	زبادي دانون	\N	\N
49e211c6-35a7-40d9-ad71-72a88b246d6f	جبنة فيتا	جبنة فيتا بيضاء	0	\N	أجبان	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	جبنة فيتا	جبنة فيتا	\N	\N
c3749828-f9ab-4cb9-8cad-812a6b59e319	جبنة موتزاريلا	جبنة موتزاريلا للبيتزا	0	\N	أجبان	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	جبنة موتزاريلا	جبنة موتزاريلا	\N	\N
8e9a457d-6635-46eb-9fec-11cac6e8eea6	جبنة مثلثات	جبنة مثلثات كريمي	0	\N	أجبان	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	جبنة مثلثات	جبنة مثلثات	\N	\N
4a675ef9-8fe7-43b4-8249-b07a6305936c	بيض بلدي (طبق 30 بيضة)	بيض بلدي طازج	0	\N	بيض	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	بيض بلدي (طبق 30 بيضة)	بيض بلدي (طبق 30 بيضة)	\N	\N
4e5098c6-472c-4502-98d7-c1bc0fd65fbc	بيض أحمر (طبق 30 بيضة)	بيض أحمر طازج	0	\N	بيض	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	بيض أحمر (طبق 30 بيضة)	بيض أحمر (طبق 30 بيضة)	\N	\N
04699ccb-04b5-49f4-9191-b406f4b7e759	خبز شامي	خبز شامي طازج	0	\N	مخبوزات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	خبز شامي	خبز شامي	\N	\N
1762a81a-bd80-49a1-9182-6b61c6f1489a	خبز توست	خبز توست أبيض	0	\N	مخبوزات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	خبز توست	خبز توست	\N	\N
c056e7e6-7d94-4f99-abe3-ed7c2102cde2	عيش فينو	عيش فينو طازج	0	\N	مخبوزات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	عيش فينو	عيش فينو	\N	\N
c1b3e2c5-90f7-4dea-b7d7-994d6a73e688	أرز بسمتي هندي 1 كجم	أرز بسمتي	0	\N	بقوليات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	أرز بسمتي هندي 1 كجم	أرز بسمتي هندي 1 كجم	\N	\N
ffbece59-8def-47a1-b797-58f7ab4d87dc	أرز مصري 1 كجم	أرز مصري	0	\N	بقوليات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	أرز مصري 1 كجم	أرز مصري 1 كجم	\N	\N
db6cc0fb-fabb-40b5-8651-5014bd5ff0e9	مكرونة إسباجيتي	مكرونة إيطالي	0	\N	بقوليات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	مكرونة إسباجيتي	مكرونة إسباجيتي	\N	\N
306253d6-22ec-4b29-8fb3-4d3bbffccf51	فول معلب	فول مدمس	0	\N	معلبات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	فول معلب	فول معلب	\N	\N
652ed098-80ee-4eca-b76b-a4aa66166aab	زيت ذرة 1 لتر	زيت ذرة نقي	0	\N	زيوت	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	زيت ذرة 1 لتر	زيت ذرة 1 لتر	\N	\N
97690316-f4ca-4cc0-ace9-b64e7b5a3369	سمن بلدي	سمن بلدي طبيعي	0	\N	زيوت	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	سمن بلدي	سمن بلدي	\N	\N
a79858f2-90cc-470d-b345-065fe02439c2	زيت زيتون بكر	زيت زيتون بكر ممتاز	0	\N	زيوت	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	زيت زيتون بكر	زيت زيتون بكر	\N	\N
21014cd6-6f2e-4c5f-adf5-66cfa173ce9c	سكر أبيض 1 كجم	سكر ناعم	0	\N	بقالة	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	سكر أبيض 1 كجم	سكر أبيض 1 كجم	\N	\N
83865344-31ab-452f-8a94-d6aa082c8c16	ملح طعام	ملح طعام ناعم	0	\N	بقالة	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	ملح طعام	ملح طعام	\N	\N
b9116c35-30d8-452c-9abf-febf38aecf85	شاي ليبتون	شاي أسود	0	\N	مشروبات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	شاي ليبتون	شاي ليبتون	\N	\N
2381b1e0-fdf5-4648-9e6a-cdd782e0cb27	قهوة نسكافيه	قهوة سريعة الذوبان	0	\N	مشروبات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	قهوة نسكافيه	قهوة نسكافيه	\N	\N
5c7a3269-f626-4d95-9438-2449c2892acd	مياه معدنية نستله 1.5 لتر	مياه معدنية	0	\N	مشروبات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	مياه معدنية نستله 1.5 لتر	مياه معدنية نستله 1.5 لتر	\N	\N
abea37b7-f91c-4920-8c5e-fd00e4a387b0	مسحوق غسيل أريال	مسحوق غسيل	0	\N	منظفات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	مسحوق غسيل أريال	مسحوق غسيل أريال	\N	\N
255f52a1-d1f6-483c-a813-7e751221cc69	صابون سائل	صابون سائل لليدين	0	\N	منظفات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	صابون سائل	صابون سائل	\N	\N
580ad248-b8b8-4101-9dd3-153aa7151a19	كلوركس	مبيض ومنظف	0	\N	منظفات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	كلوركس	كلوركس	\N	\N
dd93425b-fb66-4fc3-a62c-829a3a577a22	تونة معلبة	تونة قطع	0	\N	معلبات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	تونة معلبة	تونة معلبة	\N	\N
4dd57148-7914-4d03-96ef-8a9db2b77545	صلصة طماطم	صلصة طماطم طبيعية	0	\N	معلبات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	صلصة طماطم	صلصة طماطم	\N	\N
0b98bcf3-8071-4e6d-bdac-521f1d31a861	مربى فراولة	مربى طبيعي	0	\N	معلبات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	مربى فراولة	مربى فراولة	\N	\N
b0e0dfb8-7de8-4a4b-a5c4-dfa41e904105	عدس أصفر	عدس أصفر مجروش	0		بقوليات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	f27e5b90-1271-4388-b590-48d1e31e9c46	عدس أصفر	عدس أصفر	\N	\N
9daa9457-f52c-4d07-876c-b80633cd7d1e	ملح طعام	ملح طعام ناعم	0	\N	بقالة	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	ملح طعام	ملح طعام	\N	\N
4bdcb005-051a-4d4f-b765-ed8f9e003599	بيبسي كولا	مشروب غازي	0		مشروبات	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	93c4c6f1-045b-4882-83f9-6136de6dad11	بيبسي كولا	بيبسي كولا	\N	\N
125121d7-b70e-4758-bc07-60f6c0a5514a	كريم شعر فاتيكا		0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1777491950440_FqCQ1jwiD.jpg	عام	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	كريم شعر فاتيكا	كريم شعر فاتيكا	\N	\N
73934ef4-9a2f-43d8-9053-f0db7be38f8d	زبادي جهينة بلدي	زبادي بلدي طبيعي	0		ألبان	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	زبادي جهينة بلدي	زبادي جهينة بلدي	\N	\N
564fbba2-7e43-4686-9659-b13a0cecb167	لبن خالي الدسم جهينة 1 لتر	لبن خالي الدسم	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1777337695580_gNvZLHBBG.jpg	ألبان	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	لبن خالي الدسم جهينة 1 لتر	لبن خالي الدسم جهينة 1 لتر	\N	\N
a25f2f4d-c6a9-4362-bc41-c3af09b7a809	لبن المراعي كامل الدسم 1 لتر	لبن طازج كامل الدسم	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778658633346_wBD6q0Pj1.jpg	ألبان	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	لبن المراعي كامل الدسم 1 لتر	لبن المراعي كامل الدسم 1 لتر	\N	\N
f0b36568-2f02-4d74-9db4-f5cc33bc6031	فراوله	بلدي	0		خضروات وفاكهة	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	a26a2604-be2d-4a32-bc8e-b7a9060d1c08	فراوله	فراوله	\N	\N
8684e9e9-e53f-4e47-95a7-429cf70bae8b	جبنة شيدر مطبوخ	جبنة شيدر	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778658524565_wFk9X3ax-.jpg	أجبان	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d	جبنة شيدر مطبوخ	جبنة شيدر مطبوخ	\N	\N
7e3dab78-568d-4681-9283-4f57c9fa18af	جبنة رومي قديمة	جبنة رومي بلدي	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778093074716_UwXFZMM3w.jpg	أجبان	supermarket	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	t	2026-05-24 18:33:16.656576+00	approved	\N	صن شاين	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d	جبنة رومي قديمة	جبنة رومي قديمة	\N	\N
3c215802-22dc-4af9-a9f4-1db653266614	لبن جهينة كامل الدسم 1 لتر	لبن طازج كامل الدسم	0	\N	ألبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	لبن جهينة كامل الدسم 1 لتر	لبن جهينة كامل الدسم 1 لتر	\N	\N
62dfc8ce-682b-4b53-9a73-15c7b5707099	لبن دومتي كامل الدسم 1 لتر	لبن طازج كامل الدسم	0	\N	ألبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	لبن دومتي كامل الدسم 1 لتر	لبن دومتي كامل الدسم 1 لتر	\N	\N
905f9c31-7bdf-413f-bcce-35f98db76b52	زبادي دانون	زبادي دانون بالفواكه	0	\N	ألبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	زبادي دانون	زبادي دانون	\N	\N
bef156eb-ad3a-4ddf-af81-70b49e8b91f8	جبنة فيتا	جبنة فيتا بيضاء	0	\N	أجبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	جبنة فيتا	جبنة فيتا	\N	\N
f884cd4a-450b-407d-9fc4-bd8728d798f6	جبنة موتزاريلا	جبنة موتزاريلا للبيتزا	0	\N	أجبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	جبنة موتزاريلا	جبنة موتزاريلا	\N	\N
79369d04-f2de-46be-a3e4-613562e649f0	جبنة مثلثات	جبنة مثلثات كريمي	0	\N	أجبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	جبنة مثلثات	جبنة مثلثات	\N	\N
17ce7668-ec7e-4d3d-92a9-d45e71f75d59	بيض بلدي (طبق 30 بيضة)	بيض بلدي طازج	0	\N	بيض	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	بيض بلدي (طبق 30 بيضة)	بيض بلدي (طبق 30 بيضة)	\N	\N
1c6b7c3a-01f4-44e8-8b8c-cbae019d4411	بيض أحمر (طبق 30 بيضة)	بيض أحمر طازج	0	\N	بيض	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	بيض أحمر (طبق 30 بيضة)	بيض أحمر (طبق 30 بيضة)	\N	\N
af859af0-7123-49c2-bdb0-e6a069f750bf	خبز شامي	خبز شامي طازج	0	\N	مخبوزات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	خبز شامي	خبز شامي	\N	\N
741140e2-3097-43a9-bd16-eb7413c16640	خبز توست	خبز توست أبيض	0	\N	مخبوزات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	خبز توست	خبز توست	\N	\N
0d96676c-87e1-47cf-ae33-fef5eb7d37ba	عيش فينو	عيش فينو طازج	0	\N	مخبوزات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	عيش فينو	عيش فينو	\N	\N
a2bc35ee-1b56-4917-82fb-32fcfc7a6ac8	أرز بسمتي هندي 1 كجم	أرز بسمتي	0	\N	بقوليات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	أرز بسمتي هندي 1 كجم	أرز بسمتي هندي 1 كجم	\N	\N
1eaa883d-a24a-44bb-88a1-c866d5654401	أرز مصري 1 كجم	أرز مصري	0	\N	بقوليات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	أرز مصري 1 كجم	أرز مصري 1 كجم	\N	\N
6e2a5ef9-2c7d-45d9-bbf5-388661570cab	مكرونة إسباجيتي	مكرونة إيطالي	0	\N	بقوليات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	مكرونة إسباجيتي	مكرونة إسباجيتي	\N	\N
248c7e1a-78a7-416f-81f1-3dee7b8c7d38	فول معلب	فول مدمس	0	\N	معلبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	فول معلب	فول معلب	\N	\N
fd2ee0a9-27c8-43f0-9027-3afc7f84d697	زيت عباد الشمس 1 لتر	زيت نباتي	0	\N	زيوت	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	زيت عباد الشمس 1 لتر	زيت عباد الشمس 1 لتر	\N	\N
6ffadd7d-af89-4354-8d5c-5c6e355da817	زيت ذرة 1 لتر	زيت ذرة نقي	0	\N	زيوت	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	زيت ذرة 1 لتر	زيت ذرة 1 لتر	\N	\N
a1ad2f53-eaf5-4035-a646-3d52cd52e243	سمن بلدي	سمن بلدي طبيعي	0	\N	زيوت	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	سمن بلدي	سمن بلدي	\N	\N
6cbc167b-be47-4008-affa-3fa274050c8f	زيت زيتون بكر	زيت زيتون بكر ممتاز	0	\N	زيوت	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	زيت زيتون بكر	زيت زيتون بكر	\N	\N
7bedcfbb-0c07-4809-9bbb-43de2f845f76	سكر أبيض 1 كجم	سكر ناعم	0	\N	بقالة	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	سكر أبيض 1 كجم	سكر أبيض 1 كجم	\N	\N
981f7fdd-eda8-472c-ae42-7421aa7c76e2	شاي ليبتون	شاي أسود	0	\N	مشروبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	شاي ليبتون	شاي ليبتون	\N	\N
a3cffc0e-7fe8-43bc-b8d5-03489e2bb197	قهوة نسكافيه	قهوة سريعة الذوبان	0	\N	مشروبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	قهوة نسكافيه	قهوة نسكافيه	\N	\N
a4203e4b-0caf-4a04-ba8b-164771ff745c	مياه معدنية نستله 1.5 لتر	مياه معدنية	0	\N	مشروبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	مياه معدنية نستله 1.5 لتر	مياه معدنية نستله 1.5 لتر	\N	\N
b7bbf25d-4053-4ad1-9106-23a8fc6865d4	مسحوق غسيل أريال	مسحوق غسيل	0	\N	منظفات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	مسحوق غسيل أريال	مسحوق غسيل أريال	\N	\N
da27f320-b682-40a6-9846-9a27eda11101	صابون سائل	صابون سائل لليدين	0	\N	منظفات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	صابون سائل	صابون سائل	\N	\N
d9f5429a-a70c-43d0-bbf4-37c55ae48238	كلوركس	مبيض ومنظف	0	\N	منظفات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	كلوركس	كلوركس	\N	\N
2274d198-f03a-4a4f-b1a2-dbff87762dca	تونة معلبة	تونة قطع	0	\N	معلبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	تونة معلبة	تونة معلبة	\N	\N
cd1ee911-aba3-4c68-a76f-6d02271c7761	صلصة طماطم	صلصة طماطم طبيعية	0	\N	معلبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	صلصة طماطم	صلصة طماطم	\N	\N
ad95155b-29b1-430d-ac82-dcd76ac6aa43	مربى فراولة	مربى طبيعي	0	\N	معلبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	مربى فراولة	مربى فراولة	\N	\N
29248ccc-1ee4-4887-821b-bddd3699b68a	عدس أصفر	عدس أصفر مجروش	0		بقوليات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	f27e5b90-1271-4388-b590-48d1e31e9c46	عدس أصفر	عدس أصفر	\N	\N
983bad23-bf10-4383-8d89-9e4d63a85856	عصير برتقال طبيعي	عصير طازج	0		مشروبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	93c4c6f1-045b-4882-83f9-6136de6dad11	عصير برتقال طبيعي	عصير برتقال طبيعي	\N	\N
5157ccbc-90c1-4f60-ae18-65cfb30deb9a	بيبسي كولا	مشروب غازي	0		مشروبات	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	93c4c6f1-045b-4882-83f9-6136de6dad11	بيبسي كولا	بيبسي كولا	\N	\N
3313daed-9fd9-4bb4-8b7a-a43b5ccda304	كريم شعر فاتيكا		0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1777491950440_FqCQ1jwiD.jpg	عام	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	\N	كريم شعر فاتيكا	كريم شعر فاتيكا	\N	\N
ed68b868-050e-4eba-9278-22ad18b45e0b	زبادي جهينة بلدي	زبادي بلدي طبيعي	0		ألبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	زبادي جهينة بلدي	زبادي جهينة بلدي	\N	\N
4950639d-0c5c-4fc2-bcc9-ca3d3d68f5d4	لبن خالي الدسم جهينة 1 لتر	لبن خالي الدسم	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1777337695580_gNvZLHBBG.jpg	ألبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	لبن خالي الدسم جهينة 1 لتر	لبن خالي الدسم جهينة 1 لتر	\N	\N
52ae4aae-913e-426b-b8c2-c32062c6d3fa	لبن المراعي كامل الدسم 1 لتر	لبن طازج كامل الدسم	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778658633346_wBD6q0Pj1.jpg	ألبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	9fba4007-e0d4-4844-9e59-ed44bb3f357d	لبن المراعي كامل الدسم 1 لتر	لبن المراعي كامل الدسم 1 لتر	\N	\N
e40e6fe9-7c3e-4318-b451-05712ea77b82	فراوله	بلدي	0		خضروات وفاكهة	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	a26a2604-be2d-4a32-bc8e-b7a9060d1c08	فراوله	فراوله	\N	\N
09c6d970-ed73-4b61-abc6-bc70d8d24122	جبنة شيدر مطبوخ	جبنة شيدر	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778658524565_wFk9X3ax-.jpg	أجبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d	جبنة شيدر مطبوخ	جبنة شيدر مطبوخ	\N	\N
74d3ff31-c009-412e-a5bf-8c15058c8315	جبنة رومي قديمة	جبنة رومي بلدي	0	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778093074716_UwXFZMM3w.jpg	أجبان	supermarket	d87ca828-707e-485b-a81a-0428102f5ab4	t	2026-05-24 18:33:16.656576+00	approved	\N	مترو ماركت	f	2026-05-24 18:33:16.656576	\N	\N	\N	\N	ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d	جبنة رومي قديمة	جبنة رومي قديمة	\N	\N
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, full_name, phone, password, role, active, place_id, place_name, is_available, location_lat, location_lng, created_at, updated_at, name, service_area, max_delivery_radius, health_cert_url, merchant_type, is_verified, verification_image, verification_status, rejection_reason, business_license_url, profile_completed, terms_accepted, terms_accepted_at, delivery_fee, delivery_time, avatar_url, average_rating, reviews_count, address, portfolio_images, bio, avg_rating, service_category, bio_approved, portfolio_approved, image_url, delivery_radius, specialties, expo_push_token, commercial_register, tax_card, image_approved, admin_level, image_url_pending, documents, documents_approved, region_id, email, firebase_uid) FROM stdin;
ddf6af56-4979-46a5-a977-f01ce6ebaeec	Thomas Cook Tours	+201000000001	1234	merchant	t	\N		t	\N	\N	2026-05-05 08:34:21.635+00	2026-05-28 22:44:38.967612+00	\N		10	\N	travel	t	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0		{}	نص 2	0	products	t	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/thomas_cook_tours/profile/profile_1778014659036_yMNxJaxtH.jpg	10	{}	\N	\N	\N	t	\N	\N	[{"url": "https://ik.imagekit.io/vzuah6tku/zayedid/users/merchant/misc/doc_1778052887240_pE9waGRPU.jpg", "approved": true}, {"url": "https://ik.imagekit.io/vzuah6tku/zayedid/users/merchant/misc/doc_1778054206966_1kXq2bJYp.jpg", "approved": true}]	t	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
1dae6ea9-580d-43ef-b657-4d398b4b4f44	الشيف	0100001234	1234	merchant	t	\N		t	\N	\N	2026-05-14 13:27:18.968+00	2026-05-14 16:20:12.879328+00	\N	\N	10	\N	home_chef	t	\N	\N	\N	\N	f	f	\N	50	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
1da3526f-0aac-466a-abe3-3a329dd10de3	Sharo	+201223369908	1234	customer	t	\N	\N	t	\N	\N	2026-06-08 18:47:23.932+00	2026-06-08 18:47:23.932+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
647e3a5d-4b52-42d8-b512-ffe4bbd2debf	John	+201557859221	123456	customer	t	\N	\N	t	\N	\N	2026-06-08 15:08:57.944+00	2026-06-08 20:53:03.896671+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	t	f	\N	0	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	basic	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	fQxtN3dw2yYqJe4YhN2mveFxcUp1
cd392e2f-7c36-41e6-b98f-e81ffc3dc013	صن شاين	+201011111111	1234	merchant	t	\N		t	\N	\N	2026-05-05 11:00:36.759+00	2026-06-09 02:16:06.585529+00	\N		10	\N	supermarket	t	\N	\N	\N	\N	f	f	\N	50	30	\N	0	5		\N	نص طويل	4.2	products	t	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/صن_شاين/misc/merchant_cd392e2f-7c36-41e6-b98f-e81ffc3dc013_1778001793590_NTF-0X7C8.jpg	10	{}	\N	\N	\N	t	\N	\N	[]	t	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c		\N
14c34717-0a25-4ed8-ad1b-df970d18b4dc	الهواري	+201022222222	1234	merchant	t	\N		t	\N	\N	2026-05-12 14:01:09.224+00	2026-06-09 02:15:49.47536+00	\N	\N	10	\N	supermarket	t	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0	\N	{}	\N	0	products	f	f		10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
00000000-0000-0000-0000-000000000000	Master Admin	0000000000	Admin135792	admin	t	\N	\N	t	\N	\N	2026-05-05 08:32:24.357454+00	2026-05-05 08:32:24.357454+00	\N	\N	10	\N	\N	t	\N	\N	\N	\N	f	f	\N	0	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	super	\N	[]	f	\N	\N	\N
86946b4a-6c91-48d3-b6f9-4c7d7fbfc422	ترافيل فيو للسياحة	+201045645645	1234	merchant	t	\N		t	\N	\N	2026-05-30 14:20:03.848+00	2026-05-30 14:21:11.344743+00	\N	\N	10	\N	travel	t	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
1b30ed82-6aab-4a2a-99bf-c5f34e46aab8	ابراهيم	+201112345678	1234	customer	t	\N	\N	t	\N	\N	2026-06-01 15:31:05.287+00	2026-06-01 15:31:05.287+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
ce1ba0b1-4e4a-44e6-a781-80f623a4c4e2	مطعم حضرموت	+201066666665	1234	merchant	t	\N		t	\N	\N	2026-05-24 20:44:49.792+00	2026-05-28 22:43:48.795326+00	\N	\N	10	\N	restaurant	t	\N	\N	\N	\N	f	f	\N	30	30	\N	0	0	\N	{}	\N	0	products	f	f		10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
d87ca828-707e-485b-a81a-0428102f5ab4	مترو ماركت	+201033333333	1234	merchant	t	\N		t	\N	\N	2026-05-17 06:16:10.086+00	2026-05-28 22:44:12.943498+00	\N	\N	10	\N	supermarket	t	\N	\N	\N	\N	f	f	\N	60	30	\N	0	0	\N	{}	\N	0	products	f	f		10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
6f6b796e-4194-4b70-9bf2-4fb1e45bd17c	Norhan	+201229009229	1234	customer	t	\N	\N	t	\N	\N	2026-06-05 11:01:23.022+00	2026-06-05 11:01:23.022+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
60d507fa-df52-4d3a-96ba-90195c1a7b46	Amr	+201115560508	12345	customer	t	\N	\N	t	\N	\N	2026-06-06 22:00:47.306+00	2026-06-06 22:00:47.306+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	t	f	\N	0	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	basic	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	Dzzeu0cmQ6Wpu9js511bjGtP6py1
7930f3c1-261b-4f96-bd6b-8090c1529925	Sharo	+201033833119	123456	customer	t	\N	\N	t	\N	\N	2026-06-08 15:28:02.932+00	2026-06-08 18:39:00.113556+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	t	f	\N	0	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	basic	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	uXjmdTUzTjO3bVBTEnB0TIbXqCC2
f8def2bc-f443-454d-b6c3-be460dcbc289	مكوجي	+201099999999	1234	merchant	t	\N		t	\N	\N	2026-06-09 01:39:41.561+00	2026-06-09 01:39:41.561+00	\N	\N	10	\N	dryclean	f	\N	\N	\N	\N	f	f	\N	60	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
18f24976-c616-4020-93ea-3eecbf105798	حضرموت ٢	+201066666667	1234	merchant	t	\N		t	\N	\N	2026-05-24 20:45:25.774+00	2026-05-28 22:43:22.288628+00	\N	\N	10	\N	restaurant	t	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0	\N	{}	\N	0	products	f	f		10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
0b3ae89f-d9c1-41ed-9f41-5e6a23be2baa	مندوب	+2010555444333	1234	driver	t	\N	\N	t	\N	\N	2026-05-14 18:10:44.597+00	2026-05-28 22:44:24.953978+00	\N	الشيخ زايد	10	\N	\N	f	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0		{}		0	products	f	f	https://ik.imagekit.io/vzuah6tku/zayedid/users/ابو_كلوت/profile/profile_1778818197966_navMR5w4-.jpg	10	{}	\N	\N	\N	\N	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
65bde6b7-bbd5-4343-a41e-6abb0e1aee8e	ادمن١	+201000000000	Admin135792	admin	t	\N	\N	t	\N	\N	2026-05-05 08:33:10.803+00	2026-05-28 19:59:33.477915+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0	\N	{}	\N	0	products	f	f		10	{}	\N	\N	\N	t	super	\N	[]	f	6db0b80f-a8c1-4efb-9d18-2be53526642f	\N	\N
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (id, name, is_active, created_at, updated_at, name_en, name_ar) FROM stdin;
0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	الشيخ زايد	t	2026-05-07 07:28:20.107397+00	2026-05-26 20:25:57.102+00	El Sheikh Zayed	الشيخ زايد
cc1c26c0-1582-4679-b8a4-ad2b4ba5c785	مدينتي	f	2026-05-07 17:18:03.12983+00	2026-05-26 20:25:52.641+00	مدينتي	مدينتي
96b031e7-22b9-4991-a023-170165530542	العاصمة الادارية	f	2026-05-07 17:18:15.059245+00	2026-05-26 20:25:58.658+00	العاصمة الادارية	العاصمة الادارية
e8db1e62-8b94-4c0a-b2a4-3954b6f45a9e	الزمالك	f	2026-05-07 17:14:41.679744+00	2026-05-26 20:26:01.892+00	الزمالك	الزمالك
96d5bf5c-70ce-4715-8949-7be4aa1a5ee9	الرحاب	f	2026-05-07 17:17:51.647925+00	2026-05-26 20:26:03.128+00	الرحاب	الرحاب
6db0b80f-a8c1-4efb-9d18-2be53526642f	الدقي	f	2026-05-07 17:17:12.138685+00	2026-05-26 20:26:04.387+00	الدقي	الدقي
1b63390a-4789-4c2b-854e-f059eb096c90	التجمع الخامس	f	2026-05-07 17:14:27.202846+00	2026-05-26 20:26:05.574+00	التجمع الخامس	التجمع الخامس
6e175f78-42eb-4906-93e8-19200b22525d	اكتوبر	f	2026-05-07 17:15:57.792648+00	2026-05-26 20:26:06.747+00	اكتوبر	اكتوبر
8ae2c9f2-f070-4991-b4b9-0150ac0dad84	فيصل	f	2026-05-07 17:19:56.206854+00	2026-05-26 20:26:10.833+00	فيصل	فيصل
1b7428ed-5919-41aa-8b71-b70fc7991e7a	السيدة زينب	f	2026-05-07 17:19:04.921219+00	2026-05-26 20:26:14.081+00	السيدة زينب	السيدة زينب
fc55c479-ffb7-4844-8953-befcb5db8be6	شبرا الخيمة	f	2026-05-07 17:18:54.96978+00	2026-05-26 20:26:16.806+00	شبرا الخيمة	شبرا الخيمة
0c8a6397-504c-4437-9fed-49ffa1ac43b9	حدائق الاهرام	f	2026-05-07 17:16:11.450249+00	2026-05-26 20:26:19.244+00	حدائق الاهرام	حدائق الاهرام
0ed0e7d6-cd6b-4a78-b152-1622d80af5e4	الهرم	f	2026-05-07 17:19:51.296774+00	2026-05-26 20:26:21.695+00	الهرم	الهرم
42b30679-30d7-4f82-9cfe-7d39bd75f56c	المهندسين	f	2026-05-07 10:36:33.970634+00	2026-05-26 20:26:23.727+00	المهندسين	المهندسين
be2e2775-511b-40ef-a6f9-bfa81c0dad05	المقطم	f	2026-05-07 17:19:42.944058+00	2026-05-26 20:26:25.849+00	المقطم	المقطم
d55386fd-14dd-4527-ac1a-8aa494b23b1f	المعادي	f	2026-05-07 17:14:35.035925+00	2026-05-26 20:26:28.627+00	المعادي	المعادي
\.


--
-- Data for Name: rest2_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rest2_items (id, name, image_url, category, created_at, is_active, description, service_id, prices, updated_at) FROM stdin;
\.


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurants (id, name, image_url, rating, delivery_time, is_active, created_at) FROM stdin;
1	مطعم البركة	https://via.placeholder.com/150	4.8	30-40 min	t	2026-03-17 19:26:05.904347+00
2	بيتزا كوين	https://via.placeholder.com/150	4.5	20-30 min	t	2026-03-17 19:26:05.904347+00
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, order_id, customer_id, provider_id, rating, comment, created_at) FROM stdin;
1	13d6e4f0-713e-487f-b0c3-aeca7ec029e2	\N	b477d42c-a50c-4422-9afd-cf7d7228d06d	4	جيد	2026-04-27 18:02:31.664
2	d46a539d-59ad-4c30-b7b3-5e854aa497ab	\N	b477d42c-a50c-4422-9afd-cf7d7228d06d	4	\N	2026-04-27 18:07:47.492
3	e14390f4-16c0-4a7a-afa0-f67af1a46736	\N	b477d42c-a50c-4422-9afd-cf7d7228d06d	3	\N	2026-04-27 20:29:29.514
4	9fb22250-3c91-48be-aa76-e404cf73b502	\N	9468d439-c279-422d-81f6-2f02a3fe0dfb	3	\N	2026-04-27 20:31:00.46
5	56d20a29-2cd0-4296-932f-8ef4da38c9bd	\N	ee2126c2-d675-441b-bc19-c96196e3db6b	5	\N	2026-04-28 16:04:11.539
6	e3ecc3e7-87f4-4202-b38c-e83906422740	\N	ee2126c2-d675-441b-bc19-c96196e3db6b	1	\N	2026-04-29 17:19:09.31
7	c5fa830f-872e-4b42-b11e-4fa9ffffb8ff	\N	ee2126c2-d675-441b-bc19-c96196e3db6b	5	\N	2026-04-29 19:31:04.209
8	2e33fee9-4e95-449b-b3fb-ee037c230b30	\N	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	5	جيد جدا	2026-05-06 20:56:44.098
9	3580583b-a96b-4238-bec0-11a185ce8824	\N	42e2ac06-2524-42f2-9215-98ea3b4f3f56	5	حيد	2026-05-06 21:03:35.155
10	3524d18d-921d-46c5-a5d7-834bd6e6ef11	\N	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	4	خدمه مميزه	2026-05-06 21:25:33.19
11	e10b3215-5062-4a45-a9ee-da614928482d	\N	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	2	مش حلو	2026-05-06 21:26:18.667
12	404921fb-7530-494c-8498-a94af7f52f49	\N	42e2ac06-2524-42f2-9215-98ea3b4f3f56	3	جيد	2026-05-06 21:36:36.832
13	6d2cb703-2c67-4f84-95e9-740ec2816a7c	\N	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	5	\N	2026-05-09 17:19:11.392
14	aee21ca9-914f-48f6-bd26-13428219a0a3	\N	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	5	\N	2026-05-11 14:17:08.961
15	b2d5fc12-868a-40f5-ad3d-bf321384909b	\N	\N	5	ممتاز وفكرتة جميله	2026-05-15 17:18:14.624
16	b9a856dd-8433-4447-aeed-1425ad88539c	\N	\N	5	منتج مميز	2026-05-15 17:36:21.93
17	d7287f6f-605e-4a81-81a0-d7f7036da3e8	\N	\N	5	ممتاز حلو اوي هقول لكل اصحابي عليه	2026-05-15 17:40:48.057
18	34ddea18-8d97-4d7a-b1a9-0220e12f2f09	\N	\N	5	ممتاز حلو اوي	2026-05-15 18:16:09.886
19	f1c525cd-b2d6-4b01-b89c-da246b783eab	\N	\N	5	حلو اوي	2026-05-15 18:24:45.054
20	386efd2e-eae0-4f08-a7aa-bc8f4ccbaf27	\N	\N	5	جامد حلو اوي	2026-05-15 18:55:50.146
21	90c1ba8d-f73e-4b34-aea9-851adc706b5d	\N	\N	5	حلو اوي	2026-05-15 19:12:27.901
22	456393f7-aa35-4b8e-a2ae-3b244c33fd4b	\N	\N	5	جامد	2026-05-15 19:15:26.534
23	a28927d8-b629-447b-860a-8b535145d7f0	\N	\N	5	حلوووو	2026-05-15 19:17:52.89
24	aff3438a-cf94-48cc-8c1d-d12f99a7283e	\N	\N	5	Ok	2026-05-15 19:36:04.593
25	462bf903-dbb6-4008-954e-2b342161c566	\N	\N	5	هايل	2026-05-15 19:39:39.129
\.


--
-- Data for Name: service_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_categories (id, name, name_en, icon, image_url, sort_order, is_active, created_at, updated_at, name_ar) FROM stdin;
34387693-1971-4156-8b87-c65306ef3074	Other	Other	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1779582936343_iKbWiZwtO.jpg	3	t	2026-05-23 23:22:22.010237+00	2026-05-28 23:51:37.592+00	Other
9dd97e2c-c59c-400a-b18f-7d130c589db6	Express	Express	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1779582916363_LqIClXfhk.jpg	1	t	2026-05-23 23:22:22.010237+00	2026-05-28 23:51:48.53+00	Express
7d63ae2a-4a96-4ce7-b814-07fe0108e384	Pro	Pro	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1779582850937_2_53FgUrG.jpg	2	t	2026-05-23 23:22:22.010237+00	2026-05-28 23:51:56.663+00	Pro
\.


--
-- Data for Name: service_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_fields (id, service_id, field_name, field_label, field_type, is_required, sort_order, created_at, updated_at, sub_service_name, config, sub_service_id, field_options, is_visible, help_text, placeholder, show_when_field, show_when_value) FROM stdin;
d4501d73-3173-4245-9583-1ce27c77e574	تأشيرات	country	الدولة	text	t	1	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	تأشيرات	{}	d96ec8f0-02d0-4c00-90b0-a4901c25ae8a	{}	t			\N	\N
0bb7c240-d69c-4d61-a314-c841c9eef414	تأشيرات	visa_type	نوع التأشيرة	text	t	2	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	تأشيرات	{}	d96ec8f0-02d0-4c00-90b0-a4901c25ae8a	{}	t			\N	\N
72ee4f57-893f-4c94-ba5b-0418e6df0d8a	توصيل سريع	عتر	عتر	text	t	0	2026-05-03 17:07:36.694304+00	2026-05-03 17:07:36.694304+00	\N	{}	4f7d3b98-4bb8-4eb4-a43a-fdb7a1c8cd78	{}	t			\N	\N
0ea81104-74e0-42f2-afa4-c8890800f3b4	travel	departure_date	تاريخ المغادرة	date	t	2	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t			\N	\N
4adcc18a-daae-4fa7-a964-8f0ded46810f	travel	departure_airport	مطار المغادرة	text	t	3	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t			\N	\N
3198774f-952c-49ca-ad2b-915994ebd8ec	travel	arrival_airport	مطار الوصول	text	t	4	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t			\N	\N
12e7400a-5582-481d-adac-ff13bd498e72	travel	trip_type	نوع الرحلة	select	t	1	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	{"ذهاب فقط","ذهاب وعودة","متعدد الوجهات"}	t			\N	\N
1f0f9174-ceec-4cdd-8b45-7eff41be444d	travel	return_date	تاريخ العودة	date	f	5	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t			trip_type	ذهاب وعودة,متعدد الوجهات
1c5518c8-b807-488f-8bf0-c6c8bb7188af	حجز فنادق	notes	ملاحظات إضافية	textarea	f	6	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز فنادق	{}	80223561-920a-4949-aca4-f649d9687be2	\N	t			\N	\N
4268aad4-2ce5-4a06-a819-74a8e2808d55	تأشيرات	passport_number	رقم جواز السفر	text	t	3	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	تأشيرات	{}	d96ec8f0-02d0-4c00-90b0-a4901c25ae8a	\N	t			\N	\N
7269f8bb-17a6-40c7-80ab-5ad906b7b562	تأشيرات	travel_date	تاريخ السفر	date	t	4	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	تأشيرات	{}	d96ec8f0-02d0-4c00-90b0-a4901c25ae8a	\N	t			\N	\N
d1c337b1-2a84-4906-ab3f-e08c1e9e37e7	ليموزين و رحلات	pickup_location	موقع الاستلام	text	t	1	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	ليموزين و رحلات	{}	27e0fb0c-a72f-437a-9790-c96ef4c9c341	\N	t			\N	\N
70efa962-01a1-49ea-89c1-f52ada4d8bf5	ليموزين و رحلات	dropoff_location	موقع التوصيل	text	t	2	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	ليموزين و رحلات	{}	27e0fb0c-a72f-437a-9790-c96ef4c9c341	\N	t			\N	\N
578ffe91-bd28-41d2-8968-62373dcccb04	ليموزين و رحلات	date	التاريخ	date	t	3	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	ليموزين و رحلات	{}	27e0fb0c-a72f-437a-9790-c96ef4c9c341	\N	t			\N	\N
eaafcc97-f54a-43ef-9033-30f217a5a7b0	ليموزين و رحلات	time	الوقت	text	t	4	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	ليموزين و رحلات	{}	27e0fb0c-a72f-437a-9790-c96ef4c9c341	\N	t			\N	\N
9ae182a4-3d26-4fcc-abb3-963aa2508798	ليموزين و رحلات	passengers	عدد الركاب	number	t	5	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	ليموزين و رحلات	{}	27e0fb0c-a72f-437a-9790-c96ef4c9c341	\N	t			\N	\N
60415073-77db-4d56-bea5-28c478738af1	ليموزين و رحلات	notes	ملاحظات	textarea	f	6	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	ليموزين و رحلات	{}	27e0fb0c-a72f-437a-9790-c96ef4c9c341	\N	t			\N	\N
1c206777-c34c-4b00-838d-dca4f5a2db01	سياحة داخلية	destination	📍 الوجهة	text	t	1	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	سياحة داخلية	{}	4e5c0360-bdbd-4724-bca4-74d9e2540509	\N	t			\N	\N
7fb797fd-d168-4fd1-bc6c-7b4857444993	سياحة داخلية	days	📅 عدد الأيام	number	t	2	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	سياحة داخلية	{}	4e5c0360-bdbd-4724-bca4-74d9e2540509	\N	t			\N	\N
a3c53f20-1a98-45be-8bb2-3a341e4fb3c0	سياحة داخلية	persons	👥 عدد الأشخاص	number	t	3	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	سياحة داخلية	{}	4e5c0360-bdbd-4724-bca4-74d9e2540509	\N	t			\N	\N
cd2bfe60-b435-4d4e-9381-f9cef0b5ed23	travel	adults	عدد البالغين	number	t	6	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t			\N	\N
8ab99972-d95c-4588-9700-fa5369a3b875	travel	children	عدد الأطفال	number	f	7	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t			\N	\N
71044f42-9184-40ed-a4e3-d11d6ceb9491	travel	infants	عدد الرضع	number	f	8	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t			\N	\N
49587e80-269e-4f47-a8fb-596f06fedafc	travel	cabin_class	درجة السفر	select	t	9	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	{اقتصادية,"رجال الأعمال","الدرجة الأولى",ممتازة}	t			\N	\N
da9dba59-02a4-473b-8473-ff0e48f62c7a	travel	direct_flight	رحلة مباشرة فقط	select	f	10	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	{نعم,لا}	t			\N	\N
c6c246f8-deca-4ee9-a506-4e93e55572f7	travel	flexible_dates	مواعيد مرنة (±3 أيام)	select	f	11	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	{نعم,لا}	t			\N	\N
cdb6e039-3435-4a39-a71e-603cafbe5b04	travel	airline_preference	شركة الطيران المفضلة	text	f	12	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t			\N	\N
1e00384d-35ab-41de-a5cc-63905f92b696	travel	notes	ملاحظات إضافية	textarea	f	13	2026-05-21 15:58:50.321376+00	2026-05-21 15:58:50.321376+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t			\N	\N
1d9602e1-6f73-40f9-b368-387d56ea463a	حجز فنادق	destination	الوجهة	text	t	1	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز فنادق	{}	80223561-920a-4949-aca4-f649d9687be2	\N	t			\N	\N
237c0fa7-258e-45b9-9507-6b40f1c16970	حجز فنادق	check_in	تاريخ الوصول	date	t	2	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز فنادق	{}	80223561-920a-4949-aca4-f649d9687be2	\N	t			\N	\N
109c3fda-5039-4919-8cca-bf8a09fc7f7c	حجز فنادق	check_out	تاريخ المغادرة	date	t	3	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز فنادق	{}	80223561-920a-4949-aca4-f649d9687be2	\N	t			\N	\N
c1c1efc0-5612-4b73-8cd9-943e3d129fdc	حجز فنادق	rooms	عدد الغرف	number	t	4	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز فنادق	{}	80223561-920a-4949-aca4-f649d9687be2	\N	t			\N	\N
790a0dde-8586-41e8-8122-4d9050198404	حجز فنادق	guests	عدد النزلاء	number	t	5	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز فنادق	{}	80223561-920a-4949-aca4-f649d9687be2	\N	t			\N	\N
dc794d64-a786-4085-a41d-d260eea0b9aa	سياحة داخلية	notes	📝 ملاحظات إضافية	textarea	f	4	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	سياحة داخلية	{}	4e5c0360-bdbd-4724-bca4-74d9e2540509	\N	t			\N	\N
\.


--
-- Data for Name: service_fields_new; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_fields_new (id, sub_service_id, field_name, field_label, field_type, field_options, is_required, placeholder, help_text, sort_order, created_at, updated_at, show_when_field, show_when_value) FROM stdin;
d5ad1546-f5b6-41fe-af02-5be796b2a489	\N	return_date	تاريخ العودة	date	{}	t	\N	\N	10	2026-04-30 18:21:27.699956+00	2026-04-30 18:21:27.699956+00	trip_type	ذهاب وعودة
4401c75f-3728-4d88-bc77-9afd2343aeaf	\N	multi_city_1	الوجهة الأولى	text	{}	t	\N	\N	11	2026-04-30 18:21:27.699956+00	2026-04-30 18:21:27.699956+00	trip_type	وجهات متعددة
31d4572a-9003-4547-b6f1-f116fbc3933b	\N	multi_city_2	الوجهة الثانية	text	{}	t	\N	\N	12	2026-04-30 18:21:27.699956+00	2026-04-30 18:21:27.699956+00	trip_type	وجهات متعددة
ec41df84-cc20-4f44-836f-c4d8bccc4238	\N	multi_city_3	الوجهة الثالثة	text	{}	f	\N	\N	13	2026-04-30 18:21:27.699956+00	2026-04-30 18:21:27.699956+00	trip_type	وجهات متعددة
\.


--
-- Data for Name: service_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_items (id, service_id, name, image_url, prices, is_active, created_at, updated_at, item_sub_services, category, options, price, variant_prices) FROM stdin;
db94d552-7d4f-495e-abb0-000554c172c4	laundry	بنطلون	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777118054753_5TqwJfabJ.jpg	\N	t	2026-04-25 11:54:36.267413+00	2026-04-25 11:54:36.267413+00	\N	عام	[]	0	{"كي فقط": 10, "كي وتنظيف": 15}
93e89e46-767f-46a9-b3da-9558a2b8b95a	dryclean	بنطلون	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777160941381_FvDJ2VOxF.jpg	\N	t	2026-04-25 14:45:56.527471+00	2026-04-25 14:45:56.527471+00	\N	عام	[]	0	{"كي فقط": 10, "كي وتنظيف": 20}
bc3f8b06-883d-4400-b526-a4ceb31c5657	laundryshop	بنطلون	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777084334511_2aTrI8VGo.jpg	\N	t	2026-04-25 02:32:26.789451+00	2026-04-25 02:32:26.789451+00	\N	عام	[]	0	{"كي فقط": 30, "كي وتنظيف": 35}
7fbbd7d7-dbfa-4465-a291-61de5a4155e4	sone	قميص	\N	\N	t	2026-05-15 06:16:28.607282+00	2026-05-15 06:16:28.607282+00	\N	عام	[]	0	{"صنف ١": 10, "صنف ٢": 20}
376f6c73-3a0c-49d9-882f-277b12279747	bakery	فينو	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1780220325269_ymZG8uH8O5.jpg	\N	t	2026-04-24 23:41:27.370057+00	2026-04-24 23:41:27.370057+00	\N	صغير	[]	35	{"وسط": 8, "كبير": 10}
56307f8e-218c-4098-a1b7-b4b9bef7508d	bakery	كرواسون	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1780220383393_Sealuvl9p.jpg	\N	t	2026-04-24 23:39:06.936607+00	2026-04-24 23:39:06.936607+00	\N	كرواسون	[]	7	{"وسط": 35, "كبير": 45}
\.


--
-- Data for Name: service_tracking_steps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_tracking_steps (id, service_id, step_key, label, icon, sort_order, is_active, created_at, updated_at, image_url, attachment_url, description) FROM stdin;
54c3bcd0-1e53-4041-abc6-eb289b590cfc	travel	ready	جاهز	time-outline	4	t	2026-05-05 09:07:33.503866+00	2026-05-05 09:07:33.503866+00	\N	\N	\N
85f756b7-8f3d-439c-8e7d-2804547fa9c7	travel	delivered	تم التسليم	time-outline	5	t	2026-05-05 09:07:33.503866+00	2026-05-05 09:07:33.503866+00	\N	\N	\N
788bb316-e7bb-42af-b2c9-4516b3d18a78	travel	pending	معلق	time-outline	1	t	2026-05-05 09:07:33.503866+00	2026-05-05 14:47:00.013+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777992411932_4DrDcNT85.jpg	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777986973027_J2XYuIYVe.jpg	
fbc7a7db-0eba-4129-8460-0950e0c96d7b	travel	received	سيتم مراجعة الطلب	time-outline	2	t	2026-05-05 09:07:33.503866+00	2026-05-07 17:02:58.984+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777975036300_HFY5mIE806.jpg		
ec975553-eb99-4802-9695-f242ee431c87	travel	preparing	ارسال بيانات الحجز	time-outline	3	t	2026-05-05 09:07:33.503866+00	2026-05-07 17:03:16.441+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777992466559_oJsYTTWlW.jpg		
027aeea1-e4dc-47a4-a3cd-fd19054f5a12	home_chef	preparing	معلق	time-outline	1	t	2026-05-09 18:59:11.027+00	2026-05-09 18:59:11.027+00			
a744470f-3d71-438a-95ab-bf430fe6aeb6	supermarket	pending	معلق	time-outline	1	t	2026-05-11 14:20:54.645+00	2026-05-11 14:20:54.645+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778509250882_6pWR7MMWO.jpg		في انتظار قبول التاجر
44536cc3-ef4a-48c7-8cdd-f0fc814472c7	supermarket	preparing	تم القبول	time-outline	2	t	2026-05-11 14:22:03.986+00	2026-05-11 14:22:03.986+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778509321089_WUBaZoAGU.jpg		على وشك البدء في تجهيز طلبك
2b9f0246-03bd-4987-bf50-e396191a3fd2	supermarket	starting	تجهيز الطلب	time-outline	3	t	2026-05-11 14:23:15.041+00	2026-05-11 14:23:34.848+00			سيتم استلام المندوب حالا
5164aa8f-8af2-4b80-a0a0-8c9f9f562bb7	supermarket	delivery	مندوب	time-outline	4	t	2026-05-11 14:24:23.627+00	2026-05-11 14:24:23.627+00			المندوب سيبدأ في التحرك
2d91e121-18ac-49d9-a254-fbd4e58d992f	supermarket	onway	طلبك في الطريق	time-outline	5	t	2026-05-11 14:25:01.246+00	2026-05-11 14:25:01.246+00			سيصلك قريبا
217a0329-921a-4e3e-8076-466535882e9c	supermarket	complete	تم التوصيل	time-outline	6	t	2026-05-11 14:25:52.941+00	2026-05-11 14:25:52.941+00			تذكر التقييمات
d8b5e14b-4f06-43a0-a03f-161ec6e6e6ce	eshop	pending	قيد المراجعة	time-outline	0	t	2026-05-16 11:19:16.723353+00	2026-05-16 11:19:16.723353+00	\N	\N	طلبك قيد المراجعة
bb014bf9-f6f4-4160-8e7c-dc91be58481c	eshop	confirmed	تم التأكيد	time-outline	1	t	2026-05-16 11:19:16.723353+00	2026-05-16 11:19:16.723353+00	\N	\N	تم تأكيد طلبك
bfee40b5-aca7-4fa0-b878-8e47ad455e87	eshop	preparing	جاري التجهيز	time-outline	2	t	2026-05-16 11:19:16.723353+00	2026-05-16 11:19:16.723353+00	\N	\N	يتم تجهيز طلبك
ed1b18a8-e0d3-4aea-8647-c9eee17f61a7	eshop	shipped	تم الشحن	time-outline	3	t	2026-05-16 11:19:16.723353+00	2026-05-16 11:19:16.723353+00	\N	\N	طلبك في الطريق
33d1d923-24d0-498f-aced-985003cc70b8	eshop	delivered	تم التوصيل	time-outline	4	t	2026-05-16 11:19:16.723353+00	2026-05-16 11:19:16.723353+00	\N	\N	تم توصيل طلبك
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, name, type, screen, icon, color, category, is_active, is_visible, has_items, has_pickup, items_collection, sub_services, image_url, "order", merchant_type, merchant_role, response_message, maintenance_text, service_id, created_at, updated_at, tracking_image, has_video, items_type, merchant_id, merchant_name, header_image, full_service_id, tracking_icon_url, data_table, data_columns, data_filter, default_merchant_id, product_source_type, display_type, name_ar, name_en, description_ar, description_en) FROM stdin;
bakery	مخبز	items_service	ItemsServiceScreen	apps-outline	#F59E0B	34387693-1971-4156-8b87-c65306ef3074	t	t	t	f	bakery_items	["وسط", "كبير", "صغير", "سمسم"]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777582916591_1gPa84GaW.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-04-24 23:02:12.981	2026-05-23 23:03:30.916	\N	f	products	db1fa5ef-1332-4e5d-91d1-eeb4e082f2bd	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777583061392_c3LAJvZKu.jpg	\N	\N	\N	name, price	is_active = true	\N	service	regular	مخبز	Bakery	\N	\N
restaurant	مطاعم	items	MerchantsListScreen	apps-outline	#6B7280	9dd97e2c-c59c-400a-b18f-7d130c589db6	t	t	t	f	service_restaurant_items	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1773993918897_hWpbNtWLq.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	restaurant	2026-03-20 08:05:25.969	2026-04-28 21:31:47.735	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774002178662_k5lGGFQ06.jpg	t	dishes	eca37997-c485-42d0-a872-00a1cbe6f4e9	مطاعم	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777411898895_XHuLqpkM9.jpg	\N	\N	\N	name, price	is_active = true	\N	service	express	مطاعم	Restaurants	\N	\N
supermarket	سوبر ماركت	items	MerchantsListScreen	apps-outline	#6B7280	9dd97e2c-c59c-400a-b18f-7d130c589db6	t	t	t	f	service_supermarket_items	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1773993657658_ZzndZII5H.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	supermarket	2026-03-20 08:03:53.815	2026-04-28 21:34:16.606	\N	f	products	2a839c04-03d8-4079-a1fb-8bd1826c4564	سوبر ماركت	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777412051628_Ui0oYJddl.jpg	\N	\N	\N	name, price	is_active = true	\N	service	regular	سوبر ماركت	Supermarket	\N	\N
home_chef	الشيف المنزلي	items	MerchantsListScreen	apps-outline	#4F46E5	9dd97e2c-c59c-400a-b18f-7d130c589db6	t	t	t	f	service_home_chef_items	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774345965079_jW41iH62B.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-03-24 02:47:53.203	2026-04-28 21:43:22.248	\N	f	dishes	4198059f-1629-49fa-98c2-3bfa7daac9c5	الشيف المنزلي	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777412595319_1k3M7yNTu6.jpg	\N	\N	products	name, price, description, image_url	service_id::eq::home_chef	\N	service	pro	الشيف المنزلي	Home Chef	\N	\N
sabak	سباكه	regular	ServiceScreen	apps-outline	#6B7280	7d63ae2a-4a96-4ce7-b814-07fe0108e384	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774346052573_GXQlT315H.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-03-24 09:54:35.047	2026-04-30 21:01:02.019	\N	f	products	2fbd346b-eb40-492e-b8db-2972d62e6c8f	سباكه	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777582854478_Oh7avjjHei.jpg	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778388932557_HpyBQcpLc.jpg	\N	name, price	is_active = true	\N	service	regular	سباكه	Plumbing	\N	\N
wood	نجاره	regular	ServiceScreen	apps-outline	#6B7280	7d63ae2a-4a96-4ce7-b814-07fe0108e384	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774219003587_YZnmWPymH.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-03-22 22:37:10.895	2026-04-30 20:54:27.044	\N	f	products	5a0c1f08-4f81-462e-a34f-444c3008d44a	نجاره	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777582461589_0zFOjV_Z7.jpg	\N	\N	\N	name, price	is_active = true	\N	service	regular	نجاره	Carpentry	\N	\N
dryclean	مكوجي	items_service	ItemsServiceScreen	apps-outline	#F59E0B	9dd97e2c-c59c-400a-b18f-7d130c589db6	t	t	t	t	dryclean_items	["كي فقط", "كي وتنظيف"]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777127780405_QTT86hEq4.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-04-25 14:36:57.65	2026-04-28 21:42:44.986	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777127806479_lizEkvEXn.jpg	f	products	48a8fe9b-9455-45cd-8f41-329f5e7c40c3	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777412556539_OoQCENSje.jpg	\N	\N	\N	name, price	is_active = true	\N	service	regular	مكوجي	Laundry	\N	\N
pharmacy	صيدلية	regular	ServiceScreen	apps-outline	#14B8A6	9dd97e2c-c59c-400a-b18f-7d130c589db6	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774289190679_m0Opvnw1E.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-03-23 18:10:07.728	2026-04-30 21:38:58.671	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777483618073_HhQqGrWe6.jpg	f	products	b724e1a9-d344-45db-8b0d-957940f940b5	صيدلية	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777585134505_4PDiYQYfi.jpg	\N	\N	\N	name, price	is_active = true	\N	service	regular	صيدلية	Pharmacy	\N	\N
delivery	توصيل طلبات	full_service	\N	bicycle	#10B981	34387693-1971-4156-8b87-c65306ef3074	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778820075041_MiM2vzoOq.jpg	99	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-05-01 11:01:16.181734	2026-05-06 07:57:24.767	\N	f	products	10920642-b0a0-4ede-871f-eaf40e51ba00	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777635294187_1GHYZZZ4p.jpg	\N	\N	\N	name, price	is_active = true	\N	service	express	توصيل طلبات	Delivery	\N	\N
travel	سياحة وسفر	full_service	\N	briefcase	#8B5CF6	34387693-1971-4156-8b87-c65306ef3074	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777560251186_5wqvCYGuh.jpg	99	\N	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-05-03 04:27:14.965556	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777977175802_G5DM0lW26.jpg	f	products	d878e694-1036-40ab-8364-469e19d85f65	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777785943367_p99bDJO8n.jpg	\N	\N	\N	name, price	is_active = true	\N	service	regular	سياحة وسفر	Travel & Tourism	\N	\N
eshop	المتجر	items	\N	cart	#2563EB	34387693-1971-4156-8b87-c65306ef3074	t	f	f	f	\N	[]	\N	0	\N	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-05-16 11:16:53.947098	2026-05-23 22:37:25.417	\N	f	products	ffe88455-964d-4156-b1b4-8bbeeb83a9ea	\N	\N	\N	\N	\N	name, price	is_active = true	\N	service	pro	المتجر	E-Shop	\N	\N
offers_header	Header العروض	regular	\N	apps-outline	#6B7280	34387693-1971-4156-8b87-c65306ef3074	t	f	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1780220648677_d8SDRKGSN.jpg	0	\N	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-05-15 07:45:19.343087	\N	\N	f	products	cd077a94-2964-4901-ae5a-86d0bd5f71f7	\N	\N	\N	\N	\N	name, price	is_active = true	\N	service	regular	Header العروض	Offers Header	\N	\N
\.


--
-- Data for Name: shop_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_products (id, name, price, image_url, category, is_active, is_featured, created_at, images, description, original_price, discount_percent, updated_at, is_available) FROM stdin;
caa967f6-4c6b-4ec8-a041-ac3fe1f64f01	مج	50	https://ik.imagekit.io/vzuah6tku/zayedid/misc/shop_1779644635370_uxbq0I7cf.jpg	هدايا	t	f	2026-05-24 17:43:59.206+00	{}		\N	\N	\N	t
f851992b-7bc8-4762-8f29-8e9236a9a039	قميص رجالي	115	https://ik.imagekit.io/vzuah6tku/zayedid/misc/shop_1779644714506_sg3hV_Yay.jpg	ملابس	t	f	2026-05-24 17:45:21.077+00	{}		\N	\N	\N	t
\.


--
-- Data for Name: shop_reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_reviews (id, product_id, customer_name, customer_id, rating, comment, created_at, is_approved, customer_image_url) FROM stdin;
12aea34d-2344-48ca-b3b8-2534dcab777d	23c6cebe-ee1b-4b00-a773-8ef81e584cbe	Sherif	b5b17b1e-7e65-4426-bce6-03f5002aba2e	4	حلو	2026-05-15 20:30:22.420064+00	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/sherif/profile/profile_1778876794079_Dm-Zx7aTm.jpg
8bdd6143-2065-4549-8843-83911e10f624	23c6cebe-ee1b-4b00-a773-8ef81e584cbe	شارو	252b4854-c7c6-44de-8bc0-c4f50192c43e	5	المنتجات جميل والخامه حلوه اوي بس السعر غالي شويه	2026-05-15 20:44:01.067455+00	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/شارو/profile/profile_1778877790105_Tt1K-A0RC.jpg
\.


--
-- Data for Name: shop_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_settings (id, is_active, maintenance_message, banner_image, banner_title, banner_subtitle, free_shipping, free_shipping_min_order, created_at, updated_at) FROM stdin;
1	t	المتجر قيد التجهيز	https://ik.imagekit.io/vzuah6tku/zayedid/misc/banner_1779644989482_kOz-ZsGNh.jpg	عروض خاصة	خصومات ولفترة محدودة	f	500	2026-04-26 17:34:08.857689+00	2026-04-26 17:34:08.857689+00
\.


--
-- Data for Name: sub_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_services (id, full_service_id, name, description, icon, sort_order, is_active, created_at, image_url, show_title, tracking_icon_url, name_ar, name_en) FROM stdin;
20956352-1809-4e50-9a04-577781242eae	9352bbce-8ae1-46e2-9964-2db4ce667326	حجز طيران	\N	airplane	1	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777576757342_r_uOP3G-B.jpg	t	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778400514269_WvfuAX-4v.jpg	حجز طيران	حجز طيران
80223561-920a-4949-aca4-f649d9687be2	9352bbce-8ae1-46e2-9964-2db4ce667326	حجز فنادق	\N	bed	2	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777576808994_bq_UNFSeV.jpg	t	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778400604289_59QyFUoo9.jpg	حجز فنادق	حجز فنادق
d96ec8f0-02d0-4c00-90b0-a4901c25ae8a	9352bbce-8ae1-46e2-9964-2db4ce667326	تأشيرات	\N	document-text	3	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777577044587_HnoBE_sGx.jpg	t	\N	تأشيرات	تأشيرات
a29efc56-52a6-41ea-8c47-c0f91e34cf6f	c7205659-f582-40f1-9bbb-76dcfb40a337	Y	\N	document-text	0	t	2026-05-02 16:09:22.321932+00	\N	t	https://via.placeholder.com/20	Y	Y
4f7d3b98-4bb8-4eb4-a43a-fdb7a1c8cd78	c7205659-f582-40f1-9bbb-76dcfb40a337	توصيل سريع	\N	document-text	0	t	2026-05-02 16:07:54.470472+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777817922423_ksaK4mOTC.jpg	t	test_url	توصيل سريع	توصيل سريع
2a82d891-58bd-4cb1-9898-23437435ba0f	c7205659-f582-40f1-9bbb-76dcfb40a337	H	\N	document-text	0	t	2026-05-02 16:26:26.292616+00	\N	t	\N	H	H
4e5c0360-bdbd-4724-bca4-74d9e2540509	9352bbce-8ae1-46e2-9964-2db4ce667326	سياحة داخلية	\N	document-text	5	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777626019322_hooa1NwCdb.jpg	t	\N	سياحة داخلية	سياحة داخلية
27e0fb0c-a72f-437a-9790-c96ef4c9c341	9352bbce-8ae1-46e2-9964-2db4ce667326	ليموزين و رحلات	\N	car	4	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777577117057_gc0QD8q1d.jpg	t	\N	ليموزين و رحلات	ليموزين و رحلات
\.


--
-- Data for Name: template_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template_products (id, name, description, image_url, category, service_type, is_approved, created_by, created_at, updated_at, category_id, price) FROM stdin;
89acc8ed-850a-47f0-b821-3ad3316e36b0	لبن جهينة كامل الدسم 1 لتر	لبن طازج		ألبان	supermarket	t	\N	2026-05-26 14:29:21.4524+00	2026-05-26 14:55:08.714+00	9fba4007-e0d4-4844-9e59-ed44bb3f357d	50
10067dc3-b750-4565-9a3b-d092a43746ef	جبنة رومي قديمة	جبنة طبيعية		أجبان	supermarket	t	\N	2026-05-26 14:29:21.4524+00	2026-05-26 14:55:24.66+00	ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d	50
cde42699-dfe2-46ab-8559-d643116ac769	أرز بسمتي هندي 1 كجم	أرز هندي		بقوليات	supermarket	t	\N	2026-05-26 14:29:21.4524+00	2026-05-26 14:55:35.545+00	f27e5b90-1271-4388-b590-48d1e31e9c46	50
ebf31127-30c0-4295-9648-6b4016154d84	فرخة مشوية		https://media.elbalad.news/2024/10/large/935/5/331.jpg	مقبلات	restaurant	t	\N	2026-05-26 08:39:21.921+00	2026-05-26 08:39:22.114274+00	178cac64-62ab-4ac0-9b35-3e1e3f9475d4	100
54fc22ee-475e-4faa-9852-e45f017b97c8	فراخ مشوية		https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=400	عام	home_chef	t	\N	2026-05-24 21:45:20.949+00	2026-05-24 21:45:21.481851+00	\N	120
e63d9711-a04b-4034-9098-bb6041d55cb3	كباب حلة		https://images.unsplash.com/photo-1603360946369-dc9bb6258143?w=400	عام	home_chef	t	\N	2026-05-24 21:45:21.662+00	2026-05-24 21:45:21.815177+00	\N	90
ef41d5b3-3a0c-49e6-8b69-36fe59fe6651	ملوخية		https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=400	عام	home_chef	t	\N	2026-05-24 21:45:21.869+00	2026-05-24 21:45:22.048275+00	\N	45
3e04bf55-5778-48d4-b7ac-3b919db52f9f	مكرونة بشاميل		https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400	عام	home_chef	t	\N	2026-05-24 21:45:22.116+00	2026-05-24 21:45:22.259765+00	\N	75
ed8b0f25-1bd6-4f20-b83a-09890cdef14e	محشي ورق عنب		https://images.unsplash.com/photo-1631452180519-c014fe946bc7?w=400	عام	home_chef	t	\N	2026-05-24 21:45:22.328+00	2026-05-24 21:45:22.451248+00	\N	80
cb3c0177-8a35-40bc-9ac5-4b3a951f43d4	كفتة مشوية		https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=400	عام	home_chef	t	\N	2026-05-24 21:45:22.508+00	2026-05-24 21:45:22.635088+00	\N	110
6032169d-633a-43de-91e3-eec39c15ad56	سمك فيليه		https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=400	عام	home_chef	t	\N	2026-05-24 21:45:22.697+00	2026-05-24 21:45:22.834277+00	\N	130
9bfd97b7-f803-45d2-a179-f3af1e535caf	سلطة طحينة		https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=400	عام	home_chef	t	\N	2026-05-24 21:45:22.895+00	2026-05-24 21:45:23.027805+00	\N	20
b64e9c00-5df9-468f-9542-03ddf60ada2d	شوربة عدس		https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400	عام	home_chef	t	\N	2026-05-24 21:45:23.094+00	2026-05-24 21:45:23.226054+00	\N	30
4f207a6b-b131-4e96-a36b-41f1f0080a85	بطاطس مقلية		https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=400	عام	home_chef	t	\N	2026-05-24 21:45:23.285+00	2026-05-24 21:45:23.413146+00	\N	35
f4d563fc-801c-420b-99e1-94c3a9acbf69	كباب حلة		https://images.unsplash.com/photo-1603360946369-dc9bb6258143	مقبلات	restaurant	t	\N	2026-05-25 07:22:46.495+00	2026-05-25 07:22:46.914426+00	178cac64-62ab-4ac0-9b35-3e1e3f9475d4	120
7560b86e-793c-4b8d-9960-aa46a3176c33	مشاوي مشكلة		https://images.unsplash.com/photo-1555939594-58d7cb561ad1	مقبلات	restaurant	t	\N	2026-05-25 07:22:46.97+00	2026-05-25 07:22:47.127227+00	178cac64-62ab-4ac0-9b35-3e1e3f9475d4	250
8869c4c1-e4dc-498e-a19d-c42cbad249db	طاجن بامية باللحم		https://images.unsplash.com/photo-1547592166-23ac45744acd	مقبلات	restaurant	t	\N	2026-05-25 07:22:47.17+00	2026-05-25 07:22:47.376791+00	178cac64-62ab-4ac0-9b35-3e1e3f9475d4	95
f12d98f4-fb6d-4e1e-9e68-4954e2b76085	سلطة خضراء		https://images.unsplash.com/photo-1512621776951-a57141f2eefd	مقبلات	restaurant	t	\N	2026-05-25 07:22:47.869+00	2026-05-25 07:22:48.01372+00	178cac64-62ab-4ac0-9b35-3e1e3f9475d4	30
\.


--
-- Data for Name: user_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_tokens (id, user_id, expo_push_token, platform, created_at, updated_at) FROM stdin;
9f0acfcb-3d73-4a21-9fd8-556c9ca1100d	252b4854-c7c6-44de-8bc0-c4f50192c43e	ExponentPushToken[6PN8DqKUnQoiL_0qVuObkZ]	android	2026-05-21 19:25:30.986721+00	2026-05-21 19:25:30.888+00
7e0cf0e0-ac09-410d-8396-da2a827a97d7	50c87173-42cc-495f-83d2-b658fd530cf9	ExponentPushToken[rm_wlYK23C-tMjSCGM3Dnc]	android	2026-05-23 16:33:10.08212+00	2026-05-23 16:33:09.957+00
f308cfef-815b-4c65-9335-bb174cf89c58	0d4d0660-bfb8-4fc6-998f-bdc2ced9377d	ExponentPushToken[y79lu2DDof_8CFa6EfeHHC]	android	2026-05-31 14:14:48.72133+00	2026-05-31 14:14:47.701+00
be915f4b-a9da-40c4-87cc-762f85e88e66	225531e9-3cff-4e25-a231-a4c85130ba20	ExponentPushToken[_R1Y-IKt24WhRCwQwuR-Zj]	android	2026-05-27 07:47:14.926305+00	2026-05-27 07:47:14.781+00
fbb6ee54-9e4a-460a-b0b8-a442971f9e9c	4fde7587-6722-416c-957b-d3f1f455d692	ExponentPushToken[vQ4hImDeQEesOkHt1ZR_1m]	android	2026-05-25 23:02:39.096328+00	2026-05-25 23:02:38.924+00
92c87c77-b037-42bc-ba7c-755ccfbd3b38	84c18e6b-fbe1-49fa-9948-63979fa84c9b	ExponentPushToken[bX5f3kOLQ8nc8beQYhPAVU]	android	2026-06-05 00:41:56.037467+00	2026-06-05 00:41:55.853+00
1299787f-2387-4b5c-ba13-e5260eac5f0d	6f6b796e-4194-4b70-9bf2-4fb1e45bd17c	ExponentPushToken[AqTfsiK0JNQiv_h-Gyw5Jq]	android	2026-06-05 11:29:52.325609+00	2026-06-05 11:29:51.202+00
ddac8d2b-6b45-4eea-9e68-ec126bdee205	14c34717-0a25-4ed8-ad1b-df970d18b4dc	ExponentPushToken[06jpA9OlG74c96NQl15lyr]	android	2026-06-09 02:16:42.212018+00	2026-06-09 02:16:42.412+00
52e50e59-e1bd-4dab-9c7d-fe786cef3f02	7930f3c1-261b-4f96-bd6b-8090c1529925	ExponentPushToken[wTB6LiD_roww202ivDfpR5]	android	2026-06-09 02:26:00.83418+00	2026-06-09 02:26:00.792+00
d387faf0-1afd-4b06-859a-8bed16d9e4b0	60d507fa-df52-4d3a-96ba-90195c1a7b46	ExponentPushToken[27VkqPNFfCHNMsbAQ_Y-3U]	android	2026-06-06 22:08:46.729831+00	2026-06-06 22:08:46.4+00
fabd63fb-3e16-4ce9-8728-67deba6575eb	647e3a5d-4b52-42d8-b512-ffe4bbd2debf	ExponentPushToken[bEdOgdO32s4O16crm-4pzv]	android	2026-06-08 20:53:17.78532+00	2026-06-08 20:53:17.551+00
\.


--
-- Data for Name: messages_2026_06_07; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_06_07 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_06_08; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_06_08 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_06_09; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_06_09 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_06_10; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_06_10 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_06_11; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_06_11 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_06_12; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_06_12 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2026-03-17 18:22:17
20211116045059	2026-03-17 18:22:17
20211116050929	2026-03-17 18:22:17
20211116051442	2026-03-17 18:22:17
20211116212300	2026-03-17 18:22:17
20211116213355	2026-03-17 18:22:17
20211116213934	2026-03-17 18:22:17
20211116214523	2026-03-17 18:22:17
20211122062447	2026-03-17 18:22:17
20211124070109	2026-03-17 18:22:17
20211202204204	2026-03-17 18:22:17
20211202204605	2026-03-17 18:22:17
20211210212804	2026-03-17 18:22:17
20211228014915	2026-03-17 18:22:17
20220107221237	2026-03-17 18:22:17
20220228202821	2026-03-17 18:22:17
20220312004840	2026-03-17 18:22:17
20220603231003	2026-03-17 18:22:17
20220603232444	2026-03-17 18:22:17
20220615214548	2026-03-17 18:22:17
20220712093339	2026-03-17 18:22:17
20220908172859	2026-03-17 18:22:17
20220916233421	2026-03-17 18:22:17
20230119133233	2026-03-17 18:22:17
20230128025114	2026-03-17 18:22:17
20230128025212	2026-03-17 18:22:17
20230227211149	2026-03-17 18:22:17
20230228184745	2026-03-17 18:22:17
20230308225145	2026-03-17 18:22:17
20230328144023	2026-03-17 18:22:17
20231018144023	2026-03-17 18:22:17
20231204144023	2026-03-17 18:22:17
20231204144024	2026-03-17 18:22:17
20231204144025	2026-03-17 18:22:17
20240108234812	2026-03-17 18:22:17
20240109165339	2026-03-17 18:22:17
20240227174441	2026-03-17 18:22:17
20240311171622	2026-03-17 18:22:17
20240321100241	2026-03-17 18:22:17
20240401105812	2026-03-17 18:22:17
20240418121054	2026-03-17 18:22:17
20240523004032	2026-03-17 18:22:18
20240618124746	2026-03-17 18:22:18
20240801235015	2026-03-17 18:22:18
20240805133720	2026-03-17 18:22:18
20240827160934	2026-03-17 18:22:18
20240919163303	2026-03-17 18:22:18
20240919163305	2026-03-17 18:22:18
20241019105805	2026-03-17 18:22:18
20241030150047	2026-03-17 18:22:18
20241108114728	2026-03-17 18:22:18
20241121104152	2026-03-17 18:22:18
20241130184212	2026-03-17 18:22:18
20241220035512	2026-03-17 18:22:18
20241220123912	2026-03-17 18:22:18
20241224161212	2026-03-17 18:22:18
20250107150512	2026-03-17 18:22:18
20250110162412	2026-03-17 18:22:18
20250123174212	2026-03-17 18:22:18
20250128220012	2026-03-17 18:22:18
20250506224012	2026-03-17 18:22:18
20250523164012	2026-03-17 18:22:18
20250714121412	2026-03-17 18:22:18
20250905041441	2026-03-17 18:22:18
20251103001201	2026-03-17 18:22:18
20251120212548	2026-03-17 18:22:18
20251120215549	2026-03-17 18:22:18
20260218120000	2026-03-17 18:22:18
20260326120000	2026-04-12 19:17:18
20260514120000	2026-06-08 14:56:31
20260527120000	2026-06-08 14:56:31
20260528120000	2026-06-08 14:56:32
20260603120000	2026-06-08 14:56:32
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter, selected_columns) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
order-files	order-files	\N	2026-04-19 15:54:53.962889+00	2026-04-19 15:54:53.962889+00	t	f	\N	\N	\N	STANDARD
splash_gifs	splash_gifs	\N	2026-05-17 20:27:50.053154+00	2026-05-17 20:27:50.053154+00	t	f	\N	\N	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2026-03-17 18:22:31.60494
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2026-03-17 18:22:31.611411
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2026-03-17 18:22:31.618504
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2026-03-17 18:22:31.634165
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2026-03-17 18:22:31.641661
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2026-03-17 18:22:31.645505
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2026-03-17 18:22:31.649652
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2026-03-17 18:22:31.653393
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2026-03-17 18:22:31.656431
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2026-03-17 18:22:31.65986
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2026-03-17 18:22:31.66357
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2026-03-17 18:22:31.667311
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2026-03-17 18:22:31.671072
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2026-03-17 18:22:31.674353
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2026-03-17 18:22:31.677822
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2026-03-17 18:22:31.701514
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2026-03-17 18:22:31.705027
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2026-03-17 18:22:31.708441
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2026-03-17 18:22:31.711679
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2026-03-17 18:22:31.716438
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2026-03-17 18:22:31.719743
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2026-03-17 18:22:31.724399
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2026-03-17 18:22:31.736191
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2026-03-17 18:22:31.744802
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2026-03-17 18:22:31.748609
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2026-03-17 18:22:31.751953
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2026-03-17 18:22:31.755483
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2026-03-17 18:22:31.758362
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2026-03-17 18:22:31.761277
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2026-03-17 18:22:31.764017
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2026-03-17 18:22:31.767065
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2026-03-17 18:22:31.769853
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2026-03-17 18:22:31.772675
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2026-03-17 18:22:31.77563
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2026-03-17 18:22:31.778693
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2026-03-17 18:22:31.781749
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2026-03-17 18:22:31.785207
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2026-03-17 18:22:31.788008
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2026-03-17 18:22:31.791964
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2026-03-17 18:22:31.799926
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2026-03-17 18:22:31.803087
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2026-03-17 18:22:31.805958
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2026-03-17 18:22:31.808958
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2026-03-17 18:22:31.812216
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2026-03-17 18:22:31.81536
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2026-03-17 18:22:31.81924
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2026-03-17 18:22:31.829442
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2026-03-17 18:22:31.833292
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2026-03-17 18:22:31.836336
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-03-17 18:22:31.849381
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-03-17 18:22:31.853121
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-03-17 18:22:31.871938
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-03-17 18:22:31.873176
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-03-17 18:22:31.885632
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-03-17 18:22:31.887636
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-03-17 18:22:31.889163
57	s3-multipart-uploads-metadata	f127886e00d1b374fadbc7c6b31e09336aad5287	2026-04-07 21:10:13.810496
58	operation-ergonomics	00ca5d483b3fe0d522133d9002ccc5df98365120	2026-04-07 21:10:13.831114
56	fix-optimized-search-function	b823ed1e418101032fa01374edc9a436e54e3ed4	2026-03-17 18:22:31.89364
59	drop-unused-functions	38456f13e39691c2bbb4b5151d0d1cdbabd4a8c4	2026-05-11 14:34:59.954896
60	optimize-existing-functions-again	db35e1c91a9201e59f4fef8d972c2f277d68b157	2026-05-11 14:34:59.965736
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
a256dcfd-63f5-405f-a6c3-db8c98e0af35	splash_gifs	loading/loading_1779050594977.gif	\N	2026-05-17 20:43:20.858352+00	2026-05-17 20:43:20.858352+00	2026-05-17 20:43:20.858352+00	{"eTag": "\\"4b5264ab5e290831a92786401e096078\\"", "size": 1717684, "mimetype": "image/gif", "cacheControl": "max-age=3600", "lastModified": "2026-05-17T20:43:21.000Z", "contentLength": 1717684, "httpStatusCode": 200}	4a2ec543-c945-40ec-acb3-86ac010cb485	\N	{}
963352c3-a716-41bd-8fa4-b8487bc6130b	splash_gifs	splash/splash_1779050624406.gif	\N	2026-05-17 20:44:48.953933+00	2026-05-17 20:44:48.953933+00	2026-05-17 20:44:48.953933+00	{"eTag": "\\"634382788d3f724d91d2781847de25df-4\\"", "size": 19849587, "mimetype": "image/gif", "cacheControl": "max-age=3600", "lastModified": "2026-05-17T20:44:49.000Z", "contentLength": 19849587, "httpStatusCode": 200}	87fd0947-183d-439d-925a-1f18f39e3626	\N	{}
41270964-d300-4b00-a6bf-3157dc6ea738	splash_gifs	loading/loading_1779050829374.gif	\N	2026-05-17 20:47:15.388254+00	2026-05-17 20:47:15.388254+00	2026-05-17 20:47:15.388254+00	{"eTag": "\\"4b5264ab5e290831a92786401e096078\\"", "size": 1717684, "mimetype": "image/gif", "cacheControl": "max-age=3600", "lastModified": "2026-05-17T20:47:16.000Z", "contentLength": 1717684, "httpStatusCode": 200}	ab07bc0b-c0b4-48f4-b39e-a1edb3fb0215	\N	{}
76f36d9c-22bd-4822-9132-4ab3cd7de5d1	splash_gifs	loading/loading_1779050948580.gif	\N	2026-05-17 20:49:14.283643+00	2026-05-17 20:49:14.283643+00	2026-05-17 20:49:14.283643+00	{"eTag": "\\"4b5264ab5e290831a92786401e096078\\"", "size": 1717684, "mimetype": "image/gif", "cacheControl": "max-age=3600", "lastModified": "2026-05-17T20:49:15.000Z", "contentLength": 1717684, "httpStatusCode": 200}	6c827526-0ef4-4ec4-9aff-3941c69eea84	\N	{}
0534f44f-fdd3-4c55-9b04-25e0294d48b4	splash_gifs	splash/splash_1779050980172.gif	\N	2026-05-17 20:50:44.89224+00	2026-05-17 20:50:44.89224+00	2026-05-17 20:50:44.89224+00	{"eTag": "\\"634382788d3f724d91d2781847de25df-4\\"", "size": 19849587, "mimetype": "image/gif", "cacheControl": "max-age=3600", "lastModified": "2026-05-17T20:50:45.000Z", "contentLength": 19849587, "httpStatusCode": 200}	e95bb661-143a-46c9-ba70-c80a913669da	\N	{}
a7a649ee-761e-46c6-b2df-469f38098453	splash_gifs	loading/loading_1779051247509.gif	\N	2026-05-17 20:54:13.498927+00	2026-05-17 20:54:13.498927+00	2026-05-17 20:54:13.498927+00	{"eTag": "\\"4b5264ab5e290831a92786401e096078\\"", "size": 1717684, "mimetype": "image/gif", "cacheControl": "max-age=3600", "lastModified": "2026-05-17T20:54:14.000Z", "contentLength": 1717684, "httpStatusCode": 200}	b01cc147-eaba-4d2e-8460-ced56c441a51	\N	{}
c0a547f7-dc47-4627-a325-2d1b89571eb9	splash_gifs	loading/loading_1779051369148.gif	\N	2026-05-17 20:56:15.03086+00	2026-05-17 20:56:15.03086+00	2026-05-17 20:56:15.03086+00	{"eTag": "\\"4b5264ab5e290831a92786401e096078\\"", "size": 1717684, "mimetype": "image/gif", "cacheControl": "max-age=3600", "lastModified": "2026-05-17T20:56:15.000Z", "contentLength": 1717684, "httpStatusCode": 200}	bc88b54c-fca6-47ab-978e-a6e7d6ccc980	\N	{}
72bf0792-1ab9-4455-8e22-7d54d6cbe21c	splash_gifs	splash/splash_1779051676710.gif	\N	2026-05-17 21:02:30.891121+00	2026-05-17 21:02:30.891121+00	2026-05-17 21:02:30.891121+00	{"eTag": "\\"634382788d3f724d91d2781847de25df-4\\"", "size": 19849587, "mimetype": "image/gif", "cacheControl": "max-age=3600", "lastModified": "2026-05-17T21:02:31.000Z", "contentLength": 19849587, "httpStatusCode": 200}	b84bf6dd-cc85-4fd5-881d-ba94bb818a55	\N	{}
90d9506e-8929-4aae-8519-b12c2f1cb6b1	splash_gifs	sounds/loading_sound_1779053293450.mp3	\N	2026-05-17 21:28:15.158896+00	2026-05-17 21:28:15.158896+00	2026-05-17 21:28:15.158896+00	{"eTag": "\\"2c83a41cb1e9c75b68a11b0dec2d1533\\"", "size": 284212, "mimetype": "audio/mpeg", "cacheControl": "max-age=3600", "lastModified": "2026-05-17T21:28:16.000Z", "contentLength": 284212, "httpStatusCode": 200}	fb19567a-b3cb-47bf-be7c-d40e0c36a195	\N	{}
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata, metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 13, true);


--
-- Name: app_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_settings_id_seq', 67, true);


--
-- Name: assistants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assistants_id_seq', 15, true);


--
-- Name: dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dishes_id_seq', 5, true);


--
-- Name: home_chefs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_chefs_id_seq', 1, false);


--
-- Name: item_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_prices_id_seq', 1, false);


--
-- Name: laundry_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.laundry_items_id_seq', 9, true);


--
-- Name: offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.offers_id_seq', 11, true);


--
-- Name: restaurants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurants_id_seq', 2, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 25, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 48, true);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webauthn_challenges webauthn_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_pkey PRIMARY KEY (id);


--
-- Name: webauthn_credentials webauthn_credentials_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_pkey PRIMARY KEY (id);


--
-- Name: app_settings app_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT app_settings_pkey PRIMARY KEY (id);


--
-- Name: assistants assistants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistants
    ADD CONSTRAINT assistants_pkey PRIMARY KEY (id);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- Name: full_services full_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.full_services
    ADD CONSTRAINT full_services_pkey PRIMARY KEY (id);


--
-- Name: full_services full_services_service_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.full_services
    ADD CONSTRAINT full_services_service_id_key UNIQUE (service_id);


--
-- Name: home_chefs home_chefs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_chefs
    ADD CONSTRAINT home_chefs_pkey PRIMARY KEY (id);


--
-- Name: item_prices item_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_prices
    ADD CONSTRAINT item_prices_pkey PRIMARY KEY (id);


--
-- Name: laundry_items laundry_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laundry_items
    ADD CONSTRAINT laundry_items_pkey PRIMARY KEY (id);


--
-- Name: merchant_product_prices merchant_product_prices_merchant_id_template_product_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_product_prices
    ADD CONSTRAINT merchant_product_prices_merchant_id_template_product_id_key UNIQUE (merchant_id, template_product_id);


--
-- Name: merchant_product_prices merchant_product_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_product_prices
    ADD CONSTRAINT merchant_product_prices_pkey PRIMARY KEY (id);


--
-- Name: merchant_sub_services merchant_sub_services_merchant_id_sub_service_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_sub_services
    ADD CONSTRAINT merchant_sub_services_merchant_id_sub_service_id_key UNIQUE (merchant_id, sub_service_id);


--
-- Name: merchant_sub_services merchant_sub_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_sub_services
    ADD CONSTRAINT merchant_sub_services_pkey PRIMARY KEY (id);


--
-- Name: merchants merchants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchants
    ADD CONSTRAINT merchants_pkey PRIMARY KEY (id);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: otp_codes otp_codes_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otp_codes
    ADD CONSTRAINT otp_codes_phone_key UNIQUE (phone);


--
-- Name: otp_codes otp_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otp_codes
    ADD CONSTRAINT otp_codes_pkey PRIMARY KEY (id);


--
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: product_variants product_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT product_variants_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_firebase_uid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_firebase_uid_key UNIQUE (firebase_uid);


--
-- Name: profiles profiles_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_phone_key UNIQUE (phone);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: regions regions_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_name_key UNIQUE (name);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: rest2_items rest2_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rest2_items
    ADD CONSTRAINT rest2_items_pkey PRIMARY KEY (id);


--
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_order_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_order_id_key UNIQUE (order_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: service_categories service_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_categories
    ADD CONSTRAINT service_categories_pkey PRIMARY KEY (id);


--
-- Name: service_fields_new service_fields_new_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_fields_new
    ADD CONSTRAINT service_fields_new_pkey PRIMARY KEY (id);


--
-- Name: service_items service_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_items
    ADD CONSTRAINT service_items_pkey PRIMARY KEY (id);


--
-- Name: service_tracking_steps service_tracking_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_tracking_steps
    ADD CONSTRAINT service_tracking_steps_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: shop_products shop_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_products
    ADD CONSTRAINT shop_products_pkey PRIMARY KEY (id);


--
-- Name: shop_reviews shop_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_reviews
    ADD CONSTRAINT shop_reviews_pkey PRIMARY KEY (id);


--
-- Name: shop_settings shop_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_settings
    ADD CONSTRAINT shop_settings_pkey PRIMARY KEY (id);


--
-- Name: sub_services sub_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_services
    ADD CONSTRAINT sub_services_pkey PRIMARY KEY (id);


--
-- Name: template_products template_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_products
    ADD CONSTRAINT template_products_pkey PRIMARY KEY (id);


--
-- Name: user_tokens user_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tokens
    ADD CONSTRAINT user_tokens_pkey PRIMARY KEY (id);


--
-- Name: user_tokens user_tokens_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tokens
    ADD CONSTRAINT user_tokens_user_id_key UNIQUE (user_id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_07 messages_2026_06_07_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_06_07
    ADD CONSTRAINT messages_2026_06_07_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_08 messages_2026_06_08_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_06_08
    ADD CONSTRAINT messages_2026_06_08_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_09 messages_2026_06_09_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_06_09
    ADD CONSTRAINT messages_2026_06_09_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_10 messages_2026_06_10_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_06_10
    ADD CONSTRAINT messages_2026_06_10_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_11 messages_2026_06_11_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_06_11
    ADD CONSTRAINT messages_2026_06_11_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_12 messages_2026_06_12_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_06_12
    ADD CONSTRAINT messages_2026_06_12_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages messages_payload_exclusive; Type: CHECK CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages
    ADD CONSTRAINT messages_payload_exclusive CHECK (((payload IS NULL) OR (binary_payload IS NULL))) NOT VALID;


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: webauthn_challenges_expires_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_expires_at_idx ON auth.webauthn_challenges USING btree (expires_at);


--
-- Name: webauthn_challenges_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_user_id_idx ON auth.webauthn_challenges USING btree (user_id);


--
-- Name: webauthn_credentials_credential_id_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX webauthn_credentials_credential_id_key ON auth.webauthn_credentials USING btree (credential_id);


--
-- Name: webauthn_credentials_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_credentials_user_id_idx ON auth.webauthn_credentials USING btree (user_id);


--
-- Name: idx_dishes_provider_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dishes_provider_id ON public.dishes USING btree (provider_id);


--
-- Name: idx_dishes_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dishes_status ON public.dishes USING btree (status);


--
-- Name: idx_orders_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_status ON public.orders USING btree (status);


--
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_user_id ON public.orders USING btree (user_id);


--
-- Name: idx_otp_codes_phone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_otp_codes_phone ON public.otp_codes USING btree (phone);


--
-- Name: idx_service_categories_sort_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_service_categories_sort_order ON public.service_categories USING btree (sort_order);


--
-- Name: idx_service_items_service_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_service_items_service_id ON public.service_items USING btree (service_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_07_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_06_07_inserted_at_topic_idx ON realtime.messages_2026_06_07 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_08_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_06_08_inserted_at_topic_idx ON realtime.messages_2026_06_08 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_09_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_06_09_inserted_at_topic_idx ON realtime.messages_2026_06_09 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_10_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_06_10_inserted_at_topic_idx ON realtime.messages_2026_06_10 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_11_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_06_11_inserted_at_topic_idx ON realtime.messages_2026_06_11 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_12_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_06_12_inserted_at_topic_idx ON realtime.messages_2026_06_12 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_selec; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_selec ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter, COALESCE(selected_columns, '{}'::text[]));


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name_lower ON storage.objects USING btree (bucket_id, lower(name) COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: messages_2026_06_07_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_07_inserted_at_topic_idx;


--
-- Name: messages_2026_06_07_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_07_pkey;


--
-- Name: messages_2026_06_08_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_08_inserted_at_topic_idx;


--
-- Name: messages_2026_06_08_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_08_pkey;


--
-- Name: messages_2026_06_09_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_09_inserted_at_topic_idx;


--
-- Name: messages_2026_06_09_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_09_pkey;


--
-- Name: messages_2026_06_10_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_10_inserted_at_topic_idx;


--
-- Name: messages_2026_06_10_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_10_pkey;


--
-- Name: messages_2026_06_11_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_11_inserted_at_topic_idx;


--
-- Name: messages_2026_06_11_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_11_pkey;


--
-- Name: messages_2026_06_12_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_12_inserted_at_topic_idx;


--
-- Name: messages_2026_06_12_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_12_pkey;


--
-- Name: products auto_set_merchant_id_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER auto_set_merchant_id_trigger BEFORE INSERT OR UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.auto_set_merchant_id();


--
-- Name: profiles create_merchant_record_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER create_merchant_record_trigger AFTER INSERT ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.auto_create_merchant_record();


--
-- Name: service_fields prevent_duplicate_fields; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER prevent_duplicate_fields BEFORE INSERT ON public.service_fields FOR EACH ROW EXECUTE FUNCTION public.check_duplicate_field();


--
-- Name: orders set_merchant_id_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_merchant_id_trigger BEFORE INSERT ON public.orders FOR EACH ROW EXECUTE FUNCTION public.auto_set_merchant_id();


--
-- Name: orders set_order_merchant_id_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_order_merchant_id_trigger BEFORE INSERT ON public.orders FOR EACH ROW EXECUTE FUNCTION public.set_order_merchant_id();


--
-- Name: full_services trigger_auto_create_merchant; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_auto_create_merchant AFTER INSERT ON public.full_services FOR EACH ROW EXECUTE FUNCTION public.auto_create_merchant_for_full_service();


--
-- Name: profiles trigger_auto_create_merchant; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_auto_create_merchant AFTER INSERT OR UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.auto_create_merchant_record();


--
-- Name: services trigger_copy_merchant_on_new_service; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_copy_merchant_on_new_service AFTER INSERT ON public.services FOR EACH ROW EXECUTE FUNCTION public.copy_merchant_on_new_service();


--
-- Name: sub_services trigger_copy_service_fields; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_copy_service_fields AFTER INSERT ON public.sub_services FOR EACH ROW EXECUTE FUNCTION public.copy_service_fields_on_new_sub();


--
-- Name: services trigger_copy_sub_services; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_copy_sub_services AFTER INSERT ON public.services FOR EACH ROW EXECUTE FUNCTION public.copy_sub_services_on_new_service();


--
-- Name: orders update_orders_modtime; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_orders_modtime BEFORE UPDATE ON public.orders FOR EACH ROW EXECUTE FUNCTION public.update_modified_column();


--
-- Name: profiles update_profiles_modtime; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_profiles_modtime BEFORE UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.update_modified_column();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: webauthn_challenges webauthn_challenges_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: webauthn_credentials webauthn_credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: dishes dishes_merchant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_merchant_id_fkey FOREIGN KEY (merchant_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: merchant_product_prices merchant_product_prices_template_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_product_prices
    ADD CONSTRAINT merchant_product_prices_template_product_id_fkey FOREIGN KEY (template_product_id) REFERENCES public.template_products(id) ON DELETE CASCADE;


--
-- Name: merchant_sub_services merchant_sub_services_merchant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_sub_services
    ADD CONSTRAINT merchant_sub_services_merchant_id_fkey FOREIGN KEY (merchant_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: merchant_sub_services merchant_sub_services_sub_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merchant_sub_services
    ADD CONSTRAINT merchant_sub_services_sub_service_id_fkey FOREIGN KEY (sub_service_id) REFERENCES public.sub_services(id) ON DELETE CASCADE;


--
-- Name: orders orders_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles(id);


--
-- Name: places places_merchant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_merchant_id_fkey FOREIGN KEY (merchant_id) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- Name: product_variants product_variants_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT product_variants_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.service_items(id) ON DELETE CASCADE;


--
-- Name: products products_merchant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_merchant_id_fkey FOREIGN KEY (merchant_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: profiles profiles_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE SET NULL;


--
-- Name: profiles profiles_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id) ON DELETE SET NULL;


--
-- Name: service_fields_new service_fields_new_sub_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_fields_new
    ADD CONSTRAINT service_fields_new_sub_service_id_fkey FOREIGN KEY (sub_service_id) REFERENCES public.sub_services(id) ON DELETE CASCADE;


--
-- Name: sub_services sub_services_full_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_services
    ADD CONSTRAINT sub_services_full_service_id_fkey FOREIGN KEY (full_service_id) REFERENCES public.full_services(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: orders Admins can manage all orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can manage all orders" ON public.orders TO authenticated USING (((auth.jwt() ->> 'role'::text) = 'admin'::text));


--
-- Name: rest2_items Allow admin all; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow admin all" ON public.rest2_items USING (true);


--
-- Name: shop_reviews Allow admin select all; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow admin select all" ON public.shop_reviews FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: shop_reviews Allow all; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow all" ON public.shop_reviews USING (true);


--
-- Name: product_categories Allow all operations; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow all operations" ON public.product_categories USING (true) WITH CHECK (true);


--
-- Name: otp_codes Allow all operations for authenticated users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow all operations for authenticated users" ON public.otp_codes USING (true);


--
-- Name: shop_reviews Allow insert for all; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow insert for all" ON public.shop_reviews FOR INSERT WITH CHECK (true);


--
-- Name: rest2_items Allow public read; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow public read" ON public.rest2_items FOR SELECT USING (true);


--
-- Name: shop_reviews Allow select approved; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow select approved" ON public.shop_reviews FOR SELECT USING ((is_approved = true));


--
-- Name: profiles Allow users to update own email; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow users to update own email" ON public.profiles FOR UPDATE USING ((auth.uid() = id)) WITH CHECK ((auth.uid() = id));


--
-- Name: orders Anyone can create orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can create orders" ON public.orders FOR INSERT WITH CHECK (true);


--
-- Name: orders Anyone can read orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can read orders" ON public.orders FOR SELECT USING (true);


--
-- Name: reviews Anyone can read reviews; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can read reviews" ON public.reviews FOR SELECT USING (true);


--
-- Name: service_categories Anyone can read service_categories; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can read service_categories" ON public.service_categories FOR SELECT USING (true);


--
-- Name: orders Anyone can update orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can update orders" ON public.orders FOR UPDATE USING (true);


--
-- Name: service_categories Authenticated users can modify service_categories; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can modify service_categories" ON public.service_categories USING ((auth.role() = 'authenticated'::text)) WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: reviews Customers can create reviews; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Customers can create reviews" ON public.reviews FOR INSERT WITH CHECK (true);


--
-- Name: orders Customers can read own orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Customers can read own orders" ON public.orders FOR SELECT USING ((customer_phone = (auth.jwt() ->> 'phone'::text)));


--
-- Name: orders Drivers can read assigned orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Drivers can read assigned orders" ON public.orders FOR SELECT USING (((driver_id)::text = (auth.jwt() ->> 'id'::text)));


--
-- Name: app_settings Enable all for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable all for all users" ON public.app_settings USING (true) WITH CHECK (true);


--
-- Name: orders Merchants can read orders by service; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Merchants can read orders by service" ON public.orders FOR SELECT USING ((service_type = (auth.jwt() ->> 'merchant_type'::text)));


--
-- Name: assistants allow_all_assistants; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_assistants ON public.assistants USING (true) WITH CHECK (true);


--
-- Name: dishes allow_all_dishes; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_dishes ON public.dishes USING (true) WITH CHECK (true);


--
-- Name: item_prices allow_all_item_prices; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_item_prices ON public.item_prices USING (true) WITH CHECK (true);


--
-- Name: merchants allow_all_merchants; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_merchants ON public.merchants USING (true) WITH CHECK (true);


--
-- Name: orders allow_all_orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_orders ON public.orders USING (true) WITH CHECK (true);


--
-- Name: places allow_all_places; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_places ON public.places USING (true) WITH CHECK (true);


--
-- Name: product_variants allow_all_product_variants; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_product_variants ON public.product_variants USING (true) WITH CHECK (true);


--
-- Name: products allow_all_products; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_products ON public.products USING (true) WITH CHECK (true);


--
-- Name: profiles allow_all_profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_profiles ON public.profiles USING (true) WITH CHECK (true);


--
-- Name: restaurants allow_all_restaurants; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_restaurants ON public.restaurants USING (true) WITH CHECK (true);


--
-- Name: service_items allow_all_service_items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_service_items ON public.service_items USING (true) WITH CHECK (true);


--
-- Name: services allow_all_services; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_services ON public.services USING (true) WITH CHECK (true);


--
-- Name: user_tokens allow_all_user_tokens; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_all_user_tokens ON public.user_tokens USING (true) WITH CHECK (true);


--
-- Name: products allow_insert_update_products; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_insert_update_products ON public.products USING ((auth.role() = 'authenticated'::text)) WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: products allow_select_products; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY allow_select_products ON public.products FOR SELECT USING (true);


--
-- Name: assistants; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.assistants ENABLE ROW LEVEL SECURITY;

--
-- Name: dishes; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.dishes ENABLE ROW LEVEL SECURITY;

--
-- Name: item_prices; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.item_prices ENABLE ROW LEVEL SECURITY;

--
-- Name: merchants; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.merchants ENABLE ROW LEVEL SECURITY;

--
-- Name: orders; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;

--
-- Name: otp_codes; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.otp_codes ENABLE ROW LEVEL SECURITY;

--
-- Name: places; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.places ENABLE ROW LEVEL SECURITY;

--
-- Name: product_categories; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.product_categories ENABLE ROW LEVEL SECURITY;

--
-- Name: product_variants; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.product_variants ENABLE ROW LEVEL SECURITY;

--
-- Name: products; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: rest2_items; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.rest2_items ENABLE ROW LEVEL SECURITY;

--
-- Name: restaurants; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.restaurants ENABLE ROW LEVEL SECURITY;

--
-- Name: reviews; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.reviews ENABLE ROW LEVEL SECURITY;

--
-- Name: service_items; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.service_items ENABLE ROW LEVEL SECURITY;

--
-- Name: services; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.services ENABLE ROW LEVEL SECURITY;

--
-- Name: shop_reviews; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.shop_reviews ENABLE ROW LEVEL SECURITY;

--
-- Name: user_tokens; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: service_items الكل يستطيع قراءة الأصناف; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "الكل يستطيع قراءة الأصناف" ON public.service_items FOR SELECT USING (true);


--
-- Name: service_items المستخدمون المسجلون يستطيعون إدار; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "المستخدمون المسجلون يستطيعون إدار" ON public.service_items USING ((auth.role() = 'authenticated'::text));


--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Allow Uploads; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow Uploads" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'splash_gifs'::text));


--
-- Name: objects Allow authenticated upload; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow authenticated upload" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'order-files'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Allow delete own files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow delete own files" ON storage.objects FOR DELETE USING (((bucket_id = 'order-files'::text) AND (auth.uid() = owner)));


--
-- Name: objects Allow public read access; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow public read access" ON storage.objects FOR SELECT USING ((bucket_id = 'order-files'::text));


--
-- Name: objects Allow update own files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow update own files" ON storage.objects FOR UPDATE USING (((bucket_id = 'order-files'::text) AND (auth.uid() = owner)));


--
-- Name: objects Allow uploads; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow uploads" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'splash_gifs'::text));


--
-- Name: objects Public Access; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Public Access" ON storage.objects FOR SELECT USING ((bucket_id = 'splash_gifs'::text));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: supabase_admin
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime_messages_publication OWNER TO supabase_admin;

--
-- Name: supabase_realtime orders; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.orders;


--
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: supabase_admin
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION auto_create_merchant_for_full_service(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.auto_create_merchant_for_full_service() TO anon;
GRANT ALL ON FUNCTION public.auto_create_merchant_for_full_service() TO authenticated;
GRANT ALL ON FUNCTION public.auto_create_merchant_for_full_service() TO service_role;


--
-- Name: FUNCTION auto_create_merchant_record(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.auto_create_merchant_record() TO anon;
GRANT ALL ON FUNCTION public.auto_create_merchant_record() TO authenticated;
GRANT ALL ON FUNCTION public.auto_create_merchant_record() TO service_role;


--
-- Name: FUNCTION auto_set_merchant_id(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.auto_set_merchant_id() TO anon;
GRANT ALL ON FUNCTION public.auto_set_merchant_id() TO authenticated;
GRANT ALL ON FUNCTION public.auto_set_merchant_id() TO service_role;


--
-- Name: FUNCTION check_duplicate_field(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.check_duplicate_field() TO anon;
GRANT ALL ON FUNCTION public.check_duplicate_field() TO authenticated;
GRANT ALL ON FUNCTION public.check_duplicate_field() TO service_role;


--
-- Name: FUNCTION copy_merchant_on_new_service(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.copy_merchant_on_new_service() TO anon;
GRANT ALL ON FUNCTION public.copy_merchant_on_new_service() TO authenticated;
GRANT ALL ON FUNCTION public.copy_merchant_on_new_service() TO service_role;


--
-- Name: FUNCTION copy_service_fields_on_new_sub(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.copy_service_fields_on_new_sub() TO anon;
GRANT ALL ON FUNCTION public.copy_service_fields_on_new_sub() TO authenticated;
GRANT ALL ON FUNCTION public.copy_service_fields_on_new_sub() TO service_role;


--
-- Name: FUNCTION copy_sub_services_on_new_service(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.copy_sub_services_on_new_service() TO anon;
GRANT ALL ON FUNCTION public.copy_sub_services_on_new_service() TO authenticated;
GRANT ALL ON FUNCTION public.copy_sub_services_on_new_service() TO service_role;


--
-- Name: FUNCTION delete_place_with_products(place_id_param bigint); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.delete_place_with_products(place_id_param bigint) TO anon;
GRANT ALL ON FUNCTION public.delete_place_with_products(place_id_param bigint) TO authenticated;
GRANT ALL ON FUNCTION public.delete_place_with_products(place_id_param bigint) TO service_role;


--
-- Name: FUNCTION notify_sound_update(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.notify_sound_update() TO anon;
GRANT ALL ON FUNCTION public.notify_sound_update() TO authenticated;
GRANT ALL ON FUNCTION public.notify_sound_update() TO service_role;


--
-- Name: FUNCTION set_order_merchant_id(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.set_order_merchant_id() TO anon;
GRANT ALL ON FUNCTION public.set_order_merchant_id() TO authenticated;
GRANT ALL ON FUNCTION public.set_order_merchant_id() TO service_role;


--
-- Name: FUNCTION sync_full_service_data(p_service_id text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.sync_full_service_data(p_service_id text) TO anon;
GRANT ALL ON FUNCTION public.sync_full_service_data(p_service_id text) TO authenticated;
GRANT ALL ON FUNCTION public.sync_full_service_data(p_service_id text) TO service_role;


--
-- Name: FUNCTION update_modified_column(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_modified_column() TO anon;
GRANT ALL ON FUNCTION public.update_modified_column() TO authenticated;
GRANT ALL ON FUNCTION public.update_modified_column() TO service_role;


--
-- Name: FUNCTION upsert_full_service_with_subs(p_service_id text, p_service_name text, p_icon text, p_color text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.upsert_full_service_with_subs(p_service_id text, p_service_name text, p_icon text, p_color text) TO anon;
GRANT ALL ON FUNCTION public.upsert_full_service_with_subs(p_service_id text, p_service_name text, p_icon text, p_color text) TO authenticated;
GRANT ALL ON FUNCTION public.upsert_full_service_with_subs(p_service_id text, p_service_name text, p_icon text, p_color text) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION send_binary(payload bytea, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION wal2json_escape_identifier(name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.wal2json_escape_identifier(name text) TO postgres;
GRANT ALL ON FUNCTION realtime.wal2json_escape_identifier(name text) TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE custom_oauth_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.custom_oauth_providers TO postgres;
GRANT ALL ON TABLE auth.custom_oauth_providers TO dashboard_user;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE webauthn_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_challenges TO postgres;
GRANT ALL ON TABLE auth.webauthn_challenges TO dashboard_user;


--
-- Name: TABLE webauthn_credentials; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_credentials TO postgres;
GRANT ALL ON TABLE auth.webauthn_credentials TO dashboard_user;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE merchant_product_prices; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.merchant_product_prices TO anon;
GRANT ALL ON TABLE public.merchant_product_prices TO authenticated;
GRANT ALL ON TABLE public.merchant_product_prices TO service_role;


--
-- Name: TABLE merchants; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.merchants TO anon;
GRANT ALL ON TABLE public.merchants TO authenticated;
GRANT ALL ON TABLE public.merchants TO service_role;


--
-- Name: TABLE template_products; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.template_products TO anon;
GRANT ALL ON TABLE public.template_products TO authenticated;
GRANT ALL ON TABLE public.template_products TO service_role;


--
-- Name: TABLE all_merchant_products; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.all_merchant_products TO anon;
GRANT ALL ON TABLE public.all_merchant_products TO authenticated;
GRANT ALL ON TABLE public.all_merchant_products TO service_role;


--
-- Name: TABLE app_settings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.app_settings TO anon;
GRANT ALL ON TABLE public.app_settings TO authenticated;
GRANT ALL ON TABLE public.app_settings TO service_role;


--
-- Name: SEQUENCE app_settings_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.app_settings_id_seq TO anon;
GRANT ALL ON SEQUENCE public.app_settings_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.app_settings_id_seq TO service_role;


--
-- Name: TABLE assistants; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.assistants TO anon;
GRANT ALL ON TABLE public.assistants TO authenticated;
GRANT ALL ON TABLE public.assistants TO service_role;


--
-- Name: SEQUENCE assistants_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.assistants_id_seq TO anon;
GRANT ALL ON SEQUENCE public.assistants_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.assistants_id_seq TO service_role;


--
-- Name: TABLE dishes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.dishes TO anon;
GRANT ALL ON TABLE public.dishes TO authenticated;
GRANT ALL ON TABLE public.dishes TO service_role;


--
-- Name: SEQUENCE dishes_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.dishes_id_seq TO anon;
GRANT ALL ON SEQUENCE public.dishes_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.dishes_id_seq TO service_role;


--
-- Name: TABLE full_services; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.full_services TO anon;
GRANT ALL ON TABLE public.full_services TO authenticated;
GRANT ALL ON TABLE public.full_services TO service_role;


--
-- Name: TABLE home_chefs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.home_chefs TO anon;
GRANT ALL ON TABLE public.home_chefs TO authenticated;
GRANT ALL ON TABLE public.home_chefs TO service_role;


--
-- Name: SEQUENCE home_chefs_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.home_chefs_id_seq TO anon;
GRANT ALL ON SEQUENCE public.home_chefs_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.home_chefs_id_seq TO service_role;


--
-- Name: TABLE item_prices; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.item_prices TO anon;
GRANT ALL ON TABLE public.item_prices TO authenticated;
GRANT ALL ON TABLE public.item_prices TO service_role;


--
-- Name: SEQUENCE item_prices_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.item_prices_id_seq TO anon;
GRANT ALL ON SEQUENCE public.item_prices_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.item_prices_id_seq TO service_role;


--
-- Name: TABLE laundry_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.laundry_items TO anon;
GRANT ALL ON TABLE public.laundry_items TO authenticated;
GRANT ALL ON TABLE public.laundry_items TO service_role;


--
-- Name: SEQUENCE laundry_items_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.laundry_items_id_seq TO anon;
GRANT ALL ON SEQUENCE public.laundry_items_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.laundry_items_id_seq TO service_role;


--
-- Name: TABLE merchant_sub_services; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.merchant_sub_services TO anon;
GRANT ALL ON TABLE public.merchant_sub_services TO authenticated;
GRANT ALL ON TABLE public.merchant_sub_services TO service_role;


--
-- Name: TABLE offers; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.offers TO anon;
GRANT ALL ON TABLE public.offers TO authenticated;
GRANT ALL ON TABLE public.offers TO service_role;


--
-- Name: SEQUENCE offers_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.offers_id_seq TO anon;
GRANT ALL ON SEQUENCE public.offers_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.offers_id_seq TO service_role;


--
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.orders TO anon;
GRANT ALL ON TABLE public.orders TO authenticated;
GRANT ALL ON TABLE public.orders TO service_role;


--
-- Name: TABLE otp_codes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.otp_codes TO anon;
GRANT ALL ON TABLE public.otp_codes TO authenticated;
GRANT ALL ON TABLE public.otp_codes TO service_role;


--
-- Name: TABLE places; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.places TO anon;
GRANT ALL ON TABLE public.places TO authenticated;
GRANT ALL ON TABLE public.places TO service_role;


--
-- Name: TABLE product_categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.product_categories TO anon;
GRANT ALL ON TABLE public.product_categories TO authenticated;
GRANT ALL ON TABLE public.product_categories TO service_role;


--
-- Name: TABLE product_variants; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.product_variants TO anon;
GRANT ALL ON TABLE public.product_variants TO authenticated;
GRANT ALL ON TABLE public.product_variants TO service_role;


--
-- Name: TABLE products; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.products TO anon;
GRANT ALL ON TABLE public.products TO authenticated;
GRANT ALL ON TABLE public.products TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- Name: TABLE regions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.regions TO anon;
GRANT ALL ON TABLE public.regions TO authenticated;
GRANT ALL ON TABLE public.regions TO service_role;


--
-- Name: TABLE rest2_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.rest2_items TO anon;
GRANT ALL ON TABLE public.rest2_items TO authenticated;
GRANT ALL ON TABLE public.rest2_items TO service_role;


--
-- Name: TABLE restaurants; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.restaurants TO anon;
GRANT ALL ON TABLE public.restaurants TO authenticated;
GRANT ALL ON TABLE public.restaurants TO service_role;


--
-- Name: SEQUENCE restaurants_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.restaurants_id_seq TO anon;
GRANT ALL ON SEQUENCE public.restaurants_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.restaurants_id_seq TO service_role;


--
-- Name: TABLE reviews; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.reviews TO anon;
GRANT ALL ON TABLE public.reviews TO authenticated;
GRANT ALL ON TABLE public.reviews TO service_role;


--
-- Name: SEQUENCE reviews_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.reviews_id_seq TO anon;
GRANT ALL ON SEQUENCE public.reviews_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.reviews_id_seq TO service_role;


--
-- Name: TABLE service_categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.service_categories TO anon;
GRANT ALL ON TABLE public.service_categories TO authenticated;
GRANT ALL ON TABLE public.service_categories TO service_role;


--
-- Name: TABLE service_fields; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.service_fields TO anon;
GRANT ALL ON TABLE public.service_fields TO authenticated;
GRANT ALL ON TABLE public.service_fields TO service_role;


--
-- Name: TABLE service_fields_new; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.service_fields_new TO anon;
GRANT ALL ON TABLE public.service_fields_new TO authenticated;
GRANT ALL ON TABLE public.service_fields_new TO service_role;


--
-- Name: TABLE service_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.service_items TO anon;
GRANT ALL ON TABLE public.service_items TO authenticated;
GRANT ALL ON TABLE public.service_items TO service_role;


--
-- Name: TABLE service_tracking_steps; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.service_tracking_steps TO anon;
GRANT ALL ON TABLE public.service_tracking_steps TO authenticated;
GRANT ALL ON TABLE public.service_tracking_steps TO service_role;


--
-- Name: TABLE services; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.services TO anon;
GRANT ALL ON TABLE public.services TO authenticated;
GRANT ALL ON TABLE public.services TO service_role;


--
-- Name: TABLE shop_products; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.shop_products TO anon;
GRANT ALL ON TABLE public.shop_products TO authenticated;
GRANT ALL ON TABLE public.shop_products TO service_role;


--
-- Name: TABLE shop_reviews; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.shop_reviews TO anon;
GRANT ALL ON TABLE public.shop_reviews TO authenticated;
GRANT ALL ON TABLE public.shop_reviews TO service_role;


--
-- Name: TABLE shop_settings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.shop_settings TO anon;
GRANT ALL ON TABLE public.shop_settings TO authenticated;
GRANT ALL ON TABLE public.shop_settings TO service_role;


--
-- Name: TABLE sub_services; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.sub_services TO anon;
GRANT ALL ON TABLE public.sub_services TO authenticated;
GRANT ALL ON TABLE public.sub_services TO service_role;


--
-- Name: TABLE user_tokens; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_tokens TO anon;
GRANT ALL ON TABLE public.user_tokens TO authenticated;
GRANT ALL ON TABLE public.user_tokens TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE messages_2026_06_07; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_06_07 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_06_07 TO dashboard_user;


--
-- Name: TABLE messages_2026_06_08; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_06_08 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_06_08 TO dashboard_user;


--
-- Name: TABLE messages_2026_06_09; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_06_09 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_06_09 TO dashboard_user;


--
-- Name: TABLE messages_2026_06_10; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_06_10 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_06_10 TO dashboard_user;


--
-- Name: TABLE messages_2026_06_11; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_06_11 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_06_11 TO dashboard_user;


--
-- Name: TABLE messages_2026_06_12; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_06_12 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_06_12 TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict M5sromKdzG1b6eygeiMQUlliicg85SBPQh9bvbgMWrfE9qYgSiKjjmNqndibRCc

