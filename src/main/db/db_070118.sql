--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2018-01-07 17:50:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "TestDB";
--
-- TOC entry 2185 (class 1262 OID 16987)
-- Name: TestDB; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "TestDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE "TestDB" OWNER TO postgres;

\connect "TestDB"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16988)
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE carts (
    cart_id integer NOT NULL,
    cart_user integer,
    purchased boolean,
    delivery_address character varying(100)
);


ALTER TABLE carts OWNER TO postgres;

--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 185
-- Name: TABLE carts; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE carts IS 'Тележка, она же и заказ';


--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN carts.cart_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN carts.cart_id IS 'Уникальный идентификатор тележки';


--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN carts.purchased; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN carts.purchased IS 'Перешла ли тележка в состояние заказа';


--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN carts.delivery_address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN carts.delivery_address IS 'Адрес доставки заказа';


--
-- TOC entry 186 (class 1259 OID 16991)
-- Name: Carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Carts_cartId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Carts_cartId_seq" OWNER TO postgres;

--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 186
-- Name: Carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Carts_cartId_seq" OWNED BY carts.cart_id;


--
-- TOC entry 187 (class 1259 OID 16993)
-- Name: products_in_carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE products_in_carts (
    prod_in_cart_id integer NOT NULL,
    cart_id integer,
    prod_id integer,
    count integer,
    CONSTRAINT "countGt0" CHECK ((count > 0))
);


ALTER TABLE products_in_carts OWNER TO postgres;

--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE products_in_carts; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE products_in_carts IS 'Описывает продукты, лежащие в тележках';


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN products_in_carts.prod_in_cart_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN products_in_carts.prod_in_cart_id IS 'Уникальный идентификатор продукта в тележке';


--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN products_in_carts.count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN products_in_carts.count IS 'количество продукта в тележке';


--
-- TOC entry 188 (class 1259 OID 16997)
-- Name: ProductsInCarts_prodInCartId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "ProductsInCarts_prodInCartId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ProductsInCarts_prodInCartId_seq" OWNER TO postgres;

--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 188
-- Name: ProductsInCarts_prodInCartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "ProductsInCarts_prodInCartId_seq" OWNED BY products_in_carts.prod_in_cart_id;


--
-- TOC entry 189 (class 1259 OID 16999)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE products (
    prod_id integer NOT NULL,
    prod_name character varying(100),
    prod_desc character varying(250),
    prod_cost integer,
    prod_picture_path character varying(200)
);


ALTER TABLE products OWNER TO postgres;

--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 189
-- Name: TABLE products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE products IS 'Таблица с перечнем товаров магазина';


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN products.prod_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN products.prod_id IS 'Уникальный идентификатор товара';


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN products.prod_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN products.prod_name IS 'Название товара';


--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN products.prod_desc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN products.prod_desc IS 'Описание товара';


--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN products.prod_cost; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN products.prod_cost IS 'Цена единицы товара';


--
-- TOC entry 190 (class 1259 OID 17005)
-- Name: Products_prodId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Products_prodId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Products_prodId_seq" OWNER TO postgres;

--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 190
-- Name: Products_prodId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Products_prodId_seq" OWNED BY products.prod_id;


--
-- TOC entry 191 (class 1259 OID 17007)
-- Name: roles_for_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roles_for_users (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE roles_for_users OWNER TO postgres;

--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE roles_for_users; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE roles_for_users IS 'Список ролей для каждого из пользоватей';


--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN roles_for_users.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN roles_for_users.id IS 'Уникальный идентификатор наличия роли у пользователя';


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN roles_for_users.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN roles_for_users.user_id IS 'Идентификатор пользователя
Внешний ключ из таблицы Users';


--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN roles_for_users.role_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN roles_for_users.role_id IS 'Уникальный идентификатор роли -внешний клич из таблицы SecurityRoles';


--
-- TOC entry 192 (class 1259 OID 17010)
-- Name: RolesForUsers_uniqId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "RolesForUsers_uniqId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "RolesForUsers_uniqId_seq" OWNER TO postgres;

--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 192
-- Name: RolesForUsers_uniqId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "RolesForUsers_uniqId_seq" OWNED BY roles_for_users.id;


--
-- TOC entry 193 (class 1259 OID 17012)
-- Name: security_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE security_roles (
    role_id integer NOT NULL,
    role_name character varying(50)
);


ALTER TABLE security_roles OWNER TO postgres;

--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 193
-- Name: TABLE security_roles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE security_roles IS 'Возможные роли пользователя магазина
Покупатель
Продавец и.т.д.';


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN security_roles.role_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN security_roles.role_id IS 'Уникальный идентификатор роли';


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN security_roles.role_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN security_roles.role_name IS 'Имя роли';


--
-- TOC entry 194 (class 1259 OID 17015)
-- Name: UserRoles_roleId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "UserRoles_roleId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "UserRoles_roleId_seq" OWNER TO postgres;

--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 194
-- Name: UserRoles_roleId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "UserRoles_roleId_seq" OWNED BY security_roles.role_id;


--
-- TOC entry 195 (class 1259 OID 17017)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    user_id integer NOT NULL,
    login character varying(30) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 195
-- Name: TABLE users; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE users IS 'Пользователи онлайн магазина';


--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN users.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.user_id IS 'Уникальный идентификатор пользователя';


--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN users.login; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.login IS 'имя пользователя для входа в магазин';


--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN users.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.password IS 'пароль пользователя';


--
-- TOC entry 196 (class 1259 OID 17020)
-- Name: Users_userId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Users_userId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Users_userId_seq" OWNER TO postgres;

--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 196
-- Name: Users_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Users_userId_seq" OWNED BY users.user_id;


--
-- TOC entry 197 (class 1259 OID 17022)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 2034 (class 2604 OID 17024)
-- Name: carts cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY carts ALTER COLUMN cart_id SET DEFAULT nextval('"Carts_cartId_seq"'::regclass);


--
-- TOC entry 2037 (class 2604 OID 17029)
-- Name: products prod_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products ALTER COLUMN prod_id SET DEFAULT nextval('"Products_prodId_seq"'::regclass);


--
-- TOC entry 2035 (class 2604 OID 17025)
-- Name: products_in_carts prod_in_cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_in_carts ALTER COLUMN prod_in_cart_id SET DEFAULT nextval('"ProductsInCarts_prodInCartId_seq"'::regclass);


--
-- TOC entry 2038 (class 2604 OID 17026)
-- Name: roles_for_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles_for_users ALTER COLUMN id SET DEFAULT nextval('"RolesForUsers_uniqId_seq"'::regclass);


--
-- TOC entry 2039 (class 2604 OID 17027)
-- Name: security_roles role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY security_roles ALTER COLUMN role_id SET DEFAULT nextval('"UserRoles_roleId_seq"'::regclass);


--
-- TOC entry 2040 (class 2604 OID 17028)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('"Users_userId_seq"'::regclass);


--
-- TOC entry 2042 (class 2606 OID 17031)
-- Name: carts key_cartId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY carts
    ADD CONSTRAINT "key_cartId" PRIMARY KEY (cart_id);


--
-- TOC entry 2048 (class 2606 OID 17033)
-- Name: products key_prodId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products
    ADD CONSTRAINT "key_prodId" PRIMARY KEY (prod_id);


--
-- TOC entry 2044 (class 2606 OID 17035)
-- Name: products_in_carts key_prodInCartId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_in_carts
    ADD CONSTRAINT "key_prodInCartId" PRIMARY KEY (prod_in_cart_id);


--
-- TOC entry 2054 (class 2606 OID 17037)
-- Name: security_roles key_roleId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY security_roles
    ADD CONSTRAINT "key_roleId" PRIMARY KEY (role_id);


--
-- TOC entry 2050 (class 2606 OID 17039)
-- Name: roles_for_users key_uniqId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles_for_users
    ADD CONSTRAINT "key_uniqId" PRIMARY KEY (id);


--
-- TOC entry 2056 (class 2606 OID 17041)
-- Name: users key_userId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT "key_userId" PRIMARY KEY (user_id);


--
-- TOC entry 2046 (class 2606 OID 17043)
-- Name: products_in_carts uniq_cartAndProd; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_in_carts
    ADD CONSTRAINT "uniq_cartAndProd" UNIQUE (cart_id, prod_id);


--
-- TOC entry 2052 (class 2606 OID 17045)
-- Name: roles_for_users unique_UserAndRole; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles_for_users
    ADD CONSTRAINT "unique_UserAndRole" UNIQUE (user_id, role_id);


--
-- TOC entry 2058 (class 2606 OID 17047)
-- Name: users unique_login; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT unique_login UNIQUE (login);


--
-- TOC entry 2060 (class 2606 OID 17048)
-- Name: products_in_carts fkey_cart; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_in_carts
    ADD CONSTRAINT fkey_cart FOREIGN KEY (cart_id) REFERENCES carts(cart_id);


--
-- TOC entry 2059 (class 2606 OID 17053)
-- Name: carts fkey_cartUser; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY carts
    ADD CONSTRAINT "fkey_cartUser" FOREIGN KEY (cart_user) REFERENCES users(user_id);


--
-- TOC entry 2061 (class 2606 OID 17058)
-- Name: products_in_carts fkey_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products_in_carts
    ADD CONSTRAINT fkey_prod FOREIGN KEY (prod_id) REFERENCES products(prod_id);


--
-- TOC entry 2062 (class 2606 OID 17063)
-- Name: roles_for_users fkey_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles_for_users
    ADD CONSTRAINT fkey_roles FOREIGN KEY (role_id) REFERENCES security_roles(role_id);


--
-- TOC entry 2063 (class 2606 OID 17068)
-- Name: roles_for_users fkey_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles_for_users
    ADD CONSTRAINT fkey_user FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-01-07 17:50:51

--
-- PostgreSQL database dump complete
--

