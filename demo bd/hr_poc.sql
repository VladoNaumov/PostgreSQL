--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

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
-- Name: hr_poc; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA hr_poc;


ALTER SCHEMA hr_poc OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: hr_poc; Owner: postgres
--

CREATE TABLE hr_poc.customers (
    customer_id integer NOT NULL,
    c_name character varying(255) NOT NULL,
    address character varying(255),
    credit_limit numeric(10,2)
);


ALTER TABLE hr_poc.customers OWNER TO postgres;

--
-- Name: departments; Type: TABLE; Schema: hr_poc; Owner: postgres
--

CREATE TABLE hr_poc.departments (
    department_id integer NOT NULL,
    department_name character varying(30) NOT NULL,
    manager_id integer,
    location_id integer
);


ALTER TABLE hr_poc.departments OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: hr_poc; Owner: postgres
--

CREATE TABLE hr_poc.employees (
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(25) NOT NULL,
    phone_number character varying(20),
    hire_date date DEFAULT CURRENT_DATE NOT NULL,
    job_id character varying(10),
    salary numeric(10,2),
    commission_pct numeric(4,3),
    manager_id integer,
    department_id integer,
    rating_e integer,
    CONSTRAINT emp_e CHECK (((rating_e > 0) AND (rating_e <= 5))),
    CONSTRAINT emp_salary_min CHECK ((salary > (0)::numeric))
);


ALTER TABLE hr_poc.employees OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: hr_poc; Owner: postgres
--

CREATE TABLE hr_poc.jobs (
    job_id character varying(10) NOT NULL,
    job_title character varying(35) NOT NULL,
    min_salary numeric(10,2),
    max_salary numeric(10,2)
);


ALTER TABLE hr_poc.jobs OWNER TO postgres;

--
-- Name: locations; Type: TABLE; Schema: hr_poc; Owner: postgres
--

CREATE TABLE hr_poc.locations (
    location_id integer NOT NULL,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30),
    state_province character varying(25),
    country_id character varying(2)
);


ALTER TABLE hr_poc.locations OWNER TO postgres;

--
-- Name: order_items; Type: TABLE; Schema: hr_poc; Owner: postgres
--

CREATE TABLE hr_poc.order_items (
    order_id integer NOT NULL,
    item_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL
);


ALTER TABLE hr_poc.order_items OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: hr_poc; Owner: postgres
--

CREATE TABLE hr_poc.orders (
    order_id integer NOT NULL,
    customer_id integer NOT NULL,
    status character varying(20) DEFAULT 'Pending'::character varying NOT NULL,
    salesman_id integer,
    order_date date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE hr_poc.orders OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: hr_poc; Owner: postgres
--

CREATE TABLE hr_poc.products (
    product_id integer NOT NULL,
    product_name character varying(255) NOT NULL,
    rating_p integer,
    price numeric(10,2),
    CONSTRAINT product_r CHECK (((rating_p > 0) AND (rating_p <= 5)))
);


ALTER TABLE hr_poc.products OWNER TO postgres;

--
-- Data for Name: customers; Type: TABLE DATA; Schema: hr_poc; Owner: postgres
--

COPY hr_poc.customers (customer_id, c_name, address, credit_limit) FROM stdin;
2	Boeing	100 North Riverside Chicago, Illinois 60606 USA	1200000.00
3	Oracle Corporation	500 Oracle Parkway Redwood Shores, CA 94065 USA	1200000.00
4	United Technologies	10 Farm Springs Rd. Farmington, CT 06032 USA	120000.00
5	Rockwell Collins	400 Collins Road N.E. Cedar Rapids, IA 52498 USA	500000.00
6	Textron	40 Westminster Street Providence, RI 02903 USA	360000.00
7	Daimler	Daimler AG 70546 Stuttgart Germany	240000.00
9	Triumph Group Inc	Berwyn, Pennsylvania , United States	50000.00
10	Mazda Motor	3-1, Shinchi, Fuchu-Cho Aki-Gun, Hiroshima, 735-0028 Japan	500000.00
11	Toyota Motor	Toyota-Cho, Toyota, Aichi, Japan 471-0826	50000.00
12	Zhengzhou Yutong Bus	Zhengzhou,Henan province,China	60000.00
14	Volkswagen Group	Berliner Ring 2 38440 Wolfsburg, Germany	70000.00
15	DEDEMAN S.R.L.	411 E Wisconsin Ave # 2550	70000.00
16	Samsung Electronics	129, Samsung-ro, Yeongtong-gu, Suwon-si, Gyeonggi-do, Korea	90000.00
17	Haier Group	1 Haier Road, Hi-Tech Zone Qingdao 266101 China	120000.00
18	Anglo American plc	20 Carlton House Terrace London SW1Y 5AN United Kingdom	120000.00
19	Rio Tinto Limited	Level 7 360 Collins Street Melbourne Australia 3000	120000.00
20	Caterpillar	501 Southwest Jefferson Avenue, Peoria, IL, 61630	120000.00
21	Volvo Construction Equipment	Bolinderv?gen 100 (1 321,64 km) Eskilstuna, Sweden	120000.00
22	CNH Industrial	25 St James Street, London, United Kingdom	500000.00
23	Deere & Company	One JohnDeere Place|Moline, IL 61265USA	30000.00
24	Rockwell Automation	1201 South Second Street, Milwaukee, WI 53204-2496 USA	190000.00
25	DAIKIN INDUSTRIES	1304 Kanaoka-cho, Kita-ku, Sakai, Osaka 591-8511, Japan	370000.00
26	Alfa Laval AB	Rudeboksv?gen 1 SE-226 55 Lund Sweden	300000.00
27	National Oilwell Varco	7909 Parkwood Circle Drive Houston, Texas 77036 United States	500000.00
28	FLSmidth	A/S Vigerslev All? 77 2500 Valby, Copenhagen Denmark	20000.00
29	GEA Group	Peter-M?ller-Str. 12 40468 D?sseldorf Germany	120000.00
30	SOLER & PALAU (S&P)	Ctra. Puigcerda 17500 Ripol, Spain	120000.00
31	ARBURG GmbH + Co KG	Arthur-Hehl-Stra?e 72290 Lossburg Germany	90000.00
33	BIZERBA SE & Co. KG	Balingen, Wilhelm-Kraut-Str. 65, 72336 Balingen	120000.00
34	Apple	1 Infinite Loop Cupertino, CA 95014 USA	120000.00
35	Asustek Computer	15 Li-Te Road, Peitou, Taipei, Taiwan 11259	120000.00
36	Lite-On Technology Corporation	14F,392, Ruey KuangNeihu, Taipei 11492 Taiwan	120000.00
37	Advanced Micro Devices	One AMD Place P.O. Box 3453 Sunnyvale, CA 94088-3453,USA	120000.00
38	OMRON	Shiokoji Horikawa, Shimogyo-ku, Kyoto 600-8530, Japan	120000.00
39	SAKAI HEAVY INDUSTRIES, LTD	Hamamatsu-cho Seiwa Bldg., 1-4-8, Shibadaimon, Minato-ku, Tokyo 105-0012	120000.00
40	HIRE SERVICE SHOPS	76 Talbot Road, Old Trafford, Manchester, M16 0PQ United Kingdom	120000.00
41	Einhell Germany AG	Landau, Wiesenweg, 22, 94405 Landau an der Isar Germany	120000.00
42	Microsoft Corporation	One Microsoft Way Redmond, WA 98052-7329 USA	120000.00
43	ALFRED KARCHER GMBH & CO. KG	Alfred-Karcher-Str. 28-40, 71364 Winnenden Germany	140000.00
44	Canon Inc.	30-2, Shimomaruko 3-chome, Ohta-ku, Tokyo 146-8501, Japan	140000.00
45	Nikon Corporation	Shinagawa Intercity Tower C, 2-15-3, Konan, Minato-ku, Tokyo 108-6290, Japan	140000.00
46	Liebherr	rue de l'industrie 45 1630 Bulle Switzerland	140000.00
47	DAIKIN INDUSTRIES	1304 Kanaoka-cho, Kita-ku, Sakai, Osaka 591-8511, Japan	140000.00
48	Electrolux Group	Sankt G?ransgatan 143, 112 17 Stockholm	140000.00
49	Vaillant Group	Berghauser. 40, 42859 Remscheid, Deutschland	140000.00
51	Whirlpool	2000 N. M-63 Benton Harbor, MI, 49022-2692 USA	190000.00
52	Fujifilm Holdings	9-7-3 Akasaka, Minato-ku, Tokyo 107-0052, Japan	230000.00
53	FERROLI S.p.A.	via Ritonda 78/a 37047 San Bonifacio (VR)	230000.00
54	Miele	Gesch?ftsbereich Projekte Carl-Miele-Str. 29 33332 G?tersloh Germany	500000.00
55	BAXI GROUP LIMITED	Derby, 16 Stanier Way, Wyvern Business Park, Derby, DE21 6BF United Kingdom	500000.00
56	Rosenbauer International AG	Paschinger Stra?e 90 4060 Leonding, ?sterreich	240000.00
57	PALFINGER AG	Lamprechtshausener Bundesstra?e 8 | 5101 Bergheim | Austria	50000.00
58	General Electric Co	Wells Fargo Shareowner Services P.O. Box 64874 St Paul, MN 55164-0874 USA	30000.00
59	Johnson & Johnson	One Johnson & Johnson Plaza New Brunswick, New Jersey 08933 USA	120000.00
60	Agilent Technologies	5301 Stevens Creek Blvd., Santa Clara, CA 95051, United States	120000.00
61	Becton Dickinson	1 Becton Drive Franklin Lakes, NJ 07417-1880 USA	500000.00
62	Stryker Corporation	2825 Airview Boulevard Kalamazoo, MI 49002 USA	50000.00
63	Dentsply Sirona	Building 3, The Heights, Weybridge, Surrey, KT13 0NY, United Kingdom	50000.00
64	Sysmex Corporation	1-5-1,Wakinohama-kaigandori, Chuo-ku, Kobe, Hyogo 651-0073, Japan	50000.00
65	SAINT-GOBAIN	Les Miroirs 18, avenue d'Alsace 92400 Courbevoie FRANCE	230000.00
66	GEA WESTFALIA SEPARATOR AG	Oelde, Werner-Habig-Strasse 1, 59302 Oelde Germany	350000.00
67	Georg Fischer AG	Amsler-Laffon-Strasse 9 8201 Schaffhausen Switzerland	350000.00
68	Norsk Hydro ASA	Drammensveien 260 V?ker? Oslo, 0240 Norway	120000.00
69	WALTER AG	Derendinger Str. 53 72072 T?bingen Germany	350000.00
70	Adidas AG	Adi-Dassler-Strasse 1, 91074 Herzogenaurach, Germany	140000.00
72	PORCELANOSA	Box: 131 12540 Vila-real, Castell?n, Spain	500000.00
73	Brother Industries	Naeshiro-Cho, Mizuho-Ku, Nagoya, Japan	180000.00
74	Amazon.com	Seattle, Washington, USA	240000.00
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: hr_poc; Owner: postgres
--

COPY hr_poc.departments (department_id, department_name, manager_id, location_id) FROM stdin;
10	Administration	200	1700
20	Marketing	201	1800
30	Purchasing	114	1700
40	Human Resources	203	2400
50	Shipping	121	1500
60	IT	103	1400
70	Public Relations	204	2700
80	Sales	145	2500
90	Executive	100	1700
100	Finance	108	1700
110	Accounting	205	1700
120	Treasury	\N	1700
130	Corporate Tax	\N	1700
140	Control And Credit	\N	1700
150	Shareholder Services	\N	1700
160	Benefits	\N	1700
170	Manufacturing	\N	1700
180	Construction	\N	1700
190	Contracting	\N	1700
200	Operations	\N	1700
210	IT Support	\N	1700
220	NOC	\N	1700
230	IT Helpdesk	\N	1700
240	Government Sales	\N	1700
250	Retail Sales	\N	1700
260	Recruiting	\N	1700
270	Payroll	\N	1700
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: hr_poc; Owner: postgres
--

COPY hr_poc.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, rating_e) FROM stdin;
100	Steven	King	SKING	515.123.4567	1987-06-17	AD_PRES	24000.00	\N	\N	90	4
101	Neena	Kochhar	NKOCHHAR	515.123.4568	1989-09-21	AD_VP	17000.00	\N	100	90	5
102	Lex	De Haan	LDEHAAN	515.123.4569	1993-01-13	AD_VP	17000.00	\N	100	90	3
103	Alexander	Hunold	AHUNOLD	590.423.4567	1990-01-03	IT_PROG	9000.00	\N	102	60	3
104	Bruce	Ernst	BERNST	590.423.4568	1991-05-21	IT_PROG	6000.00	\N	103	60	3
106	Valli	Pataballa	VPATABAL	590.423.4560	1998-02-05	IT_PROG	4800.00	\N	103	60	4
107	Diana	Lorentz	DLORENTZ	590.423.5567	1999-02-07	IT_PROG	4200.00	\N	103	60	3
108	Nancy	Greenberg	NGREENBE	515.124.4569	1994-08-17	FI_MGR	12000.00	\N	101	100	2
109	Daniel	Faviet	DFAVIET	515.124.4169	1994-08-16	FI_ACCOUNT	9000.00	\N	108	100	3
110	John	Chen	JCHEN	515.124.4269	1997-09-28	FI_ACCOUNT	8200.00	\N	108	100	4
111	Ismael	Sciarra	ISCIARRA	515.124.4369	1997-09-30	FI_ACCOUNT	7700.00	\N	108	100	4
112	Jose Manuel	Urman	JMURMAN	515.124.4469	1998-03-07	FI_ACCOUNT	7800.00	\N	108	100	1
113	Luis	Popp	LPOPP	515.124.4567	1999-12-07	FI_ACCOUNT	6900.00	\N	108	100	4
115	Alexander	Khoo	AKHOO	515.127.4562	1995-05-18	PU_CLERK	3100.00	\N	114	30	3
118	Guy	Himuro	GHIMURO	515.127.4565	1998-11-15	PU_CLERK	2600.00	\N	114	30	3
119	Karen	Colmenares	KCOLMENA	515.127.4566	1999-08-10	PU_CLERK	2500.00	\N	114	30	3
120	Matthew	Weiss	MWEISS	650.123.1234	1996-07-18	ST_MAN	8000.00	\N	100	50	2
121	Adam	Fripp	AFRIPP	650.123.2234	1997-04-10	ST_MAN	8200.00	\N	100	50	1
122	Payam	Kaufling	PKAUFLIN	650.123.3234	1995-05-01	ST_MAN	7900.00	\N	100	50	2
123	Shanta	Vollman	SVOLLMAN	650.123.4234	1997-10-10	ST_MAN	6500.00	\N	100	50	1
124	Kevin	Mourgos	KMOURGOS	650.123.5234	1999-11-16	ST_MAN	5800.00	\N	100	50	4
128	Steven	Markle	SMARKLE	650.124.1434	2000-03-08	ST_CLERK	2200.00	\N	120	50	5
129	Laura	Bissot	LBISSOT	650.124.5234	1997-08-20	ST_CLERK	3300.00	\N	121	50	5
130	Mozhe	Atkinson	MATKINSO	650.124.6234	1997-10-30	ST_CLERK	2800.00	\N	121	50	2
131	James	Marlow	JAMRLOW	650.124.7234	1997-02-16	ST_CLERK	2500.00	\N	121	50	2
133	Jason	Mallin	JMALLIN	650.127.1934	1996-06-14	ST_CLERK	3300.00	\N	122	50	3
134	Michael	Rogers	MROGERS	650.127.1834	1998-08-26	ST_CLERK	2900.00	\N	122	50	4
135	Ki	Gee	KGEE	650.127.1734	1999-12-12	ST_CLERK	2400.00	\N	122	50	3
136	Hazel	Philtanker	HPHILTAN	650.127.1634	2000-02-06	ST_CLERK	2200.00	\N	122	50	4
137	Renske	Ladwig	RLADWIG	650.121.1234	1995-07-14	ST_CLERK	3600.00	\N	123	50	1
138	Stephen	Stiles	SSTILES	650.121.2034	1997-10-26	ST_CLERK	3200.00	\N	123	50	3
139	John	Seo	JSEO	650.121.2019	1998-02-12	ST_CLERK	2700.00	\N	123	50	1
140	Joshua	Patel	JPATEL	650.121.1834	1998-04-06	ST_CLERK	2500.00	\N	123	50	5
141	Trenna	Rajs	TRAJS	650.121.8009	1995-10-17	ST_CLERK	3500.00	\N	124	50	5
142	Curtis	Davies	CDAVIES	650.121.2994	1997-01-29	ST_CLERK	3100.00	\N	124	50	3
143	Randall	Matos	RMATOS	650.121.2874	1998-03-15	ST_CLERK	2600.00	\N	124	50	3
144	Peter	Vargas	PVARGAS	650.121.2004	1998-07-09	ST_CLERK	2500.00	\N	124	50	3
145	John	Russell	JRUSSEL	011.44.1344.429268	1996-10-01	SA_MAN	14000.00	0.400	100	80	3
146	Karen	Partners	KPARTNER	011.44.1344.467268	1997-01-05	SA_MAN	13500.00	0.300	100	80	\N
147	Alberto	Errazuriz	AERRAZUR	011.44.1344.429278	1997-03-10	SA_MAN	12000.00	0.300	100	80	2
148	Gerald	Cambrault	GCAMBRAU	011.44.1344.619268	1999-10-15	SA_MAN	11000.00	0.300	100	80	5
149	Eleni	Zlotkey	EZLOTKEY	011.44.1344.429018	2000-01-29	SA_MAN	10500.00	0.200	100	80	3
150	Peter	Tucker	PTUCKER	011.44.1344.129268	1997-01-30	SA_REP	10000.00	0.300	145	80	3
151	David	Bernstein	DBERNSTE	011.44.1344.345268	1997-03-24	SA_REP	9500.00	0.250	145	80	3
153	Christopher	Olsen	COLSEN	011.44.1344.498718	1998-03-30	SA_REP	8000.00	0.200	145	80	5
154	Nanette	Cambrault	NCAMBRAU	011.44.1344.987668	1998-12-09	SA_REP	7500.00	0.200	145	80	3
155	Oliver	Tuvault	OTUVAULT	011.44.1344.486508	1999-11-23	SA_REP	7000.00	0.150	145	80	5
156	Janette	King	JKING	011.44.1345.429268	1996-01-30	SA_REP	10000.00	0.350	146	80	1
157	Patrick	Sully	PSULLY	011.44.1345.929268	1996-03-04	SA_REP	9500.00	0.350	146	80	2
158	Allan	McEwen	AMCEWEN	011.44.1345.829268	1996-08-01	SA_REP	9000.00	0.350	146	80	2
160	Louise	Doran	LDORAN	011.44.1345.629268	1997-12-15	SA_REP	7500.00	0.300	146	80	5
161	Sarath	Sewall	SSEWALL	011.44.1345.529268	1998-11-03	SA_REP	7000.00	0.250	146	80	1
162	Clara	Vishney	CVISHNEY	011.44.1346.129268	1997-11-11	SA_REP	10500.00	0.250	147	80	2
163	Danielle	Greene	DGREENE	011.44.1346.229268	1999-03-19	SA_REP	9500.00	0.150	147	80	5
164	Mattea	Marvins	MMARVINS	011.44.1346.329268	2000-01-24	SA_REP	7200.00	0.100	147	80	5
165	David	Lee	DLEE	011.44.1346.529268	2000-02-23	SA_REP	6800.00	0.100	147	80	5
166	Sundar	Ande	SANDE	011.44.1346.629268	2000-03-24	SA_REP	6400.00	0.100	147	80	2
167	Amit	Banda	ABANDA	011.44.1346.729268	2000-04-21	SA_REP	6200.00	0.100	147	80	3
168	Lisa	Ozer	LOZER	011.44.1343.929268	1997-03-11	SA_REP	11500.00	0.250	148	80	2
169	Harrison	Bloom	HBLOOM	011.44.1343.829268	1998-03-23	SA_REP	10000.00	0.200	148	80	3
170	Tayler	Fox	TFOX	011.44.1343.729268	1998-01-24	SA_REP	9600.00	0.200	148	80	3
171	William	Smith	WSMITH	011.44.1343.629268	1999-02-23	SA_REP	7400.00	0.150	148	80	2
172	Elizabeth	Bates	EBATES	011.44.1343.529268	1999-03-24	SA_REP	7300.00	0.150	148	80	2
173	Sundita	Kumar	SKUMAR	011.44.1343.329268	2000-04-21	SA_REP	6100.00	0.100	148	80	2
114	Den	Raphaely	DRAPHEAL	515.127.4561	1994-12-07	PU_MAN	11000.00	0.200	100	30	1
116	Shelli	Baida	SBAIDA	515.127.4563	1997-12-24	PU_CLERK	2900.00	0.300	114	30	2
117	Sigal	Tobias	STOBIAS	515.127.4564	1997-07-24	PU_CLERK	2800.00	0.100	114	30	3
132	TJ	Olson	TJOLSON	650.124.8234	1999-04-10	ST_CLERK	\N	\N	121	50	1
152	Peter	Hall	PHALL	011.44.1344.478968	1997-08-20	SA_REP	\N	0.250	145	80	3
174	Ellen	Abel	EABEL	011.44.1644.429267	1996-05-11	SA_REP	11000.00	0.300	149	80	1
175	Alyssa	Hutton	AHUTTON	011.44.1644.429266	1997-03-19	SA_REP	8800.00	0.250	149	80	3
127	James	Landry	JLANDRY	650.124.1334	1999-01-14	PU_CLERK	2400.00	\N	120	50	4
176	Jonathon	Taylor	JTAYLOR	011.44.1644.429265	1998-03-24	SA_REP	8600.00	0.200	149	80	3
177	Jack	Livingston	JLIVINGS	011.44.1644.429264	1998-04-23	SA_REP	8400.00	0.200	149	80	2
178	Kimberely	Grant	KGRANT	011.44.1644.429263	1999-05-24	SA_REP	7000.00	0.150	149	\N	4
179	Charles	Johnson	CJOHNSON	011.44.1644.429262	2000-01-04	SA_REP	6200.00	0.100	149	80	4
180	Winston	Taylor	WTAYLOR	650.507.9876	1998-01-24	SH_CLERK	3200.00	\N	120	50	4
181	Jean	Fleaur	JFLEAUR	650.507.9877	1998-02-23	SH_CLERK	3100.00	\N	120	50	4
182	Martha	Sullivan	MSULLIVA	650.507.9878	1999-06-21	SH_CLERK	2500.00	\N	120	50	2
183	Girard	Geoni	GGEONI	650.507.9879	2000-02-03	SH_CLERK	2800.00	\N	120	50	2
184	Nandita	Sarchand	NSARCHAN	650.509.1876	1996-01-27	SH_CLERK	4200.00	\N	121	50	4
185	Alexis	Bull	ABULL	650.509.2876	1997-02-20	SH_CLERK	4100.00	\N	121	50	5
186	Julia	Dellinger	JDELLING	650.509.3876	1998-06-24	SH_CLERK	3400.00	\N	121	50	2
187	Anthony	Cabrio	ACABRIO	650.509.4876	1999-02-07	SH_CLERK	3000.00	\N	121	50	5
188	Kelly	Chung	KCHUNG	650.505.1876	1997-06-14	SH_CLERK	3800.00	\N	122	50	2
189	Jennifer	Dilly	JDILLY	650.505.2876	1997-08-13	SH_CLERK	3600.00	\N	122	50	1
190	Timothy	Gates	TGATES	650.505.3876	1998-07-11	SH_CLERK	2900.00	\N	122	50	1
191	Randall	Perkins	RPERKINS	650.505.4876	1999-12-19	SH_CLERK	2500.00	\N	122	50	4
192	Sarah	Bell	SBELL	650.501.1876	1996-02-04	SH_CLERK	4000.00	\N	123	50	5
193	Britney	Everett	BEVERETT	650.501.2876	1997-03-03	SH_CLERK	3900.00	\N	123	50	2
194	Samuel	McCain	SMCCAIN	650.501.3876	1998-07-01	SH_CLERK	3200.00	\N	123	50	2
195	Vance	Jones	VJONES	650.501.4876	1999-03-17	SH_CLERK	2800.00	\N	123	50	5
196	Alana	Walsh	AWALSH	650.507.9811	1998-04-24	SH_CLERK	3100.00	\N	124	50	5
197	Kevin	Feeney	KFEENEY	650.507.9822	1998-05-23	SH_CLERK	3000.00	\N	124	50	3
198	Donald	OConnell	DOCONNEL	650.507.9833	1999-06-21	SH_CLERK	2600.00	\N	124	50	4
199	Douglas	Grant	DGRANT	650.507.9844	2000-01-13	SH_CLERK	2600.00	\N	124	50	4
200	Jennifer	Whalen	JWHALEN	515.123.4444	1987-09-17	AD_ASST	4400.00	\N	101	10	2
201	Michael	Hartstein	MHARTSTE	515.123.5555	1996-02-17	MK_MAN	13000.00	\N	100	20	4
202	Pat	Fay	PFAY	603.123.6666	1997-08-17	MK_REP	6000.00	\N	201	20	5
203	Susan	Mavris	SMAVRIS	515.123.7777	1994-06-07	HR_REP	6500.00	\N	101	40	2
204	Hermann	Baer	HBAER	515.123.8888	1994-06-07	PR_REP	10000.00	\N	101	70	5
205	Shelley	Higgins	SHIGGINS	515.123.8080	1994-06-07	AC_MGR	12000.00	\N	101	110	2
206	William	Gietz	WGIETZ	515.123.8181	1994-06-07	AC_ACCOUNT	8300.00	\N	205	110	5
105	DAVID	Austin	DAUSTIN	590.423.4569	1997-06-25	IT_PROG	4800.00	\N	103	60	5
126	Irene	Mikkilineni	IMIKKILI	650.124.1224	1998-09-28	PU_CLERK	2700.00	\N	120	50	\N
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: hr_poc; Owner: postgres
--

COPY hr_poc.jobs (job_id, job_title, min_salary, max_salary) FROM stdin;
AD_PRES	President	20000.00	40000.00
AD_VP	Administration Vice President	15000.00	30000.00
AD_ASST	Administration Assistant	3000.00	6000.00
FI_MGR	Finance Manager	8200.00	16000.00
FI_ACCOUNT	Accountant	4200.00	9000.00
AC_MGR	Accounting Manager	8200.00	16000.00
AC_ACCOUNT	Public Accountant	4200.00	9000.00
SA_MAN	Sales Manager	10000.00	20000.00
SA_REP	Sales Representative	6000.00	12000.00
PU_MAN	Purchasing Manager	8000.00	15000.00
PU_CLERK	Purchasing Clerk	2500.00	5500.00
ST_MAN	Stock Manager	5500.00	8500.00
ST_CLERK	Stock Clerk	2000.00	5000.00
SH_CLERK	Shipping Clerk	2500.00	5500.00
IT_PROG	Programmer	4000.00	10000.00
MK_MAN	Marketing Manager	9000.00	15000.00
MK_REP	Marketing Representative	4000.00	9000.00
HR_REP	Human Resources Representative	4000.00	9000.00
PR_REP	Public Relations Representative	4500.00	10500.00
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: hr_poc; Owner: postgres
--

COPY hr_poc.locations (location_id, street_address, postal_code, city, state_province, country_id) FROM stdin;
1000	1297 Via Cola di Rie	00989	Roma	\N	IT
1100	93091 Calle della Testa	10934	Milano	\N	IT
1200	2017 Shinjuku-ku	1689	Tokyo	Tokyo Prefecture	JP
1300	9450 Kamiya-cho	6823	Hiroshima	\N	JP
1400	2014 Jabberwocky Rd	26192	Southlake	Texas	US
1500	2011 Interiors Blvd	99236	South San Francisco	California	US
1600	2007 Zagora St	10001	South Brunswick	New York	US
1700	2004 Charade Rd	98199	Seattle	Washington	US
1800	147 Spadina Ave	M5V 2L7	Toronto	Ontario	CA
1900	6092 Boxwood St	YSW 9T2	Whitehorse	Yukon	CA
2000	40-5-12 Laogianggen	190518	Beijing	\N	CN
2100	1298 Vileparle (E)	490231	Bombay	Maharashtra	IN
2200	12-98 Victoria Street	2901	Sydney	New South Wales	AU
2300	198 Clementi North	540198	Singapore	\N	SG
2400	8204 Arthur St	\N	London	\N	UK
2500	Magdalen Centre, The Oxford Science Park	OX9 9ZB	Oxford	Oxford	UK
2600	9702 Chester Road	09629850293	Stretford	Manchester	UK
2700	Schwanthalerstr. 7031	80925	Munich	Bavaria	DE
2800	Rua Frei Caneca 1360 	01307-002	Sao Paulo	Sao Paulo	BR
2900	20 Rue des Corps-Saints	1730	Geneva	Geneve	CH
3000	Murtenstrasse 921	3095	Bern	BE	CH
3100	Pieter Breughelstraat 837	3029SK	Utrecht	Utrecht	NL
3200	Mariano Escobedo 9991	11932	Mexico City	Distrito Federal,	MX
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: hr_poc; Owner: postgres
--

COPY hr_poc.order_items (order_id, item_id, product_id, quantity, unit_price) FROM stdin;
78	5	79	10	2000.00
8	1	34	144	150.00
32	1	14	86	700.00
35	1	76	99	1160.00
60	1	15	36	280.00
61	1	16	67	730.00
87	1	1	57	640.00
107	2	66	126	400.00
107	1	63	31	1900.00
87	9	21	142	720.00
70	7	32	32	2800.00
73	5	12	124	2060.00
74	7	27	92	4140.00
74	11	6	128	2430.00
74	10	75	106	70.00
74	5	71	148	90.00
81	7	79	127	150.00
84	6	31	34	3000.00
84	11	71	58	90.00
95	9	17	144	1900.00
14	7	78	145	440.00
15	6	83	79	140.00
6	7	7	119	2380.00
6	1	19	67	1850.00
11	1	66	113	560.00
12	1	11	41	2120.00
13	1	84	46	60.00
14	1	29	98	3190.00
15	1	28	60	3250.00
18	1	21	105	1810.00
19	1	38	53	1760.00
20	1	26	105	5500.00
22	1	83	44	140.00
23	1	22	104	1760.00
24	1	12	129	2060.00
25	1	43	19	1000.00
26	1	20	114	1840.00
27	1	71	38	90.00
28	1	31	61	3000.00
29	1	7	38	2380.00
30	1	35	70	2020.00
31	1	10	68	2200.00
33	1	55	93	1160.00
34	1	15	141	1990.00
36	1	20	45	1840.00
37	1	35	150	2020.00
38	1	71	90	90.00
39	1	18	116	1900.00
42	1	34	45	2290.00
43	1	67	74	550.00
45	1	74	43	20.00
47	1	78	73	440.00
48	1	65	46	570.00
49	1	72	104	150.00
51	1	21	34	1810.00
52	1	35	123	2020.00
53	1	10	130	2200.00
54	1	28	73	3250.00
55	1	12	127	2060.00
56	1	84	70	60.00
57	1	24	75	1710.00
58	1	64	55	570.00
59	1	78	101	440.00
62	1	18	130	1900.00
70	1	18	146	1900.00
71	1	19	146	1850.00
72	1	29	101	3190.00
73	1	45	120	1500.00
74	1	14	97	2010.00
78	1	19	92	1850.00
78	2	23	65	1750.00
78	3	52	147	1260.00
79	1	28	145	3250.00
80	1	21	63	1810.00
81	1	28	133	3250.00
84	1	16	137	1910.00
88	1	78	139	440.00
89	1	47	45	1430.00
95	1	52	138	1260.00
96	1	26	34	5500.00
97	1	11	39	2120.00
98	1	66	104	560.00
98	2	65	66	570.00
101	1	17	47	1900.00
102	1	19	69	1850.00
58	9	36	134	2000.00
65	6	47	130	1430.00
69	7	79	49	150.00
81	6	65	61	570.00
89	8	15	127	1990.00
22	11	23	144	1750.00
23	9	14	86	2010.00
24	6	27	99	4140.00
26	5	51	36	1300.00
27	11	16	67	1910.00
30	7	55	64	1160.00
33	6	19	70	1850.00
42	5	52	85	1260.00
43	7	1	57	3410.00
58	10	63	31	650.00
69	8	69	67	520.00
73	4	45	54	1500.00
104	6	51	139	1300.00
69	9	61	55	950.00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: hr_poc; Owner: postgres
--

COPY hr_poc.orders (order_id, customer_id, status, salesman_id, order_date) FROM stdin;
8	28	Shipped	155	2020-03-21
32	25	Shipped	158	2019-04-19
35	24	Shipped	160	2018-12-11
60	55	Shipped	161	2019-06-24
61	31	Shipped	164	2019-06-24
66	36	Pending	165	2020-01-23
87	33	Shipped	166	2018-10-22
107	39	Shipped	166	2018-10-22
108	11	Shipped	150	2017-09-08
109	29	Shipped	168	2020-10-25
44	2	Pending	155	2017-05-21
101	3	Pending	155	2018-03-15
5	5	Canceled	156	2018-03-15
28	6	Canceled	157	2019-08-14
82	44	Shipped	160	2018-11-03
102	45	Shipped	161	2019-12-21
26	46	Shipped	162	2018-07-17
43	47	Shipped	162	2020-05-03
53	48	Shipped	162	2020-09-29
81	49	Shipped	162	2019-12-13
83	16	Shipped	162	2017-12-05
93	17	Shipped	162	2017-12-27
79	2	Shipped	164	2018-12-12
80	3	Shipped	164	2018-12-12
2	4	Shipped	145	2019-04-26
3	5	Shipped	145	2017-05-26
6	6	Shipped	145	2018-03-09
9	9	Shipped	148	2017-03-14
10	44	Pending	148	2017-01-14
11	45	Shipped	148	2018-11-28
12	46	Shipped	150	2018-11-28
13	47	Shipped	149	2019-11-29
14	48	Shipped	149	2017-09-18
15	49	Shipped	150	2017-09-27
16	16	Pending	150	2017-09-27
17	17	Shipped	150	2017-09-27
18	18	Shipped	\N	2017-08-16
19	19	Shipped	\N	2017-05-27
20	20	Shipped	\N	2017-05-27
21	21	Pending	151	2017-05-27
22	22	Canceled	152	2018-07-26
23	23	Shipped	152	2019-09-07
24	41	Shipped	152	2019-09-07
25	42	Shipped	152	2018-09-21
27	43	Canceled	152	2018-08-16
29	44	Shipped	153	2017-02-14
30	45	Shipped	153	2018-08-12
31	46	Canceled	153	2018-08-12
33	48	Shipped	153	2017-03-07
34	49	Shipped	153	2017-05-12
36	51	Shipped	155	2020-09-05
37	52	Shipped	179	2020-09-19
38	53	Canceled	157	2019-05-31
39	54	Shipped	162	2019-11-23
42	56	Canceled	164	2018-06-03
45	57	Shipped	164	2020-02-20
46	58	Pending	162	2020-02-20
47	59	Canceled	162	2018-10-10
48	60	Canceled	164	2018-10-10
49	61	Shipped	155	2019-11-02
50	62	Pending	155	2019-11-02
52	64	Shipped	160	2019-11-02
54	65	Shipped	176	2019-10-29
55	66	Pending	179	2018-09-29
56	67	Canceled	175	2018-09-29
57	68	Shipped	177	2017-08-24
58	69	Shipped	177	2017-08-24
62	3	Shipped	162	2017-07-30
63	4	Shipped	161	2018-06-30
64	5	Shipped	164	2018-06-21
65	6	Shipped	164	2018-06-21
68	9	Pending	171	2017-11-13
69	44	Canceled	154	2017-03-17
70	45	Canceled	161	2017-02-21
71	46	Shipped	154	2017-02-21
72	47	Shipped	164	2018-02-17
73	48	Shipped	171	2018-02-17
74	49	Shipped	164	2017-02-10
75	16	Shipped	\N	2017-02-10
78	2	Pending	164	2018-12-14
84	3	Shipped	174	2018-12-01
85	4	Pending	175	2018-11-01
86	5	Pending	170	2020-11-30
88	6	Shipped	171	2019-11-01
89	7	Shipped	155	2019-10-27
91	9	Pending	176	2020-11-28
95	45	Shipped	179	2019-09-19
96	46	Shipped	179	2019-09-14
97	47	Canceled	170	2017-07-12
98	48	Shipped	175	2019-03-15
100	16	Pending	154	2020-11-15
103	17	Pending	164	2020-12-08
104	18	Shipped	160	2017-05-01
110	34	Pending	169	2017-08-23
105	18	Pending	175	2023-06-10
41	9	Shipped	\N	2017-05-12
51	63	Shipped	\N	2019-11-02
59	70	Shipped	\N	2017-07-29
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: hr_poc; Owner: postgres
--

COPY hr_poc.products (product_id, product_name, rating_p, price) FROM stdin;
76	Corsair K70 RGB MK.2 Cherry MX Red (CH-9109010-RU)	1	90.00
77	Logitech G810 Orion Spectrum (920-007750)	1	40.00
78	Logitech G910 Orion Spectrum RGB (920-008019)	1	420.00
86	Samsung 24" S24F350FHI	2	1400.00
45	G.Skill TridentZ RGB	2	1430.00
46	Samsung 32" C32JG50QQI	2	1380.00
47	Acer 27" Nitro VG270UPbmiipx	2	1360.00
48	Samsung 27" C27JG50QQI	2	1350.00
49	ASUS 32" ROG Strix XG32VQ	2	1250.00
50	MSI 24" Optix MAG241C	2	1250.00
51	AOC 32" CQ32G1 Gaming	2	1230.00
52	Gigabyte 27" Aorus AD27QD-EK	2	1200.00
53	LG 34" 34GN850-B UltraGear	2	1140.00
54	ASUS 25" VG259QM TUF Gaming	2	1140.00
55	ASUS 27" VG279QM TUF Gaming	2	1110.00
56	Acer 27" VG271UPbmiipx Nitro (UM.HV1EE.P01)	2	1040.00
57	Iiyama 34" ProLite XUB3493WQSU-B1	2	1020.00
58	G.Skill Ripjaws 4 Series	2	1000.00
59	Viewsonic 27" VA2719-2K-SMHD	2	820.00
60	Dell 25" UltraSharp UP2516D (516D-2061)	2	770.00
61	Apple iPhone XS 64GB Space Gray (MT9E2RU/A)	3	900.00
62	Apple iPhone XR 64GB Space Gray (MRY42RU/A)	3	750.00
63	Asus X99-E-10G WS	3	620.00
64	Apple iPhone 7 256Gb	3	550.00
65	Apple iPhone 8 Plus 256 GB	3	570.00
66	LG V30+ Black (H930DS)	3	530.00
67	Samsung Galaxy S7 Edge 32Gb Black (SM-G935)	3	520.00
68	Sony Xperia XZ Premium Black (G8142)	3	\N
69	Xiaomi Mi5 32GB	3	490.00
70	Xiaomi Mi6 64Gb	3	480.00
71	Logitech G PRO Lightspeed HERO (910-005440)	1	80.00
72	Logitech G502 Proteus Spectrum Black USB	1	140.00
73	SteelSeries Rival 500 Black	1	60.00
74	A4Tech Bloody B120 Black USB	1	10.00
75	HyperX Alloy Elite Cherry MX Red (HX-KB2RD1-RU/R1)	1	60.00
79	Kingston HyperX Alloy FPS	1	140.00
80	ASUS ROG Claymore Black (Cherry MX Brown)	1	20.00
81	Logitech G900 Chaos Spectrum (910-004607)	1	60.00
82	Logitech G402 Hyperion Fury USB (910-004067)	1	100.00
83	Razer DeathAdder Elite	1	130.00
84	A4tech X-710BK USB	1	60.00
1	AMD RYZEN 9 5950X BOX AM4 Vermeer (100-100000059WOF)	4	3240.00
2	AMD RYZEN 5 3600 OEM AM4 Matisse	4	2640.00
3	AMD RYZEN 7 3700X BOX Wraith Prism AM4 Matisse	4	2530.00
4	AMD RYZEN 5 2600 BOX AM4 Pinnacle Ridge (YD2600BBAFBOX)	4	2430.00
5	AMD FX-Series FX-8350 OEM	4	2380.00
6	AMD FX-Series FX-6300 OEM	4	2310.00
7	AMD Ryzen Threadripper 1920X (X399, TR4)	4	2260.00
8	AMD Athlon 200GE BOX AM4 VEGA 3 APU Raven Ridge (YD200GC6FBBOX)	4	2160.00
9	Intel Core i7 10700F OEM Comet Lake LGA1200 (CM8070104282329)	4	2150.00
10	Intel Core i7 10700K BOX Comet Lake LGA1200 (BX8070110700K)	4	2090.00
11	Intel Core i7 10700K OEM Comet Lake LGA1200 (CM8070104282436)	4	2010.00
12	 Intel Core i5 10600KF OEM Comet Lake LGA1200 (CM8070104282136)	4	1960.00
13	Intel Core i3 10100F OEM Comet Lake LGA1200 (CM8070104291318)	4	1940.00
14	Intel Core i7 9700F OEM Coffee Lake Refresh 1151v2	4	1910.00
15	AMD Athlon 200GE BOX AM4 VEGA 3 APU Raven Ridge (YD200GC6FBBOX)	4	1890.00
16	ASUS ROG STRIX B550-E GAMING AM4	4	1810.00
17	Gigabyte B460M DS3H mATX LGA1200	4	1810.00
18	Gigabyte B450M S2H mATX AM4	4	1800.00
19	Gigabyte Z490 AORUS PRO AX LGA1200	4	1760.00
20	Gigabyte GeForce RTX 3070 Eagle 8GB X3 (GV-N3070EAGLE-8GD)	4	1750.00
21	ASUS GeForce RTX 3080 TUF GAMING 10GB (TUF-RTX3080-10G-GAMING)	4	1720.00
22	Intel Xeon E5-2699 V5 (OEM/Tray)	4	1670.00
23	ASUS GeForce RTX 3070 Dual OC 8GB (DUAL-RTX3070-O8G)	4	1660.00
24	MSI GeForce RTX 2060 SUPER VENTUS GP OC 8GB	4	1620.00
25	XFX Radeon RX 590 FATBOY OC+ 8GB (RX-590P8DFD6)	4	1620.00
26	Apple MacBook Air 13 Early 2016	5	5220.00
27	Lenovo IdeaPad 720-15 (81C70002RK)	5	3930.00
28	MSI GP72 7RDX Leopard	5	3090.00
29	Acer Predator Helios 300 PH317-51-7717	5	3030.00
30	Dell Inspiron 7567 Black (7567-9316)	5	3020.00
31	Lenovo IdeaPad Y700-15 (80NV0042RK)	5	2850.00
32	HP ProBook 430 G4 (Y7Z47EA)	5	2660.00
33	Acer Predator Helios 300 PH317-51-7717	5	2560.00
34	Dell Inspiron 7567 Black (7567-8821)	5	2180.00
35	Lenovo IdeaPad 510-15 (80SV0047RK)	5	1910.00
36	ASUS VivoBook Pro 15 N580VD-DM194T	5	1900.00
37	HP Omen 15-ce008ur (1ZB02EA)	5	1710.00
38	MSI GS73VR Stealth Pro (7RF-437)	5	1670.00
39	HP Pavilion Power 15-cb012ur (2CM40EA)	5	1610.00
40	Dell Alienware 17 R4 (A17-8791)	5	1420.00
41	Sony PlayStation 4 1Tb	5	1380.00
42	Lenovo IdeaPad 310-15 (80TV00B2RK)	5	1160.00
43	AMD 100-50606	5	950.00
44	ASUS X540LA	5	950.00
\.


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: departments dept_id_pk; Type: CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.departments
    ADD CONSTRAINT dept_id_pk PRIMARY KEY (department_id);


--
-- Name: employees emp_email_uk; Type: CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.employees
    ADD CONSTRAINT emp_email_uk UNIQUE (email);


--
-- Name: employees emp_emp_id_pk; Type: CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.employees
    ADD CONSTRAINT emp_emp_id_pk PRIMARY KEY (employee_id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_id, item_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: departments dept_loc_fk; Type: FK CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.departments
    ADD CONSTRAINT dept_loc_fk FOREIGN KEY (location_id) REFERENCES hr_poc.locations(location_id) ON DELETE SET NULL;


--
-- Name: employees emp_dept_fk; Type: FK CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.employees
    ADD CONSTRAINT emp_dept_fk FOREIGN KEY (department_id) REFERENCES hr_poc.departments(department_id);


--
-- Name: employees emp_job_fk; Type: FK CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.employees
    ADD CONSTRAINT emp_job_fk FOREIGN KEY (job_id) REFERENCES hr_poc.jobs(job_id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- Name: employees emp_manager_fk; Type: FK CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.employees
    ADD CONSTRAINT emp_manager_fk FOREIGN KEY (manager_id) REFERENCES hr_poc.employees(employee_id);


--
-- Name: orders fk_orders_customers; Type: FK CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.orders
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES hr_poc.customers(customer_id) ON DELETE CASCADE;


--
-- Name: orders fk_orders_employees; Type: FK CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.orders
    ADD CONSTRAINT fk_orders_employees FOREIGN KEY (salesman_id) REFERENCES hr_poc.employees(employee_id) ON DELETE SET NULL;


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES hr_poc.orders(order_id) ON DELETE CASCADE;


--
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: hr_poc; Owner: postgres
--

ALTER TABLE ONLY hr_poc.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES hr_poc.products(product_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

