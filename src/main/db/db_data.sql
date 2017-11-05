--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-11-05 11:38:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2186 (class 0 OID 16409)
-- Dependencies: 190
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Users" ("userId", login, password) VALUES (2, 'petr', 'vareniki');
INSERT INTO "Users" ("userId", login, password) VALUES (3, 'mikhail', 'lisina');


--
-- TOC entry 2190 (class 0 OID 16439)
-- Dependencies: 194
-- Data for Name: Carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Carts" ("cartId", "cartUser", "isOrdered", "deliveryAddress") VALUES (1, 3, false, NULL);


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 193
-- Name: Carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Carts_cartId_seq"', 1, true);


--
-- TOC entry 2181 (class 0 OID 16385)
-- Dependencies: 185
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO products (prod_id, prod_name, prod_desc, prod_cost, prod_picture_path) VALUES (1, 'Велосипед Школьник', 'Отличнейший велосипед родом из детства', 9000, '/img/bycicle.jpg');
INSERT INTO products (prod_id, prod_name, prod_desc, prod_cost, prod_picture_path) VALUES (2, 'Гантеля 10 кг.', 'Гантеля наборная 10 кг. блины по 2 кг. Производитель Германия', 1400, NULL);
INSERT INTO products (prod_id, prod_name, prod_desc, prod_cost, prod_picture_path) VALUES (4, 'Велосипед Steals', 'Напалм машина, например', 14050, NULL);
INSERT INTO products (prod_id, prod_name, prod_desc, prod_cost, prod_picture_path) VALUES (3, 'Гантеля 20 кг.', 'Гантеля наборная 20 кг. блины по 2 кг. Производитель Германия', 2800, NULL);
INSERT INTO products (prod_id, prod_name, prod_desc, prod_cost, prod_picture_path) VALUES (5, 'Турник распорный', 'Турник распорный. Производитель "Китай". Оправдай синдром широкой спины широкой спиной', 3000, NULL);
INSERT INTO products (prod_id, prod_name, prod_desc, prod_cost, prod_picture_path) VALUES (6, 'Турник навесной', 'Хороший навесной турник', 4000, NULL);
INSERT INTO products (prod_id, prod_name, prod_desc, prod_cost, prod_picture_path) VALUES (7, 'Гиря двухпудовая', 'Исконный русский снаряд для тренировки силушки богатырской', 6000, NULL);
INSERT INTO products (prod_id, prod_name, prod_desc, prod_cost, prod_picture_path) VALUES (8, 'Шапочка для плавания', 'Шапочка для плавания. Подойдет людям с любой формой оловы', 1000, NULL);
INSERT INTO products (prod_id, prod_name, prod_desc, prod_cost, prod_picture_path) VALUES (9, 'Очки для плавания', 'Очки для плавания', 500, NULL);
INSERT INTO products (prod_id, prod_name, prod_desc, prod_cost, prod_picture_path) VALUES (10, 'Плавки', 'Плавки стильны, модные, удобные', 500, NULL);
INSERT INTO products (prod_id, prod_name, prod_desc, prod_cost, prod_picture_path) VALUES (11, 'Спортивная сумка', 'Спортивная сумка фирмы "Адидас"', 1200, NULL);
INSERT INTO products (prod_id, prod_name, prod_desc, prod_cost, prod_picture_path) VALUES (12, 'Нож туриста', NULL, 100, NULL);


--
-- TOC entry 2192 (class 0 OID 16452)
-- Dependencies: 196
-- Data for Name: ProductsInCarts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "ProductsInCarts" ("prodInCartId", "cartId", "prodId", count) VALUES (1, 1, 1, 2);
INSERT INTO "ProductsInCarts" ("prodInCartId", "cartId", "prodId", count) VALUES (3, 1, 2, 1);


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 195
-- Name: ProductsInCarts_prodInCartId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"ProductsInCarts_prodInCartId_seq"', 3, true);


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 186
-- Name: Products_prodId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Products_prodId_seq"', 12, true);


--
-- TOC entry 2184 (class 0 OID 16401)
-- Dependencies: 188
-- Data for Name: SecurityRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "SecurityRoles" ("roleId", "roleName") VALUES (1, 'Seller');
INSERT INTO "SecurityRoles" ("roleId", "roleName") VALUES (2, 'Buyer');


--
-- TOC entry 2188 (class 0 OID 16419)
-- Dependencies: 192
-- Data for Name: RolesForUsers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "RolesForUsers" ("uniqId", "userId", "roleId") VALUES (1, 2, 1);
INSERT INTO "RolesForUsers" ("uniqId", "userId", "roleId") VALUES (2, 3, 2);


--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 191
-- Name: RolesForUsers_uniqId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"RolesForUsers_uniqId_seq"', 6, true);


--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 187
-- Name: UserRoles_roleId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"UserRoles_roleId_seq"', 2, true);


--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 189
-- Name: Users_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Users_userId_seq"', 3, true);


--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 197
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 1, true);


-- Completed on 2017-11-05 11:38:34

--
-- PostgreSQL database dump complete
--

