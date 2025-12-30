--
-- PostgreSQL database dump
--

-- Dumped from database version 17.7 (Debian 17.7-3.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-12-30 21:35:37

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

DROP DATABASE postgres;
--
-- TOC entry 3474 (class 1262 OID 5)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


\connect postgres

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
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 3474
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 16423)
-- Name: grades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grades (
    id integer NOT NULL,
    student_id integer,
    subject_id integer,
    grade integer,
    grade_date date NOT NULL,
    CONSTRAINT grades_grade_check CHECK (((grade >= 0) AND (grade <= 100)))
);


--
-- TOC entry 225 (class 1259 OID 16422)
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 225
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


--
-- TOC entry 218 (class 1259 OID 16385)
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 16384)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 217
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 220 (class 1259 OID 16392)
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    id integer NOT NULL,
    fullname character varying(150) NOT NULL,
    group_id integer
);


--
-- TOC entry 219 (class 1259 OID 16391)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 219
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- TOC entry 224 (class 1259 OID 16411)
-- Name: subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    name character varying(175) NOT NULL,
    teacher_id integer
);


--
-- TOC entry 223 (class 1259 OID 16410)
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 223
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- TOC entry 222 (class 1259 OID 16404)
-- Name: teachers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    fullname character varying(150) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 16403)
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 221
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- TOC entry 3298 (class 2604 OID 16426)
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);


--
-- TOC entry 3294 (class 2604 OID 16388)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 3295 (class 2604 OID 16395)
-- Name: students id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 16414)
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 16407)
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- TOC entry 3468 (class 0 OID 16423)
-- Dependencies: 226
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.grades VALUES (1, 41, 14, 93, '2025-09-03');
INSERT INTO public.grades VALUES (2, 41, 9, 68, '2025-01-08');
INSERT INTO public.grades VALUES (3, 41, 11, 96, '2025-03-14');
INSERT INTO public.grades VALUES (4, 41, 14, 92, '2025-04-03');
INSERT INTO public.grades VALUES (5, 41, 8, 61, '2025-03-31');
INSERT INTO public.grades VALUES (6, 41, 10, 89, '2025-05-31');
INSERT INTO public.grades VALUES (7, 41, 9, 99, '2025-11-09');
INSERT INTO public.grades VALUES (8, 41, 13, 79, '2025-04-16');
INSERT INTO public.grades VALUES (9, 41, 13, 84, '2025-07-23');
INSERT INTO public.grades VALUES (10, 41, 8, 63, '2025-08-26');
INSERT INTO public.grades VALUES (11, 41, 9, 93, '2025-05-07');
INSERT INTO public.grades VALUES (12, 41, 12, 93, '2025-06-13');
INSERT INTO public.grades VALUES (13, 41, 10, 71, '2025-06-27');
INSERT INTO public.grades VALUES (14, 41, 11, 82, '2025-03-21');
INSERT INTO public.grades VALUES (15, 41, 14, 100, '2025-11-11');
INSERT INTO public.grades VALUES (16, 41, 13, 96, '2025-10-16');
INSERT INTO public.grades VALUES (17, 41, 8, 93, '2025-03-13');
INSERT INTO public.grades VALUES (18, 41, 12, 70, '2025-03-21');
INSERT INTO public.grades VALUES (19, 41, 8, 84, '2025-07-15');
INSERT INTO public.grades VALUES (20, 41, 12, 73, '2025-08-02');
INSERT INTO public.grades VALUES (21, 42, 12, 83, '2025-06-10');
INSERT INTO public.grades VALUES (22, 42, 12, 87, '2025-05-25');
INSERT INTO public.grades VALUES (23, 42, 14, 89, '2025-05-07');
INSERT INTO public.grades VALUES (24, 42, 10, 74, '2025-06-15');
INSERT INTO public.grades VALUES (25, 42, 12, 92, '2025-05-15');
INSERT INTO public.grades VALUES (26, 42, 12, 89, '2025-07-20');
INSERT INTO public.grades VALUES (27, 42, 11, 73, '2025-12-09');
INSERT INTO public.grades VALUES (28, 42, 9, 82, '2025-12-21');
INSERT INTO public.grades VALUES (29, 42, 10, 61, '2025-09-23');
INSERT INTO public.grades VALUES (30, 42, 9, 90, '2025-06-20');
INSERT INTO public.grades VALUES (31, 42, 12, 92, '2025-12-07');
INSERT INTO public.grades VALUES (32, 42, 11, 81, '2025-05-27');
INSERT INTO public.grades VALUES (33, 42, 9, 89, '2025-05-08');
INSERT INTO public.grades VALUES (34, 42, 11, 69, '2025-08-02');
INSERT INTO public.grades VALUES (35, 42, 14, 78, '2025-05-06');
INSERT INTO public.grades VALUES (36, 42, 9, 61, '2025-09-24');
INSERT INTO public.grades VALUES (37, 42, 13, 65, '2025-10-25');
INSERT INTO public.grades VALUES (38, 42, 14, 79, '2025-08-31');
INSERT INTO public.grades VALUES (39, 42, 12, 94, '2025-05-29');
INSERT INTO public.grades VALUES (40, 43, 8, 61, '2025-09-19');
INSERT INTO public.grades VALUES (41, 43, 12, 62, '2025-01-20');
INSERT INTO public.grades VALUES (42, 43, 10, 95, '2025-07-09');
INSERT INTO public.grades VALUES (43, 43, 11, 71, '2025-07-12');
INSERT INTO public.grades VALUES (44, 43, 13, 81, '2025-02-02');
INSERT INTO public.grades VALUES (45, 43, 8, 70, '2025-03-10');
INSERT INTO public.grades VALUES (46, 43, 11, 96, '2025-02-15');
INSERT INTO public.grades VALUES (47, 43, 8, 85, '2025-10-28');
INSERT INTO public.grades VALUES (48, 43, 11, 82, '2025-11-14');
INSERT INTO public.grades VALUES (49, 43, 11, 93, '2025-04-26');
INSERT INTO public.grades VALUES (50, 43, 8, 68, '2025-08-30');
INSERT INTO public.grades VALUES (51, 44, 12, 99, '2025-08-18');
INSERT INTO public.grades VALUES (52, 44, 8, 92, '2025-04-11');
INSERT INTO public.grades VALUES (53, 44, 10, 93, '2025-11-15');
INSERT INTO public.grades VALUES (54, 44, 11, 98, '2025-05-16');
INSERT INTO public.grades VALUES (55, 44, 8, 76, '2025-02-18');
INSERT INTO public.grades VALUES (56, 44, 14, 81, '2025-04-01');
INSERT INTO public.grades VALUES (57, 44, 12, 92, '2025-01-14');
INSERT INTO public.grades VALUES (58, 44, 13, 87, '2025-10-09');
INSERT INTO public.grades VALUES (59, 44, 12, 98, '2025-10-04');
INSERT INTO public.grades VALUES (60, 44, 10, 74, '2025-01-04');
INSERT INTO public.grades VALUES (61, 44, 12, 93, '2025-10-03');
INSERT INTO public.grades VALUES (62, 44, 9, 68, '2025-01-25');
INSERT INTO public.grades VALUES (63, 45, 13, 85, '2025-10-29');
INSERT INTO public.grades VALUES (64, 45, 9, 94, '2025-01-07');
INSERT INTO public.grades VALUES (65, 45, 11, 91, '2025-07-15');
INSERT INTO public.grades VALUES (66, 45, 14, 82, '2025-03-16');
INSERT INTO public.grades VALUES (67, 45, 11, 64, '2025-09-28');
INSERT INTO public.grades VALUES (68, 45, 11, 61, '2025-02-28');
INSERT INTO public.grades VALUES (69, 45, 11, 84, '2025-04-02');
INSERT INTO public.grades VALUES (70, 45, 14, 99, '2025-01-09');
INSERT INTO public.grades VALUES (71, 45, 9, 90, '2025-06-08');
INSERT INTO public.grades VALUES (72, 45, 10, 86, '2025-03-16');
INSERT INTO public.grades VALUES (73, 45, 12, 90, '2025-02-25');
INSERT INTO public.grades VALUES (74, 45, 12, 89, '2025-02-11');
INSERT INTO public.grades VALUES (75, 45, 12, 67, '2025-08-11');
INSERT INTO public.grades VALUES (76, 45, 13, 74, '2025-11-24');
INSERT INTO public.grades VALUES (77, 45, 13, 68, '2025-02-27');
INSERT INTO public.grades VALUES (78, 45, 12, 93, '2025-06-15');
INSERT INTO public.grades VALUES (79, 45, 11, 63, '2025-02-28');
INSERT INTO public.grades VALUES (80, 45, 12, 70, '2025-08-31');
INSERT INTO public.grades VALUES (81, 45, 13, 80, '2025-06-13');
INSERT INTO public.grades VALUES (82, 45, 8, 72, '2025-09-19');
INSERT INTO public.grades VALUES (83, 46, 10, 73, '2025-04-02');
INSERT INTO public.grades VALUES (84, 46, 10, 89, '2025-06-12');
INSERT INTO public.grades VALUES (85, 46, 11, 100, '2025-08-12');
INSERT INTO public.grades VALUES (86, 46, 14, 97, '2025-05-18');
INSERT INTO public.grades VALUES (87, 46, 13, 77, '2025-07-29');
INSERT INTO public.grades VALUES (88, 46, 8, 65, '2025-06-09');
INSERT INTO public.grades VALUES (89, 46, 9, 92, '2025-02-10');
INSERT INTO public.grades VALUES (90, 46, 11, 86, '2025-06-12');
INSERT INTO public.grades VALUES (91, 46, 10, 60, '2025-08-19');
INSERT INTO public.grades VALUES (92, 46, 8, 74, '2025-05-13');
INSERT INTO public.grades VALUES (93, 47, 9, 75, '2025-12-22');
INSERT INTO public.grades VALUES (94, 47, 8, 66, '2025-07-15');
INSERT INTO public.grades VALUES (95, 47, 12, 99, '2025-06-09');
INSERT INTO public.grades VALUES (96, 47, 13, 86, '2025-11-17');
INSERT INTO public.grades VALUES (97, 47, 9, 64, '2025-11-06');
INSERT INTO public.grades VALUES (98, 47, 14, 94, '2025-03-24');
INSERT INTO public.grades VALUES (99, 47, 11, 73, '2025-04-11');
INSERT INTO public.grades VALUES (100, 47, 11, 95, '2025-09-18');
INSERT INTO public.grades VALUES (101, 47, 13, 73, '2025-09-02');
INSERT INTO public.grades VALUES (102, 47, 8, 71, '2025-06-25');
INSERT INTO public.grades VALUES (103, 47, 8, 73, '2025-05-28');
INSERT INTO public.grades VALUES (104, 47, 9, 97, '2025-06-20');
INSERT INTO public.grades VALUES (105, 48, 14, 74, '2025-04-27');
INSERT INTO public.grades VALUES (106, 48, 14, 72, '2025-11-20');
INSERT INTO public.grades VALUES (107, 48, 9, 90, '2025-03-10');
INSERT INTO public.grades VALUES (108, 48, 10, 81, '2025-04-10');
INSERT INTO public.grades VALUES (109, 48, 8, 66, '2025-01-04');
INSERT INTO public.grades VALUES (110, 48, 8, 74, '2025-06-17');
INSERT INTO public.grades VALUES (111, 48, 9, 99, '2025-07-06');
INSERT INTO public.grades VALUES (112, 48, 12, 96, '2025-06-04');
INSERT INTO public.grades VALUES (113, 48, 14, 65, '2025-09-14');
INSERT INTO public.grades VALUES (114, 48, 10, 96, '2025-02-28');
INSERT INTO public.grades VALUES (115, 48, 9, 78, '2025-08-23');
INSERT INTO public.grades VALUES (116, 48, 14, 96, '2025-07-18');
INSERT INTO public.grades VALUES (117, 48, 14, 68, '2025-02-07');
INSERT INTO public.grades VALUES (118, 48, 10, 84, '2025-06-04');
INSERT INTO public.grades VALUES (119, 48, 11, 99, '2025-02-03');
INSERT INTO public.grades VALUES (120, 48, 8, 88, '2025-12-01');
INSERT INTO public.grades VALUES (121, 48, 8, 79, '2025-04-23');
INSERT INTO public.grades VALUES (122, 48, 9, 98, '2025-06-07');
INSERT INTO public.grades VALUES (123, 48, 11, 61, '2025-08-01');
INSERT INTO public.grades VALUES (124, 48, 8, 96, '2025-03-06');
INSERT INTO public.grades VALUES (125, 49, 14, 74, '2025-09-02');
INSERT INTO public.grades VALUES (126, 49, 9, 84, '2025-02-19');
INSERT INTO public.grades VALUES (127, 49, 8, 63, '2025-11-06');
INSERT INTO public.grades VALUES (128, 49, 10, 77, '2025-05-28');
INSERT INTO public.grades VALUES (129, 49, 9, 62, '2025-10-11');
INSERT INTO public.grades VALUES (130, 49, 9, 94, '2025-02-01');
INSERT INTO public.grades VALUES (131, 49, 8, 67, '2025-06-20');
INSERT INTO public.grades VALUES (132, 49, 9, 64, '2025-08-25');
INSERT INTO public.grades VALUES (133, 49, 9, 84, '2025-01-14');
INSERT INTO public.grades VALUES (134, 49, 12, 84, '2025-04-01');
INSERT INTO public.grades VALUES (135, 49, 8, 99, '2025-09-27');
INSERT INTO public.grades VALUES (136, 49, 12, 100, '2025-04-23');
INSERT INTO public.grades VALUES (137, 50, 8, 70, '2025-05-27');
INSERT INTO public.grades VALUES (138, 50, 8, 60, '2025-06-28');
INSERT INTO public.grades VALUES (139, 50, 12, 77, '2025-10-10');
INSERT INTO public.grades VALUES (140, 50, 14, 75, '2025-05-28');
INSERT INTO public.grades VALUES (141, 50, 10, 66, '2025-02-06');
INSERT INTO public.grades VALUES (142, 50, 10, 74, '2025-01-28');
INSERT INTO public.grades VALUES (143, 50, 13, 97, '2025-01-10');
INSERT INTO public.grades VALUES (144, 50, 10, 68, '2025-08-07');
INSERT INTO public.grades VALUES (145, 50, 8, 80, '2025-05-14');
INSERT INTO public.grades VALUES (146, 50, 9, 97, '2025-08-14');
INSERT INTO public.grades VALUES (147, 50, 13, 88, '2025-01-26');
INSERT INTO public.grades VALUES (148, 50, 10, 69, '2025-07-23');
INSERT INTO public.grades VALUES (149, 50, 9, 84, '2025-01-17');
INSERT INTO public.grades VALUES (150, 50, 10, 67, '2025-08-06');
INSERT INTO public.grades VALUES (151, 50, 12, 95, '2025-04-09');
INSERT INTO public.grades VALUES (152, 50, 9, 80, '2025-11-20');
INSERT INTO public.grades VALUES (153, 50, 11, 85, '2025-01-31');
INSERT INTO public.grades VALUES (154, 50, 10, 60, '2025-02-28');
INSERT INTO public.grades VALUES (155, 50, 8, 83, '2025-12-09');
INSERT INTO public.grades VALUES (156, 50, 11, 98, '2025-11-22');
INSERT INTO public.grades VALUES (157, 51, 14, 61, '2025-03-23');
INSERT INTO public.grades VALUES (158, 51, 8, 76, '2025-09-12');
INSERT INTO public.grades VALUES (159, 51, 12, 76, '2025-07-04');
INSERT INTO public.grades VALUES (160, 51, 8, 60, '2025-01-11');
INSERT INTO public.grades VALUES (161, 51, 10, 65, '2025-07-28');
INSERT INTO public.grades VALUES (162, 51, 11, 99, '2025-12-29');
INSERT INTO public.grades VALUES (163, 51, 11, 89, '2025-11-29');
INSERT INTO public.grades VALUES (164, 51, 13, 74, '2025-05-18');
INSERT INTO public.grades VALUES (165, 51, 10, 73, '2025-05-13');
INSERT INTO public.grades VALUES (166, 51, 8, 94, '2025-08-23');
INSERT INTO public.grades VALUES (167, 51, 12, 82, '2025-10-26');
INSERT INTO public.grades VALUES (168, 51, 11, 73, '2025-09-04');
INSERT INTO public.grades VALUES (169, 51, 8, 90, '2025-06-17');
INSERT INTO public.grades VALUES (170, 51, 9, 73, '2025-06-30');
INSERT INTO public.grades VALUES (171, 51, 8, 74, '2025-02-20');
INSERT INTO public.grades VALUES (172, 52, 11, 60, '2025-06-18');
INSERT INTO public.grades VALUES (173, 52, 11, 67, '2025-11-21');
INSERT INTO public.grades VALUES (174, 52, 12, 87, '2025-02-13');
INSERT INTO public.grades VALUES (175, 52, 13, 85, '2025-02-18');
INSERT INTO public.grades VALUES (176, 52, 11, 79, '2025-09-01');
INSERT INTO public.grades VALUES (177, 52, 10, 79, '2025-10-27');
INSERT INTO public.grades VALUES (178, 52, 9, 88, '2025-10-22');
INSERT INTO public.grades VALUES (179, 52, 10, 100, '2025-12-04');
INSERT INTO public.grades VALUES (180, 52, 13, 71, '2025-11-23');
INSERT INTO public.grades VALUES (181, 52, 9, 74, '2025-06-17');
INSERT INTO public.grades VALUES (182, 52, 11, 100, '2025-06-27');
INSERT INTO public.grades VALUES (183, 52, 14, 84, '2025-10-19');
INSERT INTO public.grades VALUES (184, 52, 11, 68, '2025-05-01');
INSERT INTO public.grades VALUES (185, 52, 12, 95, '2025-08-27');
INSERT INTO public.grades VALUES (186, 52, 11, 71, '2025-10-18');
INSERT INTO public.grades VALUES (187, 52, 14, 63, '2025-12-17');
INSERT INTO public.grades VALUES (188, 52, 12, 96, '2025-06-13');
INSERT INTO public.grades VALUES (189, 52, 9, 72, '2025-11-20');
INSERT INTO public.grades VALUES (190, 53, 8, 62, '2025-05-05');
INSERT INTO public.grades VALUES (191, 53, 13, 64, '2025-11-28');
INSERT INTO public.grades VALUES (192, 53, 14, 73, '2025-05-16');
INSERT INTO public.grades VALUES (193, 53, 12, 68, '2025-01-11');
INSERT INTO public.grades VALUES (194, 53, 14, 72, '2025-05-27');
INSERT INTO public.grades VALUES (195, 53, 12, 60, '2025-05-24');
INSERT INTO public.grades VALUES (196, 53, 14, 64, '2025-06-25');
INSERT INTO public.grades VALUES (197, 53, 14, 87, '2025-09-08');
INSERT INTO public.grades VALUES (198, 53, 10, 90, '2025-07-26');
INSERT INTO public.grades VALUES (199, 53, 10, 86, '2025-10-02');
INSERT INTO public.grades VALUES (200, 53, 13, 89, '2025-01-19');
INSERT INTO public.grades VALUES (201, 53, 13, 94, '2025-01-21');
INSERT INTO public.grades VALUES (202, 53, 14, 84, '2024-12-31');
INSERT INTO public.grades VALUES (203, 53, 11, 98, '2025-07-22');
INSERT INTO public.grades VALUES (204, 53, 11, 99, '2025-04-20');
INSERT INTO public.grades VALUES (205, 53, 12, 97, '2025-12-07');
INSERT INTO public.grades VALUES (206, 53, 12, 71, '2025-05-25');
INSERT INTO public.grades VALUES (207, 54, 8, 64, '2025-08-12');
INSERT INTO public.grades VALUES (208, 54, 10, 96, '2025-05-31');
INSERT INTO public.grades VALUES (209, 54, 12, 67, '2025-09-03');
INSERT INTO public.grades VALUES (210, 54, 9, 93, '2025-11-29');
INSERT INTO public.grades VALUES (211, 54, 11, 76, '2025-06-08');
INSERT INTO public.grades VALUES (212, 54, 9, 90, '2025-09-15');
INSERT INTO public.grades VALUES (213, 54, 12, 79, '2025-01-27');
INSERT INTO public.grades VALUES (214, 54, 9, 68, '2025-10-26');
INSERT INTO public.grades VALUES (215, 54, 12, 88, '2025-06-20');
INSERT INTO public.grades VALUES (216, 54, 10, 92, '2025-03-02');
INSERT INTO public.grades VALUES (217, 54, 14, 66, '2025-03-01');
INSERT INTO public.grades VALUES (218, 54, 9, 99, '2025-11-18');
INSERT INTO public.grades VALUES (219, 55, 10, 72, '2025-03-22');
INSERT INTO public.grades VALUES (220, 55, 11, 77, '2025-08-19');
INSERT INTO public.grades VALUES (221, 55, 8, 78, '2025-03-23');
INSERT INTO public.grades VALUES (222, 55, 14, 95, '2025-06-03');
INSERT INTO public.grades VALUES (223, 55, 8, 92, '2025-02-21');
INSERT INTO public.grades VALUES (224, 55, 12, 76, '2025-03-20');
INSERT INTO public.grades VALUES (225, 55, 12, 83, '2025-09-23');
INSERT INTO public.grades VALUES (226, 55, 12, 79, '2025-10-01');
INSERT INTO public.grades VALUES (227, 55, 11, 77, '2025-11-08');
INSERT INTO public.grades VALUES (228, 55, 10, 82, '2025-07-24');
INSERT INTO public.grades VALUES (229, 55, 12, 75, '2025-11-08');
INSERT INTO public.grades VALUES (230, 55, 14, 69, '2025-02-20');
INSERT INTO public.grades VALUES (231, 55, 11, 69, '2025-05-08');
INSERT INTO public.grades VALUES (232, 55, 8, 79, '2025-04-12');
INSERT INTO public.grades VALUES (233, 55, 14, 86, '2025-05-09');
INSERT INTO public.grades VALUES (234, 56, 9, 98, '2025-05-18');
INSERT INTO public.grades VALUES (235, 56, 10, 74, '2025-11-14');
INSERT INTO public.grades VALUES (236, 56, 9, 92, '2025-05-08');
INSERT INTO public.grades VALUES (237, 56, 12, 66, '2025-09-25');
INSERT INTO public.grades VALUES (238, 56, 10, 83, '2025-09-19');
INSERT INTO public.grades VALUES (239, 56, 9, 100, '2025-07-22');
INSERT INTO public.grades VALUES (240, 56, 8, 67, '2025-06-07');
INSERT INTO public.grades VALUES (241, 56, 9, 92, '2025-07-02');
INSERT INTO public.grades VALUES (242, 56, 10, 61, '2024-12-30');
INSERT INTO public.grades VALUES (243, 56, 12, 62, '2025-07-26');
INSERT INTO public.grades VALUES (244, 56, 10, 70, '2025-01-26');
INSERT INTO public.grades VALUES (245, 56, 14, 92, '2024-12-31');
INSERT INTO public.grades VALUES (246, 56, 12, 74, '2025-07-11');
INSERT INTO public.grades VALUES (247, 56, 14, 64, '2025-04-17');
INSERT INTO public.grades VALUES (248, 56, 12, 72, '2025-04-02');
INSERT INTO public.grades VALUES (249, 56, 12, 67, '2025-11-01');
INSERT INTO public.grades VALUES (250, 56, 13, 92, '2025-01-26');
INSERT INTO public.grades VALUES (251, 56, 11, 64, '2025-07-25');
INSERT INTO public.grades VALUES (252, 57, 13, 80, '2025-08-10');
INSERT INTO public.grades VALUES (253, 57, 12, 60, '2025-05-22');
INSERT INTO public.grades VALUES (254, 57, 13, 99, '2025-08-26');
INSERT INTO public.grades VALUES (255, 57, 11, 65, '2025-07-05');
INSERT INTO public.grades VALUES (256, 57, 10, 92, '2024-12-29');
INSERT INTO public.grades VALUES (257, 57, 13, 66, '2025-06-22');
INSERT INTO public.grades VALUES (258, 57, 12, 71, '2025-11-07');
INSERT INTO public.grades VALUES (259, 57, 12, 65, '2025-04-08');
INSERT INTO public.grades VALUES (260, 57, 10, 88, '2025-03-19');
INSERT INTO public.grades VALUES (261, 57, 13, 69, '2025-01-11');
INSERT INTO public.grades VALUES (262, 57, 10, 98, '2025-09-05');
INSERT INTO public.grades VALUES (263, 57, 12, 66, '2025-11-07');
INSERT INTO public.grades VALUES (264, 57, 12, 63, '2025-09-06');
INSERT INTO public.grades VALUES (265, 57, 12, 64, '2025-02-15');
INSERT INTO public.grades VALUES (266, 57, 13, 100, '2025-12-08');
INSERT INTO public.grades VALUES (267, 57, 9, 100, '2025-03-16');
INSERT INTO public.grades VALUES (268, 57, 12, 78, '2025-08-12');
INSERT INTO public.grades VALUES (269, 58, 14, 82, '2025-06-19');
INSERT INTO public.grades VALUES (270, 58, 13, 73, '2025-12-13');
INSERT INTO public.grades VALUES (271, 58, 14, 89, '2025-05-03');
INSERT INTO public.grades VALUES (272, 58, 12, 81, '2025-12-11');
INSERT INTO public.grades VALUES (273, 58, 12, 99, '2025-09-27');
INSERT INTO public.grades VALUES (274, 58, 9, 86, '2025-06-10');
INSERT INTO public.grades VALUES (275, 58, 14, 86, '2025-01-30');
INSERT INTO public.grades VALUES (276, 58, 14, 83, '2025-04-06');
INSERT INTO public.grades VALUES (277, 58, 8, 97, '2025-12-24');
INSERT INTO public.grades VALUES (278, 58, 11, 72, '2025-05-27');
INSERT INTO public.grades VALUES (279, 58, 13, 100, '2025-02-01');
INSERT INTO public.grades VALUES (280, 58, 9, 66, '2025-08-17');
INSERT INTO public.grades VALUES (281, 58, 14, 81, '2025-08-20');
INSERT INTO public.grades VALUES (282, 58, 13, 65, '2025-01-10');
INSERT INTO public.grades VALUES (283, 58, 14, 92, '2025-11-17');
INSERT INTO public.grades VALUES (284, 59, 8, 86, '2025-02-06');
INSERT INTO public.grades VALUES (285, 59, 10, 82, '2025-05-17');
INSERT INTO public.grades VALUES (286, 59, 12, 90, '2025-04-04');
INSERT INTO public.grades VALUES (287, 59, 12, 100, '2025-02-02');
INSERT INTO public.grades VALUES (288, 59, 14, 69, '2025-12-25');
INSERT INTO public.grades VALUES (289, 59, 13, 74, '2025-08-04');
INSERT INTO public.grades VALUES (290, 59, 9, 86, '2025-05-23');
INSERT INTO public.grades VALUES (291, 59, 10, 100, '2025-02-11');
INSERT INTO public.grades VALUES (292, 59, 8, 85, '2025-05-24');
INSERT INTO public.grades VALUES (293, 59, 12, 81, '2025-08-18');
INSERT INTO public.grades VALUES (294, 59, 8, 67, '2025-07-02');
INSERT INTO public.grades VALUES (295, 60, 13, 80, '2025-01-25');
INSERT INTO public.grades VALUES (296, 60, 8, 68, '2025-04-10');
INSERT INTO public.grades VALUES (297, 60, 11, 60, '2025-05-19');
INSERT INTO public.grades VALUES (298, 60, 9, 61, '2025-07-28');
INSERT INTO public.grades VALUES (299, 60, 8, 87, '2025-02-14');
INSERT INTO public.grades VALUES (300, 60, 11, 66, '2025-04-12');
INSERT INTO public.grades VALUES (301, 60, 8, 99, '2025-03-25');
INSERT INTO public.grades VALUES (302, 60, 12, 93, '2025-07-29');
INSERT INTO public.grades VALUES (303, 60, 8, 88, '2025-09-13');
INSERT INTO public.grades VALUES (304, 60, 11, 95, '2025-09-19');
INSERT INTO public.grades VALUES (305, 60, 10, 60, '2025-04-23');
INSERT INTO public.grades VALUES (306, 60, 13, 66, '2025-05-09');
INSERT INTO public.grades VALUES (307, 60, 11, 79, '2025-03-24');
INSERT INTO public.grades VALUES (308, 60, 10, 99, '2025-01-30');
INSERT INTO public.grades VALUES (309, 61, 10, 91, '2025-02-03');
INSERT INTO public.grades VALUES (310, 61, 9, 87, '2025-08-17');
INSERT INTO public.grades VALUES (311, 61, 13, 87, '2025-03-31');
INSERT INTO public.grades VALUES (312, 61, 10, 60, '2025-02-19');
INSERT INTO public.grades VALUES (313, 61, 11, 67, '2025-11-11');
INSERT INTO public.grades VALUES (314, 61, 12, 84, '2025-02-25');
INSERT INTO public.grades VALUES (315, 61, 14, 63, '2025-02-23');
INSERT INTO public.grades VALUES (316, 61, 12, 71, '2025-02-11');
INSERT INTO public.grades VALUES (317, 61, 10, 65, '2025-08-03');
INSERT INTO public.grades VALUES (318, 61, 9, 76, '2025-01-13');
INSERT INTO public.grades VALUES (319, 61, 14, 61, '2025-01-15');
INSERT INTO public.grades VALUES (320, 61, 12, 92, '2025-01-23');
INSERT INTO public.grades VALUES (321, 61, 13, 95, '2025-01-14');
INSERT INTO public.grades VALUES (322, 61, 10, 68, '2025-11-17');
INSERT INTO public.grades VALUES (323, 61, 13, 73, '2025-10-04');
INSERT INTO public.grades VALUES (324, 61, 13, 63, '2025-11-20');
INSERT INTO public.grades VALUES (325, 62, 9, 100, '2025-09-14');
INSERT INTO public.grades VALUES (326, 62, 9, 80, '2025-09-08');
INSERT INTO public.grades VALUES (327, 62, 13, 84, '2025-01-24');
INSERT INTO public.grades VALUES (328, 62, 10, 96, '2025-04-15');
INSERT INTO public.grades VALUES (329, 62, 13, 61, '2025-02-22');
INSERT INTO public.grades VALUES (330, 62, 9, 94, '2025-09-09');
INSERT INTO public.grades VALUES (331, 62, 9, 93, '2025-08-21');
INSERT INTO public.grades VALUES (332, 62, 8, 82, '2025-05-28');
INSERT INTO public.grades VALUES (333, 62, 12, 69, '2025-07-28');
INSERT INTO public.grades VALUES (334, 62, 13, 86, '2025-10-14');
INSERT INTO public.grades VALUES (335, 62, 14, 87, '2025-04-23');
INSERT INTO public.grades VALUES (336, 62, 9, 100, '2025-02-09');
INSERT INTO public.grades VALUES (337, 62, 12, 90, '2025-11-07');
INSERT INTO public.grades VALUES (338, 62, 10, 93, '2025-04-09');
INSERT INTO public.grades VALUES (339, 62, 13, 92, '2025-12-20');
INSERT INTO public.grades VALUES (340, 62, 11, 86, '2025-04-30');
INSERT INTO public.grades VALUES (341, 63, 10, 84, '2025-06-14');
INSERT INTO public.grades VALUES (342, 63, 14, 74, '2025-12-26');
INSERT INTO public.grades VALUES (343, 63, 12, 79, '2025-09-02');
INSERT INTO public.grades VALUES (344, 63, 8, 99, '2025-09-10');
INSERT INTO public.grades VALUES (345, 63, 12, 80, '2025-07-28');
INSERT INTO public.grades VALUES (346, 63, 13, 72, '2025-12-11');
INSERT INTO public.grades VALUES (347, 63, 10, 100, '2025-02-11');
INSERT INTO public.grades VALUES (348, 63, 10, 91, '2025-02-04');
INSERT INTO public.grades VALUES (349, 63, 9, 72, '2025-08-16');
INSERT INTO public.grades VALUES (350, 63, 14, 83, '2025-03-31');
INSERT INTO public.grades VALUES (351, 63, 8, 84, '2025-05-01');
INSERT INTO public.grades VALUES (352, 63, 11, 81, '2025-02-04');
INSERT INTO public.grades VALUES (353, 63, 11, 66, '2025-06-24');
INSERT INTO public.grades VALUES (354, 63, 10, 84, '2025-06-07');
INSERT INTO public.grades VALUES (355, 63, 12, 75, '2025-01-13');
INSERT INTO public.grades VALUES (356, 63, 14, 95, '2025-09-20');
INSERT INTO public.grades VALUES (357, 63, 14, 74, '2025-08-31');
INSERT INTO public.grades VALUES (358, 63, 9, 74, '2025-05-12');
INSERT INTO public.grades VALUES (359, 63, 14, 64, '2025-08-05');
INSERT INTO public.grades VALUES (360, 63, 14, 60, '2025-07-08');
INSERT INTO public.grades VALUES (361, 64, 10, 99, '2025-10-27');
INSERT INTO public.grades VALUES (362, 64, 12, 97, '2025-08-17');
INSERT INTO public.grades VALUES (363, 64, 10, 94, '2025-05-07');
INSERT INTO public.grades VALUES (364, 64, 10, 92, '2025-01-19');
INSERT INTO public.grades VALUES (365, 64, 12, 79, '2025-04-03');
INSERT INTO public.grades VALUES (366, 64, 14, 86, '2025-08-16');
INSERT INTO public.grades VALUES (367, 64, 9, 74, '2025-10-07');
INSERT INTO public.grades VALUES (368, 64, 12, 91, '2025-10-21');
INSERT INTO public.grades VALUES (369, 64, 8, 78, '2025-05-24');
INSERT INTO public.grades VALUES (370, 64, 12, 89, '2025-02-17');
INSERT INTO public.grades VALUES (371, 64, 11, 95, '2025-07-06');
INSERT INTO public.grades VALUES (372, 64, 10, 76, '2025-11-24');
INSERT INTO public.grades VALUES (373, 64, 14, 85, '2025-01-09');
INSERT INTO public.grades VALUES (374, 64, 14, 75, '2025-05-27');
INSERT INTO public.grades VALUES (375, 64, 8, 60, '2025-01-20');
INSERT INTO public.grades VALUES (376, 64, 9, 68, '2025-07-24');
INSERT INTO public.grades VALUES (377, 64, 9, 71, '2025-09-03');
INSERT INTO public.grades VALUES (378, 64, 12, 100, '2025-11-06');
INSERT INTO public.grades VALUES (379, 64, 8, 65, '2025-03-13');
INSERT INTO public.grades VALUES (380, 64, 14, 73, '2025-03-12');
INSERT INTO public.grades VALUES (381, 65, 10, 81, '2025-06-08');
INSERT INTO public.grades VALUES (382, 65, 12, 85, '2025-05-02');
INSERT INTO public.grades VALUES (383, 65, 12, 73, '2025-05-23');
INSERT INTO public.grades VALUES (384, 65, 14, 68, '2025-04-17');
INSERT INTO public.grades VALUES (385, 65, 14, 86, '2025-05-11');
INSERT INTO public.grades VALUES (386, 65, 13, 92, '2025-12-04');
INSERT INTO public.grades VALUES (387, 65, 10, 79, '2025-01-09');
INSERT INTO public.grades VALUES (388, 65, 12, 64, '2025-08-25');
INSERT INTO public.grades VALUES (389, 65, 13, 67, '2025-12-10');
INSERT INTO public.grades VALUES (390, 65, 11, 85, '2025-11-09');
INSERT INTO public.grades VALUES (391, 66, 11, 94, '2025-07-06');
INSERT INTO public.grades VALUES (392, 66, 8, 85, '2025-06-17');
INSERT INTO public.grades VALUES (393, 66, 13, 65, '2025-04-16');
INSERT INTO public.grades VALUES (394, 66, 8, 92, '2025-06-02');
INSERT INTO public.grades VALUES (395, 66, 11, 85, '2025-03-04');
INSERT INTO public.grades VALUES (396, 66, 10, 70, '2025-08-07');
INSERT INTO public.grades VALUES (397, 66, 12, 96, '2025-03-24');
INSERT INTO public.grades VALUES (398, 66, 13, 63, '2025-10-26');
INSERT INTO public.grades VALUES (399, 66, 12, 62, '2025-06-30');
INSERT INTO public.grades VALUES (400, 66, 13, 95, '2025-06-14');
INSERT INTO public.grades VALUES (401, 66, 8, 89, '2025-11-01');
INSERT INTO public.grades VALUES (402, 66, 13, 62, '2025-03-30');
INSERT INTO public.grades VALUES (403, 66, 10, 62, '2025-03-25');
INSERT INTO public.grades VALUES (404, 66, 9, 91, '2025-08-03');
INSERT INTO public.grades VALUES (405, 67, 13, 88, '2024-12-29');
INSERT INTO public.grades VALUES (406, 67, 12, 99, '2025-01-18');
INSERT INTO public.grades VALUES (407, 67, 8, 63, '2025-12-06');
INSERT INTO public.grades VALUES (408, 67, 9, 78, '2025-11-24');
INSERT INTO public.grades VALUES (409, 67, 13, 64, '2025-02-22');
INSERT INTO public.grades VALUES (410, 67, 13, 73, '2025-12-09');
INSERT INTO public.grades VALUES (411, 67, 9, 98, '2025-09-24');
INSERT INTO public.grades VALUES (412, 67, 12, 64, '2025-05-17');
INSERT INTO public.grades VALUES (413, 67, 12, 65, '2025-02-25');
INSERT INTO public.grades VALUES (414, 67, 14, 97, '2025-05-09');
INSERT INTO public.grades VALUES (415, 67, 14, 98, '2025-09-09');
INSERT INTO public.grades VALUES (416, 67, 11, 88, '2025-07-27');
INSERT INTO public.grades VALUES (417, 68, 11, 66, '2025-04-20');
INSERT INTO public.grades VALUES (418, 68, 14, 63, '2025-08-14');
INSERT INTO public.grades VALUES (419, 68, 8, 97, '2025-06-20');
INSERT INTO public.grades VALUES (420, 68, 9, 80, '2025-02-21');
INSERT INTO public.grades VALUES (421, 68, 12, 69, '2025-05-19');
INSERT INTO public.grades VALUES (422, 68, 10, 75, '2025-06-19');
INSERT INTO public.grades VALUES (423, 68, 13, 90, '2025-03-23');
INSERT INTO public.grades VALUES (424, 68, 9, 83, '2025-09-15');
INSERT INTO public.grades VALUES (425, 68, 9, 79, '2025-10-16');
INSERT INTO public.grades VALUES (426, 68, 11, 92, '2025-10-06');
INSERT INTO public.grades VALUES (427, 68, 8, 71, '2024-12-30');
INSERT INTO public.grades VALUES (428, 68, 13, 76, '2025-02-24');
INSERT INTO public.grades VALUES (429, 68, 8, 65, '2025-05-03');
INSERT INTO public.grades VALUES (430, 69, 9, 83, '2025-10-16');
INSERT INTO public.grades VALUES (431, 69, 12, 96, '2025-05-18');
INSERT INTO public.grades VALUES (432, 69, 8, 85, '2025-07-20');
INSERT INTO public.grades VALUES (433, 69, 9, 79, '2025-02-04');
INSERT INTO public.grades VALUES (434, 69, 11, 98, '2025-03-06');
INSERT INTO public.grades VALUES (435, 69, 10, 65, '2025-07-06');
INSERT INTO public.grades VALUES (436, 69, 11, 99, '2025-07-14');
INSERT INTO public.grades VALUES (437, 69, 11, 77, '2025-01-06');
INSERT INTO public.grades VALUES (438, 69, 13, 66, '2025-07-02');
INSERT INTO public.grades VALUES (439, 69, 8, 92, '2025-09-22');
INSERT INTO public.grades VALUES (440, 69, 14, 71, '2025-07-21');
INSERT INTO public.grades VALUES (441, 69, 13, 93, '2025-11-26');
INSERT INTO public.grades VALUES (442, 69, 11, 83, '2025-10-12');
INSERT INTO public.grades VALUES (443, 69, 14, 90, '2025-11-11');
INSERT INTO public.grades VALUES (444, 70, 13, 63, '2025-06-28');
INSERT INTO public.grades VALUES (445, 70, 14, 71, '2025-08-05');
INSERT INTO public.grades VALUES (446, 70, 11, 79, '2025-05-09');
INSERT INTO public.grades VALUES (447, 70, 14, 87, '2025-06-16');
INSERT INTO public.grades VALUES (448, 70, 11, 72, '2025-11-09');
INSERT INTO public.grades VALUES (449, 70, 9, 75, '2025-12-11');
INSERT INTO public.grades VALUES (450, 70, 9, 60, '2025-11-03');
INSERT INTO public.grades VALUES (451, 70, 9, 81, '2025-07-11');
INSERT INTO public.grades VALUES (452, 70, 12, 77, '2025-01-10');
INSERT INTO public.grades VALUES (453, 70, 9, 72, '2025-08-26');
INSERT INTO public.grades VALUES (454, 70, 9, 76, '2025-04-20');
INSERT INTO public.grades VALUES (455, 70, 10, 75, '2025-03-03');
INSERT INTO public.grades VALUES (456, 70, 9, 95, '2025-04-03');
INSERT INTO public.grades VALUES (457, 70, 11, 97, '2025-02-01');
INSERT INTO public.grades VALUES (458, 70, 12, 70, '2025-04-06');
INSERT INTO public.grades VALUES (459, 70, 13, 74, '2025-02-09');
INSERT INTO public.grades VALUES (460, 70, 12, 81, '2025-09-20');
INSERT INTO public.grades VALUES (461, 70, 14, 80, '2025-05-12');
INSERT INTO public.grades VALUES (462, 70, 8, 100, '2025-10-09');
INSERT INTO public.grades VALUES (463, 70, 11, 98, '2025-07-09');
INSERT INTO public.grades VALUES (464, 71, 9, 61, '2025-03-17');
INSERT INTO public.grades VALUES (465, 71, 12, 84, '2025-01-09');
INSERT INTO public.grades VALUES (466, 71, 8, 87, '2025-08-10');
INSERT INTO public.grades VALUES (467, 71, 11, 73, '2025-10-25');
INSERT INTO public.grades VALUES (468, 71, 14, 81, '2025-04-22');
INSERT INTO public.grades VALUES (469, 71, 13, 81, '2025-02-26');
INSERT INTO public.grades VALUES (470, 71, 9, 60, '2025-02-15');
INSERT INTO public.grades VALUES (471, 71, 12, 90, '2025-05-09');
INSERT INTO public.grades VALUES (472, 71, 10, 67, '2025-04-02');
INSERT INTO public.grades VALUES (473, 71, 10, 83, '2025-01-18');
INSERT INTO public.grades VALUES (474, 71, 11, 86, '2025-03-23');
INSERT INTO public.grades VALUES (475, 71, 12, 91, '2025-10-16');
INSERT INTO public.grades VALUES (476, 71, 8, 70, '2025-02-01');
INSERT INTO public.grades VALUES (477, 71, 13, 62, '2025-05-18');
INSERT INTO public.grades VALUES (478, 71, 8, 77, '2025-12-17');
INSERT INTO public.grades VALUES (479, 71, 9, 79, '2025-03-30');
INSERT INTO public.grades VALUES (480, 72, 8, 74, '2025-04-02');
INSERT INTO public.grades VALUES (481, 72, 9, 75, '2025-03-06');
INSERT INTO public.grades VALUES (482, 72, 12, 70, '2025-11-21');
INSERT INTO public.grades VALUES (483, 72, 11, 87, '2025-08-24');
INSERT INTO public.grades VALUES (484, 72, 12, 71, '2025-12-14');
INSERT INTO public.grades VALUES (485, 72, 13, 61, '2025-04-14');
INSERT INTO public.grades VALUES (486, 72, 9, 88, '2025-10-18');
INSERT INTO public.grades VALUES (487, 72, 12, 74, '2025-08-09');
INSERT INTO public.grades VALUES (488, 72, 10, 92, '2025-02-15');
INSERT INTO public.grades VALUES (489, 72, 12, 82, '2025-03-27');
INSERT INTO public.grades VALUES (490, 72, 9, 61, '2025-06-13');
INSERT INTO public.grades VALUES (491, 72, 12, 99, '2024-12-30');
INSERT INTO public.grades VALUES (492, 72, 12, 88, '2025-02-10');
INSERT INTO public.grades VALUES (493, 72, 10, 84, '2025-02-18');
INSERT INTO public.grades VALUES (494, 72, 11, 96, '2025-10-15');
INSERT INTO public.grades VALUES (495, 72, 8, 89, '2025-06-20');
INSERT INTO public.grades VALUES (496, 72, 12, 94, '2025-03-15');
INSERT INTO public.grades VALUES (497, 72, 12, 97, '2025-12-08');
INSERT INTO public.grades VALUES (498, 72, 8, 68, '2025-12-18');
INSERT INTO public.grades VALUES (499, 73, 13, 77, '2025-04-29');
INSERT INTO public.grades VALUES (500, 73, 9, 96, '2025-01-19');
INSERT INTO public.grades VALUES (501, 73, 9, 87, '2025-07-03');
INSERT INTO public.grades VALUES (502, 73, 10, 100, '2025-05-22');
INSERT INTO public.grades VALUES (503, 73, 14, 92, '2025-08-15');
INSERT INTO public.grades VALUES (504, 73, 12, 82, '2025-08-20');
INSERT INTO public.grades VALUES (505, 73, 14, 97, '2025-07-04');
INSERT INTO public.grades VALUES (506, 73, 8, 98, '2025-08-07');
INSERT INTO public.grades VALUES (507, 73, 12, 77, '2025-08-16');
INSERT INTO public.grades VALUES (508, 73, 13, 80, '2025-05-06');
INSERT INTO public.grades VALUES (509, 73, 11, 63, '2025-11-01');
INSERT INTO public.grades VALUES (510, 73, 11, 84, '2025-06-20');
INSERT INTO public.grades VALUES (511, 73, 14, 88, '2025-08-20');
INSERT INTO public.grades VALUES (512, 73, 13, 87, '2025-03-19');
INSERT INTO public.grades VALUES (513, 73, 9, 72, '2025-07-12');
INSERT INTO public.grades VALUES (514, 73, 14, 94, '2025-06-15');
INSERT INTO public.grades VALUES (515, 73, 14, 61, '2025-04-02');
INSERT INTO public.grades VALUES (516, 73, 9, 67, '2025-03-05');
INSERT INTO public.grades VALUES (517, 73, 8, 98, '2025-12-24');
INSERT INTO public.grades VALUES (518, 74, 12, 77, '2025-04-12');
INSERT INTO public.grades VALUES (519, 74, 9, 71, '2025-05-06');
INSERT INTO public.grades VALUES (520, 74, 14, 87, '2025-07-08');
INSERT INTO public.grades VALUES (521, 74, 13, 96, '2025-09-22');
INSERT INTO public.grades VALUES (522, 74, 11, 83, '2025-09-08');
INSERT INTO public.grades VALUES (523, 74, 12, 96, '2025-07-23');
INSERT INTO public.grades VALUES (524, 74, 12, 87, '2025-05-25');
INSERT INTO public.grades VALUES (525, 74, 11, 71, '2025-11-04');
INSERT INTO public.grades VALUES (526, 74, 14, 88, '2025-04-15');
INSERT INTO public.grades VALUES (527, 74, 12, 95, '2025-03-14');
INSERT INTO public.grades VALUES (528, 74, 9, 79, '2025-09-03');
INSERT INTO public.grades VALUES (529, 75, 12, 82, '2025-07-18');
INSERT INTO public.grades VALUES (530, 75, 13, 60, '2025-06-27');
INSERT INTO public.grades VALUES (531, 75, 11, 92, '2025-02-22');
INSERT INTO public.grades VALUES (532, 75, 9, 81, '2025-05-28');
INSERT INTO public.grades VALUES (533, 75, 8, 60, '2025-03-29');
INSERT INTO public.grades VALUES (534, 75, 9, 78, '2025-10-14');
INSERT INTO public.grades VALUES (535, 75, 8, 62, '2025-01-07');
INSERT INTO public.grades VALUES (536, 75, 8, 100, '2025-07-31');
INSERT INTO public.grades VALUES (537, 75, 14, 87, '2025-01-06');
INSERT INTO public.grades VALUES (538, 75, 8, 100, '2025-05-20');
INSERT INTO public.grades VALUES (539, 75, 9, 69, '2025-06-10');
INSERT INTO public.grades VALUES (540, 75, 8, 81, '2025-06-25');
INSERT INTO public.grades VALUES (541, 75, 12, 79, '2025-09-19');
INSERT INTO public.grades VALUES (542, 75, 11, 61, '2025-04-22');
INSERT INTO public.grades VALUES (543, 75, 9, 80, '2025-06-14');
INSERT INTO public.grades VALUES (544, 75, 8, 87, '2025-07-11');
INSERT INTO public.grades VALUES (545, 75, 10, 90, '2025-11-27');
INSERT INTO public.grades VALUES (546, 75, 8, 69, '2025-07-13');
INSERT INTO public.grades VALUES (547, 75, 8, 89, '2025-12-18');
INSERT INTO public.grades VALUES (548, 76, 9, 91, '2025-09-10');
INSERT INTO public.grades VALUES (549, 76, 13, 76, '2025-03-12');
INSERT INTO public.grades VALUES (550, 76, 10, 98, '2025-03-07');
INSERT INTO public.grades VALUES (551, 76, 12, 85, '2025-01-08');
INSERT INTO public.grades VALUES (552, 76, 12, 71, '2025-03-21');
INSERT INTO public.grades VALUES (553, 76, 12, 69, '2025-08-18');
INSERT INTO public.grades VALUES (554, 76, 13, 67, '2025-03-17');
INSERT INTO public.grades VALUES (555, 76, 14, 99, '2025-03-09');
INSERT INTO public.grades VALUES (556, 76, 14, 90, '2025-08-11');
INSERT INTO public.grades VALUES (557, 76, 14, 64, '2025-03-06');
INSERT INTO public.grades VALUES (558, 76, 11, 91, '2025-01-28');
INSERT INTO public.grades VALUES (559, 76, 8, 85, '2025-04-12');
INSERT INTO public.grades VALUES (560, 76, 10, 90, '2025-07-20');
INSERT INTO public.grades VALUES (561, 76, 11, 94, '2025-07-05');
INSERT INTO public.grades VALUES (562, 76, 11, 69, '2025-03-25');
INSERT INTO public.grades VALUES (563, 76, 13, 62, '2025-11-06');
INSERT INTO public.grades VALUES (564, 77, 8, 62, '2025-05-21');
INSERT INTO public.grades VALUES (565, 77, 9, 95, '2025-09-05');
INSERT INTO public.grades VALUES (566, 77, 14, 79, '2025-03-06');
INSERT INTO public.grades VALUES (567, 77, 13, 98, '2025-05-20');
INSERT INTO public.grades VALUES (568, 77, 14, 88, '2025-07-03');
INSERT INTO public.grades VALUES (569, 77, 14, 99, '2025-08-31');
INSERT INTO public.grades VALUES (570, 77, 12, 61, '2025-05-05');
INSERT INTO public.grades VALUES (571, 77, 14, 64, '2025-04-03');
INSERT INTO public.grades VALUES (572, 77, 10, 79, '2025-06-19');
INSERT INTO public.grades VALUES (573, 77, 11, 73, '2025-01-23');
INSERT INTO public.grades VALUES (574, 77, 10, 91, '2025-03-28');
INSERT INTO public.grades VALUES (575, 77, 9, 66, '2025-07-19');
INSERT INTO public.grades VALUES (576, 77, 13, 62, '2025-05-22');
INSERT INTO public.grades VALUES (577, 77, 13, 83, '2025-05-22');
INSERT INTO public.grades VALUES (578, 77, 11, 91, '2025-07-11');
INSERT INTO public.grades VALUES (579, 77, 13, 83, '2025-07-20');
INSERT INTO public.grades VALUES (580, 77, 11, 70, '2025-03-13');
INSERT INTO public.grades VALUES (581, 78, 8, 71, '2025-09-09');
INSERT INTO public.grades VALUES (582, 78, 12, 89, '2025-11-02');
INSERT INTO public.grades VALUES (583, 78, 8, 75, '2025-03-17');
INSERT INTO public.grades VALUES (584, 78, 13, 64, '2025-10-31');
INSERT INTO public.grades VALUES (585, 78, 10, 90, '2025-02-01');
INSERT INTO public.grades VALUES (586, 78, 11, 94, '2025-07-01');
INSERT INTO public.grades VALUES (587, 78, 8, 76, '2025-04-01');
INSERT INTO public.grades VALUES (588, 78, 13, 100, '2025-12-07');
INSERT INTO public.grades VALUES (589, 78, 10, 87, '2025-06-13');
INSERT INTO public.grades VALUES (590, 78, 14, 81, '2025-08-21');
INSERT INTO public.grades VALUES (591, 78, 10, 63, '2025-10-28');
INSERT INTO public.grades VALUES (592, 78, 12, 95, '2025-01-10');
INSERT INTO public.grades VALUES (593, 78, 14, 73, '2025-05-16');
INSERT INTO public.grades VALUES (594, 78, 11, 80, '2025-05-19');
INSERT INTO public.grades VALUES (595, 78, 8, 74, '2025-07-17');
INSERT INTO public.grades VALUES (596, 78, 11, 99, '2025-08-15');
INSERT INTO public.grades VALUES (597, 78, 14, 63, '2025-07-31');
INSERT INTO public.grades VALUES (598, 78, 12, 78, '2025-07-11');
INSERT INTO public.grades VALUES (599, 78, 10, 99, '2025-12-12');
INSERT INTO public.grades VALUES (600, 79, 13, 96, '2025-06-07');
INSERT INTO public.grades VALUES (601, 79, 13, 98, '2025-10-22');
INSERT INTO public.grades VALUES (602, 79, 10, 79, '2025-06-08');
INSERT INTO public.grades VALUES (603, 79, 9, 81, '2025-10-02');
INSERT INTO public.grades VALUES (604, 79, 9, 63, '2025-03-21');
INSERT INTO public.grades VALUES (605, 79, 14, 94, '2025-08-24');
INSERT INTO public.grades VALUES (606, 79, 13, 71, '2025-09-02');
INSERT INTO public.grades VALUES (607, 79, 9, 61, '2025-02-13');
INSERT INTO public.grades VALUES (608, 79, 12, 71, '2025-08-14');
INSERT INTO public.grades VALUES (609, 79, 14, 85, '2025-09-21');
INSERT INTO public.grades VALUES (610, 79, 14, 80, '2025-04-14');
INSERT INTO public.grades VALUES (611, 79, 13, 98, '2025-08-05');
INSERT INTO public.grades VALUES (612, 80, 9, 99, '2025-08-24');
INSERT INTO public.grades VALUES (613, 80, 14, 62, '2025-04-06');
INSERT INTO public.grades VALUES (614, 80, 11, 68, '2025-11-23');
INSERT INTO public.grades VALUES (615, 80, 13, 68, '2025-05-23');
INSERT INTO public.grades VALUES (616, 80, 12, 99, '2025-11-26');
INSERT INTO public.grades VALUES (617, 80, 11, 63, '2025-04-19');
INSERT INTO public.grades VALUES (618, 80, 11, 79, '2025-10-17');
INSERT INTO public.grades VALUES (619, 80, 10, 96, '2025-04-04');
INSERT INTO public.grades VALUES (620, 80, 12, 85, '2025-03-14');
INSERT INTO public.grades VALUES (621, 80, 12, 87, '2025-06-13');
INSERT INTO public.grades VALUES (622, 80, 11, 66, '2025-09-27');
INSERT INTO public.grades VALUES (623, 80, 14, 74, '2025-08-30');
INSERT INTO public.grades VALUES (624, 80, 13, 83, '2025-12-26');
INSERT INTO public.grades VALUES (625, 80, 10, 82, '2025-01-21');
INSERT INTO public.grades VALUES (626, 80, 14, 76, '2025-09-12');
INSERT INTO public.grades VALUES (627, 80, 10, 73, '2025-02-02');


--
-- TOC entry 3460 (class 0 OID 16385)
-- Dependencies: 218
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.groups VALUES (4, 'КН-11');
INSERT INTO public.groups VALUES (5, 'КН-12');
INSERT INTO public.groups VALUES (6, 'КН-13');


--
-- TOC entry 3462 (class 0 OID 16392)
-- Dependencies: 220
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.students VALUES (41, 'Надія Єременко', 6);
INSERT INTO public.students VALUES (42, 'Журавель Святослава Данівна', 5);
INSERT INTO public.students VALUES (43, 'Григорій Байрак', 6);
INSERT INTO public.students VALUES (44, 'Ліза Дубенко', 5);
INSERT INTO public.students VALUES (45, 'Романенко Василь Григорійович', 6);
INSERT INTO public.students VALUES (46, 'Євген Дахно', 5);
INSERT INTO public.students VALUES (47, 'Руслан Цушко', 6);
INSERT INTO public.students VALUES (48, 'Марина Пелех', 4);
INSERT INTO public.students VALUES (49, 'пан Теодор Михайличенко', 6);
INSERT INTO public.students VALUES (50, 'Панчук Любов Теодорівна', 5);
INSERT INTO public.students VALUES (51, 'Мирон Фурс', 5);
INSERT INTO public.students VALUES (52, 'Габелко Охрім Тарасович', 5);
INSERT INTO public.students VALUES (53, 'Онисим Баштан', 4);
INSERT INTO public.students VALUES (54, 'Ада Бабʼюк', 6);
INSERT INTO public.students VALUES (55, 'Мирон Товстуха', 6);
INSERT INTO public.students VALUES (56, 'Давид Швайка', 5);
INSERT INTO public.students VALUES (57, 'Данна Сагаль', 4);
INSERT INTO public.students VALUES (58, 'Михайлина Аронець', 4);
INSERT INTO public.students VALUES (59, 'Еріка Ярема', 6);
INSERT INTO public.students VALUES (60, 'Вʼячеслав Остапчук', 5);
INSERT INTO public.students VALUES (61, 'Василь Жученко', 6);
INSERT INTO public.students VALUES (62, 'добродій Богодар Воблий', 5);
INSERT INTO public.students VALUES (63, 'Ганна Уманець', 4);
INSERT INTO public.students VALUES (64, 'Борислав Тарасенко', 4);
INSERT INTO public.students VALUES (65, 'Едита Корсун', 4);
INSERT INTO public.students VALUES (66, 'Ірена Хоменко', 4);
INSERT INTO public.students VALUES (67, 'Омелян Вітер', 5);
INSERT INTO public.students VALUES (68, 'Пилип Удовиченко', 6);
INSERT INTO public.students VALUES (69, 'Устим Таран', 4);
INSERT INTO public.students VALUES (70, 'Кирило Парасюк', 6);
INSERT INTO public.students VALUES (71, 'Абраменко Іван Яковович', 6);
INSERT INTO public.students VALUES (72, 'Світлана Дараган', 5);
INSERT INTO public.students VALUES (73, 'Анжела Швачка', 6);
INSERT INTO public.students VALUES (74, 'добродій Венедикт Хорішко', 6);
INSERT INTO public.students VALUES (75, 'Іваничук Христина Ігорівна', 4);
INSERT INTO public.students VALUES (76, 'Світлана Пелех', 6);
INSERT INTO public.students VALUES (77, 'Вʼячеслав Удовиченко', 4);
INSERT INTO public.students VALUES (78, 'Геннадій Фастенко', 4);
INSERT INTO public.students VALUES (79, 'Корбут Тетяна Феофанівна', 6);
INSERT INTO public.students VALUES (80, 'Михайлина Єсипенко', 6);


--
-- TOC entry 3466 (class 0 OID 16411)
-- Dependencies: 224
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subjects VALUES (8, 'Бази даних', 8);
INSERT INTO public.subjects VALUES (9, 'Математика', 10);
INSERT INTO public.subjects VALUES (10, 'Програмування', 10);
INSERT INTO public.subjects VALUES (11, 'Алгоритми', 9);
INSERT INTO public.subjects VALUES (12, 'Операційні системи', 10);
INSERT INTO public.subjects VALUES (13, 'Комп''ютерні мережі', 10);
INSERT INTO public.subjects VALUES (14, 'Веб-технології', 6);


--
-- TOC entry 3464 (class 0 OID 16404)
-- Dependencies: 222
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.teachers VALUES (6, 'Олекса Калениченко');
INSERT INTO public.teachers VALUES (7, 'Арсен Килимник');
INSERT INTO public.teachers VALUES (8, 'Стус Хома Ростиславович');
INSERT INTO public.teachers VALUES (9, 'Ада Ткаченко');
INSERT INTO public.teachers VALUES (10, 'Михайлюк Леон Стефанович');


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 225
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grades_id_seq', 627, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 217
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.groups_id_seq', 6, true);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 219
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_id_seq', 80, true);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 223
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subjects_id_seq', 14, true);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 221
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teachers_id_seq', 10, true);


--
-- TOC entry 3309 (class 2606 OID 16429)
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 16390)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 16397)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 16416)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 16409)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- TOC entry 3312 (class 2606 OID 16430)
-- Name: grades grades_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 3313 (class 2606 OID 16435)
-- Name: grades grades_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id) ON DELETE CASCADE;


--
-- TOC entry 3310 (class 2606 OID 16398)
-- Name: students students_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;


--
-- TOC entry 3311 (class 2606 OID 16417)
-- Name: subjects subjects_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) ON DELETE CASCADE;


-- Completed on 2025-12-30 21:35:37

--
-- PostgreSQL database dump complete
--

