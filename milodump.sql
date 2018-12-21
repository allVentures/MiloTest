--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: MiloApp_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MiloApp_user" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    birthdate date,
    random_number integer NOT NULL
);


ALTER TABLE public."MiloApp_user" OWNER TO postgres;

--
-- Name: MiloApp_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MiloApp_user_groups" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public."MiloApp_user_groups" OWNER TO postgres;

--
-- Name: MiloApp_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MiloApp_user_groups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MiloApp_user_groups_id_seq" OWNER TO postgres;

--
-- Name: MiloApp_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MiloApp_user_groups_id_seq" OWNED BY public."MiloApp_user_groups".id;


--
-- Name: MiloApp_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MiloApp_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MiloApp_user_id_seq" OWNER TO postgres;

--
-- Name: MiloApp_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MiloApp_user_id_seq" OWNED BY public."MiloApp_user".id;


--
-- Name: MiloApp_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MiloApp_user_user_permissions" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public."MiloApp_user_user_permissions" OWNER TO postgres;

--
-- Name: MiloApp_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MiloApp_user_user_permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MiloApp_user_user_permissions_id_seq" OWNER TO postgres;

--
-- Name: MiloApp_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MiloApp_user_user_permissions_id_seq" OWNED BY public."MiloApp_user_user_permissions".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: MiloApp_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user" ALTER COLUMN id SET DEFAULT nextval('public."MiloApp_user_id_seq"'::regclass);


--
-- Name: MiloApp_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user_groups" ALTER COLUMN id SET DEFAULT nextval('public."MiloApp_user_groups_id_seq"'::regclass);


--
-- Name: MiloApp_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user_user_permissions" ALTER COLUMN id SET DEFAULT nextval('public."MiloApp_user_user_permissions_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: MiloApp_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MiloApp_user" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, birthdate, random_number) FROM stdin;
4	pbkdf2_sha256$120000$0bg8KapOKD7U$DZsWtpvCaPgD907alR5tbyxXYGh0Flmnhehpch6swuk=	\N	f	user4	Mikołaj	Solis	artur37@interia.pl	f	t	2018-12-21 03:30:37.10661+01	1987-10-10	80
5	pbkdf2_sha256$120000$7EMKNBfj0b7r$61f9Ft4MUux3Z7aFBvNSYX0T8OENkr5BhWB2VrvNRiU=	\N	f	user5	Aniela	Sinkiewicz	igor11@o2.pl	f	t	2018-12-21 03:30:37.195028+01	1978-07-10	48
6	pbkdf2_sha256$120000$RLvOVqBcreFe$bHDE2VqzCA7cPxQ9V9qzjqDlIoo465Ahof23U/POQqw=	\N	f	user6	Inga	Bugla	marika60@wittbrodt.pl	f	t	2018-12-21 03:30:37.283915+01	1978-02-26	96
7	pbkdf2_sha256$120000$qPqdHrbFR5aU$XQ8M9L62y/P60oBnbvA6QDosxHhKvm/CBBzgYOBaC7Q=	\N	f	user7	Jeremi	Lichoń	odarlak@leks.org	f	t	2018-12-21 03:30:37.372652+01	1991-12-22	73
8	pbkdf2_sha256$120000$gFdZdaWiX3GM$+kG8IT14GqWuv7zm+yM74G3oT+2mCEBdoFo7SNVRSBI=	\N	f	user8	Urszula	Kudra	nworach@onet.pl	f	t	2018-12-21 03:30:37.460905+01	1980-04-03	97
9	pbkdf2_sha256$120000$OG5ibWVQwaNm$/EXDwBDLZLqBc/7YYPVIQKKaIXCN/zoP8IJLgbqWLSY=	\N	f	user9	Przemysław	Karwala	maciej16@janczarek-pabis.pl	f	t	2018-12-21 03:30:37.549698+01	1989-10-25	86
10	pbkdf2_sha256$120000$BsZsTwbvVCTP$VR+M8Ai6PlL52IXHdbjFM4C9yXwnUp4LQsEsYQb5zm8=	\N	f	user10	Józef	Pęksa	dslebioda@dworczak.pl	f	t	2018-12-21 03:30:37.638365+01	1975-07-16	85
11	pbkdf2_sha256$120000$6320WRVuNp3H$+RoiymO7csdUD6p4WgTB9sd33nDkX7O/+dgvi7DHIqk=	\N	f	user11	Lidia	Sommerfeld	ada60@yahoo.com	f	t	2018-12-21 03:30:37.726504+01	1974-11-30	6
12	pbkdf2_sha256$120000$TZD618KgXLWz$FeFZ6+d5VF52RXWS41Vs0SwXnJZVCrwlh9XrUELYoCA=	\N	f	user12	Kamila	Starek	xkolonko@sobstyl.pl	f	t	2018-12-21 03:30:37.815544+01	1992-03-24	65
13	pbkdf2_sha256$120000$JJqtk5lqMDZM$ytCY+QTyhE2Q1nuK22h25ic9inXH4x0WFv+T7KFbfWw=	\N	f	user13	Jacek	Pacholczak	kalinasamoraj@onet.pl	f	t	2018-12-21 03:30:37.904509+01	1980-10-09	100
14	pbkdf2_sha256$120000$vpy15nN1R2B9$C0tdEay5Ar+v6SCs0Td9qIGxkZ7mIxBFhJrs3cefSIA=	\N	f	user14	Iwo	Wysota	lmarach@ppuh.com	f	t	2018-12-21 03:30:37.992681+01	1971-01-15	58
15	pbkdf2_sha256$120000$XksUuxq0hhD9$jNyt11CnjcscDl44px6JP3vztl8MShJ2qmfFQSdJZeE=	\N	f	user15	Ignacy	Łodyga	lkrzysiek@ppuh.pl	f	t	2018-12-21 03:30:38.081563+01	1971-12-20	23
16	pbkdf2_sha256$120000$GT6FTkJFIn8p$LYzYspdngtkHV/vq5S6cDFrgPvSwEjMzvT6sezQB0Hw=	\N	f	user16	Nicole	Szurek	daniel19@gabinety.com	f	t	2018-12-21 03:30:38.169684+01	1984-05-30	22
17	pbkdf2_sha256$120000$LNu8QGbjsEYm$0KJFINlmj6Jif/89kSajW6+lzicfuIcNX9hX5rP/gtw=	\N	f	user17	Piotr	Trzop	arkadiuszbugla@ppuh.org	f	t	2018-12-21 03:30:38.25838+01	1989-10-08	69
18	pbkdf2_sha256$120000$kq5EeUvtq40t$wvEmDnqLYVGmfQx4/YaOEGaQRUkH3L4XcGwu77ifTnc=	\N	f	user18	Maurycy	Myrcik	antonichojna@gabinety.org	f	t	2018-12-21 03:30:38.346778+01	1978-11-09	30
19	pbkdf2_sha256$120000$1sMih0nf2cde$lAPzNwagEVGjXLmQuxeH3nMcr0nPu13iYB/N2PO8Z14=	\N	f	user19	Radosław	Szynkiewicz	norbert11@gabinety.pl	f	t	2018-12-21 03:30:38.43486+01	1971-05-06	50
20	pbkdf2_sha256$120000$S318lYCD4Xi4$9lQ+zP3X9V3lQkwMw0vy5o5r57ZBI5DRsYbjCMh1c7U=	\N	f	user20	Krystian	Fura	kajetanhadas@yahoo.com	f	t	2018-12-21 03:30:38.523645+01	1978-03-12	24
1	pbkdf2_sha256$120000$Rpx2ZLV5p3Zs$Bsc+pbBtPJe2Y4XJRxRuVLJG/F9FJy5MiAJcdIfQCso=	\N	f	user1	Anna Maria	Początek	rpowazka@gmail.com	f	t	2018-12-21 03:30:36.822673+01	2012-12-27	72
3	pbkdf2_sha256$120000$XDOafFuZQQ9K$Tn2BpDadRFMS/gWfjuGf+dG7t0iSmlVvDNsbL8Cf6Yo=	\N	f	user3	Konrad	Poniedziałek	sandracyrek@hotmail.com	f	t	2018-12-21 03:30:37.018142+01	2008-09-24	45
2	pbkdf2_sha256$120000$5Hh8nrfCWY7k$7hUsrBO419x84rq0Gk/yj33vD3awzRH4CrtRhRdXngE=	\N	f	user2	Ernest	Piejko	jeremimalka@onet.pl	f	t	2018-12-21 03:30:36.935024+01	2017-07-28	80
\.


--
-- Data for Name: MiloApp_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MiloApp_user_groups" (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: MiloApp_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MiloApp_user_user_permissions" (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	MiloApp	user
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-12-21 01:35:41.762055+01
2	contenttypes	0002_remove_content_type_name	2018-12-21 01:35:41.794758+01
3	auth	0001_initial	2018-12-21 01:35:42.162869+01
4	auth	0002_alter_permission_name_max_length	2018-12-21 01:35:42.195657+01
5	auth	0003_alter_user_email_max_length	2018-12-21 01:35:42.222173+01
6	auth	0004_alter_user_username_opts	2018-12-21 01:35:42.269934+01
7	auth	0005_alter_user_last_login_null	2018-12-21 01:35:42.287213+01
8	auth	0006_require_contenttypes_0002	2018-12-21 01:35:42.293952+01
9	auth	0007_alter_validators_add_error_messages	2018-12-21 01:35:42.309309+01
10	auth	0008_alter_user_username_max_length	2018-12-21 01:35:42.320491+01
11	auth	0009_alter_user_last_name_max_length	2018-12-21 01:35:42.331649+01
12	MiloApp	0001_initial	2018-12-21 01:35:42.906215+01
13	admin	0001_initial	2018-12-21 01:35:43.072331+01
14	admin	0002_logentry_remove_auto_add	2018-12-21 01:35:43.104191+01
15	admin	0003_logentry_add_action_flag_choices	2018-12-21 01:35:43.135235+01
16	sessions	0001_initial	2018-12-21 01:35:43.316157+01
17	MiloApp	0002_auto_20181221_0053	2018-12-21 01:53:37.589208+01
18	MiloApp	0003_auto_20181221_0135	2018-12-21 02:35:30.325189+01
19	MiloApp	0004_auto_20181221_0138	2018-12-21 02:38:53.696014+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: MiloApp_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MiloApp_user_groups_id_seq"', 1, false);


--
-- Name: MiloApp_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MiloApp_user_id_seq"', 451, true);


--
-- Name: MiloApp_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MiloApp_user_user_permissions_id_seq"', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 24, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 6, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: MiloApp_user_groups MiloApp_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user_groups"
    ADD CONSTRAINT "MiloApp_user_groups_pkey" PRIMARY KEY (id);


--
-- Name: MiloApp_user_groups MiloApp_user_groups_user_id_group_id_9686e3d1_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user_groups"
    ADD CONSTRAINT "MiloApp_user_groups_user_id_group_id_9686e3d1_uniq" UNIQUE (user_id, group_id);


--
-- Name: MiloApp_user MiloApp_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user"
    ADD CONSTRAINT "MiloApp_user_pkey" PRIMARY KEY (id);


--
-- Name: MiloApp_user_user_permissions MiloApp_user_user_permis_user_id_permission_id_09e357cb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user_user_permissions"
    ADD CONSTRAINT "MiloApp_user_user_permis_user_id_permission_id_09e357cb_uniq" UNIQUE (user_id, permission_id);


--
-- Name: MiloApp_user_user_permissions MiloApp_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user_user_permissions"
    ADD CONSTRAINT "MiloApp_user_user_permissions_pkey" PRIMARY KEY (id);


--
-- Name: MiloApp_user MiloApp_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user"
    ADD CONSTRAINT "MiloApp_user_username_key" UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: MiloApp_user_groups_group_id_a9c41e81; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MiloApp_user_groups_group_id_a9c41e81" ON public."MiloApp_user_groups" USING btree (group_id);


--
-- Name: MiloApp_user_groups_user_id_610155c1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MiloApp_user_groups_user_id_610155c1" ON public."MiloApp_user_groups" USING btree (user_id);


--
-- Name: MiloApp_user_user_permissions_permission_id_f37f9e66; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MiloApp_user_user_permissions_permission_id_f37f9e66" ON public."MiloApp_user_user_permissions" USING btree (permission_id);


--
-- Name: MiloApp_user_user_permissions_user_id_e7e837d2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MiloApp_user_user_permissions_user_id_e7e837d2" ON public."MiloApp_user_user_permissions" USING btree (user_id);


--
-- Name: MiloApp_user_username_26352643_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MiloApp_user_username_26352643_like" ON public."MiloApp_user" USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: MiloApp_user_groups MiloApp_user_groups_group_id_a9c41e81_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user_groups"
    ADD CONSTRAINT "MiloApp_user_groups_group_id_a9c41e81_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MiloApp_user_groups MiloApp_user_groups_user_id_610155c1_fk_MiloApp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user_groups"
    ADD CONSTRAINT "MiloApp_user_groups_user_id_610155c1_fk_MiloApp_user_id" FOREIGN KEY (user_id) REFERENCES public."MiloApp_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MiloApp_user_user_permissions MiloApp_user_user_pe_permission_id_f37f9e66_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user_user_permissions"
    ADD CONSTRAINT "MiloApp_user_user_pe_permission_id_f37f9e66_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MiloApp_user_user_permissions MiloApp_user_user_pe_user_id_e7e837d2_fk_MiloApp_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MiloApp_user_user_permissions"
    ADD CONSTRAINT "MiloApp_user_user_pe_user_id_e7e837d2_fk_MiloApp_u" FOREIGN KEY (user_id) REFERENCES public."MiloApp_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_MiloApp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_MiloApp_user_id" FOREIGN KEY (user_id) REFERENCES public."MiloApp_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

