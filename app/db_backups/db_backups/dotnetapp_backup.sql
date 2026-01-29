--
-- PostgreSQL database dump
--

\restrict NGaRX1lfBI5iFZjmkfJq5XO0QzNGfLsq9zfn82hPhBDvGa5harJZQGNdNghY48h

-- Dumped from database version 13.23 (Debian 13.23-1.pgdg13+1)
-- Dumped by pg_dump version 13.23 (Debian 13.23-1.pgdg13+1)

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
-- Name: employees; Type: TABLE; Schema: public; Owner: dotnetappuser
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    name text NOT NULL,
    age integer,
    "position" text,
    start_year integer,
    end_year integer
);


ALTER TABLE public.employees OWNER TO dotnetappuser;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: dotnetappuser
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO dotnetappuser;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dotnetappuser
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: dotnetappuser
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: dotnetappuser
--

COPY public.employees (id, name, age, "position", start_year, end_year) FROM stdin;
1	Aulon  Koli	30	Software Engineer	2019	2026
2	Gramos  Berisha	28	QA Tester	2019	2026
3	Ermal  Aliu	25	Project Manager	2019	2026
4	Arlind  Krasniqi	22	UI/UX Designer	2020	2026
5	Emir Daku	19	DevOps Engineer	2020	2026
\.


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dotnetappuser
--

SELECT pg_catalog.setval('public.employees_id_seq', 5, true);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: dotnetappuser
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict NGaRX1lfBI5iFZjmkfJq5XO0QzNGfLsq9zfn82hPhBDvGa5harJZQGNdNghY48h

