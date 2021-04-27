--
-- PostgreSQL database dump
--

-- Dumped from database version 11.10
-- Dumped by pg_dump version 11.10

-- Started on 2021-03-18 20:21:59 CET

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

SET default_with_oids = false;

--
-- TOC entry 203 (class 1259 OID 16621)
-- Name: address; Type: TABLE; Schema: public; Owner: admin_ocpizza
--

CREATE TABLE public.address (
    id integer NOT NULL,
    civility character(1) NOT NULL,
    last_name character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    street text NOT NULL,
    city character varying(30) NOT NULL,
    postal_code character(5) NOT NULL,
    phone character(10) NOT NULL
);


ALTER TABLE public.address OWNER TO admin_ocpizza;

--
-- TOC entry 202 (class 1259 OID 16619)
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_ocpizza
--

CREATE SEQUENCE public.address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO admin_ocpizza;

--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 202
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_ocpizza
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- TOC entry 210 (class 1259 OID 16654)
-- Name: admin; Type: TABLE; Schema: public; Owner: admin_ocpizza
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_address integer NOT NULL,
    id_pizzeria integer NOT NULL
);


ALTER TABLE public.admin OWNER TO admin_ocpizza;

--
-- TOC entry 209 (class 1259 OID 16652)
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_ocpizza
--

CREATE SEQUENCE public.admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_id_seq OWNER TO admin_ocpizza;

--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 209
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_ocpizza
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- TOC entry 206 (class 1259 OID 16639)
-- Name: bill; Type: TABLE; Schema: public; Owner: admin_ocpizza
--

CREATE TABLE public.bill (
    id integer NOT NULL,
    id_pizzeria integer NOT NULL,
    date timestamp without time zone NOT NULL,
    price numeric(8,4) NOT NULL
);


ALTER TABLE public.bill OWNER TO admin_ocpizza;

--
-- TOC entry 215 (class 1259 OID 16676)
-- Name: customer; Type: TABLE; Schema: public; Owner: admin_ocpizza
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    id_user integer NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE public.customer OWNER TO admin_ocpizza;

--
-- TOC entry 212 (class 1259 OID 16662)
-- Name: delivery_man; Type: TABLE; Schema: public; Owner: admin_ocpizza
--

CREATE TABLE public.delivery_man (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_address integer NOT NULL,
    id_pizzeria integer NOT NULL
);


ALTER TABLE public.delivery_man OWNER TO admin_ocpizza;

--
-- TOC entry 211 (class 1259 OID 16660)
-- Name: delivery_man_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_ocpizza
--

CREATE SEQUENCE public.delivery_man_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_man_id_seq OWNER TO admin_ocpizza;

--
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 211
-- Name: delivery_man_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_ocpizza
--

ALTER SEQUENCE public.delivery_man_id_seq OWNED BY public.delivery_man.id;


--
-- TOC entry 199 (class 1259 OID 16605)
-- Name: ingredients; Type: TABLE; Schema: public; Owner: admin_ocpizza
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.ingredients OWNER TO admin_ocpizza;

--
-- TOC entry 198 (class 1259 OID 16603)
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_ocpizza
--

CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO admin_ocpizza;

--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 198
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_ocpizza
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- TOC entry 208 (class 1259 OID 16647)
-- Name: order; Type: TABLE; Schema: public; Owner: admin_ocpizza
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    total_price numeric(8,4) NOT NULL,
    deliver boolean NOT NULL,
    id_address integer NOT NULL,
    bill_id integer NOT NULL,
    pizza_id integer NOT NULL
);


ALTER TABLE public."order" OWNER TO admin_ocpizza;

--
-- TOC entry 201 (class 1259 OID 16613)
-- Name: pizza; Type: TABLE; Schema: public; Owner: admin_ocpizza
--

CREATE TABLE public.pizza (
    id integer NOT NULL,
    ingredients_id integer NOT NULL,
    name character varying(30) NOT NULL,
    price numeric(4,2) NOT NULL
);


ALTER TABLE public.pizza OWNER TO admin_ocpizza;

--
-- TOC entry 200 (class 1259 OID 16611)
-- Name: pizza_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_ocpizza
--

CREATE SEQUENCE public.pizza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizza_id_seq OWNER TO admin_ocpizza;

--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 200
-- Name: pizza_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_ocpizza
--

ALTER SEQUENCE public.pizza_id_seq OWNED BY public.pizza.id;


--
-- TOC entry 214 (class 1259 OID 16670)
-- Name: pizzaiolo; Type: TABLE; Schema: public; Owner: admin_ocpizza
--

CREATE TABLE public.pizzaiolo (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_address integer NOT NULL,
    id_pizzeria integer NOT NULL
);


ALTER TABLE public.pizzaiolo OWNER TO admin_ocpizza;

--
-- TOC entry 213 (class 1259 OID 16668)
-- Name: pizzaiolo_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_ocpizza
--

CREATE SEQUENCE public.pizzaiolo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizzaiolo_id_seq OWNER TO admin_ocpizza;

--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 213
-- Name: pizzaiolo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_ocpizza
--

ALTER SEQUENCE public.pizzaiolo_id_seq OWNED BY public.pizzaiolo.id;


--
-- TOC entry 205 (class 1259 OID 16633)
-- Name: pizzeria; Type: TABLE; Schema: public; Owner: admin_ocpizza
--

CREATE TABLE public.pizzeria (
    id integer NOT NULL,
    id_address integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.pizzeria OWNER TO admin_ocpizza;

--
-- TOC entry 204 (class 1259 OID 16631)
-- Name: pizzeria_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_ocpizza
--

CREATE SEQUENCE public.pizzeria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizzeria_id_seq OWNER TO admin_ocpizza;

--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 204
-- Name: pizzeria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_ocpizza
--

ALTER SEQUENCE public.pizzeria_id_seq OWNED BY public.pizzeria.id;


--
-- TOC entry 207 (class 1259 OID 16644)
-- Name: stock; Type: TABLE; Schema: public; Owner: admin_ocpizza
--

CREATE TABLE public.stock (
    id_ingredients integer NOT NULL,
    id_pizzeria integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.stock OWNER TO admin_ocpizza;

--
-- TOC entry 197 (class 1259 OID 16596)
-- Name: user; Type: TABLE; Schema: public; Owner: admin_ocpizza
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    password_hash character varying(30) NOT NULL,
    login character varying(30) NOT NULL
);


ALTER TABLE public."user" OWNER TO admin_ocpizza;

--
-- TOC entry 196 (class 1259 OID 16594)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_ocpizza
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO admin_ocpizza;

--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_ocpizza
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 3064 (class 2604 OID 16624)
-- Name: address id; Type: DEFAULT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- TOC entry 3066 (class 2604 OID 16657)
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- TOC entry 3067 (class 2604 OID 16665)
-- Name: delivery_man id; Type: DEFAULT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.delivery_man ALTER COLUMN id SET DEFAULT nextval('public.delivery_man_id_seq'::regclass);


--
-- TOC entry 3062 (class 2604 OID 16608)
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- TOC entry 3063 (class 2604 OID 16616)
-- Name: pizza id; Type: DEFAULT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.pizza ALTER COLUMN id SET DEFAULT nextval('public.pizza_id_seq'::regclass);


--
-- TOC entry 3068 (class 2604 OID 16673)
-- Name: pizzaiolo id; Type: DEFAULT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.pizzaiolo ALTER COLUMN id SET DEFAULT nextval('public.pizzaiolo_id_seq'::regclass);


--
-- TOC entry 3065 (class 2604 OID 16636)
-- Name: pizzeria id; Type: DEFAULT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.pizzeria ALTER COLUMN id SET DEFAULT nextval('public.pizzeria_id_seq'::regclass);


--
-- TOC entry 3061 (class 2604 OID 16599)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3243 (class 0 OID 16621)
-- Dependencies: 203
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: admin_ocpizza
--

COPY public.address (id, civility, last_name, first_name, street, city, postal_code, phone) FROM stdin;
1	m	pan	peter	5 rue de la grande ours	paris	75000	0123456789
2	m	capitaine	crochet	2 rue de la piraterie	caen	14000	0123456780
3	f	fée	clochette	1 chemin de la foret	ouistreham	14150	0123456781
4	f	darling	wendy	8 impasse de la poussière de fée	hérouville saint clair	14200	0123456782
5	m	poppins	mary	1 place des nuages	paris	75001	0123456785
6	m	rebelle	merida	10 chemin du chateau	caen	14000	0123456784
7	m	prince	ali	2 rue de la dune	hérouville saint clair	14200	0123456799
\.


--
-- TOC entry 3250 (class 0 OID 16654)
-- Dependencies: 210
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: admin_ocpizza
--

COPY public.admin (id, id_user, id_address, id_pizzeria) FROM stdin;
1	1	5	1
\.


--
-- TOC entry 3246 (class 0 OID 16639)
-- Dependencies: 206
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: admin_ocpizza
--

COPY public.bill (id, id_pizzeria, date, price) FROM stdin;
1	2	2021-09-03 18:05:00	10.2000
\.


--
-- TOC entry 3255 (class 0 OID 16676)
-- Dependencies: 215
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: admin_ocpizza
--

COPY public.customer (id, id_user, address_id) FROM stdin;
1	2	6
\.


--
-- TOC entry 3252 (class 0 OID 16662)
-- Dependencies: 212
-- Data for Name: delivery_man; Type: TABLE DATA; Schema: public; Owner: admin_ocpizza
--

COPY public.delivery_man (id, id_user, id_address, id_pizzeria) FROM stdin;
1	3	3	2
2	4	4	2
\.


--
-- TOC entry 3239 (class 0 OID 16605)
-- Dependencies: 199
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: admin_ocpizza
--

COPY public.ingredients (id, name) FROM stdin;
1	créme
2	lardon
3	sauce tomate
4	champignon
5	mozzarela
\.


--
-- TOC entry 3248 (class 0 OID 16647)
-- Dependencies: 208
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: admin_ocpizza
--

COPY public."order" (id, date, total_price, deliver, id_address, bill_id, pizza_id) FROM stdin;
1	2021-09-03 18:00:00	10.2000	f	6	1	3
\.


--
-- TOC entry 3241 (class 0 OID 16613)
-- Dependencies: 201
-- Data for Name: pizza; Type: TABLE DATA; Schema: public; Owner: admin_ocpizza
--

COPY public.pizza (id, ingredients_id, name, price) FROM stdin;
1	3	simple	9.80
2	1	creme fraiche	8.75
3	4	champignon	10.20
\.


--
-- TOC entry 3254 (class 0 OID 16670)
-- Dependencies: 214
-- Data for Name: pizzaiolo; Type: TABLE DATA; Schema: public; Owner: admin_ocpizza
--

COPY public.pizzaiolo (id, id_user, id_address, id_pizzeria) FROM stdin;
1	5	7	2
\.


--
-- TOC entry 3245 (class 0 OID 16633)
-- Dependencies: 205
-- Data for Name: pizzeria; Type: TABLE DATA; Schema: public; Owner: admin_ocpizza
--

COPY public.pizzeria (id, id_address, name) FROM stdin;
1	1	Pizza World Paris
2	2	Pizza World Caen
\.


--
-- TOC entry 3247 (class 0 OID 16644)
-- Dependencies: 207
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: admin_ocpizza
--

COPY public.stock (id_ingredients, id_pizzeria, quantity) FROM stdin;
1	1	10
2	1	2
3	2	14
\.


--
-- TOC entry 3237 (class 0 OID 16596)
-- Dependencies: 197
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: admin_ocpizza
--

COPY public."user" (id, password_hash, login) FROM stdin;
1	dffhgdnujtfg	Olaf
2	dljksnzksnsz	Anna
3	aapieehieulq	Sven
4	pixsdsbdugkl	Elsa
5	khdzeuhcloen	Kristoff
\.


--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 202
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_ocpizza
--

SELECT pg_catalog.setval('public.address_id_seq', 7, true);


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 209
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_ocpizza
--

SELECT pg_catalog.setval('public.admin_id_seq', 1, false);


--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 211
-- Name: delivery_man_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_ocpizza
--

SELECT pg_catalog.setval('public.delivery_man_id_seq', 1, false);


--
-- TOC entry 3272 (class 0 OID 0)
-- Dependencies: 198
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_ocpizza
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 5, true);


--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 200
-- Name: pizza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_ocpizza
--

SELECT pg_catalog.setval('public.pizza_id_seq', 1, false);


--
-- TOC entry 3274 (class 0 OID 0)
-- Dependencies: 213
-- Name: pizzaiolo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_ocpizza
--

SELECT pg_catalog.setval('public.pizzaiolo_id_seq', 1, false);


--
-- TOC entry 3275 (class 0 OID 0)
-- Dependencies: 204
-- Name: pizzeria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_ocpizza
--

SELECT pg_catalog.setval('public.pizzeria_id_seq', 1, true);


--
-- TOC entry 3276 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_ocpizza
--

SELECT pg_catalog.setval('public.user_id_seq', 5, true);


--
-- TOC entry 3078 (class 2606 OID 16629)
-- Name: address address_pk; Type: CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pk PRIMARY KEY (id);


--
-- TOC entry 3086 (class 2606 OID 16659)
-- Name: admin admin_pk; Type: CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pk PRIMARY KEY (id);


--
-- TOC entry 3082 (class 2606 OID 16643)
-- Name: bill bill_pk; Type: CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pk PRIMARY KEY (id);


--
-- TOC entry 3092 (class 2606 OID 16680)
-- Name: customer customer_pk; Type: CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pk PRIMARY KEY (id);


--
-- TOC entry 3088 (class 2606 OID 16667)
-- Name: delivery_man delivery_man_pk; Type: CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.delivery_man
    ADD CONSTRAINT delivery_man_pk PRIMARY KEY (id);


--
-- TOC entry 3073 (class 2606 OID 16610)
-- Name: ingredients ingredients_pk; Type: CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pk PRIMARY KEY (id);


--
-- TOC entry 3084 (class 2606 OID 16651)
-- Name: order order_pk; Type: CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 3075 (class 2606 OID 16618)
-- Name: pizza pizza_pk; Type: CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pk PRIMARY KEY (id);


--
-- TOC entry 3090 (class 2606 OID 16675)
-- Name: pizzaiolo pizzaiolo_pk; Type: CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.pizzaiolo
    ADD CONSTRAINT pizzaiolo_pk PRIMARY KEY (id);


--
-- TOC entry 3080 (class 2606 OID 16638)
-- Name: pizzeria pizzeria_pk; Type: CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.pizzeria
    ADD CONSTRAINT pizzeria_pk PRIMARY KEY (id);


--
-- TOC entry 3071 (class 2606 OID 16601)
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- TOC entry 3076 (class 1259 OID 16630)
-- Name: address_idx; Type: INDEX; Schema: public; Owner: admin_ocpizza
--

CREATE INDEX address_idx ON public.address USING btree (city, postal_code);


--
-- TOC entry 3069 (class 1259 OID 16602)
-- Name: user_idx; Type: INDEX; Schema: public; Owner: admin_ocpizza
--

CREATE UNIQUE INDEX user_idx ON public."user" USING btree (password_hash, login);


--
-- TOC entry 3101 (class 2606 OID 16751)
-- Name: order address_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT address_order_fk FOREIGN KEY (id_address) REFERENCES public.address(id);


--
-- TOC entry 3094 (class 2606 OID 16746)
-- Name: pizzeria address_pizzeria_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.pizzeria
    ADD CONSTRAINT address_pizzeria_fk FOREIGN KEY (id_address) REFERENCES public.address(id);


--
-- TOC entry 3102 (class 2606 OID 16781)
-- Name: order bill_oder_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT bill_oder_fk FOREIGN KEY (id) REFERENCES public.bill(id);


--
-- TOC entry 3103 (class 2606 OID 16786)
-- Name: order bill_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT bill_order_fk FOREIGN KEY (bill_id) REFERENCES public.bill(id);


--
-- TOC entry 3093 (class 2606 OID 16706)
-- Name: pizza ingredients_pizza_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT ingredients_pizza_fk FOREIGN KEY (ingredients_id) REFERENCES public.ingredients(id);


--
-- TOC entry 3096 (class 2606 OID 16701)
-- Name: stock ingredients_stock_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT ingredients_stock_fk FOREIGN KEY (id_ingredients) REFERENCES public.ingredients(id);


--
-- TOC entry 3098 (class 2606 OID 16711)
-- Name: order pizza_oder_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT pizza_oder_fk FOREIGN KEY (id) REFERENCES public.pizza(id);


--
-- TOC entry 3099 (class 2606 OID 16716)
-- Name: order pizza_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT pizza_order_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(id);


--
-- TOC entry 3106 (class 2606 OID 16766)
-- Name: admin pizzeria_admin_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT pizzeria_admin_fk FOREIGN KEY (id_pizzeria) REFERENCES public.pizzeria(id);


--
-- TOC entry 3095 (class 2606 OID 16761)
-- Name: bill pizzeria_bill_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT pizzeria_bill_fk FOREIGN KEY (id_pizzeria) REFERENCES public.pizzeria(id);


--
-- TOC entry 3109 (class 2606 OID 16771)
-- Name: delivery_man pizzeria_delivery_man_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.delivery_man
    ADD CONSTRAINT pizzeria_delivery_man_fk FOREIGN KEY (id_pizzeria) REFERENCES public.pizzeria(id);


--
-- TOC entry 3112 (class 2606 OID 16776)
-- Name: pizzaiolo pizzeria_pizzaiolo_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.pizzaiolo
    ADD CONSTRAINT pizzeria_pizzaiolo_fk FOREIGN KEY (id_pizzeria) REFERENCES public.pizzeria(id);


--
-- TOC entry 3097 (class 2606 OID 16756)
-- Name: stock pizzeria_stock_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT pizzeria_stock_fk FOREIGN KEY (id_pizzeria) REFERENCES public.pizzeria(id);


--
-- TOC entry 3105 (class 2606 OID 16736)
-- Name: admin user_admin_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT user_admin_fk FOREIGN KEY (id_address) REFERENCES public.address(id);


--
-- TOC entry 3104 (class 2606 OID 16696)
-- Name: admin user_admin_fk1; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT user_admin_fk1 FOREIGN KEY (id_user) REFERENCES public."user"(id);


--
-- TOC entry 3114 (class 2606 OID 16721)
-- Name: customer user_customer_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT user_customer_fk FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- TOC entry 3113 (class 2606 OID 16681)
-- Name: customer user_customer_fk1; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT user_customer_fk1 FOREIGN KEY (id_user) REFERENCES public."user"(id);


--
-- TOC entry 3108 (class 2606 OID 16731)
-- Name: delivery_man user_delivery_man_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.delivery_man
    ADD CONSTRAINT user_delivery_man_fk FOREIGN KEY (id_address) REFERENCES public.address(id);


--
-- TOC entry 3107 (class 2606 OID 16691)
-- Name: delivery_man user_delivery_man_fk1; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.delivery_man
    ADD CONSTRAINT user_delivery_man_fk1 FOREIGN KEY (id_user) REFERENCES public."user"(id);


--
-- TOC entry 3100 (class 2606 OID 16741)
-- Name: order user_oder_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT user_oder_fk FOREIGN KEY (id) REFERENCES public.address(id);


--
-- TOC entry 3111 (class 2606 OID 16726)
-- Name: pizzaiolo user_pizzaiolo_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.pizzaiolo
    ADD CONSTRAINT user_pizzaiolo_fk FOREIGN KEY (id_address) REFERENCES public.address(id);


--
-- TOC entry 3110 (class 2606 OID 16686)
-- Name: pizzaiolo user_pizzaiolo_fk1; Type: FK CONSTRAINT; Schema: public; Owner: admin_ocpizza
--

ALTER TABLE ONLY public.pizzaiolo
    ADD CONSTRAINT user_pizzaiolo_fk1 FOREIGN KEY (id_user) REFERENCES public."user"(id);


-- Completed on 2021-03-18 20:21:59 CET

--
-- PostgreSQL database dump complete
--

