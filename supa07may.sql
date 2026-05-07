--
-- PostgreSQL database dump
--

\restrict ECP6PddwdQYvp8hAdfmjbwojkJMt4d6vmOFRwfslML0UYPcSMKv78DOCa86ebDY

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
  -- إذا كان الدور تاجر، أضفه لجدول merchants
    IF NEW.role = 'merchant' THEN
        INSERT INTO merchants (id, user_id, name, phone, service_type, is_active, created_at, updated_at)
            VALUES (
                  NEW.id,
                        NEW.id,
                              NEW.full_name,
                                    NEW.phone,
                                          NEW.merchant_type,
                                                true,
                                                      NOW(),
                                                            NOW()
                                                                )
                                                                    ON CONFLICT (id) DO UPDATE SET
                                                                          name = NEW.full_name,
                                                                                phone = NEW.phone,
                                                                                      service_type = NEW.merchant_type,
                                                                                            updated_at = NOW();
                                                                                              END IF;
                                                                                                RETURN NEW;
                                                                                                END;
                                                                                                $$;


ALTER FUNCTION public.auto_create_merchant_record() OWNER TO postgres;

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
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
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

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
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
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
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
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
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
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

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
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

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
        ) filter (WHERE ppt.tablename IS NOT NULL AND ppt.tablename NOT LIKE '% %'),
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
  -- Count raw slot entries before apply_rls/subscription filter
  slot_count AS (
    SELECT count(*)::bigint AS cnt
    FROM w2j
    WHERE w2j.w2j_add_tables <> ''
  ),
  -- Apply RLS and filter as before
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
  -- Real rows with slot count attached
  SELECT rf.wal, rf.is_rls_enabled, rf.subscription_ids, rf.errors, sc.cnt
  FROM rls_filtered rf, slot_count sc

  UNION ALL

  -- Sentinel row: always returned when no real rows exist so Elixir can
  -- always read slot_changes_count. Identified by wal IS NULL.
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
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
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
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
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
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
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

            -- Set maximum number of entries for in filter
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

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

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
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
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
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
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
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
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
    updated_at timestamp without time zone
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
    updated_at timestamp without time zone DEFAULT now()
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
-- Name: merchant_product_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merchant_product_prices (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    merchant_id uuid NOT NULL,
    template_product_id uuid,
    price numeric DEFAULT 0,
    is_available boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.merchant_product_prices OWNER TO postgres;

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
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.merchants OWNER TO postgres;

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
    status text DEFAULT 'pending'::text,
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
    guest_phone text
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
    updated_at timestamp with time zone DEFAULT now()
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
    category_id uuid
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
    region_id uuid
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
    updated_at timestamp with time zone DEFAULT now()
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
    id text NOT NULL,
    name text NOT NULL,
    icon text DEFAULT 'apps-outline'::text,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    image_url text
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
    placeholder text DEFAULT ''::text
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
    full_service_id uuid
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
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.shop_products OWNER TO postgres;

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
    show_title boolean DEFAULT true
);


ALTER TABLE public.sub_services OWNER TO postgres;

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
    category_id uuid
);


ALTER TABLE public.template_products OWNER TO postgres;

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
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_2026_04_11; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_04_11 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_04_11 OWNER TO supabase_admin;

--
-- Name: messages_2026_04_12; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_04_12 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_04_12 OWNER TO supabase_admin;

--
-- Name: messages_2026_04_13; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_04_13 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_04_13 OWNER TO supabase_admin;

--
-- Name: messages_2026_04_14; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_04_14 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_04_14 OWNER TO supabase_admin;

--
-- Name: messages_2026_04_15; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_04_15 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_04_15 OWNER TO supabase_admin;

--
-- Name: messages_2026_04_16; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_04_16 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_04_16 OWNER TO supabase_admin;

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
-- Name: messages_2026_04_11; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_04_11 FOR VALUES FROM ('2026-04-11 00:00:00') TO ('2026-04-12 00:00:00');


--
-- Name: messages_2026_04_12; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_04_12 FOR VALUES FROM ('2026-04-12 00:00:00') TO ('2026-04-13 00:00:00');


--
-- Name: messages_2026_04_13; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_04_13 FOR VALUES FROM ('2026-04-13 00:00:00') TO ('2026-04-14 00:00:00');


--
-- Name: messages_2026_04_14; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_04_14 FOR VALUES FROM ('2026-04-14 00:00:00') TO ('2026-04-15 00:00:00');


--
-- Name: messages_2026_04_15; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_04_15 FOR VALUES FROM ('2026-04-15 00:00:00') TO ('2026-04-16 00:00:00');


--
-- Name: messages_2026_04_16; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_04_16 FOR VALUES FROM ('2026-04-16 00:00:00') TO ('2026-04-17 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


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
de2ef09a-eda8-4218-a9da-c3f9a58e8ec2	de2ef09a-eda8-4218-a9da-c3f9a58e8ec2	{"sub": "de2ef09a-eda8-4218-a9da-c3f9a58e8ec2", "name": "ايمن", "role": "merchant", "email": "01022222222@temp.com", "phone": "01022222222", "email_verified": false, "phone_verified": false}	email	2026-03-18 21:52:53.605023+00	2026-03-18 21:52:53.605077+00	2026-03-18 21:52:53.605077+00	0dc87a11-9959-4d10-9660-671b5b431744
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
b5247635-9028-48de-ba65-38873d790b31	de2ef09a-eda8-4218-a9da-c3f9a58e8ec2	confirmation_token	ce09b71982c51c0bff65e9100b83947b611af0a640403409b9ec91af	01022222222@temp.com	2026-03-18 21:56:05.256029	2026-03-18 21:56:05.256029
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
00000000-0000-0000-0000-000000000000	de2ef09a-eda8-4218-a9da-c3f9a58e8ec2	authenticated	authenticated	01022222222@temp.com	$2a$10$C.bTJGR.pExv5nVLe5VTwOT9mCJwFMX6nYbidwD3Ymx9Ai8batO8G	\N	\N	ce09b71982c51c0bff65e9100b83947b611af0a640403409b9ec91af	2026-03-18 21:56:04.865303+00		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{"sub": "de2ef09a-eda8-4218-a9da-c3f9a58e8ec2", "name": "ايمن", "role": "merchant", "email": "01022222222@temp.com", "phone": "01022222222", "email_verified": false, "phone_verified": false}	\N	2026-03-18 21:52:53.582176+00	2026-03-18 21:56:05.226163+00	\N	\N			\N		0	\N		\N	f	\N	f
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
-- Data for Name: assistants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assistants (id, name, specialty, bio, created_at, screen, icon, color, "position", "order", model, role, prompt, service_id, service_name, is_active, welcome_message, system_prompt, updated_at) FROM stdin;
8	جيمي	\N	\N	2026-04-18 13:15:06.169+00	service	chatbubble	#EC4899	bottom-right	0	llama-3.3-70b-versatile	general	\N	supermarket	سوبر ماركت	t	اهلا بك في Zid ... ازاي اقدر أساعدك	أنت "مساعد زايد الذكي"، اسمك جيمي الخبير الأول بكل خدمات ومنتجات السوبر ماركت في منطقة الشيخ زايد. وظيفتك هي مساعدة المستخدمين في اختيار طلباتهم، ترشيح أفضل المنتجات، وتسهيل عملية التسوق بذكاء وخفة دم مصرية.\n​اللغة والأسلوب:\n​اللغة: اللهجة المصرية العامية البيضاء (القريبة من لغة سكان الشيخ زايد).\n​الروح: خدوم، سريع البديهة، مؤدب، وبيركز على التفاصيل.\n​التفاعل: استخدم إيموجيز مناسبة (🛒, 🍎, ✨, 🛵) لكسر جمود الكلام.\n​النطاق المعرفي (السوبر ماركت):\n​المنتجات: عندك معرفة كاملة بكل أنواع المنتجات (ألبان، أجبان، معلبات، خضار وفاكهة، منظفات، مسليات/مقالي).\n​الترشيحات: لو المستخدم محتار، اقترح عليه أفضل الماركات بناءً على الجودة والسعر (مثلاً: "لو عايز جبنة طعمها غني للسندوتشات، أرشح لك [ماركة]..").\n​المقادير: لو المستخدم سأل عن طبخة، قوله على المكونات اللي محتاجها من السوبر ماركت فوراً.\n​بدائل المنتجات: لو في منتج مشهور ناقص أو غالي، اقترح البديل الكفء له.\n​قواعد التعامل:\n​خليك مباشر: "عنيا ليك، محتاج أساعدك في إيه النهاردة في طلبات البيت؟"\n​تجنب الكلام الرسمي: متقولش "عزيزي العميل" أو "كيف يمكنني مساعدتك"، قول "يا بطل"، "يا غالي"، "نورت التطبيق".\n​الدقة: لو سألك عن منتج معين، وضح له لو في منه أحجام مختلفة (عائلي، صغير، لتر، إلخ).\n​مثال لطريقة الرد:\nالمستخدم: "عايز حاجات للسهرة النهاردة بس تكون خفيفة."\nالرد: "سهرة سعيدة يا باشا! بص، ممكن نجيب شوية تسالي من المقلى (لب وسوداني)، ومعاهم زبادي يوناني بالعسل لو عايز حاجة خفيفة فعلاً، وممكن شوية فاكهة فريش زي الفراولة أو الكيوي. تحب أضيفهم لك في السلة؟ 🍓🥜"	2026-04-18 13:31:32.27
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dishes (id, restaurant_id, name, price, description, image_url, created_at, merchant_id, provider_id, provider_type, provider_name, category, ingredients, video_url, rejection_reason, is_available, status, merchant_name, service_id, images, updated_at) FROM stdin;
3	\N	شاورما لحم سوري	140	لحم	\N	2026-03-28 19:53:24.157+00	\N	38b05fe8-9b97-4431-a5f9-76ab88323c70	restaurant	\N	\N	{}	https://ik.imagekit.io/vzuah6tku/zayedid/misc/dish_video_1774727573952_9RmL8ZHM7.mp4	\N	t	approved	\N	\N	{https://ik.imagekit.io/vzuah6tku/zayedid/misc/dish_1774727572471_ZnDWMWHBU.jpg}	2026-03-28 20:22:19.062
2	\N	شاورما سوري	120	عيش سوري	\N	2026-03-28 19:46:18.138+00	\N	38b05fe8-9b97-4431-a5f9-76ab88323c70	restaurant	\N	شاميه	{"لحم بلدي","عيش سوري"}	https://ik.imagekit.io/vzuah6tku/zayedid/misc/dish_video_1774727169429_PmSJk0CSl.mp4	\N	t	approved	\N	\N	{}	2026-03-28 20:22:22.969
1	\N	فراخ	500		\N	2026-03-27 05:40:51.435+00	\N	51108e8c-1e91-4eb8-aff1-7a45c6406760	restaurant	\N	\N	{}	\N	\N	t	approved	\N	\N	{}	2026-03-28 20:22:25.992
4	\N	فرخه متبله	300		\N	2026-04-08 17:00:26.19+00	\N	38b05fe8-9b97-4431-a5f9-76ab88323c70	restaurant	\N	\N	{فراخ,خبز}	\N	\N	t	approved	\N	\N	{}	2026-04-08 17:01:10.371
5	\N	برجر مكس	70		https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1776553944503_6xbxGNPL5.jpg	2026-04-18 23:12:27.358744+00	\N	38b05fe8-9b97-4431-a5f9-76ab88323c70	restaurant	مطعم انس	\N	\N	\N	\N	t	pending	\N	\N	{}	2026-04-18 23:12:27.358744
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

COPY public.merchant_product_prices (id, merchant_id, template_product_id, price, is_available, created_at) FROM stdin;
13c2cf08-4e45-4c1f-9bff-d135119f2f57	2853336e-f393-4c4d-9d95-b7a17d4e2fb9	e976ea5d-b967-45e9-b4d1-f9bbe0493c24	55	t	2026-04-27 01:22:21.858027+00
6f00df28-b91e-4cd8-849b-05c5f9903f86	0ff923e8-2d14-43e0-b9df-1e7265b9860f	21c75f9f-679b-40d3-bb9a-0ad38c3806f1	150	t	2026-04-27 18:16:20.385267+00
cd4b29f4-c7cf-41b9-8b08-c6d10d4cb5c8	0ff923e8-2d14-43e0-b9df-1e7265b9860f	9ebabb39-882b-43b6-8143-7a3448eb6340	55	t	2026-04-27 01:33:28.524138+00
0aefd7ba-4bde-4a0c-a8fc-61b1c3e173a8	2853336e-f393-4c4d-9d95-b7a17d4e2fb9	9ebabb39-882b-43b6-8143-7a3448eb6340	55	t	2026-04-27 00:57:18.769566+00
847964b1-5a2d-4810-aeba-49c17ef8483f	2853336e-f393-4c4d-9d95-b7a17d4e2fb9	8ecedb6f-2c64-4f66-8049-f9bf0869ae20	66	t	2026-04-28 00:26:56.019759+00
0e2fefbf-b061-4f3a-8885-8139b698dcf0	d6d911dd-76c0-4962-bdae-ab54ef74f5a6	c7c9d5ea-c76b-41e3-b712-cacf108902a7	88	t	2026-04-28 00:56:23.216476+00
74a114d8-1673-450d-8380-a878c38e94c6	ee2126c2-d675-441b-bc19-c96196e3db6b	c7c9d5ea-c76b-41e3-b712-cacf108902a7	666	t	2026-04-28 01:01:47.283398+00
df9bbae9-028b-47e0-909e-bc090bc95cd4	ee2126c2-d675-441b-bc19-c96196e3db6b	e36d658f-214e-4cd2-b347-bd6e740d2535	60	t	2026-04-28 15:59:58.29226+00
c8366a01-6e27-4107-b89c-9400cdc4b3ba	ee2126c2-d675-441b-bc19-c96196e3db6b	9831db67-cc85-49c9-9551-9c6a6cd96eeb	12	t	2026-05-03 19:42:58.60899+00
6f7ad5cf-ce3c-4244-88ef-6012504e55f3	ee2126c2-d675-441b-bc19-c96196e3db6b	9ebabb39-882b-43b6-8143-7a3448eb6340	10	f	2026-04-28 00:42:59.551172+00
eae067a8-148a-4179-b6e5-8671b81dedfb	ee2126c2-d675-441b-bc19-c96196e3db6b	ecce5f49-a763-439e-b5d5-9ed796efaa73	39	f	2026-05-03 19:43:52.638807+00
ab91f60a-b0ab-4ca0-a79a-3d22b8c4cf31	ee2126c2-d675-441b-bc19-c96196e3db6b	86c53b48-edbf-41a7-8403-ef28b8c5b143	69	f	2026-05-03 19:46:50.003467+00
79b3ca5c-4556-456b-9de7-8026e668eaa0	ee2126c2-d675-441b-bc19-c96196e3db6b	a8658cf2-5f32-4c55-b638-8c5c1bb94dae	55	f	2026-05-03 19:44:35.961093+00
0917a8a6-b88f-4339-ae9b-bc68aed1df8b	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	77496c02-8a41-4d9d-a3f8-1c698a98d6cf	60	t	2026-05-05 11:01:20.098369+00
1865f6a5-9be9-48e0-a370-7eae611a2d80	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	dffb938d-3b91-4cb3-bf87-c0f84fb43913	90	t	2026-05-05 14:57:28.267558+00
ed6717fc-1e33-43ce-99a4-c5a34f9e8cd6	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	9ebabb39-882b-43b6-8143-7a3448eb6340	55	t	2026-05-05 14:57:16.693575+00
804de246-4da9-4d8d-8b6e-73c9afb18889	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	0da1c6cc-6f6a-4e3a-932d-754448c1a99b	25	t	2026-05-05 14:58:28.623995+00
02c3f3e7-2b2d-4e81-abb8-d9b194bd4794	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	aa64325d-d8cf-429d-b872-bf85ab43f150	150	t	2026-05-05 14:58:41.403107+00
5e65fd86-3d5d-4f92-8736-b6b95d8622c3	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	9e7bac47-32bd-4987-a8ee-6d2a9275caff	150	f	2026-05-05 14:57:51.244065+00
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

COPY public.merchants (id, user_id, name, phone, service_type, place_name, address, delivery_fee, is_active, image_url, created_at, updated_at) FROM stdin;
cd392e2f-7c36-41e6-b98f-e81ffc3dc013	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	صن شاين	01011111111	supermarket		\N	50	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/صن_شاين/misc/merchant_cd392e2f-7c36-41e6-b98f-e81ffc3dc013_1778001793590_NTF-0X7C8.jpg	2026-05-05 11:00:37.74374+00	2026-05-07 07:28:20.107397+00
ddf6af56-4979-46a5-a977-f01ce6ebaeec	ddf6af56-4979-46a5-a977-f01ce6ebaeec	Thomas Cook Tours	01000000001	travel		\N	10	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/thomas_cook_tours/profile/profile_1778014659036_yMNxJaxtH.jpg	2026-05-05 08:34:22.695468+00	2026-05-07 07:28:20.107397+00
42e2ac06-2524-42f2-9215-98ea3b4f3f56	42e2ac06-2524-42f2-9215-98ea3b4f3f56	الشيف حسن	01022222222	home_chef		\N	50	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/الشيف_حسن/misc/merchant_42e2ac06-2524-42f2-9215-98ea3b4f3f56_1778074951717_G7nz74zQl.jpg	2026-05-06 13:41:07.650906+00	2026-05-07 07:28:20.107397+00
\.


--
-- Data for Name: offers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offers (id, title, description, image_url, is_approved, created_at, updated_at, merchant_id, merchant_name, service_type, discount_percent, original_price, offer_price, start_date, end_date, status, admin_notes, is_active, tour_package_details) FROM stdin;
3	توصيل مجاني على خدمات المكوجي	ساري من يوم ١ مايو حتى ٥ مايو	https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777218619739_iP6B85CGN.jpg	\N	2026-04-26 15:50:27.006+00	2026-04-26 15:50:56.082+00	\N	إدارة Zid		\N	\N	\N	\N	\N	approved		t	{}
2	سندويتش برجر ب ٨٠ جنية بدلا من ١٠٠ جنية	هذا العرض ساري لفترة محدودة	https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777215794311_X3_GEPYkP.jpg	\N	2026-04-26 15:03:58.993+00	2026-04-26 16:49:36.082+00	c264e47a-f655-4db5-af8d-f6b12058118d	شيف	home_chef	20	100	80	\N	\N	approved		t	{}
1	خصم 20% على خدمة التنظيف	هذا العرض ساري حتى يوم الخميس ١٢ مايو	https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777217507854_1R_TEt8D1.jpg	\N	2026-04-26 14:23:28.936+00	2026-04-26 16:50:13.662+00	c264e47a-f655-4db5-af8d-f6b12058118d	شيف	home_chef	20	100	80	\N	\N	approved		t	{}
9	خصم			\N	2026-04-28 16:04:55.085+00	2026-04-28 16:05:30.496+00	ee2126c2-d675-441b-bc19-c96196e3db6b	ابو سعيد سوبر ماركت 	supermarket	\N	\N	\N	\N	\N	approved		t	{}
11	عرض خاص على منتجات التجميل		https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777483890382_tVFHB4EkL.jpg	\N	2026-04-29 17:31:33.269+00	2026-04-29 17:35:53.265+00	bbc5016a-00b6-4636-97c3-0ab630d65b63	كرم	pharmacy	30	210	140	\N	\N	approved		t	{}
10	عرض خاص على منتجات سوبر ماركت صن شاين		https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777483805554_Y3kJR-Z6F.jpg	\N	2026-04-29 17:30:16.072+00	2026-04-29 19:34:34.488+00	bbc5016a-00b6-4636-97c3-0ab630d65b63	كرم	pharmacy	20	50	150	\N	\N	approved		t	{}
4	خصم ٣٠ % على كل البلاي ستيشن	العرض ساري لمدة ٣ ايام	https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777229196815_1AtCMujB6.jpg	\N	2026-04-26 18:46:39.833+00	2026-04-29 19:35:30.851+00	2853336e-f393-4c4d-9d95-b7a17d4e2fb9	سوبر ماركت صن شاين	supermarket	20	100	80	\N	\N	approved		t	{}
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, merchant_id, driver_id, status, total_price, delivery_fee, address_text, location_lat, location_lng, payment_method, created_at, customer_name, customer_phone, merchant_name, merchant_phone, delivery_notes, order_notes, items, "customerPhone", "serviceName", "serviceType", "totalPrice", description, notes, image_urls, order_details, pickup_fee, has_pickup, pickup_address, driver_name, driver_phone, merchant_place, final_total, subtotal, voice_url, raw_text, updated_at, accepted_at, customer_address, service_name, service_type, delivered_at, cancelled_at, cancellation_reason, price_set_at, driver_assigned_at, delivery_started_at, is_guest, guest_phone) FROM stdin;
d6390c33-c4ae-4877-98a7-e96e58d22f41	\N	ddf6af56-4979-46a5-a977-f01ce6ebaeec	\N	accepted	\N	0	\N	\N	\N	\N	2026-05-05 08:35:54.959+00	عميل	\N	Thomas Cook Tours	01000000001	\N	\N	["مطار المغادرة: القاهرة", "مطار الوصول: دبي", "تاريخ المغادرة: 2026-05-14", "تاريخ العودة: 2026-05-21", "عدد المسافرين: 1", "درجة السفر: اقتصادية"]	\N	\N	\N	\N	مطار المغادرة: القاهرة\nمطار الوصول: دبي\nتاريخ المغادرة: 2026-05-14\nتاريخ العودة: 2026-05-21\nعدد المسافرين: 1\nدرجة السفر: اقتصادية		[]	{}	0	f	\N	\N	\N	\N	\N	\N	\N	\N	2026-05-05 08:38:08.027879+00	2026-05-05 08:38:07.993+00		حجز طيران	travel	\N	\N	\N	\N	\N	\N	f	\N
404921fb-7530-494c-8498-a94af7f52f49	94d3fa22-f704-4be2-aacf-a09f7c030f9c	42e2ac06-2524-42f2-9215-98ea3b4f3f56	\N	delivered	55	50	\N	\N	\N	cash_on_delivery	2026-05-06 21:35:12.373+00	شريف	01033833119	الشيف حسن	01022222222	\N	\N	["صنية بطاطس x1 = 55 ج"]	\N	\N	\N	\N			[]	{}	0	f	\N	\N	\N	\N	105	\N	\N	\N	2026-05-06 21:35:59.38955+00	2026-05-06 21:35:41.033+00	ت	الشيف حسن	home_chef	2026-05-06 21:35:59.286	\N	\N	\N	\N	2026-05-06 21:35:56.687+00	f	\N
3960470b-5289-498e-b869-8568a3f72277	\N	ddf6af56-4979-46a5-a977-f01ce6ebaeec	\N	pending	\N	0	\N	\N	\N	\N	2026-05-05 14:49:26.741+00	شريف	01033833119	Thomas Cook Tours	01000000001	\N	\N	["الوجهة: دبي", "تاريخ الوصول: 2026-05-20", "تاريخ المغادرة: 2026-05-25", "عدد الغرف: 1", "عدد النزلاء: 2", "ملاحظات إضافية: فطار غدا عشا"]	\N	\N	\N	\N	الوجهة: دبي\nتاريخ الوصول: 2026-05-20\nتاريخ المغادرة: 2026-05-25\nعدد الغرف: 1\nعدد النزلاء: 2\nملاحظات إضافية: فطار غدا عشا		[]	{}	0	f	\N	\N	\N	\N	\N	\N	\N	\N	2026-05-07 07:07:05.93963+00	2026-05-05 14:55:27.768+00		حجز فنادق	travel	\N	\N	\N	\N	\N	\N	f	\N
1c340a9a-27a1-4c83-a041-f19ed2595171	\N	ddf6af56-4979-46a5-a977-f01ce6ebaeec	\N	cancelled	\N	0	\N	\N	\N	\N	2026-05-05 08:54:02.038+00	شريف	01033833119	Thomas Cook Tours	\N	\N	\N	["📍 الوجهة: الغردقه", "📅 عدد الأيام: 3", "👥 عدد الأشخاص: 2"]	\N	\N	\N	\N	📍 الوجهة: الغردقه\n📅 عدد الأيام: 3\n👥 عدد الأشخاص: 2		[]	{}	0	f	\N	\N	\N	\N	\N	\N	\N	\N	2026-05-05 14:37:51.278019+00	\N	الشيخ زايد	سياحة داخلية	travel	\N	2026-05-05 14:37:51.275	تم الإلغاء بواسطة العميل	\N	\N	\N	f	\N
3524d18d-921d-46c5-a5d7-834bd6e6ef11	94d3fa22-f704-4be2-aacf-a09f7c030f9c	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	delivered	180	50	\N	\N	\N	cash_on_delivery	2026-05-05 14:51:01.201+00	شريف	01033833119	صن شاين	01011111111	\N	\N	["جبنة شيدر مطبوخ x3 = 180 ج"]	\N	\N	\N	\N			[]	{}	0	f	\N	\N	\N	\N	230	\N	\N	\N	2026-05-06 20:48:49.334737+00	2026-05-05 14:56:33.139+00	ت	صن شاين	supermarket	2026-05-06 20:48:49.329	\N	\N	\N	\N	2026-05-06 20:48:47.048+00	f	\N
0e2bf7ca-81aa-4790-8993-41fca19aa1f5	\N	ddf6af56-4979-46a5-a977-f01ce6ebaeec	\N	cancelled	\N	0	\N	\N	\N	\N	2026-05-05 10:58:56.585+00	شريف	01033833119	Thomas Cook Tours	\N	\N	\N	["مطار المغادرة: القاهره", "مطار الوصول: دبي", "تاريخ المغادرة: 2026-05-21", "تاريخ العودة: 2026-05-25", "عدد المسافرين: 1", "درجة السفر: اقتصادية"]	\N	\N	\N	\N	مطار المغادرة: القاهره\nمطار الوصول: دبي\nتاريخ المغادرة: 2026-05-21\nتاريخ العودة: 2026-05-25\nعدد المسافرين: 1\nدرجة السفر: اقتصادية		[]	{}	0	f	\N	\N	\N	\N	\N	\N	\N	\N	2026-05-05 14:37:41.93424+00	\N		حجز طيران	travel	\N	2026-05-05 14:37:41.917	تم الإلغاء بواسطة العميل	\N	\N	\N	f	\N
3580583b-a96b-4238-bec0-11a185ce8824	94d3fa22-f704-4be2-aacf-a09f7c030f9c	42e2ac06-2524-42f2-9215-98ea3b4f3f56	\N	delivered	560	50	\N	\N	\N	cash_on_delivery	2026-05-06 18:48:32.739+00	شريف	01033833119	الشيف حسن	01022222222	\N	\N	["صنية بطاطس x2 = 110 ج", "فتة شاورما x3 = 450 ج"]	\N	\N	\N	\N			[]	{}	0	f	\N	\N	\N	\N	610	\N	\N	\N	2026-05-06 18:49:14.700178+00	2026-05-06 18:48:57.13+00	شارع 	الشيف حسن	home_chef	2026-05-06 18:49:14.688	\N	\N	\N	\N	2026-05-06 18:49:12.364+00	f	\N
8eb76fca-a8b9-49e1-a872-0bd9a286337d	\N	\N	\N	accepted	220	0	\N	\N	\N	cash	2026-04-26 22:57:45.115+00	S	0	\N	\N	\N	\N	["مخدة x1 = 165ج", "منتج جديد x1 = 55ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	\N	\N	\N	\N	2026-05-07 07:02:10.382732+00	\N	J	متجر Zid	eshop	\N	\N	\N	\N	\N	\N	t	0
2e33fee9-4e95-449b-b3fb-ee037c230b30	94d3fa22-f704-4be2-aacf-a09f7c030f9c	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	delivered	115	50	\N	\N	\N	cash_on_delivery	2026-05-06 20:47:59.699+00	شريف	01033833119	صن شاين	01011111111	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N			[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-05-06 20:48:37.455712+00	2026-05-06 20:48:24.325+00	H	صن شاين	supermarket	2026-05-06 20:48:37.44	\N	\N	\N	\N	2026-05-06 20:48:35.249+00	f	\N
e10b3215-5062-4a45-a9ee-da614928482d	94d3fa22-f704-4be2-aacf-a09f7c030f9c	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	delivered	60	50	\N	\N	\N	cash_on_delivery	2026-05-05 11:01:53.822+00	شريف	01033833119	صن شاين	01011111111	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج"]	\N	\N	\N	\N			[]	{}	0	f	\N	\N	\N	\N	110	\N	\N	\N	2026-05-06 20:48:59.172565+00	2026-05-05 14:56:35.722+00	ت	صن شاين	supermarket	2026-05-06 20:48:59.172	\N	\N	\N	\N	2026-05-06 20:48:57.26+00	f	\N
cfc8fa34-1ed6-4950-89ec-c6ebbc5fe336	\N	\N	\N	accepted	\N	0	\N	\N	\N	\N	2026-05-01 18:57:09.635+00	Yoyi	01012341234	\N	\N	\N	\N	["نوع الرحلة: ذهاب فقط", "مطار المغادرة: القاهرة", "تاريخ الذهاب: 2026-05-13", "مطار الوصول: دبي", "البالغين: 2", "الأطفال (2-12): 1", "الرضع (أقل من سنتين): 1", "درجة السفر: رجال أعمال"]	\N	\N	\N	\N	نوع الرحلة: ذهاب فقط\nمطار المغادرة: القاهرة\nتاريخ الذهاب: 2026-05-13\nمطار الوصول: دبي\nالبالغين: 2\nالأطفال (2-12): 1\nالرضع (أقل من سنتين): 1\nدرجة السفر: رجال أعمال		[]	{}	0	f	\N	\N	\N	\N	\N	\N	\N	\N	2026-05-07 07:02:07.627273+00	\N	H	حجز طيران	thomascook	\N	\N	\N	\N	\N	\N	f	\N
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
d44d1541-7849-4627-8547-541d2b8917ff	تجربه		\N	\N	test	f	2026-03-26 05:36:42.185+00	\N	t	\N	\N	\N	\N		2026-03-26 05:36:42.185+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774503400204_JRsmQWUs-.jpg	10
45ac0789-49ef-4a88-ad5c-dd90f1c2908e	سامح النجار		\N	\N	wood	f	2026-03-22 22:39:02.949+00	\N	t	\N	\N	\N	\N		2026-03-23 01:15:52.838+00	\N	10
728c8bb1-559e-4220-bc98-9225949d6dbf	سوبر ماركت صن شاين		\N	\N	supermarket	f	2026-03-23 18:28:01.518+00	\N	t	\N	\N	\N	\N		2026-04-26 11:40:56.289+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774503718703_Ljlq9UJBQ.jpg	10
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categories (id, service_id, name, image_url, icon, sort_order, is_active, created_at, updated_at) FROM stdin;
a26a2604-be2d-4a32-bc8e-b7a9060d1c08	supermarket	خضروات وفاكهة	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777839948879_dqEXH76SB.jpg	nutrition	0	t	2026-05-03 19:27:30.528+00	2026-05-03 20:26:01.475+00
9fba4007-e0d4-4844-9e59-ed44bb3f357d	supermarket	ألبان	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777840046757_0DgryzXCV.jpg	archive	0	t	2026-05-03 19:17:06.401+00	2026-05-03 20:27:31.528+00
ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d	supermarket	أجبان	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777840187535_ddn6Re3nb.jpg	pizza	0	t	2026-05-03 19:46:00.72+00	2026-05-03 20:29:51.498+00
93c4c6f1-045b-4882-83f9-6136de6dad11	supermarket	مشروبات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777840225081_Z0MwJ_E8i.jpg	cafe	0	t	2026-05-03 18:01:07.192+00	2026-05-03 20:30:30.902+00
f27e5b90-1271-4388-b590-48d1e31e9c46	supermarket	بقوليات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777994005104_C_VhC6MGh.jpg	sparkles	5	t	2026-05-05 15:13:42.115+00	2026-05-05 15:13:42.115+00
d01a5c53-917b-43ec-84e2-f41cddee4982	supermarket	معلبات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777994122090_YbNlb3I65.jpg	cube	0	t	2026-05-05 15:15:24.637+00	2026-05-05 15:15:24.637+00
fd3a39da-93bc-49f0-99f9-67ae6342566b	home_chef	مشويات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778078078772_9dilA4JbL.jpg	cube	0	t	2026-05-06 14:34:43.786+00	2026-05-06 14:34:43.786+00
ab2ad873-479a-4752-aab0-6bb08502308e	home_chef	أطباق رئيسية	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778091146280_dveKN6HQ07.jpg	cube	0	t	2026-05-06 18:12:33.868+00	2026-05-06 18:12:33.868+00
\.


--
-- Data for Name: product_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variants (id, product_id, name, price, display_order, created_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, price, image_url, category, service_id, merchant_id, is_available, created_at, status, rejection_reason, merchant_name, is_template, updated_at, rejectionreason, video_url, merchant_type, service_name, category_id) FROM stdin;
6afc2fbe-8135-41d1-b4d9-06125fff27ed	لبن جهينة ١ لتر	كامل الدسم	45		\N	products	\N	t	2026-03-23 18:29:45.67+00	approved	\N		t	2026-03-23 18:36:03.486	\N	\N	\N	\N	\N
fc028f2b-0209-4def-a14a-d8895e9baae4	لبن جهينة ١ لتر		45	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774291619630_6f04RoFvE.jpg	\N	products	\N	t	2026-03-23 18:47:03.019+00	approved	\N		t	2026-03-23 18:47:34.483	\N	\N	\N	\N	\N
44ea9db7-578e-43c8-8878-d1ebc95271f8	صنية بطاطس	لحم ضاني	55	https://ik.imagekit.io/vzuah6tku/zayedid/misc/product_1778080340054_Ssp0b0yyc.jpg	\N	home_chef	42e2ac06-2524-42f2-9215-98ea3b4f3f56	t	2026-05-06 15:12:55.105+00	approved	\N	الشيف حسن	f	2026-05-06 15:13:39.964	\N	\N	\N	\N	fd3a39da-93bc-49f0-99f9-67ae6342566b
81d35330-d46c-4c10-a499-67a730daed01	فتة شاورما	لحم بقري	150	https://ik.imagekit.io/vzuah6tku/zayedid/misc/product_1778090202105_2o3ZVNfT_.jpg	\N	home_chef	42e2ac06-2524-42f2-9215-98ea3b4f3f56	t	2026-05-06 17:56:55.117+00	approved	\N	الشيف حسن	f	2026-05-06 18:26:45.365	\N	\N	\N	\N	ab2ad873-479a-4752-aab0-6bb08502308e
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, full_name, phone, password, role, active, place_id, place_name, is_available, location_lat, location_lng, created_at, updated_at, name, service_area, max_delivery_radius, health_cert_url, merchant_type, is_verified, verification_image, verification_status, rejection_reason, business_license_url, profile_completed, terms_accepted, terms_accepted_at, delivery_fee, delivery_time, avatar_url, average_rating, reviews_count, address, portfolio_images, bio, avg_rating, service_category, bio_approved, portfolio_approved, image_url, delivery_radius, specialties, expo_push_token, commercial_register, tax_card, image_approved, admin_level, image_url_pending, documents, documents_approved, region_id) FROM stdin;
cd392e2f-7c36-41e6-b98f-e81ffc3dc013	صن شاين	01011111111	1234	merchant	t	\N		t	\N	\N	2026-05-05 11:00:36.759+00	2026-05-07 07:28:20.107397+00	\N		10	\N	supermarket	t	\N	\N	\N	\N	f	f	\N	50	30	\N	0	3		\N	نص طويل	3.6666666666666665	products	t	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/صن_شاين/misc/merchant_cd392e2f-7c36-41e6-b98f-e81ffc3dc013_1778001793590_NTF-0X7C8.jpg	10	{}	\N	\N	\N	t	\N	\N	\N	t	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c
ddf6af56-4979-46a5-a977-f01ce6ebaeec	Thomas Cook Tours	01000000001	1234	merchant	t	\N		t	\N	\N	2026-05-05 08:34:21.635+00	2026-05-07 07:28:20.107397+00	\N		10	\N	travel	t	\N	\N	\N	\N	f	f	\N	0	30	\N	0	0		{}	نص 2	0	products	t	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/thomas_cook_tours/profile/profile_1778014659036_yMNxJaxtH.jpg	10	{}	\N	\N	\N	t	\N	\N	[{"url": "https://ik.imagekit.io/vzuah6tku/zayedid/users/merchant/misc/doc_1778052887240_pE9waGRPU.jpg", "approved": true}, {"url": "https://ik.imagekit.io/vzuah6tku/zayedid/users/merchant/misc/doc_1778054206966_1kXq2bJYp.jpg", "approved": true}]	t	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c
00000000-0000-0000-0000-000000000000	Master Admin	0000000000	Admin135792	admin	t	\N	\N	t	\N	\N	2026-05-05 08:32:24.357454+00	2026-05-05 08:32:24.357454+00	\N	\N	10	\N	\N	t	\N	\N	\N	\N	f	f	\N	0	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	super	\N	[]	f	\N
42e2ac06-2524-42f2-9215-98ea3b4f3f56	الشيف حسن	01022222222	1234	merchant	t	\N		t	\N	\N	2026-05-06 13:41:07.589+00	2026-05-07 07:28:20.107397+00	\N	\N	10	\N	home_chef	t	\N	\N	\N	\N	f	f	\N	50	30	\N	0	2	\N	{}	\N	4	products	f	f	https://ik.imagekit.io/vzuah6tku/zayedid/users/الشيف_حسن/misc/merchant_42e2ac06-2524-42f2-9215-98ea3b4f3f56_1778074951717_G7nz74zQl.jpg	10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c
94d3fa22-f704-4be2-aacf-a09f7c030f9c	شريف	01033833119	1234	customer	t	\N	\N	t	\N	\N	2026-05-05 08:54:24.636+00	2026-05-07 07:28:20.107397+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	t	f	\N	0	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	basic	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c
65bde6b7-bbd5-4343-a41e-6abb0e1aee8e	ادمن	01000000000	Admin135792	admin	t	\N	\N	t	\N	\N	2026-05-05 08:33:10.803+00	2026-05-05 08:33:10.803+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	super	\N	[]	f	\N
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (id, name, is_active, created_at, updated_at) FROM stdin;
0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	الشيخ زايد	t	2026-05-07 07:28:20.107397+00	2026-05-07 07:28:20.107397+00
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
\.


--
-- Data for Name: service_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_categories (id, name, icon, sort_order, is_active, created_at, updated_at, image_url) FROM stdin;
express	Zid Express	flash-outline	1	t	2026-05-05 14:36:41.884267+00	2026-05-05 17:19:01.65+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778001527604_EtjwRZTIj.jpg
pro	Zid Pro	star-outline	2	t	2026-05-05 14:36:41.884267+00	2026-05-05 17:19:20.319+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778001550387_y3pvnG8Ft.jpg
other	Other	apps-outline	3	t	2026-05-05 14:36:41.884267+00	2026-05-05 17:19:38.651+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778001572875_6gu608njN.jpg
\.


--
-- Data for Name: service_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_fields (id, service_id, field_name, field_label, field_type, is_required, sort_order, created_at, updated_at, sub_service_name, config, sub_service_id, field_options, is_visible, help_text, placeholder) FROM stdin;
d4501d73-3173-4245-9583-1ce27c77e574	تأشيرات	country	الدولة	text	t	1	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	تأشيرات	{}	d96ec8f0-02d0-4c00-90b0-a4901c25ae8a	{}	t		
0bb7c240-d69c-4d61-a314-c841c9eef414	تأشيرات	visa_type	نوع التأشيرة	text	t	2	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	تأشيرات	{}	d96ec8f0-02d0-4c00-90b0-a4901c25ae8a	{}	t		
72ee4f57-893f-4c94-ba5b-0418e6df0d8a	توصيل سريع	عتر	عتر	text	t	0	2026-05-03 17:07:36.694304+00	2026-05-03 17:07:36.694304+00	\N	{}	4f7d3b98-4bb8-4eb4-a43a-fdb7a1c8cd78	{}	t		
1c5518c8-b807-488f-8bf0-c6c8bb7188af	حجز فنادق	notes	ملاحظات إضافية	textarea	f	6	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز فنادق	{}	80223561-920a-4949-aca4-f649d9687be2	\N	t		
4268aad4-2ce5-4a06-a819-74a8e2808d55	تأشيرات	passport_number	رقم جواز السفر	text	t	3	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	تأشيرات	{}	d96ec8f0-02d0-4c00-90b0-a4901c25ae8a	\N	t		
7269f8bb-17a6-40c7-80ab-5ad906b7b562	تأشيرات	travel_date	تاريخ السفر	date	t	4	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	تأشيرات	{}	d96ec8f0-02d0-4c00-90b0-a4901c25ae8a	\N	t		
d1c337b1-2a84-4906-ab3f-e08c1e9e37e7	ليموزين و رحلات	pickup_location	موقع الاستلام	text	t	1	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	ليموزين و رحلات	{}	27e0fb0c-a72f-437a-9790-c96ef4c9c341	\N	t		
70efa962-01a1-49ea-89c1-f52ada4d8bf5	ليموزين و رحلات	dropoff_location	موقع التوصيل	text	t	2	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	ليموزين و رحلات	{}	27e0fb0c-a72f-437a-9790-c96ef4c9c341	\N	t		
578ffe91-bd28-41d2-8968-62373dcccb04	ليموزين و رحلات	date	التاريخ	date	t	3	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	ليموزين و رحلات	{}	27e0fb0c-a72f-437a-9790-c96ef4c9c341	\N	t		
eaafcc97-f54a-43ef-9033-30f217a5a7b0	ليموزين و رحلات	time	الوقت	text	t	4	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	ليموزين و رحلات	{}	27e0fb0c-a72f-437a-9790-c96ef4c9c341	\N	t		
9ae182a4-3d26-4fcc-abb3-963aa2508798	ليموزين و رحلات	passengers	عدد الركاب	number	t	5	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	ليموزين و رحلات	{}	27e0fb0c-a72f-437a-9790-c96ef4c9c341	\N	t		
60415073-77db-4d56-bea5-28c478738af1	ليموزين و رحلات	notes	ملاحظات	textarea	f	6	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	ليموزين و رحلات	{}	27e0fb0c-a72f-437a-9790-c96ef4c9c341	\N	t		
1c206777-c34c-4b00-838d-dca4f5a2db01	سياحة داخلية	destination	📍 الوجهة	text	t	1	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	سياحة داخلية	{}	4e5c0360-bdbd-4724-bca4-74d9e2540509	\N	t		
7fb797fd-d168-4fd1-bc6c-7b4857444993	سياحة داخلية	days	📅 عدد الأيام	number	t	2	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	سياحة داخلية	{}	4e5c0360-bdbd-4724-bca4-74d9e2540509	\N	t		
a3c53f20-1a98-45be-8bb2-3a341e4fb3c0	سياحة داخلية	persons	👥 عدد الأشخاص	number	t	3	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	سياحة داخلية	{}	4e5c0360-bdbd-4724-bca4-74d9e2540509	\N	t		
3b8f583e-d412-42d7-8e80-8456714003fa	حجز طيران	departure_airport	مطار المغادرة	text	t	1	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t		
3580e854-ec64-4ced-9324-072e5c5758c7	حجز طيران	arrival_airport	مطار الوصول	text	t	2	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t		
d0b0c0b1-76b4-44e3-a400-4ee4abab89a5	حجز طيران	departure_date	تاريخ المغادرة	date	t	3	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t		
c13e95ad-a069-4d9f-a331-d4b910e09643	حجز طيران	return_date	تاريخ العودة	date	f	4	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t		
3be6a7b5-c51f-416b-9f20-e6470f99721e	حجز طيران	passengers	عدد المسافرين	number	t	5	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	\N	t		
1d9602e1-6f73-40f9-b368-387d56ea463a	حجز فنادق	destination	الوجهة	text	t	1	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز فنادق	{}	80223561-920a-4949-aca4-f649d9687be2	\N	t		
237c0fa7-258e-45b9-9507-6b40f1c16970	حجز فنادق	check_in	تاريخ الوصول	date	t	2	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز فنادق	{}	80223561-920a-4949-aca4-f649d9687be2	\N	t		
109c3fda-5039-4919-8cca-bf8a09fc7f7c	حجز فنادق	check_out	تاريخ المغادرة	date	t	3	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز فنادق	{}	80223561-920a-4949-aca4-f649d9687be2	\N	t		
c1c1efc0-5612-4b73-8cd9-943e3d129fdc	حجز فنادق	rooms	عدد الغرف	number	t	4	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز فنادق	{}	80223561-920a-4949-aca4-f649d9687be2	\N	t		
790a0dde-8586-41e8-8122-4d9050198404	حجز فنادق	guests	عدد النزلاء	number	t	5	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز فنادق	{}	80223561-920a-4949-aca4-f649d9687be2	\N	t		
dc794d64-a786-4085-a41d-d260eea0b9aa	سياحة داخلية	notes	📝 ملاحظات إضافية	textarea	f	4	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	سياحة داخلية	{}	4e5c0360-bdbd-4724-bca4-74d9e2540509	\N	t		
ed79573d-414c-4bb7-afa7-8d666afa3e70	حجز طيران	class	درجة السفر	select	t	6	2026-05-02 14:20:58.515215+00	2026-05-02 14:20:58.515215+00	حجز طيران	{}	20956352-1809-4e50-9a04-577781242eae	{اقتصادية,"رجال أعمال",أولى}	t	شكرا	اختر درجة السفر
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
56307f8e-218c-4098-a1b7-b4b9bef7508d	bakery	كرواسون	https://via.placeholder.com/200	\N	t	2026-04-24 23:39:06.936607+00	2026-04-24 23:39:06.936607+00	\N	كرواسون	[]	7	{"وسط": 35}
376f6c73-3a0c-49d9-882f-277b12279747	bakery	فينو	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777074077039_JLiB0DZh3.jpg	\N	t	2026-04-24 23:41:27.370057+00	2026-04-24 23:41:27.370057+00	\N	صغير	[]	35	{"كبير": 10}
93e89e46-767f-46a9-b3da-9558a2b8b95a	dryclean	بنطلون	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777160941381_FvDJ2VOxF.jpg	\N	t	2026-04-25 14:45:56.527471+00	2026-04-25 14:45:56.527471+00	\N	عام	[]	0	{"كي فقط": 10, "كي وتنظيف": 20}
bc3f8b06-883d-4400-b526-a4ceb31c5657	laundryshop	بنطلون	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777084334511_2aTrI8VGo.jpg	\N	t	2026-04-25 02:32:26.789451+00	2026-04-25 02:32:26.789451+00	\N	عام	[]	0	{"كي فقط": 30, "كي وتنظيف": 35}
\.


--
-- Data for Name: service_tracking_steps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_tracking_steps (id, service_id, step_key, label, icon, sort_order, is_active, created_at, updated_at, image_url, attachment_url, description) FROM stdin;
54c3bcd0-1e53-4041-abc6-eb289b590cfc	travel	ready	جاهز	time-outline	4	t	2026-05-05 09:07:33.503866+00	2026-05-05 09:07:33.503866+00	\N	\N	\N
85f756b7-8f3d-439c-8e7d-2804547fa9c7	travel	delivered	تم التسليم	time-outline	5	t	2026-05-05 09:07:33.503866+00	2026-05-05 09:07:33.503866+00	\N	\N	\N
3851af7c-8595-4191-90a3-b4d052fde806	supermarket	pending	معلق	time-outline	1	t	2026-05-05 09:07:48.982541+00	2026-05-05 09:07:48.982541+00	\N	\N	\N
944f374c-6c9a-4958-8fa3-676b427cf66b	supermarket	accepted	تم القبول	time-outline	2	t	2026-05-05 09:07:48.982541+00	2026-05-05 09:07:48.982541+00	\N	\N	\N
7727806e-9874-411c-b765-946e8293defb	supermarket	preparing	تجهيز الطلب	time-outline	3	t	2026-05-05 09:07:48.982541+00	2026-05-05 09:07:48.982541+00	\N	\N	\N
c2351118-f60e-4e64-b8b8-57c086fec423	supermarket	driver_assigned	مندوب	time-outline	4	t	2026-05-05 09:07:48.982541+00	2026-05-05 09:07:48.982541+00	\N	\N	\N
96d30638-3808-4c8b-bc59-6afaceb31485	supermarket	on_the_way	في الطريق	time-outline	5	t	2026-05-05 09:07:48.982541+00	2026-05-05 09:07:48.982541+00	\N	\N	\N
f462622f-2d0f-40a6-bc59-d91676194b1a	supermarket	delivered	تم التوصيل	time-outline	6	t	2026-05-05 09:07:48.982541+00	2026-05-05 09:07:48.982541+00	\N	\N	\N
788bb316-e7bb-42af-b2c9-4516b3d18a78	travel	pending	معلق	time-outline	1	t	2026-05-05 09:07:33.503866+00	2026-05-05 14:47:00.013+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777992411932_4DrDcNT85.jpg	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777986973027_J2XYuIYVe.jpg	
fbc7a7db-0eba-4129-8460-0950e0c96d7b	travel	received	جاري مراجعة طلبك	time-outline	2	t	2026-05-05 09:07:33.503866+00	2026-05-05 14:47:33.696+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777975036300_HFY5mIE806.jpg		
ec975553-eb99-4802-9695-f242ee431c87	travel	preparing	تجهيز	time-outline	3	t	2026-05-05 09:07:33.503866+00	2026-05-05 14:47:48.614+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777992466559_oJsYTTWlW.jpg		
60c3b343-3bc8-4f32-b456-04878d171aff	home_chef	hold	معلق	time-outline	0	t	2026-05-06 18:51:21.466+00	2026-05-06 18:51:21.466+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778093477188_IadISuVTT.jpg		الطلب معلق
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, name, type, screen, icon, color, category, is_active, is_visible, has_items, has_pickup, items_collection, sub_services, image_url, "order", merchant_type, merchant_role, response_message, maintenance_text, service_id, created_at, updated_at, tracking_image, has_video, items_type, merchant_id, merchant_name, header_image, full_service_id) FROM stdin;
delivery	توصيل طلبات	full_service	\N	bicycle	#10B981	other	f	t	f	f	\N	[]	\N	99	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-05-01 11:01:16.181734	2026-05-06 07:57:24.767	\N	f	products	10920642-b0a0-4ede-871f-eaf40e51ba00	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777635294187_1GHYZZZ4p.jpg	9352bbce-8ae1-46e2-9964-2db4ce667326
bakery	مخبز	items_service	ItemsServiceScreen	apps-outline	#F59E0B	other	t	t	t	f	bakery_items	["وسط", "كبير", "صغير", "سمسم"]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777582916591_1gPa84GaW.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-04-24 23:02:12.981	2026-04-30 21:04:30.875	\N	f	products	db1fa5ef-1332-4e5d-91d1-eeb4e082f2bd	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777583061392_c3LAJvZKu.jpg	\N
pharmacy	صيدلية	regular	ServiceScreen	apps-outline	#14B8A6	express	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774289190679_m0Opvnw1E.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-03-23 18:10:07.728	2026-04-30 21:38:58.671	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777483618073_HhQqGrWe6.jpg	f	products	b724e1a9-d344-45db-8b0d-957940f940b5	صيدلية	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777585134505_4PDiYQYfi.jpg	\N
restaurant	مطاعم	items	MerchantsListScreen	apps-outline	#6B7280	express	t	t	t	f	service_restaurant_items	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1773993918897_hWpbNtWLq.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	restaurant	2026-03-20 08:05:25.969	2026-04-28 21:31:47.735	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774002178662_k5lGGFQ06.jpg	t	dishes	eca37997-c485-42d0-a872-00a1cbe6f4e9	مطاعم	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777411898895_XHuLqpkM9.jpg	\N
home_chef	الشيف المنزلي	items	MerchantsListScreen	apps-outline	#4F46E5	express	t	t	t	f	service_home_chef_items	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774345965079_jW41iH62B.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-03-24 02:47:53.203	2026-04-28 21:43:22.248	\N	f	dishes	4198059f-1629-49fa-98c2-3bfa7daac9c5	الشيف المنزلي	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777412595319_1k3M7yNTu6.jpg	\N
supermarket	سوبر ماركت	items	MerchantsListScreen	apps-outline	#6B7280	express	t	t	t	f	service_supermarket_items	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1773993657658_ZzndZII5H.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	supermarket	2026-03-20 08:03:53.815	2026-04-28 21:34:16.606	\N	f	products	2a839c04-03d8-4079-a1fb-8bd1826c4564	سوبر ماركت	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777412051628_Ui0oYJddl.jpg	\N
dryclean	مكوجي	items_service	ItemsServiceScreen	apps-outline	#F59E0B	express	t	t	t	t	dryclean_items	["كي فقط", "كي وتنظيف"]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777127780405_QTT86hEq4.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-04-25 14:36:57.65	2026-04-28 21:42:44.986	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777127806479_lizEkvEXn.jpg	f	products	48a8fe9b-9455-45cd-8f41-329f5e7c40c3	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777412556539_OoQCENSje.jpg	\N
wood	نجاره	regular	ServiceScreen	apps-outline	#6B7280	pro	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774219003587_YZnmWPymH.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-03-22 22:37:10.895	2026-04-30 20:54:27.044	\N	f	products	5a0c1f08-4f81-462e-a34f-444c3008d44a	نجاره	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777582461589_0zFOjV_Z7.jpg	\N
sabak	سباكه	regular	ServiceScreen	apps-outline	#6B7280	pro	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774346052573_GXQlT315H.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-03-24 09:54:35.047	2026-04-30 21:01:02.019	\N	f	products	2fbd346b-eb40-492e-b8db-2972d62e6c8f	سباكه	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777582854478_Oh7avjjHei.jpg	\N
travel	سياحة وسفر	full_service	\N	briefcase	#8B5CF6	other	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777560251186_5wqvCYGuh.jpg	99	\N	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-05-03 04:27:14.965556	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777977175802_G5DM0lW26.jpg	f	products	d878e694-1036-40ab-8364-469e19d85f65	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777785943367_p99bDJO8n.jpg	\N
\.


--
-- Data for Name: shop_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_products (id, name, price, image_url, category, is_active, is_featured, created_at) FROM stdin;
3344a514-623e-4da3-b96c-599783979821	منتج جديد	55		عام	t	f	2026-04-26 21:07:07.771+00
23c6cebe-ee1b-4b00-a773-8ef81e584cbe	مخدة	165	https://ik.imagekit.io/vzuah6tku/zayedid/misc/shop_1777239217906_hEzrxustd.jpg	عروض	t	f	2026-04-26 21:33:58.019+00
\.


--
-- Data for Name: shop_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_settings (id, is_active, maintenance_message, banner_image, banner_title, banner_subtitle, free_shipping, free_shipping_min_order, created_at, updated_at) FROM stdin;
1	t	المتجر قيد التجهيز	https://ik.imagekit.io/vzuah6tku/zayedid/misc/banner_1777392524862_giGR62ONk.jpg	عروض خاصة	خصومات ولفترة محدودة	f	500	2026-04-26 17:34:08.857689+00	2026-04-26 17:34:08.857689+00
\.


--
-- Data for Name: sub_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_services (id, full_service_id, name, description, icon, sort_order, is_active, created_at, image_url, show_title) FROM stdin;
20956352-1809-4e50-9a04-577781242eae	9352bbce-8ae1-46e2-9964-2db4ce667326	حجز طيران	\N	airplane	1	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777576757342_r_uOP3G-B.jpg	t
4f7d3b98-4bb8-4eb4-a43a-fdb7a1c8cd78	c7205659-f582-40f1-9bbb-76dcfb40a337	توصيل سريع	\N	document-text	0	t	2026-05-02 16:07:54.470472+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777817922423_ksaK4mOTC.jpg	t
d96ec8f0-02d0-4c00-90b0-a4901c25ae8a	9352bbce-8ae1-46e2-9964-2db4ce667326	تأشيرات	\N	document-text	3	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777577044587_HnoBE_sGx.jpg	t
a29efc56-52a6-41ea-8c47-c0f91e34cf6f	c7205659-f582-40f1-9bbb-76dcfb40a337	Y	\N	document-text	0	t	2026-05-02 16:09:22.321932+00	\N	t
2a82d891-58bd-4cb1-9898-23437435ba0f	c7205659-f582-40f1-9bbb-76dcfb40a337	H	\N	document-text	0	t	2026-05-02 16:26:26.292616+00	\N	t
80223561-920a-4949-aca4-f649d9687be2	9352bbce-8ae1-46e2-9964-2db4ce667326	حجز فنادق	\N	bed	2	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777576808994_bq_UNFSeV.jpg	t
4e5c0360-bdbd-4724-bca4-74d9e2540509	9352bbce-8ae1-46e2-9964-2db4ce667326	سياحة داخلية	\N	document-text	5	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777626019322_hooa1NwCdb.jpg	t
27e0fb0c-a72f-437a-9790-c96ef4c9c341	9352bbce-8ae1-46e2-9964-2db4ce667326	ليموزين و رحلات	\N	car	4	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777577117057_gc0QD8q1d.jpg	t
\.


--
-- Data for Name: template_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template_products (id, name, description, image_url, category, service_type, is_approved, created_by, created_at, updated_at, category_id) FROM stdin;
9ebabb39-882b-43b6-8143-7a3448eb6340	لبن المراعي كامل الدسم 1 لتر	لبن طازج كامل الدسم	\N	ألبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
e976ea5d-b967-45e9-b4d1-f9bbe0493c24	لبن جهينة كامل الدسم 1 لتر	لبن طازج كامل الدسم	\N	ألبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
4b48cb6c-3cfe-41c1-aead-7b1cda327bd7	لبن دومتي كامل الدسم 1 لتر	لبن طازج كامل الدسم	\N	ألبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
ecce5f49-a763-439e-b5d5-9ed796efaa73	زبادي دانون	زبادي دانون بالفواكه	\N	ألبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
77496c02-8a41-4d9d-a3f8-1c698a98d6cf	جبنة شيدر مطبوخ	جبنة شيدر	\N	أجبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
8ecedb6f-2c64-4f66-8049-f9bf0869ae20	جبنة فيتا	جبنة فيتا بيضاء	\N	أجبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
a8658cf2-5f32-4c55-b638-8c5c1bb94dae	جبنة موتزاريلا	جبنة موتزاريلا للبيتزا	\N	أجبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
86c53b48-edbf-41a7-8403-ef28b8c5b143	جبنة مثلثات	جبنة مثلثات كريمي	\N	أجبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
9e7bac47-32bd-4987-a8ee-6d2a9275caff	بيض بلدي (طبق 30 بيضة)	بيض بلدي طازج	\N	بيض	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
21c75f9f-679b-40d3-bb9a-0ad38c3806f1	بيض أحمر (طبق 30 بيضة)	بيض أحمر طازج	\N	بيض	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
d44375e1-f9bc-40c1-b505-67a2b550bec7	خبز شامي	خبز شامي طازج	\N	مخبوزات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
2c5b84cb-ba59-4433-9028-5ef7ed1948ae	خبز توست	خبز توست أبيض	\N	مخبوزات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
70b78876-b6af-49ec-a7be-4f4a4cd36735	عيش فينو	عيش فينو طازج	\N	مخبوزات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
5c73959b-0dce-493d-9ca0-60737d2cb073	أرز بسمتي هندي 1 كجم	أرز بسمتي	\N	بقوليات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
c49ebbc8-3e29-4efc-821f-bd908f8b4549	أرز مصري 1 كجم	أرز مصري	\N	بقوليات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
0da1c6cc-6f6a-4e3a-932d-754448c1a99b	مكرونة إسباجيتي	مكرونة إيطالي	\N	بقوليات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
2f1a1e0f-125a-4b52-a30a-6f8f12db3aa0	فول معلب	فول مدمس	\N	معلبات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
0c8dc78a-d2f9-4df4-b2f2-3a6d9ba1c0b7	عدس أصفر	عدس أصفر مجروش	\N	بقوليات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
a96bd0b1-aa71-4c3d-83c3-c4673dc067ce	زيت عباد الشمس 1 لتر	زيت نباتي	\N	زيوت	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
118c4157-c2c6-4a0c-95ce-df50a2242eea	زيت ذرة 1 لتر	زيت ذرة نقي	\N	زيوت	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
16c41330-c607-4c87-8685-54c48ac238df	سمن بلدي	سمن بلدي طبيعي	\N	زيوت	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
aa64325d-d8cf-429d-b872-bf85ab43f150	زيت زيتون بكر	زيت زيتون بكر ممتاز	\N	زيوت	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
ef894ae6-6341-4cc5-a5a4-da936aac335d	سكر أبيض 1 كجم	سكر ناعم	\N	بقالة	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
01b19049-a629-4667-b651-01b03bc6e812	ملح طعام	ملح طعام ناعم	\N	بقالة	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
af1aa9c5-2edd-4ce2-bef5-c5a26b83f5c7	شاي ليبتون	شاي أسود	\N	مشروبات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
a0cab54a-68a6-4ede-972a-cf581697de95	قهوة نسكافيه	قهوة سريعة الذوبان	\N	مشروبات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
99a227ec-9f2a-41a5-b9d5-385fb468a62f	مياه معدنية نستله 1.5 لتر	مياه معدنية	\N	مشروبات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
c1bb5710-5ad7-4616-bc43-30fe49b244f6	مسحوق غسيل أريال	مسحوق غسيل	\N	منظفات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
ab647ea6-b15c-4d70-ae2e-d9394c424c18	صابون سائل	صابون سائل لليدين	\N	منظفات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
3a776673-f021-4c6d-92ae-bceb007b611b	كلوركس	مبيض ومنظف	\N	منظفات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
7028bd14-f88b-47a1-9328-2cce6d7652c4	تونة معلبة	تونة قطع	\N	معلبات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
7c4e5eb1-7d69-425c-b6fc-df6ef8452815	صلصة طماطم	صلصة طماطم طبيعية	\N	معلبات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
e36d658f-214e-4cd2-b347-bd6e740d2535	مربى فراولة	مربى طبيعي	\N	معلبات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
e9051341-455e-4bd1-8b38-01fb49d55732	Hhg		https://ik.imagekit.io/vzuah6tku/zayedid/misc/product_1777316959828_bv11zzpNn.jpg	عام	supermarket	f	ed7eee41-eacc-49db-83e4-144adcf97a66	2026-04-27 19:09:25.370831+00	2026-04-27 19:09:25.370831+00	\N
5f98108c-ad99-4c2e-ad88-4c8fbc63ea17	Test		https://ik.imagekit.io/vzuah6tku/zayedid/misc/product_1777320933671_Cn3de6Ic-.jpg	عام	supermarket	f	ed7eee41-eacc-49db-83e4-144adcf97a66	2026-04-27 20:15:39.652293+00	2026-04-27 20:15:39.652293+00	\N
c7c9d5ea-c76b-41e3-b712-cacf108902a7	لبن خالي الدسم جهينة 1 لتر	لبن خالي الدسم	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1777337695580_gNvZLHBBG.jpg	ألبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-28 00:54:58.815+00	\N
9831db67-cc85-49c9-9551-9c6a6cd96eeb	عصير برتقال طبيعي	عصير طازج		مشروبات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-05-03 19:16:05.058+00	93c4c6f1-045b-4882-83f9-6136de6dad11
06b5edae-5d1c-4d3f-b039-4c098822b097	بيبسي كولا	مشروب غازي		مشروبات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-05-03 19:16:20.579+00	93c4c6f1-045b-4882-83f9-6136de6dad11
b515cbaf-d214-4b85-a424-8c550b3fead2	كريم شعر فاتيكا		https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1777491950440_FqCQ1jwiD.jpg	عام	supermarket	t	\N	2026-04-29 19:45:41.378+00	2026-04-29 19:45:52.979+00	\N
3cf9a8bc-d286-4803-87b4-d149f31e721e	زبادي جهينة بلدي	زبادي بلدي طبيعي		ألبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-05-03 19:17:20.532+00	9fba4007-e0d4-4844-9e59-ed44bb3f357d
dffb938d-3b91-4cb3-bf87-c0f84fb43913	جبنة رومي قديمة	جبنة رومي بلدي	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778093074716_UwXFZMM3w.jpg	أجبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-05-06 18:44:38.085+00	\N
\.


--
-- Data for Name: user_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_tokens (id, user_id, expo_push_token, platform, created_at, updated_at) FROM stdin;
5a7b39f9-4370-4100-92f7-c5da4c1184ee	ae2bf0d7-cd38-4d8b-8196-267f30532c06	ExponentPushToken[pqdiqYN-fLdavudZ2iJKlO]	android	2026-04-25 12:58:27.557076+00	2026-04-25 14:12:44.149+00
d2f358a5-2fa3-4585-b7a2-61ade8fe6306	66251fdf-5cfd-42a4-a4db-f3cf9aa8d735	ExponentPushToken[pqdiqYN-fLdavudZ2iJKlO]	android	2026-04-25 14:48:42.238927+00	2026-04-25 14:48:42.095+00
506eaf38-5447-424b-9205-ffbaafc75e4f	1b46fa06-3ee8-48f7-b469-fe9eb26abb63	ExponentPushToken[pqdiqYN-fLdavudZ2iJKlO]	android	2026-04-25 16:28:51.147506+00	2026-04-25 16:29:26.444+00
852e2689-5057-4b55-93bd-16e01b09057c	74067e16-957f-484f-828f-38c79dd0bc79	ExponentPushToken[pqdiqYN-fLdavudZ2iJKlO]	android	2026-04-25 16:31:22.79719+00	2026-04-25 16:41:15.63+00
56e39f7c-76c3-4fa1-89ea-feaf0917b3e3	ea083a9a-767f-4ee2-acde-d97b510fe4ca	ExponentPushToken[_qTdlRGxWpn-mt0-WRp8Rs]	android	2026-04-26 00:56:08.593291+00	2026-04-26 00:56:08.487+00
79a5552d-7526-4ace-b315-5740e312bf89	fc8dc024-b48e-4e55-9d35-d6499e312e31	ExponentPushToken[JVQqh1L4N7UCNTH4G7lEeL]	android	2026-04-28 20:22:23.067109+00	2026-04-28 20:22:22.858+00
bfa0258e-8fdb-49d4-ad34-587d6ae8fb78	a9f1ac52-8e20-43a7-9202-985bc8127191	ExponentPushToken[YFXz0eL20HAs6TnV4CGfvO]	android	2026-04-25 17:22:24.300059+00	2026-04-25 18:36:34.373+00
51f7190a-53fb-4013-8799-20337f0b277b	ab423d3c-e506-4bdf-8735-66a8d7c09e54	ExponentPushToken[fK14utNfcaS2GFpUk0QgCV]	android	2026-04-28 21:09:45.619184+00	2026-04-28 21:27:14.422+00
2ec595d4-7ac1-422c-a86a-5cf0f7607614	c12add9e-6d38-44fd-b558-adc3e03918b6	ExponentPushToken[u2H0EgK_9AjUaUrg2-GdNq]	android	2026-04-30 22:37:19.20105+00	2026-04-30 22:37:19.146+00
7666ea17-acff-4695-b860-be73e754685a	31589dd8-d740-41c2-88eb-c593f10cb46b	ExponentPushToken[gfxOziMWAxx3d7wAwirVD-]	android	2026-05-03 20:25:22.785414+00	2026-05-03 20:25:22.724+00
5800d11c-fb5c-413e-ad0c-6d6a6fb211c0	d6d911dd-76c0-4962-bdae-ab54ef74f5a6	ExponentPushToken[WLmQWjIGrelM7QcssEn96V]	android	2026-05-04 04:50:32.568132+00	2026-05-04 04:50:32.511+00
18d67a6f-0072-4819-afec-06890a319ba5	f63f6bb7-b28f-48b2-a969-4403eec07082	ExponentPushToken[xSu_L4ByvBTvTmMrKKPjW8]	android	2026-04-29 17:20:46.870866+00	2026-04-29 17:30:57.839+00
3c8946b5-643a-4542-9c0a-b1ac008731e9	94c662ff-7cbb-4aec-a003-72372e11110f	ExponentPushToken[8KrsGaFJEM7DCn8Oa9kFP1]	android	2026-04-29 17:34:10.579056+00	2026-04-29 17:34:09.929+00
2d87d6d4-0d8d-46be-9125-929b1e199a1d	ddf6af56-4979-46a5-a977-f01ce6ebaeec	ExponentPushToken[WThfI3ENMpkArs9wZ4okZH]	android	2026-05-06 07:34:33.408044+00	2026-05-06 07:56:37.812+00
8eb472f0-fe29-4b9e-8a14-cabcd0422be9	178224b5-f644-444f-b7d2-93119e0a5877	ExponentPushToken[gBoIsjI44h62yGYePao4cC]	android	2026-04-25 16:46:03.339266+00	2026-04-27 01:32:14.217+00
94e18406-b285-416e-a278-e80a1a6d9835	3cfaff3b-02fa-4954-b94f-2549ff58715e	ExponentPushToken[vGquUJI098GWQ7HJuBEuio]	android	2026-05-03 10:06:12.291533+00	2026-05-03 10:06:12.141+00
b80fd9bd-116a-4160-972f-2188a80e7872	35326872-16b4-48f5-b97f-6f414880de10	ExponentPushToken[vGquUJI098GWQ7HJuBEuio]	android	2026-05-03 10:07:19.310607+00	2026-05-03 10:07:19.156+00
2e149bda-36c7-4323-95e8-93fdad7600d1	65bde6b7-bbd5-4343-a41e-6abb0e1aee8e	ExponentPushToken[5DL-UtEpsR4TsUxP-jSWX0]	android	2026-05-07 07:06:51.519118+00	2026-05-07 07:06:51.422+00
\.


--
-- Data for Name: messages_2026_04_11; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_04_11 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_04_12; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_04_12 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_04_13; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_04_13 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_04_14; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_04_14 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_04_15; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_04_15 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_04_16; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_04_16 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
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
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
order-files	order-files	\N	2026-04-19 15:54:53.962889+00	2026-04-19 15:54:53.962889+00	t	f	\N	\N	\N	STANDARD
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
56	fix-optimized-search-function	cb58526ebc23048049fd5bf2fd148d18b04a2073	2026-03-17 18:22:31.89364
57	s3-multipart-uploads-metadata	f127886e00d1b374fadbc7c6b31e09336aad5287	2026-04-07 21:10:13.810496
58	operation-ergonomics	00ca5d483b3fe0d522133d9002ccc5df98365120	2026-04-07 21:10:13.831114
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
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

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: assistants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assistants_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.reviews_id_seq', 12, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 8, true);


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
-- Name: messages_2026_04_11 messages_2026_04_11_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_04_11
    ADD CONSTRAINT messages_2026_04_11_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_12 messages_2026_04_12_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_04_12
    ADD CONSTRAINT messages_2026_04_12_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_13 messages_2026_04_13_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_04_13
    ADD CONSTRAINT messages_2026_04_13_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_14 messages_2026_04_14_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_04_14
    ADD CONSTRAINT messages_2026_04_14_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_15 messages_2026_04_15_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_04_15
    ADD CONSTRAINT messages_2026_04_15_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_16 messages_2026_04_16_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_04_16
    ADD CONSTRAINT messages_2026_04_16_pkey PRIMARY KEY (id, inserted_at);


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
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_user_id ON public.orders USING btree (user_id);


--
-- Name: idx_otp_codes_phone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_otp_codes_phone ON public.otp_codes USING btree (phone);


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
-- Name: messages_2026_04_11_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_04_11_inserted_at_topic_idx ON realtime.messages_2026_04_11 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_12_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_04_12_inserted_at_topic_idx ON realtime.messages_2026_04_12 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_13_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_04_13_inserted_at_topic_idx ON realtime.messages_2026_04_13 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_14_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_04_14_inserted_at_topic_idx ON realtime.messages_2026_04_14 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_15_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_04_15_inserted_at_topic_idx ON realtime.messages_2026_04_15 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_16_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_04_16_inserted_at_topic_idx ON realtime.messages_2026_04_16 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_key ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter);


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
-- Name: messages_2026_04_11_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_04_11_inserted_at_topic_idx;


--
-- Name: messages_2026_04_11_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_04_11_pkey;


--
-- Name: messages_2026_04_12_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_04_12_inserted_at_topic_idx;


--
-- Name: messages_2026_04_12_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_04_12_pkey;


--
-- Name: messages_2026_04_13_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_04_13_inserted_at_topic_idx;


--
-- Name: messages_2026_04_13_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_04_13_pkey;


--
-- Name: messages_2026_04_14_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_04_14_inserted_at_topic_idx;


--
-- Name: messages_2026_04_14_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_04_14_pkey;


--
-- Name: messages_2026_04_15_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_04_15_inserted_at_topic_idx;


--
-- Name: messages_2026_04_15_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_04_15_pkey;


--
-- Name: messages_2026_04_16_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_04_16_inserted_at_topic_idx;


--
-- Name: messages_2026_04_16_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_04_16_pkey;


--
-- Name: service_fields prevent_duplicate_fields; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER prevent_duplicate_fields BEFORE INSERT ON public.service_fields FOR EACH ROW EXECUTE FUNCTION public.check_duplicate_field();


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

CREATE POLICY "Admins can manage all orders" ON public.orders USING (((auth.jwt() ->> 'role'::text) = 'admin'::text));


--
-- Name: rest2_items Allow admin all; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow admin all" ON public.rest2_items USING (true);


--
-- Name: otp_codes Allow all operations for authenticated users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow all operations for authenticated users" ON public.otp_codes USING (true);


--
-- Name: rest2_items Allow public read; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow public read" ON public.rest2_items FOR SELECT USING (true);


--
-- Name: orders Anyone can create orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can create orders" ON public.orders FOR INSERT WITH CHECK (true);


--
-- Name: orders Anyone can insert orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can insert orders" ON public.orders FOR INSERT WITH CHECK (true);


--
-- Name: orders Anyone can read orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can read orders" ON public.orders FOR SELECT USING (true);


--
-- Name: reviews Anyone can read reviews; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can read reviews" ON public.reviews FOR SELECT USING (true);


--
-- Name: orders Anyone can update orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can update orders" ON public.orders FOR UPDATE USING (true);


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
-- Name: TABLE merchant_product_prices; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.merchant_product_prices TO anon;
GRANT ALL ON TABLE public.merchant_product_prices TO authenticated;
GRANT ALL ON TABLE public.merchant_product_prices TO service_role;


--
-- Name: TABLE merchant_sub_services; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.merchant_sub_services TO anon;
GRANT ALL ON TABLE public.merchant_sub_services TO authenticated;
GRANT ALL ON TABLE public.merchant_sub_services TO service_role;


--
-- Name: TABLE merchants; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.merchants TO anon;
GRANT ALL ON TABLE public.merchants TO authenticated;
GRANT ALL ON TABLE public.merchants TO service_role;


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
-- Name: TABLE template_products; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.template_products TO anon;
GRANT ALL ON TABLE public.template_products TO authenticated;
GRANT ALL ON TABLE public.template_products TO service_role;


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
-- Name: TABLE messages_2026_04_11; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_04_11 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_04_11 TO dashboard_user;


--
-- Name: TABLE messages_2026_04_12; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_04_12 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_04_12 TO dashboard_user;


--
-- Name: TABLE messages_2026_04_13; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_04_13 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_04_13 TO dashboard_user;


--
-- Name: TABLE messages_2026_04_14; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_04_14 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_04_14 TO dashboard_user;


--
-- Name: TABLE messages_2026_04_15; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_04_15 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_04_15 TO dashboard_user;


--
-- Name: TABLE messages_2026_04_16; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_04_16 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_04_16 TO dashboard_user;


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

\unrestrict ECP6PddwdQYvp8hAdfmjbwojkJMt4d6vmOFRwfslML0UYPcSMKv78DOCa86ebDY

