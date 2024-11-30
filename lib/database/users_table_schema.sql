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
-- Name: users; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    middle_name character varying(100),
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    date_of_birth date,
    phone_number character varying(15),
    gender character varying(10),
    profile_picture_url text,
    address_line_1 text,
    address_line_2 text,
    city character varying(100),
    state character varying(100),
    postal_code character varying(20),
    country character varying(100),
    is_active boolean DEFAULT true,
    is_verified boolean DEFAULT false,
    last_login timestamp without time zone,
    role character varying(50) DEFAULT 'user'::character varying,
    password_reset_token character varying(255),
    password_reset_expiration timestamp without time zone,
    preferences json,
    language character varying(50) DEFAULT 'en'::character varying,
    timezone character varying(50),
    subscription_status character varying(50) DEFAULT 'free'::character varying,
    loyalty_points integer DEFAULT 0,
    create_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_date timestamp without time zone
);


ALTER TABLE public.users OWNER TO neondb_owner;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO neondb_owner;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users set_updated_date; Type: TRIGGER; Schema: public; Owner: neondb_owner
--

CREATE TRIGGER set_updated_date BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.update_updated_date();


--
-- PostgreSQL database dump complete
--

