--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-11-05 11:36:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1251';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "TestDB";
--
-- TOC entry 2185 (class 1262 OID 16384)
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
-- TOC entry 194 (class 1259 OID 16439)
-- Name: Carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Carts" (
    "cartId" integer NOT NULL,
    "cartUser" integer,
    "isOrdered" boolean,
    "deliveryAddress" character varying(100)
);


ALTER TABLE "Carts" OWNER TO postgres;

--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 194
-- Name: TABLE "Carts"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "Carts" IS 'Тележка, она же и заказ';


--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN "Carts"."cartId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Carts"."cartId" IS 'Уникальный идентификатор тележки';


--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN "Carts"."isOrdered"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Carts"."isOrdered" IS 'Перешла ли тележка в состояние заказа';


--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN "Carts"."deliveryAddress"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Carts"."deliveryAddress" IS 'Адрес доставки заказа';


--
-- TOC entry 193 (class 1259 OID 16437)
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
-- Dependencies: 193
-- Name: Carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Carts_cartId_seq" OWNED BY "Carts"."cartId";


--
-- TOC entry 196 (class 1259 OID 16452)
-- Name: ProductsInCarts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "ProductsInCarts" (
    "prodInCartId" integer NOT NULL,
    "cartId" integer,
    "prodId" integer,
    count integer,
    CONSTRAINT "countGt0" CHECK ((count > 0))
);


ALTER TABLE "ProductsInCarts" OWNER TO postgres;

--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE "ProductsInCarts"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "ProductsInCarts" IS 'Описывает продукты, лежащие в тележках';


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN "ProductsInCarts"."prodInCartId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "ProductsInCarts"."prodInCartId" IS 'Уникальный идентификатор продукта в тележке';


--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN "ProductsInCarts".count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "ProductsInCarts".count IS 'количество продукта в тележке';


--
-- TOC entry 195 (class 1259 OID 16450)
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
-- Dependencies: 195
-- Name: ProductsInCarts_prodInCartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "ProductsInCarts_prodInCartId_seq" OWNED BY "ProductsInCarts"."prodInCartId";


--
-- TOC entry 185 (class 1259 OID 16385)
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
-- Dependencies: 185
-- Name: TABLE products; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE products IS 'Таблица с перечнем товаров магазина';


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN products.prod_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN products.prod_id IS 'Уникальный идентификатор товара';


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN products.prod_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN products.prod_name IS 'Название товара';


--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN products.prod_desc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN products.prod_desc IS 'Описание товара';


--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN products.prod_cost; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN products.prod_cost IS 'Цена единицы товара';


--
-- TOC entry 186 (class 1259 OID 16388)
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
-- Dependencies: 186
-- Name: Products_prodId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Products_prodId_seq" OWNED BY products.prod_id;


--
-- TOC entry 192 (class 1259 OID 16419)
-- Name: RolesForUsers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "RolesForUsers" (
    "uniqId" integer NOT NULL,
    "userId" integer,
    "roleId" integer
);


ALTER TABLE "RolesForUsers" OWNER TO postgres;

--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 192
-- Name: TABLE "RolesForUsers"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "RolesForUsers" IS 'Список ролей для каждого из пользоватей';


--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN "RolesForUsers"."uniqId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "RolesForUsers"."uniqId" IS 'Уникальный идентификатор наличия роли у пользователя';


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN "RolesForUsers"."userId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "RolesForUsers"."userId" IS 'Идентификатор пользователя
Внешний ключ из таблицы Users';


--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN "RolesForUsers"."roleId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "RolesForUsers"."roleId" IS 'Уникальный идентификатор роли -внешний клич из таблицы SecurityRoles';


--
-- TOC entry 191 (class 1259 OID 16417)
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
-- Dependencies: 191
-- Name: RolesForUsers_uniqId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "RolesForUsers_uniqId_seq" OWNED BY "RolesForUsers"."uniqId";


--
-- TOC entry 188 (class 1259 OID 16401)
-- Name: SecurityRoles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "SecurityRoles" (
    "roleId" integer NOT NULL,
    "roleName" character varying(50)
);


ALTER TABLE "SecurityRoles" OWNER TO postgres;

--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 188
-- Name: TABLE "SecurityRoles"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "SecurityRoles" IS 'Возможные роли пользователя магазина
Покупатель
Продавец и.т.д.';


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN "SecurityRoles"."roleId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "SecurityRoles"."roleId" IS 'Уникальный идентификатор роли';


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN "SecurityRoles"."roleName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "SecurityRoles"."roleName" IS 'Имя роли';


--
-- TOC entry 187 (class 1259 OID 16399)
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
-- Dependencies: 187
-- Name: UserRoles_roleId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "UserRoles_roleId_seq" OWNED BY "SecurityRoles"."roleId";


--
-- TOC entry 190 (class 1259 OID 16409)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Users" (
    "userId" integer NOT NULL,
    login character varying(30) NOT NULL,
    password character varying(30) NOT NULL
);


ALTER TABLE "Users" OWNER TO postgres;

--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 190
-- Name: TABLE "Users"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "Users" IS 'Пользователи онлайн магазина';


--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN "Users"."userId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Users"."userId" IS 'Уникальный идентификатор пользователя';


--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN "Users".login; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Users".login IS 'имя пользователя для входа в магазин';


--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN "Users".password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Users".password IS 'пароль пользователя';


--
-- TOC entry 189 (class 1259 OID 16407)
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
-- Dependencies: 189
-- Name: Users_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Users_userId_seq" OWNED BY "Users"."userId";


--
-- TOC entry 197 (class 1259 OID 16563)
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
-- TOC entry 2038 (class 2604 OID 16442)
-- Name: Carts cartId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Carts" ALTER COLUMN "cartId" SET DEFAULT nextval('"Carts_cartId_seq"'::regclass);


--
-- TOC entry 2039 (class 2604 OID 16455)
-- Name: ProductsInCarts prodInCartId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ProductsInCarts" ALTER COLUMN "prodInCartId" SET DEFAULT nextval('"ProductsInCarts_prodInCartId_seq"'::regclass);


--
-- TOC entry 2037 (class 2604 OID 16422)
-- Name: RolesForUsers uniqId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "RolesForUsers" ALTER COLUMN "uniqId" SET DEFAULT nextval('"RolesForUsers_uniqId_seq"'::regclass);


--
-- TOC entry 2035 (class 2604 OID 16404)
-- Name: SecurityRoles roleId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "SecurityRoles" ALTER COLUMN "roleId" SET DEFAULT nextval('"UserRoles_roleId_seq"'::regclass);


--
-- TOC entry 2036 (class 2604 OID 16412)
-- Name: Users userId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Users" ALTER COLUMN "userId" SET DEFAULT nextval('"Users_userId_seq"'::regclass);


--
-- TOC entry 2034 (class 2604 OID 16390)
-- Name: products prod_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products ALTER COLUMN prod_id SET DEFAULT nextval('"Products_prodId_seq"'::regclass);


--
-- TOC entry 2054 (class 2606 OID 16444)
-- Name: Carts key_cartId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Carts"
    ADD CONSTRAINT "key_cartId" PRIMARY KEY ("cartId");


--
-- TOC entry 2042 (class 2606 OID 16398)
-- Name: products key_prodId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products
    ADD CONSTRAINT "key_prodId" PRIMARY KEY (prod_id);


--
-- TOC entry 2056 (class 2606 OID 16457)
-- Name: ProductsInCarts key_prodInCartId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ProductsInCarts"
    ADD CONSTRAINT "key_prodInCartId" PRIMARY KEY ("prodInCartId");


--
-- TOC entry 2044 (class 2606 OID 16406)
-- Name: SecurityRoles key_roleId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "SecurityRoles"
    ADD CONSTRAINT "key_roleId" PRIMARY KEY ("roleId");


--
-- TOC entry 2050 (class 2606 OID 16424)
-- Name: RolesForUsers key_uniqId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "RolesForUsers"
    ADD CONSTRAINT "key_uniqId" PRIMARY KEY ("uniqId");


--
-- TOC entry 2046 (class 2606 OID 16414)
-- Name: Users key_userId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "key_userId" PRIMARY KEY ("userId");


--
-- TOC entry 2058 (class 2606 OID 16469)
-- Name: ProductsInCarts uniq_cartAndProd; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ProductsInCarts"
    ADD CONSTRAINT "uniq_cartAndProd" UNIQUE ("cartId", "prodId");


--
-- TOC entry 2052 (class 2606 OID 16436)
-- Name: RolesForUsers unique_UserAndRole; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "RolesForUsers"
    ADD CONSTRAINT "unique_UserAndRole" UNIQUE ("userId", "roleId");


--
-- TOC entry 2048 (class 2606 OID 16416)
-- Name: Users unique_login; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT unique_login UNIQUE (login);


--
-- TOC entry 2062 (class 2606 OID 16458)
-- Name: ProductsInCarts fkey_cart; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ProductsInCarts"
    ADD CONSTRAINT fkey_cart FOREIGN KEY ("cartId") REFERENCES "Carts"("cartId");


--
-- TOC entry 2061 (class 2606 OID 16445)
-- Name: Carts fkey_cartUser; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Carts"
    ADD CONSTRAINT "fkey_cartUser" FOREIGN KEY ("cartUser") REFERENCES "Users"("userId");


--
-- TOC entry 2063 (class 2606 OID 16463)
-- Name: ProductsInCarts fkey_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ProductsInCarts"
    ADD CONSTRAINT fkey_prod FOREIGN KEY ("prodId") REFERENCES products(prod_id);


--
-- TOC entry 2060 (class 2606 OID 16430)
-- Name: RolesForUsers fkey_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "RolesForUsers"
    ADD CONSTRAINT fkey_roles FOREIGN KEY ("roleId") REFERENCES "SecurityRoles"("roleId");


--
-- TOC entry 2059 (class 2606 OID 16425)
-- Name: RolesForUsers fkey_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "RolesForUsers"
    ADD CONSTRAINT fkey_user FOREIGN KEY ("userId") REFERENCES "Users"("userId");


--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-11-05 11:36:25

--
-- PostgreSQL database dump complete
--

