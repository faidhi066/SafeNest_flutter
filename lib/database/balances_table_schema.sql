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
-- Name: balances; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.balances (
    account_detail_id integer NOT NULL,
    account_id character varying(255) NOT NULL,
    account_balance_datetime timestamp without time zone NOT NULL,
    outstanding_balance numeric(15,2),
    pending_balance numeric(15,2),
    available_balance numeric(15,2),
    credit_limit numeric(15,2),
    account_currency character varying(10) NOT NULL,
    repayment_due_date date,
    repayment_amount_due numeric(15,2),
    repayment_frequency character varying(50),
    maturity_date date
);


ALTER TABLE public.balances OWNER TO neondb_owner;

--
-- Name: balances_account_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.balances_account_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.balances_account_detail_id_seq OWNER TO neondb_owner;

--
-- Name: balances_account_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.balances_account_detail_id_seq OWNED BY public.balances.account_detail_id;


--
-- Name: balances account_detail_id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.balances ALTER COLUMN account_detail_id SET DEFAULT nextval('public.balances_account_detail_id_seq'::regclass);


--
-- Name: balances balances_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.balances
    ADD CONSTRAINT balances_pkey PRIMARY KEY (account_detail_id);


--
-- Name: balances balances_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.balances
    ADD CONSTRAINT balances_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(account_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

