--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: project_volunteers; Type: TABLE; Schema: public; Owner: jo
--

CREATE TABLE public.project_volunteers (
    id integer NOT NULL,
    project_id integer,
    volunteer_id integer
);


ALTER TABLE public.project_volunteers OWNER TO jo;

--
-- Name: project_volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: jo
--

CREATE SEQUENCE public.project_volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_volunteers_id_seq OWNER TO jo;

--
-- Name: project_volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jo
--

ALTER SEQUENCE public.project_volunteers_id_seq OWNED BY public.project_volunteers.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: jo
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.projects OWNER TO jo;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: jo
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO jo;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jo
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: jo
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    project_id integer,
    name character varying
);


ALTER TABLE public.volunteers OWNER TO jo;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: jo
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO jo;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jo
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: project_volunteers id; Type: DEFAULT; Schema: public; Owner: jo
--

ALTER TABLE ONLY public.project_volunteers ALTER COLUMN id SET DEFAULT nextval('public.project_volunteers_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: jo
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: jo
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Data for Name: project_volunteers; Type: TABLE DATA; Schema: public; Owner: jo
--

COPY public.project_volunteers (id, project_id, volunteer_id) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: jo
--

COPY public.projects (id, title) FROM stdin;
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: jo
--

COPY public.volunteers (id, project_id, name) FROM stdin;
\.


--
-- Name: project_volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jo
--

SELECT pg_catalog.setval('public.project_volunteers_id_seq', 1, false);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jo
--

SELECT pg_catalog.setval('public.projects_id_seq', 178, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jo
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 176, true);


--
-- Name: project_volunteers project_volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: jo
--

ALTER TABLE ONLY public.project_volunteers
    ADD CONSTRAINT project_volunteers_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: jo
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: jo
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

