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
-- Name: transactions; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.transactions (
    transaction_id uuid NOT NULL,
    account_id character varying(255) NOT NULL,
    bic_code character varying(255),
    account_number character varying(255),
    account_type character varying(255),
    payment_scheme character varying(255),
    credit_debit_indicator character varying(10),
    transaction_type character varying(255),
    transaction_amount numeric(15,2),
    transaction_currency character varying(10),
    account_currency_amount numeric(15,2),
    account_currency character varying(10),
    fx_rate numeric(10,4),
    status character varying(50),
    booking_datetime timestamp without time zone,
    value_datetime timestamp without time zone,
    merchant_category_code character varying(10),
    merchant_name character varying(255),
    merchant_address text,
    merchant_postal_code character varying(20),
    merchant_city character varying(100),
    merchant_country character varying(100),
    category character varying(100),
    category_purpose_code character varying(50),
    business_category_codes character varying(255),
    msic character varying(50),
    biller_code character varying(50),
    biller_code_name character varying(255),
    creditor_bic character varying(255),
    creditor_agent_name character varying(255),
    creditor_account_number character varying(255),
    creditor_account_name character varying(255),
    debitor_bic character varying(255),
    debitor_agent_name character varying(255),
    debitor_account_number character varying(255),
    debitor_name character varying(255)
);


ALTER TABLE public.transactions OWNER TO neondb_owner;

--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);


--
-- Name: transactions transactions_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(account_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

