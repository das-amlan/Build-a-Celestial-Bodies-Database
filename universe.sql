--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    galaxy_types text,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: number_of_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_of_star (
    number_of_star_id integer NOT NULL,
    number_in_billion integer,
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.number_of_star OWNER TO freecodecamp;

--
-- Name: number_of_star_number_of_stars_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_of_star_number_of_stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_of_star_number_of_stars_id_seq OWNER TO freecodecamp;

--
-- Name: number_of_star_number_of_stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_of_star_number_of_stars_id_seq OWNED BY public.number_of_star.number_of_star_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_types text,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,5) NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_types text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,5) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: number_of_star number_of_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_of_star ALTER COLUMN number_of_star_id SET DEFAULT nextval('public.number_of_star_number_of_stars_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Large Magellanic Cloud', 'Nubecula Major', 'satellite dwarf galaxy', 158200, 2400);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Inlcude the solar system', 'Spiral galaxy', 0, 13000);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Messier 31', 'Spiral galaxy', 3, 10100);
INSERT INTO public.galaxy VALUES (4, 'NGC 292', 'Small Magellanic Cloud', 'Barred Spiral galaxy', 199000, 0);
INSERT INTO public.galaxy VALUES (6, 'Black eye galaxy', 'M64', 'Isolated Spiral galaxy', 17000000, 13280);
INSERT INTO public.galaxy VALUES (7, 'Messier 81', 'NGC 3031', 'Spiral galaxy', 12000000, 13310);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4051, true, 'Rocky and Dusty', 1);
INSERT INTO public.moon VALUES (2, 'Titan', 4003, true, 'Dense', 2);
INSERT INTO public.moon VALUES (3, 'Enceladus', 1000, true, 'Icey', 2);
INSERT INTO public.moon VALUES (4, 'Mimas', 4100, false, 'rounded', 2);
INSERT INTO public.moon VALUES (5, 'Phobos', 2890, false, 'Rocky', 3);
INSERT INTO public.moon VALUES (6, 'Deimos', 2290, false, 'Gas', 3);
INSERT INTO public.moon VALUES (7, 'Centax-1', 1212, true, 'Red', 3);
INSERT INTO public.moon VALUES (8, 'Centax-2', 1432, true, 'Icey', 4);
INSERT INTO public.moon VALUES (9, 'Centax-3', 1478, true, 'Icey', 4);
INSERT INTO public.moon VALUES (10, 'LHS 20 A 1 A', 8631, true, 'Icy', 5);
INSERT INTO public.moon VALUES (11, 'LHS 20 A 1 B', 3631, false, 'Dense', 5);
INSERT INTO public.moon VALUES (12, 'LHS 20 A 1 C', 7331, false, 'Rocky', 6);
INSERT INTO public.moon VALUES (13, 'LHS 20 A 2 A', 7392, false, 'Gas', 6);
INSERT INTO public.moon VALUES (14, 'LHS 20 A 2 B', 7291, true, 'Gas', 7);
INSERT INTO public.moon VALUES (15, 'LHS 20 A 2 C', 7171, true, 'Rocky', 7);
INSERT INTO public.moon VALUES (16, 'LHS 20 A 3 A', 5362, false, 'Rocky', 7);
INSERT INTO public.moon VALUES (17, 'LHS 20 A 3 B', 5354, false, 'Icy', 8);
INSERT INTO public.moon VALUES (18, 'LHS 20 A 3 C', 6358, false, 'Dense', 8);
INSERT INTO public.moon VALUES (19, 'Otomatone', 8596, true, 'Rocky', 9);
INSERT INTO public.moon VALUES (20, 'Hesperidium', 8732, true, 'Rocky', 10);


--
-- Data for Name: number_of_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_of_star VALUES (1, 30, 1, 'Large Magellanic');
INSERT INTO public.number_of_star VALUES (2, 100, 2, 'Milky Way');
INSERT INTO public.number_of_star VALUES (3, 1000, 3, 'Andromeda');
INSERT INTO public.number_of_star VALUES (4, 0, 4, 'NGC292');
INSERT INTO public.number_of_star VALUES (5, 100, 6, 'Black Eye');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Rocky', true, 4543, 0.00000, 2);
INSERT INTO public.planet VALUES (2, 'Saturn', 'Gas', false, 4503, 1.61540, 2);
INSERT INTO public.planet VALUES (3, 'Mars', 'Rocky Red', false, 4603, 151.34000, 2);
INSERT INTO public.planet VALUES (4, 'LHS 20 A 1', 'Small Rocky', false, 56655, 220.24000, 1);
INSERT INTO public.planet VALUES (5, 'LHS 20 A 3', 'Large Icy body', false, 56652, 1232.24000, 1);
INSERT INTO public.planet VALUES (6, 'LHS 20 A 4', 'Large Gas body', false, 56562, 4332.24000, 1);
INSERT INTO public.planet VALUES (7, 'Sigint', 'Rocky', false, 12234, 642.24000, 3);
INSERT INTO public.planet VALUES (8, 'Barre', 'Red', false, 14546, 1642.24000, 3);
INSERT INTO public.planet VALUES (9, 'Omicron', 'Not avilable', false, 54546, 1485.12000, 4);
INSERT INTO public.planet VALUES (10, 'Omega', 'Not avilable', false, 3624, 1332.12000, 5);
INSERT INTO public.planet VALUES (11, 'Coruscant', 'Not avilable', false, 45632, 523.12000, 6);
INSERT INTO public.planet VALUES (12, 'Fanklins Keep', 'Not avilable', false, 41234, 332.42000, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'R71', 'blue supergiant', 2700, 3545.25000, 1);
INSERT INTO public.star VALUES (2, 'Sun', 'Yello dwarf', 4603, 147.73000, 2);
INSERT INTO public.star VALUES (3, 'Canopus', 'Giant', 0, 309.80000, 2);
INSERT INTO public.star VALUES (4, 'Mirach', 'Red giant', 0, 9460.73047, 3);
INSERT INTO public.star VALUES (5, 'Alpheratz', 'B-type', 60, 9460.73047, 3);
INSERT INTO public.star VALUES (6, 'Alpha Ursae Majoris', 'KOII+FOV', 0, 1.16400, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: number_of_star_number_of_stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_of_star_number_of_stars_id_seq', 33, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: number_of_star number_of_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_of_star
    ADD CONSTRAINT number_of_star_name_key UNIQUE (name);


--
-- Name: number_of_star number_of_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_of_star
    ADD CONSTRAINT number_of_star_pkey PRIMARY KEY (number_of_star_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: number_of_star number_of_star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_of_star
    ADD CONSTRAINT number_of_star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

