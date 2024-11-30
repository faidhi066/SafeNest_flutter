--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.6 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.accounts (
    account_id character varying(255) NOT NULL,
    bic_code character varying(255) NOT NULL,
    provider_type character varying(255) NOT NULL,
    account_number character varying(255) NOT NULL,
    account_type character varying(255) NOT NULL,
    account_description character varying(255) NOT NULL,
    account_holder_full_name character varying(255) NOT NULL,
    id_type character varying(50) NOT NULL,
    id_value character varying(50) NOT NULL,
    account_holder_email_address character varying(255),
    account_holder_mobile_number character varying(50),
    product_type character varying(50) NOT NULL,
    sharia_compliance character varying(50) NOT NULL,
    user_id integer
);


ALTER TABLE public.accounts OWNER TO neondb_owner;

--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (account_id);


--
-- Name: accounts fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

