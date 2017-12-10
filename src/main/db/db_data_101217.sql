--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-12-10 21:37:28

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
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 186
-- Name: Carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Carts_cartId_seq"', 2, true);


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 188
-- Name: ProductsInCarts_prodInCartId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"ProductsInCarts_prodInCartId_seq"', 7, true);


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 190
-- Name: Products_prodId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Products_prodId_seq"', 12, true);


--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 192
-- Name: RolesForUsers_uniqId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"RolesForUsers_uniqId_seq"', 11, true);


--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 194
-- Name: UserRoles_roleId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"UserRoles_roleId_seq"', 2, true);


--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 196
-- Name: Users_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Users_userId_seq"', 3, true);


--
-- TOC entry 2191 (class 0 OID 17017)
-- Dependencies: 195
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (user_id, login, password) VALUES (2, 'petr', 'vareniki');
INSERT INTO users (user_id, login, password) VALUES (3, 'mikhail', 'lisina');
INSERT INTO users (user_id, login, password) VALUES (71, 'Zhorzh', 'zhorzh');
INSERT INTO users (user_id, login, password) VALUES (78, 'testU', 'testP');


--
-- TOC entry 2181 (class 0 OID 16988)
-- Dependencies: 185
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO carts (cart_id, cart_user, is_ordered, delivery_address) VALUES (1, 3, true, NULL);
INSERT INTO carts (cart_id, cart_user, is_ordered, delivery_address) VALUES (2, 2, false, NULL);
INSERT INTO carts (cart_id, cart_user, is_ordered, delivery_address) VALUES (3, 71, false, NULL);
INSERT INTO carts (cart_id, cart_user, is_ordered, delivery_address) VALUES (79, 78, false, NULL);


--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 197
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 82, true);


--
-- TOC entry 2185 (class 0 OID 16999)
-- Dependencies: 189
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
-- TOC entry 2183 (class 0 OID 16993)
-- Dependencies: 187
-- Data for Name: products_in_carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO products_in_carts (prod_in_cart_id, cart_id, prod_id, count) VALUES (65, 1, 1, 16);
INSERT INTO products_in_carts (prod_in_cart_id, cart_id, prod_id, count) VALUES (66, 1, 2, 9);
INSERT INTO products_in_carts (prod_in_cart_id, cart_id, prod_id, count) VALUES (74, 3, 4, 3);
INSERT INTO products_in_carts (prod_in_cart_id, cart_id, prod_id, count) VALUES (75, 3, 12, 5);
INSERT INTO products_in_carts (prod_in_cart_id, cart_id, prod_id, count) VALUES (72, 3, 1, 5);
INSERT INTO products_in_carts (prod_in_cart_id, cart_id, prod_id, count) VALUES (82, 79, 4, 1);
INSERT INTO products_in_carts (prod_in_cart_id, cart_id, prod_id, count) VALUES (81, 79, 2, 2);


--
-- TOC entry 2189 (class 0 OID 17012)
-- Dependencies: 193
-- Data for Name: security_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO security_roles (role_id, role_name) VALUES (1, 'Seller');
INSERT INTO security_roles (role_id, role_name) VALUES (2, 'Buyer');


--
-- TOC entry 2187 (class 0 OID 17007)
-- Dependencies: 191
-- Data for Name: roles_for_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO roles_for_users (id, user_id, role_id) VALUES (1, 2, 1);
INSERT INTO roles_for_users (id, user_id, role_id) VALUES (2, 3, 2);
INSERT INTO roles_for_users (id, user_id, role_id) VALUES (8, 71, 2);
INSERT INTO roles_for_users (id, user_id, role_id) VALUES (11, 78, 2);


-- Completed on 2017-12-10 21:37:28

--
-- PostgreSQL database dump complete
--

