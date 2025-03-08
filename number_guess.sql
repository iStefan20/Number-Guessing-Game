--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_guesses integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 13, 3);
INSERT INTO public.games VALUES (2, 561, 3);
INSERT INTO public.games VALUES (3, 484, 3);
INSERT INTO public.games VALUES (4, 148, 3);
INSERT INTO public.games VALUES (5, 281, 3);
INSERT INTO public.games VALUES (6, 94, 3);
INSERT INTO public.games VALUES (7, 121, 3);
INSERT INTO public.games VALUES (8, 408, 3);
INSERT INTO public.games VALUES (9, 971, 3);
INSERT INTO public.games VALUES (10, 878, 3);
INSERT INTO public.games VALUES (11, 11, 3);
INSERT INTO public.games VALUES (12, 248, 3);
INSERT INTO public.games VALUES (13, 838, 3);
INSERT INTO public.games VALUES (14, 301, 3);
INSERT INTO public.games VALUES (15, 366, 3);
INSERT INTO public.games VALUES (16, 767, 3);
INSERT INTO public.games VALUES (17, 193, 3);
INSERT INTO public.games VALUES (18, 484, 3);
INSERT INTO public.games VALUES (19, 561, 3);
INSERT INTO public.games VALUES (20, 142, 3);
INSERT INTO public.games VALUES (21, 809, 3);
INSERT INTO public.games VALUES (22, 57, 3);
INSERT INTO public.games VALUES (23, 650, 3);
INSERT INTO public.games VALUES (24, 900, 3);
INSERT INTO public.games VALUES (25, 415, 3);
INSERT INTO public.games VALUES (26, 639, 3);
INSERT INTO public.games VALUES (27, 836, 3);
INSERT INTO public.games VALUES (28, 578, 3);
INSERT INTO public.games VALUES (29, 778, 3);
INSERT INTO public.games VALUES (30, 101, 46);
INSERT INTO public.games VALUES (31, 203, 46);
INSERT INTO public.games VALUES (32, 43, 47);
INSERT INTO public.games VALUES (33, 457, 47);
INSERT INTO public.games VALUES (34, 698, 46);
INSERT INTO public.games VALUES (35, 296, 46);
INSERT INTO public.games VALUES (36, 973, 46);
INSERT INTO public.games VALUES (37, 406, 48);
INSERT INTO public.games VALUES (38, 417, 48);
INSERT INTO public.games VALUES (39, 808, 49);
INSERT INTO public.games VALUES (40, 523, 49);
INSERT INTO public.games VALUES (41, 857, 48);
INSERT INTO public.games VALUES (42, 62, 48);
INSERT INTO public.games VALUES (43, 899, 48);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1741470221715');
INSERT INTO public.users VALUES (2, 'user_1741470221714');
INSERT INTO public.users VALUES (3, '');
INSERT INTO public.users VALUES (45, 'Stefan');
INSERT INTO public.users VALUES (46, 'user_1741471957350');
INSERT INTO public.users VALUES (47, 'user_1741471957349');
INSERT INTO public.users VALUES (48, 'user_1741471981459');
INSERT INTO public.users VALUES (49, 'user_1741471981458');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 43, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 49, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

