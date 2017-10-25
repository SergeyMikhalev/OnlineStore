--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-10-25 21:15:11

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
-- TOC entry 2184 (class 0 OID 16409)
-- Dependencies: 190
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Users" ("userId", login, password) VALUES (2, 'petr', 'vareniki');
INSERT INTO "Users" ("userId", login, password) VALUES (3, 'mikhail', 'lisina');


--
-- TOC entry 2188 (class 0 OID 16439)
-- Dependencies: 194
-- Data for Name: Carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Carts" ("cartId", "cartUser", "isOrdered", "deliveryAddress") VALUES (1, 3, false, NULL);


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 193
-- Name: Carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Carts_cartId_seq"', 1, true);


--
-- TOC entry 2179 (class 0 OID 16385)
-- Dependencies: 185
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Products" ("prodId", "prodName", "prodDesc", "prodPicturePath", "prodCost") VALUES (1, 'Велосипед Школьник', 'Отличнейший велосипед родом из детства', NULL, '9 000,00 ?');
INSERT INTO "Products" ("prodId", "prodName", "prodDesc", "prodPicturePath", "prodCost") VALUES (4, 'Велосипед Steals', 'Напалм машина, например', NULL, '14 050,10 ?');
INSERT INTO "Products" ("prodId", "prodName", "prodDesc", "prodPicturePath", "prodCost") VALUES (2, 'Гантеля 10 кг.', 'Гантеля наборная 10 кг. блины по 2 кг. Производитель Германия', NULL, '1 400,00 ?');


--
-- TOC entry 2190 (class 0 OID 16452)
-- Dependencies: 196
-- Data for Name: ProductsInCarts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "ProductsInCarts" ("prodInCartId", "cartId", "prodId", count) VALUES (1, 1, 1, 2);
INSERT INTO "ProductsInCarts" ("prodInCartId", "cartId", "prodId", count) VALUES (3, 1, 2, 1);


--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 195
-- Name: ProductsInCarts_prodInCartId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"ProductsInCarts_prodInCartId_seq"', 3, true);


--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 186
-- Name: Products_prodId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Products_prodId_seq"', 2, true);


--
-- TOC entry 2182 (class 0 OID 16401)
-- Dependencies: 188
-- Data for Name: SecurityRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "SecurityRoles" ("roleId", "roleName") VALUES (1, 'Seller');
INSERT INTO "SecurityRoles" ("roleId", "roleName") VALUES (2, 'Buyer');


--
-- TOC entry 2186 (class 0 OID 16419)
-- Dependencies: 192
-- Data for Name: RolesForUsers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "RolesForUsers" ("uniqId", "userId", "roleId") VALUES (1, 2, 1);
INSERT INTO "RolesForUsers" ("uniqId", "userId", "roleId") VALUES (2, 3, 2);


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 191
-- Name: RolesForUsers_uniqId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"RolesForUsers_uniqId_seq"', 6, true);


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 187
-- Name: UserRoles_roleId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"UserRoles_roleId_seq"', 2, true);


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 189
-- Name: Users_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Users_userId_seq"', 3, true);


-- Completed on 2017-10-25 21:15:12

--
-- PostgreSQL database dump complete
--

