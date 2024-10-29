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
    name character varying(100) NOT NULL,
    description text,
    galaxy_type character varying(50),
    age_in_millions_of_years integer,
    has_life boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    radius numeric NOT NULL,
    composition text,
    has_atmosphere boolean NOT NULL
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    planet_type character varying(50),
    has_life boolean NOT NULL,
    distance_from_earth integer
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
-- Name: satellite_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite_mission (
    satellite_mission_id integer NOT NULL,
    name character varying(100) NOT NULL,
    years integer
);


ALTER TABLE public.satellite_mission OWNER TO freecodecamp;

--
-- Name: satellite_mission_satellite_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_mission_satellite_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_mission_satellite_mission_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_mission_satellite_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_mission_satellite_mission_id_seq OWNED BY public.satellite_mission.satellite_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    star_type character varying(50),
    mass numeric NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite_mission satellite_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite_mission ALTER COLUMN satellite_mission_id SET DEFAULT nextval('public.satellite_mission_satellite_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', 'Spiral', 10000, false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'A stunning galaxy with a bright core', 'Elliptical', 13000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous for its spiral arms', 'Spiral', 15000, false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Third-largest galaxy in Local Group', 'Spiral', 9500, false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', 'Irregular', 12000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 5, 1737.4, 'Rocky', false);
INSERT INTO public.moon VALUES (22, 'Phobos', 6, 11.2, 'Rocky', false);
INSERT INTO public.moon VALUES (23, 'Deimos', 6, 6.2, 'Rocky', false);
INSERT INTO public.moon VALUES (24, 'Europa', 7, 1561, 'Ice/Rock', true);
INSERT INTO public.moon VALUES (25, 'Ganymede', 7, 2634, 'Ice/Rock', true);
INSERT INTO public.moon VALUES (26, 'Io', 7, 1821.6, 'Volcanic', true);
INSERT INTO public.moon VALUES (27, 'Callisto', 7, 2410.3, 'Ice/Rock', true);
INSERT INTO public.moon VALUES (28, 'Kepler Moon', 9, 1737, 'Unknown', false);
INSERT INTO public.moon VALUES (29, 'TRAPPIST-1 Moon 1', 10, 1500, 'Ice/Rock', true);
INSERT INTO public.moon VALUES (30, 'TRAPPIST-1 Moon 2', 10, 1300, 'Ice/Rock', true);
INSERT INTO public.moon VALUES (31, 'TRAPPIST-1 Moon 3', 10, 1100, 'Ice/Rock', true);
INSERT INTO public.moon VALUES (32, 'HD Moon', 11, 1400, 'Rocky', false);
INSERT INTO public.moon VALUES (33, 'Vega Moon A', 12, 1200, 'Unknown', false);
INSERT INTO public.moon VALUES (34, 'Vega Moon B', 12, 1400, 'Unknown', false);
INSERT INTO public.moon VALUES (35, 'Alpha Moon 1', 16, 1500, 'Rocky', false);
INSERT INTO public.moon VALUES (36, 'Alpha Moon 2', 16, 1200, 'Rocky', false);
INSERT INTO public.moon VALUES (37, 'Rigel Moon 1', 15, 1600, 'Unknown', true);
INSERT INTO public.moon VALUES (38, 'Rigel Moon 2', 15, 1550, 'Unknown', true);
INSERT INTO public.moon VALUES (39, 'Betelgeuse Moon 1', 14, 1450, 'Unknown', false);
INSERT INTO public.moon VALUES (40, 'Betelgeuse Moon 2', 14, 1500, 'Unknown', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Earth', 1, 'Terrestrial', true, 0);
INSERT INTO public.planet VALUES (6, 'Mars', 1, 'Terrestrial', false, 54);
INSERT INTO public.planet VALUES (7, 'Jupiter', 1, 'Gas giant', false, 588);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri b', 4, 'Exoplanet', false, 4);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, 'Exoplanet', false, 620);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 2, 'Terrestrial', false, 39);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 2, 'Gas giant', false, 150);
INSERT INTO public.planet VALUES (12, 'Vega Planet One', 5, 'Exoplanet', false, 25);
INSERT INTO public.planet VALUES (13, 'Tau Ceti f', 4, 'Super-Earth', false, 12);
INSERT INTO public.planet VALUES (14, 'Betelgeuse b', 3, 'Gas giant', false, 643);
INSERT INTO public.planet VALUES (15, 'Rigel b', 6, 'Gas giant', false, 860);
INSERT INTO public.planet VALUES (16, 'Alpha Centauri Bb', 4, 'Terrestrial', false, 4);


--
-- Data for Name: satellite_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite_mission VALUES (1, 'Apollo 11', NULL);
INSERT INTO public.satellite_mission VALUES (2, 'Mars Rover', NULL);
INSERT INTO public.satellite_mission VALUES (3, 'Voyager 1', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1.989, true);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 'A-type', 2.063, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red supergiant', 20.0, true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 1, 'G-type', 1.1, true);
INSERT INTO public.star VALUES (5, 'Vega', 3, 'A-type', 2.135, true);
INSERT INTO public.star VALUES (6, 'Rigel', 4, 'Blue supergiant', 21.0, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: satellite_mission_satellite_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_mission_satellite_mission_id_seq', 3, true);


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
-- Name: satellite_mission satellite_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite_mission
    ADD CONSTRAINT satellite_mission_name_key UNIQUE (name);


--
-- Name: satellite_mission satellite_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite_mission
    ADD CONSTRAINT satellite_mission_pkey PRIMARY KEY (satellite_mission_id);


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

