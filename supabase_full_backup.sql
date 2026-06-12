--
-- PostgreSQL database dump
--

\restrict gDKYhgZl88dJdC9MR9tdzSB8MUHti6q9wnuPuYzhpudRlvevWbHLkb2TOzEJ6rh

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

DROP EVENT TRIGGER IF EXISTS pgrst_drop_watch;
DROP EVENT TRIGGER IF EXISTS pgrst_ddl_watch;
DROP EVENT TRIGGER IF EXISTS issue_pg_net_access;
DROP EVENT TRIGGER IF EXISTS issue_pg_graphql_access;
DROP EVENT TRIGGER IF EXISTS issue_pg_cron_access;
DROP EVENT TRIGGER IF EXISTS issue_graphql_placeholder;
DROP PUBLICATION IF EXISTS supabase_realtime_messages_publication;
DROP PUBLICATION IF EXISTS supabase_realtime;
DROP POLICY IF EXISTS "Public Access" ON storage.objects;
DROP POLICY IF EXISTS "Allow uploads" ON storage.objects;
DROP POLICY IF EXISTS "Allow update own files" ON storage.objects;
DROP POLICY IF EXISTS "Allow public read access" ON storage.objects;
DROP POLICY IF EXISTS "Allow delete own files" ON storage.objects;
DROP POLICY IF EXISTS "Allow authenticated upload" ON storage.objects;
DROP POLICY IF EXISTS "Allow Uploads" ON storage.objects;
DROP POLICY IF EXISTS "المستخدمون المسجلون يستطيعون إدار" ON public.service_items;
DROP POLICY IF EXISTS "الكل يستطيع قراءة الأصناف" ON public.service_items;
DROP POLICY IF EXISTS service_categories_select_policy ON public.service_categories;
DROP POLICY IF EXISTS service_categories_policy ON public.service_categories;
DROP POLICY IF EXISTS profiles_update_own ON public.profiles;
DROP POLICY IF EXISTS profiles_select ON public.profiles;
DROP POLICY IF EXISTS profiles_insert ON public.profiles;
DROP POLICY IF EXISTS orders_select_all ON public.orders;
DROP POLICY IF EXISTS merchants_update_own ON public.merchants;
DROP POLICY IF EXISTS merchants_select ON public.merchants;
DROP POLICY IF EXISTS allow_select_products ON public.products;
DROP POLICY IF EXISTS allow_insert_update_products ON public.products;
DROP POLICY IF EXISTS allow_all_user_tokens ON public.user_tokens;
DROP POLICY IF EXISTS allow_all_services ON public.services;
DROP POLICY IF EXISTS allow_all_service_items ON public.service_items;
DROP POLICY IF EXISTS allow_all_restaurants ON public.restaurants;
DROP POLICY IF EXISTS allow_all_products ON public.products;
DROP POLICY IF EXISTS allow_all_product_variants ON public.product_variants;
DROP POLICY IF EXISTS allow_all_places ON public.places;
DROP POLICY IF EXISTS allow_all_merchant_sub_services ON public.merchant_sub_services;
DROP POLICY IF EXISTS allow_all_merchant_product_prices ON public.merchant_product_prices;
DROP POLICY IF EXISTS allow_all_item_prices ON public.item_prices;
DROP POLICY IF EXISTS allow_all_dishes ON public.dishes;
DROP POLICY IF EXISTS allow_all_assistants ON public.assistants;
DROP POLICY IF EXISTS "Enable write for admins" ON public.service_categories;
DROP POLICY IF EXISTS "Enable write for admins" ON public.product_categories;
DROP POLICY IF EXISTS "Enable read for all users" ON public.service_categories;
DROP POLICY IF EXISTS "Enable read for all users" ON public.product_categories;
DROP POLICY IF EXISTS "Enable insert for authenticated users" ON public.product_categories;
DROP POLICY IF EXISTS "Enable delete for authenticated users" ON public.service_categories;
DROP POLICY IF EXISTS "Enable all for all users" ON public.app_settings;
DROP POLICY IF EXISTS "Customers can create reviews" ON public.reviews;
DROP POLICY IF EXISTS "Authenticated users can modify service_categories" ON public.service_categories;
DROP POLICY IF EXISTS "Anyone can read service_categories" ON public.service_categories;
DROP POLICY IF EXISTS "Anyone can read reviews" ON public.reviews;
DROP POLICY IF EXISTS "Allow select approved" ON public.shop_reviews;
DROP POLICY IF EXISTS "Allow public read" ON public.rest2_items;
DROP POLICY IF EXISTS "Allow insert for all" ON public.shop_reviews;
DROP POLICY IF EXISTS "Allow authenticated users to update service_categories" ON public.service_categories;
DROP POLICY IF EXISTS "Allow authenticated users to select service_categories" ON public.service_categories;
DROP POLICY IF EXISTS "Allow authenticated users to insert service_categories" ON public.service_categories;
DROP POLICY IF EXISTS "Allow authenticated users to delete service_categories" ON public.service_categories;
DROP POLICY IF EXISTS "Allow all operations for authenticated users" ON public.otp_codes;
DROP POLICY IF EXISTS "Allow all operations" ON public.product_categories;
DROP POLICY IF EXISTS "Allow all for authenticated" ON public.service_categories;
DROP POLICY IF EXISTS "Allow all" ON public.shop_reviews;
DROP POLICY IF EXISTS "Allow admin select all" ON public.shop_reviews;
DROP POLICY IF EXISTS "Allow admin all" ON public.rest2_items;
ALTER TABLE IF EXISTS ONLY storage.vector_indexes DROP CONSTRAINT IF EXISTS vector_indexes_bucket_id_fkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT IF EXISTS s3_multipart_uploads_parts_upload_id_fkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT IF EXISTS s3_multipart_uploads_parts_bucket_id_fkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads DROP CONSTRAINT IF EXISTS s3_multipart_uploads_bucket_id_fkey;
ALTER TABLE IF EXISTS ONLY storage.objects DROP CONSTRAINT IF EXISTS "objects_bucketId_fkey";
ALTER TABLE IF EXISTS ONLY public.sub_services DROP CONSTRAINT IF EXISTS sub_services_full_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.service_fields_new DROP CONSTRAINT IF EXISTS service_fields_new_sub_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_region_id_fkey;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_place_id_fkey;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_merchant_id_fkey;
ALTER TABLE IF EXISTS ONLY public.product_variants DROP CONSTRAINT IF EXISTS product_variants_product_id_fkey;
ALTER TABLE IF EXISTS ONLY public.places DROP CONSTRAINT IF EXISTS places_merchant_id_fkey;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS orders_driver_id_fkey;
ALTER TABLE IF EXISTS ONLY public.merchant_sub_services DROP CONSTRAINT IF EXISTS merchant_sub_services_sub_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.merchant_sub_services DROP CONSTRAINT IF EXISTS merchant_sub_services_merchant_id_fkey;
ALTER TABLE IF EXISTS ONLY public.merchant_product_prices DROP CONSTRAINT IF EXISTS merchant_product_prices_template_product_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dishes DROP CONSTRAINT IF EXISTS dishes_merchant_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.webauthn_credentials DROP CONSTRAINT IF EXISTS webauthn_credentials_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.webauthn_challenges DROP CONSTRAINT IF EXISTS webauthn_challenges_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.sso_domains DROP CONSTRAINT IF EXISTS sso_domains_sso_provider_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.sessions DROP CONSTRAINT IF EXISTS sessions_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.sessions DROP CONSTRAINT IF EXISTS sessions_oauth_client_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.saml_relay_states DROP CONSTRAINT IF EXISTS saml_relay_states_sso_provider_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.saml_relay_states DROP CONSTRAINT IF EXISTS saml_relay_states_flow_state_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.saml_providers DROP CONSTRAINT IF EXISTS saml_providers_sso_provider_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.refresh_tokens DROP CONSTRAINT IF EXISTS refresh_tokens_session_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.one_time_tokens DROP CONSTRAINT IF EXISTS one_time_tokens_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_consents DROP CONSTRAINT IF EXISTS oauth_consents_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_consents DROP CONSTRAINT IF EXISTS oauth_consents_client_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_authorizations DROP CONSTRAINT IF EXISTS oauth_authorizations_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_authorizations DROP CONSTRAINT IF EXISTS oauth_authorizations_client_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_factors DROP CONSTRAINT IF EXISTS mfa_factors_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_challenges DROP CONSTRAINT IF EXISTS mfa_challenges_auth_factor_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_amr_claims DROP CONSTRAINT IF EXISTS mfa_amr_claims_session_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.identities DROP CONSTRAINT IF EXISTS identities_user_id_fkey;
DROP TRIGGER IF EXISTS update_objects_updated_at ON storage.objects;
DROP TRIGGER IF EXISTS protect_objects_delete ON storage.objects;
DROP TRIGGER IF EXISTS protect_buckets_delete ON storage.buckets;
DROP TRIGGER IF EXISTS enforce_bucket_name_length_trigger ON storage.buckets;
DROP TRIGGER IF EXISTS tr_check_filters ON realtime.subscription;
DROP TRIGGER IF EXISTS trigger_prevent_duplicate_tokens ON public.user_tokens;
DROP TRIGGER IF EXISTS trigger_handle_user_token ON public.user_tokens;
DROP TRIGGER IF EXISTS trigger_copy_sub_services ON public.services;
DROP TRIGGER IF EXISTS trigger_copy_service_fields ON public.sub_services;
DROP TRIGGER IF EXISTS trigger_copy_merchant_on_new_service ON public.services;
DROP TRIGGER IF EXISTS trigger_cleanup_old_tokens ON public.user_tokens;
DROP TRIGGER IF EXISTS trigger_auto_create_merchant ON public.profiles;
DROP TRIGGER IF EXISTS trigger_auto_create_merchant ON public.full_services;
DROP TRIGGER IF EXISTS prevent_duplicate_fields ON public.service_fields;
DROP TRIGGER IF EXISTS create_merchant_record_trigger ON public.profiles;
DROP TRIGGER IF EXISTS auto_set_merchant_id_trigger ON public.products;
DROP INDEX IF EXISTS storage.vector_indexes_name_bucket_id_idx;
DROP INDEX IF EXISTS storage.name_prefix_search;
DROP INDEX IF EXISTS storage.idx_objects_bucket_id_name_lower;
DROP INDEX IF EXISTS storage.idx_objects_bucket_id_name;
DROP INDEX IF EXISTS storage.idx_multipart_uploads_list;
DROP INDEX IF EXISTS storage.buckets_analytics_unique_name_idx;
DROP INDEX IF EXISTS storage.bucketid_objname;
DROP INDEX IF EXISTS storage.bname;
DROP INDEX IF EXISTS realtime.subscription_subscription_id_entity_filters_action_filter_selec;
DROP INDEX IF EXISTS realtime.messages_inserted_at_topic_index;
DROP INDEX IF EXISTS realtime.messages_2026_04_16_inserted_at_topic_idx;
DROP INDEX IF EXISTS realtime.messages_2026_04_15_inserted_at_topic_idx;
DROP INDEX IF EXISTS realtime.messages_2026_04_14_inserted_at_topic_idx;
DROP INDEX IF EXISTS realtime.messages_2026_04_13_inserted_at_topic_idx;
DROP INDEX IF EXISTS realtime.messages_2026_04_12_inserted_at_topic_idx;
DROP INDEX IF EXISTS realtime.messages_2026_04_11_inserted_at_topic_idx;
DROP INDEX IF EXISTS realtime.ix_realtime_subscription_entity;
DROP INDEX IF EXISTS public.idx_service_items_service_id;
DROP INDEX IF EXISTS public.idx_service_categories_sort_order;
DROP INDEX IF EXISTS public.idx_otp_codes_phone;
DROP INDEX IF EXISTS public.idx_orders_user_id;
DROP INDEX IF EXISTS public.idx_orders_status;
DROP INDEX IF EXISTS public.idx_orders_pending_available;
DROP INDEX IF EXISTS public.idx_orders_parent_order_id;
DROP INDEX IF EXISTS public.idx_dishes_status;
DROP INDEX IF EXISTS public.idx_dishes_provider_id;
DROP INDEX IF EXISTS auth.webauthn_credentials_user_id_idx;
DROP INDEX IF EXISTS auth.webauthn_credentials_credential_id_key;
DROP INDEX IF EXISTS auth.webauthn_challenges_user_id_idx;
DROP INDEX IF EXISTS auth.webauthn_challenges_expires_at_idx;
DROP INDEX IF EXISTS auth.users_is_anonymous_idx;
DROP INDEX IF EXISTS auth.users_instance_id_idx;
DROP INDEX IF EXISTS auth.users_instance_id_email_idx;
DROP INDEX IF EXISTS auth.users_email_partial_key;
DROP INDEX IF EXISTS auth.user_id_created_at_idx;
DROP INDEX IF EXISTS auth.unique_phone_factor_per_user;
DROP INDEX IF EXISTS auth.sso_providers_resource_id_pattern_idx;
DROP INDEX IF EXISTS auth.sso_providers_resource_id_idx;
DROP INDEX IF EXISTS auth.sso_domains_sso_provider_id_idx;
DROP INDEX IF EXISTS auth.sso_domains_domain_idx;
DROP INDEX IF EXISTS auth.sessions_user_id_idx;
DROP INDEX IF EXISTS auth.sessions_oauth_client_id_idx;
DROP INDEX IF EXISTS auth.sessions_not_after_idx;
DROP INDEX IF EXISTS auth.saml_relay_states_sso_provider_id_idx;
DROP INDEX IF EXISTS auth.saml_relay_states_for_email_idx;
DROP INDEX IF EXISTS auth.saml_relay_states_created_at_idx;
DROP INDEX IF EXISTS auth.saml_providers_sso_provider_id_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_updated_at_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_session_id_revoked_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_parent_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_instance_id_user_id_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_instance_id_idx;
DROP INDEX IF EXISTS auth.recovery_token_idx;
DROP INDEX IF EXISTS auth.reauthentication_token_idx;
DROP INDEX IF EXISTS auth.one_time_tokens_user_id_token_type_key;
DROP INDEX IF EXISTS auth.one_time_tokens_token_hash_hash_idx;
DROP INDEX IF EXISTS auth.one_time_tokens_relates_to_hash_idx;
DROP INDEX IF EXISTS auth.oauth_consents_user_order_idx;
DROP INDEX IF EXISTS auth.oauth_consents_active_user_client_idx;
DROP INDEX IF EXISTS auth.oauth_consents_active_client_idx;
DROP INDEX IF EXISTS auth.oauth_clients_deleted_at_idx;
DROP INDEX IF EXISTS auth.oauth_auth_pending_exp_idx;
DROP INDEX IF EXISTS auth.mfa_factors_user_id_idx;
DROP INDEX IF EXISTS auth.mfa_factors_user_friendly_name_unique;
DROP INDEX IF EXISTS auth.mfa_challenge_created_at_idx;
DROP INDEX IF EXISTS auth.idx_user_id_auth_method;
DROP INDEX IF EXISTS auth.idx_oauth_client_states_created_at;
DROP INDEX IF EXISTS auth.idx_auth_code;
DROP INDEX IF EXISTS auth.identities_user_id_idx;
DROP INDEX IF EXISTS auth.identities_email_idx;
DROP INDEX IF EXISTS auth.flow_state_created_at_idx;
DROP INDEX IF EXISTS auth.factor_id_created_at_idx;
DROP INDEX IF EXISTS auth.email_change_token_new_idx;
DROP INDEX IF EXISTS auth.email_change_token_current_idx;
DROP INDEX IF EXISTS auth.custom_oauth_providers_provider_type_idx;
DROP INDEX IF EXISTS auth.custom_oauth_providers_identifier_idx;
DROP INDEX IF EXISTS auth.custom_oauth_providers_enabled_idx;
DROP INDEX IF EXISTS auth.custom_oauth_providers_created_at_idx;
DROP INDEX IF EXISTS auth.confirmation_token_idx;
DROP INDEX IF EXISTS auth.audit_logs_instance_id_idx;
ALTER TABLE IF EXISTS ONLY storage.vector_indexes DROP CONSTRAINT IF EXISTS vector_indexes_pkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads DROP CONSTRAINT IF EXISTS s3_multipart_uploads_pkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT IF EXISTS s3_multipart_uploads_parts_pkey;
ALTER TABLE IF EXISTS ONLY storage.objects DROP CONSTRAINT IF EXISTS objects_pkey;
ALTER TABLE IF EXISTS ONLY storage.migrations DROP CONSTRAINT IF EXISTS migrations_pkey;
ALTER TABLE IF EXISTS ONLY storage.migrations DROP CONSTRAINT IF EXISTS migrations_name_key;
ALTER TABLE IF EXISTS ONLY storage.buckets_vectors DROP CONSTRAINT IF EXISTS buckets_vectors_pkey;
ALTER TABLE IF EXISTS ONLY storage.buckets DROP CONSTRAINT IF EXISTS buckets_pkey;
ALTER TABLE IF EXISTS ONLY storage.buckets_analytics DROP CONSTRAINT IF EXISTS buckets_analytics_pkey;
ALTER TABLE IF EXISTS ONLY realtime.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY realtime.subscription DROP CONSTRAINT IF EXISTS pk_subscription;
ALTER TABLE IF EXISTS realtime.messages DROP CONSTRAINT IF EXISTS messages_payload_exclusive;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_06_15 DROP CONSTRAINT IF EXISTS messages_2026_06_15_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_06_14 DROP CONSTRAINT IF EXISTS messages_2026_06_14_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_06_13 DROP CONSTRAINT IF EXISTS messages_2026_06_13_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_06_12 DROP CONSTRAINT IF EXISTS messages_2026_06_12_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_06_11 DROP CONSTRAINT IF EXISTS messages_2026_06_11_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_06_10 DROP CONSTRAINT IF EXISTS messages_2026_06_10_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_06_09 DROP CONSTRAINT IF EXISTS messages_2026_06_09_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages DROP CONSTRAINT IF EXISTS messages_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_04_16 DROP CONSTRAINT IF EXISTS messages_2026_04_16_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_04_15 DROP CONSTRAINT IF EXISTS messages_2026_04_15_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_04_14 DROP CONSTRAINT IF EXISTS messages_2026_04_14_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_04_13 DROP CONSTRAINT IF EXISTS messages_2026_04_13_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_04_12 DROP CONSTRAINT IF EXISTS messages_2026_04_12_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_04_11 DROP CONSTRAINT IF EXISTS messages_2026_04_11_pkey;
ALTER TABLE IF EXISTS ONLY public.user_tokens DROP CONSTRAINT IF EXISTS user_tokens_user_id_key;
ALTER TABLE IF EXISTS ONLY public.user_tokens DROP CONSTRAINT IF EXISTS user_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.template_products DROP CONSTRAINT IF EXISTS template_products_pkey;
ALTER TABLE IF EXISTS ONLY public.sub_services DROP CONSTRAINT IF EXISTS sub_services_pkey;
ALTER TABLE IF EXISTS ONLY public.sound_settings DROP CONSTRAINT IF EXISTS sound_settings_pkey;
ALTER TABLE IF EXISTS ONLY public.shop_settings DROP CONSTRAINT IF EXISTS shop_settings_pkey;
ALTER TABLE IF EXISTS ONLY public.shop_reviews DROP CONSTRAINT IF EXISTS shop_reviews_pkey;
ALTER TABLE IF EXISTS ONLY public.shop_products DROP CONSTRAINT IF EXISTS shop_products_pkey;
ALTER TABLE IF EXISTS ONLY public.services DROP CONSTRAINT IF EXISTS services_pkey;
ALTER TABLE IF EXISTS ONLY public.service_tracking_steps DROP CONSTRAINT IF EXISTS service_tracking_steps_pkey;
ALTER TABLE IF EXISTS ONLY public.service_items DROP CONSTRAINT IF EXISTS service_items_pkey;
ALTER TABLE IF EXISTS ONLY public.service_fields_new DROP CONSTRAINT IF EXISTS service_fields_new_pkey;
ALTER TABLE IF EXISTS ONLY public.service_categories DROP CONSTRAINT IF EXISTS service_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.reviews DROP CONSTRAINT IF EXISTS reviews_pkey;
ALTER TABLE IF EXISTS ONLY public.reviews DROP CONSTRAINT IF EXISTS reviews_order_id_key;
ALTER TABLE IF EXISTS ONLY public.restaurants DROP CONSTRAINT IF EXISTS restaurants_pkey;
ALTER TABLE IF EXISTS ONLY public.rest2_items DROP CONSTRAINT IF EXISTS rest2_items_pkey;
ALTER TABLE IF EXISTS ONLY public.regions DROP CONSTRAINT IF EXISTS regions_pkey;
ALTER TABLE IF EXISTS ONLY public.regions DROP CONSTRAINT IF EXISTS regions_name_key;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_pkey;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_phone_key;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_pkey;
ALTER TABLE IF EXISTS ONLY public.product_variants DROP CONSTRAINT IF EXISTS product_variants_pkey;
ALTER TABLE IF EXISTS ONLY public.product_categories DROP CONSTRAINT IF EXISTS product_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.places DROP CONSTRAINT IF EXISTS places_pkey;
ALTER TABLE IF EXISTS ONLY public.otp_codes DROP CONSTRAINT IF EXISTS otp_codes_pkey;
ALTER TABLE IF EXISTS ONLY public.otp_codes DROP CONSTRAINT IF EXISTS otp_codes_phone_key;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS orders_pkey;
ALTER TABLE IF EXISTS ONLY public.offers DROP CONSTRAINT IF EXISTS offers_pkey;
ALTER TABLE IF EXISTS ONLY public.merchants DROP CONSTRAINT IF EXISTS merchants_pkey;
ALTER TABLE IF EXISTS ONLY public.merchant_sub_services DROP CONSTRAINT IF EXISTS merchant_sub_services_pkey;
ALTER TABLE IF EXISTS ONLY public.merchant_sub_services DROP CONSTRAINT IF EXISTS merchant_sub_services_merchant_id_sub_service_id_key;
ALTER TABLE IF EXISTS ONLY public.merchant_product_prices DROP CONSTRAINT IF EXISTS merchant_product_prices_pkey;
ALTER TABLE IF EXISTS ONLY public.merchant_product_prices DROP CONSTRAINT IF EXISTS merchant_product_prices_merchant_id_template_product_id_key;
ALTER TABLE IF EXISTS ONLY public.laundry_items DROP CONSTRAINT IF EXISTS laundry_items_pkey;
ALTER TABLE IF EXISTS ONLY public.item_prices DROP CONSTRAINT IF EXISTS item_prices_pkey;
ALTER TABLE IF EXISTS ONLY public.home_chefs DROP CONSTRAINT IF EXISTS home_chefs_pkey;
ALTER TABLE IF EXISTS ONLY public.full_services DROP CONSTRAINT IF EXISTS full_services_service_id_key;
ALTER TABLE IF EXISTS ONLY public.full_services DROP CONSTRAINT IF EXISTS full_services_pkey;
ALTER TABLE IF EXISTS ONLY public.dishes DROP CONSTRAINT IF EXISTS dishes_pkey;
ALTER TABLE IF EXISTS ONLY public.assistants DROP CONSTRAINT IF EXISTS assistants_pkey;
ALTER TABLE IF EXISTS ONLY public.app_settings DROP CONSTRAINT IF EXISTS app_settings_pkey;
ALTER TABLE IF EXISTS ONLY auth.webauthn_credentials DROP CONSTRAINT IF EXISTS webauthn_credentials_pkey;
ALTER TABLE IF EXISTS ONLY auth.webauthn_challenges DROP CONSTRAINT IF EXISTS webauthn_challenges_pkey;
ALTER TABLE IF EXISTS ONLY auth.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY auth.users DROP CONSTRAINT IF EXISTS users_phone_key;
ALTER TABLE IF EXISTS ONLY auth.sso_providers DROP CONSTRAINT IF EXISTS sso_providers_pkey;
ALTER TABLE IF EXISTS ONLY auth.sso_domains DROP CONSTRAINT IF EXISTS sso_domains_pkey;
ALTER TABLE IF EXISTS ONLY auth.sessions DROP CONSTRAINT IF EXISTS sessions_pkey;
ALTER TABLE IF EXISTS ONLY auth.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY auth.saml_relay_states DROP CONSTRAINT IF EXISTS saml_relay_states_pkey;
ALTER TABLE IF EXISTS ONLY auth.saml_providers DROP CONSTRAINT IF EXISTS saml_providers_pkey;
ALTER TABLE IF EXISTS ONLY auth.saml_providers DROP CONSTRAINT IF EXISTS saml_providers_entity_id_key;
ALTER TABLE IF EXISTS ONLY auth.refresh_tokens DROP CONSTRAINT IF EXISTS refresh_tokens_token_unique;
ALTER TABLE IF EXISTS ONLY auth.refresh_tokens DROP CONSTRAINT IF EXISTS refresh_tokens_pkey;
ALTER TABLE IF EXISTS ONLY auth.one_time_tokens DROP CONSTRAINT IF EXISTS one_time_tokens_pkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_consents DROP CONSTRAINT IF EXISTS oauth_consents_user_client_unique;
ALTER TABLE IF EXISTS ONLY auth.oauth_consents DROP CONSTRAINT IF EXISTS oauth_consents_pkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_clients DROP CONSTRAINT IF EXISTS oauth_clients_pkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_client_states DROP CONSTRAINT IF EXISTS oauth_client_states_pkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_authorizations DROP CONSTRAINT IF EXISTS oauth_authorizations_pkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_authorizations DROP CONSTRAINT IF EXISTS oauth_authorizations_authorization_id_key;
ALTER TABLE IF EXISTS ONLY auth.oauth_authorizations DROP CONSTRAINT IF EXISTS oauth_authorizations_authorization_code_key;
ALTER TABLE IF EXISTS ONLY auth.mfa_factors DROP CONSTRAINT IF EXISTS mfa_factors_pkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_factors DROP CONSTRAINT IF EXISTS mfa_factors_last_challenged_at_key;
ALTER TABLE IF EXISTS ONLY auth.mfa_challenges DROP CONSTRAINT IF EXISTS mfa_challenges_pkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_amr_claims DROP CONSTRAINT IF EXISTS mfa_amr_claims_session_id_authentication_method_pkey;
ALTER TABLE IF EXISTS ONLY auth.instances DROP CONSTRAINT IF EXISTS instances_pkey;
ALTER TABLE IF EXISTS ONLY auth.identities DROP CONSTRAINT IF EXISTS identities_provider_id_provider_unique;
ALTER TABLE IF EXISTS ONLY auth.identities DROP CONSTRAINT IF EXISTS identities_pkey;
ALTER TABLE IF EXISTS ONLY auth.flow_state DROP CONSTRAINT IF EXISTS flow_state_pkey;
ALTER TABLE IF EXISTS ONLY auth.custom_oauth_providers DROP CONSTRAINT IF EXISTS custom_oauth_providers_pkey;
ALTER TABLE IF EXISTS ONLY auth.custom_oauth_providers DROP CONSTRAINT IF EXISTS custom_oauth_providers_identifier_key;
ALTER TABLE IF EXISTS ONLY auth.audit_log_entries DROP CONSTRAINT IF EXISTS audit_log_entries_pkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_amr_claims DROP CONSTRAINT IF EXISTS amr_id_pk;
ALTER TABLE IF EXISTS public.reviews ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.offers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.laundry_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.item_prices ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.home_chefs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.assistants ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.app_settings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS auth.refresh_tokens ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS storage.vector_indexes;
DROP TABLE IF EXISTS storage.s3_multipart_uploads_parts;
DROP TABLE IF EXISTS storage.s3_multipart_uploads;
DROP TABLE IF EXISTS storage.objects;
DROP TABLE IF EXISTS storage.migrations;
DROP TABLE IF EXISTS storage.buckets_vectors;
DROP TABLE IF EXISTS storage.buckets_analytics;
DROP TABLE IF EXISTS storage.buckets;
DROP TABLE IF EXISTS realtime.subscription;
DROP TABLE IF EXISTS realtime.schema_migrations;
DROP TABLE IF EXISTS realtime.messages_2026_06_15;
DROP TABLE IF EXISTS realtime.messages_2026_06_14;
DROP TABLE IF EXISTS realtime.messages_2026_06_13;
DROP TABLE IF EXISTS realtime.messages_2026_06_12;
DROP TABLE IF EXISTS realtime.messages_2026_06_11;
DROP TABLE IF EXISTS realtime.messages_2026_06_10;
DROP TABLE IF EXISTS realtime.messages_2026_06_09;
DROP TABLE IF EXISTS realtime.messages_2026_04_16;
DROP TABLE IF EXISTS realtime.messages_2026_04_15;
DROP TABLE IF EXISTS realtime.messages_2026_04_14;
DROP TABLE IF EXISTS realtime.messages_2026_04_13;
DROP TABLE IF EXISTS realtime.messages_2026_04_12;
DROP TABLE IF EXISTS realtime.messages_2026_04_11;
DROP TABLE IF EXISTS realtime.messages;
DROP TABLE IF EXISTS public.user_tokens;
DROP TABLE IF EXISTS public.sub_services;
DROP TABLE IF EXISTS public.sound_settings;
DROP TABLE IF EXISTS public.shop_settings;
DROP TABLE IF EXISTS public.shop_reviews;
DROP TABLE IF EXISTS public.shop_products;
DROP TABLE IF EXISTS public.services;
DROP TABLE IF EXISTS public.service_tracking_steps;
DROP TABLE IF EXISTS public.service_items;
DROP TABLE IF EXISTS public.service_fields_new;
DROP TABLE IF EXISTS public.service_fields;
DROP TABLE IF EXISTS public.service_categories;
DROP SEQUENCE IF EXISTS public.reviews_id_seq;
DROP TABLE IF EXISTS public.reviews;
DROP TABLE IF EXISTS public.restaurants;
DROP TABLE IF EXISTS public.rest2_items;
DROP TABLE IF EXISTS public.regions;
DROP TABLE IF EXISTS public.profiles;
DROP TABLE IF EXISTS public.product_variants;
DROP TABLE IF EXISTS public.product_categories;
DROP TABLE IF EXISTS public.places;
DROP TABLE IF EXISTS public.otp_codes;
DROP TABLE IF EXISTS public.orders;
DROP SEQUENCE IF EXISTS public.offers_id_seq;
DROP TABLE IF EXISTS public.offers;
DROP TABLE IF EXISTS public.merchants;
DROP TABLE IF EXISTS public.merchant_sub_services;
DROP SEQUENCE IF EXISTS public.laundry_items_id_seq;
DROP TABLE IF EXISTS public.laundry_items;
DROP SEQUENCE IF EXISTS public.item_prices_id_seq;
DROP TABLE IF EXISTS public.item_prices;
DROP SEQUENCE IF EXISTS public.home_chefs_id_seq;
DROP TABLE IF EXISTS public.home_chefs;
DROP TABLE IF EXISTS public.full_services;
DROP TABLE IF EXISTS public.dishes;
DROP SEQUENCE IF EXISTS public.assistants_id_seq;
DROP TABLE IF EXISTS public.assistants;
DROP SEQUENCE IF EXISTS public.app_settings_id_seq;
DROP TABLE IF EXISTS public.app_settings;
DROP VIEW IF EXISTS public.all_merchant_products;
DROP TABLE IF EXISTS public.template_products;
DROP TABLE IF EXISTS public.products;
DROP TABLE IF EXISTS public.merchant_product_prices;
DROP TABLE IF EXISTS auth.webauthn_credentials;
DROP TABLE IF EXISTS auth.webauthn_challenges;
DROP TABLE IF EXISTS auth.users;
DROP TABLE IF EXISTS auth.sso_providers;
DROP TABLE IF EXISTS auth.sso_domains;
DROP TABLE IF EXISTS auth.sessions;
DROP TABLE IF EXISTS auth.schema_migrations;
DROP TABLE IF EXISTS auth.saml_relay_states;
DROP TABLE IF EXISTS auth.saml_providers;
DROP SEQUENCE IF EXISTS auth.refresh_tokens_id_seq;
DROP TABLE IF EXISTS auth.refresh_tokens;
DROP TABLE IF EXISTS auth.one_time_tokens;
DROP TABLE IF EXISTS auth.oauth_consents;
DROP TABLE IF EXISTS auth.oauth_clients;
DROP TABLE IF EXISTS auth.oauth_client_states;
DROP TABLE IF EXISTS auth.oauth_authorizations;
DROP TABLE IF EXISTS auth.mfa_factors;
DROP TABLE IF EXISTS auth.mfa_challenges;
DROP TABLE IF EXISTS auth.mfa_amr_claims;
DROP TABLE IF EXISTS auth.instances;
DROP TABLE IF EXISTS auth.identities;
DROP TABLE IF EXISTS auth.flow_state;
DROP TABLE IF EXISTS auth.custom_oauth_providers;
DROP TABLE IF EXISTS auth.audit_log_entries;
DROP FUNCTION IF EXISTS storage.update_updated_at_column();
DROP FUNCTION IF EXISTS storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text);
DROP FUNCTION IF EXISTS storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text);
DROP FUNCTION IF EXISTS storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
DROP FUNCTION IF EXISTS storage.protect_delete();
DROP FUNCTION IF EXISTS storage.operation();
DROP FUNCTION IF EXISTS storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text, sort_order text);
DROP FUNCTION IF EXISTS storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text);
DROP FUNCTION IF EXISTS storage.get_size_by_bucket();
DROP FUNCTION IF EXISTS storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text);
DROP FUNCTION IF EXISTS storage.foldername(name text);
DROP FUNCTION IF EXISTS storage.filename(name text);
DROP FUNCTION IF EXISTS storage.extension(name text);
DROP FUNCTION IF EXISTS storage.enforce_bucket_name_length();
DROP FUNCTION IF EXISTS storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb);
DROP FUNCTION IF EXISTS storage.allow_only_operation(expected_operation text);
DROP FUNCTION IF EXISTS storage.allow_any_operation(expected_operations text[]);
DROP FUNCTION IF EXISTS realtime.wal2json_escape_identifier(name text);
DROP FUNCTION IF EXISTS realtime.topic();
DROP FUNCTION IF EXISTS realtime.to_regrole(role_name text);
DROP FUNCTION IF EXISTS realtime.subscription_check_filters();
DROP FUNCTION IF EXISTS realtime.send_binary(payload bytea, event text, topic text, private boolean);
DROP FUNCTION IF EXISTS realtime.send(payload jsonb, event text, topic text, private boolean);
DROP FUNCTION IF EXISTS realtime.quote_wal2json(entity regclass);
DROP FUNCTION IF EXISTS realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer);
DROP FUNCTION IF EXISTS realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]);
DROP FUNCTION IF EXISTS realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text);
DROP FUNCTION IF EXISTS realtime."cast"(val text, type_ regtype);
DROP FUNCTION IF EXISTS realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]);
DROP FUNCTION IF EXISTS realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text);
DROP FUNCTION IF EXISTS realtime.apply_rls(wal jsonb, max_record_bytes integer);
DROP FUNCTION IF EXISTS public.upsert_full_service_with_subs(p_service_id text, p_service_name text, p_icon text, p_color text);
DROP FUNCTION IF EXISTS public.sync_full_service_data(p_service_id text);
DROP FUNCTION IF EXISTS public.prevent_duplicate_tokens();
DROP FUNCTION IF EXISTS public.notify_sound_update();
DROP FUNCTION IF EXISTS public.handle_user_token();
DROP FUNCTION IF EXISTS public.delete_place_with_products(place_id_param bigint);
DROP FUNCTION IF EXISTS public.copy_sub_services_on_new_service();
DROP FUNCTION IF EXISTS public.copy_service_fields_on_new_sub();
DROP FUNCTION IF EXISTS public.copy_merchant_on_new_service();
DROP FUNCTION IF EXISTS public.cleanup_old_tokens();
DROP FUNCTION IF EXISTS public.check_duplicate_field();
DROP FUNCTION IF EXISTS public.auto_set_merchant_id();
DROP FUNCTION IF EXISTS public.auto_create_merchant_record();
DROP FUNCTION IF EXISTS public.auto_create_merchant_for_full_service();
DROP FUNCTION IF EXISTS pgbouncer.get_auth(p_usename text);
DROP FUNCTION IF EXISTS graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb);
DROP FUNCTION IF EXISTS extensions.set_graphql_placeholder();
DROP FUNCTION IF EXISTS extensions.pgrst_drop_watch();
DROP FUNCTION IF EXISTS extensions.pgrst_ddl_watch();
DROP FUNCTION IF EXISTS extensions.grant_pg_net_access();
DROP FUNCTION IF EXISTS extensions.grant_pg_graphql_access();
DROP FUNCTION IF EXISTS extensions.grant_pg_cron_access();
DROP FUNCTION IF EXISTS auth.uid();
DROP FUNCTION IF EXISTS auth.role();
DROP FUNCTION IF EXISTS auth.jwt();
DROP FUNCTION IF EXISTS auth.email();
DROP TYPE IF EXISTS storage.buckettype;
DROP TYPE IF EXISTS realtime.wal_rls;
DROP TYPE IF EXISTS realtime.wal_column;
DROP TYPE IF EXISTS realtime.user_defined_filter;
DROP TYPE IF EXISTS realtime.equality_op;
DROP TYPE IF EXISTS realtime.action;
DROP TYPE IF EXISTS auth.one_time_token_type;
DROP TYPE IF EXISTS auth.oauth_response_type;
DROP TYPE IF EXISTS auth.oauth_registration_type;
DROP TYPE IF EXISTS auth.oauth_client_type;
DROP TYPE IF EXISTS auth.oauth_authorization_status;
DROP TYPE IF EXISTS auth.factor_type;
DROP TYPE IF EXISTS auth.factor_status;
DROP TYPE IF EXISTS auth.code_challenge_method;
DROP TYPE IF EXISTS auth.aal_level;
DROP EXTENSION IF EXISTS "uuid-ossp";
DROP EXTENSION IF EXISTS supabase_vault;
DROP EXTENSION IF EXISTS pgcrypto;
DROP EXTENSION IF EXISTS pg_stat_statements;
DROP SCHEMA IF EXISTS vault;
DROP SCHEMA IF EXISTS storage;
DROP SCHEMA IF EXISTS realtime;
-- *not* dropping schema, since initdb creates it
DROP SCHEMA IF EXISTS pgbouncer;
DROP SCHEMA IF EXISTS graphql_public;
DROP SCHEMA IF EXISTS graphql;
DROP SCHEMA IF EXISTS extensions;
DROP SCHEMA IF EXISTS auth;
--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auth;


--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA extensions;


--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql;


--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql_public;


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pgbouncer;


--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS '';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA realtime;


--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA storage;


--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA vault;


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


--
-- Name: action; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: -
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


--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: -
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: -
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


--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: -
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


--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: -
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


--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: -
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


--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: -
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


--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: -
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


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: -
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


--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: -
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


--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: -
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


--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: -
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


--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: graphql(text, text, jsonb, jsonb); Type: FUNCTION; Schema: graphql_public; Owner: -
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


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: -
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


--
-- Name: auto_create_merchant_for_full_service(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: auto_create_merchant_record(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: auto_set_merchant_id(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.auto_set_merchant_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- لا تفعل شيئاً
  RETURN NEW;
END;
$$;


--
-- Name: check_duplicate_field(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: cleanup_old_tokens(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.cleanup_old_tokens() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM user_tokens
  WHERE created_at < NOW() - INTERVAL '7 days';
  RETURN NEW;
END;
$$;


--
-- Name: copy_merchant_on_new_service(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: copy_service_fields_on_new_sub(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: copy_sub_services_on_new_service(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: delete_place_with_products(bigint); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: handle_user_token(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.handle_user_token() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- حذف التوكنات القديمة لنفس المستخدم على نفس المنصة
    DELETE FROM user_tokens
      WHERE user_id = NEW.user_id
          AND platform = NEW.platform
              AND id != NEW.id;
                
                  RETURN NEW;
                  END;
                  $$;


--
-- Name: notify_sound_update(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: prevent_duplicate_tokens(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.prevent_duplicate_tokens() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM user_tokens
  WHERE user_id = NEW.user_id
    AND platform = NEW.platform
    AND id != NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: sync_full_service_data(text); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: upsert_full_service_with_subs(text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
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


--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: send_binary(bytea, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: -
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


--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


--
-- Name: wal2json_escape_identifier(text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.wal2json_escape_identifier(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
  -- Prefix `\`, `,`, `.`, and any whitespace with `\`
  SELECT regexp_replace(name, '([\\,.[:space:]])', '\\\1', 'g')
$$;


--
-- Name: allow_any_operation(text[]); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: allow_only_operation(text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
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


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: webauthn_challenges; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: webauthn_credentials; Type: TABLE; Schema: auth; Owner: -
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


--
-- Name: merchant_product_prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merchant_product_prices (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    merchant_id uuid NOT NULL,
    template_product_id uuid,
    price numeric DEFAULT 0,
    is_available boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    all_merchant_product_id uuid
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: template_products; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: all_merchant_products; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.all_merchant_products AS
 SELECT p.id,
    p.name,
    p.price,
    p.description,
    p.image_url,
    p.merchant_id,
    p.service_id,
    'own'::text AS product_type,
    p.is_available,
    p.status,
    p.created_at,
    p.category
   FROM public.products p
  WHERE (p.merchant_id IS NOT NULL)
UNION ALL
 SELECT tp.id,
    tp.name,
    mpp.price,
    tp.description,
    tp.image_url,
    mpp.merchant_id,
    tp.service_type AS service_id,
    'unified'::text AS product_type,
    mpp.is_available,
    'approved'::text AS status,
    mpp.created_at,
    tp.category
   FROM (public.merchant_product_prices mpp
     JOIN public.template_products tp ON ((mpp.template_product_id = tp.id)))
  WHERE (mpp.merchant_id IS NOT NULL);


--
-- Name: app_settings; Type: TABLE; Schema: public; Owner: -
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
    tab4_image text DEFAULT ''::text,
    send_sound_url text,
    notification_sound_url text,
    key text,
    value text
);


--
-- Name: app_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.app_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.app_settings_id_seq OWNED BY public.app_settings.id;


--
-- Name: assistants; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: assistants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assistants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assistants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assistants_id_seq OWNED BY public.assistants.id;


--
-- Name: dishes; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- Name: full_services; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: home_chefs; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: home_chefs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.home_chefs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: home_chefs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.home_chefs_id_seq OWNED BY public.home_chefs.id;


--
-- Name: item_prices; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: item_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_prices_id_seq OWNED BY public.item_prices.id;


--
-- Name: laundry_items; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: laundry_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.laundry_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: laundry_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.laundry_items_id_seq OWNED BY public.laundry_items.id;


--
-- Name: merchant_sub_services; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: merchants; Type: TABLE; Schema: public; Owner: -
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
    has_driver boolean DEFAULT false
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
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
    guest_phone text,
    sub_service_id text,
    parent_order_id text
);

ALTER TABLE ONLY public.orders REPLICA IDENTITY FULL;


--
-- Name: otp_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.otp_codes (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    phone text NOT NULL,
    code text NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: places; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: -
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
    name_en text
);


--
-- Name: product_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_variants (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    product_id uuid,
    name text NOT NULL,
    price numeric DEFAULT 0,
    display_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: regions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.regions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: rest2_items; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: restaurants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
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
-- Name: reviews; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: service_categories; Type: TABLE; Schema: public; Owner: -
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
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: service_fields; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: service_fields_new; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: service_items; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: service_tracking_steps; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: services; Type: TABLE; Schema: public; Owner: -
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
    display_type text DEFAULT 'regular'::text
);


--
-- Name: shop_products; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: shop_reviews; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: shop_settings; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: sound_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sound_settings (
    id integer DEFAULT 1 NOT NULL,
    send_sound_url text,
    notification_sound_url text,
    updated_at timestamp without time zone DEFAULT now()
);


--
-- Name: sub_services; Type: TABLE; Schema: public; Owner: -
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
    tracking_icon_url text
);


--
-- Name: user_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_tokens (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    expo_push_token text NOT NULL,
    platform text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: messages_2026_04_11; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: messages_2026_04_12; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: messages_2026_04_13; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: messages_2026_04_14; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: messages_2026_04_15; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: messages_2026_04_16; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: messages_2026_06_09; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: messages_2026_06_10; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: messages_2026_06_11; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: messages_2026_06_12; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: messages_2026_06_13; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2026_06_13 (
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


--
-- Name: messages_2026_06_14; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2026_06_14 (
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


--
-- Name: messages_2026_06_15; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages_2026_06_15 (
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


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: -
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


--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: -
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
-- Name: buckets; Type: TABLE; Schema: storage; Owner: -
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


--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: -
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


--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: objects; Type: TABLE; Schema: storage; Owner: -
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


--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: -
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


--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: -
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


--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: -
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


--
-- Name: messages_2026_06_09; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_09 FOR VALUES FROM ('2026-06-09 00:00:00') TO ('2026-06-10 00:00:00');


--
-- Name: messages_2026_06_10; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_10 FOR VALUES FROM ('2026-06-10 00:00:00') TO ('2026-06-11 00:00:00');


--
-- Name: messages_2026_06_11; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_11 FOR VALUES FROM ('2026-06-11 00:00:00') TO ('2026-06-12 00:00:00');


--
-- Name: messages_2026_06_12; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_12 FOR VALUES FROM ('2026-06-12 00:00:00') TO ('2026-06-13 00:00:00');


--
-- Name: messages_2026_06_13; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_13 FOR VALUES FROM ('2026-06-13 00:00:00') TO ('2026-06-14 00:00:00');


--
-- Name: messages_2026_06_14; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_14 FOR VALUES FROM ('2026-06-14 00:00:00') TO ('2026-06-15 00:00:00');


--
-- Name: messages_2026_06_15; Type: TABLE ATTACH; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_06_15 FOR VALUES FROM ('2026-06-15 00:00:00') TO ('2026-06-16 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: app_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_settings ALTER COLUMN id SET DEFAULT nextval('public.app_settings_id_seq'::regclass);


--
-- Name: assistants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistants ALTER COLUMN id SET DEFAULT nextval('public.assistants_id_seq'::regclass);


--
-- Name: home_chefs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.home_chefs ALTER COLUMN id SET DEFAULT nextval('public.home_chefs_id_seq'::regclass);


--
-- Name: item_prices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_prices ALTER COLUMN id SET DEFAULT nextval('public.item_prices_id_seq'::regclass);


--
-- Name: laundry_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.laundry_items ALTER COLUMN id SET DEFAULT nextval('public.laundry_items_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
de2ef09a-eda8-4218-a9da-c3f9a58e8ec2	de2ef09a-eda8-4218-a9da-c3f9a58e8ec2	{"sub": "de2ef09a-eda8-4218-a9da-c3f9a58e8ec2", "name": "ايمن", "role": "merchant", "email": "01022222222@temp.com", "phone": "01022222222", "email_verified": false, "phone_verified": false}	email	2026-03-18 21:52:53.605023+00	2026-03-18 21:52:53.605077+00	2026-03-18 21:52:53.605077+00	0dc87a11-9959-4d10-9660-671b5b431744
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
b5247635-9028-48de-ba65-38873d790b31	de2ef09a-eda8-4218-a9da-c3f9a58e8ec2	confirmation_token	ce09b71982c51c0bff65e9100b83947b611af0a640403409b9ec91af	01022222222@temp.com	2026-03-18 21:56:05.256029	2026-03-18 21:56:05.256029
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: -
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
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	de2ef09a-eda8-4218-a9da-c3f9a58e8ec2	authenticated	authenticated	01022222222@temp.com	$2a$10$C.bTJGR.pExv5nVLe5VTwOT9mCJwFMX6nYbidwD3Ymx9Ai8batO8G	\N	\N	ce09b71982c51c0bff65e9100b83947b611af0a640403409b9ec91af	2026-03-18 21:56:04.865303+00		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{"sub": "de2ef09a-eda8-4218-a9da-c3f9a58e8ec2", "name": "ايمن", "role": "merchant", "email": "01022222222@temp.com", "phone": "01022222222", "email_verified": false, "phone_verified": false}	\N	2026-03-18 21:52:53.582176+00	2026-03-18 21:56:05.226163+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.webauthn_challenges (id, user_id, challenge_type, session_data, created_at, expires_at) FROM stdin;
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.webauthn_credentials (id, user_id, credential_id, public_key, attestation_type, aaguid, sign_count, transports, backup_eligible, backed_up, friendly_name, created_at, updated_at, last_used_at) FROM stdin;
\.


--
-- Data for Name: app_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.app_settings (id, splash_type, splash_image_url, splash_video_url, splash_duration, created_at, updated_at, loading_type, loading_video_url, loading_image_url, loading_gif_url, splash_gif_url, loading_duration, loading_sound_url, loading_sound_enabled, splash_sound_url, splash_sound_enabled, app_version, splash_text, splash_background_url, app_logo_url, duration_mode, splash_text_color, splash_bg_color, primary_color, background_color, transparency, header_image_url, background_image_url, accent_color, header_color, category_text_color, service_category_color, bg_opacity, header_style_type, regions_icon, assistant_icon_url, card_opacity, customer_auth_opacity, customer_auth_background_url, tab1_label, tab1_icon, tab1_image, tab2_label, tab2_icon, tab2_image, tab3_label, tab3_icon, tab3_image, tab4_label, tab4_icon, tab4_image, send_sound_url, notification_sound_url, key, value) FROM stdin;
1	video	\N	https://ik.imagekit.io/vzuah6tku/Png/Project_05-17(1)(1)(1)_4K_HIGH_FR30.mp4?updatedAt=1779140142619	3000	2026-06-11 00:52:16.468542	2026-06-11 01:18:05.439	image	\N	\N	\N	\N	1500	\N	f	\N	f	ZID V1.0.0	مرحباً بك في زد	\N	https://ik.imagekit.io/vzuah6tku/zayedid/pictures/appLogo_1779187416323_opbSPswBe.jpg	auto	#FFFFFF	#1a1a2e	#4F46E5	#FFFFFF	50	https://ik.imagekit.io/vzuah6tku/app_settings/headerImage_1779141933860_kXynHBiSH?updatedAt=1779141934800	https://ik.imagekit.io/vzuah6tku/app_settings/backgroundImage_1778953848435_TaVQtZt-Y?updatedAt=1778953849501	#8B5CF6	#FFFFFF	#1F2937	#1F2937	0.3	floating	https://ik.imagekit.io/vzuah6tku/app_settings/regionsIcon_1779141822513_RdPlrUuTy?updatedAt=1779141826286	https://ik.imagekit.io/vzuah6tku/zayedid/pictures/assistantIcon_1781140188065_mfvZeLbeI.jpg	1	0.9	https://ik.imagekit.io/vzuah6tku/app_settings/customerAuthBg_1779182145975_s6qsYYCwFz?updatedAt=1779182152182	طلب	cart		عروض	pricetag		متجر Zid	storefront		طلباتي	list		\N	\N	\N	\N
\.


--
-- Data for Name: assistants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assistants (id, name, specialty, bio, created_at, screen, icon, color, "position", "order", model, role, prompt, service_id, service_name, is_active, welcome_message, system_prompt, updated_at, data_table, data_columns, data_filter, service_display_name, service_type_name, service_description, data_limit) FROM stdin;
12	منحز السوبر ماركت	\N	\N	2026-05-16 21:18:42.473+00	service	chatbubble	#4F46E5	bottom-right	0	openai/gpt-oss-120b	general	\N	supermarket	سوبر ماركت	t	اهلا بك	أنت "مُنْجِز"، المساعد الذكي والمستشار البيعي الشخصي لحساب "زيد" \n\nأنت خدمة عملاء راقية وودودة.\n\n[أسلوبك]\n- عامية مصرية محترمة، ودودة، وواضحة.\n- ردودك مختصرة ومفيدة.\n- استخدم إيموجي خفيف (🛍️ 🛒 ✅).\n\n[قواعد إضافة المنتجات - مهم جداً]\n- لا تقول أبداً "تم إضافته" أو "أضفته" قبل استدعاء أداة add_product_to_cart بنجاح.\n- عندما يظهر اهتمام العميل بمنتج، اسأله بهذه الصيغة بالظبط: "تحب أضيف [اسم المنتج] للسلة دلوقتي؟ لو موافق اكتب 'تمام' أو 'ضيف' 🛒"\n\n[قواعد استدعاء add_product_to_cart]\nاستدعي الأداة فوراً فقط في الحالات دي:\n- العميل يكتب "تمام" أو "ضيف" أو "ايوه" أو "نعم" أو "موافق" بعد سؤالك عن الإضافة.\n- العميل يقول صراحة "أضف [المنتج]" أو "حطه في السلة" أو "عايز [المنتج]".\n\nبعد نجاح استدعاء الأداة، قل: "تمام، تم إضافة [اسم المنتج] للسلة بنجاح 🛒"\n\nلا تخترع أي منتج أو سعر. كن لبقاً ومحترفاً دايماً.\nوالتوصيل بيكون في خلال ٢٠ الي ٣٠ دقيقه	2026-05-23 21:36:20.521	all_merchant_products	id, name, price, description, image_url, merchant_id, service_id	service_id::eq::supermarket	\N	\N	\N	300
14	الشيف	\N	\N	2026-05-20 16:57:32.899+00	service	chatbubble	#4F46E5	bottom-right	0	llama-3.3-70b-versatile	general	\N	home_chef	الشيف المنزلي	t	أهلاً! أنا مُنجز. كيف أقدر أساعدك؟	أنت مساعد ذكي اسمك "مُنجز". رد بالعامية المصرية.	2026-05-20 16:58:21.018	all_merchant_products	name, price, description, image_url	home_chef	\N	\N	\N	100
9	منجز المتجر	\N	\N	2026-05-16 05:34:29.185+00	eshop	chatbubble	#EC4899	bottom-right	0	openai/gpt-oss-120b	general	\N	\N	\N	t	اهلا بك في متجر Zid ، ازاي اقدر أساعدك..	{\n  "role": "system",\n  "content": "أنت \\"مُنْجِز\\"، المساعد الذكي والمستشار البيعي الشخصي لحساب \\"زيد\\" (نجوم زايد).\\n\\nأنت خدمة عملاء راقية وودودة.\\n\\n[أسلوبك]\\n- عامية مصرية محترمة، ودودة، وواضحة.\\n- ردودك مختصرة ومفيدة.\\n- استخدم إيموجي خفيف (🛍️ 🛒 ✅).\\n\\n[قواعد إضافة المنتجات - مهم جداً]\\n- لا تقول أبداً \\"تم إضافته\\" أو \\"أضفته\\" قبل استدعاء أداة add_product_to_cart بنجاح.\\n- عندما يظهر اهتمام العميل بمنتج، اسأله بهذه الصيغة بالظبط أو مشابهة جداً:\\n  \\"تحب أضيف [اسم المنتج] للسلة دلوقتي؟ لو موافق اكتب 'تمام' أو 'ضيف' 🛒\\"\\n\\n[قواعد استدعاء add_product_to_cart]\\nاستدعي الأداة فوراً فقط في الحالات دي:\\n- العميل يكتب \\"تمام\\" أو \\"ضيف\\" أو \\"ايوه\\" أو \\"نعم\\" أو \\"موافق\\" بعد سؤالك عن الإضافة.\\n- العميل يقول صراحة \\"أضف [المنتج]\\" أو \\"حطه في السلة\\" أو \\"عايز [المنتج]\\".\\n\\nبعد نجاح استدعاء الأداة، قل: \\"تمام، تم إضافة [اسم المنتج] للسلة بنجاح 🛒\\"\\n\\n[compare_products]\\nاستخدمها تلقائياً عند طلب المقارنة أو الحيرة بين منتجين أو أكثر.\\n\\nلا تخترع أي منتج أو سعر. كن لبقاً ومحترفاً دايماً."\n}	2026-05-21 08:09:39.353	shop_products	name, price, description, image_url, category	is_available::eq::true	\N	\N	\N	200
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dishes (id, restaurant_id, name, price, description, image_url, created_at, merchant_id, provider_id, provider_type, provider_name, category, ingredients, video_url, rejection_reason, is_available, status, merchant_name, service_id, images, updated_at) FROM stdin;
3	\N	شاورما لحم سوري	140	لحم	\N	2026-03-28 19:53:24.157+00	\N	38b05fe8-9b97-4431-a5f9-76ab88323c70	restaurant	\N	\N	{}	https://ik.imagekit.io/vzuah6tku/zayedid/misc/dish_video_1774727573952_9RmL8ZHM7.mp4	\N	t	approved	\N	\N	{https://ik.imagekit.io/vzuah6tku/zayedid/misc/dish_1774727572471_ZnDWMWHBU.jpg}	2026-03-28 20:22:19.062
2	\N	شاورما سوري	120	عيش سوري	\N	2026-03-28 19:46:18.138+00	\N	38b05fe8-9b97-4431-a5f9-76ab88323c70	restaurant	\N	شاميه	{"لحم بلدي","عيش سوري"}	https://ik.imagekit.io/vzuah6tku/zayedid/misc/dish_video_1774727169429_PmSJk0CSl.mp4	\N	t	approved	\N	\N	{}	2026-03-28 20:22:22.969
1	\N	فراخ	500		\N	2026-03-27 05:40:51.435+00	\N	51108e8c-1e91-4eb8-aff1-7a45c6406760	restaurant	\N	\N	{}	\N	\N	t	approved	\N	\N	{}	2026-03-28 20:22:25.992
4	\N	فرخه متبله	300		\N	2026-04-08 17:00:26.19+00	\N	38b05fe8-9b97-4431-a5f9-76ab88323c70	restaurant	\N	\N	{فراخ,خبز}	\N	\N	t	approved	\N	\N	{}	2026-04-08 17:01:10.371
5	\N	برجر مكس	70		https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1776553944503_6xbxGNPL5.jpg	2026-04-18 23:12:27.358744+00	\N	38b05fe8-9b97-4431-a5f9-76ab88323c70	restaurant	مطعم انس	\N	\N	\N	\N	t	pending	\N	\N	{}	2026-04-18 23:12:27.358744
\.


--
-- Data for Name: full_services; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.full_services (id, service_id, name, icon, color, is_active, created_at, updated_at, image_url) FROM stdin;
c7205659-f582-40f1-9bbb-76dcfb40a337	delivery	توصيل طلبات	bicycle	#10B981	t	2026-05-01 11:00:48.470722+00	2026-05-01 11:00:48.470722+00	\N
9352bbce-8ae1-46e2-9964-2db4ce667326	travel	سياحة وسفر	briefcase	#8B5CF6	t	2026-04-30 07:31:09.186914+00	2026-05-03 04:31:14.62+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777560251186_5wqvCYGuh.jpg
\.


--
-- Data for Name: home_chefs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.home_chefs (id, name, user_id, bio, image_url, cover_image, health_cert_url, is_verified, specialties, delivery_radius, delivery_fee, min_order, is_active, dishes_count, rating, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: item_prices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item_prices (id, item_id, sub_service_name, price, qty, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: laundry_items; Type: TABLE DATA; Schema: public; Owner: -
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
-- Data for Name: merchant_product_prices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.merchant_product_prices (id, merchant_id, template_product_id, price, is_available, created_at, all_merchant_product_id) FROM stdin;
0e2fefbf-b061-4f3a-8885-8139b698dcf0	d6d911dd-76c0-4962-bdae-ab54ef74f5a6	c7c9d5ea-c76b-41e3-b712-cacf108902a7	88	t	2026-04-28 00:56:23.216476+00	c7c9d5ea-c76b-41e3-b712-cacf108902a7
0917a8a6-b88f-4339-ae9b-bc68aed1df8b	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	77496c02-8a41-4d9d-a3f8-1c698a98d6cf	60	t	2026-05-05 11:01:20.098369+00	77496c02-8a41-4d9d-a3f8-1c698a98d6cf
1865f6a5-9be9-48e0-a370-7eae611a2d80	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	dffb938d-3b91-4cb3-bf87-c0f84fb43913	90	t	2026-05-05 14:57:28.267558+00	dffb938d-3b91-4cb3-bf87-c0f84fb43913
ed6717fc-1e33-43ce-99a4-c5a34f9e8cd6	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	9ebabb39-882b-43b6-8143-7a3448eb6340	55	t	2026-05-05 14:57:16.693575+00	9ebabb39-882b-43b6-8143-7a3448eb6340
804de246-4da9-4d8d-8b6e-73c9afb18889	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	0da1c6cc-6f6a-4e3a-932d-754448c1a99b	25	t	2026-05-05 14:58:28.623995+00	0da1c6cc-6f6a-4e3a-932d-754448c1a99b
02c3f3e7-2b2d-4e81-abb8-d9b194bd4794	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	aa64325d-d8cf-429d-b872-bf85ab43f150	150	t	2026-05-05 14:58:41.403107+00	aa64325d-d8cf-429d-b872-bf85ab43f150
5e65fd86-3d5d-4f92-8736-b6b95d8622c3	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	9e7bac47-32bd-4987-a8ee-6d2a9275caff	150	f	2026-05-05 14:57:51.244065+00	9e7bac47-32bd-4987-a8ee-6d2a9275caff
46202300-8a23-4886-95cf-834201917790	14c34717-0a25-4ed8-ad1b-df970d18b4dc	9ebabb39-882b-43b6-8143-7a3448eb6340	61	t	2026-05-12 14:01:46.444532+00	9ebabb39-882b-43b6-8143-7a3448eb6340
7ac2f623-f0e8-4980-9c30-fa15725ad701	14c34717-0a25-4ed8-ad1b-df970d18b4dc	e976ea5d-b967-45e9-b4d1-f9bbe0493c24	60	t	2026-05-12 14:01:57.969639+00	e976ea5d-b967-45e9-b4d1-f9bbe0493c24
309675c0-9e55-4ebe-a234-c3f3643c2584	14c34717-0a25-4ed8-ad1b-df970d18b4dc	77496c02-8a41-4d9d-a3f8-1c698a98d6cf	90	t	2026-05-12 14:02:15.195003+00	77496c02-8a41-4d9d-a3f8-1c698a98d6cf
997d7d75-52e1-4808-906d-35f7a0500545	1dae6ea9-580d-43ef-b657-4d398b4b4f44	de225325-a0f5-4bba-9403-e0a6d9af6f40	120	t	2026-05-15 04:34:35.577608+00	de225325-a0f5-4bba-9403-e0a6d9af6f40
074ab5db-9570-4247-9e48-de78e695e128	d87ca828-707e-485b-a81a-0428102f5ab4	9ebabb39-882b-43b6-8143-7a3448eb6340	69	t	2026-05-17 06:16:43.87992+00	9ebabb39-882b-43b6-8143-7a3448eb6340
\.


--
-- Data for Name: merchant_sub_services; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.merchant_sub_services (id, merchant_id, sub_service_id, is_active, show_title, created_at, updated_at) FROM stdin;
9500fcb5-8e57-40c5-ba8f-00edc225f036	ddf6af56-4979-46a5-a977-f01ce6ebaeec	20956352-1809-4e50-9a04-577781242eae	t	t	2026-05-05 14:56:00.239722+00	2026-05-05 14:56:04.713+00
\.


--
-- Data for Name: merchants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.merchants (id, user_id, name, phone, service_type, place_name, address, delivery_fee, is_active, image_url, created_at, updated_at, has_driver) FROM stdin;
af895294-c6d2-408b-9fbb-4f84b04c29b6	af895294-c6d2-408b-9fbb-4f84b04c29b6	مكوجي مهندسين	01299999999	dryclean		\N	30	t		2026-05-07 15:23:42.114872+00	2026-05-07 17:08:27.168385+00	f
42e2ac06-2524-42f2-9215-98ea3b4f3f56	42e2ac06-2524-42f2-9215-98ea3b4f3f56	الشيف حسن	01022222222	home_chef		\N	50	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/الشيف_حسن/misc/merchant_42e2ac06-2524-42f2-9215-98ea3b4f3f56_1778074951717_G7nz74zQl.jpg	2026-05-06 13:41:07.650906+00	2026-05-09 19:06:15.087507+00	f
959f739f-5ae3-4811-a1ab-434012ff11e9	959f739f-5ae3-4811-a1ab-434012ff11e9	Joe	01200000000	home_chef	\N	\N	10	t	\N	2026-05-09 19:13:31.299151+00	2026-05-10 04:52:35.107618+00	f
ddf6af56-4979-46a5-a977-f01ce6ebaeec	ddf6af56-4979-46a5-a977-f01ce6ebaeec	Thomas Cook Tours	+201000000001	travel		\N	10	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/thomas_cook_tours/profile/profile_1778014659036_yMNxJaxtH.jpg	2026-05-05 08:34:22.695468+00	2026-06-10 10:53:08.731708+00	f
cb273744-cf70-486d-b6e1-8c1c4932b140	cb273744-cf70-486d-b6e1-8c1c4932b140	مكوجي	+201099999999	dryclean		\N	40	t		2026-05-07 15:20:21.798484+00	2026-06-10 10:53:34.582198+00	f
14c34717-0a25-4ed8-ad1b-df970d18b4dc	14c34717-0a25-4ed8-ad1b-df970d18b4dc	الهواري	+201022222222	supermarket		\N	10	t		2026-05-12 14:01:09.558576+00	2026-06-12 00:52:09.294976+00	t
1dae6ea9-580d-43ef-b657-4d398b4b4f44	1dae6ea9-580d-43ef-b657-4d398b4b4f44	الشيف	+20100001234	home_chef		\N	50	t		2026-05-14 13:27:19.2098+00	2026-06-10 10:54:51.322246+00	f
cd392e2f-7c36-41e6-b98f-e81ffc3dc013	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	صن شاين	+201011111111	supermarket		\N	50	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/صن_شاين/misc/merchant_cd392e2f-7c36-41e6-b98f-e81ffc3dc013_1778001793590_NTF-0X7C8.jpg	2026-05-05 11:00:37.74374+00	2026-06-10 17:50:00.824773+00	t
d87ca828-707e-485b-a81a-0428102f5ab4	d87ca828-707e-485b-a81a-0428102f5ab4	مترو ماركت	+201033333333	supermarket		\N	60	t		2026-05-17 06:16:10.600171+00	2026-06-10 10:55:39.833644+00	t
\.


--
-- Data for Name: offers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.offers (id, title, description, image_url, is_approved, created_at, updated_at, merchant_id, merchant_name, service_type, discount_percent, original_price, offer_price, start_date, end_date, status, admin_notes, is_active, tour_package_details) FROM stdin;
3	توصيل مجاني على خدمات المكوجي	ساري من يوم ١ مايو حتى ٥ مايو	https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777218619739_iP6B85CGN.jpg	\N	2026-04-26 15:50:27.006+00	2026-04-26 15:50:56.082+00	\N	إدارة Zid		\N	\N	\N	\N	\N	approved		t	{}
2	سندويتش برجر ب ٨٠ جنية بدلا من ١٠٠ جنية	هذا العرض ساري لفترة محدودة	https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777215794311_X3_GEPYkP.jpg	\N	2026-04-26 15:03:58.993+00	2026-04-26 16:49:36.082+00	c264e47a-f655-4db5-af8d-f6b12058118d	شيف	home_chef	20	100	80	\N	\N	approved		t	{}
1	خصم 20% على خدمة التنظيف	هذا العرض ساري حتى يوم الخميس ١٢ مايو	https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777217507854_1R_TEt8D1.jpg	\N	2026-04-26 14:23:28.936+00	2026-04-26 16:50:13.662+00	c264e47a-f655-4db5-af8d-f6b12058118d	شيف	home_chef	20	100	80	\N	\N	approved		t	{}
9	خصم			\N	2026-04-28 16:04:55.085+00	2026-04-28 16:05:30.496+00	ee2126c2-d675-441b-bc19-c96196e3db6b	ابو سعيد سوبر ماركت 	supermarket	\N	\N	\N	\N	\N	approved		t	{}
11	عرض خاص على منتجات التجميل		https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777483890382_tVFHB4EkL.jpg	\N	2026-04-29 17:31:33.269+00	2026-04-29 17:35:53.265+00	bbc5016a-00b6-4636-97c3-0ab630d65b63	كرم	pharmacy	30	210	140	\N	\N	approved		t	{}
4	خصم ٣٠ % على كل البلاي ستيشن	العرض ساري لمدة ٣ ايام	https://ik.imagekit.io/vzuah6tku/zayedid/misc/offer_1777229196815_1AtCMujB6.jpg	\N	2026-04-26 18:46:39.833+00	2026-04-29 19:35:30.851+00	2853336e-f393-4c4d-9d95-b7a17d4e2fb9	سوبر ماركت صن شاين	supermarket	20	100	80	\N	\N	approved		t	{}
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, user_id, merchant_id, driver_id, status, total_price, delivery_fee, address_text, location_lat, location_lng, payment_method, created_at, customer_name, customer_phone, merchant_name, merchant_phone, delivery_notes, order_notes, items, "customerPhone", "serviceName", "serviceType", "totalPrice", description, notes, image_urls, order_details, pickup_fee, has_pickup, pickup_address, driver_name, driver_phone, merchant_place, final_total, subtotal, voice_url, raw_text, updated_at, accepted_at, customer_address, service_name, service_type, delivered_at, cancelled_at, cancellation_reason, price_set_at, driver_assigned_at, delivery_started_at, is_guest, guest_phone, sub_service_id, parent_order_id) FROM stdin;
0f393bac-091d-49da-8902-a92659aa7d42	\N	\N	\N	pending	10	0	\N	\N	\N	cash_on_delivery	2026-06-11 20:52:03.986255+00	DEMO ACCOUNT	01222222222	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-11 20:52:03.986255+00	\N	123 Main Street, Apt 4B	مكوجي	dryclean	\N	\N	\N	\N	\N	\N	t	01222222222	\N	\N
95786014-57e5-46b7-9d1a-050040d6393f	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	115	50	\N	\N	\N	cash_on_delivery	2026-06-11 21:25:27.175028+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-11 21:25:51.924+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
792faec1-4a81-4fea-9523-0184d3cdb8d2	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	delivered	151	10	\N	\N	\N	cash_on_delivery	2026-06-11 21:25:28.456648+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-11 21:26:23.222+00	2026-06-11 21:25:45.373+00	H	سوبر ماركت	supermarket	2026-06-11 21:26:23.222	\N	\N	\N	\N	\N	f	\N	\N	\N
0d526bab-2c3d-4c9d-bf3c-4146a9c77f91	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	delivered	115	50	\N	\N	\N	cash_on_delivery	2026-06-11 21:27:27.771688+00	Sherif	+201033833119	الهواري	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-11 21:28:34.677+00	2026-06-11 21:27:39.562+00	H	سوبر ماركت	supermarket	2026-06-11 21:28:34.677	\N	\N	\N	\N	\N	f	\N	\N	\N
d650dcd3-2884-4269-ac6d-72d8a0cc11b1	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	151	10	\N	\N	\N	cash_on_delivery	2026-06-11 21:27:25.502565+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-11 21:28:42.339+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
ae5f489a-32ee-43a2-a328-f0b46f61b39e	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	115	50	\N	\N	\N	cash_on_delivery	2026-06-11 21:31:44.305919+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-11 21:32:01.33+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
3e8b2625-d078-4426-b6ed-fc7bc95efd6a	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	151	10	\N	\N	\N	cash_on_delivery	2026-06-11 21:31:47.30226+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-11 21:31:56.43+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
116d19e0-c2b4-4210-81ce-54b68c379055	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	115	50	\N	\N	\N	cash_on_delivery	2026-06-11 21:32:52.158798+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-11 21:32:52.158798+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
56764dff-4ec4-4933-abe1-9518bda1ac3a	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	151	10	\N	\N	\N	cash_on_delivery	2026-06-11 21:32:54.360398+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-11 21:32:54.360398+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
2d13c090-7d48-4db5-b3a7-0518f00ccba5	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	115	50	\N	\N	\N	cash_on_delivery	2026-06-11 21:33:42.180799+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-11 21:34:02.375+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
34297973-0bc2-4baf-b2d3-2132c5f06edd	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	151	10	\N	\N	\N	cash_on_delivery	2026-06-11 21:33:48.561858+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-11 21:33:58.716+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
9e811e0d-41b2-4f5b-ae0a-6193563eb835	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	230	50	\N	\N	\N	cash_on_delivery	2026-06-11 21:35:56.760758+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x2 = 120 ج", "لبن المراعي كامل الدسم 1 لتر x2 = 110 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	280	\N	\N	\N	2026-06-11 21:35:56.760758+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
de81cf10-c76e-4395-8433-762a4b8664f0	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	302	10	\N	\N	\N	cash_on_delivery	2026-06-11 21:35:58.002234+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x2 = 122 ج", "جبنة شيدر مطبوخ x2 = 180 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	312	\N	\N	\N	2026-06-11 21:35:58.002234+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
a9bf6902-3145-4192-87ee-8c1b6fd9cd22	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	230	50	\N	\N	\N	cash_on_delivery	2026-06-11 21:38:04.945797+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x2 = 120 ج", "لبن المراعي كامل الدسم 1 لتر x2 = 110 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	280	\N	\N	\N	2026-06-11 21:38:04.945797+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
231c46ac-b1e8-44a3-9dbe-25ad030ce328	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	302	10	\N	\N	\N	cash_on_delivery	2026-06-11 21:38:06.49286+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x2 = 122 ج", "جبنة شيدر مطبوخ x2 = 180 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	312	\N	\N	\N	2026-06-11 21:38:06.49286+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
94c82de1-8be4-4cc8-b6e8-d420f1ed99f3	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	230	50	\N	\N	\N	cash_on_delivery	2026-06-11 21:39:01.052763+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x2 = 120 ج", "لبن المراعي كامل الدسم 1 لتر x2 = 110 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	280	\N	\N	\N	2026-06-11 21:39:01.052763+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
90b56aed-fa60-46bf-ae4d-c058ee8afb04	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	302	10	\N	\N	\N	cash_on_delivery	2026-06-11 21:39:02.792467+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x2 = 122 ج", "جبنة شيدر مطبوخ x2 = 180 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	312	\N	\N	\N	2026-06-11 21:39:02.792467+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
37fd8ee7-6dbc-46cf-bf04-43b847cb9893	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	302	10	\N	\N	\N	cash_on_delivery	2026-06-11 21:42:47.432652+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x2 = 122 ج", "جبنة شيدر مطبوخ x2 = 180 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	312	\N	\N	\N	2026-06-11 21:44:05.461+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
1139a6da-51b2-4ae4-9810-f9a96308c556	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	230	50	\N	\N	\N	cash_on_delivery	2026-06-11 21:42:45.358636+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x2 = 120 ج", "لبن المراعي كامل الدسم 1 لتر x2 = 110 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	280	\N	\N	\N	2026-06-11 21:44:10.928+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
55279c88-af65-4f2a-9a83-fb02c6dd82cb	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	230	50	\N	\N	\N	cash_on_delivery	2026-06-11 21:44:14.578745+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x2 = 120 ج", "لبن المراعي كامل الدسم 1 لتر x2 = 110 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	280	\N	\N	\N	2026-06-11 21:44:14.578745+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
fbe49209-449a-43d6-a068-7bbf6030b614	6ea342e6-0e90-4009-95fe-53bf1d601498	\N	\N	cancelled	302	10	\N	\N	\N	cash_on_delivery	2026-06-11 21:44:16.100542+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x2 = 122 ج", "جبنة شيدر مطبوخ x2 = 180 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	312	\N	\N	\N	2026-06-11 21:44:16.100542+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
2e2f2d6a-068f-4fe6-b8eb-4e54fb7df8d6	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	delivered	60	50	\N	\N	\N	cash_on_delivery	2026-06-12 00:53:38.9879+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	110	\N	\N	\N	2026-06-12 00:54:23.865+00	\N	H	سوبر ماركت	supermarket	2026-06-12 00:54:23.865	\N	\N	\N	\N	\N	f	\N	\N	\N
3ac2fa15-22e6-4c5e-82ce-b8f286b5da75	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	delivered	90	10	\N	\N	\N	cash_on_delivery	2026-06-12 00:53:40.8621+00	Sherif	+201033833119	الهواري	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	100	\N	\N	\N	2026-06-12 00:55:11.72+00	\N	H	سوبر ماركت	supermarket	2026-06-12 00:55:11.72	\N	\N	\N	\N	\N	f	\N	\N	\N
8bdf9e9b-f805-4cf8-adeb-d9073e272655	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	546	10	\N	\N	\N	cash_on_delivery	2026-06-12 00:58:34.53043+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x6 = 366 ج", "جبنة شيدر مطبوخ x2 = 180 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	556	\N	\N	\N	2026-06-12 00:58:34.53043+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
6eca508f-3b24-4b9e-8ba2-2f91828ad3f7	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	450	50	\N	\N	\N	cash_on_delivery	2026-06-12 00:58:34.967907+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x2 = 120 ج", "لبن المراعي كامل الدسم 1 لتر x6 = 330 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	500	\N	\N	\N	2026-06-12 00:58:34.967907+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
c042dcff-21a7-4aa4-a751-b6590f1c8b52	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	delivered	273	10	\N	\N	\N	cash_on_delivery	2026-06-11 23:20:22.14643+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x3 = 183 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	283	\N	\N	\N	2026-06-12 00:50:54.884+00	\N	H	سوبر ماركت	supermarket	2026-06-12 00:50:54.884	\N	\N	\N	\N	\N	f	\N	\N	\N
de835c54-d06d-4bcc-ab8b-cf121e70ac81	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	546	10	\N	\N	\N	cash_on_delivery	2026-06-12 00:55:50.400314+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x6 = 366 ج", "جبنة شيدر مطبوخ x2 = 180 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	556	\N	\N	\N	2026-06-12 01:00:18.879+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
22921744-c00b-4481-9ab6-88b00fb1059e	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	450	50	\N	\N	\N	cash_on_delivery	2026-06-12 00:55:52.53817+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x2 = 120 ج", "لبن المراعي كامل الدسم 1 لتر x6 = 330 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	500	\N	\N	\N	2026-06-12 01:00:23.369+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
fa506a20-1d82-4016-a39a-5701c5f051c0	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	546	10	\N	\N	\N	cash_on_delivery	2026-06-12 00:57:00.854747+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x6 = 366 ج", "جبنة شيدر مطبوخ x2 = 180 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	556	\N	\N	\N	2026-06-12 01:00:27.475+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
0af6d730-891f-41b2-85eb-463dd0639721	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	delivered	212	10	\N	\N	\N	cash_on_delivery	2026-06-11 22:38:26.677194+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x2 = 122 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	222	\N	\N	\N	2026-06-12 00:51:13.28+00	2026-06-11 22:38:41.885+00	H	سوبر ماركت	supermarket	2026-06-12 00:51:13.28	\N	\N	\N	\N	\N	f	\N	\N	\N
588d6e73-4e61-45c1-8856-8a0533d206ec	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	450	50	\N	\N	\N	cash_on_delivery	2026-06-12 00:57:01.925436+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x2 = 120 ج", "لبن المراعي كامل الدسم 1 لتر x6 = 330 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	500	\N	\N	\N	2026-06-12 01:00:31.69+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
bd48aaaa-2712-40e5-a877-f2ba3e73da60	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	delivered	170	50	\N	\N	\N	cash_on_delivery	2026-06-11 22:38:25.378347+00	Sherif	+201033833119	الهواري	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x2 = 110 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	220	\N	\N	\N	2026-06-12 00:51:22.137+00	2026-06-11 22:38:55.305+00	H	سوبر ماركت	supermarket	2026-06-12 00:51:22.137	\N	\N	\N	\N	\N	f	\N	\N	\N
13c03fbf-9e08-4e8d-8bce-4a8cc58928cc	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	115	50	\N	\N	\N	cash_on_delivery	2026-06-12 01:00:49.145489+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-12 01:01:05.506+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
d3f10acf-1607-43dc-94fb-12ae2cecb5ea	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	delivered	115	50	\N	\N	\N	cash_on_delivery	2026-06-12 00:50:08.981976+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-12 00:53:05.667+00	\N	H	سوبر ماركت	supermarket	2026-06-12 00:53:05.667	\N	\N	\N	\N	\N	f	\N	\N	\N
0d7946c0-cf96-408e-aa7e-4b6e80e6a179	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	151	10	\N	\N	\N	cash_on_delivery	2026-06-12 01:00:50.040422+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-12 01:01:09.249+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
8af74e59-bcc9-4b8f-9cfd-fc33107c6809	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	delivered	225	50	\N	\N	\N	cash_on_delivery	2026-06-11 23:20:20.666924+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x3 = 165 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	275	\N	\N	\N	2026-06-12 00:53:20.812+00	\N	H	سوبر ماركت	supermarket	2026-06-12 00:53:20.812	\N	\N	\N	\N	\N	f	\N	\N	\N
5094587d-34fc-41a1-b80d-d96ce484ea53	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	115	50	\N	\N	\N	cash_on_delivery	2026-06-12 01:05:26.574173+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-12 01:05:49.952+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
5f6107e3-a24d-485f-8bfc-c0d212a931a6	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	151	10	\N	\N	\N	cash_on_delivery	2026-06-12 01:05:27.542948+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-12 01:05:54.06+00	\N	H	سوبر ماركت	supermarket	\N	\N	H	\N	\N	\N	f	\N	\N	\N
bef1bb3d-18b5-4a44-a51d-7efb33a9466a	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	pending	115	50	\N	\N	\N	cash_on_delivery	2026-06-12 01:08:59.060236+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-12 01:08:59.060236+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
7eb82efc-da8c-4d58-882d-b4c3bc275773	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	pending	151	10	\N	\N	\N	cash_on_delivery	2026-06-12 01:13:11.414424+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-12 01:13:11.414424+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
16bcc32f-9fc0-4989-99d6-e5471779db64	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	pending	115	50	\N	\N	\N	cash_on_delivery	2026-06-12 01:13:12.192636+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-12 01:13:12.192636+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
02181930-88e7-4e5c-b22c-72036e6fdeaa	\N	\N	\N	pending	10	0	\N	\N	\N	cash_on_delivery	2026-06-12 02:18:45.587629+00	DEMO ACCOUNT	01222222222	\N	\N	\N	\N	["بنطلون (كي فقط) x1 = 10ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-12 02:18:45.587629+00	\N	123 Main Street, Apt 4B	مكوجي	dryclean	\N	\N	\N	\N	\N	\N	t	01222222222	\N	\N
9246dadf-8a69-464c-b608-698972e5feec	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	accepted	151	10	\N	\N	\N	cash_on_delivery	2026-06-12 01:09:00.21455+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-12 01:09:00.21455+00	2026-06-12 01:45:45.322771+00	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
6d00a49e-23e2-4128-8fe4-c5a795b5817c	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	delivered	60	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:18:13.460038+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["لبن جهينة كامل الدسم 1 لتر x1"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	70	\N	\N	\N	2026-06-12 02:20:58.939+00	2026-06-12 02:20:24.839+00	H	الخدمة	supermarket	2026-06-12 02:20:58.939	\N	\N	\N	\N	\N	f	\N	\N	\N
f4fba594-7b4f-44a1-ab7e-dcd2d74f94fe	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	115	50	\N	\N	\N	cash_on_delivery	2026-06-12 02:21:15.422059+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-12 02:21:15.422059+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
303949df-5e8a-4956-9c92-3bb6ec25a7a4	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	151	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:21:17.768529+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-12 02:21:17.768529+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
a4e78800-fadb-4c47-ae2c-82825de7e172	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	115	50	\N	\N	\N	cash_on_delivery	2026-06-12 02:21:37.712477+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-12 02:21:37.712477+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
151abfd7-5222-4c51-97b4-dfb948aac8b8	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	151	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:21:39.502127+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-12 02:21:39.502127+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
653e941e-b3f7-45fd-8228-53c8466bc210	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	115	50	\N	\N	\N	cash_on_delivery	2026-06-12 02:23:13.465792+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-12 02:23:13.465792+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
1c1b1fc3-0a17-425d-86f0-455e9194f609	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	151	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:23:15.879145+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-12 02:23:15.879145+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
06c8b24a-6802-45e9-9c35-b5ce89f20609	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	60	50	\N	\N	\N	cash_on_delivery	2026-06-12 02:24:19.530322+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	110	\N	\N	\N	2026-06-12 02:24:19.530322+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
664c65d1-f0aa-46ee-b4b0-52e6bf384be7	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	90	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:24:21.549165+00	Sherif	+201033833119	الهواري	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	100	\N	\N	\N	2026-06-12 02:24:21.549165+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
47b66eef-b537-4091-8186-bb35859f31d3	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	60	50	\N	\N	\N	cash_on_delivery	2026-06-12 02:24:57.101118+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	110	\N	\N	\N	2026-06-12 02:24:57.101118+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
1e3dbe83-3074-4299-b469-5b16240cf4e9	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	90	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:24:59.085059+00	Sherif	+201033833119	الهواري	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	100	\N	\N	\N	2026-06-12 02:24:59.085059+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
4364e569-ff44-4c9d-b1e7-29db640ef3be	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	60	50	\N	\N	\N	cash_on_delivery	2026-06-12 02:26:46.94517+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	110	\N	\N	\N	2026-06-12 02:26:46.94517+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
2d7966e2-4316-4f6d-a529-3df2334bdcec	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	90	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:26:49.024871+00	Sherif	+201033833119	الهواري	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	100	\N	\N	\N	2026-06-12 02:26:49.024871+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
94749455-5234-4034-8ce3-05690519173b	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	pending	60	50	\N	\N	\N	cash_on_delivery	2026-06-12 02:28:17.269334+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	110	\N	\N	\N	2026-06-12 02:28:17.269334+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
22e1cdb3-9fbb-4df8-93cd-7aa96f6d3862	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	pending	90	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:29:28.189502+00	Sherif	+201033833119	الهواري	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	100	\N	\N	\N	2026-06-12 02:29:28.189502+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
def9ee6d-004f-48a0-8830-f96e74470a1d	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	55	50	\N	\N	\N	cash_on_delivery	2026-06-12 02:29:51.291903+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	105	\N	\N	\N	2026-06-12 02:29:51.291903+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
0391d2e8-9bdb-4090-947a-d9353a63fd35	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	61	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:29:53.377928+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	71	\N	\N	\N	2026-06-12 02:29:53.377928+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
0015c003-62a5-451f-a24b-f7777737122a	6ea342e6-0e90-4009-95fe-53bf1d601498	d87ca828-707e-485b-a81a-0428102f5ab4	\N	cancelled	69	60	\N	\N	\N	cash_on_delivery	2026-06-12 02:29:55.061818+00	Sherif	+201033833119	مترو ماركت	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 69 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	129	\N	\N	\N	2026-06-12 02:29:55.061818+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
a877761b-f57e-4303-aa6c-a96157288846	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	55	50	\N	\N	\N	cash_on_delivery	2026-06-12 02:30:24.74298+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	105	\N	\N	\N	2026-06-12 02:30:24.74298+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
fea00057-1bf1-43bd-b11f-3cd09db180e6	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	61	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:30:27.187749+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	71	\N	\N	\N	2026-06-12 02:30:27.187749+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
6cfb68e1-6085-44fa-a375-fe539d5baf12	6ea342e6-0e90-4009-95fe-53bf1d601498	d87ca828-707e-485b-a81a-0428102f5ab4	\N	cancelled	69	60	\N	\N	\N	cash_on_delivery	2026-06-12 02:30:28.842372+00	Sherif	+201033833119	مترو ماركت	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 69 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	129	\N	\N	\N	2026-06-12 02:30:28.842372+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
c00d2404-6aae-41e5-a462-d4b40de9e2af	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	accepted	150	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:53:06.153826+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["زيت زيتون بكر x1"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	160	\N	\N	\N	2026-06-12 02:53:16.191+00	2026-06-12 02:53:16.191+00	H	الخدمة	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
8c169a32-db84-49fc-8db4-681efb923c8e	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	accepted	25	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:44:43.937561+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["مكرونة إسباجيتي x1"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	35	\N	\N	\N	2026-06-12 02:53:18.63+00	2026-06-12 02:53:18.63+00	H	الخدمة	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
e268c8df-00b4-4600-94c3-70a66dd88f7a	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	pending	55	50	\N	\N	\N	cash_on_delivery	2026-06-12 02:53:30.758061+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	105	\N	\N	\N	2026-06-12 02:53:30.758061+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
8065ec47-27cd-4cce-808a-7a63863af502	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	pending	61	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:53:33.540892+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	71	\N	\N	\N	2026-06-12 02:53:33.540892+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
8a566bc7-b7ce-481b-b3fc-9ec7bc7bb025	6ea342e6-0e90-4009-95fe-53bf1d601498	d87ca828-707e-485b-a81a-0428102f5ab4	\N	pending	69	60	\N	\N	\N	cash_on_delivery	2026-06-12 02:53:35.644858+00	Sherif	+201033833119	مترو ماركت	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 69 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	129	\N	\N	\N	2026-06-12 02:53:35.644858+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
ef0197f3-7312-49a7-b41d-cc58f884a13b	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	pending	55	50	\N	\N	\N	cash_on_delivery	2026-06-12 02:55:02.373436+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	105	\N	\N	\N	2026-06-12 02:55:02.373436+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
88055785-9876-4ad5-a651-412cdbe32205	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	pending	61	10	\N	\N	\N	cash_on_delivery	2026-06-12 02:55:04.941117+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	71	\N	\N	\N	2026-06-12 02:55:04.941117+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
75eab601-109e-49d8-8524-975d10a3955e	6ea342e6-0e90-4009-95fe-53bf1d601498	d87ca828-707e-485b-a81a-0428102f5ab4	\N	pending	69	60	\N	\N	\N	cash_on_delivery	2026-06-12 02:55:06.561447+00	Sherif	+201033833119	مترو ماركت	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 69 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	129	\N	\N	\N	2026-06-12 02:55:06.561447+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
e9f69bb3-b89a-4717-b413-807276cd44e6	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	pending	115	50	\N	\N	\N	cash_on_delivery	2026-06-12 11:13:49.960117+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-12 11:13:49.960117+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
e9333811-6cdd-4a02-8ad0-2349b4e38669	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	pending	151	10	\N	\N	\N	cash_on_delivery	2026-06-12 11:13:52.1422+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-12 11:13:52.1422+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
b7e81fd3-2416-413e-b584-66d9e97af865	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	pending	115	50	\N	\N	\N	cash_on_delivery	2026-06-12 11:16:23.459936+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-12 11:16:23.459936+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
e6d0c8d2-70d8-45be-a75b-e5e66e5efdc5	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	pending	151	10	\N	\N	\N	cash_on_delivery	2026-06-12 11:16:25.710278+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-12 11:16:25.710278+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
fe1809c2-c5e6-424f-b838-039b26206a7f	\N	\N	\N	pending	20	0	\N	\N	\N	cash_on_delivery	2026-06-12 11:17:23.075973+00	DEMO ACCOUNT	01222222222	\N	\N	\N	\N	["بنطلون (كي وتنظيف) x1 = 20ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	0	\N	\N	\N	2026-06-12 11:17:23.075973+00	\N	Demo Address 123	مكوجي	dryclean	\N	\N	\N	\N	\N	\N	t	01222222222	\N	\N
ee3e271f-9ece-4e07-a405-c15c4e0bb18a	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	115	50	\N	\N	\N	cash_on_delivery	2026-06-12 11:17:30.948459+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-12 11:17:30.948459+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
30c7d8dc-2b76-4058-aa87-3c485f55a2b5	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	151	10	\N	\N	\N	cash_on_delivery	2026-06-12 11:17:33.390551+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-12 11:17:33.390551+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
2c03bab0-a9a8-42e0-82fd-e806aaeb6e1b	6ea342e6-0e90-4009-95fe-53bf1d601498	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	\N	cancelled	115	50	\N	\N	\N	cash_on_delivery	2026-06-12 11:18:34.232401+00	Sherif	+201033833119	صن شاين	\N	\N	\N	["جبنة شيدر مطبوخ x1 = 60 ج", "لبن المراعي كامل الدسم 1 لتر x1 = 55 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	165	\N	\N	\N	2026-06-12 11:18:34.232401+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
75623f0c-5ee6-42b1-8a34-188b267b6a69	6ea342e6-0e90-4009-95fe-53bf1d601498	14c34717-0a25-4ed8-ad1b-df970d18b4dc	\N	cancelled	151	10	\N	\N	\N	cash_on_delivery	2026-06-12 11:18:36.951829+00	Sherif	+201033833119	الهواري	\N	\N	\N	["لبن المراعي كامل الدسم 1 لتر x1 = 61 ج", "جبنة شيدر مطبوخ x1 = 90 ج"]	\N	\N	\N	\N	\N		[]	{}	0	f	\N	\N	\N	\N	161	\N	\N	\N	2026-06-12 11:18:36.951829+00	\N	H	سوبر ماركت	supermarket	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: otp_codes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.otp_codes (id, phone, code, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: -
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
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_categories (id, service_id, name, image_url, icon, sort_order, is_active, created_at, updated_at, name_en) FROM stdin;
b04665f3-c38e-42a8-9d44-4cf922762e2f	eshop	مطبخ	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1779611143374_WfxFIdtFl.jpg	folder-outline	0	t	2026-05-24 08:25:48.274+00	2026-05-24 08:25:48.273+00	\N
f27e5b90-1271-4388-b590-48d1e31e9c46	supermarket	بقوليات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777994005104_C_VhC6MGh.jpg	sparkles	5	t	2026-05-05 15:13:42.115+00	2026-05-05 15:13:42.115+00	\N
b61c9f58-b24a-464e-9d71-c9a3594f8581	\N	عروض خاصة	\N	cube	1	t	2026-05-23 19:15:05.467325+00	2026-05-23 19:15:05.467325+00	\N
579769b6-ba5d-4444-930e-57f872ee3b84	\N	إلكترونيات	\N	cube	2	t	2026-05-23 19:15:05.467325+00	2026-05-23 19:15:05.467325+00	\N
426246e8-2b7d-486d-8795-e2daf585f227	\N	ملابس	\N	cube	3	t	2026-05-23 19:15:05.467325+00	2026-05-23 19:15:05.467325+00	\N
44a48f6b-117e-4343-9ebe-b7d2f7b4cdb0	\N	عطور	\N	cube	5	t	2026-05-23 19:15:05.467325+00	2026-05-23 19:15:05.467325+00	\N
a26a2604-be2d-4a32-bc8e-b7a9060d1c08	supermarket	خضروات وفاكهة	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777839948879_dqEXH76SB.jpg	nutrition	0	t	2026-05-03 19:27:30.528+00	2026-05-03 20:26:01.475+00	\N
9fba4007-e0d4-4844-9e59-ed44bb3f357d	supermarket	ألبان	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777840046757_0DgryzXCV.jpg	archive	0	t	2026-05-03 19:17:06.401+00	2026-05-03 20:27:31.528+00	\N
ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d	supermarket	أجبان	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777840187535_ddn6Re3nb.jpg	pizza	0	t	2026-05-03 19:46:00.72+00	2026-05-03 20:29:51.498+00	\N
93c4c6f1-045b-4882-83f9-6136de6dad11	supermarket	مشروبات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777840225081_Z0MwJ_E8i.jpg	cafe	0	t	2026-05-03 18:01:07.192+00	2026-05-03 20:30:30.902+00	\N
d01a5c53-917b-43ec-84e2-f41cddee4982	supermarket	معلبات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777994122090_YbNlb3I65.jpg	cube	0	t	2026-05-05 15:15:24.637+00	2026-05-05 15:15:24.637+00	\N
fd3a39da-93bc-49f0-99f9-67ae6342566b	home_chef	مشويات	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778078078772_9dilA4JbL.jpg	cube	0	t	2026-05-06 14:34:43.786+00	2026-05-06 14:34:43.786+00	\N
ab2ad873-479a-4752-aab0-6bb08502308e	home_chef	أطباق رئيسية	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778091146280_dveKN6HQ07.jpg	cube	0	t	2026-05-06 18:12:33.868+00	2026-05-06 18:12:33.868+00	\N
cd368d5a-60cb-41a5-9f8d-5aae9b4c8c93	eshop	هدايا 🎁		cube	0	t	2026-05-23 18:11:55.505+00	2026-05-23 18:11:55.505+00	\N
98abe6f0-ea4f-446d-94fd-0f7e17e71ce5	\N	رياضة	\N	cube	7	t	2026-05-23 19:21:11.845845+00	2026-05-23 19:21:11.845845+00	\N
c1b7c70c-dfff-451e-9e0c-2ae3b9e9aed7	eshop	اكسسوارات		folder-outline	3	t	2026-06-11 15:13:41.732+00	2026-06-11 15:13:41.73+00	\N
\.


--
-- Data for Name: product_variants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_variants (id, product_id, name, price, display_order, created_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, name, description, price, image_url, category, service_id, merchant_id, is_available, created_at, status, rejection_reason, merchant_name, is_template, updated_at, rejectionreason, video_url, merchant_type, service_name, category_id) FROM stdin;
6afc2fbe-8135-41d1-b4d9-06125fff27ed	لبن جهينة ١ لتر	كامل الدسم	45		\N	products	\N	t	2026-03-23 18:29:45.67+00	approved	\N		t	2026-03-23 18:36:03.486	\N	\N	\N	\N	\N
fc028f2b-0209-4def-a14a-d8895e9baae4	لبن جهينة ١ لتر		45	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774291619630_6f04RoFvE.jpg	\N	products	\N	t	2026-03-23 18:47:03.019+00	approved	\N		t	2026-03-23 18:47:34.483	\N	\N	\N	\N	\N
1de51e36-4a5a-4e98-90c4-73dce59d3c7d	مكرونة بشاميل	مكرونة بشاميل باللحمة المفرومة	120	\N	\N	home_chef	\N	t	2026-05-17 05:04:06.853468+00	approved	\N	\N	f	\N	\N	\N	\N	\N	\N
910d426d-daa9-45d0-af70-1250e7a66712	كفتة أرز	كفتة أرز على الطريقة المصرية	150	\N	\N	home_chef	\N	t	2026-05-17 05:04:06.853468+00	approved	\N	\N	f	\N	\N	\N	\N	\N	\N
7c9f2e39-5f8b-4488-bb59-f92719aa6d5a	محشي ورق عنب	محشي ورق عنب بالزيت والليمون	100	\N	\N	home_chef	\N	t	2026-05-17 05:04:06.853468+00	approved	\N	\N	f	\N	\N	\N	\N	\N	\N
7094ffac-310f-4b42-b2f7-b4bc113985af	فراخ محمرة	فراخ محمرة مع الأرز الأبيض	180	\N	\N	home_chef	\N	t	2026-05-17 05:04:06.853468+00	approved	\N	\N	f	\N	\N	\N	\N	\N	\N
86cb187a-cf43-4bc7-ab02-55c9a897a0fe	سمك فيليه	سمك فيليه مقلي مع بطاطس	200	\N	\N	home_chef	\N	t	2026-05-17 05:04:06.853468+00	approved	\N	\N	f	\N	\N	\N	\N	\N	\N
ab3b2735-0957-49d0-801c-e3b47ec1b947	أرز معمر	أرز معمر باللبن والدجاج	80	\N	\N	home_chef	\N	t	2026-05-17 05:04:06.853468+00	approved	\N	\N	f	\N	\N	\N	\N	\N	\N
31557ec2-d1bb-4d08-be19-67fc73b6f069	بسبوسه	بسبوسه بلدي طريه	60	\N	\N	supermarket	\N	t	2026-05-17 04:45:12.342245+00	approved	\N	\N	f	\N	\N	\N	\N	\N	\N
fba4ca0d-4fe6-4639-8e61-162bc74f34ff	جبنه بيضاء	جبنه بيضاء طريه 500جم	45	\N	\N	supermarket	\N	t	2026-05-17 04:45:12.342245+00	approved	\N	\N	f	\N	\N	\N	\N	\N	\N
038f345d-9281-4312-9199-b1212856b5f9	زبادي	زبادي بلدي	12	\N	\N	supermarket	\N	t	2026-05-17 04:45:12.342245+00	approved	\N	\N	f	\N	\N	\N	\N	\N	\N
55227c53-bfec-4805-a616-1a6e0557e22d	سمنه بلدي	سمنه بلدي أصلي	120	\N	\N	supermarket	\N	t	2026-05-17 04:45:12.342245+00	approved	\N	\N	f	\N	\N	\N	\N	\N	\N
3f33ff13-b7f2-4cf7-b087-7630db05c8f2	رز بسمتي	رز بسمتي فاخر 5كجم	85	\N	\N	supermarket	\N	t	2026-05-17 04:45:12.342245+00	approved	\N	\N	f	\N	\N	\N	\N	\N	\N
1c1e5f6f-5b54-43b7-b93b-42acd0ae4770	زيت زيتون	زيت زيتون بكر 1لتر	95	\N	\N	supermarket	\N	t	2026-05-17 04:45:12.342245+00	approved	\N	\N	f	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.profiles (id, full_name, phone, password, role, active, place_id, place_name, is_available, location_lat, location_lng, created_at, updated_at, name, service_area, max_delivery_radius, health_cert_url, merchant_type, is_verified, verification_image, verification_status, rejection_reason, business_license_url, profile_completed, terms_accepted, terms_accepted_at, delivery_fee, delivery_time, avatar_url, average_rating, reviews_count, address, portfolio_images, bio, avg_rating, service_category, bio_approved, portfolio_approved, image_url, delivery_radius, specialties, expo_push_token, commercial_register, tax_card, image_approved, admin_level, image_url_pending, documents, documents_approved, region_id, email, firebase_uid) FROM stdin;
37ba1613-bec4-4cae-b36f-bfa93c07428c	يوسف ال (owner)	01500000000	015	admin	t	\N	\N	t	\N	\N	2026-05-09 19:11:58.205+00	2026-05-09 19:11:58.205+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	super	\N	[]	f	\N	\N	\N
00000000-0000-0000-0000-000000000000	Master Admin	0000000000	Admin135792	admin	t	\N	\N	t	\N	\N	2026-05-05 08:32:24.357454+00	2026-05-05 08:32:24.357454+00	\N	\N	10	\N	\N	t	\N	\N	\N	\N	f	f	\N	0	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	super	\N	[]	f	\N	\N	\N
c0c6ab33-4b2b-4fc8-a212-25460256d179	Master Admin	+201000000000	Admin135792	admin	t	\N	\N	t	\N	\N	2026-06-10 10:42:23.082835+00	2026-06-10 10:42:23.082835+00	\N	\N	10	\N	\N	t	\N	\N	\N	\N	f	f	\N	0	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	super	\N	[]	f	\N	\N	\N
ddf6af56-4979-46a5-a977-f01ce6ebaeec	Thomas Cook Tours	+201000000001	1234	merchant	t	\N		t	\N	\N	2026-05-05 08:34:21.635+00	2026-06-10 10:53:08.731708+00	\N		10	\N	travel	t	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0		{}	نص 2	0	products	t	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/thomas_cook_tours/profile/profile_1778014659036_yMNxJaxtH.jpg	10	{}	\N	\N	\N	t	\N	\N	[{"url": "https://ik.imagekit.io/vzuah6tku/zayedid/users/merchant/misc/doc_1778052887240_pE9waGRPU.jpg", "approved": true}, {"url": "https://ik.imagekit.io/vzuah6tku/zayedid/users/merchant/misc/doc_1778054206966_1kXq2bJYp.jpg", "approved": true}]	t	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
cb273744-cf70-486d-b6e1-8c1c4932b140	مكوجي	+201099999999	1234	merchant	t	\N		t	\N	\N	2026-05-07 15:20:21.472+00	2026-06-10 10:53:34.582198+00	\N	\N	10	\N	dryclean	t	\N	\N	\N	\N	f	f	\N	40	30	\N	0	0	\N	{}	\N	0	products	f	f		10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
a4663b5a-07e9-49cd-b3b1-8af587f75056	نورهان	+201009676888	Notme@2610	customer	t	\N	\N	t	\N	\N	2026-05-09 17:15:00.286+00	2026-06-10 10:53:52.208656+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	t	f	\N	0	30	\N	0	0	\N	{}	\N	0	products	f	f		10	{}	\N	\N	\N	t	basic	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
2233c2bb-3588-4034-9813-9e4419dfc67b	Karim	+201011223345	1234	customer	t	\N	\N	t	\N	\N	2026-05-13 15:20:50.172+00	2026-06-10 10:54:42.040287+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	t	f	\N	0	30	\N	0	0	\N	{}	\N	0	products	f	f		10	{}	\N	\N	\N	t	basic	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
1dae6ea9-580d-43ef-b657-4d398b4b4f44	الشيف	+20100001234	1234	merchant	t	\N		t	\N	\N	2026-05-14 13:27:18.968+00	2026-06-10 10:54:51.322246+00	\N	\N	10	\N	home_chef	t	\N	\N	\N	\N	f	f	\N	50	30	\N	0	0	\N	{}	\N	0	products	f	f		10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
d87ca828-707e-485b-a81a-0428102f5ab4	مترو ماركت	+201033333333	1234	merchant	t	\N		t	\N	\N	2026-05-17 06:16:10.086+00	2026-06-10 10:55:39.833644+00	\N	\N	10	\N	supermarket	t	\N	\N	\N	\N	f	f	\N	60	30	\N	0	0	\N	{}	\N	0	products	f	f		10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
bd6c8ff5-8fc7-4994-aee2-d36e2477ee0f	يوسف شريف	+201557859221	123456	customer	t	\N	\N	t	\N	\N	2026-06-10 18:10:05.219+00	2026-06-10 18:10:19.077+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0	\N	{}	\N	0	products	f	f		10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	\N
cd392e2f-7c36-41e6-b98f-e81ffc3dc013	صن شاين	+201011111111	1234	merchant	t	\N		t	\N	\N	2026-05-05 11:00:36.759+00	2026-06-10 17:50:00.697+00	\N		10	\N	supermarket	t	\N	\N	\N	\N	f	f	\N	50	30	\N	0	5		\N	نص طويل	4.2	products	t	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/صن_شاين/misc/merchant_cd392e2f-7c36-41e6-b98f-e81ffc3dc013_1778001793590_NTF-0X7C8.jpg	10	{}	\N	\N	\N	t	\N	\N	[]	t	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c		\N
0cfcd8af-7db0-45f8-a0fa-6867a6b2bb01	مندوب	+201044444444	1234	driver	t	\N	\N	t	\N	\N	2026-06-10 17:53:10.375+00	2026-06-10 22:38:25.579+00	\N		10	\N	\N	f	\N	\N	\N	\N	f	f	\N	10	30	\N	0	0		{}		0	products	f	f	\N	10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c		\N
6ea342e6-0e90-4009-95fe-53bf1d601498	Sherif	+201033833119	1234567	customer	t	\N	\N	t	\N	\N	2026-06-11 21:13:16.197+00	2026-06-11 21:13:16.197+00	\N	\N	10	\N	\N	f	\N	\N	\N	\N	t	f	\N	0	30	\N	0	0	\N	{}	\N	0	products	f	f	\N	10	{}	\N	\N	\N	t	basic	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	\N	SSJfiZW13MSAofqSCqVR68GD4hO2
14c34717-0a25-4ed8-ad1b-df970d18b4dc	الهواري	+201022222222	1234	merchant	t	\N		t	\N	\N	2026-05-12 14:01:09.224+00	2026-06-12 00:52:08.999+00	\N		10	\N	supermarket	t	\N	\N	\N	\N	f	f	\N	90	30	\N	0	4		{}		3.75	products	f	f	\N	10	{}	\N	\N	\N	t	\N	\N	[]	f	0fea41fd-a310-4e0d-a9bb-8fb9d422a70c		\N
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.regions (id, name, is_active, created_at, updated_at) FROM stdin;
0fea41fd-a310-4e0d-a9bb-8fb9d422a70c	الشيخ زايد	t	2026-05-07 07:28:20.107397+00	2026-05-07 09:31:29.965+00
42b30679-30d7-4f82-9cfe-7d39bd75f56c	المهندسين	t	2026-05-07 10:36:33.970634+00	2026-05-07 17:14:02.403+00
6db0b80f-a8c1-4efb-9d18-2be53526642f	الدقي	t	2026-05-07 17:17:12.138685+00	2026-05-07 17:17:12.138685+00
1b63390a-4789-4c2b-854e-f059eb096c90	التجمع الخامس	t	2026-05-07 17:14:27.202846+00	2026-05-09 18:56:22.641+00
6e175f78-42eb-4906-93e8-19200b22525d	اكتوبر	t	2026-05-07 17:15:57.792648+00	2026-05-09 18:56:26.139+00
96d5bf5c-70ce-4715-8949-7be4aa1a5ee9	الرحاب	t	2026-05-07 17:17:51.647925+00	2026-05-09 18:56:29.024+00
e8db1e62-8b94-4c0a-b2a4-3954b6f45a9e	الزمالك	t	2026-05-07 17:14:41.679744+00	2026-05-09 18:56:31.719+00
1b7428ed-5919-41aa-8b71-b70fc7991e7a	السيدة زينب	t	2026-05-07 17:19:04.921219+00	2026-05-09 18:56:34.734+00
35cf5a48-f256-4b7d-a653-19684fab58e9	الشروق	t	2026-05-07 17:17:57.578747+00	2026-05-09 18:56:37.204+00
96b031e7-22b9-4991-a023-170165530542	العاصمة الادارية	t	2026-05-07 17:18:15.059245+00	2026-05-09 18:56:40.963+00
d55386fd-14dd-4527-ac1a-8aa494b23b1f	المعادي	t	2026-05-07 17:14:35.035925+00	2026-05-09 18:56:44.045+00
be2e2775-511b-40ef-a6f9-bfa81c0dad05	المقطم	t	2026-05-07 17:19:42.944058+00	2026-05-09 18:56:47.092+00
0ed0e7d6-cd6b-4a78-b152-1622d80af5e4	الهرم	t	2026-05-07 17:19:51.296774+00	2026-05-09 18:56:50.92+00
0c8a6397-504c-4437-9fed-49ffa1ac43b9	حدائق الاهرام	t	2026-05-07 17:16:11.450249+00	2026-05-09 18:56:54.008+00
fc55c479-ffb7-4844-8953-befcb5db8be6	شبرا الخيمة	t	2026-05-07 17:18:54.96978+00	2026-05-09 18:56:56.672+00
8ae2c9f2-f070-4991-b4b9-0150ac0dad84	فيصل	t	2026-05-07 17:19:56.206854+00	2026-05-09 18:56:59.253+00
cc1c26c0-1582-4679-b8a4-ad2b4ba5c785	مدينتي	t	2026-05-07 17:18:03.12983+00	2026-05-09 18:57:02.971+00
6697b521-8182-4515-9243-64c071fa7843	مصر الجديدة	t	2026-05-07 17:14:17.168816+00	2026-05-09 18:57:05.491+00
8a0c827d-0dcf-4b7f-9985-ec1e11cbee95	وسط البلد	t	2026-05-07 17:17:05.92152+00	2026-05-09 18:57:07.573+00
\.


--
-- Data for Name: rest2_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rest2_items (id, name, image_url, category, created_at, is_active, description, service_id, prices, updated_at) FROM stdin;
\.


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.restaurants (id, name, image_url, rating, delivery_time, is_active, created_at) FROM stdin;
1	مطعم البركة	https://via.placeholder.com/150	4.8	30-40 min	t	2026-03-17 19:26:05.904347+00
2	بيتزا كوين	https://via.placeholder.com/150	4.5	20-30 min	t	2026-03-17 19:26:05.904347+00
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: -
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
26	d8cfd26e-7897-47d9-9ab4-ef5dc98107ae	\N	14c34717-0a25-4ed8-ad1b-df970d18b4dc	5	\N	2026-06-10 22:26:03.49
27	a5d3ef94-188f-400a-bf50-549e322a091d	\N	14c34717-0a25-4ed8-ad1b-df970d18b4dc	5	\N	2026-06-10 22:35:03.914
28	9d144d88-8585-4ebd-b07d-b383ef19710f	\N	14c34717-0a25-4ed8-ad1b-df970d18b4dc	3	\N	2026-06-10 22:59:05.346
29	792faec1-4a81-4fea-9523-0184d3cdb8d2	\N	14c34717-0a25-4ed8-ad1b-df970d18b4dc	2	\N	2026-06-11 21:26:35.065
\.


--
-- Data for Name: service_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.service_categories (id, name, name_en, icon, image_url, sort_order, is_active, created_at, updated_at) FROM stdin;
9dd97e2c-c59c-400a-b18f-7d130c589db6	Express	\N	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1779582916363_LqIClXfhk.jpg	1	t	2026-05-23 23:22:22.010237+00	2026-05-24 06:55:46.997+00
7d63ae2a-4a96-4ce7-b814-07fe0108e384	Pro	\N	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1779582850937_2_53FgUrG.jpg	3	t	2026-05-23 23:22:22.010237+00	2026-05-24 07:05:49.697+00
34387693-1971-4156-8b87-c65306ef3074	Other	\N	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1779582936343_iKbWiZwtO.jpg	2	t	2026-05-23 23:22:22.010237+00	2026-05-24 07:05:54.197+00
\.


--
-- Data for Name: service_fields; Type: TABLE DATA; Schema: public; Owner: -
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
-- Data for Name: service_fields_new; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.service_fields_new (id, sub_service_id, field_name, field_label, field_type, field_options, is_required, placeholder, help_text, sort_order, created_at, updated_at, show_when_field, show_when_value) FROM stdin;
d5ad1546-f5b6-41fe-af02-5be796b2a489	\N	return_date	تاريخ العودة	date	{}	t	\N	\N	10	2026-04-30 18:21:27.699956+00	2026-04-30 18:21:27.699956+00	trip_type	ذهاب وعودة
4401c75f-3728-4d88-bc77-9afd2343aeaf	\N	multi_city_1	الوجهة الأولى	text	{}	t	\N	\N	11	2026-04-30 18:21:27.699956+00	2026-04-30 18:21:27.699956+00	trip_type	وجهات متعددة
31d4572a-9003-4547-b6f1-f116fbc3933b	\N	multi_city_2	الوجهة الثانية	text	{}	t	\N	\N	12	2026-04-30 18:21:27.699956+00	2026-04-30 18:21:27.699956+00	trip_type	وجهات متعددة
ec41df84-cc20-4f44-836f-c4d8bccc4238	\N	multi_city_3	الوجهة الثالثة	text	{}	f	\N	\N	13	2026-04-30 18:21:27.699956+00	2026-04-30 18:21:27.699956+00	trip_type	وجهات متعددة
\.


--
-- Data for Name: service_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.service_items (id, service_id, name, image_url, prices, is_active, created_at, updated_at, item_sub_services, category, options, price, variant_prices) FROM stdin;
db94d552-7d4f-495e-abb0-000554c172c4	laundry	بنطلون	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777118054753_5TqwJfabJ.jpg	\N	t	2026-04-25 11:54:36.267413+00	2026-04-25 11:54:36.267413+00	\N	عام	[]	0	{"كي فقط": 10, "كي وتنظيف": 15}
56307f8e-218c-4098-a1b7-b4b9bef7508d	bakery	كرواسون	https://via.placeholder.com/200	\N	t	2026-04-24 23:39:06.936607+00	2026-04-24 23:39:06.936607+00	\N	كرواسون	[]	7	{"وسط": 35}
93e89e46-767f-46a9-b3da-9558a2b8b95a	dryclean	بنطلون	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777160941381_FvDJ2VOxF.jpg	\N	t	2026-04-25 14:45:56.527471+00	2026-04-25 14:45:56.527471+00	\N	عام	[]	0	{"كي فقط": 10, "كي وتنظيف": 20}
bc3f8b06-883d-4400-b526-a4ceb31c5657	laundryshop	بنطلون	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777084334511_2aTrI8VGo.jpg	\N	t	2026-04-25 02:32:26.789451+00	2026-04-25 02:32:26.789451+00	\N	عام	[]	0	{"كي فقط": 30, "كي وتنظيف": 35}
7fbbd7d7-dbfa-4465-a291-61de5a4155e4	sone	قميص	\N	\N	t	2026-05-15 06:16:28.607282+00	2026-05-15 06:16:28.607282+00	\N	عام	[]	0	{"صنف ١": 10, "صنف ٢": 20}
376f6c73-3a0c-49d9-882f-277b12279747	bakery	فينو	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777074077039_JLiB0DZh3.jpg	\N	t	2026-04-24 23:41:27.370057+00	2026-04-24 23:41:27.370057+00	\N	صغير	[]	35	{"وسط": 8, "كبير": 10}
\.


--
-- Data for Name: service_tracking_steps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.service_tracking_steps (id, service_id, step_key, label, icon, sort_order, is_active, created_at, updated_at, image_url, attachment_url, description) FROM stdin;
54c3bcd0-1e53-4041-abc6-eb289b590cfc	travel	ready	جاهز	time-outline	4	t	2026-05-05 09:07:33.503866+00	2026-05-05 09:07:33.503866+00	\N	\N	\N
85f756b7-8f3d-439c-8e7d-2804547fa9c7	travel	delivered	تم التسليم	time-outline	5	t	2026-05-05 09:07:33.503866+00	2026-05-05 09:07:33.503866+00	\N	\N	\N
788bb316-e7bb-42af-b2c9-4516b3d18a78	travel	pending	معلق	time-outline	1	t	2026-05-05 09:07:33.503866+00	2026-05-05 14:47:00.013+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777992411932_4DrDcNT85.jpg	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777986973027_J2XYuIYVe.jpg	
fbc7a7db-0eba-4129-8460-0950e0c96d7b	travel	received	سيتم مراجعة الطلب	time-outline	2	t	2026-05-05 09:07:33.503866+00	2026-05-07 17:02:58.984+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777975036300_HFY5mIE806.jpg		
ec975553-eb99-4802-9695-f242ee431c87	travel	preparing	ارسال بيانات الحجز	time-outline	3	t	2026-05-05 09:07:33.503866+00	2026-05-07 17:03:16.441+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777992466559_oJsYTTWlW.jpg		
027aeea1-e4dc-47a4-a3cd-fd19054f5a12	home_chef	preparing	معلق	time-outline	1	t	2026-05-09 18:59:11.027+00	2026-05-09 18:59:11.027+00			
a744470f-3d71-438a-95ab-bf430fe6aeb6	supermarket	pending	معلق	time-outline	1	t	2026-05-11 14:20:54.645+00	2026-05-11 14:20:54.645+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778509250882_6pWR7MMWO.jpg		في انتظار قبول التاجر
d8b5e14b-4f06-43a0-a03f-161ec6e6e6ce	eshop	pending	قيد المراجعة	time-outline	0	t	2026-05-16 11:19:16.723353+00	2026-05-16 11:19:16.723353+00	\N	\N	طلبك قيد المراجعة
bb014bf9-f6f4-4160-8e7c-dc91be58481c	eshop	confirmed	تم التأكيد	time-outline	1	t	2026-05-16 11:19:16.723353+00	2026-05-16 11:19:16.723353+00	\N	\N	تم تأكيد طلبك
bfee40b5-aca7-4fa0-b878-8e47ad455e87	eshop	preparing	جاري التجهيز	time-outline	2	t	2026-05-16 11:19:16.723353+00	2026-05-16 11:19:16.723353+00	\N	\N	يتم تجهيز طلبك
ed1b18a8-e0d3-4aea-8647-c9eee17f61a7	eshop	shipped	تم الشحن	time-outline	3	t	2026-05-16 11:19:16.723353+00	2026-05-16 11:19:16.723353+00	\N	\N	طلبك في الطريق
33d1d923-24d0-498f-aced-985003cc70b8	eshop	delivered	تم التوصيل	time-outline	4	t	2026-05-16 11:19:16.723353+00	2026-05-16 11:19:16.723353+00	\N	\N	تم توصيل طلبك
44536cc3-ef4a-48c7-8cdd-f0fc814472c7	supermarket	accepted	تم القبول	time-outline	2	t	2026-05-11 14:22:03.986+00	2026-05-11 14:22:03.986+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778509321089_WUBaZoAGU.jpg		على وشك البدء في تجهيز طلبك
2b9f0246-03bd-4987-bf50-e396191a3fd2	supermarket	preparing	تجهيز الطلب	time-outline	3	t	2026-05-11 14:23:15.041+00	2026-05-11 14:23:34.848+00			سيتم استلام المندوب حالا
5164aa8f-8af2-4b80-a0a0-8c9f9f562bb7	supermarket	driver_assigned	مندوب	time-outline	4	t	2026-05-11 14:24:23.627+00	2026-05-11 14:24:23.627+00			المندوب سيبدأ في التحرك
2d91e121-18ac-49d9-a254-fbd4e58d992f	supermarket	on_the_way	طلبك في الطريق	time-outline	5	t	2026-05-11 14:25:01.246+00	2026-05-11 14:25:01.246+00			سيصلك قريبا
217a0329-921a-4e3e-8076-466535882e9c	supermarket	delivered	تم التوصيل	time-outline	6	t	2026-05-11 14:25:52.941+00	2026-05-11 14:25:52.941+00			تذكر التقييمات
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.services (id, name, type, screen, icon, color, category, is_active, is_visible, has_items, has_pickup, items_collection, sub_services, image_url, "order", merchant_type, merchant_role, response_message, maintenance_text, service_id, created_at, updated_at, tracking_image, has_video, items_type, merchant_id, merchant_name, header_image, full_service_id, tracking_icon_url, data_table, data_columns, data_filter, default_merchant_id, product_source_type, display_type) FROM stdin;
supermarket	سوبر ماركت	items	MerchantsListScreen	apps-outline	#6B7280	9dd97e2c-c59c-400a-b18f-7d130c589db6	t	t	t	f	service_supermarket_items	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1773993657658_ZzndZII5H.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	supermarket	2026-03-20 08:03:53.815	2026-04-28 21:34:16.606	\N	f	products	2a839c04-03d8-4079-a1fb-8bd1826c4564	سوبر ماركت	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777412051628_Ui0oYJddl.jpg	\N	\N	\N	name, price	is_active = true	\N	service	regular
home_chef	الشيف المنزلي	items	MerchantsListScreen	apps-outline	#4F46E5	9dd97e2c-c59c-400a-b18f-7d130c589db6	t	t	t	f	service_home_chef_items	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774345965079_jW41iH62B.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-03-24 02:47:53.203	2026-04-28 21:43:22.248	\N	f	dishes	4198059f-1629-49fa-98c2-3bfa7daac9c5	الشيف المنزلي	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777412595319_1k3M7yNTu6.jpg	\N	\N	products	name, price, description, image_url	service_id::eq::home_chef	\N	service	pro
restaurant	مطاعم	items	MerchantsListScreen	apps-outline	#6B7280	9dd97e2c-c59c-400a-b18f-7d130c589db6	t	t	t	f	service_restaurant_items	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1773993918897_hWpbNtWLq.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	restaurant	2026-03-20 08:05:25.969	2026-04-28 21:31:47.735	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774002178662_k5lGGFQ06.jpg	t	dishes	eca37997-c485-42d0-a872-00a1cbe6f4e9	مطاعم	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777411898895_XHuLqpkM9.jpg	\N	\N	\N	name, price	is_active = true	\N	service	express
sabak	سباكه	regular	ServiceScreen	apps-outline	#6B7280	7d63ae2a-4a96-4ce7-b814-07fe0108e384	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774346052573_GXQlT315H.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-03-24 09:54:35.047	2026-04-30 21:01:02.019	\N	f	products	2fbd346b-eb40-492e-b8db-2972d62e6c8f	سباكه	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777582854478_Oh7avjjHei.jpg	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778388932557_HpyBQcpLc.jpg	\N	name, price	is_active = true	\N	service	regular
wood	نجاره	regular	ServiceScreen	apps-outline	#6B7280	7d63ae2a-4a96-4ce7-b814-07fe0108e384	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774219003587_YZnmWPymH.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-03-22 22:37:10.895	2026-04-30 20:54:27.044	\N	f	products	5a0c1f08-4f81-462e-a34f-444c3008d44a	نجاره	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777582461589_0zFOjV_Z7.jpg	\N	\N	\N	name, price	is_active = true	\N	service	regular
bakery	مخبز	items_service	ItemsServiceScreen	apps-outline	#F59E0B	34387693-1971-4156-8b87-c65306ef3074	t	t	t	f	bakery_items	["وسط", "كبير", "صغير", "سمسم"]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777582916591_1gPa84GaW.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-04-24 23:02:12.981	2026-05-23 23:03:30.916	\N	f	products	db1fa5ef-1332-4e5d-91d1-eeb4e082f2bd	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777583061392_c3LAJvZKu.jpg	\N	\N	\N	name, price	is_active = true	\N	service	regular
delivery	توصيل طلبات	full_service	\N	bicycle	#10B981	34387693-1971-4156-8b87-c65306ef3074	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778820075041_MiM2vzoOq.jpg	99	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-05-01 11:01:16.181734	2026-05-06 07:57:24.767	\N	f	products	10920642-b0a0-4ede-871f-eaf40e51ba00	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777635294187_1GHYZZZ4p.jpg	\N	\N	\N	name, price	is_active = true	\N	service	express
travel	سياحة وسفر	full_service	\N	briefcase	#8B5CF6	34387693-1971-4156-8b87-c65306ef3074	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777560251186_5wqvCYGuh.jpg	99	\N	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-05-03 04:27:14.965556	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777977175802_G5DM0lW26.jpg	f	products	d878e694-1036-40ab-8364-469e19d85f65	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777785943367_p99bDJO8n.jpg	\N	\N	\N	name, price	is_active = true	\N	service	regular
eshop	المتجر	items	\N	cart	#2563EB	34387693-1971-4156-8b87-c65306ef3074	t	f	f	f	\N	[]	\N	0	\N	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-05-16 11:16:53.947098	2026-05-23 22:37:25.417	\N	f	products	ffe88455-964d-4156-b1b4-8bbeeb83a9ea	\N	\N	\N	\N	\N	name, price	is_active = true	\N	service	pro
pharmacy	صيدلية	regular	ServiceScreen	apps-outline	#14B8A6	9dd97e2c-c59c-400a-b18f-7d130c589db6	t	t	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1774289190679_m0Opvnw1E.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-03-23 18:10:07.728	2026-04-30 21:38:58.671	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777483618073_HhQqGrWe6.jpg	f	products	b724e1a9-d344-45db-8b0d-957940f940b5	صيدلية	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777585134505_4PDiYQYfi.jpg	\N	\N	\N	name, price	is_active = true	\N	service	regular
dryclean	مكوجي	items_service	ItemsServiceScreen	apps-outline	#F59E0B	9dd97e2c-c59c-400a-b18f-7d130c589db6	t	t	t	t	dryclean_items	["كي فقط", "كي وتنظيف"]	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777127780405_QTT86hEq4.jpg	0	merchant	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-04-25 14:36:57.65	2026-04-28 21:42:44.986	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777127806479_lizEkvEXn.jpg	f	products	48a8fe9b-9455-45cd-8f41-329f5e7c40c3	\N	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777412556539_OoQCENSje.jpg	\N	\N	\N	name, price	is_active = true	\N	service	regular
offers_header	Header العروض	regular	\N	apps-outline	#6B7280	34387693-1971-4156-8b87-c65306ef3074	t	f	f	f	\N	[]	https://ik.imagekit.io/vzuah6tku/app_settings/offersHeader_1778831352898_QNnCCQ4qm	0	\N	merchant	سيتم التواصل معك قريباً	جاري التحديث	\N	2026-05-15 07:45:19.343087	\N	\N	f	products	cd077a94-2964-4901-ae5a-86d0bd5f71f7	\N	\N	\N	\N	\N	name, price	is_active = true	\N	service	regular
\.


--
-- Data for Name: shop_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shop_products (id, name, price, image_url, category, is_active, is_featured, created_at, images, description, original_price, discount_percent, updated_at, is_available) FROM stdin;
d5390356-6056-4a67-ac4b-49e73589ac39	Test	50		هدايا 🎁	t	f	2026-05-23 20:12:06.843+00	{}		\N	\N	\N	t
23c6cebe-ee1b-4b00-a773-8ef81e584cbe	مخدة	165	https://ik.imagekit.io/vzuah6tku/zayedid/misc/shop_1778865251211_d5C1HZqOs.jpg	هدايا 🎁	t	t	2026-04-26 21:33:58.019+00	{https://ik.imagekit.io/vzuah6tku/zayedid/misc/shop_1778865251211_d5C1HZqOs.jpg,https://ik.imagekit.io/vzuah6tku/zayedid/misc/shop_1778865252820_QNBNrUryS.jpg,https://ik.imagekit.io/vzuah6tku/zayedid/misc/shop_1778865254008_V00sTg-2J.jpg,https://ik.imagekit.io/vzuah6tku/zayedid/misc/shop_1778865255217_ypEZ5gz4n.jpg}		\N	0	2026-05-23 20:12:20.433+00	t
3344a514-623e-4da3-b96c-599783979821	منتج جديد	55	https://ik.imagekit.io/vzuah6tku/zayedid/misc/shop_1778865315050_HliShzuh7.jpg	هدايا 🎁	t	f	2026-04-26 21:07:07.771+00	{https://ik.imagekit.io/vzuah6tku/zayedid/misc/shop_1778865315050_HliShzuh7.jpg}		\N	0	2026-05-23 20:12:28.826+00	t
440428b9-26a2-4e13-99e4-323d4c0eaf11	تتا	50		مطبخ	t	f	2026-05-24 08:27:41.248+00	{}		\N	\N	\N	t
\.


--
-- Data for Name: shop_reviews; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shop_reviews (id, product_id, customer_name, customer_id, rating, comment, created_at, is_approved, customer_image_url) FROM stdin;
12aea34d-2344-48ca-b3b8-2534dcab777d	23c6cebe-ee1b-4b00-a773-8ef81e584cbe	Sherif	b5b17b1e-7e65-4426-bce6-03f5002aba2e	4	حلو	2026-05-15 20:30:22.420064+00	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/sherif/profile/profile_1778876794079_Dm-Zx7aTm.jpg
8bdd6143-2065-4549-8843-83911e10f624	23c6cebe-ee1b-4b00-a773-8ef81e584cbe	شارو	252b4854-c7c6-44de-8bc0-c4f50192c43e	5	المنتجات جميل والخامه حلوه اوي بس السعر غالي شويه	2026-05-15 20:44:01.067455+00	t	https://ik.imagekit.io/vzuah6tku/zayedid/users/شارو/profile/profile_1778877790105_Tt1K-A0RC.jpg
\.


--
-- Data for Name: shop_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shop_settings (id, is_active, maintenance_message, banner_image, banner_title, banner_subtitle, free_shipping, free_shipping_min_order, created_at, updated_at) FROM stdin;
1	t	المتجر قيد التجهيز	https://ik.imagekit.io/vzuah6tku/zayedid/misc/banner_1777392524862_giGR62ONk.jpg	عروض خاصة	خصومات ولفترة محدودة	f	500	2026-04-26 17:34:08.857689+00	2026-04-26 17:34:08.857689+00
\.


--
-- Data for Name: sound_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sound_settings (id, send_sound_url, notification_sound_url, updated_at) FROM stdin;
1	https://ik.imagekit.io/vzuah6tku/Mp3/send.mp3?updatedAt=1778407205814	https://ik.imagekit.io/vzuah6tku/Mp3/ElevenLabs_Airy_chime_for_social_media_notification_alert,_bright_and_cheerful.mp3?updatedAt=1778523179476	2026-06-11 01:15:58.082
\.


--
-- Data for Name: sub_services; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sub_services (id, full_service_id, name, description, icon, sort_order, is_active, created_at, image_url, show_title, tracking_icon_url) FROM stdin;
20956352-1809-4e50-9a04-577781242eae	9352bbce-8ae1-46e2-9964-2db4ce667326	حجز طيران	\N	airplane	1	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777576757342_r_uOP3G-B.jpg	t	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778400514269_WvfuAX-4v.jpg
80223561-920a-4949-aca4-f649d9687be2	9352bbce-8ae1-46e2-9964-2db4ce667326	حجز فنادق	\N	bed	2	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777576808994_bq_UNFSeV.jpg	t	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1778400604289_59QyFUoo9.jpg
d96ec8f0-02d0-4c00-90b0-a4901c25ae8a	9352bbce-8ae1-46e2-9964-2db4ce667326	تأشيرات	\N	document-text	3	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777577044587_HnoBE_sGx.jpg	t	\N
a29efc56-52a6-41ea-8c47-c0f91e34cf6f	c7205659-f582-40f1-9bbb-76dcfb40a337	Y	\N	document-text	0	t	2026-05-02 16:09:22.321932+00	\N	t	https://via.placeholder.com/20
4f7d3b98-4bb8-4eb4-a43a-fdb7a1c8cd78	c7205659-f582-40f1-9bbb-76dcfb40a337	توصيل سريع	\N	document-text	0	t	2026-05-02 16:07:54.470472+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777817922423_ksaK4mOTC.jpg	t	test_url
2a82d891-58bd-4cb1-9898-23437435ba0f	c7205659-f582-40f1-9bbb-76dcfb40a337	H	\N	document-text	0	t	2026-05-02 16:26:26.292616+00	\N	t	\N
4e5c0360-bdbd-4724-bca4-74d9e2540509	9352bbce-8ae1-46e2-9964-2db4ce667326	سياحة داخلية	\N	document-text	5	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777626019322_hooa1NwCdb.jpg	t	\N
27e0fb0c-a72f-437a-9790-c96ef4c9c341	9352bbce-8ae1-46e2-9964-2db4ce667326	ليموزين و رحلات	\N	car	4	t	2026-05-02 14:20:58.515215+00	https://ik.imagekit.io/vzuah6tku/zayedid/services/service_1777577117057_gc0QD8q1d.jpg	t	\N
\.


--
-- Data for Name: template_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.template_products (id, name, description, image_url, category, service_type, is_approved, created_by, created_at, updated_at, category_id) FROM stdin;
e976ea5d-b967-45e9-b4d1-f9bbe0493c24	لبن جهينة كامل الدسم 1 لتر	لبن طازج كامل الدسم	\N	ألبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
4b48cb6c-3cfe-41c1-aead-7b1cda327bd7	لبن دومتي كامل الدسم 1 لتر	لبن طازج كامل الدسم	\N	ألبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
ecce5f49-a763-439e-b5d5-9ed796efaa73	زبادي دانون	زبادي دانون بالفواكه	\N	ألبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-04-26 12:27:56.074792+00	\N
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
0c8dc78a-d2f9-4df4-b2f2-3a6d9ba1c0b7	عدس أصفر	عدس أصفر مجروش		بقوليات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-05-14 18:36:43.366+00	f27e5b90-1271-4388-b590-48d1e31e9c46
9831db67-cc85-49c9-9551-9c6a6cd96eeb	عصير برتقال طبيعي	عصير طازج		مشروبات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-05-03 19:16:05.058+00	93c4c6f1-045b-4882-83f9-6136de6dad11
06b5edae-5d1c-4d3f-b039-4c098822b097	بيبسي كولا	مشروب غازي		مشروبات	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-05-03 19:16:20.579+00	93c4c6f1-045b-4882-83f9-6136de6dad11
b515cbaf-d214-4b85-a424-8c550b3fead2	كريم شعر فاتيكا		https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1777491950440_FqCQ1jwiD.jpg	عام	supermarket	t	\N	2026-04-29 19:45:41.378+00	2026-04-29 19:45:52.979+00	\N
3cf9a8bc-d286-4803-87b4-d149f31e721e	زبادي جهينة بلدي	زبادي بلدي طبيعي		ألبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-05-03 19:17:20.532+00	9fba4007-e0d4-4844-9e59-ed44bb3f357d
c7c9d5ea-c76b-41e3-b712-cacf108902a7	لبن خالي الدسم جهينة 1 لتر	لبن خالي الدسم	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1777337695580_gNvZLHBBG.jpg	ألبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-05-14 18:36:17.602+00	9fba4007-e0d4-4844-9e59-ed44bb3f357d
9ebabb39-882b-43b6-8143-7a3448eb6340	لبن المراعي كامل الدسم 1 لتر	لبن طازج كامل الدسم	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778658633346_wBD6q0Pj1.jpg	ألبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-05-14 18:36:23.356+00	9fba4007-e0d4-4844-9e59-ed44bb3f357d
cd564681-9ce2-4fee-a297-1168c4774b5c	فراوله	بلدي		خضروات وفاكهة	supermarket	t	\N	2026-05-14 17:46:46.763+00	2026-05-14 17:46:46.763+00	a26a2604-be2d-4a32-bc8e-b7a9060d1c08
de225325-a0f5-4bba-9403-e0a6d9af6f40	كفته مشوية	لحم بقري	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778784287582_0q1ed6_MA.jpg	مشويات	home_chef	t	\N	2026-05-14 18:44:56.524+00	2026-05-14 18:44:56.523+00	fd3a39da-93bc-49f0-99f9-67ae6342566b
3dabe8d2-b0f4-4087-9dbb-6f84b6362dbb	ت			مطبخ	eshop	t	\N	2026-05-24 08:26:00.161+00	2026-05-24 08:26:00.16+00	b04665f3-c38e-42a8-9d44-4cf922762e2f
77496c02-8a41-4d9d-a3f8-1c698a98d6cf	جبنة شيدر مطبوخ	جبنة شيدر	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778658524565_wFk9X3ax-.jpg	أجبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-05-14 18:35:48.667+00	ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d
dffb938d-3b91-4cb3-bf87-c0f84fb43913	جبنة رومي قديمة	جبنة رومي بلدي	https://ik.imagekit.io/vzuah6tku/zayedid/misc/template_1778093074716_UwXFZMM3w.jpg	أجبان	supermarket	t	\N	2026-04-26 12:27:56.074792+00	2026-05-14 18:35:56.568+00	ef5e2a40-d2ed-4ed3-93ed-f425df4aa10d
\.


--
-- Data for Name: user_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_tokens (id, user_id, expo_push_token, platform, created_at, updated_at) FROM stdin;
4c56a590-d3f8-4093-a55f-59513b210719	cd392e2f-7c36-41e6-b98f-e81ffc3dc013	ExponentPushToken[wT6cf0DMQ9n6odFJjIdclD]	android	2026-06-12 02:49:17.053669+00	2026-06-12 02:49:16.836+00
1dfc369c-af6f-472d-ba12-040542713e17	6ea342e6-0e90-4009-95fe-53bf1d601498	ExponentPushToken[l6ficaERzYEpkNxhnDfi9P]	android	2026-06-12 11:08:18.101386+00	2026-06-12 11:08:18.055+00
b1c00403-e992-450d-b89e-b3bfc6a2b13c	14c34717-0a25-4ed8-ad1b-df970d18b4dc	ExponentPushToken[tLJfqiJhttfjROit4EXu6T]	android	2026-06-12 11:13:44.936749+00	2026-06-12 11:13:44.7+00
\.


--
-- Data for Name: messages_2026_04_11; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_04_11 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_04_12; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_04_12 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_04_13; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_04_13 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_04_14; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_04_14 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_04_15; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_04_15 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_04_16; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_04_16 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_06_09; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_06_09 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_06_10; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_06_10 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_06_11; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_06_11 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_06_12; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_06_12 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_06_13; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_06_13 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_06_14; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_06_14 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_06_15; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.messages_2026_06_15 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: -
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
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter, selected_columns) FROM stdin;
414	d19829be-664f-11f1-a6ec-0a58a9feac02	public.orders	{}	{"exp": 1781349242, "iat": 1781262782, "iss": "https://api.supabase.co/v1/projects/genbmbieqgkncngnwges/api-keys-jwt-issuer", "role": "anon", "api_key_hash": "C6_WwDm0KYGeFUuV0VjNOfJjmzmgfceiccQTvA1RPaw"}	2026-06-12 11:14:03.015565	UPDATE	\N
415	d1982342-664f-11f1-a97e-0a58a9feac02	public.orders	{}	{"exp": 1781349242, "iat": 1781262782, "iss": "https://api.supabase.co/v1/projects/genbmbieqgkncngnwges/api-keys-jwt-issuer", "role": "anon", "api_key_hash": "C6_WwDm0KYGeFUuV0VjNOfJjmzmgfceiccQTvA1RPaw"}	2026-06-12 11:14:03.015565	INSERT	\N
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
order-files	order-files	\N	2026-04-19 15:54:53.962889+00	2026-04-19 15:54:53.962889+00	t	f	\N	\N	\N	STANDARD
splash_gifs	splash_gifs	\N	2026-05-17 20:27:50.053154+00	2026-05-17 20:27:50.053154+00	t	f	\N	\N	\N	STANDARD
zayedid	zayedid	\N	2026-06-09 21:30:25.579548+00	2026-06-09 21:30:25.579548+00	t	f	\N	\N	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: -
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
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: -
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
f3310275-142f-46d0-aad8-6657a6ac4f45	zayedid	supabase_backup.sql	\N	2026-06-09 23:01:40.99682+00	2026-06-09 23:01:40.99682+00	2026-06-09 23:01:40.99682+00	{"eTag": "\\"d22867283a189e91d232d695d6b4712e-1\\"", "size": 490619, "mimetype": "application/x-sql", "cacheControl": "max-age=3600", "lastModified": "2026-06-09T23:01:40.000Z", "contentLength": 490619, "httpStatusCode": 200}	dabc7d8b-3b9b-41bc-8b6c-f420c1a726fe	\N	\N
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata, metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: -
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 13, true);


--
-- Name: app_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.app_settings_id_seq', 80, true);


--
-- Name: assistants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assistants_id_seq', 15, true);


--
-- Name: dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dishes_id_seq', 5, true);


--
-- Name: home_chefs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.home_chefs_id_seq', 1, false);


--
-- Name: item_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.item_prices_id_seq', 1, false);


--
-- Name: laundry_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.laundry_items_id_seq', 9, true);


--
-- Name: offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.offers_id_seq', 11, true);


--
-- Name: restaurants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.restaurants_id_seq', 2, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reviews_id_seq', 29, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: -
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 420, true);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webauthn_challenges webauthn_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_pkey PRIMARY KEY (id);


--
-- Name: webauthn_credentials webauthn_credentials_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_pkey PRIMARY KEY (id);


--
-- Name: app_settings app_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT app_settings_pkey PRIMARY KEY (id);


--
-- Name: assistants assistants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assistants
    ADD CONSTRAINT assistants_pkey PRIMARY KEY (id);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- Name: full_services full_services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.full_services
    ADD CONSTRAINT full_services_pkey PRIMARY KEY (id);


--
-- Name: full_services full_services_service_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.full_services
    ADD CONSTRAINT full_services_service_id_key UNIQUE (service_id);


--
-- Name: home_chefs home_chefs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.home_chefs
    ADD CONSTRAINT home_chefs_pkey PRIMARY KEY (id);


--
-- Name: item_prices item_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_prices
    ADD CONSTRAINT item_prices_pkey PRIMARY KEY (id);


--
-- Name: laundry_items laundry_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.laundry_items
    ADD CONSTRAINT laundry_items_pkey PRIMARY KEY (id);


--
-- Name: merchant_product_prices merchant_product_prices_merchant_id_template_product_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_product_prices
    ADD CONSTRAINT merchant_product_prices_merchant_id_template_product_id_key UNIQUE (merchant_id, template_product_id);


--
-- Name: merchant_product_prices merchant_product_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_product_prices
    ADD CONSTRAINT merchant_product_prices_pkey PRIMARY KEY (id);


--
-- Name: merchant_sub_services merchant_sub_services_merchant_id_sub_service_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_sub_services
    ADD CONSTRAINT merchant_sub_services_merchant_id_sub_service_id_key UNIQUE (merchant_id, sub_service_id);


--
-- Name: merchant_sub_services merchant_sub_services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_sub_services
    ADD CONSTRAINT merchant_sub_services_pkey PRIMARY KEY (id);


--
-- Name: merchants merchants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchants
    ADD CONSTRAINT merchants_pkey PRIMARY KEY (id);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: otp_codes otp_codes_phone_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.otp_codes
    ADD CONSTRAINT otp_codes_phone_key UNIQUE (phone);


--
-- Name: otp_codes otp_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.otp_codes
    ADD CONSTRAINT otp_codes_pkey PRIMARY KEY (id);


--
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: product_variants product_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT product_variants_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_phone_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_phone_key UNIQUE (phone);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: regions regions_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_name_key UNIQUE (name);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: rest2_items rest2_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rest2_items
    ADD CONSTRAINT rest2_items_pkey PRIMARY KEY (id);


--
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_order_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_order_id_key UNIQUE (order_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: service_categories service_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_categories
    ADD CONSTRAINT service_categories_pkey PRIMARY KEY (id);


--
-- Name: service_fields_new service_fields_new_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_fields_new
    ADD CONSTRAINT service_fields_new_pkey PRIMARY KEY (id);


--
-- Name: service_items service_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_items
    ADD CONSTRAINT service_items_pkey PRIMARY KEY (id);


--
-- Name: service_tracking_steps service_tracking_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_tracking_steps
    ADD CONSTRAINT service_tracking_steps_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: shop_products shop_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop_products
    ADD CONSTRAINT shop_products_pkey PRIMARY KEY (id);


--
-- Name: shop_reviews shop_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop_reviews
    ADD CONSTRAINT shop_reviews_pkey PRIMARY KEY (id);


--
-- Name: shop_settings shop_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop_settings
    ADD CONSTRAINT shop_settings_pkey PRIMARY KEY (id);


--
-- Name: sound_settings sound_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sound_settings
    ADD CONSTRAINT sound_settings_pkey PRIMARY KEY (id);


--
-- Name: sub_services sub_services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sub_services
    ADD CONSTRAINT sub_services_pkey PRIMARY KEY (id);


--
-- Name: template_products template_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.template_products
    ADD CONSTRAINT template_products_pkey PRIMARY KEY (id);


--
-- Name: user_tokens user_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_tokens
    ADD CONSTRAINT user_tokens_pkey PRIMARY KEY (id);


--
-- Name: user_tokens user_tokens_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_tokens
    ADD CONSTRAINT user_tokens_user_id_key UNIQUE (user_id);


--
-- Name: messages_2026_04_11 messages_2026_04_11_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_04_11
    ADD CONSTRAINT messages_2026_04_11_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_12 messages_2026_04_12_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_04_12
    ADD CONSTRAINT messages_2026_04_12_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_13 messages_2026_04_13_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_04_13
    ADD CONSTRAINT messages_2026_04_13_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_14 messages_2026_04_14_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_04_14
    ADD CONSTRAINT messages_2026_04_14_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_15 messages_2026_04_15_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_04_15
    ADD CONSTRAINT messages_2026_04_15_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_04_16 messages_2026_04_16_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_04_16
    ADD CONSTRAINT messages_2026_04_16_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_09 messages_2026_06_09_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_06_09
    ADD CONSTRAINT messages_2026_06_09_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_10 messages_2026_06_10_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_06_10
    ADD CONSTRAINT messages_2026_06_10_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_11 messages_2026_06_11_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_06_11
    ADD CONSTRAINT messages_2026_06_11_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_12 messages_2026_06_12_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_06_12
    ADD CONSTRAINT messages_2026_06_12_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_13 messages_2026_06_13_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_06_13
    ADD CONSTRAINT messages_2026_06_13_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_14 messages_2026_06_14_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_06_14
    ADD CONSTRAINT messages_2026_06_14_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_06_15 messages_2026_06_15_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages_2026_06_15
    ADD CONSTRAINT messages_2026_06_15_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages messages_payload_exclusive; Type: CHECK CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE realtime.messages
    ADD CONSTRAINT messages_payload_exclusive CHECK (((payload IS NULL) OR (binary_payload IS NULL))) NOT VALID;


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: webauthn_challenges_expires_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX webauthn_challenges_expires_at_idx ON auth.webauthn_challenges USING btree (expires_at);


--
-- Name: webauthn_challenges_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX webauthn_challenges_user_id_idx ON auth.webauthn_challenges USING btree (user_id);


--
-- Name: webauthn_credentials_credential_id_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX webauthn_credentials_credential_id_key ON auth.webauthn_credentials USING btree (credential_id);


--
-- Name: webauthn_credentials_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX webauthn_credentials_user_id_idx ON auth.webauthn_credentials USING btree (user_id);


--
-- Name: idx_dishes_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dishes_provider_id ON public.dishes USING btree (provider_id);


--
-- Name: idx_dishes_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dishes_status ON public.dishes USING btree (status);


--
-- Name: idx_orders_parent_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orders_parent_order_id ON public.orders USING btree (parent_order_id);


--
-- Name: idx_orders_pending_available; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orders_pending_available ON public.orders USING btree (status, merchant_id) WHERE ((status = 'pending'::text) AND (merchant_id IS NULL));


--
-- Name: idx_orders_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orders_status ON public.orders USING btree (status);


--
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orders_user_id ON public.orders USING btree (user_id);


--
-- Name: idx_otp_codes_phone; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_otp_codes_phone ON public.otp_codes USING btree (phone);


--
-- Name: idx_service_categories_sort_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_service_categories_sort_order ON public.service_categories USING btree (sort_order);


--
-- Name: idx_service_items_service_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_service_items_service_id ON public.service_items USING btree (service_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_2026_04_11_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_04_11_inserted_at_topic_idx ON realtime.messages_2026_04_11 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_12_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_04_12_inserted_at_topic_idx ON realtime.messages_2026_04_12 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_13_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_04_13_inserted_at_topic_idx ON realtime.messages_2026_04_13 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_14_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_04_14_inserted_at_topic_idx ON realtime.messages_2026_04_14 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_15_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_04_15_inserted_at_topic_idx ON realtime.messages_2026_04_15 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_04_16_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_04_16_inserted_at_topic_idx ON realtime.messages_2026_04_16 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_09_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_06_09_inserted_at_topic_idx ON realtime.messages_2026_06_09 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_10_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_06_10_inserted_at_topic_idx ON realtime.messages_2026_06_10 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_11_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_06_11_inserted_at_topic_idx ON realtime.messages_2026_06_11 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_12_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_06_12_inserted_at_topic_idx ON realtime.messages_2026_06_12 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_13_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_06_13_inserted_at_topic_idx ON realtime.messages_2026_06_13 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_14_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_06_14_inserted_at_topic_idx ON realtime.messages_2026_06_14 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_06_15_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_2026_06_15_inserted_at_topic_idx ON realtime.messages_2026_06_15 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_selec; Type: INDEX; Schema: realtime; Owner: -
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_selec ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter, COALESCE(selected_columns, '{}'::text[]));


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_bucket_id_name_lower ON storage.objects USING btree (bucket_id, lower(name) COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: messages_2026_06_09_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_09_inserted_at_topic_idx;


--
-- Name: messages_2026_06_09_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_09_pkey;


--
-- Name: messages_2026_06_10_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_10_inserted_at_topic_idx;


--
-- Name: messages_2026_06_10_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_10_pkey;


--
-- Name: messages_2026_06_11_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_11_inserted_at_topic_idx;


--
-- Name: messages_2026_06_11_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_11_pkey;


--
-- Name: messages_2026_06_12_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_12_inserted_at_topic_idx;


--
-- Name: messages_2026_06_12_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_12_pkey;


--
-- Name: messages_2026_06_13_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_13_inserted_at_topic_idx;


--
-- Name: messages_2026_06_13_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_13_pkey;


--
-- Name: messages_2026_06_14_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_14_inserted_at_topic_idx;


--
-- Name: messages_2026_06_14_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_14_pkey;


--
-- Name: messages_2026_06_15_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_06_15_inserted_at_topic_idx;


--
-- Name: messages_2026_06_15_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: -
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_06_15_pkey;


--
-- Name: products auto_set_merchant_id_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER auto_set_merchant_id_trigger BEFORE INSERT OR UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.auto_set_merchant_id();


--
-- Name: profiles create_merchant_record_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER create_merchant_record_trigger AFTER INSERT ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.auto_create_merchant_record();


--
-- Name: service_fields prevent_duplicate_fields; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER prevent_duplicate_fields BEFORE INSERT ON public.service_fields FOR EACH ROW EXECUTE FUNCTION public.check_duplicate_field();


--
-- Name: full_services trigger_auto_create_merchant; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_auto_create_merchant AFTER INSERT ON public.full_services FOR EACH ROW EXECUTE FUNCTION public.auto_create_merchant_for_full_service();


--
-- Name: profiles trigger_auto_create_merchant; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_auto_create_merchant AFTER INSERT OR UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.auto_create_merchant_record();


--
-- Name: user_tokens trigger_cleanup_old_tokens; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_cleanup_old_tokens AFTER INSERT ON public.user_tokens FOR EACH STATEMENT EXECUTE FUNCTION public.cleanup_old_tokens();


--
-- Name: services trigger_copy_merchant_on_new_service; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_copy_merchant_on_new_service AFTER INSERT ON public.services FOR EACH ROW EXECUTE FUNCTION public.copy_merchant_on_new_service();


--
-- Name: sub_services trigger_copy_service_fields; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_copy_service_fields AFTER INSERT ON public.sub_services FOR EACH ROW EXECUTE FUNCTION public.copy_service_fields_on_new_sub();


--
-- Name: services trigger_copy_sub_services; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_copy_sub_services AFTER INSERT ON public.services FOR EACH ROW EXECUTE FUNCTION public.copy_sub_services_on_new_service();


--
-- Name: user_tokens trigger_handle_user_token; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_handle_user_token BEFORE INSERT ON public.user_tokens FOR EACH ROW EXECUTE FUNCTION public.handle_user_token();


--
-- Name: user_tokens trigger_prevent_duplicate_tokens; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_prevent_duplicate_tokens BEFORE INSERT ON public.user_tokens FOR EACH ROW EXECUTE FUNCTION public.prevent_duplicate_tokens();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: -
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: webauthn_challenges webauthn_challenges_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: webauthn_credentials webauthn_credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: dishes dishes_merchant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_merchant_id_fkey FOREIGN KEY (merchant_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: merchant_product_prices merchant_product_prices_template_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_product_prices
    ADD CONSTRAINT merchant_product_prices_template_product_id_fkey FOREIGN KEY (template_product_id) REFERENCES public.template_products(id) ON DELETE CASCADE;


--
-- Name: merchant_sub_services merchant_sub_services_merchant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_sub_services
    ADD CONSTRAINT merchant_sub_services_merchant_id_fkey FOREIGN KEY (merchant_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: merchant_sub_services merchant_sub_services_sub_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_sub_services
    ADD CONSTRAINT merchant_sub_services_sub_service_id_fkey FOREIGN KEY (sub_service_id) REFERENCES public.sub_services(id) ON DELETE CASCADE;


--
-- Name: orders orders_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- Name: places places_merchant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_merchant_id_fkey FOREIGN KEY (merchant_id) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- Name: product_variants product_variants_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT product_variants_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.service_items(id) ON DELETE CASCADE;


--
-- Name: products products_merchant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_merchant_id_fkey FOREIGN KEY (merchant_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: profiles profiles_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE SET NULL;


--
-- Name: profiles profiles_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id) ON DELETE SET NULL;


--
-- Name: service_fields_new service_fields_new_sub_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_fields_new
    ADD CONSTRAINT service_fields_new_sub_service_id_fkey FOREIGN KEY (sub_service_id) REFERENCES public.sub_services(id) ON DELETE CASCADE;


--
-- Name: sub_services sub_services_full_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sub_services
    ADD CONSTRAINT sub_services_full_service_id_fkey FOREIGN KEY (full_service_id) REFERENCES public.full_services(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: rest2_items Allow admin all; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow admin all" ON public.rest2_items USING (true);


--
-- Name: shop_reviews Allow admin select all; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow admin select all" ON public.shop_reviews FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: shop_reviews Allow all; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow all" ON public.shop_reviews USING (true);


--
-- Name: service_categories Allow all for authenticated; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow all for authenticated" ON public.service_categories USING ((auth.role() = 'authenticated'::text)) WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: product_categories Allow all operations; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow all operations" ON public.product_categories USING (true) WITH CHECK (true);


--
-- Name: otp_codes Allow all operations for authenticated users; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow all operations for authenticated users" ON public.otp_codes USING (true);


--
-- Name: service_categories Allow authenticated users to delete service_categories; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow authenticated users to delete service_categories" ON public.service_categories FOR DELETE TO authenticated USING (true);


--
-- Name: service_categories Allow authenticated users to insert service_categories; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow authenticated users to insert service_categories" ON public.service_categories FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: service_categories Allow authenticated users to select service_categories; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow authenticated users to select service_categories" ON public.service_categories FOR SELECT TO authenticated USING (true);


--
-- Name: service_categories Allow authenticated users to update service_categories; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow authenticated users to update service_categories" ON public.service_categories FOR UPDATE TO authenticated USING (true);


--
-- Name: shop_reviews Allow insert for all; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow insert for all" ON public.shop_reviews FOR INSERT WITH CHECK (true);


--
-- Name: rest2_items Allow public read; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow public read" ON public.rest2_items FOR SELECT USING (true);


--
-- Name: shop_reviews Allow select approved; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Allow select approved" ON public.shop_reviews FOR SELECT USING ((is_approved = true));


--
-- Name: reviews Anyone can read reviews; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Anyone can read reviews" ON public.reviews FOR SELECT USING (true);


--
-- Name: service_categories Anyone can read service_categories; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Anyone can read service_categories" ON public.service_categories FOR SELECT USING (true);


--
-- Name: service_categories Authenticated users can modify service_categories; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Authenticated users can modify service_categories" ON public.service_categories USING ((auth.role() = 'authenticated'::text)) WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: reviews Customers can create reviews; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Customers can create reviews" ON public.reviews FOR INSERT WITH CHECK (true);


--
-- Name: app_settings Enable all for all users; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable all for all users" ON public.app_settings USING (true) WITH CHECK (true);


--
-- Name: service_categories Enable delete for authenticated users; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable delete for authenticated users" ON public.service_categories FOR DELETE TO authenticated USING (true);


--
-- Name: product_categories Enable insert for authenticated users; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable insert for authenticated users" ON public.product_categories FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: product_categories Enable read for all users; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable read for all users" ON public.product_categories FOR SELECT USING (true);


--
-- Name: service_categories Enable read for all users; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable read for all users" ON public.service_categories FOR SELECT USING (true);


--
-- Name: product_categories Enable write for admins; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable write for admins" ON public.product_categories USING ((auth.role() = 'authenticated'::text));


--
-- Name: service_categories Enable write for admins; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "Enable write for admins" ON public.service_categories USING ((auth.role() = 'authenticated'::text));


--
-- Name: assistants allow_all_assistants; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_all_assistants ON public.assistants USING (true) WITH CHECK (true);


--
-- Name: dishes allow_all_dishes; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_all_dishes ON public.dishes USING (true) WITH CHECK (true);


--
-- Name: item_prices allow_all_item_prices; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_all_item_prices ON public.item_prices USING (true) WITH CHECK (true);


--
-- Name: merchant_product_prices allow_all_merchant_product_prices; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_all_merchant_product_prices ON public.merchant_product_prices USING (true) WITH CHECK (true);


--
-- Name: merchant_sub_services allow_all_merchant_sub_services; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_all_merchant_sub_services ON public.merchant_sub_services USING (true) WITH CHECK (true);


--
-- Name: places allow_all_places; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_all_places ON public.places USING (true) WITH CHECK (true);


--
-- Name: product_variants allow_all_product_variants; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_all_product_variants ON public.product_variants USING (true) WITH CHECK (true);


--
-- Name: products allow_all_products; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_all_products ON public.products USING (true) WITH CHECK (true);


--
-- Name: restaurants allow_all_restaurants; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_all_restaurants ON public.restaurants USING (true) WITH CHECK (true);


--
-- Name: service_items allow_all_service_items; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_all_service_items ON public.service_items USING (true) WITH CHECK (true);


--
-- Name: services allow_all_services; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_all_services ON public.services USING (true) WITH CHECK (true);


--
-- Name: user_tokens allow_all_user_tokens; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_all_user_tokens ON public.user_tokens USING (true) WITH CHECK (true);


--
-- Name: products allow_insert_update_products; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_insert_update_products ON public.products USING ((auth.role() = 'authenticated'::text)) WITH CHECK ((auth.role() = 'authenticated'::text));


--
-- Name: products allow_select_products; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY allow_select_products ON public.products FOR SELECT USING (true);


--
-- Name: assistants; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.assistants ENABLE ROW LEVEL SECURITY;

--
-- Name: dishes; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.dishes ENABLE ROW LEVEL SECURITY;

--
-- Name: item_prices; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.item_prices ENABLE ROW LEVEL SECURITY;

--
-- Name: merchant_product_prices; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.merchant_product_prices ENABLE ROW LEVEL SECURITY;

--
-- Name: merchant_sub_services; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.merchant_sub_services ENABLE ROW LEVEL SECURITY;

--
-- Name: merchants; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.merchants ENABLE ROW LEVEL SECURITY;

--
-- Name: merchants merchants_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY merchants_select ON public.merchants FOR SELECT USING (true);


--
-- Name: merchants merchants_update_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY merchants_update_own ON public.merchants FOR UPDATE USING ((user_id = auth.uid()));


--
-- Name: orders orders_select_all; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY orders_select_all ON public.orders FOR SELECT USING (true);


--
-- Name: otp_codes; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.otp_codes ENABLE ROW LEVEL SECURITY;

--
-- Name: places; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.places ENABLE ROW LEVEL SECURITY;

--
-- Name: product_categories; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.product_categories ENABLE ROW LEVEL SECURITY;

--
-- Name: product_variants; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.product_variants ENABLE ROW LEVEL SECURITY;

--
-- Name: products; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles profiles_insert; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY profiles_insert ON public.profiles FOR INSERT WITH CHECK (true);


--
-- Name: profiles profiles_select; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY profiles_select ON public.profiles FOR SELECT USING (true);


--
-- Name: profiles profiles_update_own; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY profiles_update_own ON public.profiles FOR UPDATE USING ((auth.uid() = id));


--
-- Name: rest2_items; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.rest2_items ENABLE ROW LEVEL SECURITY;

--
-- Name: restaurants; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.restaurants ENABLE ROW LEVEL SECURITY;

--
-- Name: reviews; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.reviews ENABLE ROW LEVEL SECURITY;

--
-- Name: service_categories; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.service_categories ENABLE ROW LEVEL SECURITY;

--
-- Name: service_categories service_categories_policy; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY service_categories_policy ON public.service_categories TO authenticated USING (true) WITH CHECK (true);


--
-- Name: service_categories service_categories_select_policy; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY service_categories_select_policy ON public.service_categories FOR SELECT TO anon USING (true);


--
-- Name: service_items; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.service_items ENABLE ROW LEVEL SECURITY;

--
-- Name: services; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.services ENABLE ROW LEVEL SECURITY;

--
-- Name: shop_reviews; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.shop_reviews ENABLE ROW LEVEL SECURITY;

--
-- Name: user_tokens; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.user_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: service_items الكل يستطيع قراءة الأصناف; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "الكل يستطيع قراءة الأصناف" ON public.service_items FOR SELECT USING (true);


--
-- Name: service_items المستخدمون المسجلون يستطيعون إدار; Type: POLICY; Schema: public; Owner: -
--

CREATE POLICY "المستخدمون المسجلون يستطيعون إدار" ON public.service_items USING ((auth.role() = 'authenticated'::text));


--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: -
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Allow Uploads; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow Uploads" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'splash_gifs'::text));


--
-- Name: objects Allow authenticated upload; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow authenticated upload" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'order-files'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Allow delete own files; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow delete own files" ON storage.objects FOR DELETE USING (((bucket_id = 'order-files'::text) AND (auth.uid() = owner)));


--
-- Name: objects Allow public read access; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow public read access" ON storage.objects FOR SELECT USING ((bucket_id = 'order-files'::text));


--
-- Name: objects Allow update own files; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow update own files" ON storage.objects FOR UPDATE USING (((bucket_id = 'order-files'::text) AND (auth.uid() = owner)));


--
-- Name: objects Allow uploads; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Allow uploads" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'splash_gifs'::text));


--
-- Name: objects Public Access; Type: POLICY; Schema: storage; Owner: -
--

CREATE POLICY "Public Access" ON storage.objects FOR SELECT USING ((bucket_id = 'splash_gifs'::text));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: -
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete');


--
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: -
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


--
-- Name: supabase_realtime orders; Type: PUBLICATION TABLE; Schema: public; Owner: -
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.orders;


--
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: -
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


--
-- PostgreSQL database dump complete
--

\unrestrict gDKYhgZl88dJdC9MR9tdzSB8MUHti6q9wnuPuYzhpudRlvevWbHLkb2TOzEJ6rh

