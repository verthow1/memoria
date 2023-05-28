--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8

-- Started on 2023-05-27 20:54:09

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

--
-- TOC entry 863 (class 1247 OID 16471)
-- Name: enum_Archivos_ubicacion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Archivos_ubicacion" AS ENUM (
    'GOOGLE',
    'DROPBOX'
);


ALTER TYPE public."enum_Archivos_ubicacion" OWNER TO postgres;

--
-- TOC entry 845 (class 1247 OID 16401)
-- Name: enum_Carreras_ubicacion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Carreras_ubicacion" AS ENUM (
    'GOOGLE',
    'DROPBOX'
);


ALTER TYPE public."enum_Carreras_ubicacion" OWNER TO postgres;

--
-- TOC entry 872 (class 1247 OID 16507)
-- Name: enum_Denuncia_estado; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Denuncia_estado" AS ENUM (
    'activa',
    'aceptada',
    'rechazada'
);


ALTER TYPE public."enum_Denuncia_estado" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 16545)
-- Name: Admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Admins" (
    id integer NOT NULL,
    mensaje character varying(3000),
    estado boolean,
    tipo character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Admins" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16544)
-- Name: Admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Admins_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Admins_id_seq" OWNER TO postgres;

--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 228
-- Name: Admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Admins_id_seq" OWNED BY public."Admins".id;


--
-- TOC entry 221 (class 1259 OID 16476)
-- Name: Archivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Archivos" (
    id integer NOT NULL,
    nombre character varying(255),
    enlace character varying(255),
    "año" integer,
    formato character varying(255),
    valoracion double precision,
    descripcion character varying(255),
    estado boolean,
    "isEnlace" boolean,
    ubicacion public."enum_Archivos_ubicacion",
    size integer,
    cod_usuario integer,
    cod_contenido integer,
    cod_categoria integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Archivos" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16475)
-- Name: Archivos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Archivos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Archivos_id_seq" OWNER TO postgres;

--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 220
-- Name: Archivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Archivos_id_seq" OWNED BY public."Archivos".id;


--
-- TOC entry 211 (class 1259 OID 16406)
-- Name: Carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Carreras" (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    sigla character varying(255) NOT NULL,
    token character varying(3000),
    correo character varying(255),
    carpeta_id character varying(255),
    ubicacion public."enum_Carreras_ubicacion",
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Carreras" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16405)
-- Name: Carreras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Carreras_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Carreras_id_seq" OWNER TO postgres;

--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 210
-- Name: Carreras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Carreras_id_seq" OWNED BY public."Carreras".id;


--
-- TOC entry 219 (class 1259 OID 16457)
-- Name: Categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Categoria" (
    id integer NOT NULL,
    nombre character varying(255),
    descripcion character varying(255),
    icon character varying(255),
    color character varying(255),
    cod_carrera integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Categoria" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16456)
-- Name: Categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Categoria_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Categoria_id_seq" OWNER TO postgres;

--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 218
-- Name: Categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Categoria_id_seq" OWNED BY public."Categoria".id;


--
-- TOC entry 217 (class 1259 OID 16445)
-- Name: Contenidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Contenidos" (
    id integer NOT NULL,
    nombre character varying(255),
    unidad integer,
    cod_ramo integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Contenidos" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16444)
-- Name: Contenidos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Contenidos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Contenidos_id_seq" OWNER TO postgres;

--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 216
-- Name: Contenidos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Contenidos_id_seq" OWNED BY public."Contenidos".id;


--
-- TOC entry 225 (class 1259 OID 16514)
-- Name: Denuncia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Denuncia" (
    id integer NOT NULL,
    descripcion character varying(255),
    estado public."enum_Denuncia_estado",
    cod_archivo integer,
    cod_usuario integer,
    cod_tipodenuncia integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Denuncia" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16513)
-- Name: Denuncia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Denuncia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Denuncia_id_seq" OWNER TO postgres;

--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 224
-- Name: Denuncia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Denuncia_id_seq" OWNED BY public."Denuncia".id;


--
-- TOC entry 227 (class 1259 OID 16536)
-- Name: Logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Logs" (
    id integer NOT NULL,
    ip character varying(255),
    navegador character varying(255),
    accion character varying(255),
    metodo character varying(255),
    date timestamp with time zone,
    "user" integer,
    user_carrera_id integer,
    user_carrera_nombre character varying(255),
    busqueda character varying(255),
    cod_carrera integer,
    cod_ramo integer,
    cod_contenido integer,
    cod_categoria integer,
    "isEnlace" boolean,
    descripcion character varying(255),
    noda_deseada integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Logs" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16535)
-- Name: Logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Logs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Logs_id_seq" OWNER TO postgres;

--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 226
-- Name: Logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Logs_id_seq" OWNED BY public."Logs".id;


--
-- TOC entry 215 (class 1259 OID 16431)
-- Name: Ramos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ramos" (
    id integer NOT NULL,
    nombre character varying(255),
    codigo character varying(255),
    cod_carrera integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Ramos" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16430)
-- Name: Ramos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ramos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ramos_id_seq" OWNER TO postgres;

--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 214
-- Name: Ramos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ramos_id_seq" OWNED BY public."Ramos".id;


--
-- TOC entry 209 (class 1259 OID 16395)
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16500)
-- Name: Tipodenuncia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tipodenuncia" (
    id integer NOT NULL,
    nombre character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Tipodenuncia" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16499)
-- Name: Tipodenuncia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tipodenuncia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tipodenuncia_id_seq" OWNER TO postgres;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 222
-- Name: Tipodenuncia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tipodenuncia_id_seq" OWNED BY public."Tipodenuncia".id;


--
-- TOC entry 213 (class 1259 OID 16415)
-- Name: Usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuarios" (
    id integer NOT NULL,
    nombre character varying(255),
    rut character varying(255),
    correo character varying(255),
    role character varying(255),
    password character varying(255),
    preferencias text,
    color character varying(255),
    img character varying(255),
    cod_carrera integer,
    "resetPasswordToken" character varying(255),
    "resetPasswordExpires" timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Usuarios" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16414)
-- Name: Usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Usuarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Usuarios_id_seq" OWNER TO postgres;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 212
-- Name: Usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Usuarios_id_seq" OWNED BY public."Usuarios".id;


--
-- TOC entry 3231 (class 2604 OID 16548)
-- Name: Admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Admins" ALTER COLUMN id SET DEFAULT nextval('public."Admins_id_seq"'::regclass);


--
-- TOC entry 3227 (class 2604 OID 16479)
-- Name: Archivos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Archivos" ALTER COLUMN id SET DEFAULT nextval('public."Archivos_id_seq"'::regclass);


--
-- TOC entry 3222 (class 2604 OID 16409)
-- Name: Carreras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carreras" ALTER COLUMN id SET DEFAULT nextval('public."Carreras_id_seq"'::regclass);


--
-- TOC entry 3226 (class 2604 OID 16460)
-- Name: Categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categoria" ALTER COLUMN id SET DEFAULT nextval('public."Categoria_id_seq"'::regclass);


--
-- TOC entry 3225 (class 2604 OID 16448)
-- Name: Contenidos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contenidos" ALTER COLUMN id SET DEFAULT nextval('public."Contenidos_id_seq"'::regclass);


--
-- TOC entry 3229 (class 2604 OID 16517)
-- Name: Denuncia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Denuncia" ALTER COLUMN id SET DEFAULT nextval('public."Denuncia_id_seq"'::regclass);


--
-- TOC entry 3230 (class 2604 OID 16539)
-- Name: Logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Logs" ALTER COLUMN id SET DEFAULT nextval('public."Logs_id_seq"'::regclass);


--
-- TOC entry 3224 (class 2604 OID 16434)
-- Name: Ramos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ramos" ALTER COLUMN id SET DEFAULT nextval('public."Ramos_id_seq"'::regclass);


--
-- TOC entry 3228 (class 2604 OID 16503)
-- Name: Tipodenuncia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipodenuncia" ALTER COLUMN id SET DEFAULT nextval('public."Tipodenuncia_id_seq"'::regclass);


--
-- TOC entry 3223 (class 2604 OID 16418)
-- Name: Usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios" ALTER COLUMN id SET DEFAULT nextval('public."Usuarios_id_seq"'::regclass);


--
-- TOC entry 3425 (class 0 OID 16545)
-- Dependencies: 229
-- Data for Name: Admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Admins" (id, mensaje, estado, tipo, "createdAt", "updatedAt") FROM stdin;
1	<p>AVISO</p>\n	f	primary	2023-05-27 05:39:37.92-04	2023-05-27 05:39:47.777-04
2	<p>warning</p>\n	f	warning	2023-05-27 05:39:59.932-04	2023-05-27 05:40:10.035-04
\.


--
-- TOC entry 3417 (class 0 OID 16476)
-- Dependencies: 221
-- Data for Name: Archivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Archivos" (id, nombre, enlace, "año", formato, valoracion, descripcion, estado, "isEnlace", ubicacion, size, cod_usuario, cod_contenido, cod_categoria, "createdAt", "updatedAt") FROM stdin;
2	recurso	https://www.queinteresante.com	2023	URL	0	aaaa	t	t	\N	\N	1	11	7	2023-05-27 04:45:07.245-04	2023-05-27 04:45:07.245-04
3	333	1fldbFKnsWVI9q8CihTfWQj57av4Rnoj2	2023	DOCX	0	bb	f	f	\N	0	1	1	1	2023-05-27 13:14:10.869-04	2023-05-27 13:16:46.849-04
1	Transparenciaactiva	1-35BuqRk6RikxCe4guiuxEUK4GudItjo	2023	CSV	0	aaaaa	f	f	\N	806	1	11	2	2023-05-27 04:44:05.506-04	2023-05-27 16:12:35.765-04
\.


--
-- TOC entry 3407 (class 0 OID 16406)
-- Dependencies: 211
-- Data for Name: Carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Carreras" (id, nombre, sigla, token, correo, carpeta_id, ubicacion, "createdAt", "updatedAt") FROM stdin;
1	Arquitectura [Nueva]		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
2	Construcción Civil (vespertino)		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
3	Ingeniería Civil		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
4	Ingeniería Civil Electrónica		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
5	Ingeniería Civil Industrial		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
6	Ingeniería Civil Informática	INF	-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQChhJcmLDpViXHR\nM44OGhpO0h0J1mAXRlGMVbYqOnN3yXcqhUDI/VP5hXvM1w7kWkQMx/cPZTVgjUjy\nm9gQjRB7iyZu04jEzYCBIhhXSC44dwWmjR2hqFHU7zzbs+h4t4M1vO5gxn6ibDMy\nd6wn/7PE3sOEmc/QvIK0b2ZEABOFZmm/FGy2oaJ8OaBjS1JFUAuS62pg/X9zYezm\nO9AQXRe7a5kPyJFke0p0RaYWTRDbN4tU9fZigSaglcN4OxKZo01qMcJF+0XHx6rR\nJcpjBh5Q8Vuk2GyWCRLZXOTykApKeGWEs/xpM3zaqbjbxbyeDj1DeOMfG7b9glP2\nLGJe3QGxAgMBAAECggEACWRHELBqLO6ayGYVyMKiTHqBt0B4omnTlJQoTUDMVYcI\nr5eDepxmXWAyYGkR49vO0Kpw9nt1VNmqR/chY2b8ch6Xe8K/lWf4pKmZnjujemOL\nV9GlSzDZH0dQ89p8dkZ/cei8OLLaCrI9cN4OC95dsuEcH9H8yD+p3vmKSgJyICPK\ncWm0sYbQH8XBGGOo2zJ3+Lz3Bbk2GAfkwiwHry36FRjGLjzM1L4kouawnmDOTUoy\npDuyzqgEQuTXALNgViign35y5CGJhwmK61pwKbIYU4kX3dtjVzk9OaLf8xtXhB10\nn3ggfIWIpW3niorGZs4oNN3G6vwiN3NONHYmnmwUFQKBgQDScv5H0BqW7sHfUWg+\n8G1gu+FlFRSt1PDjrXiroBJla5CjVUhgHu2ya2J/819WCpLXiQPms5kPEu/qVNS7\nvE+0wR0TkF6mzdotgRUwOK0iYSk0VV95yAza3hkY6LPQq3Y9twNXpAjSf1gMG2Mb\nFY7PqOIj2sdEftbX6AihAbHqvQKBgQDEek/gdrVr8qWHQNPcIysbnlyVC6vVR9l2\nUKQ//AddvwdDHgKQdegOxP+ZAcOuR6IR9/VIebrepHcD2B4jCLnoKG3re9OP8KtO\nD0w0g/rVCBbK3Ar7IJNfm7r/0UbHTZ+sO+Edpc9O8jtbVbwzSb/NEBFyNmdYLAn6\nMsL2cl3cBQKBgQDPiwiq2djfMOeRzT75kzLLS36lqXyTUoWeg92VpG+ABezGp7yQ\nzu+sHasudF15BUR7u2xVgJlZ/FsOxkpmOviAUlLSkHZIGosohTzYKYzVcuyn5+oY\nt+m1j4NAxX1QNUiO5IYvUF5C+cNjbT733vLQaMVchs4uBsjqdLLN1lYYIQKBgQCZ\nH8oI4ftaee1Pj9KNiksaZz04W7Q7sJdmgkrAIyeKhEqgoE7XT0zf1eBt2tYqiWFi\nJ6FeLqDYy8yFjnVOUIqyyG+CSysCz0pyt7FobEOcq4U37G4ScbzpknEW1n8W7QQ4\nMyKq/IKowFhKQnM+dYepxZATNxsruIa+G7meYFuOEQKBgC7nbEJd33HX7rcAQ9Gp\ng6OBOPcc4ntdRizUJZoqHVzBUJJhBJfCF/n+IuO3vyBq2v89w7iE2wPCltj3GZub\nRi/Im6efFb7E5TjUkONhbIZy70hgep31HJ373bQW4PMHOhlSKvc+utgQfngx4OGd\nx6njHzDR+t3drkQDrnGbsgZg\n-----END PRIVATE KEY-----\n	backend-tesis@backend-tesis.iam.gserviceaccount.com	1UHrj2xyF7E1ug_OQAsfPfHYDZdpxoI1-	GOOGLE	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
7	Ingeniería Ejecución en Computación e Informática (vespertino)		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
8	Ingeniería en Construcción	ICO	iBumdY95utkAAAAAAAAA-sl12H42Sl7_bXiZTTtNjNx5zZmmCigSMLt7JgPojSkF	\N	\N	DROPBOX	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
9	Medicina		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
10	Química y Farmacia		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
11	Enfermería Talca		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
12	Enfermería - Curicó		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
13	Kinesiología		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
14	Nutrición y Dietética		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
15	Psicología		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
16	Tecnología Médica		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
17	Educación Parvularia - Curicó		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
18	Pedagogía en Educación Especial		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
19	Pedagogía en Educación Física		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
20	Pedagogía en Educación General Básica con Mención - Curicó		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
21	Pedagogía en Educación General Básica con Mención - Talca		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
22	Pedagogía en Inglés		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
23	Pedagogía en Lengua Castellana y Comunicación		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
24	Administración Pública		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
25	Auditoría (Vespertino) Talca		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
26	Auditoría (Vespertino) Curicó		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
27	Derecho		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
28	Ingeniería Comercial		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
29	Sociología		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
30	Trabajo Social - Talca		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
31	Trabajo Social - Curicó		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
32	Ingeniería en Estadística		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
33	Pedagogía en Ciencias		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
34	Pedagogía en Matemáticas y Computación		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
35	Pedagogía en Religión y Filosofía		\N	\N	\N	\N	2023-05-27 04:13:18.673-04	2023-05-27 04:13:18.673-04
\.


--
-- TOC entry 3415 (class 0 OID 16457)
-- Dependencies: 219
-- Data for Name: Categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Categoria" (id, nombre, descripcion, icon, color, cod_carrera, "createdAt", "updatedAt") FROM stdin;
1	LIBROS	Sección para almacenar lirbos que ayuden a otros compañeros	fa fa-book mr-2	#f70303	\N	2023-05-27 04:13:18.86-04	2023-05-27 04:13:18.86-04
2	GUIAS	Sección para almacenar guias que ayuden a otros compañeros	fa fa-chain-broken mr-2	#f77d03	\N	2023-05-27 04:13:18.86-04	2023-05-27 04:13:18.86-04
3	TRABAJOS	Sección para almacenar trabajos que ayuden a otros compañeros	fa fa-file-archive-o mr-2	#f9c503	\N	2023-05-27 04:13:18.86-04	2023-05-27 04:13:18.86-04
4	PRUEBAS	Sección para almacenar pruebas que ayuden a otros compañeros	fa fa-file-pdf-o mr-2	#77f903	\N	2023-05-27 04:13:18.86-04	2023-05-27 04:13:18.86-04
5	VIDEOS	Sección para almacenar videos que ayuden a otros compañeros	fa fa-youtube-play mr-2	#03f9cc	\N	2023-05-27 04:13:18.86-04	2023-05-27 04:13:18.86-04
6	TALLERES	Sección para almacenar material relacionado con talleres realizados en el ramo que ayuden a otros compañeros	fa fa-briefcase mr-2	#0351f9	\N	2023-05-27 04:13:18.86-04	2023-05-27 04:13:18.86-04
7	CONTROLES	Sección para almacenar controles que ayuden a otros compañeros	fa fa-briefcase mr-2	#d703f9	\N	2023-05-27 04:13:18.86-04	2023-05-27 04:13:18.86-04
\.


--
-- TOC entry 3413 (class 0 OID 16445)
-- Dependencies: 217
-- Data for Name: Contenidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Contenidos" (id, nombre, unidad, cod_ramo, "createdAt", "updatedAt") FROM stdin;
1	Introducción a la Ingeniería de software y modelos de proceso de software.	1	3	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
2	Gestión integrada del proyecto.	2	3	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
3	Análisis y modelamiento de sistema	3	3	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
4	Case, framework y entorno de la ingeniería de software	4	3	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
5	Mantenimiento y Documentación	1	4	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
6	Métricas	2	4	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
7	Diseño de Interfaces de Usuario	3	4	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
8	Topicos Avanzados en Ingeniería de Software	4	4	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
9	Introducción a la Calidad	1	5	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
10	Calidad de Productos de Software	2	5	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
11	Calidad del Proceso de Software	3	5	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
12	Evaluación y Mejora de Procesos	4	5	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
13	Otros Aspectos de Calidad de Sistemas de Información.	5	5	2023-05-27 04:13:18.696-04	2023-05-27 04:13:18.696-04
\.


--
-- TOC entry 3421 (class 0 OID 16514)
-- Dependencies: 225
-- Data for Name: Denuncia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Denuncia" (id, descripcion, estado, cod_archivo, cod_usuario, cod_tipodenuncia, "createdAt", "updatedAt") FROM stdin;
1	1	activa	2	1	2	2023-05-27 04:50:58.884-04	2023-05-27 04:50:58.884-04
\.


--
-- TOC entry 3423 (class 0 OID 16536)
-- Dependencies: 227
-- Data for Name: Logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Logs" (id, ip, navegador, accion, metodo, date, "user", user_carrera_id, user_carrera_nombre, busqueda, cod_carrera, cod_ramo, cod_contenido, cod_categoria, "isEnlace", descripcion, noda_deseada, "createdAt", "updatedAt") FROM stdin;
1	127.0.0.1	DESKTOP	LOGIN	POST	2023-05-27 04:17:54.712-04	\N	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 04:17:54.714-04	2023-05-27 04:17:54.714-04
2	127.0.0.1	DESKTOP	BUSCAR	POST	2023-05-27 04:18:02.305-04	1	6	Ingeniería Civil Informática	\N	6	\N	\N	\N	\N	\N	\N	2023-05-27 04:18:02.305-04	2023-05-27 04:18:02.305-04
3	127.0.0.1	DESKTOP	CHANGECOLOR	POST	2023-05-27 04:31:01.827-04	1	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 04:31:01.828-04	2023-05-27 04:31:01.828-04
4	127.0.0.1	DESKTOP	LOGIN	POST	2023-05-27 04:31:14.409-04	\N	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 04:31:14.409-04	2023-05-27 04:31:14.409-04
5	127.0.0.1	DESKTOP	SUBIR	POST	2023-05-27 04:44:02.298-04	1	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 04:44:02.3-04	2023-05-27 04:44:02.3-04
6	127.0.0.1	DESKTOP	SUBIR	POST	2023-05-27 04:45:07.244-04	1	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 04:45:07.244-04	2023-05-27 04:45:07.244-04
7	127.0.0.1	DESKTOP	BUSCAR	POST	2023-05-27 04:45:25.391-04	1	6	Ingeniería Civil Informática	\N	6	\N	\N	\N	\N	\N	\N	2023-05-27 04:45:25.391-04	2023-05-27 04:45:25.391-04
8	127.0.0.1	DESKTOP	GETARCHIVO	POST	2023-05-27 04:45:28.058-04	1	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 04:45:28.058-04	2023-05-27 04:45:28.058-04
9	127.0.0.1	DESKTOP	GETARCHIVO	POST	2023-05-27 04:49:18.539-04	1	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 04:49:18.539-04	2023-05-27 04:49:18.539-04
10	127.0.0.1	DESKTOP	BUSCAR	POST	2023-05-27 05:39:20.681-04	1	6	Ingeniería Civil Informática	\N	6	\N	\N	\N	\N	\N	\N	2023-05-27 05:39:20.683-04	2023-05-27 05:39:20.683-04
11	127.0.0.1	DESKTOP	BUSCAR	POST	2023-05-27 05:40:03.479-04	1	6	Ingeniería Civil Informática	\N	6	\N	\N	\N	\N	\N	\N	2023-05-27 05:40:03.479-04	2023-05-27 05:40:03.479-04
14	127.0.0.1	DESKTOP	LOGIN	POST	2023-05-27 13:13:03.922-04	\N	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 13:13:03.922-04	2023-05-27 13:13:03.922-04
12	127.0.0.1	DESKTOP	LOGIN	POST	2023-05-27 13:13:03.92-04	\N	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 13:13:03.922-04	2023-05-27 13:13:03.922-04
13	127.0.0.1	DESKTOP	LOGIN	POST	2023-05-27 13:13:03.922-04	\N	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 13:13:03.922-04	2023-05-27 13:13:03.922-04
15	127.0.0.1	DESKTOP	SUBIR	POST	2023-05-27 13:14:06.823-04	1	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 13:14:06.823-04	2023-05-27 13:14:06.823-04
16	127.0.0.1	DESKTOP	BUSCAR	POST	2023-05-27 13:14:22.735-04	1	6	Ingeniería Civil Informática	\N	6	\N	\N	\N	\N	\N	\N	2023-05-27 13:14:22.736-04	2023-05-27 13:14:22.736-04
17	127.0.0.1	DESKTOP	GETARCHIVO	POST	2023-05-27 13:14:27.055-04	1	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 13:14:27.055-04	2023-05-27 13:14:27.055-04
18	127.0.0.1	DESKTOP	BUSCAR	POST	2023-05-27 13:16:50.44-04	1	6	Ingeniería Civil Informática	\N	6	\N	\N	\N	\N	\N	\N	2023-05-27 13:16:50.44-04	2023-05-27 13:16:50.44-04
19	127.0.0.1	DESKTOP	BUSCAR	POST	2023-05-27 16:09:29.12-04	1	6	Ingeniería Civil Informática	\N	6	\N	\N	\N	\N	\N	\N	2023-05-27 16:09:29.121-04	2023-05-27 16:09:29.121-04
20	127.0.0.1	DESKTOP	CHANGECOLOR	POST	2023-05-27 16:09:46.297-04	1	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 16:09:46.297-04	2023-05-27 16:09:46.297-04
21	127.0.0.1	DESKTOP	CHANGECOLOR	POST	2023-05-27 16:09:51.285-04	1	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 16:09:51.285-04	2023-05-27 16:09:51.285-04
22	127.0.0.1	DESKTOP	BUSCAR	POST	2023-05-27 16:10:35.655-04	1	6	Ingeniería Civil Informática	\N	6	\N	\N	\N	\N	\N	\N	2023-05-27 16:10:35.655-04	2023-05-27 16:10:35.655-04
23	127.0.0.1	DESKTOP	BUSCAR	POST	2023-05-27 16:12:38.58-04	1	6	Ingeniería Civil Informática	\N	6	\N	\N	\N	\N	\N	\N	2023-05-27 16:12:38.58-04	2023-05-27 16:12:38.58-04
24	127.0.0.1	DESKTOP	LOGIN	POST	2023-05-27 20:49:17.509-04	\N	6	Ingeniería Civil Informática	\N	\N	\N	\N	\N	\N	\N	\N	2023-05-27 20:49:17.51-04	2023-05-27 20:49:17.51-04
25	127.0.0.1	DESKTOP	BUSCAR	POST	2023-05-27 20:49:21.04-04	1	6	Ingeniería Civil Informática	\N	6	\N	\N	\N	\N	\N	\N	2023-05-27 20:49:21.041-04	2023-05-27 20:49:21.041-04
\.


--
-- TOC entry 3411 (class 0 OID 16431)
-- Dependencies: 215
-- Data for Name: Ramos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ramos" (id, nombre, codigo, cod_carrera, "createdAt", "updatedAt") FROM stdin;
1	Inteligencia Artificial	ICI-612	6	2023-05-27 04:13:18.689-04	2023-05-27 04:13:18.689-04
2	Computación Gráfica	ICI-613	6	2023-05-27 04:13:18.689-04	2023-05-27 04:13:18.689-04
3	Ingeniería de Software I	INF-424	6	2023-05-27 04:13:18.689-04	2023-05-27 04:13:18.689-04
4	Ingeniería de Software II	ICI-424	6	2023-05-27 04:13:18.689-04	2023-05-27 04:13:18.689-04
5	Calidad y Productividad de Software	ICI-524	6	2023-05-27 04:13:18.689-04	2023-05-27 04:13:18.689-04
\.


--
-- TOC entry 3405 (class 0 OID 16395)
-- Dependencies: 209
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20190812225504-create-carrera.js
20190812225505-create-usuario.js
20190816163640-create-ramo.js
20190816163641-create-contenido.js
20190816164304-create-categoria.js
20190816164305-create-archivo.js
20190816165211-create-tipo-denuncia.js
20190816165212-create-denuncia.js
20190816165213-create-log.js
20190816165214-create-admin.js
\.


--
-- TOC entry 3419 (class 0 OID 16500)
-- Dependencies: 223
-- Data for Name: Tipodenuncia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tipodenuncia" (id, nombre, "createdAt", "updatedAt") FROM stdin;
1	Derechos de autor	2023-05-27 04:13:18.866-04	2023-05-27 04:13:18.866-04
2	Contenido inapropiado	2023-05-27 04:13:18.866-04	2023-05-27 04:13:18.866-04
3	Otro	2023-05-27 04:13:18.866-04	2023-05-27 04:13:18.866-04
\.


--
-- TOC entry 3409 (class 0 OID 16415)
-- Dependencies: 213
-- Data for Name: Usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuarios" (id, nombre, rut, correo, role, password, preferencias, color, img, cod_carrera, "resetPasswordToken", "resetPasswordExpires", "createdAt", "updatedAt") FROM stdin;
2	USER1 INFORMATICA	11111112	USER1@gmail.com	USER	$2b$04$92wthhoJQFwscDMQXn2.2.8PPEvv0R95fsE7xDcdnCCzFWc43s6M2	\N	#001740	\N	6	\N	\N	2023-05-27 04:13:18.848-04	2023-05-27 04:13:18.848-04
3	USER CONSTRUCCION	11111113	USER2@gmail.com	USER	$2b$04$1im8CpHdfkxi61t1pF7eR.VuzIIG.uOwXnfsjcoE69XXporrgypJ6	\N	#001740	\N	8	\N	\N	2023-05-27 04:13:18.849-04	2023-05-27 04:13:18.849-04
4	CGA INFORMATICA	11111114	CGA1@gmail.com	CGA	$2b$04$U/iz.vZj2hVmpWTzIZ1RT.J29hfJjFHDcaLmHsXbsW445pvVjk1IG	\N	#001740	\N	6	\N	\N	2023-05-27 04:13:18.85-04	2023-05-27 04:13:18.85-04
5	CGA CONSTRUCCION	11111115	CGA2@gmail.com	CGA	$2b$04$m8k7bE51WSNVje9nLdOIZOYGb.vMg7T.Z/8nxziG4Z2GPmhR8NlQ6	\N	#001740	\N	8	\N	\N	2023-05-27 04:13:18.851-04	2023-05-27 04:13:18.851-04
7	DIRECTOR CONSTRUCCION	11111117	DIRECTOR2@gmail.com	DIRECTOR	$2b$04$O99v173GC1Wf1WFfsYBxgeSJEIDh91H2jOwhI0uurIiQvDtRQ2M5a	\N	#001740	\N	8	\N	\N	2023-05-27 04:13:18.853-04	2023-05-27 04:13:18.853-04
1	ADMIN	11111111	ADMIN@gmail.com	ADMIN	$2b$04$G5Q9dkdFXKXjXDcsAVIumePhXorLIuaErcPDVMv1l1g6N/z1fR2o.	\N	#253e85	\N	6	\N	\N	2023-05-27 04:13:18.847-04	2023-05-27 16:09:51.323-04
6	DIRECTOR INFORMATICA	11111116	DIRECTOR1@gmail.com	DIRECTOR	$2b$04$/bpYIwEvHJHywZZY5KwuW.C3nYtLVICMARb2V4o22WHqKhpB0k5AG	\N	#001740	\N	6	\N	\N	2023-05-27 04:13:18.852-04	2023-05-27 16:12:55.248-04
\.


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 228
-- Name: Admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Admins_id_seq"', 2, true);


--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 220
-- Name: Archivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Archivos_id_seq"', 3, true);


--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 210
-- Name: Carreras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Carreras_id_seq"', 35, true);


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 218
-- Name: Categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Categoria_id_seq"', 7, true);


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 216
-- Name: Contenidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Contenidos_id_seq"', 13, true);


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 224
-- Name: Denuncia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Denuncia_id_seq"', 1, true);


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 226
-- Name: Logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Logs_id_seq"', 25, true);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 214
-- Name: Ramos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ramos_id_seq"', 5, true);


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 222
-- Name: Tipodenuncia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tipodenuncia_id_seq"', 3, true);


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 212
-- Name: Usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Usuarios_id_seq"', 7, true);


--
-- TOC entry 3255 (class 2606 OID 16552)
-- Name: Admins Admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Admins"
    ADD CONSTRAINT "Admins_pkey" PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 16483)
-- Name: Archivos Archivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Archivos"
    ADD CONSTRAINT "Archivos_pkey" PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 16413)
-- Name: Carreras Carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carreras"
    ADD CONSTRAINT "Carreras_pkey" PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 16464)
-- Name: Categoria Categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categoria"
    ADD CONSTRAINT "Categoria_pkey" PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 16450)
-- Name: Contenidos Contenidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contenidos"
    ADD CONSTRAINT "Contenidos_pkey" PRIMARY KEY (id);


--
-- TOC entry 3251 (class 2606 OID 16519)
-- Name: Denuncia Denuncia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Denuncia"
    ADD CONSTRAINT "Denuncia_pkey" PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 16543)
-- Name: Logs Logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Logs"
    ADD CONSTRAINT "Logs_pkey" PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 16438)
-- Name: Ramos Ramos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ramos"
    ADD CONSTRAINT "Ramos_pkey" PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 16399)
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- TOC entry 3249 (class 2606 OID 16505)
-- Name: Tipodenuncia Tipodenuncia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipodenuncia"
    ADD CONSTRAINT "Tipodenuncia_pkey" PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 16424)
-- Name: Usuarios Usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_correo_key" UNIQUE (correo);


--
-- TOC entry 3239 (class 2606 OID 16422)
-- Name: Usuarios Usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 16494)
-- Name: Archivos Archivos_cod_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Archivos"
    ADD CONSTRAINT "Archivos_cod_categoria_fkey" FOREIGN KEY (cod_categoria) REFERENCES public."Categoria"(id) ON DELETE CASCADE;


--
-- TOC entry 3261 (class 2606 OID 16489)
-- Name: Archivos Archivos_cod_contenido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Archivos"
    ADD CONSTRAINT "Archivos_cod_contenido_fkey" FOREIGN KEY (cod_contenido) REFERENCES public."Contenidos"(id) ON DELETE CASCADE;


--
-- TOC entry 3260 (class 2606 OID 16484)
-- Name: Archivos Archivos_cod_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Archivos"
    ADD CONSTRAINT "Archivos_cod_usuario_fkey" FOREIGN KEY (cod_usuario) REFERENCES public."Usuarios"(id) ON DELETE CASCADE;


--
-- TOC entry 3259 (class 2606 OID 16465)
-- Name: Categoria Categoria_cod_carrera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categoria"
    ADD CONSTRAINT "Categoria_cod_carrera_fkey" FOREIGN KEY (cod_carrera) REFERENCES public."Carreras"(id) ON DELETE CASCADE;


--
-- TOC entry 3258 (class 2606 OID 16451)
-- Name: Contenidos Contenidos_cod_ramo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contenidos"
    ADD CONSTRAINT "Contenidos_cod_ramo_fkey" FOREIGN KEY (cod_ramo) REFERENCES public."Ramos"(id) ON DELETE CASCADE;


--
-- TOC entry 3263 (class 2606 OID 16520)
-- Name: Denuncia Denuncia_cod_archivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Denuncia"
    ADD CONSTRAINT "Denuncia_cod_archivo_fkey" FOREIGN KEY (cod_archivo) REFERENCES public."Archivos"(id) ON DELETE CASCADE;


--
-- TOC entry 3265 (class 2606 OID 16530)
-- Name: Denuncia Denuncia_cod_tipodenuncia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Denuncia"
    ADD CONSTRAINT "Denuncia_cod_tipodenuncia_fkey" FOREIGN KEY (cod_tipodenuncia) REFERENCES public."Tipodenuncia"(id) ON DELETE CASCADE;


--
-- TOC entry 3264 (class 2606 OID 16525)
-- Name: Denuncia Denuncia_cod_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Denuncia"
    ADD CONSTRAINT "Denuncia_cod_usuario_fkey" FOREIGN KEY (cod_usuario) REFERENCES public."Usuarios"(id) ON DELETE CASCADE;


--
-- TOC entry 3257 (class 2606 OID 16439)
-- Name: Ramos Ramos_cod_carrera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ramos"
    ADD CONSTRAINT "Ramos_cod_carrera_fkey" FOREIGN KEY (cod_carrera) REFERENCES public."Carreras"(id) ON DELETE CASCADE;


--
-- TOC entry 3256 (class 2606 OID 16425)
-- Name: Usuarios Usuarios_cod_carrera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_cod_carrera_fkey" FOREIGN KEY (cod_carrera) REFERENCES public."Carreras"(id) ON DELETE CASCADE;


-- Completed on 2023-05-27 20:54:10

--
-- PostgreSQL database dump complete
--

