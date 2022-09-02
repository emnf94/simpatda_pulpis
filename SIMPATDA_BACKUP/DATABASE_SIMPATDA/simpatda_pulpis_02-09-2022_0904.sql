--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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

--
-- Name: dblink_pkey_results; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.dblink_pkey_results AS (
);


ALTER TYPE public.dblink_pkey_results OWNER TO postgres;

--
-- Name: dblink(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink(text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text) OWNER TO postgres;

--
-- Name: dblink(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink(text, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text, boolean) OWNER TO postgres;

--
-- Name: dblink(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink(text, text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text, text) OWNER TO postgres;

--
-- Name: dblink(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink(text, text, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_build_sql_delete(text, int2vector, integer, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_build_sql_delete(text, int2vector, integer, text[]) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_build_sql_delete';


ALTER FUNCTION public.dblink_build_sql_delete(text, int2vector, integer, text[]) OWNER TO postgres;

--
-- Name: dblink_build_sql_insert(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_build_sql_insert(text, int2vector, integer, text[], text[]) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_build_sql_insert';


ALTER FUNCTION public.dblink_build_sql_insert(text, int2vector, integer, text[], text[]) OWNER TO postgres;

--
-- Name: dblink_build_sql_update(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_build_sql_update(text, int2vector, integer, text[], text[]) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_build_sql_update';


ALTER FUNCTION public.dblink_build_sql_update(text, int2vector, integer, text[], text[]) OWNER TO postgres;

--
-- Name: dblink_cancel_query(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_cancel_query(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_cancel_query';


ALTER FUNCTION public.dblink_cancel_query(text) OWNER TO postgres;

--
-- Name: dblink_close(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_close(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text) OWNER TO postgres;

--
-- Name: dblink_close(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_close(text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text, boolean) OWNER TO postgres;

--
-- Name: dblink_close(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_close(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text, text) OWNER TO postgres;

--
-- Name: dblink_close(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_close(text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_connect(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_connect(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect(text) OWNER TO postgres;

--
-- Name: dblink_connect(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_connect(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect(text, text) OWNER TO postgres;

--
-- Name: dblink_connect_u(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_connect_u(text) RETURNS text
    LANGUAGE c STRICT SECURITY DEFINER
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect_u(text) OWNER TO postgres;

--
-- Name: dblink_connect_u(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_connect_u(text, text) RETURNS text
    LANGUAGE c STRICT SECURITY DEFINER
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect_u(text, text) OWNER TO postgres;

--
-- Name: dblink_current_query(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_current_query() RETURNS text
    LANGUAGE c
    AS '$libdir/dblink', 'dblink_current_query';


ALTER FUNCTION public.dblink_current_query() OWNER TO postgres;

--
-- Name: dblink_disconnect(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_disconnect() RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_disconnect';


ALTER FUNCTION public.dblink_disconnect() OWNER TO postgres;

--
-- Name: dblink_disconnect(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_disconnect(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_disconnect';


ALTER FUNCTION public.dblink_disconnect(text) OWNER TO postgres;

--
-- Name: dblink_error_message(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_error_message(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_error_message';


ALTER FUNCTION public.dblink_error_message(text) OWNER TO postgres;

--
-- Name: dblink_exec(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_exec(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text) OWNER TO postgres;

--
-- Name: dblink_exec(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_exec(text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text, boolean) OWNER TO postgres;

--
-- Name: dblink_exec(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_exec(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text, text) OWNER TO postgres;

--
-- Name: dblink_exec(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_exec(text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_fetch(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_fetch(text, integer) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, integer) OWNER TO postgres;

--
-- Name: dblink_fetch(text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_fetch(text, integer, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, integer, boolean) OWNER TO postgres;

--
-- Name: dblink_fetch(text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_fetch(text, text, integer) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, text, integer) OWNER TO postgres;

--
-- Name: dblink_fetch(text, text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_fetch(text, text, integer, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, text, integer, boolean) OWNER TO postgres;

--
-- Name: dblink_get_connections(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_get_connections() RETURNS text[]
    LANGUAGE c
    AS '$libdir/dblink', 'dblink_get_connections';


ALTER FUNCTION public.dblink_get_connections() OWNER TO postgres;

--
-- Name: dblink_get_notify(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_get_notify(OUT notify_name text, OUT be_pid integer, OUT extra text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_notify';


ALTER FUNCTION public.dblink_get_notify(OUT notify_name text, OUT be_pid integer, OUT extra text) OWNER TO postgres;

--
-- Name: dblink_get_notify(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_get_notify(conname text, OUT notify_name text, OUT be_pid integer, OUT extra text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_notify';


ALTER FUNCTION public.dblink_get_notify(conname text, OUT notify_name text, OUT be_pid integer, OUT extra text) OWNER TO postgres;

--
-- Name: dblink_get_pkey(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_get_pkey(text) RETURNS SETOF public.dblink_pkey_results
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_pkey';


ALTER FUNCTION public.dblink_get_pkey(text) OWNER TO postgres;

--
-- Name: dblink_get_result(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_get_result(text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_result';


ALTER FUNCTION public.dblink_get_result(text) OWNER TO postgres;

--
-- Name: dblink_get_result(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_get_result(text, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_result';


ALTER FUNCTION public.dblink_get_result(text, boolean) OWNER TO postgres;

--
-- Name: dblink_is_busy(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_is_busy(text) RETURNS integer
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_is_busy';


ALTER FUNCTION public.dblink_is_busy(text) OWNER TO postgres;

--
-- Name: dblink_open(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_open(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text) OWNER TO postgres;

--
-- Name: dblink_open(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_open(text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_open(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_open(text, text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text, text) OWNER TO postgres;

--
-- Name: dblink_open(text, text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_open(text, text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_send_query(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dblink_send_query(text, text) RETURNS integer
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_send_query';


ALTER FUNCTION public.dblink_send_query(text, text) OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permission_id_seq
    START WITH 420
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission (
    id bigint DEFAULT nextval('public.permission_id_seq'::regclass) NOT NULL,
    permission_name character varying(45) NOT NULL,
    resource_id bigint NOT NULL,
    alias character varying(255),
    permission_role character varying(255)
);


ALTER TABLE public.permission OWNER TO postgres;

--
-- Name: permission_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission_resource (
    s_iduser integer,
    s_idpermission integer
);


ALTER TABLE public.permission_resource OWNER TO postgres;

--
-- Name: rekam_penyetoran_ke_bank_rektorkebank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rekam_penyetoran_ke_bank_rektorkebank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rekam_penyetoran_ke_bank_rektorkebank_id_seq OWNER TO postgres;

--
-- Name: resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resource_id_seq
    START WITH 34
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_id_seq OWNER TO postgres;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource (
    id bigint DEFAULT nextval('public.resource_id_seq'::regclass) NOT NULL,
    resource_name character varying(255) NOT NULL
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- Name: role_rid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_rid_seq
    START WITH 7
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_rid_seq OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    rid bigint DEFAULT nextval('public.role_rid_seq'::regclass) NOT NULL,
    role_name character varying(60) NOT NULL,
    status character(255) DEFAULT 'Active'::bpchar
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: s_air_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_air_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_air_seq OWNER TO postgres;

--
-- Name: s_air; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_air (
    s_idair integer DEFAULT nextval('public.s_air_seq'::regclass) NOT NULL,
    s_idperuntukan integer DEFAULT 0,
    s_volume1 double precision DEFAULT 0,
    s_volume2 double precision DEFAULT 0,
    s_volume3 double precision DEFAULT 0,
    s_volume5 double precision DEFAULT 0,
    s_volume4 double precision DEFAULT 0
);


ALTER TABLE public.s_air OWNER TO postgres;

--
-- Name: s_air_jenis_s_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_air_jenis_s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_air_jenis_s_id_seq OWNER TO postgres;

--
-- Name: s_air_kelompok_s_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_air_kelompok_s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_air_kelompok_s_id_seq OWNER TO postgres;

--
-- Name: s_air_tarif_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_air_tarif_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_air_tarif_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_air_tarifpipa_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_air_tarifpipa_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_air_tarifpipa_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_air_zona_s_idzona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_air_zona_s_idzona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_air_zona_s_idzona_seq OWNER TO postgres;

--
-- Name: s_airjenis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_airjenis (
    s_idjenisair integer DEFAULT nextval('public.s_air_jenis_s_id_seq'::regclass) NOT NULL,
    s_bobot integer NOT NULL,
    s_keterangan character varying(100) NOT NULL
);


ALTER TABLE public.s_airjenis OWNER TO postgres;

--
-- Name: s_airperuntukan_s_idperuntukan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_airperuntukan_s_idperuntukan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_airperuntukan_s_idperuntukan_seq OWNER TO postgres;

--
-- Name: s_airperuntukan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_airperuntukan (
    s_idperuntukan integer DEFAULT nextval('public.s_airperuntukan_s_idperuntukan_seq'::regclass) NOT NULL,
    s_namaperuntukan character varying(50) NOT NULL
);


ALTER TABLE public.s_airperuntukan OWNER TO postgres;

--
-- Name: s_cekungan_s_idcekungan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_cekungan_s_idcekungan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_cekungan_s_idcekungan_seq OWNER TO postgres;

--
-- Name: s_cekungan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_cekungan (
    s_idcekungan integer DEFAULT nextval('public.s_cekungan_s_idcekungan_seq'::regclass) NOT NULL,
    s_kriteria character varying(255) NOT NULL,
    s_nilai integer NOT NULL
);


ALTER TABLE public.s_cekungan OWNER TO postgres;

--
-- Name: s_faktorkerusakan_s_idkerusakan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_faktorkerusakan_s_idkerusakan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_faktorkerusakan_s_idkerusakan_seq OWNER TO postgres;

--
-- Name: s_faktorkerusakan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_faktorkerusakan (
    s_idkerusakan integer DEFAULT nextval('public.s_faktorkerusakan_s_idkerusakan_seq'::regclass) NOT NULL,
    s_kriteria character varying(255) NOT NULL,
    s_nilai integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.s_faktorkerusakan OWNER TO postgres;

--
-- Name: s_faktorkualitasair_s_idfaktorkualitas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_faktorkualitasair_s_idfaktorkualitas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_faktorkualitasair_s_idfaktorkualitas_seq OWNER TO postgres;

--
-- Name: s_faktorkualitasair; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_faktorkualitasair (
    s_idfaktorkualitas integer DEFAULT nextval('public.s_faktorkualitasair_s_idfaktorkualitas_seq'::regclass) NOT NULL,
    s_namafaktorkualitas character varying(255) NOT NULL,
    s_nilai integer
);


ALTER TABLE public.s_faktorkualitasair OWNER TO postgres;

--
-- Name: s_faktorluasarea_s_idfaktorluasarea_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_faktorluasarea_s_idfaktorluasarea_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_faktorluasarea_s_idfaktorluasarea_seq OWNER TO postgres;

--
-- Name: s_faktorluasarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_faktorluasarea (
    s_idfaktorluasarea integer DEFAULT nextval('public.s_faktorluasarea_s_idfaktorluasarea_seq'::regclass) NOT NULL,
    s_areapengaruh character varying(255) NOT NULL,
    s_nilai integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.s_faktorluasarea OWNER TO postgres;

--
-- Name: s_faktorsumberair_s_idsumberair_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_faktorsumberair_s_idsumberair_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_faktorsumberair_s_idsumberair_seq OWNER TO postgres;

--
-- Name: s_faktorsumberair; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_faktorsumberair (
    s_idsumberair integer DEFAULT nextval('public.s_faktorsumberair_s_idsumberair_seq'::regclass) NOT NULL,
    s_jenissumber character varying(255) NOT NULL,
    s_nilai integer NOT NULL
);


ALTER TABLE public.s_faktorsumberair OWNER TO postgres;

--
-- Name: s_hargaairbaku_s_idhargaairbaku_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_hargaairbaku_s_idhargaairbaku_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_hargaairbaku_s_idhargaairbaku_seq OWNER TO postgres;

--
-- Name: s_hargaairbaku; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_hargaairbaku (
    s_idhargaairbaku integer DEFAULT nextval('public.s_hargaairbaku_s_idhargaairbaku_seq'::regclass) NOT NULL,
    s_idjaringan integer NOT NULL,
    s_harga double precision NOT NULL
);


ALTER TABLE public.s_hargaairbaku OWNER TO postgres;

--
-- Name: s_hargasatuanlistrik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_hargasatuanlistrik (
    s_idhargasatuanlistrik integer,
    s_namasatuanlistrik character varying(100),
    s_hargasatuanlistrik real
);


ALTER TABLE public.s_hargasatuanlistrik OWNER TO postgres;

--
-- Name: s_ho_gangguan_s_idgangguan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_ho_gangguan_s_idgangguan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_ho_gangguan_s_idgangguan_seq OWNER TO postgres;

--
-- Name: s_ho_gangguan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_ho_gangguan (
    s_idgangguan integer DEFAULT nextval('public.s_ho_gangguan_s_idgangguan_seq'::regclass) NOT NULL,
    s_namagangguan character varying(100) NOT NULL,
    s_indeks double precision NOT NULL
);


ALTER TABLE public.s_ho_gangguan OWNER TO postgres;

--
-- Name: s_ho_lokasi_s_idlokasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_ho_lokasi_s_idlokasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_ho_lokasi_s_idlokasi_seq OWNER TO postgres;

--
-- Name: s_ho_lokasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_ho_lokasi (
    s_idlokasi integer DEFAULT nextval('public.s_ho_lokasi_s_idlokasi_seq'::regclass) NOT NULL,
    s_namalokasi character varying(100) NOT NULL,
    s_indeks double precision NOT NULL
);


ALTER TABLE public.s_ho_lokasi OWNER TO postgres;

--
-- Name: s_ho_luas_s_idluas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_ho_luas_s_idluas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_ho_luas_s_idluas_seq OWNER TO postgres;

--
-- Name: s_ho_luas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_ho_luas (
    s_idluas integer DEFAULT nextval('public.s_ho_luas_s_idluas_seq'::regclass) NOT NULL,
    s_luasawal integer NOT NULL,
    s_luasakhir integer NOT NULL,
    s_indeks double precision NOT NULL
);


ALTER TABLE public.s_ho_luas OWNER TO postgres;

--
-- Name: s_ho_skala_s_idskala_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_ho_skala_s_idskala_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_ho_skala_s_idskala_seq OWNER TO postgres;

--
-- Name: s_ho_skala; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_ho_skala (
    s_idskala integer DEFAULT nextval('public.s_ho_skala_s_idskala_seq'::regclass) NOT NULL,
    s_namaskala character varying(100) NOT NULL,
    s_tarif integer,
    s_satuan character varying(15)
);


ALTER TABLE public.s_ho_skala OWNER TO postgres;

--
-- Name: s_imb_gunabgn_s_idgunabgn_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_imb_gunabgn_s_idgunabgn_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_imb_gunabgn_s_idgunabgn_seq OWNER TO postgres;

--
-- Name: s_imb_gunabgn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_imb_gunabgn (
    s_idgunabgn integer DEFAULT nextval('public.s_imb_gunabgn_s_idgunabgn_seq'::regclass) NOT NULL,
    s_namagunabgn character varying(100) NOT NULL,
    s_koefisien double precision NOT NULL
);


ALTER TABLE public.s_imb_gunabgn OWNER TO postgres;

--
-- Name: s_imb_kondisi_s_idkondisi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_imb_kondisi_s_idkondisi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_imb_kondisi_s_idkondisi_seq OWNER TO postgres;

--
-- Name: s_imb_kondisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_imb_kondisi (
    s_idkondisi integer DEFAULT nextval('public.s_imb_kondisi_s_idkondisi_seq'::regclass) NOT NULL,
    s_namakondisi character varying(100) NOT NULL,
    s_koefisien double precision NOT NULL
);


ALTER TABLE public.s_imb_kondisi OWNER TO postgres;

--
-- Name: s_imb_lantai_s_idlantai_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_imb_lantai_s_idlantai_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_imb_lantai_s_idlantai_seq OWNER TO postgres;

--
-- Name: s_imb_lantai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_imb_lantai (
    s_idlantai integer DEFAULT nextval('public.s_imb_lantai_s_idlantai_seq'::regclass) NOT NULL,
    s_namalantai character varying(100) NOT NULL,
    s_koefisien double precision NOT NULL
);


ALTER TABLE public.s_imb_lantai OWNER TO postgres;

--
-- Name: s_imb_lokasi_s_idlokasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_imb_lokasi_s_idlokasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_imb_lokasi_s_idlokasi_seq OWNER TO postgres;

--
-- Name: s_imb_lokasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_imb_lokasi (
    s_idlokasi integer DEFAULT nextval('public.s_imb_lokasi_s_idlokasi_seq'::regclass) NOT NULL,
    s_namalokasi character varying(100) NOT NULL,
    s_koefisien double precision NOT NULL
);


ALTER TABLE public.s_imb_lokasi OWNER TO postgres;

--
-- Name: s_imb_luas_s_idluas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_imb_luas_s_idluas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_imb_luas_s_idluas_seq OWNER TO postgres;

--
-- Name: s_imb_luas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_imb_luas (
    s_idluas integer DEFAULT nextval('public.s_imb_luas_s_idluas_seq'::regclass) NOT NULL,
    s_namaluas character varying(100) NOT NULL,
    s_koefisien double precision NOT NULL
);


ALTER TABLE public.s_imb_luas OWNER TO postgres;

--
-- Name: s_imb_tarif_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_imb_tarif_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_imb_tarif_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_imb_tarif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_imb_tarif (
    s_idtarif integer DEFAULT nextval('public.s_imb_tarif_s_idtarif_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15)
);


ALTER TABLE public.s_imb_tarif OWNER TO postgres;

--
-- Name: s_jaringanpdam_s_idjaringan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_jaringanpdam_s_idjaringan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_jaringanpdam_s_idjaringan_seq OWNER TO postgres;

--
-- Name: s_jaringanpdam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_jaringanpdam (
    s_idjaringan integer DEFAULT nextval('public.s_jaringanpdam_s_idjaringan_seq'::regclass) NOT NULL,
    s_namajaringan character varying(255) NOT NULL,
    s_nilai integer
);


ALTER TABLE public.s_jaringanpdam OWNER TO postgres;

--
-- Name: s_jenisobjek_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_jenisobjek_seq
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_jenisobjek_seq OWNER TO postgres;

--
-- Name: s_jenisobjek; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_jenisobjek (
    s_idjenis integer DEFAULT nextval('public.s_jenisobjek_seq'::regclass) NOT NULL,
    s_namajenis character varying(100) NOT NULL,
    s_namajenissingkat character varying(70) NOT NULL,
    t_akhirlapor character varying(2) NOT NULL,
    t_akhirbayar character varying(2) NOT NULL,
    t_jmlharitempo character varying(3) DEFAULT NULL::character varying,
    s_jenispungutan character varying(10) NOT NULL
);


ALTER TABLE public.s_jenisobjek OWNER TO postgres;

--
-- Name: s_jenisobjek_baru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_jenisobjek_baru (
    s_idjenis integer DEFAULT nextval('public.s_jenisobjek_seq'::regclass) NOT NULL,
    s_namajenis character varying(100) NOT NULL,
    s_namajenissingkat character varying(70) NOT NULL,
    t_akhirlapor character varying(2) NOT NULL,
    t_akhirbayar character varying(2) NOT NULL,
    t_jmlharitempo character varying(3) DEFAULT NULL::character varying,
    s_jenispungutan character varying(10) NOT NULL
);


ALTER TABLE public.s_jenisobjek_baru OWNER TO postgres;

--
-- Name: s_jenisobjeklama; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_jenisobjeklama (
    s_idjenis integer DEFAULT nextval('public.s_jenisobjek_seq'::regclass) NOT NULL,
    s_namajenis character varying(100) NOT NULL,
    s_namajenissingkat character varying(70) NOT NULL,
    t_akhirlapor character varying(2) NOT NULL,
    t_akhirbayar character varying(2) NOT NULL,
    t_jmlharitempo character varying(3) DEFAULT NULL::character varying,
    s_jenispungutan character varying(10) NOT NULL
);


ALTER TABLE public.s_jenisobjeklama OWNER TO postgres;

--
-- Name: s_jenisreklame_s_idjenisreklame_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_jenisreklame_s_idjenisreklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_jenisreklame_s_idjenisreklame_seq OWNER TO postgres;

--
-- Name: s_jenisreklame; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_jenisreklame (
    s_idjenisreklame integer DEFAULT nextval('public.s_jenisreklame_s_idjenisreklame_seq'::regclass) NOT NULL,
    s_namajenisreklame character varying(50) NOT NULL
);


ALTER TABLE public.s_jenisreklame OWNER TO postgres;

--
-- Name: s_jenissurat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_jenissurat_seq
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_jenissurat_seq OWNER TO postgres;

--
-- Name: s_jenissurat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_jenissurat (
    s_idsurat integer DEFAULT nextval('public.s_jenissurat_seq'::regclass) NOT NULL,
    s_namasurat character varying(70) NOT NULL,
    s_namasingkatsurat character varying(20) NOT NULL
);


ALTER TABLE public.s_jenissurat OWNER TO postgres;

--
-- Name: s_jenissurat_s_idsurat; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_jenissurat_s_idsurat
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_jenissurat_s_idsurat OWNER TO postgres;

--
-- Name: s_kecamatan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_kecamatan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kecamatan_seq OWNER TO postgres;

--
-- Name: s_kecamatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_kecamatan (
    s_idkec integer DEFAULT nextval('public.s_kecamatan_seq'::regclass) NOT NULL,
    s_kodekec integer NOT NULL,
    s_namakec character varying(255) NOT NULL,
    is_delete integer
);


ALTER TABLE public.s_kecamatan OWNER TO postgres;

--
-- Name: s_kekayaan_tarif_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_kekayaan_tarif_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kekayaan_tarif_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_kekayaan_tarif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_kekayaan_tarif (
    s_idtarif integer DEFAULT nextval('public.s_kekayaan_tarif_s_idtarif_seq'::regclass) NOT NULL,
    s_idklasifikasi integer NOT NULL,
    s_klasifikasi character varying(100),
    s_namajalan character varying(100),
    s_nilailuastanah integer NOT NULL,
    s_nilailuasbangunan integer NOT NULL,
    s_satuan character varying(50) NOT NULL
);


ALTER TABLE public.s_kekayaan_tarif OWNER TO postgres;

--
-- Name: s_kekayaankategorisatu_s_idkategorisatu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_kekayaankategorisatu_s_idkategorisatu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kekayaankategorisatu_s_idkategorisatu_seq OWNER TO postgres;

--
-- Name: s_kekayaankategorisatu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_kekayaankategorisatu (
    s_idkategorisatu integer DEFAULT nextval('public.s_kekayaankategorisatu_s_idkategorisatu_seq'::regclass) NOT NULL,
    s_idklasifikasi integer,
    s_keterangan character varying(100),
    s_tarif double precision,
    s_satuan character varying(50)
);


ALTER TABLE public.s_kekayaankategorisatu OWNER TO postgres;

--
-- Name: s_kekayaanpenggunaan_s_idpenggunaan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_kekayaanpenggunaan_s_idpenggunaan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kekayaanpenggunaan_s_idpenggunaan_seq OWNER TO postgres;

--
-- Name: s_kekayaanpenggunaan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_kekayaanpenggunaan (
    s_idpenggunaan integer DEFAULT nextval('public.s_kekayaanpenggunaan_s_idpenggunaan_seq'::regclass) NOT NULL,
    s_keterangan character varying(100)
);


ALTER TABLE public.s_kekayaanpenggunaan OWNER TO postgres;

--
-- Name: s_kekayaantarif_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_kekayaantarif_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kekayaantarif_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_kekayaantarif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_kekayaantarif (
    s_idtarif integer DEFAULT nextval('public.s_kekayaantarif_s_idtarif_seq'::regclass) NOT NULL,
    s_idkategorisatu integer,
    s_keterangan character varying(100),
    s_nilaitanah double precision,
    s_nilaibangunan double precision,
    s_satuan character varying(50)
);


ALTER TABLE public.s_kekayaantarif OWNER TO postgres;

--
-- Name: s_kelompoktargetsatker_s_idkelompoktarget_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_kelompoktargetsatker_s_idkelompoktarget_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kelompoktargetsatker_s_idkelompoktarget_seq OWNER TO postgres;

--
-- Name: s_kelompoktargetsatker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_kelompoktargetsatker (
    s_idkelompoktarget integer DEFAULT nextval('public.s_kelompoktargetsatker_s_idkelompoktarget_seq'::regclass) NOT NULL,
    s_namatarget character varying(255),
    s_tahuntarget character varying(20),
    s_idsatker integer
);


ALTER TABLE public.s_kelompoktargetsatker OWNER TO postgres;

--
-- Name: s_kelurahan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_kelurahan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kelurahan_seq OWNER TO postgres;

--
-- Name: s_kelurahan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_kelurahan (
    s_idkel integer DEFAULT nextval('public.s_kelurahan_seq'::regclass) NOT NULL,
    s_kodekel integer NOT NULL,
    s_namakel character varying(255) NOT NULL,
    s_idkeckel integer NOT NULL,
    is_delete integer
);


ALTER TABLE public.s_kelurahan OWNER TO postgres;

--
-- Name: s_klasifikasippj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_klasifikasippj (
    s_idklasifikasippj integer,
    s_idkorekppj integer,
    s_namaklasifikasi character varying(100)
);


ALTER TABLE public.s_klasifikasippj OWNER TO postgres;

--
-- Name: s_minerba_jenis_s_idjenisminerba_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_minerba_jenis_s_idjenisminerba_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_minerba_jenis_s_idjenisminerba_seq OWNER TO postgres;

--
-- Name: s_minerba_jenis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_minerba_jenis (
    s_idjenisminerba integer DEFAULT nextval('public.s_minerba_jenis_s_idjenisminerba_seq'::regclass) NOT NULL,
    s_namajenisminerba character varying(255) NOT NULL,
    s_idkorek integer NOT NULL,
    s_idzona integer,
    s_harga integer,
    s_keterangan character varying(255),
    s_tarif integer
);


ALTER TABLE public.s_minerba_jenis OWNER TO postgres;

--
-- Name: s_nilaistrategis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_nilaistrategis (
    s_idreklamejenis integer,
    s_idreklamelokasi integer,
    s_harga integer
);


ALTER TABLE public.s_nilaistrategis OWNER TO postgres;

--
-- Name: s_pejabat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_pejabat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_pejabat_seq OWNER TO postgres;

--
-- Name: s_pejabat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_pejabat (
    s_idpej integer DEFAULT nextval('public.s_pejabat_seq'::regclass) NOT NULL,
    s_namapej character varying(100) NOT NULL,
    s_jabatanpej character varying(100) NOT NULL,
    s_pangkatpej character varying(100) NOT NULL,
    s_nippej character varying(25) NOT NULL
);


ALTER TABLE public.s_pejabat OWNER TO postgres;

--
-- Name: s_pemda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_pemda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_pemda_seq OWNER TO postgres;

--
-- Name: s_pemda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_pemda (
    s_idpemda integer DEFAULT nextval('public.s_pemda_seq'::regclass) NOT NULL,
    s_namaprov character varying(255) NOT NULL,
    s_namakabkota character varying(255) NOT NULL,
    s_namaibukotakabkota character varying(255) NOT NULL,
    s_kodeprovinsi character varying(255) NOT NULL,
    s_kodekabkot character varying(255) NOT NULL,
    s_namainstansi character varying(255) NOT NULL,
    s_namasingkatinstansi character varying(255) NOT NULL,
    s_alamatinstansi character varying(255) NOT NULL,
    s_notelinstansi character varying(255) NOT NULL,
    s_namabank character varying(255) DEFAULT NULL::character varying,
    s_norekbank character varying(255) DEFAULT NULL::character varying,
    s_kodepos character varying(5) DEFAULT NULL::character varying,
    s_logo text
);


ALTER TABLE public.s_pemda OWNER TO postgres;

--
-- Name: s_rekening_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_rekening_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_rekening_seq OWNER TO postgres;

--
-- Name: s_rekening; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_rekening (
    s_idkorek integer DEFAULT nextval('public.s_rekening_seq'::regclass) NOT NULL,
    s_jenisobjek integer,
    s_tipekorek character varying(4) NOT NULL,
    s_kelompokkorek character varying(4) NOT NULL,
    s_jeniskorek character varying(4) NOT NULL,
    s_objekkorek character varying(4) NOT NULL,
    s_rinciankorek character varying(4) NOT NULL,
    s_sub1korek character varying(4) DEFAULT 0,
    s_sub2korek character varying(4) DEFAULT 0,
    s_sub3korek character varying(4) DEFAULT 0,
    s_namakorek character varying(200) NOT NULL,
    s_persentarifkorek double precision DEFAULT 0,
    s_tarifdasarkorek integer DEFAULT 0,
    s_voldasarkorek integer DEFAULT 0,
    s_tariftambahkorek integer DEFAULT 0,
    s_tglawalkorek date NOT NULL,
    s_tglakhirkorek date NOT NULL,
    t_berdasarmasa character varying(3) DEFAULT NULL::character varying,
    is_deluser integer DEFAULT 0 NOT NULL,
    t_jenisbahan integer
);


ALTER TABLE public.s_rekening OWNER TO postgres;

--
-- Name: s_rekening_baru_copy1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_rekening_baru_copy1 (
    s_idkorek integer DEFAULT nextval('public.s_rekening_seq'::regclass) NOT NULL,
    s_jenisobjek integer,
    s_tipekorek character varying(4) NOT NULL,
    s_kelompokkorek character varying(4) NOT NULL,
    s_jeniskorek character varying(4) NOT NULL,
    s_objekkorek character varying(4) NOT NULL,
    s_rinciankorek character varying(4) NOT NULL,
    s_sub1korek character varying(4) DEFAULT 0,
    s_sub2korek character varying(4) DEFAULT 0,
    s_sub3korek character varying(4) DEFAULT 0,
    s_namakorek character varying(200) NOT NULL,
    s_persentarifkorek double precision DEFAULT 0,
    s_tarifdasarkorek integer DEFAULT 0,
    s_voldasarkorek integer DEFAULT 0,
    s_tariftambahkorek integer DEFAULT 0,
    s_tglawalkorek date NOT NULL,
    s_tglakhirkorek date NOT NULL,
    t_berdasarmasa character varying(3) DEFAULT NULL::character varying,
    is_deluser integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.s_rekening_baru_copy1 OWNER TO postgres;

--
-- Name: s_rekening_copybaru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_rekening_copybaru (
    s_idkorek integer DEFAULT nextval('public.s_rekening_seq'::regclass) NOT NULL,
    s_jenisobjek integer,
    s_tipekorek character varying(4) NOT NULL,
    s_kelompokkorek character varying(4) NOT NULL,
    s_jeniskorek character varying(4) NOT NULL,
    s_objekkorek character varying(4) NOT NULL,
    s_rinciankorek character varying(4) NOT NULL,
    s_sub1korek character varying(4) DEFAULT 0,
    s_sub2korek character varying(4) DEFAULT 0,
    s_sub3korek character varying(4) DEFAULT 0,
    s_namakorek character varying(200) NOT NULL,
    s_persentarifkorek double precision DEFAULT 0,
    s_tarifdasarkorek integer DEFAULT 0,
    s_voldasarkorek integer DEFAULT 0,
    s_tariftambahkorek integer DEFAULT 0,
    s_tglawalkorek date NOT NULL,
    s_tglakhirkorek date NOT NULL,
    t_berdasarmasa character varying(3) DEFAULT NULL::character varying,
    is_deluser integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.s_rekening_copybaru OWNER TO postgres;

--
-- Name: s_rekening_dulu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_rekening_dulu (
    s_idkorek integer DEFAULT nextval('public.s_rekening_seq'::regclass) NOT NULL,
    s_jenisobjek integer,
    s_tipekorek character varying(4) NOT NULL,
    s_kelompokkorek character varying(4) NOT NULL,
    s_jeniskorek character varying(4) NOT NULL,
    s_objekkorek character varying(4) NOT NULL,
    s_rinciankorek character varying(4) NOT NULL,
    s_sub1korek character varying(4) DEFAULT 0,
    s_sub2korek character varying(4) DEFAULT 0,
    s_sub3korek character varying(4) DEFAULT 0,
    s_namakorek character varying(200) NOT NULL,
    s_persentarifkorek double precision DEFAULT 0,
    s_tarifdasarkorek integer DEFAULT 0,
    s_voldasarkorek integer DEFAULT 0,
    s_tariftambahkorek integer DEFAULT 0,
    s_tglawalkorek date NOT NULL,
    s_tglakhirkorek date NOT NULL,
    t_berdasarmasa character varying(3) DEFAULT NULL::character varying,
    is_deluser integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.s_rekening_dulu OWNER TO postgres;

--
-- Name: s_rekening_s_idkorek_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_rekening_s_idkorek_seq
    START WITH 161
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_rekening_s_idkorek_seq OWNER TO postgres;

--
-- Name: s_reklame_berjalan_s_idberjalan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_berjalan_s_idberjalan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_berjalan_s_idberjalan_seq OWNER TO postgres;

--
-- Name: s_reklame_index_tinggi_s_idindex_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_index_tinggi_s_idindex_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_index_tinggi_s_idindex_seq OWNER TO postgres;

--
-- Name: s_reklame_index_zona_s_idindex_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_index_zona_s_idindex_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_index_zona_s_idindex_seq OWNER TO postgres;

--
-- Name: s_reklame_jangkawaktureklame_s_idjangkawaktureklame_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_jangkawaktureklame_s_idjangkawaktureklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_jangkawaktureklame_s_idjangkawaktureklame_seq OWNER TO postgres;

--
-- Name: s_reklame_jenis_s_idjenis_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_jenis_s_idjenis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_jenis_s_idjenis_seq OWNER TO postgres;

--
-- Name: s_reklame_kawasan_s_idkawasan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_kawasan_s_idkawasan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_kawasan_s_idkawasan_seq OWNER TO postgres;

--
-- Name: s_reklame_klarifikasi_jalan_s_idklj_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_klarifikasi_jalan_s_idklj_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_klarifikasi_jalan_s_idklj_seq OWNER TO postgres;

--
-- Name: s_reklame_koefisienjenis_s_idkoefisienjenis_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_koefisienjenis_s_idkoefisienjenis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_koefisienjenis_s_idkoefisienjenis_seq OWNER TO postgres;

--
-- Name: s_reklame_koefisienpemasangan_s_idkoefisienpemasangan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_koefisienpemasangan_s_idkoefisienpemasangan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_koefisienpemasangan_s_idkoefisienpemasangan_seq OWNER TO postgres;

--
-- Name: s_reklame_lokasi_s_idlokasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_lokasi_s_idlokasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_lokasi_s_idlokasi_seq OWNER TO postgres;

--
-- Name: s_reklame_njopr_s_idnjopr_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_njopr_s_idnjopr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_njopr_s_idnjopr_seq OWNER TO postgres;

--
-- Name: s_reklame_selebaran_s_idselebaran_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_selebaran_s_idselebaran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_selebaran_s_idselebaran_seq OWNER TO postgres;

--
-- Name: s_reklame_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_seq OWNER TO postgres;

--
-- Name: s_reklame_skorukuran_s_idskorukuran_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_skorukuran_s_idskorukuran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_skorukuran_s_idskorukuran_seq OWNER TO postgres;

--
-- Name: s_reklame_stiker_s_idstiker_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_stiker_s_idstiker_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_stiker_s_idstiker_seq OWNER TO postgres;

--
-- Name: s_reklame_tarif_kawasan_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_tarif_kawasan_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_tarif_kawasan_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_reklame_tarif_klarifikasi_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_tarif_klarifikasi_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_tarif_klarifikasi_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_reklame_tarif_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_tarif_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_tarif_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_reklame_tarif_supiori_s_idtarifsupiori_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_tarif_supiori_s_idtarifsupiori_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_tarif_supiori_s_idtarifsupiori_seq OWNER TO postgres;

--
-- Name: s_reklame_tarif_tinggi_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_tarif_tinggi_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_tarif_tinggi_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_reklame_wilayah_s_idwilayah_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_wilayah_s_idwilayah_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_wilayah_s_idwilayah_seq OWNER TO postgres;

--
-- Name: s_reklame_zonawilayah_s_idzona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklame_zonawilayah_s_idzona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_zonawilayah_s_idzona_seq OWNER TO postgres;

--
-- Name: s_reklamebentuk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_reklamebentuk (
    s_idreklamebentuk integer NOT NULL,
    s_namareklamebentuk character varying(255) NOT NULL
);


ALTER TABLE public.s_reklamebentuk OWNER TO postgres;

--
-- Name: s_reklamejenis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_reklamejenis (
    s_idreklamejenis integer NOT NULL,
    s_namareklamejenis character varying(100) NOT NULL,
    s_idrekening integer NOT NULL,
    s_permanen smallint DEFAULT 1,
    s_njop integer,
    s_urut integer,
    s_ukuran integer
);


ALTER TABLE public.s_reklamejenis OWNER TO postgres;

--
-- Name: s_reklamelokasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_reklamelokasi (
    s_idreklamelokasi integer NOT NULL,
    s_namareklamelokasi character varying(255),
    s_klasifikasilokasi integer
);


ALTER TABLE public.s_reklamelokasi OWNER TO postgres;

--
-- Name: s_reklamenilaiinsidentil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_reklamenilaiinsidentil (
    s_idreklamenilaiinsidentil integer NOT NULL,
    s_idjenisreklame integer NOT NULL,
    s_tipewaktu integer NOT NULL,
    s_nilaipersatuan integer NOT NULL,
    s_tahun integer
);


ALTER TABLE public.s_reklamenilaiinsidentil OWNER TO postgres;

--
-- Name: s_reklamenilaiinsidentil_s_idreklamenilaiinsidentil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklamenilaiinsidentil_s_idreklamenilaiinsidentil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklamenilaiinsidentil_s_idreklamenilaiinsidentil_seq OWNER TO postgres;

--
-- Name: s_reklamenilaiinsidentil_s_idreklamenilaiinsidentil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.s_reklamenilaiinsidentil_s_idreklamenilaiinsidentil_seq OWNED BY public.s_reklamenilaiinsidentil.s_idreklamenilaiinsidentil;


--
-- Name: s_reklamenilaijalan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_reklamenilaijalan (
    s_idreklamenilaijalan integer NOT NULL,
    s_idjenisreklame integer NOT NULL,
    s_klasifikasilokasi integer NOT NULL,
    s_indeks real
);


ALTER TABLE public.s_reklamenilaijalan OWNER TO postgres;

--
-- Name: s_reklamenilaijalan_s_idreklamenilaijalan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklamenilaijalan_s_idreklamenilaijalan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklamenilaijalan_s_idreklamenilaijalan_seq OWNER TO postgres;

--
-- Name: s_reklamenilaijalan_s_idreklamenilaijalan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.s_reklamenilaijalan_s_idreklamenilaijalan_seq OWNED BY public.s_reklamenilaijalan.s_idreklamenilaijalan;


--
-- Name: s_reklamenilaiukuran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_reklamenilaiukuran (
    s_idukurannilaireklame integer NOT NULL,
    s_idjenisreklame integer,
    s_rangeukuran1 real,
    s_rangeukuran2 real,
    s_indeks real,
    s_satuanukuran character varying(10),
    s_keteranganukuran character varying(50)
);


ALTER TABLE public.s_reklamenilaiukuran OWNER TO postgres;

--
-- Name: s_reklamenilaiwaktu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_reklamenilaiwaktu (
    s_idjangkawaktu integer NOT NULL,
    s_idjenisreklame character varying(32),
    s_waktu1 real,
    s_waktu2 real,
    s_indeks real,
    s_idreklamewaktu integer
);


ALTER TABLE public.s_reklamenilaiwaktu OWNER TO postgres;

--
-- Name: s_reklamenjop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_reklamenjop (
    s_idnjopreklame integer NOT NULL,
    s_idjenisreklame integer NOT NULL,
    s_njopdasar integer NOT NULL,
    s_klasifikasilokasi integer NOT NULL
);


ALTER TABLE public.s_reklamenjop OWNER TO postgres;

--
-- Name: s_reklamenjop_s_idnjopreklame_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklamenjop_s_idnjopreklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklamenjop_s_idnjopreklame_seq OWNER TO postgres;

--
-- Name: s_reklamenjop_s_idnjopreklame_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.s_reklamenjop_s_idnjopreklame_seq OWNED BY public.s_reklamenjop.s_idnjopreklame;


--
-- Name: s_reklamesatuan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_reklamesatuan (
    s_idsatuanreklame integer NOT NULL,
    s_idjenisreklame integer NOT NULL,
    s_namasatuan character varying(100) NOT NULL
);


ALTER TABLE public.s_reklamesatuan OWNER TO postgres;

--
-- Name: s_reklamesatuan_s_idsatuanreklame_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklamesatuan_s_idsatuanreklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklamesatuan_s_idsatuanreklame_seq OWNER TO postgres;

--
-- Name: s_reklamesatuan_s_idsatuanreklame_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.s_reklamesatuan_s_idsatuanreklame_seq OWNED BY public.s_reklamesatuan.s_idsatuanreklame;


--
-- Name: s_reklametarif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_reklametarif (
    s_idtarifreklame integer NOT NULL,
    s_idrekening integer,
    s_tarifreklame character varying(10),
    s_jenistarif character varying(10),
    s_keterangan character varying(255)
);


ALTER TABLE public.s_reklametarif OWNER TO postgres;

--
-- Name: s_reklametariftambahan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_reklametariftambahan (
    s_idreklametariftambahan integer NOT NULL,
    s_idjenisreklame integer NOT NULL,
    s_tariftambahan integer NOT NULL
);


ALTER TABLE public.s_reklametariftambahan OWNER TO postgres;

--
-- Name: s_reklametariftambahan_s_idreklametariftambahan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_reklametariftambahan_s_idreklametariftambahan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklametariftambahan_s_idreklametariftambahan_seq OWNER TO postgres;

--
-- Name: s_reklametariftambahan_s_idreklametariftambahan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.s_reklametariftambahan_s_idreklametariftambahan_seq OWNED BY public.s_reklametariftambahan.s_idreklametariftambahan;


--
-- Name: s_reklamewaktu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_reklamewaktu (
    s_idreklamewaktu integer NOT NULL,
    s_namareklamewaktu character varying(255)
);


ALTER TABLE public.s_reklamewaktu OWNER TO postgres;

--
-- Name: s_satker_s_idsatker_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_satker_s_idsatker_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_satker_s_idsatker_seq OWNER TO postgres;

--
-- Name: s_satker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_satker (
    s_idsatker integer DEFAULT nextval('public.s_satker_s_idsatker_seq'::regclass) NOT NULL,
    s_kodesatker character varying(40) NOT NULL,
    s_namasatker character varying(200) NOT NULL
);


ALTER TABLE public.s_satker OWNER TO postgres;

--
-- Name: s_target_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_target_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_target_seq OWNER TO postgres;

--
-- Name: s_target; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_target (
    s_idtarget integer DEFAULT nextval('public.s_target_seq'::regclass) NOT NULL,
    s_tahuntarget character varying(4) NOT NULL,
    s_statustarget integer NOT NULL,
    s_keterangantarget character varying(255) NOT NULL
);


ALTER TABLE public.s_target OWNER TO postgres;

--
-- Name: s_targetdetail_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_targetdetail_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_targetdetail_seq OWNER TO postgres;

--
-- Name: s_targetdetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_targetdetail (
    s_idtargetdetail integer DEFAULT nextval('public.s_targetdetail_seq'::regclass) NOT NULL,
    s_idtargetheader integer NOT NULL,
    s_targetrekening integer NOT NULL,
    s_targetjumlah bigint NOT NULL
);


ALTER TABLE public.s_targetdetail OWNER TO postgres;

--
-- Name: s_targetjenis_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_targetjenis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_targetjenis_seq OWNER TO postgres;

--
-- Name: s_targetjenis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_targetjenis (
    s_idtargetjenis integer DEFAULT nextval('public.s_targetjenis_seq'::regclass) NOT NULL,
    s_namatargetjenis character varying(50) NOT NULL
);


ALTER TABLE public.s_targetjenis OWNER TO postgres;

--
-- Name: s_targetsatker_s_idtargetsater_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_targetsatker_s_idtargetsater_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_targetsatker_s_idtargetsater_seq OWNER TO postgres;

--
-- Name: s_targetsatker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_targetsatker (
    s_idtargetsatker integer DEFAULT nextval('public.s_targetsatker_s_idtargetsater_seq'::regclass) NOT NULL,
    s_idkorek integer,
    s_idkelompoktargetsatker integer,
    s_target bigint
);


ALTER TABLE public.s_targetsatker OWNER TO postgres;

--
-- Name: s_tarifbudidaya_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tarifbudidaya_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifbudidaya_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifbudidaya; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tarifbudidaya (
    s_idtarif integer DEFAULT nextval('public.s_tarifbudidaya_s_idtarif_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15) NOT NULL
);


ALTER TABLE public.s_tarifbudidaya OWNER TO postgres;

--
-- Name: s_tarifbudidayamutiara_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tarifbudidayamutiara_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifbudidayamutiara_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifbudidayamutiara; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tarifbudidayamutiara (
    s_idtarif integer DEFAULT nextval('public.s_tarifbudidayamutiara_s_idtarif_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15) NOT NULL
);


ALTER TABLE public.s_tarifbudidayamutiara OWNER TO postgres;

--
-- Name: s_tarifgedung_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tarifgedung_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifgedung_seq OWNER TO postgres;

--
-- Name: s_tarifgedung; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tarifgedung (
    s_idtarif integer DEFAULT nextval('public.s_tarifgedung_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15) NOT NULL
);


ALTER TABLE public.s_tarifgedung OWNER TO postgres;

--
-- Name: s_tarifkapal_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tarifkapal_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifkapal_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifkapal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tarifkapal (
    s_idtarif integer DEFAULT nextval('public.s_tarifkapal_s_idtarif_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15) NOT NULL
);


ALTER TABLE public.s_tarifkapal OWNER TO postgres;

--
-- Name: s_tarifkebersihan_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tarifkebersihan_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifkebersihan_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifkebersihan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tarifkebersihan (
    s_idtarif integer DEFAULT nextval('public.s_tarifkebersihan_s_idtarif_seq'::regclass) NOT NULL,
    s_idklasifikasi integer NOT NULL,
    s_keterangan character varying(255),
    s_tarifdasar double precision NOT NULL,
    s_satuan character varying(100)
);


ALTER TABLE public.s_tarifkebersihan OWNER TO postgres;

--
-- Name: s_tarifkir_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tarifkir_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifkir_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifkir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tarifkir (
    s_idtarif integer DEFAULT nextval('public.s_tarifkir_s_idtarif_seq'::regclass) NOT NULL,
    s_keterangan character varying(100),
    s_tarif double precision DEFAULT 0,
    s_satuan character varying(30)
);


ALTER TABLE public.s_tarifkir OWNER TO postgres;

--
-- Name: s_tarifparkirtepi_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tarifparkirtepi_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifparkirtepi_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifparkirtepi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tarifparkirtepi (
    s_idtarif integer DEFAULT nextval('public.s_tarifparkirtepi_s_idtarif_seq'::regclass) NOT NULL,
    s_keterangan character varying(100),
    s_tarif double precision DEFAULT 0,
    s_satuan character varying(30)
);


ALTER TABLE public.s_tarifparkirtepi OWNER TO postgres;

--
-- Name: s_tarifpasar_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tarifpasar_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifpasar_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifpasar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tarifpasar (
    s_idtarif integer DEFAULT nextval('public.s_tarifpasar_s_idtarif_seq'::regclass) NOT NULL,
    s_idklasifikasi integer NOT NULL,
    s_keterangan character varying(255),
    s_tarifdasar double precision NOT NULL,
    s_luas character varying(30),
    s_satuan character varying(100)
);


ALTER TABLE public.s_tarifpasar OWNER TO postgres;

--
-- Name: s_tarifpasargrosir_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tarifpasargrosir_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifpasargrosir_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifpasargrosir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tarifpasargrosir (
    s_idtarif integer DEFAULT nextval('public.s_tarifpasargrosir_s_idtarif_seq'::regclass) NOT NULL,
    s_idklasifikasi integer NOT NULL,
    s_keterangan character varying(255),
    s_tarifdasar double precision NOT NULL,
    s_luas character varying(30),
    s_satuan character varying(100)
);


ALTER TABLE public.s_tarifpasargrosir OWNER TO postgres;

--
-- Name: s_tarifpemadam_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tarifpemadam_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifpemadam_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifpemadam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tarifpemadam (
    s_idtarif integer DEFAULT nextval('public.s_tarifpemadam_s_idtarif_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(25) NOT NULL
);


ALTER TABLE public.s_tarifpemadam OWNER TO postgres;

--
-- Name: s_tarifrumahdinas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tarifrumahdinas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifrumahdinas_seq OWNER TO postgres;

--
-- Name: s_tarifrumahdinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tarifrumahdinas (
    s_idtarifret integer DEFAULT nextval('public.s_tarifrumahdinas_seq'::regclass) NOT NULL,
    s_namatarif character varying(30) NOT NULL,
    s_luasawal double precision NOT NULL,
    s_luasakhir double precision NOT NULL,
    s_satuan character varying(10) NOT NULL,
    s_tarif double precision NOT NULL
);


ALTER TABLE public.s_tarifrumahdinas OWNER TO postgres;

--
-- Name: s_tariftanahreklame_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tariftanahreklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tariftanahreklame_seq OWNER TO postgres;

--
-- Name: s_tariftanahreklame; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tariftanahreklame (
    s_idtarif integer DEFAULT nextval('public.s_tariftanahreklame_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15) NOT NULL
);


ALTER TABLE public.s_tariftanahreklame OWNER TO postgres;

--
-- Name: s_tariftempatparkir_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tariftempatparkir_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tariftempatparkir_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tariftempatparkir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tariftempatparkir (
    s_idtarif integer DEFAULT nextval('public.s_tariftempatparkir_s_idtarif_seq'::regclass) NOT NULL,
    s_jeniskendaraan character varying(255),
    s_tarifdasar double precision NOT NULL
);


ALTER TABLE public.s_tariftempatparkir OWNER TO postgres;

--
-- Name: s_tariftera_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tariftera_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tariftera_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tariftera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tariftera (
    s_idtarif integer DEFAULT nextval('public.s_tariftera_s_idtarif_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15)
);


ALTER TABLE public.s_tariftera OWNER TO postgres;

--
-- Name: s_tarifterminal_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tarifterminal_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifterminal_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifterminal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tarifterminal (
    s_idtarif integer DEFAULT nextval('public.s_tarifterminal_s_idtarif_seq'::regclass) NOT NULL,
    s_idjenispelayanan integer NOT NULL,
    s_keterangan character varying(255),
    s_tarifdasar double precision NOT NULL,
    s_satuan character varying(100)
);


ALTER TABLE public.s_tarifterminal OWNER TO postgres;

--
-- Name: s_tariftrayek_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tariftrayek_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tariftrayek_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tariftrayek; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tariftrayek (
    s_idtarif integer DEFAULT nextval('public.s_tariftrayek_s_idtarif_seq'::regclass) NOT NULL,
    s_keterangan character varying(100),
    s_tarif double precision DEFAULT 0,
    s_satuan character varying(30)
);


ALTER TABLE public.s_tariftrayek OWNER TO postgres;

--
-- Name: s_tipeusaha_s_idusaha_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_tipeusaha_s_idusaha_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tipeusaha_s_idusaha_seq OWNER TO postgres;

--
-- Name: s_tipeusaha; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_tipeusaha (
    s_idusaha integer DEFAULT nextval('public.s_tipeusaha_s_idusaha_seq'::regclass) NOT NULL,
    s_kodeusaha integer NOT NULL,
    s_namausaha character varying(100) NOT NULL
);


ALTER TABLE public.s_tipeusaha OWNER TO postgres;

--
-- Name: s_users_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_users_seq
    START WITH 12
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_users_seq OWNER TO postgres;

--
-- Name: s_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_users (
    s_iduser integer DEFAULT nextval('public.s_users_seq'::regclass) NOT NULL,
    s_username character varying(100) NOT NULL,
    s_password character varying(100) NOT NULL,
    s_akses integer NOT NULL,
    s_noidentitas character varying(20) DEFAULT NULL::character varying,
    s_nama character varying(255) NOT NULL,
    s_alamat character varying(255) DEFAULT NULL::character varying,
    s_email character varying(50) DEFAULT NULL::character varying,
    s_notelp character varying(15) DEFAULT NULL::character varying,
    s_usipad character varying(255) DEFAULT NULL::character varying,
    s_tgldaftar date,
    s_jenisidentitas integer,
    s_kewarganegaraan character varying(255) DEFAULT NULL::character varying,
    s_jenisizin character varying(255) DEFAULT NULL::character varying,
    s_jabatan character varying(255) DEFAULT NULL::character varying,
    s_tipeoperator character varying(10) DEFAULT NULL::character varying,
    s_passwordreset character varying(255) DEFAULT NULL::character varying,
    s_passwordresetvalid timestamp(6) without time zone DEFAULT NULL::timestamp without time zone,
    s_menu character varying(255) NOT NULL,
    s_wp integer DEFAULT 0
);


ALTER TABLE public.s_users OWNER TO postgres;

--
-- Name: t_angsuran_t_idangsuran_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_angsuran_t_idangsuran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_angsuran_t_idangsuran_seq OWNER TO postgres;

--
-- Name: t_angsuran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_angsuran (
    t_idangsuran integer DEFAULT nextval('public.t_angsuran_t_idangsuran_seq'::regclass) NOT NULL,
    t_idwpobjek integer NOT NULL,
    t_idketetapan integer NOT NULL,
    t_jenispajak integer NOT NULL,
    t_jenisketetapan integer NOT NULL,
    t_noangsuran integer NOT NULL,
    t_tglketetapanangsuran date,
    t_jumlahkaliangsuran integer NOT NULL,
    t_tgljadwalangsuran date,
    t_nominalangsuran double precision NOT NULL,
    t_angsuranke integer NOT NULL,
    t_kodebayarangsuran character varying(20) NOT NULL,
    t_inputangsuran integer,
    t_pokokpembayaranangsuran double precision,
    t_bungapembayaranangsuran double precision,
    t_totalpembayaranangsuran double precision,
    t_tglpembayaranangsuran date,
    t_inputpembayaranangsuran integer
);


ALTER TABLE public.t_angsuran OWNER TO postgres;

--
-- Name: t_berkas_t_idberkas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_berkas_t_idberkas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_berkas_t_idberkas_seq OWNER TO postgres;

--
-- Name: t_berkas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_berkas (
    t_idberkas integer DEFAULT nextval('public.t_berkas_t_idberkas_seq'::regclass) NOT NULL,
    t_idtransaksi integer,
    t_namaberkas character varying(255),
    t_letakberkas character varying(255)
);


ALTER TABLE public.t_berkas OWNER TO postgres;

--
-- Name: t_datailwalet_t_iddetailwalet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_datailwalet_t_iddetailwalet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_datailwalet_t_iddetailwalet_seq OWNER TO postgres;

--
-- Name: t_dataop_t_idop_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_dataop_t_idop_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_dataop_t_idop_seq OWNER TO postgres;

--
-- Name: t_dataop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_dataop (
    t_idop integer DEFAULT nextval('public.t_dataop_t_idop_seq'::regclass) NOT NULL,
    t_npwpd character varying(20),
    t_ayat character varying(255)
);


ALTER TABLE public.t_dataop OWNER TO postgres;

--
-- Name: t_datatransaksi_t_idtransaksi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_datatransaksi_t_idtransaksi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_datatransaksi_t_idtransaksi_seq OWNER TO postgres;

--
-- Name: t_datatransaksi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_datatransaksi (
    t_idtransaksi integer DEFAULT nextval('public.t_datatransaksi_t_idtransaksi_seq'::regclass) NOT NULL,
    t_npwpd character varying(20),
    t_ayat character varying(255),
    t_type character varying(255),
    t_klas character varying(255),
    t_tglditerima date,
    t_tglawal date,
    t_tglakhir date,
    t_periode integer,
    t_pajak double precision
);


ALTER TABLE public.t_datatransaksi OWNER TO postgres;

--
-- Name: t_datawpdaftar_t_idwp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_datawpdaftar_t_idwp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_datawpdaftar_t_idwp_seq OWNER TO postgres;

--
-- Name: t_datawpdaftar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_datawpdaftar (
    t_idwp integer DEFAULT nextval('public.t_datawpdaftar_t_idwp_seq'::regclass) NOT NULL,
    t_npwpd character varying(20),
    t_namawp character varying(255),
    t_alamatwp character varying(255),
    t_tgldaftarwp date
);


ALTER TABLE public.t_datawpdaftar OWNER TO postgres;

--
-- Name: t_datawpusaha_t_idwp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_datawpusaha_t_idwp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_datawpusaha_t_idwp_seq OWNER TO postgres;

--
-- Name: t_datawpusaha; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_datawpusaha (
    t_idwp integer DEFAULT nextval('public.t_datawpusaha_t_idwp_seq'::regclass) NOT NULL,
    t_npwpd character varying(20),
    t_namausaha character varying(255),
    t_alamatusaha character varying(255),
    t_tgldaftarusaha date
);


ALTER TABLE public.t_datawpusaha OWNER TO postgres;

--
-- Name: t_detailair_t_idair_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailair_t_idair_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailair_t_idair_seq OWNER TO postgres;

--
-- Name: t_detailair; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailair (
    t_idair integer DEFAULT nextval('public.t_detailair_t_idair_seq'::regclass) NOT NULL,
    t_idtransaksi integer,
    t_volume double precision DEFAULT 0,
    t_kodekelompok integer,
    t_volumeair0 integer,
    t_hargadasar0 integer,
    t_tarif0 double precision DEFAULT 0,
    t_jumlah0 double precision DEFAULT 0,
    t_volumeair1 integer,
    t_hargadasar1 integer,
    t_tarif1 double precision DEFAULT 0,
    t_jumlah1 double precision DEFAULT 0,
    t_volumeair2 integer,
    t_hargadasar2 integer,
    t_tarif2 double precision DEFAULT 0,
    t_jumlah2 double precision DEFAULT 0,
    t_volumeair3 integer,
    t_hargadasar3 integer,
    t_tarif3 double precision DEFAULT 0,
    t_jumlah3 double precision DEFAULT 0,
    t_volumeair4 integer,
    t_hargadasar4 integer,
    t_tarif4 double precision DEFAULT 0,
    t_jumlah4 double precision DEFAULT 0,
    t_volumeair5 integer,
    t_hargadasar5 integer,
    t_tarif5 double precision DEFAULT 0,
    t_jumlah5 double precision DEFAULT 0,
    t_volumeair6 integer,
    t_hargadasar6 integer,
    t_tarif6 double precision DEFAULT 0,
    t_jumlah6 double precision DEFAULT 0,
    t_fna double precision DEFAULT 0,
    t_tarifdasarkorek double precision DEFAULT 0,
    t_perhitungan text,
    t_totalnpa double precision DEFAULT 0,
    t_lamawaktu integer,
    t_debitair double precision,
    t_kualitasair integer,
    t_peruntukan integer,
    t_totalbiaya integer,
    t_npa double precision
);


ALTER TABLE public.t_detailair OWNER TO postgres;

--
-- Name: t_detailgedung_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailgedung_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailgedung_seq OWNER TO postgres;

--
-- Name: t_detailgedung; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailgedung (
    t_idgedung integer DEFAULT nextval('public.t_detailgedung_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_tarifdasar integer NOT NULL,
    t_jenis integer NOT NULL,
    t_jumlah integer NOT NULL,
    t_total integer NOT NULL
);


ALTER TABLE public.t_detailgedung OWNER TO postgres;

--
-- Name: t_detailho_t_idretho_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailho_t_idretho_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailho_t_idretho_seq OWNER TO postgres;

--
-- Name: t_detailho; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailho (
    t_idretho integer DEFAULT nextval('public.t_detailho_t_idretho_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_panjang integer NOT NULL,
    t_lebar integer NOT NULL,
    t_luas integer NOT NULL,
    t_indeksluas double precision NOT NULL,
    t_kwslokasi double precision NOT NULL,
    t_gangguan double precision NOT NULL,
    t_skala double precision NOT NULL,
    t_tarifdasar integer NOT NULL,
    t_jmlhpajak integer NOT NULL
);


ALTER TABLE public.t_detailho OWNER TO postgres;

--
-- Name: t_detailimb_t_idretimb_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailimb_t_idretimb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailimb_t_idretimb_seq OWNER TO postgres;

--
-- Name: t_detailimb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailimb (
    t_idretimb integer DEFAULT nextval('public.t_detailimb_t_idretimb_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_jmlhbangunan integer NOT NULL,
    t_panjang numeric(10,2) NOT NULL,
    t_lebar numeric(10,2) NOT NULL,
    t_luas numeric(10,2) NOT NULL,
    t_imbluas double precision NOT NULL,
    t_imblantai double precision NOT NULL,
    t_imbgunabgn double precision NOT NULL,
    t_imblokasi double precision NOT NULL,
    t_imbkondisi double precision NOT NULL,
    t_tarifdasar integer NOT NULL,
    t_jmlhpajak integer NOT NULL,
    t_peruntukan character varying(100) NOT NULL
);


ALTER TABLE public.t_detailimb OWNER TO postgres;

--
-- Name: t_detailkebersihan_t_idkebersihan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailkebersihan_t_idkebersihan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailkebersihan_t_idkebersihan_seq OWNER TO postgres;

--
-- Name: t_detailkebersihan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailkebersihan (
    t_idkebersihan integer DEFAULT nextval('public.t_detailkebersihan_t_idkebersihan_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_idklasifikasi integer NOT NULL,
    t_idtarif integer NOT NULL,
    t_tarifdasar double precision NOT NULL,
    t_jmlhbln double precision NOT NULL,
    t_potongan integer
);


ALTER TABLE public.t_detailkebersihan OWNER TO postgres;

--
-- Name: t_detailkekayaan_t_idkekayaan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailkekayaan_t_idkekayaan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailkekayaan_t_idkekayaan_seq OWNER TO postgres;

--
-- Name: t_detailkekayaan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailkekayaan (
    t_idkekayaan integer DEFAULT nextval('public.t_detailkekayaan_t_idkekayaan_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_tarifdasar double precision,
    t_jenislayanan integer,
    t_jeniskekayaan integer,
    t_jumlah double precision,
    t_lamawaktu integer,
    t_keterangan character varying(250),
    t_jumlahitem double precision
);


ALTER TABLE public.t_detailkekayaan OWNER TO postgres;

--
-- Name: t_detailkir_t_iddetailkir_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailkir_t_iddetailkir_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailkir_t_iddetailkir_seq OWNER TO postgres;

--
-- Name: t_detailkir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailkir (
    t_iddetailkir integer DEFAULT nextval('public.t_detailkir_t_iddetailkir_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_idtarif integer NOT NULL,
    t_hargadasar double precision NOT NULL,
    t_jumlah double precision NOT NULL
);


ALTER TABLE public.t_detailkir OWNER TO postgres;

--
-- Name: t_detailminerba_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailminerba_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailminerba_seq OWNER TO postgres;

--
-- Name: t_detailminerba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailminerba (
    t_idminerba integer DEFAULT nextval('public.t_detailminerba_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_idkorek integer NOT NULL,
    t_volume double precision NOT NULL,
    t_hargapasaran integer NOT NULL,
    t_jumlah double precision NOT NULL,
    t_tarifpersen double precision NOT NULL,
    t_pajak double precision NOT NULL,
    t_idjenis integer
);


ALTER TABLE public.t_detailminerba OWNER TO postgres;

--
-- Name: t_detailpanggungreklame_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailpanggungreklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailpanggungreklame_seq OWNER TO postgres;

--
-- Name: t_detailpanggungreklame; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailpanggungreklame (
    t_idrpangrek integer DEFAULT nextval('public.t_detailpanggungreklame_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_panjang double precision NOT NULL,
    t_lebar double precision NOT NULL,
    t_luas double precision NOT NULL,
    t_tarifdasar integer NOT NULL,
    t_jmlhbln integer NOT NULL,
    t_potongan integer
);


ALTER TABLE public.t_detailpanggungreklame OWNER TO postgres;

--
-- Name: t_detailparkir_t_idparkir_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailparkir_t_idparkir_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailparkir_t_idparkir_seq OWNER TO postgres;

--
-- Name: t_detailparkir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailparkir (
    t_idparkir integer DEFAULT nextval('public.t_detailparkir_t_idparkir_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_idkorek integer NOT NULL,
    t_jmlh_kendaraan integer NOT NULL,
    t_hargadasar integer NOT NULL,
    t_jumlah double precision NOT NULL,
    t_tarifpersen double precision NOT NULL,
    t_pajak double precision NOT NULL
);


ALTER TABLE public.t_detailparkir OWNER TO postgres;

--
-- Name: t_detailparkirtepi_t_iddetailret_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailparkirtepi_t_iddetailret_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailparkirtepi_t_iddetailret_seq OWNER TO postgres;

--
-- Name: t_detailparkirtepi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailparkirtepi (
    t_iddetailret integer DEFAULT nextval('public.t_detailparkirtepi_t_iddetailret_seq'::regclass) NOT NULL,
    t_idtransaksi integer,
    t_idtarif integer,
    t_volume integer,
    t_hargadasar integer,
    t_jumlah double precision,
    t_uraianretribusi character varying(255)
);


ALTER TABLE public.t_detailparkirtepi OWNER TO postgres;

--
-- Name: t_detailpasar_t_idpasar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailpasar_t_idpasar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailpasar_t_idpasar_seq OWNER TO postgres;

--
-- Name: t_detailpasar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailpasar (
    t_idpasar integer DEFAULT nextval('public.t_detailpasar_t_idpasar_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_idklasifikasi integer NOT NULL,
    t_jenisbangunan integer,
    t_panjang double precision NOT NULL,
    t_lebar double precision NOT NULL,
    t_luas double precision NOT NULL,
    t_tarifdasar double precision NOT NULL,
    t_jmlhbln double precision NOT NULL,
    t_potongan integer,
    t_keteranganpasar character varying(255),
    t_nokios character varying(32)
);


ALTER TABLE public.t_detailpasar OWNER TO postgres;

--
-- Name: t_detailpasargrosir_t_idpasargrosir_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailpasargrosir_t_idpasargrosir_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailpasargrosir_t_idpasargrosir_seq OWNER TO postgres;

--
-- Name: t_detailpasargrosir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailpasargrosir (
    t_idpasargrosir integer DEFAULT nextval('public.t_detailpasargrosir_t_idpasargrosir_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_idklasifikasi integer NOT NULL,
    t_jenisbangunan integer NOT NULL,
    t_panjang double precision NOT NULL,
    t_lebar double precision NOT NULL,
    t_luas double precision NOT NULL,
    t_tarifdasar double precision NOT NULL,
    t_jmlhbln double precision NOT NULL,
    t_potongan integer
);


ALTER TABLE public.t_detailpasargrosir OWNER TO postgres;

--
-- Name: t_detailpemadam_t_idretpemadam_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailpemadam_t_idretpemadam_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailpemadam_t_idretpemadam_seq OWNER TO postgres;

--
-- Name: t_detailpemadam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailpemadam (
    t_idretpemadam integer DEFAULT nextval('public.t_detailpemadam_t_idretpemadam_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_idtarif integer NOT NULL,
    t_jmltitikbuah integer NOT NULL,
    t_tarifdasar integer NOT NULL,
    t_satuan character varying(35) NOT NULL,
    t_jumlah double precision NOT NULL
);


ALTER TABLE public.t_detailpemadam OWNER TO postgres;

--
-- Name: t_detailperikanan_t_idperikanan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailperikanan_t_idperikanan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailperikanan_t_idperikanan_seq OWNER TO postgres;

--
-- Name: t_detailperikanan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailperikanan (
    t_idperikanan integer DEFAULT nextval('public.t_detailperikanan_t_idperikanan_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_jeniskapal integer NOT NULL,
    t_jenisbudidaya integer NOT NULL,
    t_jmlhgt integer NOT NULL,
    t_hargadasar integer NOT NULL,
    t_jumlah double precision NOT NULL
);


ALTER TABLE public.t_detailperikanan OWNER TO postgres;

--
-- Name: t_detailppj_t_iddetailppj_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailppj_t_iddetailppj_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailppj_t_iddetailppj_seq OWNER TO postgres;

--
-- Name: t_detailppj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailppj (
    t_iddetailppj integer DEFAULT nextval('public.t_detailppj_t_iddetailppj_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_klasifikasi integer,
    t_hargasatuanlistrik integer,
    t_jumlahbagihasil double precision,
    t_jumlahtagihan double precision,
    t_biayapemakaian double precision,
    t_jumlahkwh integer,
    t_jumlahkvautama integer,
    t_jumlahkvacadangan integer,
    t_jumlahkvadarurat integer,
    t_jamnyalautama double precision,
    t_jamnyalacadangan double precision,
    t_jamnyaladarurat double precision,
    t_faktordaya double precision,
    t_tarif double precision
);


ALTER TABLE public.t_detailppj OWNER TO postgres;

--
-- Name: t_detailreklame_t_iddetailreklame_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailreklame_t_iddetailreklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailreklame_t_iddetailreklame_seq OWNER TO postgres;

--
-- Name: t_detailreklame; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailreklame (
    t_iddetailreklame integer DEFAULT nextval('public.t_detailreklame_t_iddetailreklame_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_jenisreklame integer,
    t_naskah character varying(255) DEFAULT NULL::character varying,
    t_lokasi character varying(255) DEFAULT NULL::character varying,
    t_panjang numeric(10,2),
    t_lebar numeric(10,2),
    t_jumlah integer,
    t_jangkawaktu integer,
    t_tipewaktu character varying(10) DEFAULT NULL::character varying,
    t_jenisreklameusaha integer,
    t_sudutpandang integer,
    t_nsr integer,
    t_tarifreklame integer,
    t_kelasjalan character varying(100),
    t_ukuranmedia integer,
    t_satuanukuranmedia character varying(100),
    t_idlokasi integer,
    t_parameter character varying(255),
    t_kompensasi double precision,
    t_jmlhpajakasli double precision,
    t_tinggi integer,
    t_suratrekomendasi character varying(255),
    t_namafilerekomendasi character varying(255)
);


ALTER TABLE public.t_detailreklame OWNER TO postgres;

--
-- Name: t_detailretribusi_t_iddetailret_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailretribusi_t_iddetailret_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailretribusi_t_iddetailret_seq OWNER TO postgres;

--
-- Name: t_detailretribusi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailretribusi (
    t_iddetailret integer DEFAULT nextval('public.t_detailretribusi_t_iddetailret_seq'::regclass) NOT NULL,
    t_idtransaksi integer,
    t_volume integer,
    t_hargadasar integer,
    t_jumlah double precision,
    t_uraianretribusi character varying(255)
);


ALTER TABLE public.t_detailretribusi OWNER TO postgres;

--
-- Name: t_detailrumahdinas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailrumahdinas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailrumahdinas_seq OWNER TO postgres;

--
-- Name: t_detailrumahdinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailrumahdinas (
    t_idrumahdinas integer DEFAULT nextval('public.t_detailrumahdinas_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_panjang double precision NOT NULL,
    t_lebar double precision NOT NULL,
    t_luas double precision NOT NULL,
    t_tarifdasar integer NOT NULL,
    t_jmlhbln double precision NOT NULL,
    t_potongan integer
);


ALTER TABLE public.t_detailrumahdinas OWNER TO postgres;

--
-- Name: t_detailtanahlain_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailtanahlain_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailtanahlain_seq OWNER TO postgres;

--
-- Name: t_detailtanahlain; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailtanahlain (
    t_idrpangrek integer DEFAULT nextval('public.t_detailtanahlain_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_panjang double precision NOT NULL,
    t_lebar double precision NOT NULL,
    t_luas double precision NOT NULL,
    t_tarifdasar integer NOT NULL,
    t_jmlhbln integer NOT NULL,
    t_potongan integer
);


ALTER TABLE public.t_detailtanahlain OWNER TO postgres;

--
-- Name: t_detailtanahreklame_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailtanahreklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailtanahreklame_seq OWNER TO postgres;

--
-- Name: t_detailtanahreklame; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailtanahreklame (
    t_idrpangrek integer DEFAULT nextval('public.t_detailtanahreklame_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_panjang double precision NOT NULL,
    t_lebar double precision NOT NULL,
    t_luas double precision NOT NULL,
    t_tarifdasar integer NOT NULL,
    t_jmlhblnhari integer NOT NULL,
    t_lokasitanah integer NOT NULL,
    t_potongan integer
);


ALTER TABLE public.t_detailtanahreklame OWNER TO postgres;

--
-- Name: t_detailtempatparkir_t_idtempatparkir_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailtempatparkir_t_idtempatparkir_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailtempatparkir_t_idtempatparkir_seq OWNER TO postgres;

--
-- Name: t_detailtempatparkir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailtempatparkir (
    t_idtempatparkir integer DEFAULT nextval('public.t_detailtempatparkir_t_idtempatparkir_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_jeniskendaraan integer NOT NULL,
    t_jumlah double precision NOT NULL,
    t_tarifdasar double precision NOT NULL,
    t_potongan integer
);


ALTER TABLE public.t_detailtempatparkir OWNER TO postgres;

--
-- Name: t_detailtera_t_idtera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailtera_t_idtera_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailtera_t_idtera_seq OWNER TO postgres;

--
-- Name: t_detailtera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailtera (
    t_idtera integer DEFAULT nextval('public.t_detailtera_t_idtera_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_idtarif integer NOT NULL,
    t_jarak integer NOT NULL,
    t_volume integer NOT NULL,
    t_transportasi integer NOT NULL,
    t_hargadasar integer NOT NULL,
    t_jumlah double precision NOT NULL,
    t_lokasi integer NOT NULL
);


ALTER TABLE public.t_detailtera OWNER TO postgres;

--
-- Name: t_detailterminal_t_iddetailret_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailterminal_t_iddetailret_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailterminal_t_iddetailret_seq OWNER TO postgres;

--
-- Name: t_detailterminal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailterminal (
    t_iddetailret integer DEFAULT nextval('public.t_detailterminal_t_iddetailret_seq'::regclass) NOT NULL,
    t_idtransaksi integer,
    t_idjenispelayanan integer,
    t_idtarif integer,
    t_volume integer,
    t_hargadasar integer,
    t_jumlah double precision
);


ALTER TABLE public.t_detailterminal OWNER TO postgres;

--
-- Name: t_detailtrayek_t_iddetailret_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_detailtrayek_t_iddetailret_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailtrayek_t_iddetailret_seq OWNER TO postgres;

--
-- Name: t_detailtrayek; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailtrayek (
    t_iddetailret integer DEFAULT nextval('public.t_detailtrayek_t_iddetailret_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_idtarif integer NOT NULL,
    t_jmlhkendaraan integer,
    t_jmlhperjalanan integer,
    t_hargadasar double precision,
    t_jumlah double precision NOT NULL,
    t_satuan character varying(255)
);


ALTER TABLE public.t_detailtrayek OWNER TO postgres;

--
-- Name: t_detailwalet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_detailwalet (
    t_iddetailwalet integer DEFAULT nextval('public.t_datailwalet_t_iddetailwalet_seq'::regclass) NOT NULL,
    t_idtransaksi integer,
    t_hargapasar integer,
    t_volume double precision
);


ALTER TABLE public.t_detailwalet OWNER TO postgres;

--
-- Name: t_jenispelayanan_terminal_t_idjenispelayanan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_jenispelayanan_terminal_t_idjenispelayanan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_jenispelayanan_terminal_t_idjenispelayanan_seq OWNER TO postgres;

--
-- Name: t_jenispelayanan_terminal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_jenispelayanan_terminal (
    t_idjenispelayanan integer DEFAULT nextval('public.t_jenispelayanan_terminal_t_idjenispelayanan_seq'::regclass) NOT NULL,
    t_keterangan character varying(255)
);


ALTER TABLE public.t_jenispelayanan_terminal OWNER TO postgres;

--
-- Name: t_kantorskpd_t_idskpd_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_kantorskpd_t_idskpd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_kantorskpd_t_idskpd_seq OWNER TO postgres;

--
-- Name: t_kantorskpd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_kantorskpd (
    t_idskpd integer DEFAULT nextval('public.t_kantorskpd_t_idskpd_seq'::regclass) NOT NULL,
    t_tglbysistem date,
    t_namaskpd character varying(255) DEFAULT NULL::character varying,
    t_jalanskpd character varying(255) DEFAULT NULL::character varying,
    t_idkecskpd integer,
    t_kecamatanskpd character varying(255) DEFAULT NULL::character varying,
    t_idkelskpd integer,
    t_kelurahanskpd character varying(255) DEFAULT NULL::character varying,
    is_userpendaftaran integer,
    t_tutupskpd integer,
    is_tutupskpd integer
);


ALTER TABLE public.t_kantorskpd OWNER TO postgres;

--
-- Name: t_keberatan_t_idkeberatan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_keberatan_t_idkeberatan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_keberatan_t_idkeberatan_seq OWNER TO postgres;

--
-- Name: t_keberatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_keberatan (
    t_idkeberatan integer DEFAULT nextval('public.t_keberatan_t_idkeberatan_seq'::regclass) NOT NULL,
    t_idwpobjek integer,
    t_idketetapan integer,
    t_jenisketetapan integer,
    t_jenispajak integer,
    t_nokeberatan integer,
    t_tglketetapankeberatan date,
    t_alasankeberatan text,
    t_jmlhketetapanseharusnya double precision,
    t_inputkeberatan integer,
    t_tglverifikasi date,
    t_statusverifikasi integer,
    t_pejabatverifikasi integer,
    t_nilaipengurangan integer,
    t_jmlhpengurangan double precision,
    t_jmlhditetapkan double precision,
    t_nomorsk character varying(100),
    t_jangkawaktu double precision,
    t_ukuranmedia double precision,
    t_parameter character varying(255),
    t_jumlah double precision,
    t_jenisreklameusaha double precision,
    t_debitair double precision,
    t_lamawaktu double precision,
    t_totalbiaya double precision,
    t_kualitasair double precision,
    t_peruntukan double precision,
    t_volume double precision,
    t_restitusi double precision,
    t_statuskompensasi integer
);


ALTER TABLE public.t_keberatan OWNER TO postgres;

--
-- Name: t_klasifikasi_kebersihan_t_idklasifikasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_klasifikasi_kebersihan_t_idklasifikasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_klasifikasi_kebersihan_t_idklasifikasi_seq OWNER TO postgres;

--
-- Name: t_klasifikasi_kebersihan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_klasifikasi_kebersihan (
    t_idklasifikasi integer DEFAULT nextval('public.t_klasifikasi_kebersihan_t_idklasifikasi_seq'::regclass) NOT NULL,
    t_keterangan character varying(255)
);


ALTER TABLE public.t_klasifikasi_kebersihan OWNER TO postgres;

--
-- Name: t_klasifikasi_pasar_t_idklasifikasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_klasifikasi_pasar_t_idklasifikasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_klasifikasi_pasar_t_idklasifikasi_seq OWNER TO postgres;

--
-- Name: t_klasifikasi_pasar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_klasifikasi_pasar (
    t_idklasifikasi integer DEFAULT nextval('public.t_klasifikasi_pasar_t_idklasifikasi_seq'::regclass) NOT NULL,
    t_keterangan character varying(255)
);


ALTER TABLE public.t_klasifikasi_pasar OWNER TO postgres;

--
-- Name: t_klasifikasi_pasargrosir_t_idklasifikasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_klasifikasi_pasargrosir_t_idklasifikasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_klasifikasi_pasargrosir_t_idklasifikasi_seq OWNER TO postgres;

--
-- Name: t_klasifikasi_pasargrosir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_klasifikasi_pasargrosir (
    t_idklasifikasi integer DEFAULT nextval('public.t_klasifikasi_pasargrosir_t_idklasifikasi_seq'::regclass) NOT NULL,
    t_keterangan character varying(255)
);


ALTER TABLE public.t_klasifikasi_pasargrosir OWNER TO postgres;

--
-- Name: t_lampiranppj_t_idlampiranppj_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_lampiranppj_t_idlampiranppj_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_lampiranppj_t_idlampiranppj_seq OWNER TO postgres;

--
-- Name: t_lampiranppj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_lampiranppj (
    t_idlampiranppj integer DEFAULT nextval('public.t_lampiranppj_t_idlampiranppj_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_goltarifpln text,
    t_batasdaya text,
    t_jmlpelanggan integer,
    t_jmlkwhterjual double precision,
    t_tarifperkwh double precision,
    t_jmllistrikterjual double precision,
    t_jmlbiayabeban double precision,
    t_jmlnilaijuallistrik double precision,
    t_tarif double precision,
    t_jumlah double precision,
    t_row character(1) NOT NULL
);


ALTER TABLE public.t_lampiranppj OWNER TO postgres;

--
-- Name: t_setoranlain_t_idsetoranlain_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_setoranlain_t_idsetoranlain_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_setoranlain_t_idsetoranlain_seq OWNER TO postgres;

--
-- Name: t_setoranlain_t_nomorurut_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_setoranlain_t_nomorurut_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_setoranlain_t_nomorurut_seq OWNER TO postgres;

--
-- Name: t_setoranlain; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_setoranlain (
    t_idsetoranlain integer DEFAULT nextval('public.t_setoranlain_t_idsetoranlain_seq'::regclass) NOT NULL,
    t_idsatker integer NOT NULL,
    t_idrekening integer NOT NULL,
    t_tahunpajak character varying(5) NOT NULL,
    t_jumlahsetor double precision NOT NULL,
    t_tglsetor date DEFAULT now() NOT NULL,
    t_viasetor character(1) NOT NULL,
    t_kodebukti integer NOT NULL,
    t_issetorandeleted integer DEFAULT 0 NOT NULL,
    t_nomorurut integer DEFAULT nextval('public.t_setoranlain_t_nomorurut_seq'::regclass) NOT NULL,
    t_keterangan character varying(255)
);


ALTER TABLE public.t_setoranlain OWNER TO postgres;

--
-- Name: t_setorbankdetail_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_setorbankdetail_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_setorbankdetail_seq OWNER TO postgres;

--
-- Name: t_setorbankdetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_setorbankdetail (
    t_idsbd integer DEFAULT nextval('public.t_setorbankdetail_seq'::regclass) NOT NULL,
    t_idsbh integer NOT NULL,
    t_idkoreksbd integer NOT NULL,
    t_jmlhsbd double precision NOT NULL,
    t_issbddeleted integer DEFAULT 0 NOT NULL,
    t_idtransaksi integer
);


ALTER TABLE public.t_setorbankdetail OWNER TO postgres;

--
-- Name: t_setorbankheader_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_setorbankheader_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_setorbankheader_seq OWNER TO postgres;

--
-- Name: t_setorbankheader; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_setorbankheader (
    t_idsbh integer DEFAULT nextval('public.t_setorbankheader_seq'::regclass) NOT NULL,
    t_tglsbh date NOT NULL,
    t_nosbh character varying(50) NOT NULL,
    t_issbhdeleted integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.t_setorbankheader OWNER TO postgres;

--
-- Name: t_skpdkb_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_skpdkb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_skpdkb_seq OWNER TO postgres;

--
-- Name: t_skpdkb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_skpdkb (
    t_idskpdkb integer DEFAULT nextval('public.t_skpdkb_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_nopemeriksaan character varying(25) NOT NULL,
    t_noskpdkb integer NOT NULL,
    t_periodeskpdkb character(4) NOT NULL,
    t_tglskpdkb date NOT NULL,
    t_tgljatuhtemposkpdkb date NOT NULL,
    t_tarifpajak double precision NOT NULL,
    t_dasarrevisi double precision NOT NULL,
    t_selisihdasar double precision NOT NULL,
    t_jmlhbln double precision NOT NULL,
    t_tarifpersen double precision NOT NULL,
    t_jmlhdendaskpdkb integer NOT NULL,
    t_jmlhpajakseharusnya double precision NOT NULL,
    t_jmlhpajakskpdkb double precision NOT NULL,
    t_kodebayarskpdkb character varying(15) NOT NULL,
    t_totalskpdkb double precision NOT NULL,
    t_operatorskpdkb integer NOT NULL,
    t_tglbayarskpdkb date,
    t_viabayarskpdkb integer,
    t_jmlhbayarskpdkb double precision,
    t_operatorbayarskpdkb integer,
    t_jenispemeriksaan integer
);


ALTER TABLE public.t_skpdkb OWNER TO postgres;

--
-- Name: t_skpdkbt_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_skpdkbt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_skpdkbt_seq OWNER TO postgres;

--
-- Name: t_skpdkbt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_skpdkbt (
    t_idskpdkbt integer DEFAULT nextval('public.t_skpdkbt_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_nopemeriksaan character varying(25) NOT NULL,
    t_noskpdkbt integer NOT NULL,
    t_periodeskpdkbt character(4) NOT NULL,
    t_tglskpdkbt date NOT NULL,
    t_tgljatuhtemposkpdkbt date NOT NULL,
    t_tarifpajak double precision NOT NULL,
    t_dasarrevisi double precision NOT NULL,
    t_selisihdasar double precision NOT NULL,
    t_jmlhbln double precision NOT NULL,
    t_tarifpersen double precision NOT NULL,
    t_jmlhdendaskpdkbt integer NOT NULL,
    t_jmlhpajakseharusnya double precision NOT NULL,
    t_jmlhpajakskpdkbt double precision NOT NULL,
    t_kodebayarskpdkbt character varying(15) NOT NULL,
    t_totalskpdkbt double precision NOT NULL,
    t_operatorskpdkbt integer NOT NULL,
    t_tglbayarskpdkbt date,
    t_viabayarskpdkbt integer,
    t_jmlhbayarskpdkbt double precision,
    t_operatorbayarskpdkbt integer,
    t_jenispemeriksaan integer
);


ALTER TABLE public.t_skpdkbt OWNER TO postgres;

--
-- Name: t_skpdlb_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_skpdlb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_skpdlb_seq OWNER TO postgres;

--
-- Name: t_skpdlb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_skpdlb (
    t_idskpdlb integer DEFAULT nextval('public.t_skpdlb_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_nopemeriksaan character varying(25) NOT NULL,
    t_noskpdlb integer NOT NULL,
    t_periodeskpdlb character(4) NOT NULL,
    t_tglskpdlb date NOT NULL,
    t_tarifpajak double precision NOT NULL,
    t_dasarrevisi double precision NOT NULL,
    t_selisihdasar double precision NOT NULL,
    t_jmlhpajakseharusnya double precision NOT NULL,
    t_totalskpdlb double precision NOT NULL,
    t_kodebayarskpdlb character varying(16) NOT NULL,
    t_operatorskpdlb integer NOT NULL,
    t_tglpengembalianskpdlb date,
    t_jmlhpengembalianskpdlb double precision,
    t_operatorpengembalianskpdlb integer,
    t_jenispemeriksaan integer
);


ALTER TABLE public.t_skpdlb OWNER TO postgres;

--
-- Name: t_skpdn_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_skpdn_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_skpdn_seq OWNER TO postgres;

--
-- Name: t_skpdn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_skpdn (
    t_idskpdn integer DEFAULT nextval('public.t_skpdn_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_nopemeriksaan character varying(25) NOT NULL,
    t_noskpdn integer NOT NULL,
    t_periodeskpdn character(4) NOT NULL,
    t_tglskpdn date NOT NULL,
    t_tarifpajak double precision NOT NULL,
    t_dasarrevisi double precision NOT NULL,
    t_selisihdasar double precision NOT NULL,
    t_jmlhpajakseharusnya double precision NOT NULL,
    t_totalskpdn double precision NOT NULL,
    t_operatorskpdn integer NOT NULL,
    t_jenispemeriksaan integer
);


ALTER TABLE public.t_skpdn OWNER TO postgres;

--
-- Name: t_skpdt_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_skpdt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_skpdt_seq OWNER TO postgres;

--
-- Name: t_skpdt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_skpdt (
    t_idskpdt integer DEFAULT nextval('public.t_skpdt_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_nopemeriksaan character varying(25) NOT NULL,
    t_noskpdt integer NOT NULL,
    t_periodeskpdt character(4) NOT NULL,
    t_tglskpdt date NOT NULL,
    t_tgljatuhtemposkpdt date NOT NULL,
    t_tarifpajak double precision NOT NULL,
    t_dasarrevisi double precision NOT NULL,
    t_selisihdasar double precision NOT NULL,
    t_jmlhbln double precision NOT NULL,
    t_tarifpersen double precision NOT NULL,
    t_jmlhdendaskpdt integer NOT NULL,
    t_jmlhpajakseharusnya double precision NOT NULL,
    t_tarifkenaikan double precision NOT NULL,
    t_jmlhkenaikan double precision NOT NULL,
    t_jmlhpajakskpdt double precision NOT NULL,
    t_kodebayarskpdt character varying(15) NOT NULL,
    t_totalskpdt double precision NOT NULL,
    t_operatorskpdt integer NOT NULL,
    t_tglbayarskpdt date,
    t_viabayarskpdt integer,
    t_jmlhbayarskpdt double precision,
    t_operatorbayarskpdt integer
);


ALTER TABLE public.t_skpdt OWNER TO postgres;

--
-- Name: t_suratkesanggupan_t_idsurat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_suratkesanggupan_t_idsurat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_suratkesanggupan_t_idsurat_seq OWNER TO postgres;

--
-- Name: t_suratkesanggupan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_suratkesanggupan (
    t_idsurat integer DEFAULT nextval('public.t_suratkesanggupan_t_idsurat_seq'::regclass) NOT NULL,
    t_idwpobjek integer NOT NULL,
    t_noangsuran integer NOT NULL,
    t_tempatlahir character(50),
    t_tgllahir date NOT NULL,
    t_pekerjaan character(50),
    t_jns_kelamin character(50),
    t_jns_pemungutan character(50),
    t_jns_izin character(50),
    t_jmlhsetoran double precision,
    t_start_setoran integer,
    t_operator integer NOT NULL,
    t_status_cetak integer
);


ALTER TABLE public.t_suratkesanggupan OWNER TO postgres;

--
-- Name: t_teguranlaporpajak_t_idteguran_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_teguranlaporpajak_t_idteguran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_teguranlaporpajak_t_idteguran_seq OWNER TO postgres;

--
-- Name: t_teguranlaporpajak; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_teguranlaporpajak (
    t_idteguran integer DEFAULT nextval('public.t_teguranlaporpajak_t_idteguran_seq'::regclass) NOT NULL,
    t_noteguran integer NOT NULL,
    t_idobjekteguran integer NOT NULL,
    t_tglteguran date,
    t_operatorinputteguran integer NOT NULL,
    t_bulanpajak character(2) NOT NULL,
    t_tahunpajak character(4) NOT NULL
);


ALTER TABLE public.t_teguranlaporpajak OWNER TO postgres;

--
-- Name: t_transaksi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_transaksi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_transaksi_seq OWNER TO postgres;

--
-- Name: t_transaksi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_transaksi (
    t_idtransaksi integer DEFAULT nextval('public.t_transaksi_seq'::regclass) NOT NULL,
    t_idwpobjek integer NOT NULL,
    t_idkorek integer NOT NULL,
    t_jenispajak double precision NOT NULL,
    t_nourut integer,
    t_periodepajak character(4) NOT NULL,
    t_tglpendataan date NOT NULL,
    t_masaawal date NOT NULL,
    t_masaakhir date NOT NULL,
    t_dasarpengenaan double precision NOT NULL,
    t_nilaiperolehan double precision,
    t_tarifpajak double precision,
    t_tarifdasarkorek integer,
    t_jmlhpajak double precision NOT NULL,
    t_namakegiatan character varying(255) DEFAULT NULL::character varying,
    t_noskpdjab integer,
    t_tarifkenaikan double precision,
    t_jmlhkenaikan double precision,
    t_operatorpendataan integer,
    is_deluserpendataan integer DEFAULT 0,
    t_tglpenetapan date,
    t_nopenetapan integer,
    t_operatorpenetapan integer DEFAULT 0,
    is_deluserpenetapan integer,
    t_tgljatuhtempo date,
    t_kodebayar character varying(15) DEFAULT NULL::character varying,
    t_viapembayaran integer DEFAULT 0,
    t_jmlhpembayaran double precision,
    t_nopembayaran integer,
    t_tglpembayaran date,
    t_operatorpembayaran integer DEFAULT 0,
    is_deluserpembayaran integer,
    t_nostpd integer,
    t_idkorekdenda integer,
    t_jmlhdendapembayaran double precision,
    t_jmlhbulandendapembayaran character(2),
    t_tgldendapembayaran date,
    t_operatordendapembayaran integer DEFAULT 0,
    is_deluserdendapembayaran integer,
    t_viapembayarandenda integer DEFAULT 0,
    t_jmlhbayardenda double precision,
    t_tglbayardenda date,
    t_operatorbayardenda integer DEFAULT 0,
    is_deluserbayardenda integer,
    t_alasanpembatalanskpd text,
    t_tglpembatalanskpd date,
    t_nopembatalanskpd integer,
    is_esptpd integer DEFAULT 0,
    t_tglentry_system timestamp(6) without time zone DEFAULT now() NOT NULL,
    t_file_berkas character varying(255),
    t_jenissarang integer,
    t_umurbangunan integer,
    t_keterangankatering character varying(255),
    t_opdkatering character varying(255),
    t_kompensasi double precision,
    t_jmlhpajakasli double precision,
    t_lamawaktu integer,
    t_id_bank integer,
    "keRekening" character varying(255),
    "dariRekening" character varying(255),
    t_reffnum character varying(255)
);


ALTER TABLE public.t_transaksi OWNER TO postgres;

--
-- Name: t_wp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_wp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_wp_seq OWNER TO postgres;

--
-- Name: t_wp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_wp (
    t_idwp integer DEFAULT nextval('public.t_wp_seq'::regclass) NOT NULL,
    t_tgldaftar date NOT NULL,
    t_jenispendaftaran character(1) NOT NULL,
    t_bidangusaha integer NOT NULL,
    t_nopendaftaran integer NOT NULL,
    t_nik character varying(20) NOT NULL,
    t_nama character varying(255) NOT NULL,
    t_alamat text NOT NULL,
    t_rt character(3) NOT NULL,
    t_rw character(3) NOT NULL,
    t_kelurahan integer NOT NULL,
    t_kecamatan integer NOT NULL,
    t_kelurahanluar character varying(50) DEFAULT NULL::character varying,
    t_kecamatanluar character varying(50) DEFAULT NULL::character varying,
    t_kabupaten character varying(50) NOT NULL,
    t_notelp character varying(15) NOT NULL,
    t_kodepos character varying(5) DEFAULT NULL::character varying,
    t_email character varying(50) DEFAULT NULL::character varying,
    t_operatorid integer NOT NULL,
    is_deluser integer,
    t_nama_badan character varying(255),
    t_jalan_badan text,
    t_rt_badan character(3),
    t_rw_badan character(3),
    t_kecamatan_badan integer,
    t_kelurahan_badan integer,
    t_kabupaten_badan character varying(50),
    t_kecamatan_badan_luar character varying(50),
    t_kelurahan_badan_luar character varying(50),
    t_status_wp boolean DEFAULT true,
    t_tgl_tutup date,
    t_ket_tutup character varying,
    t_operatorid_tutup integer,
    t_noberita character varying(30),
    t_tgl_buka date,
    t_ket_buka character varying,
    t_operatorid_buka integer,
    t_noberita_buka character varying(30),
    t_photowp character varying(255)
);


ALTER TABLE public.t_wp OWNER TO postgres;

--
-- Name: t_wpobjek_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_wpobjek_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_wpobjek_seq OWNER TO postgres;

--
-- Name: t_wpobjek; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_wpobjek (
    t_idobjek integer DEFAULT nextval('public.t_wpobjek_seq'::regclass) NOT NULL,
    t_idwp integer NOT NULL,
    t_noobjek integer NOT NULL,
    t_tgldaftarobjek date NOT NULL,
    t_namaobjekpj character varying(255) DEFAULT NULL::character varying,
    t_alamatobjekpj character varying(255) DEFAULT NULL::character varying,
    t_namaobjek character varying(255) NOT NULL,
    t_alamatobjek character varying(255) NOT NULL,
    t_rtobjek character(3) NOT NULL,
    t_rwobjek character(3) NOT NULL,
    t_kecamatanobjek integer NOT NULL,
    t_kelurahanobjek integer NOT NULL,
    t_kabupatenobjek character varying(30) NOT NULL,
    t_notelpobjek character varying(15) DEFAULT NULL::character varying,
    t_jenisobjek integer NOT NULL,
    t_kodeposobjek character varying(5) DEFAULT NULL::character varying,
    t_latitudeobjek character varying(100) NOT NULL,
    t_longitudeobjek character varying(100) NOT NULL,
    t_gambarobjek character varying(100) DEFAULT NULL::character varying,
    t_operatorid integer NOT NULL,
    t_korekobjek integer,
    t_kamar integer,
    t_statusobjek boolean DEFAULT true,
    t_operatoridtutup integer,
    t_tipeusaha integer
);


ALTER TABLE public.t_wpobjek OWNER TO postgres;

--
-- Name: t_wpobjekgenset_t_idgensetobjek_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_wpobjekgenset_t_idgensetobjek_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_wpobjekgenset_t_idgensetobjek_seq OWNER TO postgres;

--
-- Name: v_surat_teguran; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_surat_teguran AS
 SELECT a.t_idwp,
    i.t_nourut,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((b.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((c.s_kodekel)::text, 2, '0'::text))
            ELSE (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((j.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((k.s_kodekel)::text, 2, '0'::text))
        END AS t_npwpd,
    a.t_nama,
    ((((((lpad((e.t_jenisobjek)::text, 2, '0'::text) || '.'::text) || lpad((e.t_noobjek)::text, 5, '0'::text)) || '.'::text) || lpad((g.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((h.s_kodekel)::text, 3, '0'::text)) AS t_nop,
    e.t_namaobjek,
    i.t_tglpendataan,
    i.t_jmlhpajak,
    i.t_tglpembayaran,
    i.t_jmlhpembayaran,
    i.t_jenispajak,
    i.t_idtransaksi,
    i.t_tgljatuhtempo,
    date_part('day'::text, ((('now'::text)::date)::timestamp without time zone - (i.t_tgljatuhtempo)::timestamp without time zone)) AS hari_lebih_tempo,
    i.t_masaawal,
    i.t_masaakhir
   FROM ((((((((((public.t_wp a
     LEFT JOIN public.s_kecamatan b ON ((a.t_kecamatan = b.s_idkec)))
     LEFT JOIN public.s_kelurahan c ON ((a.t_kelurahan = c.s_idkel)))
     LEFT JOIN public.s_users d ON ((a.t_operatorid = d.s_iduser)))
     LEFT JOIN public.t_wpobjek e ON ((a.t_idwp = e.t_idwp)))
     LEFT JOIN public.s_jenisobjek_baru f ON ((e.t_jenisobjek = f.s_idjenis)))
     LEFT JOIN public.s_kecamatan g ON ((e.t_kecamatanobjek = g.s_idkec)))
     LEFT JOIN public.s_kelurahan h ON ((e.t_kelurahanobjek = h.s_idkel)))
     LEFT JOIN public.t_transaksi i ON ((e.t_idobjek = i.t_idwpobjek)))
     LEFT JOIN public.s_kecamatan j ON ((a.t_kecamatan_badan = j.s_idkec)))
     LEFT JOIN public.s_kelurahan k ON ((a.t_kelurahan_badan = k.s_idkel)))
  WHERE (((i.t_jmlhpembayaran IS NULL) OR (i.t_jmlhpembayaran = (0)::double precision)) AND (i.t_tglpembayaran IS NULL))
  ORDER BY i.t_nourut DESC;


ALTER TABLE public.v_surat_teguran OWNER TO postgres;

--
-- Name: view_realisasi_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_realisasi_dashboard AS
 SELECT s_rekening.s_jenisobjek,
    s_rekening.s_namakorek,
    ( SELECT COALESCE(s_targetdetail.s_targetjumlah, (0)::bigint) AS "coalesce"
           FROM (public.s_target
             LEFT JOIN public.s_targetdetail ON ((s_target.s_idtarget = s_targetdetail.s_idtargetheader)))
          WHERE ((((s_target.s_tahuntarget)::integer)::double precision = date_part('year'::text, now())) AND (s_targetdetail.s_targetrekening = s_rekening.s_idkorek))) AS target,
    ( SELECT COALESCE(sum(aa.t_jmlhpembayaran), (0)::double precision) AS "coalesce"
           FROM (public.t_transaksi aa
             LEFT JOIN public.s_rekening za ON ((aa.t_idkorek = za.s_idkorek)))
          WHERE ((date_part('year'::text, aa.t_tglpembayaran) = date_part('year'::text, now())) AND ((za.s_tipekorek)::text = (s_rekening.s_tipekorek)::text) AND ((za.s_kelompokkorek)::text = (s_rekening.s_kelompokkorek)::text) AND ((za.s_jeniskorek)::text = (s_rekening.s_jeniskorek)::text) AND ((za.s_objekkorek)::text = (s_rekening.s_objekkorek)::text))) AS real_tahunini,
    ( SELECT COALESCE(sum(aa.t_jmlhbayarskpdkb), (0)::double precision) AS "coalesce"
           FROM ((public.t_skpdkb aa
             LEFT JOIN public.t_transaksi zb ON ((aa.t_idtransaksi = zb.t_idtransaksi)))
             LEFT JOIN public.s_rekening za ON ((zb.t_idkorek = za.s_idkorek)))
          WHERE ((date_part('year'::text, aa.t_tglbayarskpdkb) = date_part('year'::text, now())) AND ((za.s_tipekorek)::text = (s_rekening.s_tipekorek)::text) AND ((za.s_kelompokkorek)::text = (s_rekening.s_kelompokkorek)::text) AND ((za.s_jeniskorek)::text = (s_rekening.s_jeniskorek)::text) AND ((za.s_objekkorek)::text = (s_rekening.s_objekkorek)::text))) AS skpdkb_tahunini,
    ( SELECT COALESCE(sum(aa.t_jmlhbayarskpdkbt), (0)::double precision) AS "coalesce"
           FROM ((public.t_skpdkbt aa
             LEFT JOIN public.t_transaksi zb ON ((aa.t_idtransaksi = zb.t_idtransaksi)))
             LEFT JOIN public.s_rekening za ON ((zb.t_idkorek = za.s_idkorek)))
          WHERE ((date_part('year'::text, aa.t_tglbayarskpdkbt) = date_part('year'::text, now())) AND ((za.s_tipekorek)::text = (s_rekening.s_tipekorek)::text) AND ((za.s_kelompokkorek)::text = (s_rekening.s_kelompokkorek)::text) AND ((za.s_jeniskorek)::text = (s_rekening.s_jeniskorek)::text) AND ((za.s_objekkorek)::text = (s_rekening.s_objekkorek)::text))) AS skpdkbt_tahunini
   FROM public.s_rekening
  WHERE (((s_rekening.s_rinciankorek)::text = '00'::text) AND ((s_rekening.s_jeniskorek)::text = '1'::text))
  ORDER BY s_rekening.s_tipekorek, s_rekening.s_kelompokkorek, s_rekening.s_jeniskorek, s_rekening.s_objekkorek, s_rekening.s_rinciankorek, s_rekening.s_sub1korek;


ALTER TABLE public.view_realisasi_dashboard OWNER TO postgres;

--
-- Name: view_rekening; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_rekening AS
 SELECT
        CASE
            WHEN ((a.s_sub1korek)::text <> ''::text) THEN (((((((((((a.s_tipekorek)::text || '.'::text) || (a.s_kelompokkorek)::text) || '.'::text) || (a.s_jeniskorek)::text) || '.'::text) || (a.s_objekkorek)::text) || '.'::text) || (a.s_rinciankorek)::text) || '.'::text) || (a.s_sub1korek)::text)
            ELSE
            CASE
                WHEN ((a.s_sub2korek)::text <> ''::text) THEN (((((((((((((a.s_tipekorek)::text || '.'::text) || (a.s_kelompokkorek)::text) || '.'::text) || (a.s_jeniskorek)::text) || '.'::text) || (a.s_objekkorek)::text) || '.'::text) || (a.s_rinciankorek)::text) || '.'::text) || (a.s_sub1korek)::text) || '.'::text) || (a.s_sub2korek)::text)
                ELSE
                CASE
                    WHEN ((a.s_sub3korek)::text <> ''::text) THEN (((((((((((((((a.s_tipekorek)::text || '.'::text) || (a.s_kelompokkorek)::text) || '.'::text) || (a.s_jeniskorek)::text) || '.'::text) || (a.s_objekkorek)::text) || '.'::text) || (a.s_rinciankorek)::text) || '.'::text) || (a.s_sub1korek)::text) || '.'::text) || (a.s_sub2korek)::text) || '.'::text) || (a.s_sub3korek)::text)
                    ELSE (((((((((a.s_tipekorek)::text || '.'::text) || (a.s_kelompokkorek)::text) || '.'::text) || (a.s_jeniskorek)::text) || '.'::text) || (a.s_objekkorek)::text) || '.'::text) || (a.s_rinciankorek)::text)
                END
            END
        END AS korek,
    a.s_idkorek,
    a.s_jenisobjek,
    a.s_tipekorek,
    a.s_kelompokkorek,
    a.s_jeniskorek,
    a.s_objekkorek,
    a.s_rinciankorek,
    a.s_sub1korek,
    a.s_sub2korek,
    a.s_sub3korek,
    a.s_namakorek,
    a.s_persentarifkorek,
    a.s_tarifdasarkorek,
    a.s_voldasarkorek,
    a.s_tariftambahkorek,
    a.s_tglawalkorek,
    a.s_tglakhirkorek,
    a.is_deluser,
    b.s_namajenis,
    a.t_berdasarmasa,
    b.s_idjenis
   FROM (public.s_rekening a
     LEFT JOIN public.s_jenisobjek b ON ((b.s_idjenis = a.s_jenisobjek)));


ALTER TABLE public.view_rekening OWNER TO postgres;

--
-- Name: view_rekeningminerba; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_rekeningminerba AS
 SELECT
        CASE
            WHEN ((a.s_sub1korek)::text <> ''::text) THEN (((((((((((a.s_tipekorek)::text || '.'::text) || (a.s_kelompokkorek)::text) || '.'::text) || (a.s_jeniskorek)::text) || '.'::text) || (a.s_objekkorek)::text) || '.'::text) || (a.s_rinciankorek)::text) || '.'::text) || (a.s_sub1korek)::text)
            ELSE
            CASE
                WHEN ((a.s_sub2korek)::text <> ''::text) THEN (((((((((((((a.s_tipekorek)::text || '.'::text) || (a.s_kelompokkorek)::text) || '.'::text) || (a.s_jeniskorek)::text) || '.'::text) || (a.s_objekkorek)::text) || '.'::text) || (a.s_rinciankorek)::text) || '.'::text) || (a.s_sub1korek)::text) || '.'::text) || (a.s_sub2korek)::text)
                ELSE
                CASE
                    WHEN ((a.s_sub3korek)::text <> ''::text) THEN (((((((((((((((a.s_tipekorek)::text || '.'::text) || (a.s_kelompokkorek)::text) || '.'::text) || (a.s_jeniskorek)::text) || '.'::text) || (a.s_objekkorek)::text) || '.'::text) || (a.s_rinciankorek)::text) || '.'::text) || (a.s_sub1korek)::text) || '.'::text) || (a.s_sub2korek)::text) || '.'::text) || (a.s_sub3korek)::text)
                    ELSE (((((((((a.s_tipekorek)::text || '.'::text) || (a.s_kelompokkorek)::text) || '.'::text) || (a.s_jeniskorek)::text) || '.'::text) || (a.s_objekkorek)::text) || '.'::text) || (a.s_rinciankorek)::text)
                END
            END
        END AS korek,
    a.s_idkorek,
    a.s_jenisobjek,
    a.s_tipekorek,
    a.s_kelompokkorek,
    a.s_jeniskorek,
    a.s_objekkorek,
    a.s_rinciankorek,
    a.s_sub1korek,
    a.s_sub2korek,
    a.s_sub3korek,
    a.s_namakorek,
    a.s_persentarifkorek,
    a.s_tarifdasarkorek,
    a.s_voldasarkorek,
    a.s_tariftambahkorek,
    a.s_tglawalkorek,
    a.s_tglakhirkorek,
    a.is_deluser,
    b.s_namajenis,
    a.t_berdasarmasa,
    b.s_idjenis,
    a.t_jenisbahan
   FROM (public.s_rekening a
     LEFT JOIN public.s_jenisobjek b ON ((b.s_idjenis = a.s_jenisobjek)));


ALTER TABLE public.view_rekeningminerba OWNER TO postgres;

--
-- Name: view_rekmin; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_rekmin AS
 SELECT s_minerba_jenis.s_idjenisminerba,
    s_minerba_jenis.s_namajenisminerba,
    s_minerba_jenis.s_idkorek,
    s_minerba_jenis.s_idzona,
    s_minerba_jenis.s_harga,
    s_minerba_jenis.s_keterangan,
    view_rekening.korek,
    view_rekening.s_jenisobjek,
    view_rekening.s_tipekorek,
    view_rekening.s_kelompokkorek,
    view_rekening.s_jeniskorek,
    view_rekening.s_idjenis,
    view_rekening.t_berdasarmasa,
    view_rekening.s_namajenis,
    view_rekening.is_deluser,
    view_rekening.s_tglakhirkorek,
    view_rekening.s_tglawalkorek,
    view_rekening.s_tariftambahkorek,
    view_rekening.s_voldasarkorek,
    view_rekening.s_tarifdasarkorek,
    view_rekening.s_persentarifkorek,
    view_rekening.s_namakorek,
    view_rekening.s_sub3korek,
    view_rekening.s_objekkorek,
    view_rekening.s_rinciankorek,
    view_rekening.s_sub1korek,
    view_rekening.s_sub2korek
   FROM (public.s_minerba_jenis
     JOIN public.view_rekening ON ((s_minerba_jenis.s_idkorek = view_rekening.s_idkorek)));


ALTER TABLE public.view_rekmin OWNER TO postgres;

--
-- Name: view_targetsatker; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_targetsatker AS
 SELECT c.s_namasatker,
    a.s_idtargetsatker,
    a.s_idkorek,
    a.s_idkelompoktargetsatker,
    a.s_target,
    b.s_idkelompoktarget,
    b.s_namatarget,
    b.s_tahuntarget,
    b.s_idsatker,
    c.s_kodesatker
   FROM (((public.s_targetsatker a
     JOIN public.s_kelompoktargetsatker b ON ((a.s_idkelompoktargetsatker = b.s_idkelompoktarget)))
     JOIN public.s_satker c ON ((b.s_idsatker = c.s_idsatker)))
     LEFT JOIN public.s_rekening d ON ((d.s_idkorek = a.s_idkorek)));


ALTER TABLE public.view_targetsatker OWNER TO postgres;

--
-- Name: view_wp; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_wp AS
 SELECT a.t_idwp,
    a.t_tgldaftar,
    a.t_jenispendaftaran,
    a.t_bidangusaha,
    a.t_nopendaftaran,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((b.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((c.s_kodekel)::text, 2, '0'::text))
            ELSE (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((d.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((e.s_kodekel)::text, 2, '0'::text))
        END AS t_npwpd,
    a.t_nik,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_nama
            ELSE a.t_nama_badan
        END AS t_nama,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN concat(a.t_alamat, ', RT. ', a.t_rt, ', RW. ', a.t_rw, ', Desa ', c.s_namakel, ', Kec. ', b.s_namakec, ', Kab. ', a.t_kabupaten)
            ELSE concat(a.t_jalan_badan, ', RT. ', a.t_rt_badan, ', RW. ', a.t_rw_badan, ', Desa ', e.s_namakel, ', Kec. ', d.s_namakec, ', Kab. ', a.t_kabupaten_badan)
        END AS t_alamat_lengkap,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_alamat
            ELSE a.t_jalan_badan
        END AS t_alamat,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_rt
            ELSE a.t_rt_badan
        END AS t_rt,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_rw
            ELSE a.t_rw_badan
        END AS t_rw,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_kelurahan
            ELSE a.t_kelurahan_badan
        END AS t_kelurahan,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN c.s_namakel
            ELSE e.s_namakel
        END AS s_namakel,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_kecamatan
            ELSE a.t_kecamatan_badan
        END AS t_kecamatan,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN b.s_namakec
            ELSE d.s_namakec
        END AS s_namakec,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_kabupaten
            ELSE a.t_kabupaten_badan
        END AS t_kabupaten,
    a.t_notelp,
    a.t_kodepos,
    a.t_email,
    a.t_operatorid,
    a.is_deluser,
    f.s_nama,
    a.t_status_wp,
    a.t_tgl_tutup,
    a.t_ket_tutup,
    a.t_operatorid_tutup,
    a.t_photowp
   FROM (((((public.t_wp a
     LEFT JOIN public.s_kecamatan b ON ((a.t_kecamatan = b.s_kodekec)))
     LEFT JOIN public.s_kelurahan c ON (((a.t_kelurahan = c.s_kodekel) AND (a.t_kecamatan = c.s_idkeckel))))
     LEFT JOIN public.s_kecamatan d ON ((a.t_kecamatan_badan = d.s_kodekec)))
     LEFT JOIN public.s_kelurahan e ON (((a.t_kelurahan_badan = e.s_kodekel) AND (a.t_kecamatan_badan = e.s_idkeckel))))
     LEFT JOIN public.s_users f ON ((a.t_operatorid = f.s_iduser)));


ALTER TABLE public.view_wp OWNER TO postgres;

--
-- Name: view_wp_v2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_wp_v2 AS
 SELECT a.t_idwp,
    a.t_tgldaftar,
    a.t_jenispendaftaran,
    a.t_bidangusaha,
    a.t_nopendaftaran,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((b.s_kodekec)::text, 3, '0'::text)) || '.'::text) || lpad((c.s_kodekel)::text, 3, '0'::text))
            ELSE (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((d.s_kodekec)::text, 3, '0'::text)) || '.'::text) || lpad((e.s_kodekel)::text, 3, '0'::text))
        END AS t_npwpd,
    a.t_nik,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_nama
            ELSE a.t_nama_badan
        END AS t_nama,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN concat(a.t_alamat, ', RT. ', a.t_rt, ', RW. ', a.t_rw, ', Desa ', c.s_namakel, ', Kec. ', b.s_namakec, ', Kab. ', a.t_kabupaten)
            ELSE concat(a.t_jalan_badan, ', RT. ', a.t_rt_badan, ', RW. ', a.t_rw_badan, ', Desa ', e.s_namakel, ', Kec. ', d.s_namakec, ', Kab. ', a.t_kabupaten_badan)
        END AS t_alamat_lengkap,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_alamat
            ELSE a.t_jalan_badan
        END AS t_alamat,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_rt
            ELSE a.t_rt_badan
        END AS t_rt,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_rw
            ELSE a.t_rw_badan
        END AS t_rw,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_kelurahan
            ELSE a.t_kelurahan_badan
        END AS t_kelurahan,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN c.s_namakel
            ELSE e.s_namakel
        END AS s_namakel,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_kecamatan
            ELSE a.t_kecamatan_badan
        END AS t_kecamatan,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN b.s_namakec
            ELSE d.s_namakec
        END AS s_namakec,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_kabupaten
            ELSE a.t_kabupaten_badan
        END AS t_kabupaten,
    a.t_notelp,
    a.t_kodepos,
    a.t_email,
    a.t_operatorid,
    a.is_deluser,
    f.s_nama,
    a.t_status_wp,
    a.t_tgl_tutup,
    a.t_ket_tutup,
    a.t_operatorid_tutup,
    a.t_photowp,
    a.t_kecamatanluar AS kecamatanluarwp,
    a.t_kelurahanluar AS kelurahanluarwp
   FROM (((((public.t_wp a
     LEFT JOIN public.s_kecamatan b ON ((a.t_kecamatan = b.s_idkec)))
     LEFT JOIN public.s_kelurahan c ON (((a.t_kelurahan = c.s_idkel) AND (a.t_kecamatan = c.s_idkeckel))))
     LEFT JOIN public.s_kecamatan d ON ((a.t_kecamatan_badan = d.s_idkec)))
     LEFT JOIN public.s_kelurahan e ON (((a.t_kelurahan_badan = e.s_idkel) AND (a.t_kecamatan_badan = e.s_idkeckel))))
     LEFT JOIN public.s_users f ON ((a.t_operatorid = f.s_iduser)));


ALTER TABLE public.view_wp_v2 OWNER TO postgres;

--
-- Name: view_wp_v3; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_wp_v3 AS
 SELECT a.t_idwp,
    a.t_tgldaftar,
    a.t_jenispendaftaran,
    a.t_bidangusaha,
    a.t_nopendaftaran,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((b.s_kodekec)::text, 3, '0'::text)) || '.'::text) || lpad((c.s_kodekel)::text, 3, '0'::text))
            ELSE (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((d.s_kodekec)::text, 3, '0'::text)) || '.'::text) || lpad((e.s_kodekel)::text, 3, '0'::text))
        END AS t_npwpd,
    a.t_nik,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_nama
            ELSE a.t_nama_badan
        END AS t_nama,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN concat(a.t_alamat, ', RT. ', a.t_rt, ', RW. ', a.t_rw, ', Desa ', c.s_namakel, ', Kec. ', b.s_namakec, ', Kab. ', a.t_kabupaten)
            ELSE concat(a.t_jalan_badan, ', RT. ', a.t_rt_badan, ', RW. ', a.t_rw_badan, ', Desa ', e.s_namakel, ', Kec. ', d.s_namakec, ', Kab. ', a.t_kabupaten_badan)
        END AS t_alamat_lengkap,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_alamat
            ELSE a.t_jalan_badan
        END AS t_alamat,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_rt
            ELSE a.t_rt_badan
        END AS t_rt,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_rw
            ELSE a.t_rw_badan
        END AS t_rw,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_kelurahan
            ELSE a.t_kelurahan_badan
        END AS t_kelurahan,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN c.s_namakel
            ELSE e.s_namakel
        END AS s_namakel,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_kecamatan
            ELSE a.t_kecamatan_badan
        END AS t_kecamatan,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN b.s_namakec
            ELSE d.s_namakec
        END AS s_namakec,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN a.t_kabupaten
            ELSE a.t_kabupaten_badan
        END AS t_kabupaten,
    a.t_notelp,
    a.t_kodepos,
    a.t_email,
    a.t_operatorid,
    a.is_deluser,
    f.s_nama,
    a.t_status_wp,
    a.t_tgl_tutup,
    a.t_ket_tutup,
    a.t_operatorid_tutup,
    a.t_photowp,
    a.t_kecamatanluar AS kecamatanluarwp,
    a.t_kelurahanluar AS kelurahanluarwp
   FROM (((((public.t_wp a
     LEFT JOIN public.s_kecamatan b ON ((a.t_kecamatan = b.s_idkec)))
     LEFT JOIN public.s_kelurahan c ON (((a.t_kelurahan = c.s_idkel) AND (a.t_kecamatan = c.s_idkeckel))))
     LEFT JOIN public.s_kecamatan d ON ((a.t_kecamatan_badan = d.s_idkec)))
     LEFT JOIN public.s_kelurahan e ON (((a.t_kelurahan_badan = e.s_idkel) AND (a.t_kecamatan_badan = e.s_idkeckel))))
     LEFT JOIN public.s_users f ON ((a.t_operatorid = f.s_iduser)));


ALTER TABLE public.view_wp_v3 OWNER TO postgres;

--
-- Name: view_wpobjek; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_wpobjek AS
 SELECT a.t_idobjek,
    a.t_idwp,
    a.t_noobjek,
    a.t_tgldaftarobjek,
    ((((((lpad((a.t_jenisobjek)::text, 2, '0'::text) || '.'::text) || lpad((a.t_noobjek)::text, 5, '0'::text)) || '.'::text) || lpad((g.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((h.s_kodekel)::text, 2, '0'::text)) AS t_nop,
    a.t_namaobjek,
    a.t_alamatobjek,
    a.t_namaobjekpj,
    a.t_alamatobjekpj,
    a.t_rtobjek,
    a.t_rwobjek,
    a.t_kelurahanobjek,
    d.s_namakel,
    a.t_kecamatanobjek,
    c.s_namakec,
    a.t_kabupatenobjek,
    (((((((((a.t_alamatobjek)::text || ', RT. '::text) || (a.t_rtobjek)::text) || ', RW. '::text) || (a.t_rwobjek)::text) || ', Desa '::text) || (d.s_namakel)::text) || ', Kec. '::text) || (c.s_namakec)::text) AS t_alamatlengkapobjek,
    a.t_kodeposobjek,
    a.t_latitudeobjek,
    a.t_longitudeobjek,
    a.t_notelpobjek,
    a.t_jenisobjek,
    a.t_operatorid,
    b.s_idjenis,
    b.s_namajenis,
    b.s_namajenissingkat,
    b.t_akhirlapor,
    b.t_akhirbayar,
    b.t_jmlharitempo,
    a.t_gambarobjek,
    b.s_jenispungutan,
    ( SELECT aa.t_npwpd
           FROM public.view_wp aa
          WHERE (aa.t_idwp = a.t_idwp)) AS t_npwpdwp,
        CASE
            WHEN (e.t_bidangusaha = 1) THEN e.t_nama
            ELSE e.t_nama_badan
        END AS t_namawp,
        CASE
            WHEN (e.t_bidangusaha = 1) THEN concat(e.t_alamat, ', RT. ', e.t_rt, ', RW. ', e.t_rw, ', Desa ', d.s_namakel, ', Kec. ', c.s_namakec, ', Kab. ', e.t_kabupaten)
            ELSE concat(e.t_jalan_badan, ', RT. ', e.t_rt_badan, ', RW. ', e.t_rw_badan, ', Desa ', h.s_namakel, ', Kec. ', g.s_namakec, ', Kab. ', e.t_kabupaten_badan)
        END AS t_alamat_lengkapwp,
    f.s_nama,
    a.t_korekobjek,
    e.t_noberita,
    a.t_statusobjek,
    e.t_nik AS t_nikwp,
    a.t_tipeusaha,
    i.s_namausaha
   FROM ((((((((public.t_wpobjek a
     LEFT JOIN public.s_jenisobjek b ON ((a.t_jenisobjek = b.s_idjenis)))
     LEFT JOIN public.s_kecamatan c ON ((a.t_kecamatanobjek = c.s_idkec)))
     LEFT JOIN public.s_kelurahan d ON (((a.t_kelurahanobjek = d.s_kodekel) AND (a.t_kecamatanobjek = d.s_idkeckel))))
     LEFT JOIN public.t_wp e ON ((a.t_idwp = e.t_idwp)))
     LEFT JOIN public.s_users f ON ((a.t_operatorid = f.s_iduser)))
     LEFT JOIN public.s_kecamatan g ON ((a.t_kecamatanobjek = g.s_idkec)))
     LEFT JOIN public.s_kelurahan h ON (((a.t_kelurahanobjek = h.s_kodekel) AND (a.t_kecamatanobjek = h.s_idkeckel))))
     LEFT JOIN public.s_tipeusaha i ON ((a.t_tipeusaha = i.s_idusaha)));


ALTER TABLE public.view_wpobjek OWNER TO postgres;

--
-- Name: view_wpobjek_v2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_wpobjek_v2 AS
 SELECT a.t_idobjek,
    a.t_idwp,
    a.t_noobjek,
    a.t_tgldaftarobjek,
    ((((((lpad((a.t_jenisobjek)::text, 2, '0'::text) || '.'::text) || lpad((a.t_noobjek)::text, 5, '0'::text)) || '.'::text) || lpad((g.s_kodekec)::text, 3, '0'::text)) || '.'::text) || lpad((h.s_kodekel)::text, 3, '0'::text)) AS t_nop,
    g.s_kodekec,
    h.s_kodekel,
    a.t_namaobjek,
    a.t_alamatobjek,
    a.t_namaobjekpj,
    a.t_alamatobjekpj,
    a.t_rtobjek,
    a.t_rwobjek,
    a.t_kelurahanobjek,
    d.s_namakel AS s_namakelobjek,
    a.t_kecamatanobjek,
    c.s_namakec AS s_namakecobjek,
    a.t_kabupatenobjek,
    (((((((((a.t_alamatobjek)::text || ', RT. '::text) || (a.t_rtobjek)::text) || ', RW. '::text) || (a.t_rwobjek)::text) || ', Desa '::text) || (d.s_namakel)::text) || ', Kec. '::text) || (c.s_namakec)::text) AS t_alamatlengkapobjek,
    a.t_kodeposobjek,
    a.t_latitudeobjek,
    a.t_longitudeobjek,
    a.t_notelpobjek,
    a.t_jenisobjek,
    a.t_operatorid,
    b.s_idjenis,
    b.s_namajenis,
    b.s_namajenissingkat,
    b.t_akhirlapor,
    b.t_akhirbayar,
    b.t_jmlharitempo,
    a.t_gambarobjek,
    b.s_jenispungutan,
    ( SELECT aa.t_npwpd
           FROM public.view_wp_v3 aa
          WHERE (aa.t_idwp = a.t_idwp)) AS t_npwpdwp,
        CASE
            WHEN (e.t_bidangusaha = 1) THEN e.t_nama
            ELSE e.t_nama_badan
        END AS t_namawp,
        CASE
            WHEN (e.t_bidangusaha = 1) THEN concat(e.t_alamat, ', RT. ', e.t_rt, ', RW. ', e.t_rw, ', Desa ', d.s_namakel, ', Kec. ', c.s_namakec, ', Kab. ', e.t_kabupaten)
            ELSE concat(e.t_jalan_badan, ', RT. ', e.t_rt_badan, ', RW. ', e.t_rw_badan, ', Desa ', h.s_namakel, ', Kec. ', g.s_namakec, ', Kab. ', e.t_kabupaten_badan)
        END AS t_alamat_lengkapwp,
    f.s_nama,
    a.t_korekobjek,
    e.t_noberita,
    a.t_statusobjek,
    e.t_nik AS t_nikwp,
    a.t_tipeusaha,
    i.s_namausaha
   FROM ((((((((public.t_wpobjek a
     LEFT JOIN public.s_jenisobjek b ON ((a.t_jenisobjek = b.s_idjenis)))
     LEFT JOIN public.s_kecamatan c ON ((a.t_kecamatanobjek = c.s_idkec)))
     LEFT JOIN public.s_kelurahan d ON ((a.t_kelurahanobjek = d.s_idkel)))
     LEFT JOIN public.t_wp e ON ((a.t_idwp = e.t_idwp)))
     LEFT JOIN public.s_users f ON ((a.t_operatorid = f.s_iduser)))
     LEFT JOIN public.s_kecamatan g ON ((a.t_kecamatanobjek = g.s_idkec)))
     LEFT JOIN public.s_kelurahan h ON ((a.t_kelurahanobjek = h.s_idkel)))
     LEFT JOIN public.s_tipeusaha i ON ((a.t_tipeusaha = i.s_idusaha)));


ALTER TABLE public.view_wpobjek_v2 OWNER TO postgres;

--
-- Name: s_reklamenilaiinsidentil s_idreklamenilaiinsidentil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.s_reklamenilaiinsidentil ALTER COLUMN s_idreklamenilaiinsidentil SET DEFAULT nextval('public.s_reklamenilaiinsidentil_s_idreklamenilaiinsidentil_seq'::regclass);


--
-- Name: s_reklamenilaijalan s_idreklamenilaijalan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.s_reklamenilaijalan ALTER COLUMN s_idreklamenilaijalan SET DEFAULT nextval('public.s_reklamenilaijalan_s_idreklamenilaijalan_seq'::regclass);


--
-- Name: s_reklamenjop s_idnjopreklame; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.s_reklamenjop ALTER COLUMN s_idnjopreklame SET DEFAULT nextval('public.s_reklamenjop_s_idnjopreklame_seq'::regclass);


--
-- Name: s_reklamesatuan s_idsatuanreklame; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.s_reklamesatuan ALTER COLUMN s_idsatuanreklame SET DEFAULT nextval('public.s_reklamesatuan_s_idsatuanreklame_seq'::regclass);


--
-- Name: s_reklametariftambahan s_idreklametariftambahan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.s_reklametariftambahan ALTER COLUMN s_idreklametariftambahan SET DEFAULT nextval('public.s_reklametariftambahan_s_idreklametariftambahan_seq'::regclass);


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission (id, permission_name, resource_id, alias, permission_role) FROM stdin;
81	grafik	2	Grafik	(2),(3),(4),(5),(6),(7)
173	dataGridPembayaranSkpdkb	7	Tabel Pembayaran SKPDKB	(2),(3),(4)
82	index	3	Index	(2),(3)
84	FormTambah	3	Form Tambah	(2),(3)
85	FormEdit	3	Form Edit	(2),(3)
86	FormTambahobjek	3	Form Tambah Objek	(2),(3)
87	noobjek	3	Cari Nomor Objek	(2),(3)
88	editobjekpajak	3	Edit Objek	(2),(3)
89	hapus	3	Hapus	(2),(3)
91	ceknik	3	Cek No. Identitas Sama	(2),(3)
92	dataWP	3	Cari Data WPR	(2),(3)
93	cetakkartudata	3	Cetak Kartu Data	(2),(3)
94	cetaknpwpd	3	Cetak NPWPD	(2),(3)
95	cetakpendaftaran	3	Cetak Data Pendaftaran WPR	(2),(3)
96	cetakpendaftaranexcel	3	Cetak Data Pendaftaran WPR Excel	(2),(3)
97	cetakpendaftaranop	3	Cetak Data Pendaftaran OPR	(2),(3)
147	hitungtotalpajakminerba	4	Hitung Jumlah Pajak Mineral	(2),(3),(4)
148	hitungpajakwalet	4	Hitung Jumlah Pajak Walet	(2),(3),(4)
149	cetakhimbauan	4	Cetak Surat Himbauan	(2),(3),(4)
150	cetaknppdself	4	Cetak NPPD Self Assesment	(2),(3),(4)
151	cetaknppdofficial	4	Cetak NPPD Official Assesment	(2),(3),(4)
152	pilihskpdjabatan	4	Pilih SKPD Jabatan	(2),(3),(4)
153	dataSuratTeguran	4	Tampilkan Data Surat Teguran	(2),(3),(4)
154	cetaksuratteguran	4	Cetak Surat Teguran	(2),(3),(4)
155	cetakskrd	4	Cetak SKRD	(2),(3),(4)
101	dataGridSudah	4	Tabel Pendataan	(2),(3),(4)
102	dataGridMasahabis	4	Tabel Masa Habis PR	(2),(3),(4)
103	FormPagedefault	4	Form Tambah Default	(2),(3),(4)
104	FormPagedefaultedit	4	Form Edit Default	(2),(3),(4)
105	FormPagereklame	4	Form Tambah Reklame	(2),(3),(4)
107	FormPageminerba	4	Form Tambah Mineral	(2),(3),(4)
99	index	4	Index	(2),(3),(4)
108	FormPageair	4	Form Tambah Air Bawah Tanah	(2),(3),(4)
109	FormPagewalet	4	Form Tambah Walet	(2),(3),(4)
119	hapus	4	Hapus	(2),(3),(4)
120	comboKelurahanCamat	4	Combo Box Kelurahan Camat 1	(2),(3),(4)
121	cetakkodebayar	4	Cetak Kode Bayar	(2),(3),(4)
122	cetakpendataan	4	Cetak Data Pendataan	(2),(3),(4)
124	cetaksptpdhotel	4	Cetak SPTPD Hotel	(2),(3),(4)
125	cetaksptpdrestoran	4	Cetak SPTPD Restoran	(2),(3),(4)
126	cetaksptpdhiburan	4	Cetak SPTPD Hiburan	(2),(3),(4)
127	cetaksptpdreklame	4	Cetak SPTPD Reklame	(2),(3),(4)
128	cetaksptpdppj	4	Cetak SPTPD PPJ	(2),(3),(4)
129	cetaksptpdminerba	4	Cetak SPTPD Mineral	(2),(3),(4)
131	cetaksptpdabt	4	Cetak SPTPD Air Bawah Tanah	(2),(3),(4)
132	cetaksptpdwalet	4	Cetak SPTPD Walet	(2),(3),(4)
133	hitungpajak	4	Hitung Jumlah Pajak	(2),(3),(4)
134	hitungpajakreklame	4	Hitung Jumlah Pajak Reklame	(2),(3),(4)
135	hitungpajakair	4	Hitung Jumlah Pajak Air Bawah Tanah	(2),(3),(4)
139	CariPendaftaranByObjek	4	Cari Data Pendaftaran Berdasar Objek	(2),(3),(4)
142	CariPendataanAirByObjek	4	Cari Data Pendataan Air Berdasar Objek	(2),(3),(4)
143	dataGridRekening	4	Tabel Rekening	(2),(3),(4)
144	pilihRekening	4	Pilih Data Rekening	(2),(3),(4)
164	comboKelurahanCamat	5	Combo Box Kelurahan Camat 1	(2),(3),(4)
156	index	5	Index	(2),(3),(4)
157	dataGridBelum	5	Tabel Belum Ditetapkan	(2),(3),(4)
158	dataGridSudah	5	Tabel Sudah Ditetapkan	(2),(3),(4)
159	FormPenetapanreklame	5	Form Penetapan Reklame	(2),(3),(4)
161	hapus	5	Hapus	(2),(3),(4)
162	dataPenetapan	5	Cari Data Penetapan	(2),(3),(4)
163	cetakskpd	5	Cetak SKPD	(2),(3),(4)
165	cetakdataskpdrek	5	Cetak Data SKPD Berdasarkan Rekening	(2),(3),(4)
166	cetakdataskpdobj	5	Cetak Data SKPD Berdasarkan Jenis PR	(2),(3),(4)
169	cetakskpdjabatan	6	Cetak SKPD Jabatan	(2),(3),(4)
167	index	6	Index	(2),(3),(4)
168	dataGrid	6	Tabl	(2),(3),(4)
170	dataPendataan	6	Cari Data Pendataan	(2),(3),(4)
79	logout	1	Logout	(2),(3),(4),(5),(6),(7)
171	index	7	Index	(2),(3),(4)
182	hapus	8	Hapus	(2),(3),(4)
180	dataGridPembayaranSkpdkbt	8	Tabel Pembayaran SKPDKBT	(2),(3),(4)
177	cetakskpdkb	7	Cetak SKPDKB	(2),(3),(4)
184	cetakskpdkbt	8	Cetak SKPDKBT	(2),(3),(4)
183	dataSkpdkbt	8	Cari Data SKPDKBT	(2),(3),(4)
172	dataGridSkpdkb	7	Tabel SKPDKB	(2),(3),(4)
178	index	8	Index	(2),(3),(4)
179	dataGridSkpdkbt	8	Tabel SKPDKBT	(2),(3),(4)
185	index	9	Index	(2),(3),(4)
175	hapus	7	Hapus	(2),(3),(4)
145	caritarifminerba	4	Cari Tarif Mineral	(2),(3),(4)
188	FormPengembalianskpdlb	9	Form Pengembalian SKPDLB	(2),(3),(4)
191	index	10	Index	(2),(3),(4)
190	dataSkpdlb	9	Cari Data SKPDLB	(2),(3),(4)
230	index	15	Index	(2),(4),(7)
194	dataSkpdn	10	Cari Data SKPDN	(2),(3),(4)
192	dataGridSkpdn	10	Tabel SKPDN	(2),(3),(4)
193	hapus	10	Hapus	(2),(3),(4)
196	dataGridBelum	11	Tabel Belum Dibayarankan	(2),(6)
195	index	11	Index	(2),(6)
197	dataGridSudah	11	Tabel Sudah Dibayarkan	(2),(6)
198	FormPembayaran	11	Form Tambah Pembayarn	(2),(6)
200	hapus	11	Hapus	(2),(6)
201	cetakpembayaran	11	Cetak Data Pembayaran	(2),(6)
202	dataPembayaran	11	Cari Data Pembayaran	(2),(6)
203	cetaksspd	11	Cetak SSPD	(2),(6)
210	dataPembayaran	12	Cari Data Pembayaran Denda	(2),(6)
211	cetaksspd	12	Cetak SSPD	(2),(6)
213	cetakstpd	12	Cetak STPD	(2),(6)
204	index	12	Index	(2),(6)
212	dataPendataan	12	Cari Data Pendataan	(2),(6)
207	FormPembayarandenda	12	Form Pembayaran Denda	(2),(6)
206	dataGridSudah	12	Tabel Sudah Ditetapkan Denda	(2),(6)
208	hapus	12	Hapus	(2),(6)
209	cetakpembayaran	12	Cetak Data Pembayaran Denda	(2),(6)
219	cetakrekambank	13	Cetak Data Rekam Setoran	(2),(6)
221	cetaksts	13	Cetak STS	(2),(6)
220	dataRekambank	13	Cari Data Rekam Bank	(2),(6)
218	hapus	13	Hapus	(2),(6)
216	FormSetoran	13	Form Tambah Setoran Bank	(2),(6)
215	datagridsetoran	13	Tabel Setoran Bank	(2),(6)
214	index	13	Index	(2),(6)
223	dataGridBelum	14	Tabel Akan Jatuh Tempo	(2),(5)
224	dataGridSudah	14	Tabel Sudah Jatuh Tempo	(2),(5)
226	cetakstpd	14	Cetak STPD	(2),(5)
227	comboKelurahanCamat	14	Combo Box Kelurahan Camat 1	(2),(5)
222	index	14	Index	(2),(5)
229	cetaktunggakan	14	Cetak Data Tunggakan	(2),(5)
228	cetakpiutang	14	Cetak Data Piutang	(2),(5)
281	edit	25	Form Edit	(2),(5),(7)
233	pilihketetapan	15	Pilih Ketetapan	(2),(4),(7)
282	hapus	25	Hapus	(2),(5),(7)
235	hapus	15	Hapus	(2),(4),(7)
186	dataGridSkpdlb	9	Tabel SKPDLB	(2),(3),(4)
245	cetakbukuwp	16	Cetak Buku WP	(2),(3),(4),(5),(6),(7)
247	cetaktunggakan	16	Ceetak Data Tunggakan	(2),(3),(4),(5),(6),(7)
237	index	16	Index	(2),(3),(4),(5),(6),(7)
239	cetakrealisasiobjek	16	Cetak Data Realisasi Obejk	(2),(3),(4),(5),(6),(7)
241	cetaktransmasa	16	Cetak Transaksi Objek Berdasarkan Masa PR	(2),(3),(4),(5),(6),(7)
242	dataGrid	16	Tabel NPWPD	(2),(3),(4),(5),(6),(7)
243	pilihwp	16	Pilih WPR	(2),(3),(4),(5),(6),(7)
244	comboKelurahanCamat	16	Combo Box Kelurahan Camat 1	(2),(3),(4),(5),(6),(7)
248	index	19	Index	(2),(3),(4),(5),(6),(7)
278	index	25	Index	(2),(5),(7)
280	tambah	25	Form Tambah	(2),(5),(7)
246	cetakpiutang	16	Cetak Data Piutang	(2),(3),(4),(5),(6),(7)
249	CariObjekPajak	19	Cari Objek PR	(2),(3),(4),(5),(6),(7)
236	dataPemeriksaan	15	Data Pemeriksaan	(2),(4),(7)
251	index	20	Index	(2)
252	tambah	20	Form Tambah	(2)
256	edit	21	Form Edit User	(2)
255	tambah	21	Form Tambah User	(2)
253	index	21	Index	(2)
258	ubahpass	21	Ubah Password	(2)
257	hapus	21	Hapus	(2)
259	index	22	Index	(2)
264	cetakdaftarkelurahan	22	Cetak Data Kelurahan	(2)
263	hapus	22	Hapus	(2)
262	edit	22	Form Edit Kelurahan	(2)
261	tambah	22	Form Tambah Kelurahan	(2)
260	dataGrid	22	Tabel Kelurahan	(2)
267	dataGrid	23	Tabel Pejabat	(2)
268	tambah	23	Form Tambah Pejabat	(2)
269	edit	23	Form Edit Pejabat	(2)
270	hapus	23	Hapus	(2)
266	index	23	Index	(2)
271	cetakdaftarpejabat	23	Form Cetak Data Pejabat	(2)
276	hapus	24	Hapus	(2)
272	index	24	Index	(2)
274	tambah	24	Form Tambah	(2)
275	edit	24	Form Edit	(2)
277	cetakdaftarkecamatan	24	Cetak Data Kecamatan	(2)
288	hapus	26	Hapus	(2),(5),(7)
279	dataGrid	25	Tabel Kode Rekening	(2),(5),(7)
287	edit	26	Form Edit Target Anggaran	(2),(5),(7)
284	index	26	Index	(2),(5),(7)
285	dataGrid	26	Tabel Target Anggaran	(2),(5),(7)
286	tambah	26	Form Tambah Target Anggaran	(2),(5),(7)
232	FormPemeriksaan	15	Form Tambah Pemeriksaan	(2),(4),(7)
367	hapusobjekpajak	3	Hapus Objek Pajak	(2),(3)
370	cetakskrd	5	Cetak SKRD	(2),(3),(4)
371	cariwp	5	Cari WP	(2),(3),(4)
309	bayarkan	17	Bayarkan Denda	(2),(6)
315	cetakskpdlb	9	Cetak SKPDLB	(2),(3),(4)
319	FormPembayaranskpdt	29	Form Pembayaran SKPDT	(2),(4)
314	cetakskpdn	10	Cetak Data SKPDN	(2),(3),(4)
373	cetakpembayaran	9	Cetak Pembayaran	(2),(3),(4)
391	dataGridSptpd	11	Tabel SPTPD	(2),(6)
293	edittargetdetail	26	Edit Detail Target	(2),(5),(7)
376	cetakpembayaran	15	Cetak Pembayaran	(2),(4),(7)
313	cetakDataSkpdkb	7	Cetak Data SKPDKB	(2),(3),(4)
381	cetaktransmasaexcel	16	Cetak Transaksi Objek Berdasarkan Masa PR Excell	(2),(3),(4),(5),(6),(7)
379	cetakrealisasiobjekexcel	16	Cetak Realisasi Objek Excell	(2),(3),(4),(5),(6),(7)
378	cetakrealisasiexcel	16	Cetak Realisasi Excell	(2),(3),(4),(5),(6),(7)
377	cetaksspd	15	Cetak SSPD	(2),(4),(7)
374	FormPemeriksaanskpdt	15	Form Pemeriksaan SKPDT	(2),(4),(7)
292	pilihRekening	26	Pilih Rekening	(2),(5),(7)
307	dataGridSudahDibayarkan	17	Tabel Sudah Dibayarkan	(2),(6)
305	dataGridBelum	17	Tabel Belum Ditetapkan	(2),(6)
304	index	17	Index	(2),(6)
384	hapustargetdetail	26	Hapus Target Detail	(2),(5),(7)
310	hapus	17	Hapus	(2),(6)
311	dataStpdpembayaran	17	Data STPD Pembayaran	(2),(6)
308	tetapkan	17	Tetapkan Denda	(2),(6)
306	dataGridSudah	17	Tabel Sudah Ditetapkan	(2),(6)
388	pilihRekening	21	Pilih Rekening	(2)
387	dataGridRekening	21	Tabel Rekening	(2)
386	cariobjekwp	21	Cari Objek WP	(2)
291	dataGridRekening	26	Tabel Kode Rekening	(2),(5),(7)
323	cetakskpdt	29	Cari Data SKPDT	(2),(4)
320	hapus	29	Hapus	(2),(4)
294	index	27	Index	(2)
298	hapus	27	Hapus	(2)
295	dataGrid	27	Tabel Setting Reklame	(2)
296	tambah	27	Form Tambah	(2)
297	edit	27	Form Edit	(2)
299	index	28	Index	(2)
300	dataGrid	28	Tabel Setting Air	(2)
301	tambah	28	Form Tambah	(2)
302	edit	28	Form Edit	(2)
303	hapus	28	Hapus	(2)
322	dataSkpdt	29	Cari Data SKPDT	(2),(4)
316	index	29	Index	(2),(4)
317	dataGridSkpdt	29	Tabel SKPDT	(2),(4)
318	dataGridPembayaranSkpdt	29	Tabel Pembayaran SKPDT	(2),(4)
375	hitungpemeriksaanskpdt	15	Hitung Pemeriksaan SKPDT	(2),(4),(7)
334	cetaksptpdppj	30	Cetak SPTPD PPJ	(2)
332	cetaksptpdrestoran	30	Cetak SPTPD Restoran	(2)
358	CariPendaftaranByObjek	30	Cari Pendaftaran By Objek	(2)
331	cetaksptpdhotel	30	Cetak SPTPD Hotel	(2)
341	hitungpajakwalet	30	Hitung Pajak Walet	(2)
340	pilihRekening	30	Pilih Rekening	(2)
339	dataGridRekening	30	Tabel Rekening	(2)
338	hitungpajak	30	Hitung Pajak	(2)
337	cetaksptpdwalet	30	Cetak SPTPD Walet	(2)
336	cetaksptpdparkir	30	Cetak SPTPD Parkir	(2)
335	cetaksptpdminerba	30	Cetak SPTPD Minerba	(2)
330	dataLaporan	30	Cari Data Laporan	(2)
329	cetakkodebayar	30	Cetak Kode Bayar	(2)
328	hapus	30	Hapus	(2)
326	FormPagedefault	30	Tambah Form Page Default	(2)
325	dataGrid	30	Tabel Laporan	(2)
324	index	30	Index Laporan	(2)
364	ubahpassback	30	Ubah Password	(2)
363	cetaksspd	30	Cetak SSPD	(2)
362	hitungtotalpajakminerba	30	Hitung Total Pajak Minerba	(2)
361	hitungpajakminerba	30	Hitung Pajak Minerba	(2)
360	caritarifminerba	30	Cari Tarif Minerba	(2)
359	CariLaporanByObjek	30	Cari Laporan By Objek	(2)
390	cetakdata	31	Cetak Data	(2)
343	dataGrid	31	Tabel Data	(2)
342	index	31	Index	(2)
389	cetakdata	32	Cetak Data	(2)
347	dataPendataan	32	Cari Data Pendataan	(2)
346	dataGrid	32	Tabel Data	(2)
345	index	32	Index	(2)
350	FormPagedefault	33	Form Tambah	(2)
349	dataGrid	33	Tabel Laporan Bendahara	(2)
348	index	33	Index	(2)
355	dataGridWp	33	Tabel WP	(2)
354	hitungpajak	33	Hitung Pajak	(2)
366	ubahpassback	33	Ubah Password	(2)
365	cetaksspd	33	Cetak SSPD	(2)
356	pilihWP	33	Pilih WP	(2)
352	cetakkodebayar	33	Cetak Kode Bayar	(2)
351	hapus	33	Hapus	(2)
369	cetakmasalskpd	5	Cetak Masal SKPD	(2),(3),(4)
418	detailop	3	Detail OP	(2),(3)
422	cetaklampiranppj	4	Cetak Lampiran PPJ	(2),(3),(4)
420	FormPageppj	4	Form Tambah PPJ	(2),(3),(4)
421	FormPageppjedit	4	Form Edit PPJ	(2),(3),(4)
417	cetakskpd	4	Cetak SKPD	(2),(3),(4)
416	hitungrettanahlain	4	Hitung Retribusi	(2),(3),(4)
410	FormPagewaletedit	4	Form Edit Walet	(2),(3),(4)
409	FormPageairedit	4	Form Edit Air Bawah Tanah	(2),(3),(4)
408	FormPageminerbaedit	4	Form Edit Minerba	(2),(3),(4)
491	pembatalanSKPD	5	Pembatalan SKPD	(2),(3),(4)
407	cetakssrd	17	Cetak SSRD	(2),(6)
406	cetakpembayaran	17	Cetak Pembayaran	(2),(6)
392	dataGridSkpdkb	11	Tabel SKPDKB	(2),(6)
404	cetaksspdskpdt	11	Cetak SSPD SKPDT	(2),(6)
403	cetaksspdskpdkbt	11	Cetak SSPD SKPDKBT	(2),(6)
402	cetaksspdskpdkb	11	Cetak SSPD SKPDKB	(2),(6)
401	cetakssrd	11	Cetak SSRD	(2),(6)
400	cetaksspdminerba	11	Cetak SSPD Minerba	(2),(6)
399	FormPembayaranskpdt	11	Form Pembayaran SKPDT	(2),(6)
398	dataGridSkpdt	11	Tabel SKPDT	(2),(6)
396	dataGridSkpdlb	11	Tabel SKPDLB	(2),(6)
395	FormPembayaranskpdkbt	11	Form Pembayaran SKPDKBT	(2),(6)
394	dataGridSkpdkbt	11	Tabel SKPDKBT	(2),(6)
393	FormPembayaranskpdkb	11	Form Pembayaran SKPDKB	(2),(6)
428	cetakpembayaranexcel	12	Cetak Data Pembayaran Denda Excel	(2),(6)
452	ceknosbh	13	Cek Nomor STS	(2),(6)
453	cetakregistersts	13	Cetak Register STS	(2),(6)
431	cetaksuratpaksa	14	Cetak Surat Paksa	(2),(5)
429	dataGridSuratTeguran	14	Tabel Surat Teguran	(2),(5)
456	cetakbku	16	Cetak Buku Kas Umum	(2),(3),(4),(5),(6),(7)
455	cetakbpps	16	Cetak Buku Pembantu Penerimaan Sejenis	(2),(3),(4),(5),(6),(7)
454	cetakkasharian	16	Cetak Laporan Harian BKU	(2),(3),(4),(5),(6),(7)
427	hapus	34	Menghapus Setoran Lain-lain	(2),(6)
457	cetakbpp	16	Cetak Buku Penerimaan dan Penyetoran	(2),(3),(4),(5),(6),(7)
449	dataGridSatker	34	Data Grid Satker	(2),(6)
488	cetakdaftarkecamatan	28	Seting Air	(2)
458	indexjenissumber	28	Seting Air	(2)
459	tambahjenissumber	28	Seting Air	(2)
460	editjenissumber	28	Seting Air	(2)
461	hapusjenissumber	28	Seting Air	(2)
462	dataGridJenisSumber	28	Seting Air	(2)
463	indexlokasicekungan	28	Seting Air	(2)
464	tambahlokasicekungan	28	Seting Air	(2)
466	hapuslokasicekungan	28	Seting Air	(2)
467	dataGridLokasiCekungan	28	Seting Air	(2)
468	indexjaringanpdam	28	Seting Air	(2)
469	tambahjaringanpdam	28	Seting Air	(2)
470	editjaringanpdam	28	Seting Air	(2)
471	hapusjaringanpdam	28	Seting Air	(2)
472	dataGridJaringanPDAM	28	Seting Air	(2)
473	indexkualitasair	28	Seting Air	(2)
474	tambahkualitasair	28	Seting Air	(2)
475	editkualitasair	28	Seting Air	(2)
476	hapuskualitasair	28	Seting Air	(2)
477	dataGridKualitasAir	28	Seting Air	(2)
478	indexareapengaruh	28	Seting Air	(2)
479	tambahareapengaruh	28	Seting Air	(2)
480	editareapengaruh	28	Seting Air	(2)
481	hapusareapengaruh	28	Seting Air	(2)
482	dataGridAreaPengaruh	28	Seting Air	(2)
483	indexkerusakan	28	Seting Air	(2)
484	tambahkerusakan	28	Seting Air	(2)
485	editkerusakan	28	Seting Air	(2)
486	hapuskerusakan	28	Seting Air	(2)
448	dataGridRekening	34	Data Grid Rekening	(2),(6)
451	pilihSatker	34	Pilih Satker	(2),(6)
450	pilihRekening	34	Pilih Rekening	(2),(6)
447	tambah	34	Tambah Setoran Lain-lain	(2),(6)
424	index	34	Halaman Daftar Setoran Lain-lain	(2),(6)
425	dataGrid	34	Melihat data Setoran Lain-lain	(2),(6)
490	selectRekeningJenis	16	Pilih Rekening Jenis	(2),(3),(4),(5),(6),(7)
433	dataGrid	35	Tabel Reklame Sticker	(2)
432	index	35	Pengaturan Reklame Sticker	(2)
437	edit	36	Edit Reklame Selebaran	(2)
436	dataGrid	36	Tabel Reklame Selebaran	(2)
435	index	36	Reklame Selebaran	(2)
440	edit	37	Edit Reklame Berjalan	(2)
438	index	37	Reklame Berjalan	(2)
439	dataGrid	37	Tabel Reklame Berjalan	(2)
443	edit	38	Edit Biaya Pemasangan Reklame	(2)
441	index	38	Biaya Pemasangan Reklame	(2)
444	index	39	Reklame Kelompok Jalan	(2)
445	index	40	Reklame Skor Ukuran	(2)
446	index	41	Sudut Pandang Reklame	(2)
489	cetakdaftarreklame	4	Cetak Daftar Reklame	(2),(3),(4)
500	cetakbppexcel	16	Cetak Buku Penerimaan dan Penyetoran Excel	(2),(3),(4),(5),(6),(7)
83	dataGrid	3	Tabel Pendaftaran	(2),(3)
90	comboKelurahanCamat	3	Combo Box Kelurahan Camat 1	(2),(3)
98	cetakpendaftaranopexcel	3	Cetak Data Pendaftaran OPR Excel	(2),(3)
505	FormTutup	3	Form Tutup WP	(2),(3)
419	detailwp	3	Detail WP	(2),(3)
368	ceknikcapil	3	Cek Nik Capil	(2),(3)
507	FormBukakembali	3	Form Buka Kembali WP	(2),(3)
506	dataGridTutup	3	Data Grid WP Tutup	(2),(3)
519	cetakpendterimadimuka	4	Cetak Pendapatan Diterima Dimuka	(2),(3),(4)
517	hitungtgl	4	Hitung Tgl	(2),(3),(4)
516	hitungpajakppj	4	hitungpajakppj	(2),(3),(4)
515	hitungtotalpajakppj	4	hitungtotalpajakppj	(2),(3),(4)
514	FormPageparkiredit	4	FormPageparkiredit	(2),(3),(4)
513	caritarifparkir	4	caritarifparkir	(2),(3),(4)
512	hitungtotalpajakparkir	4	Hitung Total Pajak Parkir	(2),(3),(4)
511	hitungpajakparkir	4	Hitung Pajak Parkir	(2),(3),(4)
510	FormPageparkir	4	Form Parkir	(2),(3),(4)
508	CariTarifpipa	4	Cari Tarif PIPA	(2),(3),(4)
504	CariKodeJenis	4	Cari Data Kode Jenis Air Tanah	(2),(3),(4)
423	CariPendataanByObjekOfficial	4	Cari Data Pendataan Berdasar Objek Official	(2),(3),(4)
539	FormPermohonanangsuran	42	FormPermohonanangsuran	(2),(6)
397	FormPengembalianskpdlb	11	Form Pengembalian SKPDLB	(2),(6)
199	hitungpembayaran	11	Hitung Jumlah Pembayaran	(2),(6)
205	dataGridBelum	12	Tabel Belum Ditetapkan Denda	(2),(6)
217	carisetoran	13	Cari Setoran Bank	(2),(6)
225	dataPendataan	14	Cari Data Pendataan	(2),(5)
430	cetaksuratteguran	14	Cetak Surat Teguran	(2),(5)
496	cetakkasharianexcel	16	Cetak Laporan Harian BKU Excel	(2),(3),(4),(5),(6),(7)
501	cetakrekapviaexcel	16	Cetak Rekapitulasi Penerimaan Via Excel	(2),(3),(4),(5),(6),(7)
499	cetakbkuexcel	16	Cetak Buku Kas Umum Excel	(2),(3),(4),(5),(6),(7)
497	cetakbppsexcel	16	Cetak Buku Pembantu Penerimaan Sejenis Excel	(2),(3),(4),(5),(6),(7)
495	cetakbukuwpexcel	16	Cetak Buku WP Excel	(2),(3),(4),(5),(6),(7)
494	cetakrekapvia	16	Cetak Rekapitulasi Penerimaan Via	(2),(3),(4),(5),(6),(7)
238	cetakrealisasi	16	Cetak Data Realisasi	(2),(3),(4),(5),(6),(7)
520	cetakpenddimuka	16	cetakpenddimuka	(2),(3),(4),(5),(6),(7)
250	CariTransaksiByobjek	19	Cari Transaksi Berdasarkan Objek PR	(2),(3),(4),(5),(6),(7)
385	ubahpassback	21	Ubah Password Operator	(2),(3),(4),(5),(6),(7)
290	tambahtargetdetail	26	Form Tambah Detail Target	(2),(5),(7)
100	dataGridWp	4	Tabel WPR	(2),(3),(4)
254	dataGrid	21	Tabel User	(2)
265	populateComboKecamatan	22	Combo Box Kelurahan Camat 1	(2)
273	dataGrid	24	Tabel Kecamatan	(2)
465	editlokasicekungan	28	Seting Air	(2)
487	dataGridKerusakan	28	Seting Air	(2)
333	cetaksptpdhiburan	30	Cetak SPTPD Hiburan	(2)
327	FormPagedefaultedit	30	Edit Form Page Default	(2)
344	dataPenetapan	31	Cari Data Penetapan	(2)
353	cetaksptpdrestoran	33	Cetak SPTPD	(2)
434	edit	35	Edit Reklame Sticker	(2)
442	dataGrid	38	Tabel Biaya Pemasangan Reklame	(2)
283	cetakdaftarrekening	25	Cetak Data Rekening	(2),(5),(7)
146	hitungpajakminerba	4	Hitung Jumlah Pajak Mineral/Sub	(2),(3),(4)
106	FormPagereklameedit	4	Form Edit Reklame	(2),(3),(4)
518	cetakregisterpajak	4	Cetak Register Pajak	(2),(3),(4)
123	dataPendataan	4	Cari Data Pendataan	(2),(3),(4)
130	cetaksptpdparkir	4	Cetak SPTPD Parkir	(2),(3),(4)
140	CariPendataanByObjek	4	Cari Data Pendataan Berdasar Objek	(2),(3),(4)
141	CariPendataanReklameByObjek	4	Cari Data Pendataan Reklame Berdasar Objek	(2),(3),(4)
160	FormPenetapanair	5	Form Penetapan Air Bawah Tanah	(2),(3),(4)
492	cetakpembatalanskpd	5	Cetak Pembatalan SKPD	(2),(3),(4)
372	cetakpembayaran	8	Cetak Pembayaran	(2),(3),(4)
312	hitungdenda	17	Cari Data Denda Pembayaran	(2),(6)
383	cetaktunggakanexcel	16	Cetak Data Tunggakan Excell	(2),(3),(4),(5),(6),(7)
502	cetakspj	16	Cetak Laporan SPJ PDF	(2),(3),(4),(5),(6),(7)
78	index	1	Index	(2),(3),(4),(5),(6),(7)
80	index	2	Index	(2),(3),(4),(5),(6),(7)
357	dataGrid	2	Tabel Realisasi	(2),(3),(4),(5),(6),(7)
189	hapus	9	Hapus	(2),(3),(4)
380	cetakketsetexcel	16	Cetak Ketetapan dan Setoran Excell	(2),(3),(4),(5),(6),(7)
503	cetakspjexcel	16	Cetak Laporan SPJ Excel	(2),(3),(4),(5),(6),(7)
176	dataSkpdkb	7	Cari Data SKPDKB	(2),(3),(4)
187	dataGridPengembalianSkpdlb	9	Tabel Pengembalian SKPDLB	(2),(3),(4)
181	FormPembayaranskpdkbt	8	Form Pembayaran SKPDKBT	(2),(3),(4)
321	cetakDataSkpdt	29	Cetak Data SKPDT	(2),(4)
405	cetakpembayaranexcel	11	Cetak Pembayaran Excell	(2),(6)
231	dataGridTransaksi	15	Tabel Transaksi	(2),(4),(7)
426	FormSetoran	34	Menambah Setoran Lain-lain	(2),(6)
498	cetakbppsrinciexcel	16	Cetak Buku Pembantu Perincian Objek Penerimaan Excel	(2),(3),(4),(5),(6),(7)
493	cetakbppsrinci	16	Cetak Buku Pembantu Perincian Objek Penerimaan	(2),(3),(4),(5),(6),(7)
382	cetakpiutangexcel	16	Cetak Data Piutang Excell	(2),(3),(4),(5),(6),(7)
240	cetakketset	16	Cetak Data Ketetapan dan Setoran	(2),(3),(4),(5),(6),(7)
174	FormPembayaranskpdkb	7	Form Pembayaran SKPDKB	(2),(3),(4)
234	hitungpemeriksaan	15	Hitung Pemeriksaan	(2),(4),(7)
289	cetakdaftartarget	26	Cetak Data Target Anggaran	(2),(5),(7)
524	hapus	6	Hapus	(2),(3),(4)
525	cetakrekapdata	3	cetakrekapdata	(2),(3)
526	cetakregisterpajak	16	cetakregisterpajak	(2),(3),(4),(5),(6),(7)
527	cetakmutasipiutang	14	cetakmutasipiutang	(2),(5)
530	cetakrekaptagihan	14	cetakrekaptagihan	(2),(5)
528	cetakbelumbayar	16	cetakbelumbayar	(2),(3),(4),(5),(6),(7)
529	cetakregistertagihan	14	cetakregistertagihan	(2),(5)
531	cetakrekapitulasipiutang	14	cetakrekapitulasipiutang	(2),(5)
532	cetakdaftarsaldoawalpiutang	14	cetakdaftarsaldoawalpiutang	(2),(5)
533	cetakdaftarsaldoakhirpiutang	14	cetakdaftarsaldoakhirpiutang	(2),(5)
534	cetakdaftarketetapanpiutang	14	cetakdaftarketetapanpiutang	(2),(5)
535	cetakdaftarsetoranpiutang	14	cetakdaftarsetoranpiutang	(2),(5)
536	validasipass	21	validasipass	(2),(3),(4),(5),(6),(7)
537	index	42	index	(2),(6)
543	dataWPSurat	3	dataWPSurat	(2),(3)
544	cetaksuratpernyataan	3	cetaksuratpernyataan	(2),(3)
545	dataGridBelumLapor	4	dataGridBelumLapor	(2),(3)
546	FormPageinputteguran	4	FormPageinputteguran	(2),(3)
547	cetakdaftarblmlapor	4	cetakdaftarblmlapor	(2),(3)
548	teguranlaporan	43	teguranlaporan	(2),(3)
549	index	43	index	(2),(3)
550	dataGridSuratTeguran	43	dataGridSuratTeguran	(2),(3)
551	cetaksuratteguran	43	cetaksuratteguran	(2),(3)
538	dataGridKetetapanAngsuranSkpd	42	dataGridKetetapanAngsuranSkpd	(2),(6)
540	dataGridKetetapanAngsuranSkpdkb	42	dataGridKetetapanAngsuranSkpdkb	(2),(6)
541	dataGridKetetapanAngsuranSkpdkbt	42	dataGridKetetapanAngsuranSkpdkbt	(2),(6)
542	dataGridKetetapanAngsuranSkpdt	42	dataGridKetetapanAngsuranSkpdt	(2),(6)
552	FormAngsuran	42	FormAngsuran	(2),(6)
553	CariJumlahKaliAngsuran	42	CariJumlahKaliAngsuran	(2),(6)
554	HitungRincianAngsuran	42	HitungRincianAngsuran	(2),(6)
555	dataGridKetetapan	42	dataGridKetetapan	(2),(6)
556	pilihKetetapan	42	pilihKetetapan	(2),(6)
557	dataAngsuran	42	dataAngsuran	(2),(6)
558	cetakangsuran	42	cetakangsuran	(2),(6)
559	cetakkodebayar	42	cetakkodebayar	(2),(6)
560	index	45	index	(2),(6)
565	FormPembayaranangsuran	45	FormPembayaranangsuran	(2),(6)
562	dataGridPembayaranAngsuranSudah	45	dataGridPembayaranAngsuranSudah	(2),(6)
561	dataGridPembayaranAngsuranBelum	45	dataGridPembayaranAngsuranBelum	(2),(6)
566	FormPagekekayaandaerah	4	FormPagekekayaandaerah	(2),(3)
567	FormPagekekayaandaerahedit	4	FormPagekekayaandaerahedit	(2),(3)
568	FormPagekebersihan	4	FormPagekebersihan	(2),(3)
569	FormPagekebersihanedit	4	FormPagekebersihanedit	(2),(3)
570	FormPagepasar	4	FormPagepasar	(2),(3)
571	FormPagepasaredit	4	FormPagepasaredit	(2),(3)
572	FormPagepasargrosir	4	FormPagepasargrosir	(2),(3)
573	FormPagepasargrosiredit	4	FormPagepasargrosiredit	(2),(3)
574	FormPagetempatparkir	4	FormPagetempatparkir	(2),(3)
575	FormPagetempatparkiredit	4	FormPagetempatparkiredit	(2),(3)
576	hitungretribusikekayaan	4	hitungretribusikekayaan	(2),(3)
578	hitungretribusikebersihan	4	hitungretribusikebersihan	(2),(3)
577	cariKlasifikasiTarifKebersihan	4	cariKlasifikasiTarifKebersihan	(2),(3)
579	cariKlasifikasiTarifPasar	4	cariKlasifikasiTarifPasar	(2),(3)
580	hitungretribusipasar	4	hitungretribusipasar	(2),(3)
581	cariKlasifikasiTarifPasargrosir	4	cariKlasifikasiTarifPasargrosir	(2),(3)
582	hitungretribusipasargrosir	4	hitungretribusipasargrosir	(2),(3)
583	hitungretribusitempatparkir	4	hitungretribusitempatparkir	(2),(3)
584	nopendaftaran	3	nopendaftaran	(2),(3)
\.


--
-- Data for Name: permission_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_resource (s_iduser, s_idpermission) FROM stdin;
3	81
3	173
3	82
3	84
3	85
3	86
3	87
3	88
3	89
3	91
3	92
3	93
3	94
3	95
3	96
3	97
3	147
3	148
3	149
3	150
3	151
3	152
3	153
3	154
3	155
3	101
3	102
3	103
3	104
3	105
3	107
3	99
3	108
3	109
3	119
3	120
3	121
3	122
3	124
3	125
3	126
3	127
3	128
3	129
3	131
3	132
3	133
3	134
3	135
3	139
3	142
3	143
3	144
3	164
3	156
3	157
3	158
3	159
3	161
3	162
3	163
3	165
3	166
3	169
3	167
3	168
3	170
3	79
3	171
3	182
3	180
3	177
3	184
3	183
3	172
3	178
3	179
3	185
3	175
3	145
3	188
3	191
3	190
3	194
3	192
3	193
3	186
3	245
3	247
3	237
3	239
3	241
3	242
3	243
3	244
3	248
3	246
3	249
3	367
3	370
3	371
3	315
3	314
3	373
3	313
3	381
3	379
3	378
3	369
3	418
3	422
3	420
3	421
3	417
3	416
3	410
3	409
3	408
3	491
3	456
3	455
3	454
3	457
3	490
3	489
3	500
3	83
3	90
3	98
3	505
3	419
3	368
3	507
3	506
3	519
3	517
3	516
3	515
3	514
3	513
3	512
3	511
3	510
3	508
3	504
3	423
3	496
3	501
3	499
3	497
3	495
3	494
3	238
3	520
3	250
3	385
3	100
3	146
3	106
3	518
3	123
3	130
3	140
3	141
3	160
3	492
3	372
3	383
3	502
3	78
3	80
3	357
3	189
3	380
3	503
3	176
3	187
3	181
3	498
3	493
3	382
3	240
3	174
3	524
3	525
3	526
3	528
3	536
3	543
3	544
3	545
3	546
3	547
3	548
3	549
3	550
3	551
3	566
3	567
3	568
3	569
3	570
3	571
3	572
3	573
3	574
3	575
3	576
3	578
3	577
3	579
3	580
3	581
3	582
3	583
3	584
17	81
17	173
17	82
17	84
17	85
17	86
17	87
17	88
17	89
17	91
17	92
17	93
17	94
17	95
17	96
17	97
17	147
17	148
17	149
17	150
17	151
17	152
17	153
17	154
17	155
17	101
17	102
17	103
17	104
17	105
17	107
17	99
17	108
17	109
17	119
17	120
17	121
17	122
17	124
17	125
17	126
17	127
17	128
17	129
17	131
17	132
17	133
17	134
17	135
17	139
17	142
17	143
17	144
17	164
17	156
17	157
17	158
17	159
17	161
17	162
17	163
17	165
17	166
17	169
17	167
17	168
17	170
17	79
17	171
17	182
17	180
17	177
17	184
17	183
17	172
17	178
17	179
17	185
17	175
17	145
17	188
17	191
17	190
17	194
17	192
17	193
17	186
17	245
17	247
17	237
17	239
17	241
17	242
17	243
17	244
17	248
17	246
17	249
17	367
17	370
17	371
17	315
17	314
17	373
17	313
17	381
17	379
17	378
17	369
17	418
17	422
17	420
17	421
17	417
17	416
17	410
17	409
17	408
17	491
17	456
17	455
17	454
17	457
17	490
17	489
17	500
17	83
17	90
17	98
17	505
17	419
17	368
17	507
17	506
17	519
17	517
17	516
17	515
17	514
17	513
17	512
17	511
17	510
17	508
17	504
17	423
17	496
17	501
17	499
17	497
17	495
17	494
17	238
17	520
17	250
17	385
17	100
17	146
17	106
17	518
17	123
17	130
17	140
17	141
17	160
17	492
17	372
17	383
17	502
17	78
17	80
17	357
17	189
17	380
17	503
17	176
17	187
17	181
17	498
17	493
17	382
17	240
17	174
17	524
17	525
17	526
17	528
17	536
17	543
17	544
17	545
17	546
17	547
17	548
17	549
17	550
17	551
17	566
17	567
17	568
17	569
17	570
17	571
17	572
17	573
17	574
17	575
17	576
17	578
17	577
17	579
17	580
17	581
17	582
17	583
17	584
1	81
1	173
1	82
1	84
1	85
1	86
1	87
1	88
1	89
1	91
1	92
1	93
1	94
1	95
1	96
1	97
1	147
1	148
1	149
1	150
1	151
1	152
1	153
1	154
1	155
1	101
1	102
1	103
1	104
1	105
1	107
1	99
1	108
1	109
1	119
1	120
1	121
1	122
1	124
1	125
1	126
1	127
1	128
1	129
1	131
1	132
1	133
1	134
1	135
1	139
1	142
1	143
1	144
1	164
1	156
1	157
1	158
1	159
1	161
1	162
1	163
1	165
1	166
1	169
1	167
1	168
1	170
1	79
1	171
1	182
1	180
1	177
1	184
1	183
1	172
1	178
1	179
1	185
1	175
1	145
1	188
1	191
1	190
1	194
1	192
1	193
1	186
1	245
1	247
1	237
1	239
1	241
1	242
1	243
1	244
1	248
1	246
1	249
1	367
1	370
1	371
1	315
1	314
1	373
1	313
1	381
1	379
1	378
1	369
1	418
1	422
1	420
1	421
1	417
1	416
1	410
1	409
1	408
1	491
1	456
1	455
1	454
1	457
1	490
1	489
1	500
1	83
1	90
1	98
1	505
1	419
1	368
1	507
1	506
1	519
1	517
1	516
1	515
1	514
1	513
1	512
1	511
1	510
1	508
1	504
1	423
1	496
1	501
1	499
1	497
1	495
1	494
1	238
1	520
1	250
1	385
1	100
1	146
1	106
1	518
1	123
1	130
1	140
1	141
1	160
1	492
1	372
1	383
1	502
1	78
1	80
1	357
1	189
1	380
1	503
1	176
1	187
1	181
1	498
1	493
1	382
1	240
1	174
1	524
1	525
1	526
1	528
1	536
1	543
1	544
1	545
1	546
1	547
1	548
1	549
1	550
1	551
1	566
1	567
1	568
1	569
1	570
1	571
1	572
1	573
1	574
1	575
1	576
1	578
1	577
1	579
1	580
1	581
1	582
1	583
1	584
37	81
37	173
37	82
37	84
37	85
37	86
37	87
37	88
37	89
37	91
37	92
37	93
37	94
37	95
37	96
37	97
37	147
37	148
37	149
37	150
37	151
37	152
37	153
37	154
37	155
37	101
37	102
37	103
37	104
37	105
37	107
37	99
37	108
37	109
37	119
37	120
37	121
37	122
37	124
37	125
37	126
37	127
37	128
37	129
37	131
37	132
37	133
37	134
37	135
37	139
37	142
37	143
37	144
37	164
37	156
37	157
37	158
37	159
37	161
37	162
37	163
37	165
37	166
37	169
37	167
37	168
37	170
37	79
37	171
37	182
37	180
37	177
37	184
37	183
37	172
37	178
37	179
37	185
37	175
37	145
37	188
37	191
37	190
37	194
37	192
37	193
37	186
37	245
37	247
37	237
37	239
37	241
37	242
37	243
37	244
37	248
37	246
37	249
37	367
37	370
37	371
37	315
37	314
37	373
37	313
37	381
37	379
37	378
37	369
37	418
37	422
37	420
37	421
37	417
37	416
37	410
37	409
37	408
37	491
37	456
37	455
37	454
37	457
37	490
37	489
37	500
37	83
37	90
37	98
37	505
37	419
37	368
37	507
37	506
37	519
37	517
37	516
37	515
37	514
37	513
37	512
37	511
37	510
37	508
37	504
37	423
37	496
37	501
37	499
37	497
37	495
37	494
37	238
37	520
37	250
37	385
37	100
37	146
37	106
37	518
37	123
37	130
37	140
37	141
37	160
37	492
37	372
37	383
37	502
37	78
37	80
37	357
37	189
37	380
37	503
37	176
37	187
37	181
37	498
37	493
37	382
37	240
37	174
37	524
37	525
37	526
37	528
37	536
37	543
37	544
37	545
37	546
37	547
37	548
37	549
37	550
37	551
37	566
37	567
37	568
37	569
37	570
37	571
37	572
37	573
37	574
37	575
37	576
37	578
37	577
37	579
37	580
37	581
37	582
37	583
37	584
13	81
13	79
13	196
13	195
13	197
13	198
13	200
13	201
13	202
13	203
13	210
13	211
13	213
13	204
13	212
13	207
13	206
13	208
13	209
13	219
13	221
13	220
13	218
13	216
13	215
13	214
13	245
13	247
13	237
13	239
13	241
13	242
13	243
13	244
13	248
13	246
13	249
13	309
13	391
13	381
13	379
13	378
13	307
13	305
13	304
13	310
13	311
13	308
13	306
13	407
13	406
13	392
13	404
13	403
13	402
13	401
13	400
13	399
13	398
13	396
13	395
13	394
13	393
13	428
13	452
13	453
13	456
13	455
13	454
13	427
13	457
13	449
13	448
13	451
13	450
23	81
23	173
23	82
23	84
23	85
23	86
23	87
23	88
23	89
23	91
23	92
23	93
23	94
23	95
23	96
23	97
23	147
23	148
23	149
23	150
23	151
23	152
23	153
23	154
23	155
23	101
23	102
23	103
23	104
23	105
23	107
23	99
23	108
23	109
23	119
23	120
23	121
23	122
23	124
23	125
23	126
23	127
23	128
23	129
23	131
23	132
23	133
23	134
23	135
23	139
23	142
23	143
23	144
23	164
23	156
23	157
23	158
23	159
23	161
23	162
23	163
23	165
23	166
23	169
23	167
23	168
23	170
23	79
23	171
23	182
23	180
23	177
23	184
23	183
23	172
23	178
23	179
23	185
23	175
23	145
23	188
23	191
23	190
23	230
23	194
23	192
23	193
23	196
23	195
23	197
23	198
23	200
23	201
23	202
23	203
23	210
23	211
23	213
23	204
23	212
23	207
23	206
23	208
23	209
23	219
23	221
23	220
23	218
23	216
23	215
23	214
23	223
23	224
23	226
23	227
23	222
23	229
23	228
23	281
23	233
23	282
23	235
23	186
23	245
23	247
23	237
23	239
23	241
23	242
23	243
23	244
23	248
23	278
23	280
23	246
23	249
23	236
23	251
23	252
23	256
23	255
23	253
23	258
23	257
23	259
23	264
23	263
23	262
23	261
23	260
23	267
23	268
23	269
23	270
23	266
23	271
23	276
23	272
23	274
23	275
23	277
23	288
23	279
23	287
23	284
23	285
23	286
23	232
23	367
23	370
23	371
23	309
23	315
23	319
23	314
23	373
23	391
23	293
23	376
23	313
23	381
23	379
23	378
23	377
23	374
23	292
23	307
23	305
23	304
23	384
23	310
23	311
23	308
23	306
23	388
23	387
23	386
23	291
23	323
23	320
23	294
23	298
23	295
23	296
23	297
23	299
23	300
23	301
23	302
23	303
23	322
23	316
23	317
23	318
23	375
23	334
23	332
23	358
23	331
23	341
23	340
23	339
23	338
23	337
23	336
23	335
23	330
23	329
23	328
23	326
23	325
23	324
23	364
23	363
23	362
23	361
23	360
23	359
23	390
23	343
23	342
23	389
23	347
23	346
23	345
23	350
23	349
23	348
23	355
23	354
23	366
23	365
23	356
23	352
23	351
23	369
23	418
23	422
23	420
23	421
23	417
23	416
23	410
23	409
23	408
23	491
23	407
23	406
23	392
23	404
23	403
23	402
23	401
23	400
23	399
23	398
23	396
23	395
23	394
23	393
23	428
23	452
23	453
23	431
23	429
23	456
23	455
23	454
23	427
23	457
23	449
23	488
23	458
23	459
23	460
23	461
23	462
23	463
23	464
23	466
23	467
23	468
23	469
23	470
23	471
23	472
23	473
23	474
23	475
23	476
23	477
23	478
23	479
23	480
23	481
23	482
23	483
23	484
23	485
23	486
23	448
23	451
23	450
23	447
23	424
23	425
23	490
23	433
23	432
23	437
23	436
23	435
23	440
23	438
23	439
23	443
23	441
23	444
23	445
23	446
23	489
23	500
23	83
23	90
23	98
23	505
23	419
23	368
23	507
23	506
23	519
23	517
23	516
23	515
23	514
23	513
23	512
23	511
23	510
23	508
23	504
23	423
23	539
23	397
23	199
23	205
23	217
23	225
23	430
23	496
23	501
23	499
23	497
23	495
23	494
23	238
23	520
23	250
23	385
23	290
23	100
23	254
23	265
23	273
23	465
23	487
23	333
23	327
23	344
23	353
23	434
23	442
23	283
23	146
23	106
23	518
23	123
23	130
23	140
23	141
23	160
23	492
23	372
23	312
23	383
23	502
23	78
23	80
23	357
23	189
23	380
23	503
23	176
23	187
23	181
23	321
23	405
23	231
23	426
23	498
23	493
23	382
23	240
23	174
23	234
23	289
23	524
23	525
23	526
23	527
23	530
23	528
23	529
23	531
23	532
23	533
23	534
23	535
23	536
23	537
23	543
23	544
23	545
23	546
23	547
23	548
23	549
23	550
23	551
23	538
23	540
23	541
23	542
23	552
23	553
23	554
23	555
23	556
23	557
23	558
23	559
23	560
23	565
23	562
23	561
23	566
23	567
23	568
23	569
23	570
23	571
23	572
23	573
23	574
23	575
23	576
23	578
23	577
23	579
23	580
23	581
23	582
23	583
23	584
5	81
5	173
5	82
5	84
5	85
5	86
5	87
5	88
5	89
5	91
5	92
5	93
5	94
5	95
5	96
5	97
5	147
5	148
5	149
5	150
5	151
5	152
5	153
5	154
5	155
5	101
5	102
5	103
5	104
5	105
5	107
5	99
5	108
5	109
5	119
5	120
5	121
5	122
5	124
5	125
5	126
5	127
5	128
5	129
5	131
5	132
5	133
5	134
5	135
5	139
5	142
5	143
5	144
5	164
5	156
5	157
5	158
5	159
5	161
5	162
5	163
5	165
5	166
5	169
5	167
5	168
5	170
5	79
5	171
5	182
5	180
5	177
5	184
5	183
5	172
5	178
5	179
5	185
5	175
5	145
5	188
5	191
5	190
5	230
5	194
5	192
5	193
5	196
5	195
5	197
5	198
5	200
5	201
5	202
5	203
5	210
5	211
5	213
5	204
5	212
5	207
5	206
5	208
5	209
5	219
5	221
5	220
5	218
5	216
5	215
5	214
5	223
5	224
5	226
5	227
5	222
5	229
5	228
5	281
5	233
5	282
5	235
5	186
5	245
5	247
5	237
5	239
5	241
5	242
5	243
5	244
5	248
5	278
5	280
5	246
5	249
5	236
5	251
5	252
5	256
5	255
5	253
5	258
5	257
5	259
5	264
13	447
13	424
13	425
13	490
13	500
13	539
13	397
13	199
13	205
13	217
13	496
13	501
13	499
13	497
13	495
13	494
13	238
13	520
13	250
13	385
13	312
13	383
13	502
13	78
13	80
13	357
13	380
13	503
13	405
13	426
13	498
13	493
13	382
13	240
13	526
13	528
13	536
13	537
13	538
13	540
13	541
13	542
13	552
13	553
13	554
13	555
13	556
13	557
13	558
13	559
13	560
13	565
13	562
13	561
5	263
5	262
5	261
5	260
5	267
5	268
5	269
5	270
5	266
5	271
5	276
5	272
5	274
5	275
5	277
5	288
5	279
5	287
5	284
5	285
5	286
5	232
5	367
5	370
5	371
5	309
5	315
5	319
5	314
5	373
5	391
5	293
5	376
5	313
5	381
5	379
5	378
5	377
5	374
5	292
5	307
5	305
5	304
5	384
5	310
5	311
5	308
5	306
5	388
5	387
5	386
5	291
5	323
5	320
5	294
5	298
5	295
5	296
5	297
5	299
5	300
5	301
5	302
5	303
5	322
5	316
5	317
5	318
5	375
5	334
5	332
5	358
5	331
5	341
5	340
5	339
5	338
5	337
5	336
5	335
5	330
5	329
5	328
5	326
5	325
5	324
5	364
5	363
5	362
5	361
5	360
5	359
5	390
5	343
5	342
5	389
5	347
5	346
5	345
5	350
5	349
5	348
5	355
5	354
5	366
5	365
5	356
5	352
5	351
5	369
5	418
5	422
5	420
5	421
5	417
5	416
5	410
5	409
5	408
5	491
5	407
5	406
5	392
5	404
5	403
5	402
5	401
5	400
5	399
5	398
5	396
5	395
5	394
5	393
5	428
5	452
5	453
5	431
5	429
5	456
5	455
5	454
5	427
5	457
5	449
5	488
5	458
5	459
5	460
5	461
5	462
5	463
5	464
5	466
5	467
5	468
5	469
5	470
5	471
5	472
5	473
5	474
5	475
5	476
5	477
5	478
5	479
5	480
5	481
5	482
5	483
5	484
5	485
5	486
5	448
5	451
5	450
5	447
5	424
5	425
5	490
5	433
5	432
5	437
5	436
5	435
5	440
5	438
5	439
5	443
5	441
5	444
5	445
5	446
5	489
5	500
5	83
5	90
5	98
5	505
5	419
5	368
5	507
5	506
5	519
5	517
5	516
5	515
5	514
5	513
5	512
5	511
5	510
5	508
5	504
5	423
5	539
5	397
5	199
5	205
5	217
5	225
5	430
5	496
5	501
5	499
5	497
5	495
5	494
5	238
5	520
5	250
5	385
5	290
5	100
5	254
5	265
5	273
5	465
5	487
5	333
5	327
5	344
5	353
5	434
5	442
5	283
5	146
5	106
5	518
5	123
5	130
5	140
5	141
5	160
5	492
5	372
5	312
5	383
5	502
5	78
5	80
5	357
5	189
5	380
5	503
5	176
5	187
5	181
5	321
5	405
5	231
5	426
5	498
5	493
5	382
5	240
5	174
5	234
5	289
5	524
5	525
5	526
5	527
5	530
5	528
5	529
5	531
5	532
5	533
5	534
5	535
5	536
5	537
5	543
5	544
5	545
5	546
5	547
5	548
5	549
5	550
5	551
5	538
5	540
5	541
5	542
5	552
5	553
5	554
5	555
5	556
5	557
5	558
5	559
5	560
5	565
5	562
5	561
5	566
5	567
5	568
5	569
5	570
5	571
5	572
5	573
5	574
5	575
5	576
5	578
5	577
5	579
5	580
5	581
5	582
5	583
5	584
39	81
39	79
39	196
39	195
39	197
39	198
39	200
39	201
39	202
39	203
39	210
39	211
39	213
39	204
39	212
39	207
39	206
39	208
39	209
39	219
39	221
39	220
39	218
39	216
39	215
39	214
39	245
39	247
39	237
39	239
39	241
39	242
39	243
39	244
39	248
39	246
39	249
39	309
39	391
39	381
39	379
39	378
39	307
39	305
39	304
39	310
39	311
39	308
39	306
39	407
39	406
39	392
39	404
39	403
39	402
39	401
39	400
39	399
39	398
39	396
39	395
39	394
39	393
39	428
39	452
39	453
39	456
39	455
39	454
39	427
39	457
39	449
39	448
39	451
39	450
39	447
39	424
39	425
39	490
39	500
39	539
39	397
39	199
39	205
39	217
39	496
39	501
39	499
39	497
39	495
39	494
39	238
39	520
39	250
39	385
39	312
39	383
39	502
39	78
39	80
39	357
39	380
39	503
39	405
39	426
39	498
39	493
39	382
39	240
39	526
39	528
39	536
39	537
39	538
39	540
39	541
39	542
39	552
39	553
39	554
39	555
39	556
39	557
39	558
39	559
39	560
39	565
39	562
39	561
38	81
38	173
38	82
38	84
38	85
38	86
38	87
38	88
38	89
38	91
38	92
38	93
38	94
38	95
38	96
38	97
38	147
38	148
38	149
38	150
38	151
38	152
38	153
38	154
38	155
38	101
38	102
38	103
38	104
38	105
38	107
38	99
38	108
38	109
38	119
38	120
38	121
38	122
38	124
38	125
38	126
38	127
38	128
38	129
38	131
38	132
38	133
38	134
38	135
38	139
38	142
38	143
38	144
38	164
38	156
38	157
38	158
38	159
38	161
38	162
38	163
38	165
38	166
38	169
38	167
38	168
38	170
38	79
38	171
38	182
38	180
38	177
38	184
38	183
38	172
38	178
38	179
38	185
38	175
38	145
38	188
38	191
38	190
38	194
38	192
38	193
38	186
38	245
38	247
38	237
38	239
38	241
38	242
38	243
38	244
38	248
38	246
38	249
38	367
38	370
38	371
38	315
38	314
38	373
38	313
38	381
38	379
38	378
38	369
38	418
38	422
38	420
38	421
38	417
38	416
38	410
38	409
38	408
38	491
38	456
38	455
38	454
38	457
38	490
38	489
38	500
38	83
38	90
38	98
38	505
38	419
38	368
38	507
38	506
38	519
38	517
38	516
38	515
38	514
38	513
38	512
38	511
38	510
38	508
38	504
38	423
38	496
38	501
38	499
38	497
38	495
38	494
38	238
38	520
38	250
38	385
38	100
38	146
38	106
38	518
38	123
38	130
38	140
38	141
38	160
38	492
38	372
38	383
38	502
38	78
38	80
38	357
38	189
38	380
38	503
38	176
38	187
38	181
38	498
38	493
38	382
38	240
38	174
38	524
38	525
38	526
38	528
38	536
38	543
38	544
38	545
38	546
38	547
38	548
38	549
38	550
38	551
38	566
38	567
38	568
38	569
38	570
38	571
38	572
38	573
38	574
38	575
38	576
38	578
38	577
38	579
38	580
38	581
38	582
38	583
38	584
4	81
4	173
4	82
4	84
4	85
4	86
4	87
4	88
4	89
4	91
4	92
4	93
4	94
4	95
4	96
4	97
4	147
4	148
4	149
4	150
4	151
4	152
4	153
4	154
4	155
4	101
4	102
4	103
4	104
4	105
4	107
4	99
4	108
4	109
4	119
4	120
4	121
4	122
4	124
4	125
4	126
4	127
4	128
4	129
4	131
4	132
4	133
4	134
4	135
4	139
4	142
4	143
4	144
4	164
4	156
4	157
4	158
4	159
4	161
4	162
4	163
4	165
4	166
4	169
4	167
4	168
4	170
4	79
4	171
4	182
4	180
4	177
4	184
4	183
4	172
4	178
4	179
4	185
4	175
4	145
4	188
4	191
4	190
4	230
4	194
4	192
4	193
4	196
4	195
4	197
4	198
4	200
4	201
4	202
4	203
4	210
4	211
4	213
4	204
4	212
4	207
4	206
4	208
4	209
4	219
4	221
4	220
4	218
4	216
4	215
4	214
4	223
4	224
4	226
4	227
4	222
4	229
4	228
4	281
4	233
4	282
4	235
4	186
4	245
4	247
4	237
4	239
4	241
4	242
4	243
4	244
4	248
4	278
4	280
4	246
4	249
4	236
4	251
4	252
4	256
4	255
4	253
4	258
4	257
4	259
4	264
4	263
4	262
4	261
4	260
4	267
4	268
4	269
4	270
4	266
4	271
4	276
4	272
4	274
4	275
4	277
4	288
4	279
4	287
4	284
4	285
4	286
4	232
4	367
4	370
4	371
4	309
4	315
4	319
4	314
4	373
4	391
4	293
4	376
4	313
4	381
4	379
4	378
4	377
4	374
4	292
4	307
4	305
4	304
4	384
4	310
4	311
4	308
4	306
4	388
4	387
4	386
4	291
4	323
4	320
4	294
4	298
4	295
4	296
4	297
4	299
4	300
4	301
4	302
4	303
4	322
4	316
4	317
4	318
4	375
4	334
4	332
4	358
4	331
4	341
4	340
4	339
4	338
4	337
4	336
4	335
4	330
4	329
4	328
4	326
4	325
4	324
4	364
4	363
4	362
4	361
4	360
4	359
4	390
4	343
4	342
4	389
4	347
4	346
4	345
4	350
4	349
4	348
4	355
4	354
4	366
4	365
4	356
4	352
4	351
4	369
4	418
4	422
4	420
4	421
4	417
4	416
4	410
4	409
4	408
4	491
4	407
4	406
4	392
4	404
4	403
4	402
4	401
4	400
4	399
4	398
4	396
4	395
4	394
4	393
4	428
4	452
4	453
4	431
4	429
4	456
4	455
4	454
4	427
4	457
4	449
4	488
4	458
4	459
4	460
4	461
4	462
4	463
4	464
4	466
4	467
4	468
4	469
4	470
4	471
4	472
4	473
4	474
4	475
4	476
4	477
4	478
4	479
4	480
4	481
4	482
4	483
4	484
4	485
4	486
4	448
4	451
4	450
4	447
4	424
4	425
4	490
4	433
4	432
4	437
4	436
4	435
4	440
4	438
4	439
4	443
4	441
4	444
4	445
4	446
4	489
4	500
4	83
4	90
4	98
4	505
4	419
4	368
4	507
4	506
4	519
4	517
4	516
4	515
4	514
4	513
4	512
4	511
4	510
4	508
4	504
4	423
4	539
4	397
4	199
4	205
4	217
4	225
4	430
4	496
4	501
4	499
4	497
4	495
4	494
4	238
4	520
4	250
4	385
4	290
4	100
4	254
4	265
4	273
4	465
4	487
4	333
4	327
4	344
4	353
4	434
4	442
4	283
4	146
4	106
4	518
4	123
4	130
4	140
4	141
4	160
4	492
4	372
4	312
4	383
4	502
4	78
4	80
4	357
4	189
4	380
4	503
4	176
4	187
4	181
4	321
4	405
4	231
4	426
4	498
4	493
4	382
4	240
4	174
4	234
4	289
4	524
4	525
4	526
4	527
4	530
4	528
4	529
4	531
4	532
4	533
4	534
4	535
4	536
4	537
4	543
4	544
4	545
4	546
4	547
4	548
4	549
4	550
4	551
4	538
4	540
4	541
4	542
4	552
4	553
4	554
4	555
4	556
4	557
4	558
4	559
4	560
4	565
4	562
4	561
4	566
4	567
4	568
4	569
4	570
4	571
4	572
4	573
4	574
4	575
4	576
4	578
4	577
4	579
4	580
4	581
4	582
4	583
4	584
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource (id, resource_name) FROM stdin;
1	LoginAccess
2	MainController
3	Pendaftaran
4	Pendataan
5	Penetapan
6	Skpdjabatan
7	Skpdkb
8	Skpdkbt
9	Skpdlb
10	Skpdn
11	Pembayaran
12	Pembayarandenda
13	Rekambank
14	Penagihan
15	Pemeriksaan
16	Pembukuan
17	Stpdpembayaran
19	Monitoring
20	SettingPemda
21	SettingUser
22	SettingKelurahan
23	SettingPejabat
24	SettingKecamatan
25	SettingRekening
26	SettingTarget
27	SettingReklame
28	SettingAir
29	Skpdt
30	Laporan
31	Perizinan
32	Pratama
33	Laporanbendahara
34	Setoranlain
35	SettingReklameSticker
36	SettingReklameSelebaran
37	SettingReklameBerjalan
38	SettingReklameBiayapemasangan
39	SettingReklameKelompokjalan
40	SettingReklameSkorukuran
41	SettingReklameSudutpandang
42	Angsuran
43	Teguranlaporan
44	Pembatalan
45	pembayaranangsuran
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (rid, role_name, status) FROM stdin;
2	Admin	Active                                                                                                                                                                                                                                                         
3	Pendaftaran & Pendataan	Active                                                                                                                                                                                                                                                         
4	Penetapan	Active                                                                                                                                                                                                                                                         
5	Penagihan	Active                                                                                                                                                                                                                                                         
6	Bendahara Penerima	Active                                                                                                                                                                                                                                                         
7	Pemeriksaan	Active                                                                                                                                                                                                                                                         
10	Pembukuan & Pelaporan	Active                                                                                                                                                                                                                                                         
8	Operator	Active                                                                                                                                                                                                                                                         
11	Perizinan	Active                                                                                                                                                                                                                                                         
12	Kontrol	Active                                                                                                                                                                                                                                                         
\.


--
-- Data for Name: s_air; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_air (s_idair, s_idperuntukan, s_volume1, s_volume2, s_volume3, s_volume5, s_volume4) FROM stdin;
1	1	1	1.1	1.2	1.4	1.3
2	2	2	2.2	2.4	2.8	2.6
3	3	4	4.4	4.8	5.6	5.2
4	4	3	3.3	3.6	4.5	3.9
5	5	5	5.5	6	7	6.5
\.


--
-- Data for Name: s_airjenis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_airjenis (s_idjenisair, s_bobot, s_keterangan) FROM stdin;
\.


--
-- Data for Name: s_airperuntukan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_airperuntukan (s_idperuntukan, s_namaperuntukan) FROM stdin;
1	Non Niaga
2	Niaga Kecil
3	Niaga Besar
4	Industri Kecil
5	Industri Besar
\.


--
-- Data for Name: s_cekungan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_cekungan (s_idcekungan, s_kriteria, s_nilai) FROM stdin;
1	Daerah Imbuhan	10
2	Daerah Transisi	5
3	Daerah Lepasan	1
\.


--
-- Data for Name: s_faktorkerusakan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_faktorkerusakan (s_idkerusakan, s_kriteria, s_nilai) FROM stdin;
2	Tinggi	10
1	Sedang	5
\.


--
-- Data for Name: s_faktorkualitasair; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_faktorkualitasair (s_idfaktorkualitas, s_namafaktorkualitas, s_nilai) FROM stdin;
4	Kelas Empat || DHL <750 || Total Coliform <1.000	1
3	Kelas Tiga || DHL >1.000-2.000 || Total Coliform > 5.000-10.000	4
2	Kelas Dua || DHL >750-1.000 || Total Coliform <1.000	7
1	Kelas Satu || DHL <750 || Total Coliform <1.000	10
\.


--
-- Data for Name: s_faktorluasarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_faktorluasarea (s_idfaktorluasarea, s_areapengaruh, s_nilai) FROM stdin;
2	>50-100 meter	2
3	>100-150 meter	5
4	>150-200 meter	7
5	>200 meter	10
1	<=50 meter	1
\.


--
-- Data for Name: s_faktorsumberair; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_faktorsumberair (s_idsumberair, s_jenissumber, s_nilai) FROM stdin;
1	Sumur Gali (0-30 meter)	10
2	Sumur Bor (>30-60 meter)	7
3	Sumur Bor (>60-85 meter)	4
4	Sumur Bor (>85-100 meter)	2
5	Sumur Bor (>100 meter)	1
\.


--
-- Data for Name: s_hargaairbaku; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_hargaairbaku (s_idhargaairbaku, s_idjaringan, s_harga) FROM stdin;
1	1	150
2	2	300
\.


--
-- Data for Name: s_hargasatuanlistrik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_hargasatuanlistrik (s_idhargasatuanlistrik, s_namasatuanlistrik, s_hargasatuanlistrik) FROM stdin;
4	Keperluan Industri > 200 kVa	1115
5	Keperluan Industri > 30000 kVA	1191
3	Keperluan Industri ≤ 200 kVA	972
2	Keperluan Bisnis ≥ 200 KVA	1020
1	Keperluan Bisnis ≤ 200kVA	1352
\.


--
-- Data for Name: s_ho_gangguan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_ho_gangguan (s_idgangguan, s_namagangguan, s_indeks) FROM stdin;
\.


--
-- Data for Name: s_ho_lokasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_ho_lokasi (s_idlokasi, s_namalokasi, s_indeks) FROM stdin;
\.


--
-- Data for Name: s_ho_luas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_ho_luas (s_idluas, s_luasawal, s_luasakhir, s_indeks) FROM stdin;
\.


--
-- Data for Name: s_ho_skala; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_ho_skala (s_idskala, s_namaskala, s_tarif, s_satuan) FROM stdin;
\.


--
-- Data for Name: s_imb_gunabgn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_imb_gunabgn (s_idgunabgn, s_namagunabgn, s_koefisien) FROM stdin;
1	Bangunan Sosial	0.5
2	Bangunan Perumahan pendidikan/fasilitas umum	1
3	Bangunan Kelembagaan/kantor	1.5
4	Bangunan Perdagangan dan jasa lantai 1 s/d 2	2.5
5	Bangunan Perdagangan dan jasa lantai 3 s/d 4	2
6	Bangunan Perdagangan dan jasa lantai > 4 lantai	1.5
7	Bangunan Industri / bangunan campuran	2.75
8	Bangunan Khusus / lain-lain	3
\.


--
-- Data for Name: s_imb_kondisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_imb_kondisi (s_idkondisi, s_namakondisi, s_koefisien) FROM stdin;
1	Bangunan Permanen	1
2	Bangunan semi permanen (max 15 tahun)	0.9
3	Bangunan tidak permanen (umur max 5 tahun)	0.4
4	Bangunan darurat (umur max 1 tahun)	0.1
\.


--
-- Data for Name: s_imb_lantai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_imb_lantai (s_idlantai, s_namalantai, s_koefisien) FROM stdin;
1	Satu Lantai	1
2	Dua Lantai	1.5
3	Tiga Lantai	2
4	Tower	9.6
\.


--
-- Data for Name: s_imb_lokasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_imb_lokasi (s_idlokasi, s_namalokasi, s_koefisien) FROM stdin;
1	Dipinggir Jalan Arteri	1.5
2	Langsung Berada dibelakang jalan Arteri	1.4
3	Dipinggir jalan kolektor	1.3
4	Langsung Berada dibelakang jalan kolektor	1.25
5	Bangunan dipinggir jalan lokal bangunan yang langsung berada di belakang	1.2
6	Jalan Lokal	1.1
7	Jalan setapak	0.5
\.


--
-- Data for Name: s_imb_luas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_imb_luas (s_idluas, s_namaluas, s_koefisien) FROM stdin;
1	Bangunan tertutup dengan atap / dindingan	1
2	Bangunan tetutup atap dinding	0.7
3	Bangunan teras / rabat	0.5
4	Bangunan jembatan	1
5	Bangunan Plat beton terbuka	0.75
9	Bangunan Kolam Khusus (kolam buaya dll)	1.25
8	Bangunan Gudang	1.2
7	Bangunan Kolam biasa tanpa lantai konstruksi	0.1
6	Bangunan Kolam berlantai konstruksi/beton	0.75
10	Bangunan Menara / Tower / Siklop	2
11	Bangunan Pelindung Binatang Liar / buas	1.2
12	Bangunan yang as dindingnya berdiri diatas saaerh batas 1 (satu) meter dari batas tanah	2
13	Bangunan Utama yang melampaui luas berdasarkan kepadatan bangunan 70%	1.75
\.


--
-- Data for Name: s_imb_tarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_imb_tarif (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
\.


--
-- Data for Name: s_jaringanpdam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_jaringanpdam (s_idjaringan, s_namajaringan, s_nilai) FROM stdin;
2	Tidak tersedia Jaringan PDAM	1
1	Tersedia Jaringan PDAM	10
\.


--
-- Data for Name: s_jenisobjek; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_jenisobjek (s_idjenis, s_namajenis, s_namajenissingkat, t_akhirlapor, t_akhirbayar, t_jmlharitempo, s_jenispungutan) FROM stdin;
4	Pajak Reklame	Pajak Reklame			30	Pajak
8	Pajak Air Tanah	Pajak Air Tanah			30	Pajak
10	Pajak Bumi dan Bangunan Perdesaan\ndan Perkotaan	PBB-P2			\N	Pajak
11	Bea Perolehan Hak Atas Tanah dan\nBangunan	BPHTB			\N	Pajak
12	Retribusi Pelayanan Kesehatan	Ret. Pelayanan Kesehatan			30	Retribusi
13	Retribusi Pelayanan Persampahan/Kebersihan	Ret. Pelayanan Kebersihan			30	Retribusi
14	Retribusi Penggantian Biaya Cetak Kartu Tanda Penduduk dan Akta Catatan Sipil	Ret. CAPIL			30	Retribusi
15	Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	Ret. Pemakaman			30	Retribusi
16	Retribusi Pelayanan Parkir di Tepi Jalan Umum	Ret. Parkir Tepi Jalan			30	Retribusi
17	Retribusi Pelayanan Pasar	Ret. Pelayanan Pasar			30	Retribusi
18	Retribusi Pengujian Kendaraan Bermotor	Ret. Kendaraan Bermotor			30	Retribusi
19	Retribusi Pemeriksaan Alat Pemadam Kebakaran	Ret. Pemadam Kebakaran			30	Retribusi
20	Retribusi Penggantian Biaya Cetak Peta	Ret. Cetak Peta			30	Retribusi
21	Retribusi Penyediaan dan/atau Penyedotan Kakus	Ret. Penyedotan Kakus			30	Retribusi
22	Retribusi Pengolahan Limbah Cair	Ret. Limbah Cair			30	Retribusi
23	Retribusi Pelayanan Tera/Tera Ulang	Ret. Tera Ulang			30	Retribusi
24	Retribusi Pelayanan Pendidikan	Ret. Pelayanan Pendidikan			30	Retribusi
25	Retribusi Pengendalian Menara Telekomunikasi	Ret. Menara Telekomunikasi			30	Retribusi
26	Retribusi Pemakaian Kekayaan Daerah	Ret. Kekayaan Daerah			30	Retribusi
27	Retribusi Pasar Grosir dan/atau Pertokoan	Ret. Pasar Grosir			30	Retribusi
28	Retribusi Tempat Pelelangan	Ret. Tempat Pelelangan			30	Retribusi
29	Retribusi Terminal	Ret. Terminal			30	Retribusi
30	Retribusi Tempat Khusus Parkir	Ret. Tempat Khusus Parkir			30	Retribusi
31	Retribusi Tempat Penginapan/Pesanggrahan/Villa	Ret. Pesanggrahan Villa			30	Retribusi
32	Retribusi Rumah Potong Hewan	Ret. Potong Hewan			30	Retribusi
33	Retribusi Pelayanan Kepelabuhanan	Ret. Kepelabuhanan			30	Retribusi
34	Retribusi Tempat Rekreasi dan Olahraga	Ret. Rekreasi dan Olahraga			30	Retribusi
35	Retribusi Penyeberangan di Air	Ret. Penyeberangan di Air			30	Retribusi
36	Retribusi Penjualan Produksi Usaha Daerah	Ret. Usaha Daerah			30	Retribusi
37	Retribusi Izin Mendirikan Bangunan	Ret. IMB			30	Retribusi
38	Retribusi Izin Tempat Penjualan Minuman Beralkohol	Ret. Izin Minuman Beralkohol			30	Retribusi
39	Retribusi Izin Gangguan	Ret. Izin Gangguan			30	Retribusi
40	Retribusi Izin Trayek	Ret. Izin Trayek			30	Retribusi
41	Retribusi Izin Usaha Perikanan	Ret. Izin Usaha Perikanan			30	Retribusi
42	Retribusi Pengendalian Lalu Lintas	Retribusi Pengendalian Lalu Lintas			30	Retribusi
43	Retribusi Perpanjangan Izin Mempekerjakan Tenaga Kerja Asing (IMTA)	Retribusi Perpanjangan Izin Mempekerjakan Tenaga Kerja Asing (IMTA)			30	Retribusi
44	Deviden yang Dibagikan kepada Pemda atas Penyertaan Modal pada BUMN	Deviden yang Dibagikan kepada Pemda atas Penyertaan Modal pada BUMN			30	
45	Deviden yang Dibagikan kepada Pemda atas Penyertaan Modal pada BUMD	Deviden yang Dibagikan kepada Pemda atas Penyertaan Modal pada BUMD			30	
46	Hasil Penjualan BMD yang Tidak Dipisahkan	Hasil Penjualan BMD yang Tidak Dipisahkan			30	
47	Hasil Selisih Lebih Tukar Menukar BMD yang Tidak Dipisahkan	Hasil Selisih Lebih Tukar Menukar BMD yang Tidak Dipisahkan			30	
48	Hasil Pemanfaatan BMD yang Tidak Dipisahkan	Hasil Pemanfaatan BMD yang Tidak Dipisahkan			30	
49	Hasil Kerja Sama Daerah	Hasil Kerja Sama Daerah			30	
50	Jasa Giro	Jasa Giro			30	
51	Hasil Pengelolaan Dana Bergulir	Hasil Pengelolaan Dana Bergulir			30	
52	Pendapatan Bunga	Pendapatan Bunga			30	
53	Penerimaan atas Tuntutan Ganti Kerugian Keuangan Daerah	Penerimaan atas Tuntutan Ganti Kerugian Keuangan Daerah			30	
54	Penerimaan Komisi, Potongan, atau Bentuk Lain	Penerimaan Komisi, Potongan, atau Bentuk Lain			30	
55	Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing	Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing			30	
56	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan			30	
57	Pendapatan Denda Pajak Daerah	Pendapatan Denda Pajak Daerah			30	
58	Pendapatan Denda Retribusi Daerah	Pendapatan Denda Retribusi Daerah			30	
59	Pendapatan Hasil Eksekusi atas Jaminan	Pendapatan Hasil Eksekusi atas Jaminan			30	
60	Pendapatan dari Pengembalian	Pendapatan dari Pengembalian			30	
61	Pendapatan BLUD	Pendapatan BLUD			30	
62	Pendapatan Denda Pemanfaatan BMD yang tidak Dipisahkan	Pendapatan Denda Pemanfaatan BMD yang tidak Dipisahkan			30	
63	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional pada FKTP	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional pada FKTP			30	
64	Pendapatan Hasil Pengelolaan Dana Bergulir	Pendapatan Hasil Pengelolaan Dana Bergulir			30	
65	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)			30	
66	Pendapatan Denda atas Pelanggaran Peraturan Daerah	Pendapatan Denda atas Pelanggaran Peraturan Daerah			30	
67	Pendapatan Zakat	Pendapatan Zakat			30	
68	Dana Perimbangan	Dana Perimbangan			30	
69	Dana Insentif Daerah (DID)	Dana Insentif Daerah (DID)			30	
70	Dana Desa	Dana Desa			30	
71	Pendapatan Bagi Hasil	Pendapatan Bagi Hasil			30	
72	Pendapatan Hibah dari Pemerintah Pusat	Pendapatan Hibah dari Pemerintah Pusat			30	
73	Pendapatan Hibah dari Pemerintah Daerah Lainnya	Pendapatan Hibah dari Pemerintah Daerah Lainnya			30	
9	Pajak Sarang Burung Walet	Pajak Sarang Burung Walet	30	30	\N	Pajak
3	Pajak Hiburan	Pajak Hiburan	30	30	\N	Pajak
2	Pajak Restoran	Pajak Restoran	30	30	\N	Pajak
5	Pajak Penerangan Jalan	Pajak Penerangan Jalan	30	30	\N	Pajak
7	Pajak Parkir	Pajak Parkir	30	30	\N	Pajak
74	Pendapatan Hibah dari Kelompok Masyarakat/Perorangan Dalam Negeri	Pendapatan Hibah dari Kelompok Masyarakat/Perorangan Dalam Negeri			30	
75	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Dalam Negeri/LN	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Dalam Negeri/LN			30	
76	Sumbangan Pihak Ketiga/Sejenis	Sumbangan Pihak Ketiga/Sejenis			30	
77	Dana Darurat	Dana Darurat			30	
78	Lain-lain Pendapatan	Lain-lain Pendapatan			30	
1	Pajak Hotel	Pajak Hotel	30	30	\N	Pajak
6	Pajak Mineral Bukan Logam dan Batuan	Pajak MINERBA	30	30	\N	Pajak
\.


--
-- Data for Name: s_jenisobjek_baru; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_jenisobjek_baru (s_idjenis, s_namajenis, s_namajenissingkat, t_akhirlapor, t_akhirbayar, t_jmlharitempo, s_jenispungutan) FROM stdin;
17	Hasil Penjualan BMD yang Tidak Dipisahkan	Hasil Penjualan BMD yang Tidak Dipisahkan			30	Retribusi
18	Hasil Selisih Lebih Tukar Menukar BMD yang Tidak Dipisahkan	Hasil Selisih Lebih Tukar Menukar BMD yang Tidak Dipisahkan			30	Retribusi
19	Hasil Pemanfaatan BMD yang Tidak Dipisahkan	Hasil Pemanfaatan BMD yang Tidak Dipisahkan			30	Retribusi
20	Hasil Kerja Sama Daerah	Hasil Kerja Sama Daerah			30	Retribusi
21	Jasa Giro	Jasa Giro			30	Retribusi
22	Hasil Pengelolaan Dana Bergulir	Hasil Pengelolaan Dana Bergulir			30	Retribusi
23	Pendapatan Bunga	Pendapatan Bunga			30	Retribusi
24	Penerimaan atas Tuntutan Ganti Kerugian Keuangan Daerah	Penerimaan atas Tuntutan Ganti Kerugian Keuangan Daerah			30	Retribusi
25	Penerimaan Komisi, Potongan, atau Bentuk Lain	Penerimaan Komisi, Potongan, atau Bentuk Lain			30	Retribusi
26	Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing	Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing			30	Retribusi
27	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan			30	Retribusi
28	Pendapatan Denda Pajak Daerah	Pendapatan Denda Pajak Daerah			30	Retribusi
29	Pendapatan Denda Retribusi Daerah	Pendapatan Denda Retribusi Daerah			30	Retribusi
30	Pendapatan Hasil Eksekusi atas Jaminan	Pendapatan Hasil Eksekusi atas Jaminan			30	Retribusi
31	Pendapatan dari Pengembalian	Pendapatan dari Pengembalian			30	Retribusi
32	Pendapatan BLUD	Pendapatan BLUD			30	Retribusi
33	Pendapatan Denda Pemanfaatan BMD yang tidak Dipisahkan	Pendapatan Denda Pemanfaatan BMD yang tidak Dipisahkan			30	Retribusi
34	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional pada FKTP	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional pada FKTP			30	Retribusi
35	Pendapatan Hasil Pengelolaan Dana Bergulir	Pendapatan Hasil Pengelolaan Dana Bergulir			30	Retribusi
36	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)			30	Retribusi
37	Pendapatan Denda atas Pelanggaran Peraturan Daerah	Pendapatan Denda atas Pelanggaran Peraturan Daerah			30	Retribusi
38	Pendapatan Zakat	Pendapatan Zakat			30	Retribusi
39	Dana Perimbangan	Dana Perimbangan			30	Retribusi
40	Dana Insentif Daerah (DID)	Dana Insentif Daerah (DID)			30	Retribusi
41	Dana Desa	Dana Desa			30	Retribusi
42	Pendapatan Bagi Hasil	Pendapatan Bagi Hasil			30	Retribusi
43	Pendapatan Hibah dari Pemerintah Pusat	Pendapatan Hibah dari Pemerintah Pusat			30	Retribusi
44	Pendapatan Hibah dari Pemerintah Daerah Lainnya	Pendapatan Hibah dari Pemerintah Daerah Lainnya			30	Retribusi
45	Pendapatan Hibah dari Kelompok Masyarakat/Perorangan Dalam Negeri	Pendapatan Hibah dari Kelompok Masyarakat/Perorangan Dalam Negeri			30	Retribusi
46	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Dalam Negeri/LN	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Dalam Negeri/LN			30	Retribusi
47	Sumbangan Pihak Ketiga/Sejenis	Sumbangan Pihak Ketiga/Sejenis			30	Retribusi
48	Dana Darurat	Dana Darurat			30	Retribusi
49	Lain-lain Pendapatan	Lain-lain Pendapatan			30	Retribusi
1	Pajak Hotel	Pajak Hotel	15	15	\N	Pajak
2	Pajak Restoran	Pajak Restoran	15	15	\N	Pajak
3	Pajak Hiburan	Pajak Hiburan	15	15	\N	Pajak
4	Pajak Reklame	Pajak Reklame			30	Pajak
5	Pajak Penerangan Jalan	Pajak Penerangan Jalan	15	15	\N	Pajak
6	Pajak Mineral Bukan Logam dan Batuan	Pajak MINERBA	15	15	\N	Pajak
7	Pajak Parkir	Pajak Parkir	15	15	\N	Pajak
8	Pajak Air Tanah	Pajak Air Tanah			30	Pajak
9	Pajak Sarang Burung Walet	Pajak Sarang Burung Walet	15	15	\N	Pajak
10	Pajak Bumi dan Bangunan Perdesaan\ndan Perkotaan	PBB-P2			\N	Pajak
11	Bea Perolehan Hak Atas Tanah dan\nBangunan	BPHTB			\N	Pajak
12	Retribusi Jasa Umum	Retribusi Jasa Umum			30	Retribusi
13	Retribusi Jasa Usaha	Retribusi Jasa Usaha			30	Retribusi
14	Retribusi Perizinan Tertentu	Retribusi Perizinan Tertentu			30	Retribusi
15	Deviden yang Dibagikan kepada Pemda atas Penyertaan Modal pada BUMN	Deviden yang Dibagikan kepada Pemda atas Penyertaan Modal pada BUMN			30	Retribusi
16	Deviden yang Dibagikan kepada Pemda atas Penyertaan Modal pada BUMD	Deviden yang Dibagikan kepada Pemda atas Penyertaan Modal pada BUMD			30	Retribusi
\.


--
-- Data for Name: s_jenisobjeklama; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_jenisobjeklama (s_idjenis, s_namajenis, s_namajenissingkat, t_akhirlapor, t_akhirbayar, t_jmlharitempo, s_jenispungutan) FROM stdin;
1	Pajak Hotel	Pajak Hotel	15	15	\N	Pajak
2	Pajak Restoran	Pajak Restoran	15	15	\N	Pajak
3	Pajak Hiburan	Pajak Hiburan	15	15	\N	Pajak
4	Pajak Reklame	Pajak Reklame			30	Pajak
5	Pajak Penerangan Jalan	Pajak Penerangan Jalan	15	15	\N	Pajak
6	Pajak Mineral Bukan Logam dan Batuan	Pajak MINERBA	15	15	\N	Pajak
7	Pajak Parkir	Pajak Parkir	15	15	\N	Pajak
8	Pajak Air Tanah	Pajak Air Tanah			30	Pajak
9	Pajak Sarang Burung Walet	Pajak Sarang Burung Walet	15	15	\N	Pajak
10	Pajak Bumi dan Bangunan Perdesaan\ndan Perkotaan	PBB-P2			\N	Pajak
11	Bea Perolehan Hak Atas Tanah dan\nBangunan	BPHTB			\N	Pajak
12	Retribusi Pelayanan Kesehatan	Ret. Pelayanan Kesehatan			30	Retribusi
13	Retribusi Pelayanan Persampahan/Kebersihan	Ret. Pelayanan Kebersihan			30	Retribusi
14	Retribusi Penggantian Biaya Cetak Kartu Tanda Penduduk dan Akta Catatan Sipil	Ret. CAPIL			30	Retribusi
15	Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	Ret. Pemakaman			30	Retribusi
16	Retribusi Pelayanan Parkir di Tepi Jalan Umum	Ret. Parkir Tepi Jalan			30	Retribusi
17	Retribusi Pelayanan Pasar	Ret. Pelayanan Pasar			30	Retribusi
18	Retribusi Pengujian Kendaraan Bermotor	Ret. Kendaraan Bermotor			30	Retribusi
19	Retribusi Pemeriksaan Alat Pemadam Kebakaran	Ret. Pemadam Kebakaran			30	Retribusi
20	Retribusi Penggantian Biaya Cetak Peta	Ret. Cetak Peta			30	Retribusi
21	Retribusi Penyediaan dan/atau Penyedotan Kakus	Ret. Penyedotan Kakus			30	Retribusi
22	Retribusi Pengolahan Limbah Cair	Ret. Limbah Cair			30	Retribusi
23	Retribusi Pelayanan Tera/Tera Ulang	Ret. Tera Ulang			30	Retribusi
24	Retribusi Pelayanan Pendidikan	Ret. Pelayanan Pendidikan			30	Retribusi
25	Retribusi Pengendalian Menara Telekomunikasi	Ret. Menara Telekomunikasi			30	Retribusi
26	Retribusi Pemakaian Kekayaan Daerah	Ret. Kekayaan Daerah			30	Retribusi
27	Retribusi Pasar Grosir dan/atau Pertokoan	Ret. Pasar Grosir			30	Retribusi
28	Retribusi Tempat Pelelangan	Ret. Tempat Pelelangan			30	Retribusi
29	Retribusi Terminal	Ret. Terminal			30	Retribusi
30	Retribusi Tempat Khusus Parkir	Ret. Tempat Khusus Parkir			30	Retribusi
31	Retribusi Tempat Penginapan/Pesanggrahan/Villa	Ret. Pesanggrahan Villa			30	Retribusi
32	Retribusi Rumah Potong Hewan	Ret. Potong Hewan			30	Retribusi
33	Retribusi Pelayanan Kepelabuhanan	Ret. Kepelabuhanan			30	Retribusi
34	Retribusi Tempat Rekreasi dan Olahraga	Ret. Rekreasi dan Olahraga			30	Retribusi
35	Retribusi Penyeberangan di Air	Ret. Penyeberangan di Air			30	Retribusi
36	Retribusi Penjualan Produksi Usaha Daerah	Ret. Usaha Daerah			30	Retribusi
37	Retribusi Izin Mendirikan Bangunan	Ret. IMB			30	Retribusi
38	Retribusi Izin Tempat Penjualan Minuman Beralkohol	Ret. Izin Minuman Beralkohol			30	Retribusi
39	Retribusi Izin Gangguan	Ret. Izin Gangguan			30	Retribusi
40	Retribusi Izin Trayek	Ret. Izin Trayek			30	Retribusi
41	Retribusi Izin Usaha Perikanan	Ret. Izin Usaha Perikanan			30	Retribusi
42	Retribusi Pengendalian Lalu Lintas	Retribusi Pengendalian Lalu Lintas			30	Retribusi
43	Retribusi Perpanjangan Izin Mempekerjakan Tenaga Kerja Asing (IMTA)	Retribusi Perpanjangan Izin Mempekerjakan Tenaga Kerja Asing (IMTA)			30	Retribusi
50	Hasil Penjualan Tanah	Hasil Penjualan Tanah			30	Retribusi
51	Hasil Penjualan Peralatan dan Mesin	Hasil Penjualan Peralatan dan Mesin			30	Retribusi
52	Hasil Penjualan Gedung dan Bangunan	Hasil Penjualan Gedung dan Bangunan			30	Retribusi
53	Hasil Penjualan Jalan, Jaringan, dan Irigasi	Hasil Penjualan Jalan, Jaringan, dan Irigasi			30	Retribusi
54	Hasil Penjualan Aset Tetap Lainnya	Hasil Penjualan Aset Tetap Lainnya			30	Retribusi
55	Hasil Penjualan Aset Lainnya	Hasil Penjualan Aset Lainnya			30	Retribusi
56	Hasil Selisih Lebih Tukar Menukar Tanah	Hasil Selisih Lebih Tukar Menukar Tanah			30	Retribusi
57	Hasil Selisih Lebih Tukar Menukar Peralatan dan Mesin	Hasil Selisih Lebih Tukar Menukar Peralatan dan Mesin			30	Retribusi
58	Hasil Selisih Lebih Tukar Menukar Gedung dan Bangunan	Hasil Selisih Lebih Tukar Menukar Gedung dan Bangunan			30	Retribusi
59	Hasil Selisih Lebih Tukar Menukar Jalan, Jaringan, dan Irigasi	Hasil Selisih Lebih Tukar Menukar Jalan, Jaringan, dan Irigasi			30	Retribusi
60	Hasil Selisih Lebih Tukar Menukar Aset Tetap Lainnya	Hasil Selisih Lebih Tukar Menukar Aset Tetap Lainnya			30	Retribusi
61	Hasil Selisih Lebih Tukar Menukar Aset Lainnya	Hasil Selisih Lebih Tukar Menukar Aset Lainnya			30	Retribusi
62	Hasil Sewa BMD	Hasil Sewa BMD			30	Retribusi
63	Hasil Kerja Sama Pemanfaatan BMD	Hasil Kerja Sama Pemanfaatan BMD			30	Retribusi
64	Hasil dari Bangun Guna Serah	Hasil dari Bangun Guna Serah			30	Retribusi
65	Hasil dari Bangun Serah Guna	Hasil dari Bangun Serah Guna			30	Retribusi
66	Hasil Kerja Sama Daerah	Hasil Kerja Sama Daerah			30	Retribusi
67	Jasa Giro pada Kas Daerah	Jasa Giro pada Kas Daerah			30	Retribusi
68	Jasa Giro pada Kas di Bendahara	Jasa Giro pada Kas di Bendahara			30	Retribusi
69	Jasa Giro pada Rekening Dana Cadangan	Jasa Giro pada Rekening Dana Cadangan			30	Retribusi
70	Jasa Giro pada BLUD	Jasa Giro pada BLUD			30	Retribusi
71	Jasa Giro pada Rekening Dana BOS	Jasa Giro pada Rekening Dana BOS			30	Retribusi
72	Jasa Giro Dana Kapitasi pada FKTP	Jasa Giro Dana Kapitasi pada FKTP			30	Retribusi
73	Hasil Pengelolaan Dana Bergulir	Hasil Pengelolaan Dana Bergulir			30	Retribusi
74	Pendapatan Bunga atas Penempatan Uang Pemerintah Daerah	Pendapatan Bunga atas Penempatan Uang Pemerintah Daerah			30	Retribusi
75	Tuntutan Ganti Kerugian Daerah terhadap Bendahara	Tuntutan Ganti Kerugian Daerah terhadap Bendahara			30	Retribusi
77	Penerimaan Komisi, Potongan, atau Bentuk Lain	Penerimaan Komisi, Potongan, atau Bentuk Lain			30	Retribusi
79	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan			30	Retribusi
80	Pendapatan Denda Pajak Kendaraan Bermotor (PKB)	Pendapatan Denda Pajak Kendaraan Bermotor (PKB)			30	Retribusi
81	Pendapatan Denda Bea Balik Nama Kendaraan Bermotor (BBNKB)	Pendapatan Denda Bea Balik Nama Kendaraan Bermotor (BBNKB)			30	Retribusi
82	Pendapatan Denda Pajak Bahan Bakar Kendaraan Bermotor (PBBKB)	Pendapatan Denda Pajak Bahan Bakar Kendaraan Bermotor (PBBKB)			30	Retribusi
83	Pendapatan Denda Retribusi Jasa Umum	Pendapatan Denda Retribusi Jasa Umum			30	Retribusi
84	Pendapatan Denda Retribusi Jasa Usaha	Pendapatan Denda Retribusi Jasa Usaha			30	Retribusi
85	Pendapatan Denda Retribusi Perizinan Tertentu	Pendapatan Denda Retribusi Perizinan Tertentu			30	Retribusi
86	Hasil Eksekusi atas Jaminan atas Pengadaan Barang/Jasa	Hasil Eksekusi atas Jaminan atas Pengadaan Barang/Jasa			30	Retribusi
88	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan			30	Retribusi
89	Pendapatan dari Pengembalian Kelebihan Pembayaran Gaji dan Tunjangan	Pendapatan dari Pengembalian Kelebihan Pembayaran Gaji dan Tunjangan			30	Retribusi
90	Pendapatan dari Pengembalian Kelebihan Pembayaran Perjalanan Dinas	Pendapatan dari Pengembalian Kelebihan Pembayaran Perjalanan Dinas			30	Retribusi
94	Pendapatan BLUD	Pendapatan BLUD			30	Retribusi
95	Pendapatan Denda Pengakhiran Sewa BMD	Pendapatan Denda Pengakhiran Sewa BMD			30	Retribusi
96	Pendapatan Denda Hasil dari Kerja Sama Penyediaan Infrastruktur	Pendapatan Denda Hasil dari Kerja Sama Penyediaan Infrastruktur			30	Retribusi
98	Pendapatan Hasil Pengelolaan Dana Bergulir	Pendapatan Hasil Pengelolaan Dana Bergulir			30	Retribusi
99	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)			30	Retribusi
100	Pendapatan Denda atas Pelanggaran Peraturan Daerah	Pendapatan Denda atas Pelanggaran Peraturan Daerah			30	Retribusi
101	Pendapatan Zakat	Pendapatan Zakat			30	Retribusi
102	Dana Perimbangan	Dana Perimbangan			30	Retribusi
103	Dana Transfer Umum-Dana Alokasi Umum (DAU)	Dana Transfer Umum-Dana Alokasi Umum (DAU)			30	Retribusi
104	Dana Transfer Khusus-Dana Alokasi Khusus (DAK) Fisik	Dana Transfer Khusus-Dana Alokasi Khusus (DAK) Fisik			30	Retribusi
105	Dana Transfer Khusus-Dana Alokasi Khusus (DAK) Non Fisik	Dana Transfer Khusus-Dana Alokasi Khusus (DAK) Non Fisik			30	Retribusi
\.


--
-- Data for Name: s_jenisreklame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_jenisreklame (s_idjenisreklame, s_namajenisreklame) FROM stdin;
1	Megatron/Videotron
2	Cahaya
3	Bando
4	Neon Box
5	Billboard
6	Baliho
7	Papan/painting
8	Kain dan sejenisnya
\.


--
-- Data for Name: s_jenissurat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_jenissurat (s_idsurat, s_namasurat, s_namasingkatsurat) FROM stdin;
1	Surat Pemberitahuan Pajak Daerah	SPTPD
2	Surat Ketetapan Pajak Daerah	SKPD
3	Surat Tagihan Pajak Daerah	STPD
4	Surat Ketatapan Pajak Daerah Kurang Bayar Jabatan	SKPD Jabatan
5	Surat Ketatapan Pajak Daerah Kurang Bayar	SKPDKB
6	Surat Ketetapan Pajak Daerah Kurang Bayar Tambahan	SKPDKBT
7	Surat Ketetapan Pajak Daerah Lebih Bayar	SKPDLB
8	Surat Ketetapan Pajak Daerah Nihil	SKPDN
9	Surat Ketetapana Retribusi Daerah	SKRD
10	Surat Ketetapan Pajak Daerah Tambahan	SKPDT
11	Surat Angsuran	SA
\.


--
-- Data for Name: s_kecamatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_kecamatan (s_idkec, s_kodekec, s_namakec, is_delete) FROM stdin;
1	100	PANDIH BATU	\N
0	0	LUAR DAERAH	\N
4	130	BANAMA TINGANG	\N
7	111	JABIREN RAYA	\N
5	110	KAHAYAN HILIR	\N
2	10	KAHAYAN KUALA	\N
3	120	KAHAYAN TENGAH	\N
6	101	MALIKU	\N
8	11	SEBANGAU KUALA	\N
\.


--
-- Data for Name: s_kekayaan_tarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_kekayaan_tarif (s_idtarif, s_idklasifikasi, s_klasifikasi, s_namajalan, s_nilailuastanah, s_nilailuasbangunan, s_satuan) FROM stdin;
1	1	Klasifikasi I	Jln. Yos Sudarso	100	2500	bulan
2	2	Klasifikasi II	Kel. Fandoy dan Jalan Pramuka	150	2000	bulan
3	3	Klasifikasi III	Kel. Saramom	150	1500	bulan
\.


--
-- Data for Name: s_kekayaankategorisatu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_kekayaankategorisatu (s_idkategorisatu, s_idklasifikasi, s_keterangan, s_tarif, s_satuan) FROM stdin;
20	3	Bus Pemda	1000000	/hari
21	3	Bus Dinas Perhubungan	1000000	/hari
22	4	Motor Grader 110 Hp ( Mitsubishi )	137749	/jam
23	4	Loader On Wheel 1,2 M3 (Samsung)	116118	/jam
24	4	Air Kompressor 7 Bar (Atlas Copco)	199954	/jam
25	4	Roller Tandem 700 kg (Meiwa)	27678	/jam
26	4	Pneumatic Tire Roller 12 Ton (Sakai)	115304	/jam
27	4	Roller Tandem 2,5 Ton (Barata)	23332	/jam
28	4	Thre Wheel Roller 8 Ton  (Barata)	71239	/jam
29	4	Thre Wheel Roller 6 Ton  (Barata)	45893	/jam
30	4	Excavator On Track 0,4 M3 (Hitachi)	106407	/jam
31	5	Traktor Mini	137500	/Ha
32	5	Hand Traktor	110000	/Ha
33	5	Transplater	110000	/Ha
34	5	Pompa Air	11000	/Hari
35	5	Power Threeser (Perontok)	5500	/Jam
1	1	Ibukota Kabupaten (Didalam Komplek Pasar)	30000	m2/Tahun
2	1	Ibukota Kabupaten (DiluarKomplek Pasar)	20000	m2/Tahun
3	1	Ibukota Kecamatan (Didalam Komplek Pasar)	25000	m2/Tahun
4	1	Ibukota Kecamatan (Didalam Komplek Pasar)	15000	m2/Tahun
5	2	Mes Pemda Kapuas di Yokyakarta, Banjarmasin, Palangkaraya	25000	/Orang/Bulan
6	2	RMD (Konstruksi Permanen)	1500	m2/bulan
7	2	RMD (Semi Permanen)	1350	m2/bulan
8	2	RMD (Konstruksi Darurat)	1250	m2/bulan
9	2	Gedung Pertemuan Umum Manggatang Tarung	3000000	/hari
10	2	Gedung Kesenian Gandang Garantung	2500000	/hari
11	2	Gedung Wanita Lawang Kameloh	2000000	/hari
12	2	Aula Pemda	1500000	perhari
13	2	Aula BAPPEDA	1500000	perhari
14	2	Aula Diknas	1000000	perhari
15	2	Aula SKB	500000	perhari
16	2	Mess SKB	25000	perhari
17	2	Aula Peridagkop	750000	perhari
18	3	Angkot DISHUB (Umum)	2500	/orang
19	3	Angkot DISHUB (Pelajar)	1500	/orang
\.


--
-- Data for Name: s_kekayaanpenggunaan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_kekayaanpenggunaan (s_idpenggunaan, s_keterangan) FROM stdin;
1	Tanah
2	Rumah / Bangunan / Gedung
3	Mobil
4	Alat Berat
5	Alat / Mesin Pertanian
\.


--
-- Data for Name: s_kekayaantarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_kekayaantarif (s_idtarif, s_idkategorisatu, s_keterangan, s_nilaitanah, s_nilaibangunan, s_satuan) FROM stdin;
1	1	untuk kegiatan usaha / komersial	1000	\N	per m2/bulan
2	1	untuk kegiatan non komersil	500	\N	per m2/bulan
3	2	untuk kegiatan usaha / komersil	500	\N	per m2/bulan
4	2	untuk kegiatan non komersial	250	\N	per m2/bulan
5	4	Jln Yos Sudarso	20	1500	per m2/bulan
6	4	Jln Moh. Yamin	20	1500	per m2/bulan
7	4	Jln A. Yani	20	1500	per m2/bulan
8	4	Kompleks Ridge I	20	1500	per m2/bulan
9	4	Kompleks Ridge II	20	1500	per m2/bulan
10	5	Kel Fandoy & Jln Pramuka	15	1250	per m2/bulan
11	5	Kel Burokub	15	1250	per m2/bulan
12	5	Kel Samofa	15	1250	per m2/bulan
13	5	Kel Karang Mulia	15	1250	per m2/bulan
14	6	Kel Saramon	15	1000	per m2/bulan
15	6	Komplekas BTK	15	1000	per m2/bulan
16	6	Barak-barak Pegawai	15	1000	per m2/bulan
17	7	(Khusus) yang ditempati BUMN/BUMD, Perusahaan swasta lainnya	50	2000	per m2/bulan
19	8	diluar kedinasan	\N	1500000	perhari
20	9	Pengguna dari Dinas/Badan/Kantor/Distrik PEMDA BIAK NUMFOR	\N	300000	perhari
21	9	Pengguna dari Kab/Kota Lain	\N	1500000	perhari
22	9	Pengguna dari Pemda Provinsi	\N	1500000	perhari
23	9	Pengguna dari TNI/Polri/BUMN/BUMD di Biak	\N	1300000	perhari
24	9	Pengguna dari TNI/Polri/BUMN/BUMD di luar Biak	\N	1500000	perhari
18	8	Kegiatan kedinasan / besifat proyek	\N	150000	perhari
\.


--
-- Data for Name: s_kelompoktargetsatker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_kelompoktargetsatker (s_idkelompoktarget, s_namatarget, s_tahuntarget, s_idsatker) FROM stdin;
\.


--
-- Data for Name: s_kelurahan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_kelurahan (s_idkel, s_kodekel, s_namakel, s_idkeckel, is_delete) FROM stdin;
0	0	Luar Daerah	0	\N
1	18	KARYA BERSAMA	1	\N
2	15	MALIKU MULYA	6	\N
3	13	BAHAUR HULU PERMAI	2	\N
4	11	BAHAUR BASANTAN	2	\N
5	10	HANJAK MAJU	5	\N
6	12	BAHAUR BATU RAYA	2	\N
7	1	GANDANG	6	\N
8	2	GARANTUNG	6	\N
9	3	TAHAI JAYA	6	\N
10	4	TAHAI BARU	6	\N
11	5	BADIRIH	6	\N
12	6	KANAMIT	6	\N
13	7	PURWODADI	6	\N
14	8	WONOAGUNG	6	\N
15	9	KANAMIT BARAT	6	\N
16	10	SEI BARU TEWU	6	\N
17	1	DANDANG	1	\N
18	2	TALIO	1	\N
19	3	BELANTI SIAM	1	\N
20	5	PANGKOH HILIR	1	\N
21	6	TALIO MUARA	1	\N
22	7	TALIO HULU	1	\N
23	8	GADABUNG	1	\N
24	9	PANTIK	1	\N
25	11	PANGKOH HULU	1	\N
26	12	PANGKOH SARI	1	\N
27	14	KANTAN DALAM	1	\N
28	15	MULYA SARI	1	\N
29	16	KANTAN ATAS	1	\N
30	17	SANGGANG	1	\N
31	23	KANTAN MUARA	1	\N
32	1	CEMANTAN	2	\N
33	2	SEI PUDAK	2	\N
34	3	KIAPAK	2	\N
35	4	BARUNAI	2	\N
36	5	SEI PASANAN	2	\N
37	6	SEI RUNGUN	2	\N
38	7	BAHAUR HILIR	2	\N
39	8	BAHAUR TENGAH	2	\N
40	9	BAHAUR HULU	2	\N
41	9	HENDA	7	\N
42	11	KANAMIT JAYA	6	\N
43	1	SEBANGAU PERMAI	8	\N
44	2	SEBANGAU JAYA	8	\N
45	3	SEBANGAU MULYA	8	\N
46	4	MEKAR JAYA	8	\N
47	5	PADURAN MULYA	8	\N
48	10	PADURAN SEBANGAU	8	\N
49	8	GARUNG	7	\N
50	12	JABIREN	7	\N
51	13	PILANG	7	\N
52	14	TUMBANG NUSA	7	\N
53	8	KALAWA	5	\N
54	15	KASALI BARU	4	\N
55	14	GANDANG BARAT	6	\N
56	15	TANJUNG TARUNA	7	\N
57	9	BERENG	5	\N
58	11	SEI HAMBAWANG	8	\N
59	12	SEI BAKAU	8	\N
60	10	TANJUNG PERAWAN	2	\N
61	1	MANEN PADURAN	4	\N
62	2	MANEN KALEKA	4	\N
63	3	LAWANG URU	4	\N
64	4	HURUNG	4	\N
65	5	HANUA	4	\N
66	6	RAMANG	4	\N
67	7	TAMBAK	4	\N
68	8	PAHAWAN	4	\N
69	9	GOHA	4	\N
70	10	BAWAN	4	\N
71	11	TUMBANG TARUSAN	4	\N
72	12	PANDAWEI	4	\N
73	13	PANGI	4	\N
74	14	TANGKAHEN	4	\N
75	1	TANJUNG SANGALANG	3	\N
76	2	PENDA BARANIA	3	\N
77	3	BUKIT RAWI	3	\N
78	4	TUWUNG	3	\N
79	5	SIGI	3	\N
80	6	PETUK LITI	3	\N
81	7	BUKIT LITI	3	\N
82	8	BAHU PALAWA	3	\N
83	9	PAMARUNAN	3	\N
84	10	BALUKON	3	\N
85	11	BUKIT BAMBA	3	\N
86	12	TAHAWA	3	\N
87	13	PARAHANGAN	3	\N
88	14	BERENG RAMBANG	3	\N
89	1	BUNTOI	5	\N
90	2	MINTIN	5	\N
91	3	MANTAREN II	5	\N
92	4	MANTAREN I	5	\N
93	5	PULANG PISAU	5	\N
94	6	ANJIR PULANG PISAU	5	\N
95	7	GOHONG	5	\N
96	10	SIMPUR	7	\N
97	11	SAKA KAJANG	7	\N
98	12	SIDODADI	6	\N
99	13	MALIKU BARU	6	\N
\.


--
-- Data for Name: s_klasifikasippj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_klasifikasippj (s_idklasifikasippj, s_idkorekppj, s_namaklasifikasi) FROM stdin;
3	77	Dihasilkan sendiri dengan memasang alat ukur
4	77	Dihasilkan sendiri dengan tidak memasang alat ukur
2	78	Sumber Lain khusus untuk kegiatan industri, pertambangan migas
1	14	Berasal Dari PLN untuk kebutuhan rumah tangga
\.


--
-- Data for Name: s_minerba_jenis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_minerba_jenis (s_idjenisminerba, s_namajenisminerba, s_idkorek, s_idzona, s_harga, s_keterangan, s_tarif) FROM stdin;
1	Pasir Pasang / Cor / Beton	108	\N	25000	\N	20
2	Pasir urug / Pasir Pulau	108	\N	15000	\N	20
3	Pasir Kuarsa	108	\N	25000	\N	20
4	Kerikil, Koral, dan Konglomerat	108	\N	35000	\N	20
5	Tanah Serap / Laterit / Sirtu	882	\N	25000	\N	20
6	Tanah Liat	882	\N	25000	\N	20
8	Batu Bata / Genteng	882	\N	15000	\N	20
7	Tanah Urug / Biasa	882	\N	15000	\N	20
9	Batu Gunung, Batu Belah	97	\N	35700	\N	20
10	Batu Split Ukuran 2/3 - 3/5 cm hasil crusher	97	\N	50000	\N	20
11	Batu Blok / Abu Batu / Filter	97	\N	70500	\N	20
\.


--
-- Data for Name: s_nilaistrategis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_nilaistrategis (s_idreklamejenis, s_idreklamelokasi, s_harga) FROM stdin;
6	1	40000
11	1	0
12	1	0
13	1	10000000
10	1	0
8	1	20000
9	1	20000
14	1	90000
4	1	70000
4	2	60000
4	3	50000
4	4	40000
1	1	200000
1	2	70000
1	3	60000
1	4	50000
2	1	200000
2	2	70000
2	3	60000
2	4	50000
3	1	50000
3	2	40000
3	3	30000
3	4	25000
5	1	25000
5	2	24000
5	3	23000
5	4	22000
7	1	200000
7	2	70000
7	3	60000
7	4	50000
\.


--
-- Data for Name: s_pejabat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_pejabat (s_idpej, s_namapej, s_jabatanpej, s_pangkatpej, s_nippej) FROM stdin;
20	SURYADI	PENGELOLA DATA PENAGIHAN PAJAK	PENGATUR Tk.1 (II/d)	19710225 200901 1 002
23	YESSIE, S.H, MM	KEPALA BIDANG PENDAPATAN	PEMBINA (IV/a)	19830708 200604 2 010
16	TEGUH PRASETIA, SE	PELAKSANA	CPNS (IIIa)	19990517 202203 1 002
17	SYAIFUL RASYID, SE	VERIFIKATOR KEUANGAN  PADA SUB BIDANG PENDATAAN  PENETAPAN	PENATA MUDA Tk. 1 (III/b)	19820429 201001 1 009
14	SANDRA WIJAYA, SE	PENGELOLA SUMBER PAD	PENATA (III/C)	19910526 201402 1 001
31	QAMARUL SYA'BAN, S.H	ANALIS PAJAK DAN RETRIBUSI DAERAH	PENATA (III/C)	19890327 201402 1 005
2	ERNI ANITASARI, S.Kom	KEPALA SUB BIDANG PENDATAAN DAN PENETAPAN	PENATA MUDA Tk. 1 (III/d)	19860207 201001 2 024
47	HELMAN FATHONI 	PELAKSANA	TKHL	-
40	LITRI	PELAKSANA	TKHL	-
46	SITI NORDIANTIE	PELAKSANA	TKHL	-
48	ELVINO PRAYOGO	PELAKSANA	TKHL	-
49	AGNESIA SABATINI	PELAKSANA	TKHL	-
32	INDAH RAHMAWATI, SE	KEPALA SUB BIDANG PELAYANAN DAN PENAGIHAN	PENATA Tk. 1 (III/d)	19800803 200604 2 012
46	TONY HARISINTA, SE., M.Si	KEPALA BADAN PENGELOLAAN PENDAPATAN KEUANGAN DAN ASET DAERAH	Pembina Utama Madya (IV/d)	196709301997031007
47	ZULKADRI, S.Kom., M.A	SEKRETARIS BADAN PENGELOLAAN PENDAPATAN KEUANGAN DAN ASET DAERAH	PEMBINA (IV/a)	197705162005011010
\.


--
-- Data for Name: s_pemda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_pemda (s_idpemda, s_namaprov, s_namakabkota, s_namaibukotakabkota, s_kodeprovinsi, s_kodekabkot, s_namainstansi, s_namasingkatinstansi, s_alamatinstansi, s_notelinstansi, s_namabank, s_norekbank, s_kodepos, s_logo) FROM stdin;
1	Provinsi Kalimantan Tengah	Pulang Pisau	Pulang Pisau	62	11	Badan Pendapatan Pengelolaan Keuangan Dan Aset Daerah	BPPKAD	Jln W.A.D DUHA Komplek Perkantoran	-	Bank KALTENG	-	74811	public/upload\\Lambang_Kabupaten_Pulang_Pisau.webp.png
\.


--
-- Data for Name: s_rekening; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_rekening (s_idkorek, s_jenisobjek, s_tipekorek, s_kelompokkorek, s_jeniskorek, s_objekkorek, s_rinciankorek, s_sub1korek, s_sub2korek, s_sub3korek, s_namakorek, s_persentarifkorek, s_tarifdasarkorek, s_voldasarkorek, s_tariftambahkorek, s_tglawalkorek, s_tglakhirkorek, t_berdasarmasa, is_deluser, t_jenisbahan) FROM stdin;
463	44	4	1	03	01	01	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMN  	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
466	45	4	1	03	02	01	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Lembaga Keuangan)  	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
580	50	4	1	04	05	03	001	00	00	Jasa Giro pada Rekening Dana Cadangan  	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
586	50	4	1	04	05	06	001	00	00	Jasa Giro Dana Kapitasi pada FKTP  	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
819	72	4	3	01	01	01	001	00	00	Pendapatan Hibah dari Pemerintah Pusat  	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
33	2	4	1	01	07	07	000	00	00	Pajak  Jasa Boga/Katering dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	No	0	\N
14	5	4	1	01	10	02	002	00	00	Pajak Penerangan Jalan sumber lain (Non Industri)	7	\N	\N	\N	2007-01-01	2002-02-01	Yes	0	\N
286	2	4	1	04	12	07	007	00	00	Pendapatan Jasa Boga/Katering dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2008-01-01	No	0	\N
362	9	4	1	01	13	01	001	00	00	Sarang Burung Walet	2.5	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
76	5	4	1	01	10	00	000	00	00	Pajak Penerangan Jalan	\N	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
77	5	4	1	01	10	01	001	00	00	Pajak Penerangan Jalan dihasilkan sendiri	1	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
78	5	4	1	01	10	02	001	00	00	Pajak Penerangan Jalan sumber lain	1.5	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
108	6	4	1	01	14	23	001	00	00	Pasir dan kerikil	20	25000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
55	3	4	1	01	08	10	001	00	00	Pertandingan Olahraga	10	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
868	3	4	1	01	08	11	001	00	00	Kesenian Tradisional Drama, Puisi, dan Sejenisnya	5	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
869	3	4	1	01	08	12	001	00	00	Bungi Jump, Sepeda Air (Jet Sky), Gokard, dan Sejenisnya	5	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
870	3	4	1	01	08	13	001	00	00	Permainan, Video Game, Ketangkasan atau Sejenisnya	5	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
871	3	4	1	01	08	14	001	00	00	Permainan Golf	5	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
872	3	4	1	01	08	15	001	00	00	Penyelengaraan Bowling	5	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
873	3	4	1	01	08	16	001	00	00	Pertunjukan Keterampilan Umum yang menggunakan Elektronik / Komputer	10	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
874	3	4	1	01	08	17	001	00	00	Panggung Terbuka / Tertutup	10	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
875	3	4	1	01	8	11	000	00	00	Kesenian Tradisional Drama, Puisi, dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
876	3	4	1	01	8	12	000	00	00	Bungi Jump, Sepeda Air (Jet Sky), Gokard, dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
877	3	4	1	01	8	13	000	00	00	Permainan, Video Game, Ketangkasan atau Sejenisnya	\N	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
878	3	4	1	01	8	14	000	00	00	Permainan Golf	\N	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
879	3	4	1	01	8	15	000	00	00	Penyelengaraan Bowling	\N	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
880	3	4	1	01	8	16	000	00	00	Pertunjukan Keterampilan Umum yang menggunakan Elektronik / Komputer	\N	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
881	3	4	1	01	8	17	000	00	00	Panggung Terbuka / Tertutup	\N	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
97	6	4	1	01	14	12	001	00	00	Granit / Andesit	20	50000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
69	4	4	1	01	09	07	001	00	00	Reklame Apung	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0	\N
70	4	4	1	01	09	08	000	00	00	Pajak Reklame Suara	20	\N	\N	\N	2006-01-01	2007-01-01	Yes	0	\N
71	4	4	1	01	09	08	001	00	00	Reklame Suara	20	\N	\N	\N	2006-01-01	2007-01-01	Yes	0	\N
73	4	4	1	01	09	09	001	00	00	Rekame Filem/Slide	20	\N	\N	\N	2006-01-01	2007-01-01	Yes	0	\N
74	4	4	1	01	09	10	000	00	00	Pajak Reklame Peragaan	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0	\N
75	4	4	1	01	09	10	001	00	00	Reklame Peragaan	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0	\N
79	7	4	1	01	11	00	000	00	00	Pajak Parkir	20	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
80	7	4	1	01	11	01	000	00	00	Pajak Parkir	20	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
81	8	4	1	01	12	00	000	00	00	Pajak Air Tanah	20	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
82	8	4	1	01	12	01	001	00	00	Air Tanah	20	2668	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
83	9	4	1	01	13	00	000	00	00	Pajak Sarang Burung Walet	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
84	9	4	1	01	13	01	000	00	00	Pajak Sarang Burung Walet	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
85	6	4	1	01	14	00	000	00	00	Pajak Mineral Bukan Logam dan Batuan	0	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
86	6	4	1	01	14	01	001	00	00	Asbes	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
87	6	4	1	01	14	02	001	00	00	Batu Tulis	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
88	6	4	1	01	14	03	001	00	00	Batu Setengah Permata	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
89	6	4	1	01	14	04	001	00	00	Batu Kapur	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
90	6	4	1	01	14	05	001	00	00	Batu Apung	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
91	6	4	1	01	14	06	001	00	00	Batu Permata	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
92	6	4	1	01	14	07	001	00	00	Bentonit	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
93	6	4	1	01	14	08	001	00	00	Dolomit	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
94	6	4	1	01	14	09	001	00	00	Feldspar	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
95	6	4	1	01	14	10	001	00	00	Garam Batu (Halite)	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
96	6	4	1	01	14	11	001	00	00	Grafit	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
98	6	4	1	01	14	13	001	00	00	Gips	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
99	6	4	1	01	14	14	001	00	00	Kalsit	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
113	6	4	1	01	14	28	001	00	00	Tanah Serap (Fullers earth)	\N	25000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
115	6	4	1	01	14	30	001	00	00	Tanah Liat	\N	25000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
256	6	4	1	01	14	40	001	00	00	Batu Gunung / Batu Belah	\N	35700	0	0	2007-01-01	2002-02-01	Yes	0	\N
257	6	4	1	01	14	41	001	00	00	Batu Split Ukuran 2/3 - 3/5 cm (Hasil Crusher)	\N	50000	0	0	2007-01-01	2002-02-01	Yes	0	\N
260	6	4	1	01	14	44	001	00	00	Tanah Urug / Biasa	\N	15000	0	0	2007-01-01	2002-02-01	Yes	0	\N
262	6	4	1	01	14	46	001	00	00	Pasir Pasang / Cor / Beton	\N	25000	0	0	2007-01-01	2002-02-01	Yes	0	\N
866	6	4	1	01	14	49	001	00	00	Kerikil, Koral dan Konglomerat	\N	35000	0	0	2007-01-01	2002-02-01	Yes	0	\N
867	6	4	1	01	14	50	001	00	00	Batu Blok / Abu Batu / Filter	\N	70500	0	0	2007-01-01	2002-02-01	Yes	0	\N
100	6	4	1	01	14	15	001	00	00	Kaolin	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
101	6	4	1	01	14	16	001	00	00	Leusit	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
102	6	4	1	01	14	17	001	00	00	Magnesit	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
103	6	4	1	01	14	18	001	00	00	Mika	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
104	6	4	1	01	14	19	001	00	00	Marmer	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
105	6	4	1	01	14	20	001	00	00	Nitrat	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
106	6	4	1	01	14	21	001	00	00	Opsidien	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
107	6	4	1	01	14	22	001	00	00	Oker	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
110	6	4	1	01	14	25	001	00	00	Perlit	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
111	6	4	1	01	14	26	001	00	00	Phospat	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
112	6	4	1	01	14	27	001	00	00	Talk	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
114	6	4	1	01	14	29	001	00	00	Tanah Diatome	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
116	6	4	1	01	14	31	001	00	00	Tawas (Alum)	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
117	6	4	1	01	14	32	001	00	00	Tras	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
118	6	4	1	01	14	33	001	00	00	Yarosif	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
119	6	4	1	01	14	34	001	00	00	Zeolit	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
120	6	4	1	01	14	35	001	00	00	Basal	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
121	6	4	1	01	14	36	001	00	00	Trakit	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
122	6	4	1	01	14	37	001	00	00	Mineral bukan logam dan lainnya	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
123	10	4	1	01	15	00	000	00	00	Pajak  Bumi  dan  Bangunan  Perdesaan  dan Perkotaan (PBBP2)	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
124	10	4	1	01	15	01	001	00	00	PBBP2	2	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
125	11	4	1	01	16	00	000	00	00	Bea Perolehan Hak Atas Tanah dan Bangunan (BPHTB)	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
126	11	4	1	01	16	01	000	00	00	BPHTB - Pemindahan Hak	5	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
127	11	4	1	01	16	02	000	00	00	BPHTB - Pemberian Hak Baru	5	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
254	6	4	1	01	14	38	001	00	00	Zirkon	15	1000000	0	0	2007-01-01	2002-02-01	Yes	0	\N
255	6	4	1	01	14	39	001	00	00	Intan	15	5000000	0	0	2007-01-01	2002-02-01	Yes	0	\N
72	4	4	1	01	09	09	000	00	00	Pajak Rekame Filem/Slide	20	\N	\N	\N	2006-01-01	2025-01-01	Yes	0	\N
258	6	4	1	01	14	42	001	00	00	Tanah Sirtu	5	125000	0	0	2007-01-01	2002-02-01	Yes	0	\N
259	6	4	1	01	14	43	001	00	00	Tanah Kuning	5	90000	0	0	2007-01-01	2002-02-01	Yes	0	\N
261	6	4	1	01	14	45	001	00	00	Tanah Merah (Lateri)	5	90000	0	0	2007-01-01	2002-02-01	Yes	0	\N
266	1	4	1	01	06	08	000	00	00	Pajak Rumah Kos dengan Jumlah Kamar \nLebih dari 10 (Sepuluh)	10	0	0	0	2001-01-01	2004-01-01	Yes	0	\N
267	8	4	1	01	12	01	000	00	0	Pajak Air Tanah	20	0	0	0	2001-01-01	2002-02-01	Yes	0	\N
272	1	4	1	04	12	06	002	00	00	Pendapatan Denda Pajak Motel	\N	\N	\N	\N	2001-01-01	2006-07-01	\N	0	\N
273	1	4	1	04	12	06	003	00	00	Pendapatan Denda Pajak Losmen	\N	\N	\N	\N	2001-01-01	2004-09-01	\N	0	\N
274	1	4	1	04	12	06	004	00	00	Pendapatan Denda Pajak Gubuk Pariwisata	\N	\N	\N	\N	2001-01-01	2002-11-01	\N	0	\N
275	1	4	1	04	12	06	005	00	00	Pendapatan Denda Pajak Wisma Pariwisata	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
276	1	4	1	04	12	06	006	00	00	Pendapatan Denda Pajak Pesanggrahan	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
277	1	4	1	04	12	06	007	00	00	Pendapatan Denda Pajak Rumah Penginapan dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
278	1	4	1	04	12	06	008	00	00	Pendapatan Denda Pajak Rumah Kos dengan Jumlah Kamar Lebih dari 10 (Sepuluh)	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
279	2	4	1	04	12	07	000	00	00	Pendapatan Denda Pajak Restoran	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
280	2	4	1	04	12	07	001	00	00	Pendapatan Denda Pajak Restoran dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
281	2	4	1	04	12	07	002	00	00	Pendapatan Denda Pajak Rumah Makan dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
282	2	4	1	04	12	07	003	00	00	Pendapatan Denda Pajak Kafetaria dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
283	2	4	1	04	12	07	004	00	00	Pendapatan Denda Pajak Kantin dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
284	2	4	1	04	12	07	005	00	00	Pendapatan Denda Pajak Warung dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
285	2	4	1	04	12	07	006	00	00	Pendapatan Denda Pajak Bar dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
287	3	4	1	04	12	08	000	00	00	Pendapatan Denda Pajak Hiburan	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
288	3	4	1	04	12	08	001	00	00	Pendapatan Denda Pajak Tontonan Film	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
289	3	4	1	04	12	08	002	00	00	Pendapatan Denda Pajak Pagelaran	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
290	3	4	1	04	12	08	003	00	00	Pendapatan Denda Pajak Kontes Kecantikan, Binaraga, dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
291	3	4	1	04	12	08	004	00	00	Pendapatan Denda Pajak Pameran	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
292	3	4	1	04	12	08	005	00	00	Pendapatan Denda Pajak Diskotik, Karaoke, Klub Malam, dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
268	5	4	1	01	10	01	000	00	00	Pajak Penerangan Jalan dihasilkan sendiri	\N	0	0	0	2001-01-01	2002-02-01	Yes	0	\N
269	5	4	1	01	10	02	000	00	00	Pajak Penerangan Jalan sumber lain	\N	0	0	0	2001-01-01	2002-02-01	Yes	0	\N
293	3	4	1	04	12	08	006	00	00	Pendapatan Denda Pajak Sirkus/Akrobat/ Sulap	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
294	3	4	1	04	12	08	007	00	00	Pendapatan Denda Pajak Permainan Biliar dan Bowling	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
295	3	4	1	04	12	08	008	00	00	Pendapatan Denda Pajak Pacuan Kuda, Kendaraan Bermotor, dan Permainan Ketangkasan	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
296	3	4	1	04	12	08	009	00	00	Pendapatan Denda Pajak Panti Pijat, Refleksi, Mandi Uap/Spa, dan Pusat Kebugaran (Fitness Center	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
297	3	4	1	04	12	08	010	00	00	Pendapatan Denda Pajak Pertandingan Olahraga	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
298	4	4	1	04	12	09	000	00	00	Pendapatan Denda Pajak Reklame	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
299	4	4	1	04	12	09	001	00	00	Pendapatan Denda Pajak Reklame Papan/ Billboard/Videotron/Megatron	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
300	4	4	1	04	12	09	002	00	00	Pendapatan Denda Pajak Reklame Kain	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
301	4	4	1	04	12	09	003	00	00	Pendapatan Denda Pajak Reklame Melekat/Stiker	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
264	6	4	1	01	14	48	001	00	00	Batu Bata / Genteng	\N	15000	0	0	2007-01-01	2002-02-01	Yes	0	\N
302	4	4	1	04	12	09	004	00	00	Pendapatan Denda Pajak Reklame Selebaran	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
303	4	4	1	04	12	09	005	00	00	Pendapatan Denda Pajak Reklame Berjalan	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
304	4	4	1	04	12	09	006	00	00	Pendapatan Denda Pajak Reklame Udara	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
305	4	4	1	04	12	09	007	00	00	Pendapatan Denda Pajak Reklame Apung	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
306	4	4	1	04	12	09	008	00	00	Pendapatan Denda Pajak Reklame Suara	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
307	4	4	1	04	12	09	009	00	00	Pendapatan Denda Pajak Reklame Film/Slide	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
308	4	4	1	04	12	09	010	00	00	Pendapatan Denda Pajak Reklame Peragaan	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
309	5	4	1	04	12	10	000	00	00	Pendapatan Denda Pajak Penerangan Jalan	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
310	5	4	1	04	12	10	001	00	00	Pendapatan Denda Pajak Penerangan Jalan Dihasilkan Sendiri	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
311	5	4	1	04	12	10	002	00	00	Pendapatan Denda Pajak Penerangan Jalan Sumber Lain	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
312	7	4	1	04	12	11	000	00	00	Pendapatan Denda Pajak Parkir	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
314	8	4	1	04	12	12	000	00	00	Pendapatan Denda Pajak Air Tanah	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
315	8	4	1	04	12	12	001	00	00	Pendapatan Denda Pajak Air Tanah	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
316	9	4	1	04	12	13	000	00	00	Pendapatan Denda Pajak Sarang Burung Walet	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
317	9	4	1	04	12	13	001	00	00	Pendapatan Denda Pajak Sarang Burung Walet	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
318	6	4	1	04	12	14	000	00	00	Pendapatan Denda Pajak Mineral Bukan Logam dan Batuan	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
319	6	4	1	04	12	14	001	00	00	Pendapatan Denda Pajak Asbes	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
320	6	4	1	04	12	14	002	00	00	Pendapatan Denda Pajak Batu Tulis	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
321	6	4	1	04	12	14	003	00	00	Pendapatan Denda Pajak Batu Setengah Permata	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
322	6	4	1	04	12	14	004	00	00	Pendapatan Denda Pajak Batu Kapur	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
323	6	4	1	04	12	14	005	00	00	Pendapatan Denda Pajak Batu Apung	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
324	6	4	1	04	12	14	006	00	00	Pendapatan Denda Pajak Batu Permata	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
325	6	4	1	04	12	14	007	00	00	Pendapatan Denda Pajak Bentonit	\N	\N	\N	\N	2001-01-01	2000-03-01	\N	0	\N
326	6	4	1	04	12	14	008	00	00	Pendapatan Denda Pajak Dolomit	\N	\N	\N	\N	2001-01-01	2008-04-01	\N	0	\N
327	6	4	1	04	12	14	009	00	00	Pendapatan Denda Pajak Felspar	\N	\N	\N	\N	2001-01-01	2006-06-01	\N	0	\N
39	3	4	1	01	08	02	001	00	00	Pagelaran Kesenian/Musik/Tari/ Busana	10	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
49	3	4	1	01	08	07	001	00	00	Permainan Bilyar dan  Sejenisnya	10	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
43	3	4	1	01	08	04	001	00	00	Pasar Seni dan Pameran	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
36	3	4	1	01	08	01	000	00	00	Pajak Tontonan Film / Bioskop	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
37	3	4	1	01	08	01	001	00	00	Tontonan Film / Bioskop	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
38	3	4	1	01	08	02	000	00	00	Pajak Pagelaran Kesenian/Musik/Tari/ Busana	5	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
40	3	4	1	01	08	03	000	00	00	Pajak Kontes Kecantikan, Binaraga, dan Sejenisnya 	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
1	0	4	0	0	0	0	000	00	00	PENDAPATAN DAERAH	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
2	0	4	1	0	0	0	000	00	00	PENDAPATAN ASLI DAERAH	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
3	0	4	1	01	0	0	000	00	00	HASIL PAJAK DAERAH	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
5	1	4	1	01	06	01	000	00	00	Pajak Hotel	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
6	1	4	1	01	06	01	001	00	00	Hotel	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
7	1	4	1	01	06	02	000	00	00	Pajak Motel	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
8	1	4	1	01	06	02	001	00	00	Motel	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
9	1	4	1	01	06	03	000	00	00	Pajak Losmen	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
10	1	4	1	01	06	03	001	00	00	Losmen	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
11	1	4	1	01	06	04	000	00	00	Pajak Gubuk Pariwisata	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
12	1	4	1	01	06	04	001	00	00	Gubuk Pariwisata	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
13	1	4	1	01	06	05	000	00	00	Pajak Wisma Pariwisata	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
15	1	4	1	01	06	06	000	00	00	Pajak Pesanggrahan	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
16	1	4	1	01	06	06	001	00	00	Pesanggrahan	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
17	1	4	1	01	06	07	000	00	00	Rumah Penginapan dan sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
18	1	4	1	01	06	08	001	00	00	Rumah Kos dengan jumlah kamar lebih dari 10 (sepuluh)	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
19	2	4	1	01	07	00	000	00	00	Pajak Restoran	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
20	2	4	1	01	07	01	000	00	00	Pajak Restoran dan sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
22	2	4	1	01	07	02	000	00	00	Pajak Rumah Makan dan sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
23	2	4	1	01	07	02	001	00	00	Rumah Makan dan sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
24	2	4	1	01	07	03	000	00	00	Pajak Kafetaria dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
25	2	4	1	01	07	03	001	00	00	Kafetaria dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
27	2	4	1	01	07	04	000	00	00	Pajak Kantin dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
21	2	4	1	01	07	01	001	00	00	Restoran dan sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
29	2	4	1	01	07	05	000	00	00	Pajak Warung dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
30	2	4	1	01	07	05	001	00	00	Warung dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
31	2	4	1	01	07	06	000	00	00	Pajak Bar dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
32	2	4	1	01	07	06	001	00	00	Bar dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
35	3	4	1	01	08	00	000	00	00	Pajak Hiburan	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
41	3	4	1	01	08	03	001	00	00	Kontes Kecantikan, Binaraga, dan Sejenisnya 	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
42	3	4	1	01	08	04	000	00	00	Pajak Pameran	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
44	3	4	1	01	08	05	000	00	00	Pajak Diskotik, Karaoke, Klab Malam dan sejenisnya	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
45	3	4	1	01	08	05	001	00	00	Diskotik, Karaoke, Klab Malam dan sejenisnya	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
46	3	4	1	01	08	06	000	00	00	Pajak Sirkus / Akrobat/Sulap	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
47	3	4	1	01	08	06	001	00	00	Sirkus / Akrobat/Sulap	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
48	3	4	1	01	08	07	000	00	00	Pajak Permainan Bilyar dan  Bowling	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
50	3	4	1	01	08	08	000	00	00	Pajak Pacuan Kuda, Kendaraan Bermotor, Permainan Ketangkasan	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
51	3	4	1	01	08	08	001	00	00	Pacuan Kuda, Kendaraan Bermotor, Permainan Ketangkasan	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
52	3	4	1	01	08	09	000	00	00	Pajak  Panti  Pijat,  Refleksi,  Mandi  Uap/Spa dan Pusat Kebugaran (Fitness Center)	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
53	3	4	1	01	08	09	001	00	00	Panti  Pijat,  Refleksi,  Mandi  Uap/Spa dan Pusat Kebugaran (Fitness Center)	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
54	3	4	1	01	08	10	000	00	00	Pertandingan Olahraga	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
56	4	4	1	01	09	00	000	00	00	Pajak Reklame	\N	\N	\N	\N	2006-01-01	2007-01-01	Yes	0	\N
57	4	4	1	01	09	04	000	00	00	Reklame Selebaran	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0	\N
59	4	4	1	01	09	01	001	00	00	Reklame Papan/Billboard/Videotron/Megatron	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0	\N
60	4	4	1	01	09	02	000	00	00	Pajak Reklame Kain	\N	\N	\N	\N	2002-01-01	2002-01-01	yes	0	\N
61	4	4	1	01	09	02	001	00	00	Reklame Kain	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0	\N
62	4	4	1	01	09	03	000	00	00	Pajak Reklame melekat/Stiker	\N	\N	\N	\N	2002-01-01	2002-01-01	yes	0	\N
63	4	4	1	01	09	03	001	00	00	Reklame melekat/Stiker	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0	\N
64	4	4	1	01	09	04	000	00	00	Pajak Reklame Selebaran	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0	\N
65	4	4	1	01	09	04	001	00	00	Reklame Selebaran	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0	\N
66	4	4	1	01	09	06	000	00	00	Pajak Reklame Udara	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0	\N
67	4	4	1	01	09	06	001	00	00	Reklame Udara	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0	\N
28	2	4	1	01	07	04	001	00	00	Kantin dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
68	4	4	1	01	09	07	000	00	00	Pajak Reklame Apung	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0	\N
328	6	4	1	04	12	14	010	00	00	Pendapatan Denda Pajak Garam Batu (Halite)	\N	\N	\N	\N	2001-01-01	2004-08-01	\N	0	\N
271	1	4	1	04	12	06	001	00	00	Pendapatan Denda Pajak Hotel	\N	\N	\N	\N	2001-01-01	2008-05-01	Yes	0	\N
329	6	4	1	04	12	14	011	00	00	Pendapatan Denda Pajak Grafit	\N	\N	\N	\N	2001-01-01	2002-10-01	\N	0	\N
330	6	4	1	04	12	14	012	00	00	Pendapatan Denda Pajak Granit/Andesit	\N	\N	\N	\N	2001-01-01	2000-12-01	\N	0	\N
331	6	4	1	04	12	14	013	00	00	Pendapatan Denda Pajak Gips	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
332	6	4	1	04	12	14	014	00	00	Pendapatan Denda Pajak Kalsit	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
333	6	4	1	04	12	14	015	00	00	Pendapatan Denda Pajak Kaolin	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
334	6	4	1	04	12	14	016	00	00	Pendapatan Denda Pajak Leusit	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
335	6	4	1	04	12	14	017	00	00	Pendapatan Denda Pajak Magnesit	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
336	6	4	1	04	12	14	018	00	00	Pendapatan Denda Pajak Mika	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
337	6	4	1	04	12	14	019	00	00	Pendapatan Denda Pajak Marmer	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
338	6	4	1	04	12	14	020	00	00	Pendapatan Denda Pajak Nitrat	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
339	6	4	1	04	12	14	021	00	00	Pendapatan Denda Pajak Opsidien	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
340	6	4	1	04	12	14	022	00	00	Pendapatan Denda Pajak Oker	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
341	6	4	1	04	12	14	023	00	00	Pendapatan Denda Pajak Pasir dan Kerikil	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
342	6	4	1	04	12	14	024	00	00	Pendapatan Denda Pajak Pasir Kuarsa	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
343	6	4	1	04	12	14	025	00	00	Pendapatan Denda Pajak Perlit	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
344	6	4	1	04	12	14	026	00	00	Pendapatan Denda Pajak Phospat	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
345	6	4	1	04	12	14	027	00	00	Pendapatan Denda Pajak Talk	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
346	6	4	1	04	12	14	028	00	00	Pendapatan Denda Pajak Tanah Serap (Fullers Earth)	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
347	6	4	1	04	12	14	029	00	00	Pendapatan Denda Pajak Tanah Diatome	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
348	6	4	1	04	12	14	030	00	00	Pendapatan Denda Pajak Tanah Liat	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
349	6	4	1	04	12	14	031	00	00	Pendapatan Denda Pajak Tawas (Alum)	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
350	6	4	1	04	12	14	032	00	00	Pendapatan Denda Pajak Tras	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
351	6	4	1	04	12	14	033	00	00	Pendapatan Denda Pajak Yarosif	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
352	6	4	1	04	12	14	034	00	00	Pendapatan Denda Pajak Zeolit	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
353	6	4	1	04	12	14	035	00	00	Pendapatan Denda Pajak Basal	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
354	6	4	1	04	12	14	036	00	00	Pendapatan Denda Pajak Trakit	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
355	6	4	1	04	12	14	037	00	00	Pendapatan Denda Pajak Mineral Bukan Logam dan Batuan Lainnya	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
356	10	4	1	04	12	15	000	00	00	Pendapatan Denda Pajak Bumi dan Bangunan Perdesaan dan Perkotaan (PBBP2)	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0	\N
357	10	4	1	04	12	15	001	00	00	Pendapatan Denda Pajak Bumi dan Bangunan Perdesaan dan Perkotaan (PBBP2)	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
358	11	4	1	04	12	16	000	00	00	Pendapatan Denda Bea Perolehan Hak atas Tanah dan Bangunan (BPHTB)	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0	\N
359	11	4	1	04	12	16	001	00	00	Pendapatan Denda BPHTB-Pemindahan Hak	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
34	2	4	1	01	07	07	001	00	00	Jasa Boga /Katering dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	No	0	\N
58	4	4	1	01	09	01	000	00	00	Pajak Reklame Papan/Billboard/Videotron/Megatron	0	\N	\N	\N	2002-01-01	2002-01-01	yes	0	\N
360	11	4	1	04	12	16	002	00	00	Pendapatan Denda BPHTB-Pemberian Hak Baru	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
361	7	4	1	01	11	01	001	00	00	Parkir	20	0	0	0	2001-01-01	2002-02-01	Yes	0	\N
365	12	4	1	02	01	01	001	00	00	Retribusi Pelayanan Kesehatan di Puskesmas	0	\N	\N	\N	2001-01-01	2009-01-01	\N	0	\N
366	12	4	1	02	01	01	002	00	00	Retribusi Pelayanan Kesehatan di Puskesmas Keliling	0	\N	\N	\N	2001-01-01	2003-01-01	\N	0	\N
367	12	4	1	02	01	01	003	00	00	Retribusi Pelayanan Kesehatan di Puskesmas Pembantu	0	\N	\N	\N	2001-01-01	2007-01-01	\N	0	\N
368	12	4	1	02	01	01	004	00	00	Retribusi Pelayanan Kesehatan di Balai Pengobatan	0	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
369	12	4	1	02	01	01	005	00	00	Retribusi Pelayanan Kesehatan di Rumah Sakit Umum Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
370	12	4	1	02	01	01	006	00	00	Retribusi Pelayanan Kesehatan di Tempat Pelayanan Kesehatan Lainnya yang Sejenis	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
372	13	4	1	02	01	02	001	00	00	Retribusi Pelayanan Persampahan/ Kebersihan	0	\N	\N	\N	2001-01-01	2009-01-01	\N	0	\N
374	15	4	1	02	01	03	001	00	00	Retribusi Pelayanan Penguburan/Pemakaman termasuk Penggalian dan Pengurukan serta Pembakaran/Pengabuan Mayat	0	\N	\N	\N	2001-01-01	2007-01-31	\N	0	\N
376	16	4	1	02	01	04	001	00	00	Retribusi Penyediaan Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2001-01-01	2006-01-29	\N	0	\N
378	17	4	1	02	01	05	001	00	00	Retribusi Pelataran	0	2000	\N	\N	2001-01-01	2004-01-27	\N	0	\N
379	17	4	1	02	01	05	002	00	00	Retribusi Los	0	2000	\N	\N	2001-01-01	2008-01-26	\N	0	\N
380	17	4	1	02	01	05	003	00	00	Retribusi Kios	0	2000	\N	\N	2001-01-01	2003-01-25	\N	0	\N
382	18	4	1	02	01	06	001	00	00	Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2001-01-01	2001-01-23	\N	0	\N
384	19	4	1	02	01	07	001	00	00	Retribusi Pelayanan Pemeriksaan dan/atau Pengujian Alat Pemadam Kebakaran	0	\N	\N	\N	2001-01-01	2000-01-20	\N	0	\N
385	19	4	1	02	01	07	002	00	00	Retribusi Pelayanan Pemeriksaan dan/atau Pengujian Alat Penanggulangan Kebakaran	0	\N	\N	\N	2001-01-01	2004-01-19	\N	0	\N
386	19	4	1	02	01	07	003	00	00	Retribusi Pelayanan Pemeriksaan dan/atau Pengujian Alat Penyelamatan Jiwa	0	\N	\N	\N	2001-01-01	2008-01-18	\N	0	\N
388	20	4	1	02	01	08	001	00	00	Retribusi Penyediaan Peta Dasar (Garis)	0	\N	\N	\N	2001-01-01	2007-01-16	\N	0	\N
389	20	4	1	02	01	08	002	00	00	Retribusi Penyediaan Peta Foto	0	\N	\N	\N	2001-01-01	2001-01-15	\N	0	\N
390	20	4	1	02	01	08	003	00	00	Retribusi Penyediaan Peta Digital	0	\N	\N	\N	2001-01-01	2005-01-14	\N	0	\N
363	0	4	1	02	01	00	000	00	00	Retribusi Jasa Umum	0	\N	\N	\N	2001-01-01	2000-01-01	Yes	0	\N
391	20	4	1	02	01	08	004	00	00	Retribusi Penyediaan Peta Tematik	0	\N	\N	\N	2001-01-01	2009-01-13	\N	0	\N
392	20	4	1	02	01	08	005	00	00	Retribusi Penyediaan Peta Teknis (Struktur)	0	\N	\N	\N	2001-01-01	2004-05-12	\N	0	\N
383	19	4	1	02	01	07	0	00	00	Retribusi Pemeriksaan Alat Pemadam Kebakaran	0	\N	\N	\N	2001-01-01	2005-01-21	\N	0	\N
381	18	4	1	02	01	06	0	00	00	Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2001-01-01	2007-10-24	\N	0	\N
377	17	4	1	02	01	05	0	00	00	Retribusi Pelayanan Pasar	0	\N	\N	\N	2001-01-01	2000-01-28	\N	0	\N
375	16	4	1	02	01	04	0	00	00	Retribusi Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2001-01-01	2001-01-30	\N	0	\N
373	15	4	1	02	01	03	0	00	00	Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	0	\N	\N	\N	2001-01-01	2003-01-01	\N	0	\N
371	13	4	1	02	01	02	0	00	00	Retribusi Pelayanan Persampahan/Kebersihan	0	\N	\N	\N	2001-01-01	2004-06-01	\N	0	\N
364	12	4	1	02	01	01	0	00	00	Retribusi Pelayanan Kesehatan 	0	\N	\N	\N	2001-01-01	2005-01-01	\N	0	\N
394	21	4	1	02	01	09	001	00	00	Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
396	22	4	1	02	01	10	001	00	00	Retribusi Rumah Tangga	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
397	22	4	1	02	01	10	002	00	00	Retribusi Perkantoran	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
398	22	4	1	02	01	10	003	00	00	Retribusi Industri	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
400	23	4	1	02	01	11	001	00	00	Retribusi Pelayanan Pengujian Alat-Alat Ukur, Takar, Timbang, dan Perlengkapannya	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
401	23	4	1	02	01	11	002	00	00	Retribusi Pengujian Barang dalam Keadaan Terbungkus	0	\N	\N	\N	2001-01-01	2000-01-21	\N	0	\N
403	24	4	1	02	01	12	001	00	00	Retribusi Pelayanan Penyelenggaraan Pendidikan Teknis	0	\N	\N	\N	2001-01-01	2002-01-01	\N	0	\N
404	24	4	1	02	01	12	002	00	00	Retribusi Pelayanan Penyelenggaraan Pelatihan Teknis	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
405	24	4	1	02	01	12	003	00	00	Retribusi Pelayanan Penyelenggaraan Pendidikan dan Pelatihan Teknis	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
407	25	4	1	02	01	13	001	00	00	Retribusi Pengawasan dan Pengendalian Menara Telekomunikasi 	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
408	0	4	1	02	02	00	000	00	00	Retribusi Jasa Usaha	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
410	26	4	1	02	02	01	001	00	00	Retribusi Penyewaan Tanah dan Bangunan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
411	26	4	1	02	02	01	002	00	00	Retribusi Penyewaan Tanah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
412	26	4	1	02	02	01	003	00	00	Retribusi Penyewaan Bangunan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
413	26	4	1	02	02	01	004	00	00	Retribusi Pemakaian Laboratorium	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
414	26	4	1	02	02	01	005	00	00	Retribusi Pemakaian Ruangan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
415	26	4	1	02	02	01	006	00	00	Retribusi Pemakaian Kendaraan Bermotor	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
417	27	4	1	02	02	02	001	00	00	Retribusi Penyediaan Fasilitas Pasar Grosir Berbagai Jenis Barang yang Dikontrakkan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
418	27	4	1	02	02	02	002	00	00	Retribusi Penyediaan Fasilitas Pasar/Pertokoan yang Dikontrakkan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
420	28	4	1	02	02	03	001	00	00	Retribusi Penyediaan Tempat Pelelangan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
421	28	4	1	02	02	03	002	00	00	Retribusi Penyediaan Fasilitas Lainnya di Tempat Pelelangan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
423	29	4	1	02	02	04	001	00	00	Retribusi Pelayanan Penyediaan Tempat Parkir untuk Kendaraan Penumpang dan Bus Umum	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
424	29	4	1	02	02	04	002	00	00	Retribusi Pelayanan Penyediaan Tempat Kegiatan Usaha	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
425	29	4	1	02	02	04	003	00	00	Retribusi Pelayanan Penyediaan Fasilitas Lainnya di Lingkungan Terminal	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
427	30	4	1	02	02	05	001	00	00	Retribusi Pelayanan Tempat Khusus Parkir	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
429	31	4	1	02	02	06	001	00	00	Retribusi Pelayanan Tempat Penginapan/ Pesanggrahan/Vila	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
431	32	4	1	02	02	07	001	00	00	Retribusi Pelayanan Rumah Potong Hewan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
433	33	4	1	02	02	08	001	00	00	Retribusi Pelayanan Kepelabuhanan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
435	34	4	1	02	02	09	001	00	00	Retribusi Pelayanan Tempat Rekreasi dan Olahraga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
437	35	4	1	02	02	10	001	00	00	Retribusi Pelayanan Penyeberangan Orang	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
438	35	4	1	02	02	10	002	00	00	Retribusi Pelayanan Penyeberangan Barang	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
440	36	4	1	02	02	11	001	00	00	Retribusi Penjualan Produksi Hasil Usaha Daerah berupa Bibit atau Benih Tanaman	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
441	36	4	1	02	02	11	002	00	00	Retribusi Penjualan Produksi hasil Usaha Daerah berupa Bibit Ternak	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
442	36	4	1	02	02	11	003	00	00	Retribusi Penjualan Produksi hasil Usaha	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
444	0	4	1	02	03	00	000	00	00	Retribusi Perizinan Tertentu	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
446	37	4	1	02	03	01	001	00	00	Retribusi Pemberian Izin Mendirikan Bangunan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
448	38	4	1	02	03	02	001	00	00	Retribusi Pemberian Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
450	40	4	1	02	03	03	001	00	00	Retribusi Izin Trayek untuk Menyediakan Pelayanan Angkutan Umum	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
447	38	4	1	02	03	02	0	00	00	Retribusi Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
445	37	4	1	02	03	01	0	00	00	Retribusi Izin Mendirikan Bangunan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
439	36	4	1	02	02	11	0	00	00	Retribusi Penjualan Produksi Usaha Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
436	35	4	1	02	02	10	0	00	00	Retribusi Penyeberangan di Air	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
434	34	4	1	02	02	09	0	00	00	Retribusi Tempat Rekreasi dan Olahraga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
432	33	4	1	02	02	08	0	00	00	Retribusi Pelayanan Kepelabuhanan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
430	32	4	1	02	02	07	0	00	00	Retribusi Pelayanan Rumah Potong Hewan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
428	31	4	1	02	02	06	0	00	00	Retribusi Tempat Penginapan/Pesanggrahan/ Vila	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
426	30	4	1	02	02	05	0	00	00	Retribusi Tempat Khusus Parkir	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
422	29	4	1	02	02	04	0	00	00	Retribusi Terminal	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
419	28	4	1	02	02	03	0	00	00	Retribusi Tempat Pelelangan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
416	27	4	1	02	02	02	0	00	00	Retribusi Pasar Grosir dan/atau Pertokoan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
406	25	4	1	02	01	13	0	00	00	Retribusi Pengawasan dan Pengendalian Menara Telekomunikasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
402	24	4	1	02	01	12	0	00	00	Retribusi Pelayanan Pendidikan	0	\N	\N	\N	2001-01-01	2000-01-10	\N	0	\N
399	23	4	1	02	01	11	0	00	00	Retribusi Pelayanan Tera/Tera Ulang	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
395	22	4	1	02	01	10	0	00	00	Retribusi Pengolahan Limbah Cair	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0	\N
393	21	4	1	02	01	09	0	00	00	Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2001-01-01	2008-01-10	\N	0	\N
443	36	4	1	02	02	11	005	00	00	Retribusi Penjualan Produksi hasil Usaha Daerah selain Bibit atau Benih Tanaman, Ternak, dan Ikan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
452	41	4	1	02	03	04	001	00	00	Retribusi Pemberian Izin Kegiatan Usaha Penangkapan Ikan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
453	41	4	1	02	03	04	002	00	00	Retribusi Pemberian Izin Kegiatan Usaha Pembudidayaan Ikan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
455	42	4	1	02	03	05	001	00	00	Retribusi Pengendalian Lalu Lintas Penggunaan Ruas Jalan Tertentu	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
513	46	4	1	04	01	05	005	00	00	Hasil Penjualan Tanaman	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
456	42	4	1	02	03	05	002	00	00	Retribusi Pengendalian Lalu Lintas Penggunaan Koridor Tertentu	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
457	42	4	1	02	03	05	003	00	00	Retribusi Pengendalian Lalu Lintas Penggunaan Kawasan Tertentu	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
459	43	4	1	02	03	06	001	00	00	Retribusi Pemberian Perpanjangan IMTA kepada Pemberi Kerja Tenaga Kerja Asing	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
476	46	4	1	04	01	00	000	00	00	Hasil Penjualan BMD yang Tidak Dipisahkan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
478	46	4	1	04	01	01	001	00	00	Hasil Penjualan Tanah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
480	46	4	1	04	01	02	001	00	00	Hasil Penjualan Alat Besar	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
481	46	4	1	04	01	02	002	00	00	Hasil Penjualan Alat Angkutan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
482	46	4	1	04	01	02	003	00	00	Hasil Penjualan Alat Bengkel dan Alat Ukur	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
483	46	4	1	04	01	02	004	00	00	Hasil Penjualan Alat Pertanian	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
484	46	4	1	04	01	02	005	00	00	Hasil Penjualan Alat Kantor dan Rumah Tangga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
485	46	4	1	04	01	02	006	00	00	Hasil Penjualan Alat Studio, Komunikasi, dan Pemancar	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
486	46	4	1	04	01	02	007	00	00	Hasil Penjualan Alat Kedokteran dan Kesehatan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
487	46	4	1	04	01	02	008	00	00	Hasil Penjualan Alat Laboratorium	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
488	46	4	1	04	01	02	010	00	00	Hasil Penjualan Komputer	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
489	46	4	1	04	01	02	011	00	00	Hasil Penjualan Alat Eksplorasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
490	46	4	1	04	01	02	012	00	00	Hasil Penjualan Alat Pengeboran	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
468	45	4	1	03	02	02	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Aneka Usaha)  	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
470	45	4	1	03	02	03	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada Perusahaan Milik Daerah/BUMD (Bidang Air Minum)  	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
472	45	4	1	03	02	04	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Limbah)  	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
474	45	4	1	03	02	05	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Sanitasi)  	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
491	46	4	1	04	01	02	013	00	00	Hasil Penjualan Alat Produksi, Pengolahan, dan Pemurnian	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
492	46	4	1	04	01	02	014	00	00	Hasil Penjualan Alat Bantu Eksplorasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
493	46	4	1	04	01	02	015	00	00	Hasil Penjualan Alat Keselamatan Kerja	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
494	46	4	1	04	01	02	016	00	00	Hasil Penjualan Alat Peraga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
495	46	4	1	04	01	02	017	00	00	Hasil Penjualan Peralatan Proses/Produksi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
496	46	4	1	04	01	02	018	00	00	Hasil Penjualan Rambu-rambu	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
497	46	4	1	04	01	02	019	00	00	Hasil Penjualan Peralatan Olahraga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
499	46	4	1	04	01	03	001	00	00	Hasil Penjualan Gedung dan Bangunan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
500	46	4	1	04	01	03	002	00	00	Hasil Penjualan Monumen	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
460	0	4	1	03	0	0	000	00	00	Hasil Pengelolaan Kekayaan Daerah yang Dipisahkan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
461	44	4	1	03	01	00	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMN	0	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
464	45	4	1	03	02	00	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
501	46	4	1	04	01	03	003	00	00	Hasil Penjualan Bangunan Menara	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
502	46	4	1	04	01	03	004	00	00	Hasil Penjualan Tugu Titik Kontrol/Pasti	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
504	46	4	1	04	01	04	001	00	00	Hasil Penjualan Jalan dan Jembatan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
505	46	4	1	04	01	04	002	00	00	Hasil Penjualan Bangunan Air	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
479	46	4	1	04	01	02	0	00	00	Hasil Penjualan Peralatan dan Mesin	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
477	46	4	1	04	01	01	0	00	00	Hasil Penjualan Tanah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
498	46	4	1	04	01	03	0	00	00	Hasil Penjualan Gedung dan Bangunan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
471	45	4	1	03	02	04	0	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Limbah)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
469	45	4	1	03	02	03	0	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Air Minum)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
467	45	4	1	03	02	02	0	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Aneka Usaha)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
465	45	4	1	03	02	01	0	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Lembaga Keuangan)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
462	44	4	1	03	01	01	0	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMN	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
458	43	4	1	02	03	06	0	00	00	Retribusi Perpanjangan Izin Mempekerjakan Tenaga Kerja Asing (IMTA)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
454	42	4	1	02	03	05	0	00	00	Retribusi Pengendalian Lalu Lintas	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
506	46	4	1	04	01	04	003	00	00	Hasil Penjualan Instalasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
507	46	4	1	04	01	04	004	00	00	Hasil Penjualan Jaringan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
509	46	4	1	04	01	05	001	00	00	Hasil Penjualan Bahan Perpustakaan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
510	46	4	1	04	01	05	002	00	00	Hasil Penjualan Barang Bercorak Kesenian/Kebudayaan/Olahraga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
511	46	4	1	04	01	05	003	00	00	Hasil Penjualan Hewan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
512	46	4	1	04	01	05	004	00	00	Hasil Penjualan Biota Perairan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
514	46	4	1	04	01	05	006	00	00	Hasil Penjualan Barang Koleksi Non Budaya	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
515	46	4	1	04	01	05	007	00	00	Hasil Penjualan Aset Tetap Dalam Renovasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
517	46	4	1	04	01	06	001	00	00	Hasil Penjualan Aset Lainnya-Aset Tidak Berwujud	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
518	46	4	1	04	01	06	002	00	00	Hasil Penjualan Aset Lainnya-Aset Lain-Lain	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
519	47	4	1	04	02	00	000	00	00	Hasil Selisih Lebih Tukar Menukar BMD yang Tidak Dipisahkan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
521	47	4	1	04	02	01	001	00	00	Hasil Selisih Lebih Tukar Menukar Tanah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
523	47	4	1	04	02	02	001	00	00	Hasil Selisih Lebih Tukar Menukar Alat Besar	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
524	47	4	1	04	02	02	002	00	00	Hasil Selisih Lebih Tukar Menukar Alat Angkutan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
525	47	4	1	04	02	02	003	00	00	Hasil Selisih Lebih Tukar Menukar Alat Bengkel dan Alat Ukur	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
526	47	4	1	04	02	02	004	00	00	Hasil Selisih Lebih Tukar Menukar Alat Pertanian	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
527	47	4	1	04	02	02	005	00	00	Hasil Selisih Lebih Tukar Menukar Alat Kantor dan Rumah Tangga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
528	47	4	1	04	02	02	006	00	00	Hasil Selisih Lebih Tukar Menukar Alat Studio, Komunikasi, dan Pemancar	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
529	47	4	1	04	02	02	007	00	00	Hasil Selisih Lebih Tukar Menukar Alat Kedokteran dan Kesehatan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
530	47	4	1	04	02	02	008	00	00	Hasil Selisih Lebih Tukar Menukar Alat Laboratorium	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
531	47	4	1	04	02	02	010	00	00	Hasil Selisih Lebih Tukar Menukar Komputer	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
532	47	4	1	04	02	02	011	00	00	Hasil Selisih Lebih Tukar Menukar Alat Eksplorasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
533	47	4	1	04	02	02	012	00	00	Hasil Selisih Lebih Tukar Menukar Alat Pengeboran	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
534	47	4	1	04	02	02	013	00	00	Hasil Selisih Lebih Tukar Menukar Alat Produksi, Pengolahan, dan Pemurnian	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
535	47	4	1	04	02	02	014	00	00	Hasil Selisih Lebih Tukar Menukar Alat Bantu Eksplorasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
536	47	4	1	04	02	02	015	00	00	Hasil Selisih Lebih Tukar Menukar Alat Keselamatan Kerja	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
537	47	4	1	04	02	02	016	00	00	Hasil Selisih Lebih Tukar Menukar Alat Peraga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
538	47	4	1	04	02	02	017	00	00	Hasil Selisih Lebih Tukar Menukar Peralatan Proses/Produksi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
539	47	4	1	04	02	02	018	00	00	Hasil Selisih Lebih Tukar Menukar RambuRambu	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
756	68	4	2	01	01	03	020	00	00	DAK Fisik-Bidang Pariwisata Reguler	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
540	47	4	1	04	02	02	019	00	00	Hasil Selisih Lebih Tukar Menukar Peralatan Olahraga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
542	47	4	1	04	02	03	001	00	00	Hasil Selisih Lebih Tukar Menukar Bangunan Gedung	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
543	47	4	1	04	02	03	002	00	00	Hasil Selisih Lebih Tukar Menukar Monumen	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
544	47	4	1	04	02	03	003	00	00	Hasil Selisih Lebih Tukar Menukar Bangunan Menara	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
545	47	4	1	04	02	03	004	00	00	Hasil Selisih Lebih Tukar Menukar Tugu Titik Kontrol/Pasti	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
547	47	4	1	04	02	04	001	00	00	Hasil Selisih Lebih Tukar Menukar Jalan dan Jembatan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
548	47	4	1	04	02	04	002	00	00	Hasil Selisih Lebih Tukar Menukar Bangunan Air	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
549	47	4	1	04	02	04	003	00	00	Hasil Selisih Lebih Tukar Menukar Instalasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
550	47	4	1	04	02	04	004	00	00	Hasil Selisih Lebih Tukar Menukar Jaringan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
552	47	4	1	04	02	05	001	00	00	Hasil Selisih Lebih Tukar Menukar Bahan Perpustakaan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
553	47	4	1	04	02	05	002	00	00	Hasil Selisih Lebih Tukar Menukar Barang Bercorak Kesenian/Kebudayaan/Olahraga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
554	47	4	1	04	02	05	003	00	00	Hasil Selisih Lebih Tukar Menukar Hewan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
555	47	4	1	04	02	05	004	00	00	Hasil Selisih Lebih Tukar Menukar Biota Perairan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
556	47	4	1	04	02	05	005	00	00	Hasil Selisih Lebih Tukar Menukar Tanaman	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
557	47	4	1	04	02	05	006	00	00	Hasil Selisih Lebih Tukar Menukar Barang Koleksi Non Budaya	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
558	47	4	1	04	02	05	007	00	00	Hasil Selisih Lebih Tukar Menukar Aset Tetap Dalam Renovasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
560	47	4	1	04	02	06	001	00	00	Hasil Selisih Lebih Tukar Menukar Aset Lainnya-Aset Tidak Berwujud	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
561	47	4	1	04	02	06	002	00	00	Hasil Selisih Lebih Tukar Menukar Aset Lainnya-Aset Lain-Lain	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
551	47	4	1	04	02	05	0	00	00	Hasil Selisih Lebih Tukar Menukar Aset Tetap Lainnya	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
546	47	4	1	04	02	04	0	00	00	Hasil Selisih Lebih Tukar Menukar Jalan, Jaringan, dan Irigasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
541	47	4	1	04	02	03	0	00	00	Hasil Selisih Lebih Tukar Menukar Gedung dan Bangunan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
522	47	4	1	04	02	02	0	00	00	Hasil Selisih Lebih Tukar Menukar Peralatan dan Mesin	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
520	47	4	1	04	02	01	0	00	00	Hasil Selisih Lebih Tukar Menukar Tanah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
516	46	4	1	04	01	06	0	00	00	Hasil Penjualan Aset Lainnya	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
508	46	4	1	04	01	05	0	00	00	Hasil Penjualan Aset Tetap Lainnya	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
564	48	4	1	04	03	01	001	00	00	Hasil Sewa BMD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
571	49	4	1	04	04	00	000	00	00	Hasil Kerja Sama Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
573	49	4	1	04	04	01	001	00	00	Hasil Kerja Sama Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
576	50	4	1	04	05	01	001	00	00	Jasa Giro pada Kas Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
578	50	4	1	04	05	02	001	00	00	Jasa Giro pada Kas di Bendahara	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
589	51	4	1	04	06	01	001	00	00	Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
592	52	4	1	04	07	01	001	00	00	Pendapatan Bunga atas Penempatan Uang Pemerintah Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
595	53	4	1	04	08	01	001	00	00	Tuntutan Ganti Kerugian Daerah terhadap Bendahara	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
597	53	4	1	04	08	02	001	00	00	Tuntutan Ganti Kerugian Daerah terhadap Pegawai Negeri Bukan Bendahara atau Pejabat Lain	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
600	54	4	1	04	09	01	001	00	00	Penerimaan Komisi, Potongan, atau Bentuk Lain	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
603	55	4	1	04	10	01	001	00	00	Penerimaan Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
606	56	4	1	04	11	01	001	00	00	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
607	57	4	1	04	12	00	000	00	00	Pendapatan Denda Pajak Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
609	57	4	1	04	12	01	001	00	00	Pendapatan Denda PKB-Mobil Penumpang Sedan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
610	57	4	1	04	12	01	002	00	00	Pendapatan Denda PKB-Mobil Penumpang Jeep	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
611	57	4	1	04	12	01	003	00	00	Pendapatan Denda PKB-Mobil Penumpang Minibus	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
612	57	4	1	04	12	01	004	00	00	Pendapatan Denda PKB-Mobil Bus-Microbus	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
613	57	4	1	04	12	01	005	00	00	Pendapatan Denda PKB-Mobil Bus-Bus	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
614	57	4	1	04	12	01	006	00	00	Pendapatan Denda PKB-Mobil Barang/Beban-Pick Up	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
615	57	4	1	04	12	01	007	00	00	Pendapatan Denda PKB-Mobil Barang/Beban-Light Truck	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
616	57	4	1	04	12	01	008	00	00	Pendapatan Denda PKB-Mobil Barang/Beban-Truck	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
574	50	4	1	04	05	00	000	00	00	Jasa Giro	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
587	51	4	1	04	06	00	000	00	00	Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
590	52	4	1	04	07	00	000	00	00	Pendapatan Bunga	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
593	53	4	1	04	08	00	000	00	00	Penerimaan atas Tuntutan Ganti Kerugian Keuangan Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
598	54	4	1	04	09	00	000	00	00	Penerimaan Komisi, Potongan, atau Bentuk Lain	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
601	55	4	1	04	10	00	000	00	00	Penerimaan Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing	0	\N	\N	\N	2001-01-01	2002-02-01	Yes	0	\N
604	56	4	1	04	11	00	000	00	00	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
617	57	4	1	04	12	01	009	00	00	Pendapatan Denda PKB-Mobil Barang/Beban-Blind Van	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
582	50	4	1	04	05	04	001	00	00	Jasa Giro pada BLUD 	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
584	50	4	1	04	05	05	001	00	00	Jasa Giro pada Rekening Dana BOS  	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
618	57	4	1	04	12	01	010	00	00	Pendapatan Denda PKB-Sepeda MotorSepeda Motor Roda Dua	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
619	57	4	1	04	12	01	011	00	00	Pendapatan Denda PKB-Sepeda MotorSepeda Motor Roda Tiga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
620	57	4	1	04	12	01	012	00	00	Pendapatan Denda PKB-Kendaraan Bermotor yang Dioperasikan di Air	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
621	57	4	1	04	12	01	013	00	00	Pendapatan Denda PKB-Kendaraan Khusus Alat Berat/Alat Besar	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
605	56	4	1	04	11	01	0	00	00	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
602	55	4	1	04	10	01	0	00	00	Penerimaan Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
599	54	4	1	04	09	01	0	00	00	Penerimaan Komisi, Potongan, atau Bentuk Lain	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
596	53	4	1	04	08	02	0	00	00	Tuntutan Ganti Kerugian Daerah terhadap Pegawai Negeri Bukan Bendahara atau Pejabat Lain	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
594	53	4	1	04	08	01	0	00	00	Tuntutan Ganti Kerugian Daerah terhadap Bendahara	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
591	52	4	1	04	07	01	0	00	00	Pendapatan Bunga atas Penempatan Uang Pemerintah Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
588	51	4	1	04	06	01	0	00	00	Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
575	50	4	1	04	05	01	0	00	00	Jasa Giro pada Kas Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
585	50	4	1	04	05	06	0	00	00	Jasa Giro Dana Kapitasi pada FKTP	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
583	50	4	1	04	05	05	0	00	00	Jasa Giro pada Rekening Dana BOS	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
581	50	4	1	04	05	04	0	00	00	Jasa Giro pada BLUD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
579	50	4	1	04	05	03	0	00	00	Jasa Giro pada Rekening Dana Cadangan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
577	50	4	1	04	05	02	0	00	00	Jasa Giro pada Kas di Bendahara	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
572	49	4	1	04	04	01	0	00	00	Hasil Kerja Sama Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
570	48	4	1	04	03	04	001	00	00	Hasil dari Bangun Serah Guna	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
568	48	4	1	04	03	03	001	00	00	Hasil dari Bangun Guna Serah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
563	48	4	1	04	03	01	0	00	00	Hasil Sewa BMD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
566	48	4	1	04	03	02	001	00	00	Hasil Kerja Sama Pemanfaatan BMD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
565	48	4	1	04	03	02	0	00	00	Hasil Kerja Sama Pemanfaatan BMD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
567	48	4	1	04	03	03	0	00	00	Hasil dari Bangun Guna Serah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
569	48	4	1	04	03	04	0	00	00	Hasil dari Bangun Serah Guna	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
622	57	4	1	04	12	01	014	00	00	Pendapatan Denda PKB-Mobil Roda Tiga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
624	57	4	1	04	12	02	001	00	00	Pendapatan Denda BBNKB-Mobil Penumpang-Sedan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
625	57	4	1	04	12	02	002	00	00	Pendapatan Denda BBNKB-Mobil Penumpang-Jeep	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
626	57	4	1	04	12	02	003	00	00	Pendapatan Denda BBNKB-Mobil Penumpang Minibus	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
627	57	4	1	04	12	02	004	00	00	Pendapatan Denda BBNKB-Mobil Bus-Microbus	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
628	57	4	1	04	12	02	005	00	00	Pendapatan Denda BBNKB-Mobil Bus-Bus	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
629	57	4	1	04	12	02	006	00	00	Pendapatan Denda BBNKB-Mobil Barang/Beban-Pick Up	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
630	57	4	1	04	12	02	007	00	00	Pendapatan Denda BBNKB-Mobil Barang/Beban-Light Truck	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
631	57	4	1	04	12	02	008	00	00	Pendapatan Denda BBNKB-Mobil Barang/Beban-Truck	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
632	57	4	1	04	12	02	009	00	00	Pendapatan Denda BBNKB-Mobil Barang/Beban-Blind Van	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
633	57	4	1	04	12	02	010	00	00	Pendapatan Denda BBNKB-Sepeda MotorSepeda Motor Roda Dua	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
634	57	4	1	04	12	02	011	00	00	Pendapatan Denda BBNKB-Sepeda MotorSepeda Motor Roda Tiga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
635	57	4	1	04	12	02	012	00	00	Pendapatan Denda BBNKB-Kendaraan Bermotor yang Dioperasikan di Air	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
636	57	4	1	04	12	02	013	00	00	Pendapatan Denda BBNKB-Kendaraan Khusus Alat Berat/Alat Besar	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
637	57	4	1	04	12	02	014	00	00	Pendapatan Denda BBNKB-Mobil Roda Tiga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
639	57	4	1	04	12	03	001	00	00	Pendapatan Denda PPBKB-Bahan Bakar Bensin	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
640	57	4	1	04	12	03	002	00	00	Pendapatan Denda PPBKB-Bahan Bakar Solar	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
641	57	4	1	04	12	03	003	00	00	Pendapatan Denda PPBKB-Bahan Bakar Gas	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
642	57	4	1	04	12	03	004	00	00	Pendapatan Denda PPBKB-Bahan Bakar Lainnya	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
643	58	4	1	04	13	00	000	00	00	Pendapatan Denda Retribusi Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
645	58	4	1	04	13	01	001	00	00	Pendapatan Denda Retribusi Pelayanan Kesehatan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
646	58	4	1	04	13	01	002	00	00	Pendapatan Denda Retribusi Pelayanan Persampahan/Kebersihan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
647	58	4	1	04	13	01	003	00	00	Pendapatan Denda Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
648	58	4	1	04	13	01	004	00	00	Pendapatan Denda Retribusi Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
649	58	4	1	04	13	01	005	00	00	Pendapatan Denda Retribusi Pelayanan Pasar	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
650	58	4	1	04	13	01	006	00	00	Pendapatan Denda Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
651	58	4	1	04	13	01	007	00	00	Pendapatan Denda Retribusi Pemeriksaan Alat Pemadam Kebakaran	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
652	58	4	1	04	13	01	008	00	00	Pendapatan Denda Retribusi Penggantian Biaya Cetak Peta	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
653	58	4	1	04	13	01	009	00	00	Pendapatan Denda Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
654	58	4	1	04	13	01	010	00	00	Pendapatan Denda Retribusi Pengolahan Limbah Cair	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
655	58	4	1	04	13	01	011	00	00	Pendapatan Denda Retribusi Pelayanan Tera/Tera Ulang	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
656	58	4	1	04	13	01	012	00	00	Pendapatan Denda Retribusi Pelayanan Pendidikan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
728	68	4	2	01	01	01	007	00	00	DBH Sumber Daya Alam (SDA) Mineral dan Batubara-Landrent	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
657	58	4	1	04	13	01	013	00	00	Pendapatan Denda Retribusi Pengawasan dan Pengendalian Menara Telekomunikasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
659	58	4	1	04	13	02	001	00	00	Pendapatan Denda Retribusi Pemakaian Kekayaan Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
660	58	4	1	04	13	02	002	00	00	Pendapatan Denda Retribusi Pasar Grosir dan/atau Pertokoan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
661	58	4	1	04	13	02	003	00	00	Pendapatan Denda Retribusi Tempat Pelelangan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
662	58	4	1	04	13	02	004	00	00	Pendapatan Denda Retribusi Terminal	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
663	58	4	1	04	13	02	005	00	00	Pendapatan Denda Retribusi Tempat Khusus Parkir	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
664	58	4	1	04	13	02	006	00	00	Pendapatan Denda Retribusi Tempat Penginapan/Pesanggrahan/Vila	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
665	58	4	1	04	13	02	007	00	00	Pendapatan Denda Retribusi Rumah Potong Hewan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
666	58	4	1	04	13	02	008	00	00	Pendapatan Denda Retribusi Pelayanan Kepelabuhanan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
667	58	4	1	04	13	02	009	00	00	Pendapatan Denda Retribusi Tempat Rekreasi dan Olahraga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
668	58	4	1	04	13	02	010	00	00	Pendapatan Denda Retribusi Pelayanan Penyeberangan Air	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
669	58	4	1	04	13	02	011	00	00	Pendapatan Denda Retribusi Penjualan Produksi Usaha Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
671	58	4	1	04	13	03	001	00	00	Pendapatan Denda Retribusi Izin Mendirikan Bangunan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
672	58	4	1	04	13	03	002	00	00	Pendapatan Denda Retribusi Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
673	58	4	1	04	13	03	003	00	00	Pendapatan Denda Retribusi Izin Trayek untuk Menyediakan Pelayanan Angkutan Umum	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
674	58	4	1	04	13	03	004	00	00	Pendapatan Denda Retribusi Izin Usaha Perikanan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
675	58	4	1	04	13	03	005	00	00	Pendapatan Denda Retribusi Pengendalian Lalu Lintas	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
676	58	4	1	04	13	03	006	00	00	Pendapatan Denda Retribusi Perpanjangan Izin Mempekerjakan Tenaga Kerja Asing (IMTA)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
658	58	4	1	04	13	02	0	00	00	Pendapatan Denda Retribusi Jasa Usaha	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
644	58	4	1	04	13	01	0	00	00	Pendapatan Denda Retribusi Jasa Umum	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
623	57	4	1	04	12	02	0	00	00	Pendapatan Denda Bea Balik Nama Kendaraan Bermotor (BBNKB)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
638	57	4	1	04	12	03	0	00	00	Pendapatan Denda Pajak Bahan Bakar Kendaraan Bermotor (PBBKB)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
677	59	4	1	04	14	00	000	00	00	Pendapatan Hasil Eksekusi atas Jaminan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
679	59	4	1	04	14	01	001	00	00	Hasil Eksekusi atas Jaminan atas Pengadaan Barang/Jasa	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
680	60	4	1	04	15	00	000	00	00	Pendapatan dari Pengembalian	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
682	60	4	1	04	15	01	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Pajak Penghasilan Pasal 21	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
684	60	4	1	04	15	02	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
686	60	4	1	04	15	03	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Gaji dan Tunjangan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
786	68	4	2	01	01	04	006	00	00	DAK Non Fisik-TPG PNSD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
688	60	4	1	04	15	04	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Perjalanan Dinas	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
690	60	4	1	04	15	05	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kecelakaan Kerja (JKK)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
692	60	4	1	04	15	06	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kematian (JKM)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
694	60	4	1	04	15	07	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan Nasional (JKN)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
695	61	4	1	04	16	00	000	00	00	Pendapatan BLUD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
697	61	4	1	04	16	01	001	00	00	Pendapatan BLUD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
698	62	4	1	04	17	00	000	00	00	Pendapatan Denda Pemanfaatan BMD yang tidak Dipisahkan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
700	62	4	1	04	17	01	001	00	00	Pendapatan Denda Pengakhiran Sewa BMD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
702	62	4	1	04	17	02	001	00	00	Pendapatan Denda Hasil dari Kerja Sama Penyediaan Infrastruktur	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
703	63	4	1	04	18	00	000	00	00	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional (JKN) pada Fasilitas Kesehatan Tingkat Pertama (FKTP)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
705	63	4	1	04	18	01	001	00	00	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional (JKN) pada Fasilitas Kesehatan Tingkat Pertama (FKTP)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
706	64	4	1	04	19	00	000	00	00	Pendapatan Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
708	64	4	1	04	19	01	001	00	00	Pendapatan Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
709	65	4	1	04	20	00	000	00	00	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
711	65	4	1	04	20	01	001	00	00	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
712	66	4	1	04	21	00	000	00	00	Pendapatan Denda atas Pelanggaran Peraturan Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
714	66	4	1	04	21	01	001	00	00	Pendapatan Denda atas Pelanggaran Peraturan Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
715	67	4	1	04	22	00	000	00	00	Pendapatan Zakat	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
717	67	4	1	04	22	01	001	00	00	Pendapatan Zakat	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
720	68	4	2	01	01	00	000	00	00	Dana Perimbangan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
722	68	4	2	01	01	01	001	00	00	DBH Pajak Bumi dan Bangunan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
723	68	4	2	01	01	01	002	00	00	DBH PPh Pasal 25 dan Pasal 29	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
724	68	4	2	01	01	01	003	00	00	DBH PPh Pasal 21	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
725	68	4	2	01	01	01	004	00	00	DBH Cukai Hasil Tembakau (CHT)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
726	68	4	2	01	01	01	005	00	00	DBH Sumber Daya Alam (SDA) Minyak Bumi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
719	0	4	2	01	0	0	000	00	00	Pendapatan Transfer Pemerintah Pusat	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
727	68	4	2	01	01	01	006	00	00	DBH Sumber Daya Alam (SDA) Gas Bumi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
729	68	4	2	01	01	01	008	00	00	Dana Bagi Hasil (DBH) Sumber Daya Alam (SDA) Mineral dan Batubara-Royalty	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
730	68	4	2	01	01	01	009	00	00	DBH Sumber Daya Alam (SDA) KehutananProvisi Sumber Daya Hutan (PSDH)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
731	68	4	2	01	01	01	010	00	00	DBH Sumber Daya Alam (SDA) KehutananIuran Izin Usaha Pemanfaatan Hutan (IIUPH)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
732	68	4	2	01	01	01	011	00	00	DBH Sumber Daya Alam (SDA) KehutananDana Reboisasi (DR)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
716	67	4	1	04	22	01	0	00	00	Pendapatan Zakat	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
713	66	4	1	04	21	01	0	00	00	Pendapatan Denda atas Pelanggaran Peraturan Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
710	65	4	1	04	20	01	0	00	00	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
707	64	4	1	04	19	01	0	00	00	Pendapatan Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
701	62	4	1	04	17	02	0	00	00	Pendapatan Denda Hasil dari Kerja Sama Penyediaan Infrastruktur	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
699	62	4	1	04	17	01	0	00	00	Pendapatan Denda Pengakhiran Sewa BMD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
696	61	4	1	04	16	01	0	00	00	Pendapatan BLUD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
693	60	4	1	04	15	07	0	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan Nasional (JKN)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
691	60	4	1	04	15	06	0	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kematian (JKM)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
689	60	4	1	04	15	05	0	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kecelakaan Kerja (JKK)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
687	60	4	1	04	15	04	0	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Perjalanan Dinas	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
683	60	4	1	04	15	02	0	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
685	60	4	1	04	15	03	0	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Gaji dan Tunjangan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
681	60	4	1	04	15	01	0	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Pajak Penghasilan Pasal 21	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
678	59	4	1	04	14	01	0	00	00	Hasil Eksekusi atas Jaminan atas Pengadaan Barang/Jasa	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
733	68	4	2	01	01	01	012	00	00	DBH Sumber Daya Alam (SDA) Perikanan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
734	68	4	2	01	01	01	013	00	00	DBH Sumber Daya Alam (SDA) Panas Bumi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
736	68	4	2	01	01	02	001	00	00	Dana Transfer Umum-Dana Alokasi Umum (DAU)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
737	68	4	2	01	01	02	002	00	00	Dana Transfer Umum-Dana Alokasi Umum (DAU) Tambahan untuk Dukungan Pendanaan Kelurahan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
781	68	4	2	01	01	04	001	00	00	DAK Non Fisik-BOS Reguler	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
782	68	4	2	01	01	04	002	00	00	DAK Non Fisik-BOS Afirmasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
783	68	4	2	01	01	04	003	00	00	DAK Non Fisik-BOS Kinerja	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
784	68	4	2	01	01	04	004	00	00	DAK Non Fisik-BOP PAUD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
785	68	4	2	01	01	04	005	00	00	DAK Non Fisik-BOP Pendidikan Kesetaraan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
787	68	4	2	01	01	04	007	00	00	DAK Non Fisik-Tamsil Guru PNSD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
788	68	4	2	01	01	04	008	00	00	DAK Non Fisik-TKG PNSD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
789	68	4	2	01	01	04	009	00	00	DAK Non Fisik-BOP Museum dan Taman Budaya-Museum	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
790	68	4	2	01	01	04	010	00	00	DAK Non Fisik-BOP Museum dan Taman Budaya-Taman Budaya	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
738	68	4	2	01	01	03	0	00	00	Dana Transfer Khusus-Dana Alokasi Khusus (DAK) Fisik	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
735	68	4	2	01	01	02	0	00	00	Dana Transfer Umum-Dana Alokasi Umum (DAU)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
779	68	4	2	01	01	03	044	00	00	DAK Fisik-Bidang Pendidikan-Afirmasi-SMA	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
778	68	4	2	01	01	03	043	00	00	DAK Fisik-Bidang Pendidikan-Afirmasi-SMP	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
777	68	4	2	01	01	03	042	00	00	DAK Fisik-Bidang Pendidikan-Afirmasi-SD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
776	68	4	2	01	01	03	041	00	00	DAK Fisik-Bidang Transportasi-Afirmasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
775	68	4	2	01	01	03	040	00	00	DAK Fisik-Bidang Sanitasi-Afirmasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
774	68	4	2	01	01	03	039	00	00	DAK Fisik-Bidang Air Minum-Afirmasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
773	68	4	2	01	01	03	038	00	00	DAK Fisik-Bidang Perumahan dan Permukiman-Afirmasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
771	68	4	2	01	01	03	036	00	00	DAK Fisik-Bidang Kesehatan-AfirmasiPenguatan Puskesmas-DTPK	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
770	68	4	2	01	01	03	035	00	00	DAK Fisik-Bidang Lingkungan Hidup dan Kehutanan-Penugasan-Kehutanan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
769	68	4	2	01	01	03	034	00	00	DAK Fisik-Bidang Lingkungan Hidup dan Kehutanan-Penugasan-Lingkungan Hidup	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
768	68	4	2	01	01	03	033	00	00	DAK Fisik-Bidang Irigasi-Penugasan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
767	68	4	2	01	01	03	032	00	00	DAK Fisik-Bidang Pasar-Penugasan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
766	68	4	2	01	01	03	031	00	00	DAK Fisik-Bidang Jalan-Penugasan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
765	68	4	2	01	01	03	030	00	00	DAK Fisik-Bidang Sanitasi-Penugasan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
764	68	4	2	01	01	03	029	00	00	DAK Fisik-Bidang Pariwisata-Penugasan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
763	68	4	2	01	01	03	028	00	00	DAK Fisik-Bidang Air Minum-Penugasan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
762	68	4	2	01	01	03	027	00	00	DAK Fisik-Bidang Kesehatan-PenugasanBalai Pelatihan Kesehatan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
761	68	4	2	01	01	03	026	00	00	DAK Fisik-Bidang Kesehatan-PenugasanPengendalian Penyakit	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
760	68	4	2	01	01	03	024	00	00	Dana Alokasi Khusus (DAK) Fisik-Bidang Kesehatan-Penugasan-Penurunan Stunting	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
759	68	4	2	01	01	03	023	00	00	DAK Fisik-Bidang Kesehatan-PenugasanPeningkatan Pelayanan Rujukan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
758	68	4	2	01	01	03	022	00	00	DAK Fisik-Bidang Pendidikan-Penugasan-SMK	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
757	68	4	2	01	01	03	021	00	00	DAK Fisik-Bidang Industri Kecil dan Menengah-Reguler	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
754	68	4	2	01	01	03	018	00	00	DAK Fisik-Bidang Pertanian-Reguler	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
753	68	4	2	01	01	03	017	00	00	DAK Fisik-Bidang Kesehatan-Reguler-KB	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
752	68	4	2	01	01	03	016	00	00	DAK Fisik-Bidang Kesehatan-RegulerPelayanan Kefarmasian dan Perbekalan Kesehatan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
750	68	4	2	01	01	03	014	00	00	DAK Fisik-Bidang Kesehatan-RegulerPelayanan Kesehatan Dasar	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
749	68	4	2	01	01	03	013	00	00	DAK Fisik-Bidang Jalan-Reguler	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
751	68	4	2	01	01	03	015	00	00	DAK Fisik-Bidang Kesehatan-RegulerPelayanan Kesehatan Rujukan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
748	68	4	2	01	01	03	012	00	00	DAK Fisik-Bidang Perumahan dan Permukiman-Reguler	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
747	68	4	2	01	01	03	011	00	00	DAK Fisik-Bidang Sanitasi-Reguler	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
746	68	4	2	01	01	03	010	00	00	DAK Fisik-Bidang Air Minum-Reguler	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
745	68	4	2	01	01	03	009	00	00	DAK Fisik-Bidang Pendidikan-RegulerOlahraga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
744	68	4	2	01	01	03	008	00	00	DAK Fisik-Bidang Pendidikan-RegulerPerpustakaan Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
743	68	4	2	01	01	03	007	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SKB	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
742	68	4	2	01	01	03	006	00	00	DAK Fisik-Bidang Pendidikan-Reguler SDLB/ SMPLB/ SMALB	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
741	68	4	2	01	01	03	005	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SMA	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
740	68	4	2	01	01	03	004	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SMP	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
739	68	4	2	01	01	03	003	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
755	68	4	2	01	01	03	019	00	00	DAK Fisik-Bidang Kelautan dan Perikanan Penugasan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
791	68	4	2	01	01	04	011	00	00	DAK Non Fisik-BOKKB-BOK	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
792	68	4	2	01	01	04	012	00	00	DAK Non Fisik-BOKKB-Akreditasi RS	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
793	68	4	2	01	01	04	013	00	00	DAK Non Fisik-BOKKB-Akreditasi Puskesmas	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
794	68	4	2	01	01	04	014	00	00	DAK Non Fisik-BOKKB-Akreditasi Labkesda	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
795	68	4	2	01	01	04	015	00	00	DAK Non Fisik-BOKKB-Jaminan Persalinan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
796	68	4	2	01	01	04	016	00	00	DAK Non Fisik-BOKKB-BOKB	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
797	68	4	2	01	01	04	017	00	00	DAK Non Fisik-PK2UKM	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
798	68	4	2	01	01	04	018	00	00	DAK Non Fisik-Dana Pelayanan Administrasi Kependudukan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
799	68	4	2	01	01	04	019	00	00	DAK Non Fisik-Dana Pelayanan Kepariwisataan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
800	68	4	2	01	01	04	020	00	00	DAK Non Fisik-Dana BLPS	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
803	69	4	2	01	02	01	001	00	00	Dana Insentif Daerah (DID)	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
804	70	4	2	01	05	00	000	00	00	Dana Desa	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
806	70	4	2	01	05	01	001	00	00	Dana Desa	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
808	71	4	2	02	01	00	000	00	00	Pendapatan Bagi Hasil	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
810	71	4	2	02	01	01	001	00	00	Pendapatan Bagi Hasil Pajak Kendaraan Bermotor	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
811	71	4	2	02	01	01	002	00	00	Pendapatan Bagi Hasil Bea Balik Nama Kendaraan Bermotor	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
812	71	4	2	02	01	01	003	00	00	Pendapatan Bagi Hasil Pajak Bahan Bakar Kendaraan Bermotor	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
813	71	4	2	02	01	01	004	00	00	Pendapatan Bagi Hasil Pajak Air Permukaan	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
814	71	4	2	02	01	01	005	00	00	Pendapatan Bagi Hasil Pajak Rokok	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
817	72	4	3	01	01	00	000	00	00	Pendapatan Hibah dari Pemerintah Pusat	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
820	72	4	3	01	02	00	000	00	00	Pendapatan Hibah dari Pemerintah Daerah Lainnya	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
823	74	4	3	01	03	00	000	00	00	Pendapatan Hibah dari Kelompok Masyarakat/Perorangan Dalam Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
826	75	4	3	01	04	00	000	00	00	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Dalam Negeri/Luar Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
835	76	4	3	01	05	00	000	00	00	Sumbangan Pihak Ketiga/Sejenis	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
838	0	4	3	02	00	00	000	00	00	Dana Darurat	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
839	77	4	3	02	01	00	000	00	00	Dana Darurat	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
841	77	4	3	02	01	01	001	00	00	Dana Darurat pada Tahap Pasca Bencana	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
842	0	4	3	03	00	00	000	00	00	Lain-lain Pendapatan Sesuai dengan Ketentuan Peraturan Perundang-Undangan	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
843	78	4	3	03	01	00	000	00	00	Lain-lain Pendapatan	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
845	78	4	3	03	01	01	001	00	00	Pendapatan Hibah Dana BOS	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
847	78	4	3	03	01	02	001	00	00	Pendapatan atas Pengembalian Hibah Pada Pemerintah	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
848	78	4	3	03	01	02	002	00	00	Pendapatan atas Pengembalian Hibah pada Pemerintah Daerah Lainnya	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
815	0	4	3	0	0	0	000	00	00	LAIN-LAIN PENDAPATAN DAERAH YANG SAH	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
816	0	4	3	01	0	0	000	00	00	Pendapatan Hibah	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
807	0	4	2	02	0	0	000	00	00	Pendapatan Transfer Antar Daerah	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
849	78	4	3	03	01	02	003	00	00	Pendapatan atas Pengembalian Hibah pada BUMN	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
850	78	4	3	03	01	02	004	00	00	Pendapatan atas Pengembalian Hibah pada BUMD	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
822	73	4	3	01	02	01	001	00	00	Pendapatan Hibah dari Pemerintah Daerah  	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
825	74	4	3	01	03	01	001	00	00	Pendapatan Hibah dari Kelompok Masyarakat/Perorangan Dalam Negeri  	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
828	75	4	3	01	04	01	001	00	00	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Dalam Negeri/Luar Negeri  	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
830	75	4	3	01	04	02	001	00	00	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Luar Negeri  	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
832	75	4	3	01	04	03	001	00	00	Pendapatan Hibah dari Lembaga/Organisasi Swasta Dalam Negeri  	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
834	75	4	3	01	04	04	001	00	00	Pendapatan Hibah dari Lembaga/Organisasi Swasta Luar Negeri  	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
837	76	4	3	01	05	01	001	00	00	Sumbangan Pihak Ketiga/Sejenis  	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
851	78	4	3	03	01	02	005	00	00	Pendapatan atas Pengembalian Hibah pada Badan, Lembaga, dan Organisasi Kemasyarakatan yang Berbadan hukum Indonesia	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
852	78	4	3	03	01	02	006	00	00	Pendapatan atas Pengembalian Hibah Bantuan Keuangan pada Partai Politik	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
252	11	4	1	01	16	01	001	00	00	BPHTB-Pemindahan Hak	5	0	0	0	2007-01-01	2025-01-01	Yes	0	\N
253	11	4	1	01	16	02	001	00	00	BPHTB-Pemberian Hak Baru	5	0	0	0	2007-01-01	2025-01-01	Yes	0	\N
313	7	4	1	04	12	11	001	00	00	Pendapatan Denda Pajak Parkir	0	\N	\N	\N	2001-01-01	2025-01-01	\N	0	\N
844	78	4	3	03	01	01	0	00	00	Pendapatan Hibah Dana BOS	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
840	77	4	3	02	01	01	0	00	00	Dana Darurat	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
836	76	4	3	01	05	01	0	00	00	Sumbangan Pihak Ketiga/Sejenis	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
827	75	4	3	01	04	01	0	00	00	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Dalam Negeri/Luar Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
829	75	4	3	01	04	02	0	00	00	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Luar Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
831	75	4	3	01	04	03	0	00	00	Pendapatan Hibah dari Lembaga/Organisasi Swasta Dalam Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
833	75	4	3	01	04	04	0	00	00	Pendapatan Hibah dari Lembaga/Organisasi Swasta Luar Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
824	74	4	3	01	03	01	0	00	00	Pendapatan Hibah dari Kelompok Masyarakat/Perorangan Dalam Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
821	73	4	3	01	02	01	0	00	00	Pendapatan Hibah dari Pemerintah Daerah Lainnya	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
818	72	4	3	01	01	01	0	00	00	Pendapatan Hibah dari Pemerintah Pusat	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
809	71	4	2	02	01	01	0	00	00	Pendapatan Bagi Hasil Pajak	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
805	70	4	2	01	05	01	0	00	00	Dana Desa	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
802	69	4	2	01	02	01	0	00	00	Dana Insentif Daerah (DID)	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
270	1	4	1	04	12	06	000	00	00	Pendapatan Denda Pajak Hotel	\N	\N	\N	\N	2001-01-01	2000-04-01	Yes	0	\N
128	0	4	1	02	0	0	000	00	00	Retribusi Daerah	0	0	0	0	2021-01-01	2025-01-01	Yes	0	\N
475	0	4	1	04	0	0	000	00	00	Lain-lain PAD yang Sah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
718	0	4	2	0	0	0	000	00	00	PENDAPATAN TRANSFER	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
562	48	4	1	04	03	00	000	00	00	Hasil Pemanfaatan BMD yang Tidak Dipisahkan	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
4	1	4	1	01	06	00	000	00	00	Pajak Hotel	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
409	26	4	1	02	02	01	0	00	00	Retribusi Pemakaian Kekayaan Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
846	78	4	3	03	01	02	0	00	00	Pendapatan atas Pengembalian Hibah	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
780	68	4	2	01	01	04	0	00	00	Dana Transfer Khusus-Dana Alokasi Khusus (DAK) Non Fisik	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
721	68	4	2	01	01	01	0	00	00	Dana Transfer Umum-Dana Bagi Hasil (DBH)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
704	63	4	1	04	18	01	0	00	00	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional (JKN) pada Fasilitas Kesehatan Tingkat Pertama (FKTP)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
670	58	4	1	04	13	03	0	00	00	Pendapatan Denda Retribusi Perizinan Tertentu	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
608	57	4	1	04	12	01	0	00	00	Pendapatan Denda Pajak Kendaraan Bermotor (PKB)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
559	47	4	1	04	02	06	0	00	00	Hasil Selisih Lebih Tukar Menukar Aset Lainnya	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
503	46	4	1	04	01	04	0	00	00	Hasil Penjualan Jalan, Jaringan, dan Irigasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
473	45	4	1	03	02	05	0	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Sanitasi)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
451	41	4	1	02	03	04	0	00	00	Retribusi Izin Usaha Perikanan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
449	40	4	1	02	03	03	0	00	00	Retribusi Izin Trayek untuk Menyediakan Pelayanan Angkutan Umum	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0	\N
387	20	4	1	02	01	08	0	00	00	Retribusi Penggantian Biaya Cetak Peta	0	\N	\N	\N	2001-01-01	2002-01-17	\N	0	\N
801	69	4	2	01	02	00	000	00	00	Dana Insentif Daerah (DID)	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0	\N
772	68	4	2	01	01	03	037	00	00	DAK Fisik-Bidang Kesehatan-AfirmasiPenguatan Pembangunan Rumah Sakit Pratama	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0	\N
854	68	4	2	01	01	03	025	00	00	DAK Fisik-Bidang Pertanian-Penugasan-Pembangunan/Renovasi Sarana dan Prasarana Fisik Dasar Pembangunan Pertanian	0	\N	\N	\N	2021-01-01	2021-12-31	\N	0	\N
855	68	4	2	01	01	03	002	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SD	0	\N	\N	\N	2021-01-01	2021-12-31	\N	0	\N
856	68	4	2	01	01	03	001	00	00	DAK Fisik-Bidang Pendidikan-Reguler-PAUD	0	\N	\N	\N	2021-01-01	2021-12-31	\N	0	\N
857	68	4	2	01	01	04	020	00	00	DAK Non Fisik-BOKKB-Pengawasan Obat dan Makanan	0	\N	\N	\N	2021-01-01	2021-12-31	\N	0	\N
265	1	4	1	01	06	07	001	00	00	Penginapan dan sejenisnya	10	\N	\N	\N	2001-01-01	2022-01-01	Yes	0	\N
859	4	4	1	01	09	05	000	00	00	Pajak Reklame Berjalan	10	0	0	0	2021-01-01	2025-12-31	Yes	0	\N
860	4	4	1	01	09	05	001	00	00	Reklame Berjalan	10	0	0	0	2021-01-01	2025-12-31	Yes	0	\N
862	68	4	2	01	01	04	021	00	00	DAK Non Fisik - Dana Ketahanan Pangan Dan Pertanian	0	0	\N	\N	2021-01-01	2021-12-31	\N	0	\N
858	36	4	1	02	02	11	004	00	00	Retribusi Penjualan Produksi hasil Usaha Daerah berupa Bibit atau Benih Ikan	0	\N	\N	\N	2021-01-01	2021-12-31	\N	0	\N
863	68	4	2	01	01	03	045	\N	\N	DAK Fisik-Bidang Kesehatan dan KB-Reguler-Peningkatan Kesiapan Sistem Kesehatan	0	\N	\N	\N	2021-01-01	2023-12-31	\N	0	\N
865	68	4	2	01	01	04	022	00	00	DAK Non Fisik-Fasilitasi Penanaman Modal	0	\N	\N	\N	2021-01-01	2021-12-31	\N	0	\N
864	68	4	2	01	01	03	046	0 	0 	DAK Fisik-Bidang Kesehatan dan KB-Penugasan-Keluarga Berencana	0	\N	\N	\N	2021-01-01	2023-12-31	\N	0	\N
882	6	4	1	01	14	28	001	00	00	Tanah	20	25000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
109	6	4	1	01	14	24	001	00	00	Pasir Kuarsa	\N	25000	\N	\N	2001-01-01	2006-01-01	Yes	0	\N
263	6	4	1	01	14	47	001	00	00	Pasir Urug / Pasir Pulau	\N	15000	0	0	2007-01-01	2002-02-01	Yes	0	\N
\.


--
-- Data for Name: s_rekening_baru_copy1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_rekening_baru_copy1 (s_idkorek, s_jenisobjek, s_tipekorek, s_kelompokkorek, s_jeniskorek, s_objekkorek, s_rinciankorek, s_sub1korek, s_sub2korek, s_sub3korek, s_namakorek, s_persentarifkorek, s_tarifdasarkorek, s_voldasarkorek, s_tariftambahkorek, s_tglawalkorek, s_tglakhirkorek, t_berdasarmasa, is_deluser) FROM stdin;
1	0	4	0	0	0	0	000	00	00	PENDAPATAN DAERAH	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
2	0	4	1	0	0	0	000	00	00	PENDAPATAN ASLI DAERAH	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
3	0	4	1	01	0	0	000	00	00	HASIL PAJAK DAERAH	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
4	1	4	1	01	06	00	000	00	00	Pajak Hotel	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
5	1	4	1	01	06	01	000	00	00	Pajak Hotel	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
6	1	4	1	01	06	01	001	00	00	Hotel	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
7	1	4	1	01	06	02	000	00	00	Pajak Motel	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
8	1	4	1	01	06	02	001	00	00	Motel	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
9	1	4	1	01	06	03	000	00	00	Pajak Losmen	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
10	1	4	1	01	06	03	001	00	00	Losmen	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
11	1	4	1	01	06	04	000	00	00	Pajak Gubuk Pariwisata	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
12	1	4	1	01	06	04	001	00	00	Gubuk Pariwisata	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
13	1	4	1	01	06	05	000	00	00	Pajak Wisma Pariwisata	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
14	5	4	1	01	10	02	002	00	00	Pajak Penerangan Jalan sumber lain (Non Industri)	7	\N	\N	\N	2007-01-01	2002-02-01	Yes	0
15	1	4	1	01	06	06	000	00	00	Pajak Pesanggrahan	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
16	1	4	1	01	06	06	001	00	00	Pesanggrahan	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
17	1	4	1	01	06	07	000	00	00	Rumah Penginapan dan sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
18	1	4	1	01	06	08	001	00	00	Rumah Kos dengan jumlah kamar lebih dari 10 (sepuluh)	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
19	2	4	1	01	07	00	000	00	00	Pajak Restoran	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
20	2	4	1	01	07	01	000	00	00	Pajak Restoran dan sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
21	2	4	1	01	07	01	001	00	00	Restoran dan dan sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
22	2	4	1	01	07	02	000	00	00	Pajak Rumah Makan dan sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
23	2	4	1	01	07	02	001	00	00	Rumah Makan dan sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
24	2	4	1	01	07	03	000	00	00	Pajak Kafetaria dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
25	2	4	1	01	07	03	001	00	00	Kafetaria dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
27	2	4	1	01	07	04	000	00	00	Pajak Kantin dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
28	2	4	1	01	07	04	001	00	00	Kantin Kantin dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
29	2	4	1	01	07	05	000	00	00	Pajak Warung dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
30	2	4	1	01	07	05	001	00	00	Warung dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
31	2	4	1	01	07	06	000	00	00	Pajak Bar dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
32	2	4	1	01	07	06	001	00	00	Bar dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
33	2	4	1	01	07	07	000	00	00	Pajak  Jasa Boga/Katering dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
34	2	4	1	01	07	07	001	00	00	Jasa Boga /Katering dan Sejenisnya	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
35	3	4	1	01	08	00	000	00	00	Pajak Hiburan	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
36	3	4	1	01	08	01	000	00	00	Pajak Tontonan Film / Bioskop	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
37	3	4	1	01	08	01	001	00	00	Tontonan Film / Bioskop	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
38	3	4	1	01	08	02	000	00	00	Pajak Pagelaran Kesenian/Musik/Tari/ Busana	5	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
39	3	4	1	01	08	02	001	00	00	Pagelaran Kesenian/Musik/Tari/ Busana	5	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
40	3	4	1	01	08	03	000	00	00	Pajak Kontes Kecantikan, Binaraga, dan Sejenisnya 	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
41	3	4	1	01	08	03	001	00	00	Kontes Kecantikan, Binaraga, dan Sejenisnya 	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
42	3	4	1	01	08	04	000	00	00	Pajak Pameran	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
43	3	4	1	01	08	04	001	00	00	Pameran	10	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
44	3	4	1	01	08	05	000	00	00	Pajak Diskotik, Karaoke, Klab Malam dan sejenisnya	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
45	3	4	1	01	08	05	001	00	00	Diskotik, Karaoke, Klab Malam dan sejenisnya	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
46	3	4	1	01	08	06	000	00	00	Pajak Sirkus / Akrobat/Sulap	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
47	3	4	1	01	08	06	001	00	00	Sirkus / Akrobat/Sulap	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
48	3	4	1	01	08	07	000	00	00	Pajak Permainan Bilyar dan  Bowling	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
49	3	4	1	01	08	07	001	00	00	Permainan Bilyar dan  Bowling	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
50	3	4	1	01	08	08	000	00	00	Pajak Pacuan Kuda, Kendaraan Bermotor, Permainan Ketangkasan	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
51	3	4	1	01	08	08	001	00	00	Pacuan Kuda, Kendaraan Bermotor, Permainan Ketangkasan	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
52	3	4	1	01	08	09	000	00	00	Pajak  Panti  Pijat,  Refleksi,  Mandi  Uap/Spa dan Pusat Kebugaran (Fitness Center)	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
53	3	4	1	01	08	09	001	00	00	Panti  Pijat,  Refleksi,  Mandi  Uap/Spa dan Pusat Kebugaran (Fitness Center)	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
54	3	4	1	01	08	10	000	00	00	Pertandingan Olahraga	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
55	3	4	1	01	08	10	001	00	00	Pertandingan Olahraga	15	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
56	4	4	1	01	09	00	000	00	00	Pajak Reklame	\N	\N	\N	\N	2006-01-01	2007-01-01	Yes	0
57	4	4	1	01	09	04	000	00	00	Reklame Selebaran	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0
58	4	4	1	01	09	01	000	00	00	Pajak Reklame Papan/Billboard/Videotron/Megatron	\N	\N	\N	\N	2002-01-01	2002-01-01	yes	0
59	4	4	1	01	09	01	001	00	00	Reklame Papan/Billboard/Videotron/Megatron	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0
60	4	4	1	01	09	02	000	00	00	Pajak Reklame Kain	\N	\N	\N	\N	2002-01-01	2002-01-01	yes	0
61	4	4	1	01	09	02	001	00	00	Reklame Kain	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0
62	4	4	1	01	09	03	000	00	00	Pajak Reklame melekat/Stiker	\N	\N	\N	\N	2002-01-01	2002-01-01	yes	0
63	4	4	1	01	09	03	001	00	00	Reklame melekat/Stiker	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0
64	4	4	1	01	09	04	000	00	00	Pajak Reklame Selebaran	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0
65	4	4	1	01	09	04	001	00	00	Reklame Selebaran	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0
66	4	4	1	01	09	06	000	00	00	Pajak Reklame Udara	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0
67	4	4	1	01	09	06	001	00	00	Reklame Udara	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0
68	4	4	1	01	09	07	000	00	00	Pajak Reklame Apung	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0
69	4	4	1	01	09	07	001	00	00	Reklame Apung	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0
70	4	4	1	01	09	08	000	00	00	Pajak Reklame Suara	20	\N	\N	\N	2006-01-01	2007-01-01	Yes	0
71	4	4	1	01	09	08	001	00	00	Reklame Suara	20	\N	\N	\N	2006-01-01	2007-01-01	Yes	0
73	4	4	1	01	09	09	001	00	00	Rekame Filem/Slide	20	\N	\N	\N	2006-01-01	2007-01-01	Yes	0
74	4	4	1	01	09	10	000	00	00	Pajak Reklame Peragaan	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0
75	4	4	1	01	09	10	001	00	00	Reklame Peragaan	10	\N	\N	\N	2007-01-01	2007-01-01	yes	0
76	5	4	1	01	10	00	000	00	00	Pajak Penerangan Jalan	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
77	5	4	1	01	10	01	001	00	00	Pajak Penerangan Jalan dihasilkan sendiri	1.5	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
78	5	4	1	01	10	02	001	00	00	Pajak Penerangan Jalan sumber lain (Industri)	3	\N	\N	\N	2001-01-01	2002-02-01	Yes	0
79	7	4	1	01	11	00	000	00	00	Pajak Parkir	20	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
80	7	4	1	01	11	01	000	00	00	Pajak Parkir	20	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
81	8	4	1	01	12	00	000	00	00	Pajak Air Tanah	20	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
82	8	4	1	01	12	01	001	00	00	Air Tanah	20	2668	\N	\N	2001-01-01	2006-01-01	Yes	0
83	9	4	1	01	13	00	000	00	00	Pajak Sarang Burung Walet	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
84	9	4	1	01	13	01	000	00	00	Pajak Sarang Burung Walet	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
85	6	4	1	01	14	00	000	00	00	Pajak Mineral Bukan Logam dan Batuan	0	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
86	6	4	1	01	14	01	001	00	00	Asbes	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
87	6	4	1	01	14	02	001	00	00	Batu Tulis	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
88	6	4	1	01	14	03	001	00	00	Batu Setengah Permata	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
89	6	4	1	01	14	04	001	00	00	Batu Kapur	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
90	6	4	1	01	14	05	001	00	00	Batu Apung	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
91	6	4	1	01	14	06	001	00	00	Batu Permata	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
92	6	4	1	01	14	07	001	00	00	Bentonit	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
93	6	4	1	01	14	08	001	00	00	Dolomit	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
94	6	4	1	01	14	09	001	00	00	Feldspar	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
95	6	4	1	01	14	10	001	00	00	Garam Batu (Halite)	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
96	6	4	1	01	14	11	001	00	00	Grafit	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
97	6	4	1	01	14	12	001	00	00	Granit / Andesit	5	150000	\N	\N	2001-01-01	2006-01-01	Yes	0
98	6	4	1	01	14	13	001	00	00	Gips	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
99	6	4	1	01	14	14	001	00	00	Kalsit	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
100	6	4	1	01	14	15	001	00	00	Kaolin	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
101	6	4	1	01	14	16	001	00	00	Leusit	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
102	6	4	1	01	14	17	001	00	00	Magnesit	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
103	6	4	1	01	14	18	001	00	00	Mika	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
104	6	4	1	01	14	19	001	00	00	Marmer	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
105	6	4	1	01	14	20	001	00	00	Nitrat	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
106	6	4	1	01	14	21	001	00	00	Opsidien	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
107	6	4	1	01	14	22	001	00	00	Oker	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
108	6	4	1	01	14	23	001	00	00	Pasir dan kerikil	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
109	6	4	1	01	14	24	001	00	00	Pasir Kuarsa	15	60000	\N	\N	2001-01-01	2006-01-01	Yes	0
110	6	4	1	01	14	25	001	00	00	Perlit	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
111	6	4	1	01	14	26	001	00	00	Phospat	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
112	6	4	1	01	14	27	001	00	00	Talk	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
113	6	4	1	01	14	28	001	00	00	Tanah Serap (Fullers earth)	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
114	6	4	1	01	14	29	001	00	00	Tanah Diatome	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
115	6	4	1	01	14	30	001	00	00	Tanah Liat	5	80000	\N	\N	2001-01-01	2006-01-01	Yes	0
116	6	4	1	01	14	31	001	00	00	Tawas (Alum)	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
117	6	4	1	01	14	32	001	00	00	Tras	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
118	6	4	1	01	14	33	001	00	00	Yarosif	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
119	6	4	1	01	14	34	001	00	00	Zeolit	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
120	6	4	1	01	14	35	001	00	00	Basal	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
121	6	4	1	01	14	36	001	00	00	Trakit	5	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
122	6	4	1	01	14	37	001	00	00	Mineral bukan logam dan lainnya	15	5000	\N	\N	2001-01-01	2006-01-01	Yes	0
123	10	4	1	01	15	00	000	00	00	Pajak  Bumi  dan  Bangunan  Perdesaan  dan Perkotaan (PBBP2)	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
124	10	4	1	01	15	01	001	00	00	PBBP2	2	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
125	11	4	1	01	16	00	000	00	00	Bea Perolehan Hak Atas Tanah dan Bangunan (BPHTB)	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
126	11	4	1	01	16	01	000	00	00	BPHTB - Pemindahan Hak	5	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
127	11	4	1	01	16	02	000	00	00	BPHTB - Pemberian Hak Baru	5	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
254	6	4	1	01	14	38	001	00	00	Zirkon	15	1000000	0	0	2007-01-01	2002-02-01	Yes	0
255	6	4	1	01	14	39	001	00	00	Intan	15	5000000	0	0	2007-01-01	2002-02-01	Yes	0
256	6	4	1	01	14	40	001	00	00	Batu Belah > 5cm (Granit/Andesit/Granodiorit)	5	150000	0	0	2007-01-01	2002-02-01	Yes	0
72	4	4	1	01	09	09	000	00	00	Pajak Rekame Filem/Slide	20	\N	\N	\N	2006-01-01	2025-01-01	Yes	0
257	6	4	1	01	14	41	001	00	00	Batu Split 1-5 cm (Granit/Andesit/Granodiorit)	5	175000	0	0	2007-01-01	2002-02-01	Yes	0
258	6	4	1	01	14	42	001	00	00	Tanah Sirtu	5	125000	0	0	2007-01-01	2002-02-01	Yes	0
259	6	4	1	01	14	43	001	00	00	Tanah Kuning	5	90000	0	0	2007-01-01	2002-02-01	Yes	0
260	6	4	1	01	14	44	001	00	00	Tanah Urug	5	80000	0	0	2007-01-01	2002-02-01	Yes	0
261	6	4	1	01	14	45	001	00	00	Tanah Merah (Lateri)	5	90000	0	0	2007-01-01	2002-02-01	Yes	0
262	6	4	1	01	14	46	001	00	00	Pasir Beton	5	60000	0	0	2007-01-01	2002-02-01	Yes	0
263	6	4	1	01	14	47	001	00	00	Pasir Urug	5	40000	0	0	2007-01-01	2002-02-01	Yes	0
264	6	4	1	01	14	48	001	00	00	Batu Bata / Genteng	5	600	0	0	2007-01-01	2002-02-01	Yes	0
265	1	4	1	01	06	07	001	00	00	Penginapan dan sejenisnya	10	0	0	0	2001-01-01	2004-01-01	Yes	0
266	1	4	1	01	06	08	000	00	00	Pajak Rumah Kos dengan Jumlah Kamar \nLebih dari 10 (Sepuluh)	10	0	0	0	2001-01-01	2004-01-01	Yes	0
267	8	4	1	01	12	01	000	00	0	Pajak Air Tanah	20	0	0	0	2001-01-01	2002-02-01	Yes	0
268	5	4	1	01	10	01	000	00	00	Pajak Penerangan Jalan dihasilkan sendiri	1.5	0	0	0	2001-01-01	2002-02-01	Yes	0
269	5	4	1	01	10	02	000	00	00	Pajak Penerangan Jalan sumber lain	3	0	0	0	2001-01-01	2002-02-01	Yes	0
270	1	4	1	04	12	06	000	00	00	Pendapatan Denda Pajak Hotel	\N	\N	\N	\N	2001-01-01	2000-04-01	\N	0
271	1	4	1	04	12	06	001	00	00	Pendapatan Denda Pajak Hotel	\N	\N	\N	\N	2001-01-01	2008-05-01	\N	0
272	1	4	1	04	12	06	002	00	00	Pendapatan Denda Pajak Motel	\N	\N	\N	\N	2001-01-01	2006-07-01	\N	0
273	1	4	1	04	12	06	003	00	00	Pendapatan Denda Pajak Losmen	\N	\N	\N	\N	2001-01-01	2004-09-01	\N	0
274	1	4	1	04	12	06	004	00	00	Pendapatan Denda Pajak Gubuk Pariwisata	\N	\N	\N	\N	2001-01-01	2002-11-01	\N	0
275	1	4	1	04	12	06	005	00	00	Pendapatan Denda Pajak Wisma Pariwisata	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
276	1	4	1	04	12	06	006	00	00	Pendapatan Denda Pajak Pesanggrahan	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
277	1	4	1	04	12	06	007	00	00	Pendapatan Denda Pajak Rumah Penginapan dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
278	1	4	1	04	12	06	008	00	00	Pendapatan Denda Pajak Rumah Kos dengan Jumlah Kamar Lebih dari 10 (Sepuluh)	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
279	2	4	1	04	12	07	000	00	00	Pendapatan Denda Pajak Restoran	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
280	2	4	1	04	12	07	001	00	00	Pendapatan Denda Pajak Restoran dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
281	2	4	1	04	12	07	002	00	00	Pendapatan Denda Pajak Rumah Makan dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
282	2	4	1	04	12	07	003	00	00	Pendapatan Denda Pajak Kafetaria dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
283	2	4	1	04	12	07	004	00	00	Pendapatan Denda Pajak Kantin dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
284	2	4	1	04	12	07	005	00	00	Pendapatan Denda Pajak Warung dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
285	2	4	1	04	12	07	006	00	00	Pendapatan Denda Pajak Bar dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
286	2	4	1	04	12	07	007	00	00	Pendapatan Jasa Boga/Katering dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
287	3	4	1	04	12	08	000	00	00	Pendapatan Denda Pajak Hiburan	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
288	3	4	1	04	12	08	001	00	00	Pendapatan Denda Pajak Tontonan Film	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
289	3	4	1	04	12	08	002	00	00	Pendapatan Denda Pajak Pagelaran	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
290	3	4	1	04	12	08	003	00	00	Pendapatan Denda Pajak Kontes Kecantikan, Binaraga, dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
291	3	4	1	04	12	08	004	00	00	Pendapatan Denda Pajak Pameran	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
292	3	4	1	04	12	08	005	00	00	Pendapatan Denda Pajak Diskotik, Karaoke, Klub Malam, dan Sejenisnya	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
293	3	4	1	04	12	08	006	00	00	Pendapatan Denda Pajak Sirkus/Akrobat/ Sulap	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
294	3	4	1	04	12	08	007	00	00	Pendapatan Denda Pajak Permainan Biliar dan Bowling	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
295	3	4	1	04	12	08	008	00	00	Pendapatan Denda Pajak Pacuan Kuda, Kendaraan Bermotor, dan Permainan Ketangkasan	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
296	3	4	1	04	12	08	009	00	00	Pendapatan Denda Pajak Panti Pijat, Refleksi, Mandi Uap/Spa, dan Pusat Kebugaran (Fitness Center	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
297	3	4	1	04	12	08	010	00	00	Pendapatan Denda Pajak Pertandingan Olahraga	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
298	4	4	1	04	12	09	000	00	00	Pendapatan Denda Pajak Reklame	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
299	4	4	1	04	12	09	001	00	00	Pendapatan Denda Pajak Reklame Papan/ Billboard/Videotron/Megatron	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
300	4	4	1	04	12	09	002	00	00	Pendapatan Denda Pajak Reklame Kain	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
301	4	4	1	04	12	09	003	00	00	Pendapatan Denda Pajak Reklame Melekat/Stiker	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
302	4	4	1	04	12	09	004	00	00	Pendapatan Denda Pajak Reklame Selebaran	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
303	4	4	1	04	12	09	005	00	00	Pendapatan Denda Pajak Reklame Berjalan	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
304	4	4	1	04	12	09	006	00	00	Pendapatan Denda Pajak Reklame Udara	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
305	4	4	1	04	12	09	007	00	00	Pendapatan Denda Pajak Reklame Apung	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
306	4	4	1	04	12	09	008	00	00	Pendapatan Denda Pajak Reklame Suara	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
307	4	4	1	04	12	09	009	00	00	Pendapatan Denda Pajak Reklame Film/Slide	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
308	4	4	1	04	12	09	010	00	00	Pendapatan Denda Pajak Reklame Peragaan	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
309	5	4	1	04	12	10	000	00	00	Pendapatan Denda Pajak Penerangan Jalan	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
310	5	4	1	04	12	10	001	00	00	Pendapatan Denda Pajak Penerangan Jalan Dihasilkan Sendiri	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
311	5	4	1	04	12	10	002	00	00	Pendapatan Denda Pajak Penerangan Jalan Sumber Lain	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
312	7	4	1	04	12	11	000	00	00	Pendapatan Denda Pajak Parkir	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
314	8	4	1	04	12	12	000	00	00	Pendapatan Denda Pajak Air Tanah	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
315	8	4	1	04	12	12	001	00	00	Pendapatan Denda Pajak Air Tanah	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
316	9	4	1	04	12	13	000	00	00	Pendapatan Denda Pajak Sarang Burung Walet	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
317	9	4	1	04	12	13	001	00	00	Pendapatan Denda Pajak Sarang Burung Walet	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
318	6	4	1	04	12	14	000	00	00	Pendapatan Denda Pajak Mineral Bukan Logam dan Batuan	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
319	6	4	1	04	12	14	001	00	00	Pendapatan Denda Pajak Asbes	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
320	6	4	1	04	12	14	002	00	00	Pendapatan Denda Pajak Batu Tulis	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
321	6	4	1	04	12	14	003	00	00	Pendapatan Denda Pajak Batu Setengah Permata	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
322	6	4	1	04	12	14	004	00	00	Pendapatan Denda Pajak Batu Kapur	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
323	6	4	1	04	12	14	005	00	00	Pendapatan Denda Pajak Batu Apung	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
324	6	4	1	04	12	14	006	00	00	Pendapatan Denda Pajak Batu Permata	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
325	6	4	1	04	12	14	007	00	00	Pendapatan Denda Pajak Bentonit	\N	\N	\N	\N	2001-01-01	2000-03-01	\N	0
326	6	4	1	04	12	14	008	00	00	Pendapatan Denda Pajak Dolomit	\N	\N	\N	\N	2001-01-01	2008-04-01	\N	0
327	6	4	1	04	12	14	009	00	00	Pendapatan Denda Pajak Felspar	\N	\N	\N	\N	2001-01-01	2006-06-01	\N	0
328	6	4	1	04	12	14	010	00	00	Pendapatan Denda Pajak Garam Batu (Halite)	\N	\N	\N	\N	2001-01-01	2004-08-01	\N	0
329	6	4	1	04	12	14	011	00	00	Pendapatan Denda Pajak Grafit	\N	\N	\N	\N	2001-01-01	2002-10-01	\N	0
330	6	4	1	04	12	14	012	00	00	Pendapatan Denda Pajak Granit/Andesit	\N	\N	\N	\N	2001-01-01	2000-12-01	\N	0
331	6	4	1	04	12	14	013	00	00	Pendapatan Denda Pajak Gips	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
332	6	4	1	04	12	14	014	00	00	Pendapatan Denda Pajak Kalsit	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
333	6	4	1	04	12	14	015	00	00	Pendapatan Denda Pajak Kaolin	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
334	6	4	1	04	12	14	016	00	00	Pendapatan Denda Pajak Leusit	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
335	6	4	1	04	12	14	017	00	00	Pendapatan Denda Pajak Magnesit	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
336	6	4	1	04	12	14	018	00	00	Pendapatan Denda Pajak Mika	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
337	6	4	1	04	12	14	019	00	00	Pendapatan Denda Pajak Marmer	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
338	6	4	1	04	12	14	020	00	00	Pendapatan Denda Pajak Nitrat	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
339	6	4	1	04	12	14	021	00	00	Pendapatan Denda Pajak Opsidien	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
340	6	4	1	04	12	14	022	00	00	Pendapatan Denda Pajak Oker	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
341	6	4	1	04	12	14	023	00	00	Pendapatan Denda Pajak Pasir dan Kerikil	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
342	6	4	1	04	12	14	024	00	00	Pendapatan Denda Pajak Pasir Kuarsa	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
343	6	4	1	04	12	14	025	00	00	Pendapatan Denda Pajak Perlit	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
344	6	4	1	04	12	14	026	00	00	Pendapatan Denda Pajak Phospat	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
345	6	4	1	04	12	14	027	00	00	Pendapatan Denda Pajak Talk	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
346	6	4	1	04	12	14	028	00	00	Pendapatan Denda Pajak Tanah Serap (Fullers Earth)	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
347	6	4	1	04	12	14	029	00	00	Pendapatan Denda Pajak Tanah Diatome	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
348	6	4	1	04	12	14	030	00	00	Pendapatan Denda Pajak Tanah Liat	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
349	6	4	1	04	12	14	031	00	00	Pendapatan Denda Pajak Tawas (Alum)	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
350	6	4	1	04	12	14	032	00	00	Pendapatan Denda Pajak Tras	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
351	6	4	1	04	12	14	033	00	00	Pendapatan Denda Pajak Yarosif	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
352	6	4	1	04	12	14	034	00	00	Pendapatan Denda Pajak Zeolit	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
353	6	4	1	04	12	14	035	00	00	Pendapatan Denda Pajak Basal	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
354	6	4	1	04	12	14	036	00	00	Pendapatan Denda Pajak Trakit	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
355	6	4	1	04	12	14	037	00	00	Pendapatan Denda Pajak Mineral Bukan Logam dan Batuan Lainnya	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
356	10	4	1	04	12	15	000	00	00	Pendapatan Denda Pajak Bumi dan Bangunan Perdesaan dan Perkotaan (PBBP2)	\N	\N	\N	\N	2001-01-01	2008-01-01	\N	0
357	10	4	1	04	12	15	001	00	00	Pendapatan Denda Pajak Bumi dan Bangunan Perdesaan dan Perkotaan (PBBP2)	\N	\N	\N	\N	2001-01-01	2006-01-01	\N	0
358	11	4	1	04	12	16	000	00	00	Pendapatan Denda Bea Perolehan Hak atas Tanah dan Bangunan (BPHTB)	\N	\N	\N	\N	2001-01-01	2004-01-01	\N	0
359	11	4	1	04	12	16	001	00	00	Pendapatan Denda BPHTB-Pemindahan Hak	\N	\N	\N	\N	2001-01-01	2002-01-01	\N	0
360	11	4	1	04	12	16	002	00	00	Pendapatan Denda BPHTB-Pemberian Hak Baru	\N	\N	\N	\N	2001-01-01	2000-01-01	\N	0
361	7	4	1	01	11	01	001	00	00	Parkir	20	0	0	0	2001-01-01	2002-02-01	Yes	0
362	9	4	1	01	13	01	001	00	00	Sarang Burung Walet	0	\N	\N	\N	2001-01-01	2006-01-01	Yes	0
363	12	4	1	02	01	00	000	00	00	Retribusi Jasa Umum	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0
364	12	4	1	02	01	01	000	00	00	Retribusi Pelayanan Kesehatan 	0	\N	\N	\N	2001-01-01	2005-01-01	\N	0
365	12	4	1	02	01	01	001	00	00	Retribusi Pelayanan Kesehatan di Puskesmas	0	\N	\N	\N	2001-01-01	2009-01-01	\N	0
366	12	4	1	02	01	01	002	00	00	Retribusi Pelayanan Kesehatan di Puskesmas Keliling	0	\N	\N	\N	2001-01-01	2003-01-01	\N	0
367	12	4	1	02	01	01	003	00	00	Retribusi Pelayanan Kesehatan di Puskesmas Pembantu	0	\N	\N	\N	2001-01-01	2007-01-01	\N	0
368	12	4	1	02	01	01	004	00	00	Retribusi Pelayanan Kesehatan di Balai Pengobatan	0	\N	\N	\N	2001-01-01	2002-01-01	\N	0
369	12	4	1	02	01	01	005	00	00	Retribusi Pelayanan Kesehatan di Rumah Sakit Umum Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
370	12	4	1	02	01	01	006	00	00	Retribusi Pelayanan Kesehatan di Tempat Pelayanan Kesehatan Lainnya yang Sejenis	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0
371	12	4	1	02	01	02	000	00	00	Retribusi Pelayanan Persampahan/Kebersihan	0	\N	\N	\N	2001-01-01	2004-06-01	\N	0
372	12	4	1	02	01	02	001	00	00	Retribusi Pelayanan Persampahan/ Kebersihan	0	\N	\N	\N	2001-01-01	2009-01-01	\N	0
373	12	4	1	02	01	03	000	00	00	Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	0	\N	\N	\N	2001-01-01	2003-01-01	\N	0
374	12	4	1	02	01	03	001	00	00	Retribusi Pelayanan Penguburan/Pemakaman termasuk Penggalian dan Pengurukan serta Pembakaran/Pengabuan Mayat	0	\N	\N	\N	2001-01-01	2007-01-31	\N	0
375	12	4	1	02	01	04	000	00	00	Retribusi Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2001-01-01	2001-01-30	\N	0
376	12	4	1	02	01	04	001	00	00	Retribusi Penyediaan Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2001-01-01	2006-01-29	\N	0
377	12	4	1	02	01	05	000	00	00	Retribusi Pelayanan Pasar	0	\N	\N	\N	2001-01-01	2000-01-28	\N	0
378	12	4	1	02	01	05	001	00	00	Retribusi Pelataran	0	2000	\N	\N	2001-01-01	2004-01-27	\N	0
379	12	4	1	02	01	05	002	00	00	Retribusi Los	0	2000	\N	\N	2001-01-01	2008-01-26	\N	0
380	12	4	1	02	01	05	003	00	00	Retribusi Kios	0	2000	\N	\N	2001-01-01	2003-01-25	\N	0
381	12	4	1	02	01	06	000	00	00	Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2001-01-01	2007-10-24	\N	0
382	12	4	1	02	01	06	001	00	00	Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2001-01-01	2001-01-23	\N	0
383	12	4	1	02	01	07	000	00	00	Retribusi Pemeriksaan Alat Pemadam Kebakaran	0	\N	\N	\N	2001-01-01	2005-01-21	\N	0
384	12	4	1	02	01	07	001	00	00	Retribusi Pelayanan Pemeriksaan dan/atau Pengujian Alat Pemadam Kebakaran	0	\N	\N	\N	2001-01-01	2000-01-20	\N	0
385	12	4	1	02	01	07	002	00	00	Retribusi Pelayanan Pemeriksaan dan/atau Pengujian Alat Penanggulangan Kebakaran	0	\N	\N	\N	2001-01-01	2004-01-19	\N	0
386	12	4	1	02	01	07	003	00	00	Retribusi Pelayanan Pemeriksaan dan/atau Pengujian Alat Penyelamatan Jiwa	0	\N	\N	\N	2001-01-01	2008-01-18	\N	0
387	12	4	1	02	01	08	000	00	00	Retribusi Penggantian Biaya Cetak Peta	0	\N	\N	\N	2001-01-01	2002-01-17	\N	0
388	12	4	1	02	01	08	001	00	00	Retribusi Penyediaan Peta Dasar (Garis)	0	\N	\N	\N	2001-01-01	2007-01-16	\N	0
389	12	4	1	02	01	08	002	00	00	Retribusi Penyediaan Peta Foto	0	\N	\N	\N	2001-01-01	2001-01-15	\N	0
390	12	4	1	02	01	08	003	00	00	Retribusi Penyediaan Peta Digital	0	\N	\N	\N	2001-01-01	2005-01-14	\N	0
391	12	4	1	02	01	08	004	00	00	Retribusi Penyediaan Peta Tematik	0	\N	\N	\N	2001-01-01	2009-01-13	\N	0
392	12	4	1	02	01	08	005	00	00	Retribusi Penyediaan Peta Teknis (Struktur)	0	\N	\N	\N	2001-01-01	2004-05-12	\N	0
393	12	4	1	02	01	09	000	00	00	Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2001-01-01	2008-01-10	\N	0
394	12	4	1	02	01	09	001	00	00	Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0
395	12	4	1	02	01	10	000	00	00	Retribusi Pengolahan Limbah Cair	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0
396	12	4	1	02	01	10	001	00	00	Retribusi Rumah Tangga	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0
397	12	4	1	02	01	10	002	00	00	Retribusi Perkantoran	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0
398	12	4	1	02	01	10	003	00	00	Retribusi Industri	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0
399	12	4	1	02	01	11	000	00	00	Retribusi Pelayanan Tera/Tera Ulang	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0
400	12	4	1	02	01	11	001	00	00	Retribusi Pelayanan Pengujian Alat-Alat Ukur, Takar, Timbang, dan Perlengkapannya	0	\N	\N	\N	2001-01-01	2000-01-01	\N	0
401	12	4	1	02	01	11	002	00	00	Retribusi Pengujian Barang dalam Keadaan Terbungkus	0	\N	\N	\N	2001-01-01	2000-01-21	\N	0
402	12	4	1	02	01	12	000	00	00	Retribusi Pelayanan Pendidikan	0	\N	\N	\N	2001-01-01	2000-01-10	\N	0
403	12	4	1	02	01	12	001	00	00	Retribusi Pelayanan Penyelenggaraan Pendidikan Teknis	0	\N	\N	\N	2001-01-01	2002-01-01	\N	0
404	12	4	1	02	01	12	002	00	00	Retribusi Pelayanan Penyelenggaraan Pelatihan Teknis	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
405	12	4	1	02	01	12	003	00	00	Retribusi Pelayanan Penyelenggaraan Pendidikan dan Pelatihan Teknis	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
406	12	4	1	02	01	13	000	00	00	Retribusi Pengawasan dan Pengendalian Menara Telekomunikasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
407	12	4	1	02	01	13	001	00	00	Retribusi Pengawasan dan Pengendalian Menara Telekomunikasi 	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
408	13	4	1	02	02	00	000	00	00	Retribusi Jasa Usaha	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
409	13	4	1	02	02	01	000	00	00	Retribusi Pemakaian Kekayaan Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
410	13	4	1	02	02	01	001	00	00	Retribusi Penyewaan Tanah dan Bangunan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
411	13	4	1	02	02	01	002	00	00	Retribusi Penyewaan Tanah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
412	13	4	1	02	02	01	003	00	00	Retribusi Penyewaan Bangunan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
413	13	4	1	02	02	01	004	00	00	Retribusi Pemakaian Laboratorium	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
414	13	4	1	02	02	01	005	00	00	Retribusi Pemakaian Ruangan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
415	13	4	1	02	02	01	006	00	00	Retribusi Pemakaian Kendaraan Bermotor	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
416	13	4	1	02	02	02	000	00	00	Retribusi Pasar Grosir dan/atau Pertokoan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
417	13	4	1	02	02	02	001	00	00	Retribusi Penyediaan Fasilitas Pasar Grosir Berbagai Jenis Barang yang Dikontrakkan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
418	13	4	1	02	02	02	002	00	00	Retribusi Penyediaan Fasilitas Pasar/Pertokoan yang Dikontrakkan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
419	13	4	1	02	02	03	000	00	00	Retribusi Tempat Pelelangan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
420	13	4	1	02	02	03	001	00	00	Retribusi Penyediaan Tempat Pelelangan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
421	13	4	1	02	02	03	002	00	00	Retribusi Penyediaan Fasilitas Lainnya di Tempat Pelelangan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
422	13	4	1	02	02	04	000	00	00	Retribusi Terminal	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
423	13	4	1	02	02	04	001	00	00	Retribusi Pelayanan Penyediaan Tempat Parkir untuk Kendaraan Penumpang dan Bus Umum	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
424	13	4	1	02	02	04	002	00	00	Retribusi Pelayanan Penyediaan Tempat Kegiatan Usaha	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
425	13	4	1	02	02	04	003	00	00	Retribusi Pelayanan Penyediaan Fasilitas Lainnya di Lingkungan Terminal	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
426	13	4	1	02	02	05	000	00	00	Retribusi Tempat Khusus Parkir	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
427	13	4	1	02	02	05	001	00	00	Retribusi Pelayanan Tempat Khusus Parkir	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
428	13	4	1	02	02	06	000	00	00	Retribusi Tempat Penginapan/Pesanggrahan/ Vila	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
429	13	4	1	02	02	06	001	00	00	Retribusi Pelayanan Tempat Penginapan/ Pesanggrahan/Vila	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
430	13	4	1	02	02	07	000	00	00	Retribusi Pelayanan Tempat Penginapan/ Pesanggrahan/Vila	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
431	13	4	1	02	02	07	001	00	00	Retribusi Pelayanan Rumah Potong Hewan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
432	13	4	1	02	02	08	000	00	00	Retribusi Pelayanan Kepelabuhanan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
433	13	4	1	02	02	08	001	00	00	Retribusi Pelayanan Kepelabuhanan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
434	13	4	1	02	02	09	000	00	00	Retribusi Tempat Rekreasi dan Olahraga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
435	13	4	1	02	02	09	001	00	00	Retribusi Pelayanan Tempat Rekreasi dan Olahraga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
436	13	4	1	02	02	10	000	00	00	Retribusi Penyeberangan di Air	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
437	13	4	1	02	02	10	001	00	00	Retribusi Pelayanan Penyeberangan Orang	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
438	13	4	1	02	02	10	002	00	00	Retribusi Pelayanan Penyeberangan Barang	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
439	13	4	1	02	02	11	000	00	00	Retribusi Penjualan Produksi Usaha Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
440	13	4	1	02	02	11	001	00	00	Retribusi Penjualan Produksi Hasil Usaha Daerah berupa Bibit atau Benih Tanaman	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
441	13	4	1	02	02	11	002	00	00	Retribusi Penjualan Produksi hasil Usaha Daerah berupa Bibit Ternak	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
442	13	4	1	02	02	11	003	00	00	Retribusi Penjualan Produksi hasil Usaha	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
443	13	4	1	02	02	11	004	00	00	Retribusi Penjualan Produksi hasil Usaha Daerah selain Bibit atau Benih Tanaman, Ternak, dan Ikan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
444	14	4	1	02	03	00	000	00	00	Retribusi Perizinan Tertentu	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
445	14	4	1	02	03	01	000	00	00	Retribusi Izin Mendirikan Bangunan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
446	14	4	1	02	03	01	001	00	00	Retribusi Pemberian Izin Mendirikan Bangunan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
447	14	4	1	02	03	02	000	00	00	Retribusi Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
448	14	4	1	02	03	02	001	00	00	Retribusi Pemberian Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
449	14	4	1	02	03	03	000	00	00	Retribusi Izin Trayek untuk Menyediakan Pelayanan Angkutan Umum	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
450	14	4	1	02	03	03	001	00	00	Retribusi Izin Trayek untuk Menyediakan Pelayanan Angkutan Umum	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
451	14	4	1	02	03	04	000	00	00	Retribusi Izin Usaha Perikanan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
452	14	4	1	02	03	04	001	00	00	Retribusi Pemberian Izin Kegiatan Usaha Penangkapan Ikan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
453	14	4	1	02	03	04	002	00	00	Retribusi Pemberian Izin Kegiatan Usaha Pembudidayaan Ikan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
454	14	4	1	02	03	05	000	00	00	Retribusi Pengendalian Lalu Lintas	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
455	14	4	1	02	03	05	001	00	00	Retribusi Pengendalian Lalu Lintas Penggunaan Ruas Jalan Tertentu	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
456	14	4	1	02	03	05	002	00	00	Retribusi Pengendalian Lalu Lintas Penggunaan Koridor Tertentu	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
457	14	4	1	02	03	05	003	00	00	Retribusi Pengendalian Lalu Lintas Penggunaan Kawasan Tertentu	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
458	14	4	1	02	03	06	000	00	00	Retribusi Perpanjangan Izin Mempekerjakan Tenaga Kerja Asing (IMTA)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
459	14	4	1	02	03	06	001	00	00	Retribusi Pemberian Perpanjangan IMTA kepada Pemberi Kerja Tenaga Kerja Asing	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
460	0	4	1	03	00	00	000	00	00	Hasil Pengelolaan Kekayaan Daerah yang Dipisahkan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
461	15	4	1	03	01	00	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMN	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
462	15	4	1	03	01	01	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMN	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
463	15	4	1	03	01	01	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMN …	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
464	16	4	1	03	02	00	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
465	16	4	1	03	02	01	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Lembaga Keuangan)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
466	16	4	1	03	02	01	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Lembaga Keuangan) …	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
467	16	4	1	03	02	02	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Aneka Usaha)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
468	16	4	1	03	02	02	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Aneka Usaha) …	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
469	16	4	1	03	02	03	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Air Minum)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
470	16	4	1	03	02	03	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada Perusahaan Milik Daerah/BUMD (Bidang Air Minum) …	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
471	16	4	1	03	02	04	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Limbah)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
472	16	4	1	03	02	04	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Limbah) …	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
473	16	4	1	03	02	05	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Sanitasi)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
474	16	4	1	03	02	05	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Sanitasi) …	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
475	0	4	1	04	00	00	000	00	00	Lain-lain PAD yang Sah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
476	17	4	1	04	01	00	000	00	00	Hasil Penjualan BMD yang Tidak Dipisahkan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
477	17	4	1	04	01	01	000	00	00	Hasil Penjualan Tanah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
478	17	4	1	04	01	01	001	00	00	Hasil Penjualan Tanah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
479	17	4	1	04	01	02	000	00	00	Hasil Penjualan Peralatan dan Mesin	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
480	17	4	1	04	01	02	001	00	00	Hasil Penjualan Alat Besar	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
481	17	4	1	04	01	02	002	00	00	Hasil Penjualan Alat Angkutan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
482	17	4	1	04	01	02	003	00	00	Hasil Penjualan Alat Bengkel dan Alat Ukur	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
483	17	4	1	04	01	02	004	00	00	Hasil Penjualan Alat Pertanian	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
484	17	4	1	04	01	02	005	00	00	Hasil Penjualan Alat Kantor dan Rumah Tangga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
485	17	4	1	04	01	02	006	00	00	Hasil Penjualan Alat Studio, Komunikasi, dan Pemancar	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
486	17	4	1	04	01	02	007	00	00	Hasil Penjualan Alat Kedokteran dan Kesehatan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
487	17	4	1	04	01	02	008	00	00	Hasil Penjualan Alat Laboratorium	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
488	17	4	1	04	01	02	010	00	00	Hasil Penjualan Komputer	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
489	17	4	1	04	01	02	011	00	00	Hasil Penjualan Alat Eksplorasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
490	17	4	1	04	01	02	012	00	00	Hasil Penjualan Alat Pengeboran	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
491	17	4	1	04	01	02	013	00	00	Hasil Penjualan Alat Produksi, Pengolahan, dan Pemurnian	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
492	17	4	1	04	01	02	014	00	00	Hasil Penjualan Alat Bantu Eksplorasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
493	17	4	1	04	01	02	015	00	00	Hasil Penjualan Alat Keselamatan Kerja	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
494	17	4	1	04	01	02	016	00	00	Hasil Penjualan Alat Peraga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
495	17	4	1	04	01	02	017	00	00	Hasil Penjualan Peralatan Proses/Produksi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
496	17	4	1	04	01	02	018	00	00	Hasil Penjualan Rambu-rambu	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
497	17	4	1	04	01	02	019	00	00	Hasil Penjualan Peralatan Olahraga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
498	17	4	1	04	01	03	000	00	00	Hasil Penjualan Gedung dan Bangunan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
499	17	4	1	04	01	03	001	00	00	Hasil Penjualan Gedung dan Bangunan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
500	17	4	1	04	01	03	002	00	00	Hasil Penjualan Monumen	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
501	17	4	1	04	01	03	003	00	00	Hasil Penjualan Bangunan Menara	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
502	17	4	1	04	01	03	004	00	00	Hasil Penjualan Tugu Titik Kontrol/Pasti	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
503	17	4	1	04	01	04	000	00	00	Hasil Penjualan Jalan, Jaringan, dan Irigasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
504	17	4	1	04	01	04	001	00	00	Hasil Penjualan Jalan dan Jembatan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
505	17	4	1	04	01	04	002	00	00	Hasil Penjualan Bangunan Air	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
506	17	4	1	04	01	04	003	00	00	Hasil Penjualan Instalasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
507	17	4	1	04	01	04	004	00	00	Hasil Penjualan Jaringan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
508	17	4	1	04	01	05	000	00	00	Hasil Penjualan Aset Tetap Lainnya	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
509	17	4	1	04	01	05	001	00	00	Hasil Penjualan Bahan Perpustakaan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
510	17	4	1	04	01	05	002	00	00	Hasil Penjualan Barang Bercorak Kesenian/Kebudayaan/Olahraga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
511	17	4	1	04	01	05	003	00	00	Hasil Penjualan Hewan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
512	17	4	1	04	01	05	004	00	00	Hasil Penjualan Biota Perairan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
513	17	4	1	04	01	05	005	00	00	Hasil Penjualan Tanaman	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
514	17	4	1	04	01	05	006	00	00	Hasil Penjualan Barang Koleksi Non Budaya	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
515	17	4	1	04	01	05	007	00	00	Hasil Penjualan Aset Tetap Dalam Renovasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
516	17	4	1	04	01	06	000	00	00	Hasil Penjualan Aset Lainnya	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
517	17	4	1	04	01	06	001	00	00	Hasil Penjualan Aset Lainnya-Aset Tidak Berwujud	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
518	17	4	1	04	01	06	002	00	00	Hasil Penjualan Aset Lainnya-Aset Lain-Lain	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
519	18	4	1	04	02	00	000	00	00	Hasil Selisih Lebih Tukar Menukar BMD yang Tidak Dipisahkan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
520	18	4	1	04	02	01	000	00	00	Hasil Selisih Lebih Tukar Menukar Tanah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
521	18	4	1	04	02	01	001	00	00	Hasil Selisih Lebih Tukar Menukar Tanah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
522	18	4	1	04	02	02	000	00	00	Hasil Selisih Lebih Tukar Menukar Peralatan dan Mesin	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
523	18	4	1	04	02	02	001	00	00	Hasil Selisih Lebih Tukar Menukar Alat Besar	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
524	18	4	1	04	02	02	002	00	00	Hasil Selisih Lebih Tukar Menukar Alat Angkutan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
525	18	4	1	04	02	02	003	00	00	Hasil Selisih Lebih Tukar Menukar Alat Bengkel dan Alat Ukur	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
526	18	4	1	04	02	02	004	00	00	Hasil Selisih Lebih Tukar Menukar Alat Pertanian	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
527	18	4	1	04	02	02	005	00	00	Hasil Selisih Lebih Tukar Menukar Alat Kantor dan Rumah Tangga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
528	18	4	1	04	02	02	006	00	00	Hasil Selisih Lebih Tukar Menukar Alat Studio, Komunikasi, dan Pemancar	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
529	18	4	1	04	02	02	007	00	00	Hasil Selisih Lebih Tukar Menukar Alat Kedokteran dan Kesehatan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
530	18	4	1	04	02	02	008	00	00	Hasil Selisih Lebih Tukar Menukar Alat Laboratorium	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
531	18	4	1	04	02	02	010	00	00	Hasil Selisih Lebih Tukar Menukar Komputer	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
532	18	4	1	04	02	02	011	00	00	Hasil Selisih Lebih Tukar Menukar Alat Eksplorasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
533	18	4	1	04	02	02	012	00	00	Hasil Selisih Lebih Tukar Menukar Alat Pengeboran	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
534	18	4	1	04	02	02	013	00	00	Hasil Selisih Lebih Tukar Menukar Alat Produksi, Pengolahan, dan Pemurnian	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
535	18	4	1	04	02	02	014	00	00	Hasil Selisih Lebih Tukar Menukar Alat Bantu Eksplorasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
536	18	4	1	04	02	02	015	00	00	Hasil Selisih Lebih Tukar Menukar Alat Keselamatan Kerja	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
537	18	4	1	04	02	02	016	00	00	Hasil Selisih Lebih Tukar Menukar Alat Peraga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
538	18	4	1	04	02	02	017	00	00	Hasil Selisih Lebih Tukar Menukar Peralatan Proses/Produksi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
539	18	4	1	04	02	02	018	00	00	Hasil Selisih Lebih Tukar Menukar RambuRambu	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
540	18	4	1	04	02	02	019	00	00	Hasil Selisih Lebih Tukar Menukar Peralatan Olahraga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
541	18	4	1	04	02	03	000	00	00	Hasil Selisih Lebih Tukar Menukar Gedung dan Bangunan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
542	18	4	1	04	02	03	001	00	00	Hasil Selisih Lebih Tukar Menukar Bangunan Gedung	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
543	18	4	1	04	02	03	002	00	00	Hasil Selisih Lebih Tukar Menukar Monumen	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
544	18	4	1	04	02	03	003	00	00	Hasil Selisih Lebih Tukar Menukar Bangunan Menara	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
545	18	4	1	04	02	03	004	00	00	Hasil Selisih Lebih Tukar Menukar Tugu Titik Kontrol/Pasti	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
546	18	4	1	04	02	04	000	00	00	Hasil Selisih Lebih Tukar Menukar Jalan, Jaringan, dan Irigasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
547	18	4	1	04	02	04	001	00	00	Hasil Selisih Lebih Tukar Menukar Jalan dan Jembatan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
548	18	4	1	04	02	04	002	00	00	Hasil Selisih Lebih Tukar Menukar Bangunan Air	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
549	18	4	1	04	02	04	003	00	00	Hasil Selisih Lebih Tukar Menukar Instalasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
550	18	4	1	04	02	04	004	00	00	Hasil Selisih Lebih Tukar Menukar Jaringan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
551	18	4	1	04	02	05	000	00	00	Hasil Selisih Lebih Tukar Menukar Aset Tetap Lainnya	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
552	18	4	1	04	02	05	001	00	00	Hasil Selisih Lebih Tukar Menukar Bahan Perpustakaan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
553	18	4	1	04	02	05	002	00	00	Hasil Selisih Lebih Tukar Menukar Barang Bercorak Kesenian/Kebudayaan/Olahraga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
554	18	4	1	04	02	05	003	00	00	Hasil Selisih Lebih Tukar Menukar Hewan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
555	18	4	1	04	02	05	004	00	00	Hasil Selisih Lebih Tukar Menukar Biota Perairan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
556	18	4	1	04	02	05	005	00	00	Hasil Selisih Lebih Tukar Menukar Tanaman	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
557	18	4	1	04	02	05	006	00	00	Hasil Selisih Lebih Tukar Menukar Barang Koleksi Non Budaya	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
558	18	4	1	04	02	05	007	00	00	Hasil Selisih Lebih Tukar Menukar Aset Tetap Dalam Renovasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
559	18	4	1	04	02	06	000	00	00	Hasil Selisih Lebih Tukar Menukar Aset Lainnya	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
560	18	4	1	04	02	06	001	00	00	Hasil Selisih Lebih Tukar Menukar Aset Lainnya-Aset Tidak Berwujud	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
561	18	4	1	04	02	06	002	00	00	Hasil Selisih Lebih Tukar Menukar Aset Lainnya-Aset Lain-Lain	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
562	19	4	1	04	03	00	000	00	00	Hasil Pemanfaatan BMD yang Tidak Dipisahkan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
563	19	4	1	04	03	01	000	00	00	Hasil Sewa BMD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
564	19	4	1	04	03	01	001	00	00	Hasil Sewa BMD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
565	19	4	1	04	03	01	000	00	00	Hasil Kerja Sama Pemanfaatan BMD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
566	19	4	1	04	03	01	001	00	00	Hasil Kerja Sama Pemanfaatan BMD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
567	19	4	1	04	03	01	000	00	00	Hasil dari Bangun Guna Serah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
568	19	4	1	04	03	01	001	00	00	Hasil dari Bangun Guna Serah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
569	19	4	1	04	03	01	000	00	00	Hasil dari Bangun Serah Guna	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
570	19	4	1	04	03	01	001	00	00	Hasil dari Bangun Serah Guna	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
571	20	4	1	04	04	00	000	00	00	Hasil Kerja Sama Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
572	20	4	1	04	04	01	000	00	00	Hasil Kerja Sama Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
573	20	4	1	04	04	01	001	00	00	Hasil Kerja Sama Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
574	21	4	1	04	05	00	000	00	00	Jasa Giro	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
575	21	4	1	04	05	01	000	00	00	Jasa Giro pada Kas Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
576	21	4	1	04	05	01	001	00	00	Jasa Giro pada Kas Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
577	21	4	1	04	05	02	000	00	00	Jasa Giro pada Kas di Bendahara	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
578	21	4	1	04	05	02	001	00	00	Jasa Giro pada Kas di Bendahara	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
579	21	4	1	04	05	03	000	00	00	Jasa Giro pada Rekening Dana Cadangan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
580	21	4	1	04	05	03	001	00	00	Jasa Giro pada Rekening Dana Cadangan …	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
581	21	4	1	04	05	04	000	00	00	Jasa Giro pada BLUD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
582	21	4	1	04	05	04	001	00	00	Jasa Giro pada BLUD…	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
583	21	4	1	04	05	05	000	00	00	Jasa Giro pada Rekening Dana BOS	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
584	21	4	1	04	05	05	001	00	00	Jasa Giro pada Rekening Dana BOS …	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
585	21	4	1	04	05	06	000	00	00	Jasa Giro Dana Kapitasi pada FKTP	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
586	21	4	1	04	05	06	001	00	00	Jasa Giro Dana Kapitasi pada FKTP …	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
587	22	4	1	04	06	00	000	00	00	Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
588	22	4	1	04	06	01	000	00	00	Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
589	22	4	1	04	06	01	001	00	00	Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
590	23	4	1	04	07	00	000	00	00	Pendapatan Bunga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
591	23	4	1	04	07	01	000	00	00	Pendapatan Bunga atas Penempatan Uang Pemerintah Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
592	23	4	1	04	07	01	001	00	00	Pendapatan Bunga atas Penempatan Uang Pemerintah Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
593	24	4	1	04	08	00	000	00	00	Penerimaan atas Tuntutan Ganti Kerugian Keuangan Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
594	24	4	1	04	08	01	000	00	00	Tuntutan Ganti Kerugian Daerah terhadap Bendahara	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
595	24	4	1	04	08	01	001	00	00	Tuntutan Ganti Kerugian Daerah terhadap Bendahara	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
596	24	4	1	04	08	02	000	00	00	Tuntutan Ganti Kerugian Daerah terhadap Pegawai Negeri Bukan Bendahara atau Pejabat Lain	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
597	24	4	1	04	08	02	001	00	00	Tuntutan Ganti Kerugian Daerah terhadap Pegawai Negeri Bukan Bendahara atau Pejabat Lain	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
598	25	4	1	04	09	00	000	00	00	Penerimaan Komisi, Potongan, atau Bentuk Lain	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
599	25	4	1	04	09	01	000	00	00	Penerimaan Komisi, Potongan, atau Bentuk Lain	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
600	25	4	1	04	09	01	001	00	00	Penerimaan Komisi, Potongan, atau Bentuk Lain	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
601	26	4	1	04	10	00	000	00	00	Penerimaan Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
602	26	4	1	04	10	01	000	00	00	Penerimaan Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
603	26	4	1	04	10	01	001	00	00	Penerimaan Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
604	27	4	1	04	11	00	000	00	00	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
605	27	4	1	04	11	01	000	00	00	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
606	27	4	1	04	11	01	001	00	00	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
607	28	4	1	04	12	00	000	00	00	Pendapatan Denda Pajak Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
608	28	4	1	04	12	01	000	00	00	Pendapatan Denda Pajak Kendaraan Bermotor (PKB)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
609	28	4	1	04	12	01	001	00	00	Pendapatan Denda PKB-Mobil Penumpang Sedan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
610	28	4	1	04	12	01	002	00	00	Pendapatan Denda PKB-Mobil Penumpang Jeep	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
611	28	4	1	04	12	01	003	00	00	Pendapatan Denda PKB-Mobil Penumpang Minibus	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
612	28	4	1	04	12	01	004	00	00	Pendapatan Denda PKB-Mobil Bus-Microbus	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
613	28	4	1	04	12	01	005	00	00	Pendapatan Denda PKB-Mobil Bus-Bus	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
614	28	4	1	04	12	01	006	00	00	Pendapatan Denda PKB-Mobil Barang/Beban-Pick Up	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
615	28	4	1	04	12	01	007	00	00	Pendapatan Denda PKB-Mobil Barang/Beban-Light Truck	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
616	28	4	1	04	12	01	008	00	00	Pendapatan Denda PKB-Mobil Barang/Beban-Truck	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
617	28	4	1	04	12	01	009	00	00	Pendapatan Denda PKB-Mobil Barang/Beban-Blind Van	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
618	28	4	1	04	12	01	010	00	00	Pendapatan Denda PKB-Sepeda MotorSepeda Motor Roda Dua	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
619	28	4	1	04	12	01	011	00	00	Pendapatan Denda PKB-Sepeda MotorSepeda Motor Roda Tiga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
620	28	4	1	04	12	01	012	00	00	Pendapatan Denda PKB-Kendaraan Bermotor yang Dioperasikan di Air	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
621	28	4	1	04	12	01	013	00	00	Pendapatan Denda PKB-Kendaraan Khusus Alat Berat/Alat Besar	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
622	28	4	1	04	12	01	014	00	00	Pendapatan Denda PKB-Mobil Roda Tiga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
623	28	4	1	04	12	02	000	00	00	Pendapatan Denda Bea Balik Nama Kendaraan Bermotor (BBNKB)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
624	28	4	1	04	12	02	001	00	00	Pendapatan Denda BBNKB-Mobil Penumpang-Sedan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
625	28	4	1	04	12	02	002	00	00	Pendapatan Denda BBNKB-Mobil Penumpang-Jeep	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
626	28	4	1	04	12	02	003	00	00	Pendapatan Denda BBNKB-Mobil Penumpang Minibus	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
627	28	4	1	04	12	02	004	00	00	Pendapatan Denda BBNKB-Mobil Bus-Microbus	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
628	28	4	1	04	12	02	005	00	00	Pendapatan Denda BBNKB-Mobil Bus-Bus	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
629	28	4	1	04	12	02	006	00	00	Pendapatan Denda BBNKB-Mobil Barang/Beban-Pick Up	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
630	28	4	1	04	12	02	007	00	00	Pendapatan Denda BBNKB-Mobil Barang/Beban-Light Truck	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
631	28	4	1	04	12	02	008	00	00	Pendapatan Denda BBNKB-Mobil Barang/Beban-Truck	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
632	28	4	1	04	12	02	009	00	00	Pendapatan Denda BBNKB-Mobil Barang/Beban-Blind Van	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
633	28	4	1	04	12	02	010	00	00	Pendapatan Denda BBNKB-Sepeda MotorSepeda Motor Roda Dua	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
634	28	4	1	04	12	02	011	00	00	Pendapatan Denda BBNKB-Sepeda MotorSepeda Motor Roda Tiga	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
635	28	4	1	04	12	02	012	00	00	Pendapatan Denda BBNKB-Kendaraan Bermotor yang Dioperasikan di Air	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
636	28	4	1	04	12	02	013	00	00	Pendapatan Denda BBNKB-Kendaraan Khusus Alat Berat/Alat Besar	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
637	28	4	1	04	12	02	014	00	00	Pendapatan Denda BBNKB-Mobil Roda Tiga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
638	28	4	1	04	12	03	000	00	00	Pendapatan Denda Pajak Bahan Bakar Kendaraan Bermotor (PBBKB)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
639	28	4	1	04	12	03	001	00	00	Pendapatan Denda PPBKB-Bahan Bakar Bensin	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
640	28	4	1	04	12	03	002	00	00	Pendapatan Denda PPBKB-Bahan Bakar Solar	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
641	28	4	1	04	12	03	003	00	00	Pendapatan Denda PPBKB-Bahan Bakar Gas	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
642	28	4	1	04	12	03	004	00	00	Pendapatan Denda PPBKB-Bahan Bakar Lainnya	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
643	29	4	1	04	13	00	000	00	00	Pendapatan Denda Retribusi Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
644	29	4	1	04	13	01	000	00	00	Pendapatan Denda Retribusi Jasa Umum	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
645	29	4	1	04	13	01	001	00	00	Pendapatan Denda Retribusi Pelayanan Kesehatan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
646	29	4	1	04	13	01	002	00	00	Pendapatan Denda Retribusi Pelayanan Persampahan/Kebersihan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
647	29	4	1	04	13	01	003	00	00	Pendapatan Denda Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
648	29	4	1	04	13	01	004	00	00	Pendapatan Denda Retribusi Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
649	29	4	1	04	13	01	005	00	00	Pendapatan Denda Retribusi Pelayanan Pasar	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
650	29	4	1	04	13	01	006	00	00	Pendapatan Denda Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
651	29	4	1	04	13	01	007	00	00	Pendapatan Denda Retribusi Pemeriksaan Alat Pemadam Kebakaran	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
652	29	4	1	04	13	01	008	00	00	Pendapatan Denda Retribusi Penggantian Biaya Cetak Peta	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
653	29	4	1	04	13	01	009	00	00	Pendapatan Denda Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
654	29	4	1	04	13	01	010	00	00	Pendapatan Denda Retribusi Pengolahan Limbah Cair	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
655	29	4	1	04	13	01	011	00	00	Pendapatan Denda Retribusi Pelayanan Tera/Tera Ulang	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
656	29	4	1	04	13	01	012	00	00	Pendapatan Denda Retribusi Pelayanan Pendidikan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
657	29	4	1	04	13	01	013	00	00	Pendapatan Denda Retribusi Pengawasan dan Pengendalian Menara Telekomunikasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
658	29	4	1	04	13	02	000	00	00	Pendapatan Denda Retribusi Jasa Usaha	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
659	29	4	1	04	13	02	001	00	00	Pendapatan Denda Retribusi Pemakaian Kekayaan Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
660	29	4	1	04	13	02	002	00	00	Pendapatan Denda Retribusi Pasar Grosir dan/atau Pertokoan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
661	29	4	1	04	13	02	003	00	00	Pendapatan Denda Retribusi Tempat Pelelangan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
662	29	4	1	04	13	02	004	00	00	Pendapatan Denda Retribusi Terminal	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
663	29	4	1	04	13	02	005	00	00	Pendapatan Denda Retribusi Tempat Khusus Parkir	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
664	29	4	1	04	13	02	006	00	00	Pendapatan Denda Retribusi Tempat Penginapan/Pesanggrahan/Vila	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
665	29	4	1	04	13	02	007	00	00	Pendapatan Denda Retribusi Rumah Potong Hewan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
666	29	4	1	04	13	02	008	00	00	Pendapatan Denda Retribusi Pelayanan Kepelabuhanan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
667	29	4	1	04	13	02	009	00	00	Pendapatan Denda Retribusi Tempat Rekreasi dan Olahraga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
668	29	4	1	04	13	02	010	00	00	Pendapatan Denda Retribusi Pelayanan Penyeberangan Air	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
669	29	4	1	04	13	02	011	00	00	Pendapatan Denda Retribusi Penjualan Produksi Usaha Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
670	29	4	1	04	13	03	000	00	00	Pendapatan Denda Retribusi Perizinan Tertentu	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
671	29	4	1	04	13	03	001	00	00	Pendapatan Denda Retribusi Izin Mendirikan Bangunan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
672	29	4	1	04	13	03	002	00	00	Pendapatan Denda Retribusi Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
673	29	4	1	04	13	03	003	00	00	Pendapatan Denda Retribusi Izin Trayek untuk Menyediakan Pelayanan Angkutan Umum	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
674	29	4	1	04	13	03	004	00	00	Pendapatan Denda Retribusi Izin Usaha Perikanan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
675	29	4	1	04	13	03	005	00	00	Pendapatan Denda Retribusi Pengendalian Lalu Lintas	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
676	29	4	1	04	13	03	006	00	00	Pendapatan Denda Retribusi Perpanjangan Izin Mempekerjakan Tenaga Kerja Asing (IMTA)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
677	30	4	1	04	14	00	000	00	00	Pendapatan Hasil Eksekusi atas Jaminan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
678	30	4	1	04	14	01	000	00	00	Hasil Eksekusi atas Jaminan atas Pengadaan Barang/Jasa	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
679	30	4	1	04	14	01	001	00	00	Hasil Eksekusi atas Jaminan atas Pengadaan Barang/Jasa	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
680	31	4	1	04	15	00	000	00	00	Pendapatan dari Pengembalian	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
681	31	4	1	04	15	01	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Pajak Penghasilan Pasal 21	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
682	31	4	1	04	15	01	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Pajak Penghasilan Pasal 21	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
683	31	4	1	04	15	02	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
684	31	4	1	04	15	02	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
685	31	4	1	04	15	03	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Gaji dan Tunjangan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
686	31	4	1	04	15	03	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Gaji dan Tunjangan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
687	31	4	1	04	15	04	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Perjalanan Dinas	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
688	31	4	1	04	15	04	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Perjalanan Dinas	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
689	31	4	1	04	15	05	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kecelakaan Kerja (JKK)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
690	31	4	1	04	15	05	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kecelakaan Kerja (JKK)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
691	31	4	1	04	15	06	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kematian (JKM)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
692	31	4	1	04	15	06	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kematian (JKM)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
693	31	4	1	04	15	07	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan Nasional (JKN)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
694	31	4	1	04	15	07	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan Nasional (JKN)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
695	32	4	1	04	16	00	000	00	00	Pendapatan BLUD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
696	32	4	1	04	16	01	000	00	00	Pendapatan BLUD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
697	32	4	1	04	16	01	001	00	00	Pendapatan BLUD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
698	33	4	1	04	17	00	000	00	00	Pendapatan Denda Pemanfaatan BMD yang tidak Dipisahkan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
699	33	4	1	04	17	01	000	00	00	Pendapatan Denda Pengakhiran Sewa BMD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
700	33	4	1	04	17	01	001	00	00	Pendapatan Denda Pengakhiran Sewa BMD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
701	33	4	1	04	17	02	000	00	00	Pendapatan Denda Hasil dari Kerja Sama Penyediaan Infrastruktur	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
702	33	4	1	04	17	02	001	00	00	Pendapatan Denda Hasil dari Kerja Sama Penyediaan Infrastruktur	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
703	34	4	1	04	18	00	000	00	00	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional (JKN) pada Fasilitas Kesehatan Tingkat Pertama (FKTP)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
704	34	4	1	04	18	01	000	00	00	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional (JKN) pada Fasilitas Kesehatan Tingkat Pertama (FKTP)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
705	34	4	1	04	18	01	001	00	00	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional (JKN) pada Fasilitas Kesehatan Tingkat Pertama (FKTP)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
706	35	4	1	04	19	00	000	00	00	Pendapatan Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
707	35	4	1	04	19	01	000	00	00	Pendapatan Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
708	35	4	1	04	19	01	001	00	00	Pendapatan Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
709	36	4	1	04	20	00	000	00	00	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
710	36	4	1	04	20	01	000	00	00	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
711	36	4	1	04	20	01	001	00	00	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
712	37	4	1	04	21	00	000	00	00	Pendapatan Denda atas Pelanggaran Peraturan Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
713	37	4	1	04	21	01	000	00	00	Pendapatan Denda atas Pelanggaran Peraturan Daerah	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
714	37	4	1	04	21	01	001	00	00	Pendapatan Denda atas Pelanggaran Peraturan Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
715	38	4	1	04	22	00	000	00	00	Pendapatan Zakat	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
716	38	4	1	04	22	01	000	00	00	Pendapatan Zakat	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
717	38	4	1	04	22	01	001	00	00	Pendapatan Zakat	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
718	0	4	2	00	00	00	000	00	00	PENDAPATAN TRANSFER	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
719	0	4	2	01	00	00	000	00	00	Pendapatan Transfer Pemerintah Pusat	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
720	39	4	2	01	01	00	000	00	00	Dana Perimbangan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
721	39	4	2	01	01	01	000	00	00	Dana Transfer Umum-Dana Bagi Hasil (DBH)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
722	39	4	2	01	01	01	001	00	00	DBH Pajak Bumi dan Bangunan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
723	39	4	2	01	01	01	002	00	00	DBH PPh Pasal 25 dan Pasal 29	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
724	39	4	2	01	01	01	003	00	00	DBH PPh Pasal 21	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
725	39	4	2	01	01	01	004	00	00	DBH Cukai Hasil Tembakau (CHT)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
726	39	4	2	01	01	01	005	00	00	DBH Sumber Daya Alam (SDA) Minyak Bumi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
727	39	4	2	01	01	01	006	00	00	DBH Sumber Daya Alam (SDA) Gas Bumi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
728	39	4	2	01	01	01	007	00	00	DBH Sumber Daya Alam (SDA) Mineral dan Batubara-Landrent	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
729	39	4	2	01	01	01	008	00	00	Dana Bagi Hasil (DBH) Sumber Daya Alam (SDA) Mineral dan Batubara-Royalty	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
730	39	4	2	01	01	01	009	00	00	DBH Sumber Daya Alam (SDA) KehutananProvisi Sumber Daya Hutan (PSDH)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
731	39	4	2	01	01	01	010	00	00	DBH Sumber Daya Alam (SDA) KehutananIuran Izin Usaha Pemanfaatan Hutan (IIUPH)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
732	39	4	2	01	01	01	011	00	00	DBH Sumber Daya Alam (SDA) KehutananDana Reboisasi (DR)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
733	39	4	2	01	01	01	012	00	00	DBH Sumber Daya Alam (SDA) Perikanan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
734	39	4	2	01	01	01	013	00	00	DBH Sumber Daya Alam (SDA) Panas Bumi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
735	39	4	2	01	01	02	000	00	00	Dana Transfer Umum-Dana Alokasi Umum (DAU)	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
736	39	4	2	01	01	02	001	00	00	Dana Transfer Umum-Dana Alokasi Umum (DAU)	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
737	39	4	2	01	01	02	002	00	00	Dana Transfer Umum-Dana Alokasi Umum (DAU) Tambahan untuk Dukungan Pendanaan Kelurahan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
738	39	4	2	01	01	03	000	00	00	Dana Transfer Khusus-Dana Alokasi Khusus (DAK) Fisik	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
739	39	4	2	01	01	03	001	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
740	39	4	2	01	01	03	002	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SMP	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
741	39	4	2	01	01	03	003	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SMA	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
742	39	4	2	01	01	03	004	00	00	DAK Fisik-Bidang Pendidikan-Reguler SDLB/ SMPLB/ SMALB	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
743	39	4	2	01	01	03	005	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SKB	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
744	39	4	2	01	01	03	006	00	00	DAK Fisik-Bidang Pendidikan-RegulerPerpustakaan Daerah	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
745	39	4	2	01	01	03	007	00	00	DAK Fisik-Bidang Pendidikan-RegulerOlahraga	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
746	39	4	2	01	01	03	008	00	00	DAK Fisik-Bidang Air Minum-Reguler	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
747	39	4	2	01	01	03	009	00	00	DAK Fisik-Bidang Sanitasi-Reguler	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
748	39	4	2	01	01	03	010	00	00	DAK Fisik-Bidang Perumahan dan Permukiman-Reguler	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
749	39	4	2	01	01	03	011	00	00	DAK Fisik-Bidang Jalan-Reguler	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
750	39	4	2	01	01	03	012	00	00	DAK Fisik-Bidang Kesehatan-RegulerPelayanan Kesehatan Dasar	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
751	39	4	2	01	01	03	013	00	00	DAK Fisik-Bidang Kesehatan-RegulerPelayanan Kesehatan Rujukan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
752	39	4	2	01	01	03	014	00	00	DAK Fisik-Bidang Kesehatan-RegulerPelayanan Kefarmasian dan Perbekalan Kesehatan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
753	39	4	2	01	01	03	015	00	00	DAK Fisik-Bidang Kesehatan-Reguler-KB	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
754	39	4	2	01	01	03	016	00	00	DAK Fisik-Bidang Pertanian-Reguler	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
755	39	4	2	01	01	03	017	00	00	DAK Fisik-Bidang Kelautan dan Perikanan Reguler	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
756	39	4	2	01	01	03	018	00	00	DAK Fisik-Bidang Pariwisata Reguler	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
757	39	4	2	01	01	03	019	00	00	DAK Fisik-Bidang Industri Kecil dan Menengah-Reguler	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
758	39	4	2	01	01	03	020	00	00	DAK Fisik-Bidang Pendidikan-Penugasan-SMK	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
759	39	4	2	01	01	03	021	00	00	DAK Fisik-Bidang Kesehatan-PenugasanPeningkatan Pelayanan Rujukan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
760	39	4	2	01	01	03	022	00	00	Dana Alokasi Khusus (DAK) Fisik-Bidang Kesehatan-Penugasan-Penurunan Stunting	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
761	39	4	2	01	01	03	023	00	00	DAK Fisik-Bidang Kesehatan-PenugasanPengendalian Penyakit	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
762	39	4	2	01	01	03	024	00	00	DAK Fisik-Bidang Kesehatan-PenugasanBalai Pelatihan Kesehatan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
763	39	4	2	01	01	03	025	00	00	DAK Fisik-Bidang Air Minum-Penugasan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
764	39	4	2	01	01	03	026	00	00	DAK Fisik-Bidang Pariwisata-Penugasan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
765	39	4	2	01	01	03	027	00	00	DAK Fisik-Bidang Sanitasi-Penugasan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
766	39	4	2	01	01	03	028	00	00	DAK Fisik-Bidang Jalan-Penugasan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
767	39	4	2	01	01	03	029	00	00	DAK Fisik-Bidang Pasar-Penugasan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
768	39	4	2	01	01	03	030	00	00	DAK Fisik-Bidang Irigasi-Penugasan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
769	39	4	2	01	01	03	031	00	00	DAK Fisik-Bidang Lingkungan Hidup dan Kehutanan-Penugasan-Lingkungan Hidup	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
770	39	4	2	01	01	03	032	00	00	DAK Fisik-Bidang Lingkungan Hidup dan Kehutanan-Penugasan-Kehutanan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
771	39	4	2	01	01	03	033	00	00	DAK Fisik-Bidang Kesehatan-AfirmasiPenguatan Puskesmas-DTPK	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
772	39	4	2	01	01	03	034	00	00	DAK Fisik-Bidang Kesehatan-AfirmasiPenguatan Pembangunan Rumah Sakit Pratama	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
773	39	4	2	01	01	03	035	00	00	DAK Fisik-Bidang Perumahan dan Permukiman-Afirmasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
774	39	4	2	01	01	03	036	00	00	DAK Fisik-Bidang Air Minum-Afirmasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
775	39	4	2	01	01	03	037	00	00	DAK Fisik-Bidang Sanitasi-Afirmasi	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
776	39	4	2	01	01	03	038	00	00	DAK Fisik-Bidang Transportasi-Afirmasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
777	39	4	2	01	01	03	039	00	00	DAK Fisik-Bidang Pendidikan-Afirmasi-SD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
778	39	4	2	01	01	03	040	00	00	DAK Fisik-Bidang Pendidikan-Afirmasi-SMP	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
779	39	4	2	01	01	03	041	00	00	DAK Fisik-Bidang Pendidikan-Afirmasi-SMA	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
780	39	4	2	01	01	04	000	00	00	Dana Transfer Khusus-Dana Alokasi Khusus (DAK) Non Fisik	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
781	39	4	2	01	01	04	001	00	00	DAK Non Fisik-BOS Reguler	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
782	39	4	2	01	01	04	002	00	00	DAK Non Fisik-BOS Afirmasi	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
783	39	4	2	01	01	04	003	00	00	DAK Non Fisik-BOS Kinerja	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
784	39	4	2	01	01	04	004	00	00	DAK Non Fisik-BOP PAUD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
785	39	4	2	01	01	04	005	00	00	DAK Non Fisik-BOP Pendidikan Kesetaraan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
786	39	4	2	01	01	04	006	00	00	DAK Non Fisik-TPG PNSD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
787	39	4	2	01	01	04	007	00	00	DAK Non Fisik-Tamsil Guru PNSD	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
788	39	4	2	01	01	04	008	00	00	DAK Non Fisik-TKG PNSD	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
789	39	4	2	01	01	04	009	00	00	DAK Non Fisik-BOP Museum dan Taman Budaya-Museum	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
790	39	4	2	01	01	04	010	00	00	DAK Non Fisik-BOP Museum dan Taman Budaya-Taman Budaya	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
791	39	4	2	01	01	04	011	00	00	DAK Non Fisik-BOKKB-BOK	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
792	39	4	2	01	01	04	012	00	00	DAK Non Fisik-BOKKB-Akreditasi RS	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
793	39	4	2	01	01	04	013	00	00	DAK Non Fisik-BOKKB-Akreditasi Puskesmas	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
794	39	4	2	01	01	04	014	00	00	DAK Non Fisik-BOKKB-Akreditasi Labkesda	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
795	39	4	2	01	01	04	015	00	00	DAK Non Fisik-BOKKB-Jaminan Persalinan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
796	39	4	2	01	01	04	016	00	00	DAK Non Fisik-BOKKB-BOKB	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
797	39	4	2	01	01	04	017	00	00	DAK Non Fisik-PK2UKM	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
798	39	4	2	01	01	04	018	00	00	DAK Non Fisik-Dana Pelayanan Administrasi Kependudukan	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
799	39	4	2	01	01	04	019	00	00	DAK Non Fisik-Dana Pelayanan Kepariwisataan	0	\N	\N	\N	2001-01-01	2002-02-01	\N	0
800	39	4	2	01	01	04	020	00	00	DAK Non Fisik-Dana BLPS	0	\N	\N	\N	2001-01-01	2006-01-01	\N	0
801	40	4	2	01	02	00	000	00	00	Dana Insentif Daerah (DID)	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
802	40	4	2	01	02	01	000	00	00	Dana Insentif Daerah (DID)	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
803	40	4	2	01	02	01	001	00	00	Dana Insentif Daerah (DID)	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
804	41	4	2	01	05	00	000	00	00	Dana Desa	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
805	41	4	2	01	05	01	000	00	00	Dana Desa	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
806	41	4	2	01	05	01	001	00	00	Dana Desa	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
807	0	4	2	02	00	00	000	00	00	Pendapatan Transfer Antar Daerah	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
808	42	4	2	02	01	00	000	00	00	Pendapatan Bagi Hasil	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
809	42	4	2	02	01	01	000	00	00	Pendapatan Bagi Hasil Pajak	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
810	42	4	2	02	01	01	001	00	00	Pendapatan Bagi Hasil Pajak Kendaraan Bermotor	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
811	42	4	2	02	01	01	002	00	00	Pendapatan Bagi Hasil Bea Balik Nama Kendaraan Bermotor	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
812	42	4	2	02	01	01	003	00	00	Pendapatan Bagi Hasil Pajak Bahan Bakar Kendaraan Bermotor	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
813	42	4	2	02	01	01	004	00	00	Pendapatan Bagi Hasil Pajak Air Permukaan	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
814	42	4	2	02	01	01	005	00	00	Pendapatan Bagi Hasil Pajak Rokok	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
815	0	4	3	00	00	00	000	00	00	LAIN-LAIN PENDAPATAN DAERAH YANG SAH	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
816	0	4	3	01	00	00	000	00	00	Pendapatan Hibah	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
817	43	4	3	01	01	00	000	00	00	Pendapatan Hibah dari Pemerintah Pusat	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
818	43	4	3	01	01	01	000	00	00	Pendapatan Hibah dari Pemerintah Pusat	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
819	43	4	3	01	01	01	001	00	00	Pendapatan Hibah dari Pemerintah Pusat …	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
820	44	4	3	01	02	00	000	00	00	Pendapatan Hibah dari Pemerintah Daerah Lainnya	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
821	44	4	3	01	02	01	000	00	00	Pendapatan Hibah dari Pemerintah Daerah Lainnya	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
822	44	4	3	01	02	01	001	00	00	Pendapatan Hibah dari Pemerintah Daerah …	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
823	45	4	3	01	03	00	000	00	00	Pendapatan Hibah dari Kelompok Masyarakat/Perorangan Dalam Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
824	45	4	3	01	03	01	000	00	00	Pendapatan Hibah dari Kelompok Masyarakat/Perorangan Dalam Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
825	45	4	3	01	03	01	001	00	00	Pendapatan Hibah dari Kelompok Masyarakat/Perorangan Dalam Negeri …	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
826	46	4	3	01	04	00	000	00	00	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Dalam Negeri/Luar Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
827	46	4	3	01	04	01	000	00	00	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Dalam Negeri/Luar Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
828	46	4	3	01	04	01	001	00	00	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Dalam Negeri/Luar Negeri …	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
829	46	4	3	01	04	02	000	00	00	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Luar Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
830	46	4	3	01	04	02	001	00	00	Pendapatan Hibah dari Badan/Lembaga/ Organisasi Luar Negeri …	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
831	46	4	3	01	04	03	000	00	00	Pendapatan Hibah dari Lembaga/Organisasi Swasta Dalam Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
832	46	4	3	01	04	03	001	00	00	Pendapatan Hibah dari Lembaga/Organisasi Swasta Dalam Negeri …	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
833	46	4	3	01	04	04	000	00	00	Pendapatan Hibah dari Lembaga/Organisasi Swasta Luar Negeri	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
834	46	4	3	01	04	04	001	00	00	Pendapatan Hibah dari Lembaga/Organisasi Swasta Luar Negeri …	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
835	47	4	3	01	05	00	000	00	00	Sumbangan Pihak Ketiga/Sejenis	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
836	47	4	3	01	05	01	000	00	00	Sumbangan Pihak Ketiga/Sejenis	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
837	47	4	3	01	05	01	001	00	00	Sumbangan Pihak Ketiga/Sejenis …	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
838	0	4	3	02	00	00	000	00	00	Dana Darurat	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
839	48	4	3	02	01	00	000	00	00	Dana Darurat	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
840	48	4	3	02	01	01	000	00	00	Dana Darurat	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
841	48	4	3	02	01	01	001	00	00	Dana Darurat pada Tahap Pasca Bencana	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
842	0	4	3	03	00	00	000	00	00	Lain-lain Pendapatan Sesuai dengan Ketentuan Peraturan Perundang-Undangan	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
843	49	4	3	03	01	00	000	00	00	Lain-lain Pendapatan	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
844	49	4	3	03	01	01	000	00	00	Pendapatan Hibah Dana BOS	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
845	49	4	3	03	01	01	001	00	00	Pendapatan Hibah Dana BOS	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
846	49	4	3	03	01	02	000	00	00	Pendapatan atas Pengembalian Hibah	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
847	49	4	3	03	01	02	001	00	00	Pendapatan atas Pengembalian Hibah Pada Pemerintah	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
848	49	4	3	03	01	02	002	00	00	Pendapatan atas Pengembalian Hibah pada Pemerintah Daerah Lainnya	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
849	49	4	3	03	01	02	003	00	00	Pendapatan atas Pengembalian Hibah pada BUMN	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
850	49	4	3	03	01	02	004	00	00	Pendapatan atas Pengembalian Hibah pada BUMD	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
851	49	4	3	03	01	02	005	00	00	Pendapatan atas Pengembalian Hibah pada Badan, Lembaga, dan Organisasi Kemasyarakatan yang Berbadan hukum Indonesia	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
852	49	4	3	03	01	02	006	00	00	Pendapatan atas Pengembalian Hibah Bantuan Keuangan pada Partai Politik	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
252	11	4	1	01	16	01	001	00	00	BPHTB-Pemindahan Hak	5	0	0	0	2007-01-01	2025-01-01	Yes	0
253	11	4	1	01	16	02	001	00	00	BPHTB-Pemberian Hak Baru	5	0	0	0	2007-01-01	2025-01-01	Yes	0
313	7	4	1	04	12	11	001	00	00	Pendapatan Denda Pajak Parkir	0	\N	\N	\N	2001-01-01	2025-01-01	\N	0
\.


--
-- Data for Name: s_rekening_copybaru; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_rekening_copybaru (s_idkorek, s_jenisobjek, s_tipekorek, s_kelompokkorek, s_jeniskorek, s_objekkorek, s_rinciankorek, s_sub1korek, s_sub2korek, s_sub3korek, s_namakorek, s_persentarifkorek, s_tarifdasarkorek, s_voldasarkorek, s_tariftambahkorek, s_tglawalkorek, s_tglakhirkorek, t_berdasarmasa, is_deluser) FROM stdin;
1	0	4	0	0	0	0	000	00	00	PENDAPATAN DAERAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
2	0	4	1	0	0	0	000	00	00	PENDAPATAN ASLI DAERAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
3	0	4	1	01	0	0	000	00	00	HASIL PAJAK DAERAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
4	1	4	1	01	06	00	000	00	00	Pajak Hotel	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
5	1	4	1	01	06	01	000	00	00	Pajak Hotel	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
6	1	4	1	01	06	01	001	00	00	Hotel	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
7	1	4	1	01	06	02	000	00	00	Pajak Motel	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
8	1	4	1	01	06	02	001	00	00	Motel	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
9	1	4	1	01	06	03	000	00	00	Pajak Losmen	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
10	1	4	1	01	06	03	001	00	00	Losmen	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
11	1	4	1	01	06	04	000	00	00	Pajak Gubuk Pariwisata	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
12	1	4	1	01	06	04	001	00	00	Gubuk Pariwisata	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
13	1	4	1	01	06	05	000	00	00	Pajak Wisma Pariwisata	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
14	5	4	1	01	10	02	002	00	00	Pajak Penerangan Jalan sumber lain (Non Industri)	7	\N	\N	\N	2021-01-01	2025-12-31	\N	0
15	1	4	1	01	06	06	000	00	00	Pajak Pesanggrahan	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
16	1	4	1	01	06	06	001	00	00	Pesanggrahan	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
17	1	4	1	01	06	07	000	00	00	Rumah Penginapan dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
18	1	4	1	01	06	08	001	00	00	Rumah Kos dengan jumlah kamar lebih dari 10 (sepuluh)	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
19	2	4	1	01	07	00	000	00	00	Pajak Restoran	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
20	2	4	1	01	07	01	000	00	00	Pajak Restoran dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
21	2	4	1	01	07	01	001	00	00	Restoran dan dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
22	2	4	1	01	07	02	000	00	00	Pajak Rumah Makan dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
23	2	4	1	01	07	02	001	00	00	Rumah Makan dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
24	2	4	1	01	07	03	000	00	00	Pajak Kafetaria dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
25	2	4	1	01	07	03	001	00	00	Kafetaria dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
27	2	4	1	01	07	04	000	00	00	Pajak Kantin dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
28	2	4	1	01	07	04	001	00	00	Kantin Kantin dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
29	2	4	1	01	07	05	000	00	00	Pajak Warung dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
30	2	4	1	01	07	05	001	00	00	Warung dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
31	2	4	1	01	07	06	000	00	00	Pajak Bar dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
32	2	4	1	01	07	06	001	00	00	Bar dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
33	2	4	1	01	07	07	000	00	00	Pajak  Jasa Boga/Katering dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
34	2	4	1	01	07	07	001	00	00	Jasa Boga /Katering dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
35	3	4	1	01	08	00	000	00	00	Pajak Hiburan	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
36	3	4	1	01	08	01	000	00	00	Pajak Tontonan Film / Bioskop	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
37	3	4	1	01	08	01	001	00	00	Tontonan Film / Bioskop	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
38	3	4	1	01	08	02	000	00	00	Pajak Pagelaran Kesenian/Musik/Tari/ Busana	5	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
39	3	4	1	01	08	02	001	00	00	Pagelaran Kesenian/Musik/Tari/ Busana	5	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
40	3	4	1	01	08	03	000	00	00	Pajak Kontes Kecantikan, Binaraga, dan Sejenisnya 	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
41	3	4	1	01	08	03	001	00	00	Kontes Kecantikan, Binaraga, dan Sejenisnya 	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
42	3	4	1	01	08	04	000	00	00	Pajak Pameran	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
43	3	4	1	01	08	04	001	00	00	Pameran	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
44	3	4	1	01	08	05	000	00	00	Pajak Diskotik, Karaoke, Klab Malam dan sejenisnya	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
45	3	4	1	01	08	05	001	00	00	Diskotik, Karaoke, Klab Malam dan sejenisnya	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
46	3	4	1	01	08	06	000	00	00	Pajak Sirkus / Akrobat/Sulap	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
47	3	4	1	01	08	06	001	00	00	Sirkus / Akrobat/Sulap	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
48	3	4	1	01	08	07	000	00	00	Pajak Permainan Bilyar dan  Bowling	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
49	3	4	1	01	08	07	001	00	00	Permainan Bilyar dan  Bowling	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
50	3	4	1	01	08	08	000	00	00	Pajak Pacuan Kuda, Kendaraan Bermotor, Permainan Ketangkasan	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
51	3	4	1	01	08	08	001	00	00	Pacuan Kuda, Kendaraan Bermotor, Permainan Ketangkasan	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
52	3	4	1	01	08	09	000	00	00	Pajak  Panti  Pijat,  Refleksi,  Mandi  Uap/Spa dan Pusat Kebugaran (Fitness Center)	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
53	3	4	1	01	08	09	001	00	00	Panti  Pijat,  Refleksi,  Mandi  Uap/Spa dan Pusat Kebugaran (Fitness Center)	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
54	3	4	1	01	08	10	000	00	00	Pertandingan Olahraga	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
55	3	4	1	01	08	10	001	00	00	Pertandingan Olahraga	15	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
56	4	4	1	01	09	00	000	00	00	Pajak Reklame	\N	\N	\N	\N	2019-01-01	2024-12-31	Yes	0
57	4	4	1	01	09	04	000	00	00	Reklame Selebaran	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
58	4	4	1	01	09	01	000	00	00	Pajak Reklame Papan/Billboard/Videotron/Megatron	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
59	4	4	1	01	09	01	001	00	00	Reklame Papan/Billboard/Videotron/Megatron	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
60	4	4	1	01	09	02	000	00	00	Pajak Reklame Kain	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
61	4	4	1	01	09	02	001	00	00	Reklame Kain	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
62	4	4	1	01	09	03	000	00	00	Pajak Reklame melekat/Stiker	\N	\N	\N	\N	2001-01-01	2001-01-01	\N	0
63	4	4	1	01	09	03	001	00	00	Reklame melekat/Stiker	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
64	4	4	1	01	09	04	000	00	00	Pajak Reklame Selebaran	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
65	4	4	1	01	09	04	001	00	00	Reklame Selebaran	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
66	4	4	1	01	09	06	000	00	00	Pajak Reklame Udara	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
67	4	4	1	01	09	06	001	00	00	Reklame Udara	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
68	4	4	1	01	09	07	000	00	00	Pajak Reklame Apung	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
69	4	4	1	01	09	07	001	00	00	Reklame Apung	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
70	4	4	1	01	09	08	000	00	00	Pajak Reklame Suara	20	\N	\N	\N	2019-01-01	2024-12-31	Yes	0
71	4	4	1	01	09	08	001	00	00	Reklame Suara	20	\N	\N	\N	2019-01-01	2024-12-31	Yes	0
72	4	4	1	01	09	09	000	00	00	Rekame Filem/Slide	20	\N	\N	\N	2019-01-01	2024-12-31	Yes	0
73	4	4	1	01	09	09	001	00	00	Rekame Filem/Slide	20	\N	\N	\N	2019-01-01	2024-12-31	Yes	0
74	4	4	1	01	09	10	000	00	00	Pajak Reklame Peragaan	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
75	4	4	1	01	09	10	001	00	00	Reklame Peragaan	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
76	5	4	1	01	10	00	000	00	00	Pajak Penerangan Jalan	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
77	5	4	1	01	10	01	001	00	00	Pajak Penerangan Jalan dihasilkan sendiri	1.5	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
78	5	4	1	01	10	02	001	00	00	Pajak Penerangan Jalan sumber lain (Industri)	3	\N	\N	\N	2020-01-01	2025-12-31	Yes	0
79	7	4	1	01	11	00	000	00	00	Pajak Parkir	20	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
80	7	4	1	01	11	01	000	00	00	Pajak Parkir	20	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
81	8	4	1	01	12	00	000	00	00	Pajak Air Tanah	20	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
82	8	4	1	01	12	01	001	00	00	Air Tanah	20	2668	\N	\N	2020-01-01	2022-12-31	Yes	0
83	9	4	1	01	13	00	000	00	00	Pajak Sarang Burung Walet	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
84	9	4	1	01	13	01	000	00	00	Pajak Sarang Burung Walet	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
85	6	4	1	01	14	00	000	00	00	Pajak Mineral Bukan Logam dan Batuan	0	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
86	6	4	1	01	14	01	001	00	00	Asbes	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
87	6	4	1	01	14	02	001	00	00	Batu Tulis	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
88	6	4	1	01	14	03	001	00	00	Batu Setengah Permata	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
89	6	4	1	01	14	04	001	00	00	Batu Kapur	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
90	6	4	1	01	14	05	001	00	00	Batu Apung	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
91	6	4	1	01	14	06	001	00	00	Batu Permata	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
92	6	4	1	01	14	07	001	00	00	Bentonit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
93	6	4	1	01	14	08	001	00	00	Dolomit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
94	6	4	1	01	14	09	001	00	00	Feldspar	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
95	6	4	1	01	14	10	001	00	00	Garam Batu (Halite)	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
96	6	4	1	01	14	11	001	00	00	Grafit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
97	6	4	1	01	14	12	001	00	00	Granit / Andesit	5	150000	\N	\N	2020-01-01	2022-12-31	Yes	0
98	6	4	1	01	14	13	001	00	00	Gips	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
99	6	4	1	01	14	14	001	00	00	Kalsit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
100	6	4	1	01	14	15	001	00	00	Kaolin	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
101	6	4	1	01	14	16	001	00	00	Leusit	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
102	6	4	1	01	14	17	001	00	00	Magnesit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
103	6	4	1	01	14	18	001	00	00	Mika	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
104	6	4	1	01	14	19	001	00	00	Marmer	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
105	6	4	1	01	14	20	001	00	00	Nitrat	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
106	6	4	1	01	14	21	001	00	00	Opsidien	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
107	6	4	1	01	14	22	001	00	00	Oker	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
108	6	4	1	01	14	23	001	00	00	Pasir dan kerikil	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
109	6	4	1	01	14	24	001	00	00	Pasir Kuarsa	15	60000	\N	\N	2020-01-01	2022-12-31	Yes	0
110	6	4	1	01	14	25	001	00	00	Perlit	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
111	6	4	1	01	14	26	001	00	00	Phospat	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
112	6	4	1	01	14	27	001	00	00	Talk	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
113	6	4	1	01	14	28	001	00	00	Tanah Serap (Fullers earth)	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
114	6	4	1	01	14	29	001	00	00	Tanah Diatome	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
115	6	4	1	01	14	30	001	00	00	Tanah Liat	5	80000	\N	\N	2020-01-01	2022-12-31	Yes	0
116	6	4	1	01	14	31	001	00	00	Tawas (Alum)	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
117	6	4	1	01	14	32	001	00	00	Tras	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
118	6	4	1	01	14	33	001	00	00	Yarosif	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
119	6	4	1	01	14	34	001	00	00	Zeolit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
120	6	4	1	01	14	35	001	00	00	Basal	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
121	6	4	1	01	14	36	001	00	00	Trakit	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
122	6	4	1	01	14	37	001	00	00	Mineral bukan logam dan lainnya	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
123	10	4	1	01	15	00	000	00	00	Pajak  Bumi  dan  Bangunan  Perdesaan  dan Perkotaan (PBBP2)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
124	10	4	1	01	15	01	001	00	00	PBBP2	2	\N	\N	\N	2020-01-01	2022-12-31	\N	0
125	11	4	1	01	16	00	000	00	00	Bea Perolehan Hak Atas Tanah dan Bangunan (BPHTB)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
126	11	4	1	01	16	01	000	00	00	BPHTB - Pemindahan Hak	5	\N	\N	\N	2020-01-01	2022-12-31	\N	0
127	11	4	1	01	16	02	000	00	00	BPHTB - Pemberian Hak Baru	5	\N	\N	\N	2020-01-01	2022-12-31	\N	0
162	0	4	1	03	0	0	000	00	00	HASIL PENGELOLAAN KEKAYAAN DAERAH YANG DIPISAHKAN	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
163	0	4	1	03	01	00	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMN	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
164	0	4	1	03	01	01	000	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Daerah/BUMD ........	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
165	0	4	1	03	02	00	000	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Milik Negara/BUMN	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
166	0	4	1	03	02	01	000	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada BUMN ..............	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
167	0	4	1	03	03	00	000	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Milik Swasta	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
168	0	4	1	03	03	01	000	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Milik Swasta…….	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
169	0	4	1	04	0	0	000	00	00	LAIN-LAIN PENDAPATAN ASLI DAERAH YANG SAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
170	0	4	1	04	01	00	000	00	00	Hasil Penjualan Aset Daerah Yang Tidak Dipisahkan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
171	0	4	1	04	01	01	000	00	00	Hasil Penjualan Tanah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
172	0	4	1	04	01	02	000	00	00	Hasil Penjualan Peralatan dan Mesin	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
173	0	4	1	04	01	03	000	00	00	Hasil Penjualan Gedung dan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
174	0	4	1	04	01	04	000	00	00	Hasil Penjualan Jalan, Irigasi dan Jaringan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
175	0	4	1	04	01	05	000	00	00	Hasil Penjualan Aset Tetap Lainnya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
176	0	4	1	04	02	00	000	00	00	Hasil Penjualan Aset Lainnya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
177	0	4	1	04	02	01	000	00	00	Hasil Penjualan Aset Lainnya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
178	0	4	1	04	03	00	000	00	00	Jasa Giro	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
179	0	4	1	04	03	01	000	00	00	Jasa Giro Kas Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
180	0	4	1	04	03	02	000	00	00	Jasa Giro Bendahara	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
181	0	4	1	04	03	03	000	00	00	Jasa Giro Dana Cadangan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
182	0	4	1	04	04	00	000	00	00	Pendapatan Bunga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
183	0	4	1	04	04	01	000	00	00	Pendapatan Bunga Deposito	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
184	0	4	1	04	04	02	000	00	00	Dana Bergulir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
185	0	4	1	04	05	00	000	00	00	Tuntutan Ganti Kerugian Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
186	0	4	1	04	05	01	000	00	00	Tuntutan Ganti Kerugian Daerah Terhadap Bendahara	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
187	0	4	1	04	05	02	000	00	00	Tuntutan Ganti Kerugian Daerah Terhadap Pegawai Negeri Bukan Bendahara	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
188	0	4	1	04	06	00	000	00	00	Komisi, Potongan dan Keuntungan Selisih Nilai Tukar Rupiah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
189	0	4	1	04	06	01	000	00	00	Penerimaan Komisi dari Penempatan Kas Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
190	0	4	1	04	06	02	000	00	00	Penerimaan Potongan dari	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
191	0	4	1	04	06	03	000	00	00	Penerimaan Keuntungan Selisih Nilai Tukar Rupiah dari ...	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
192	0	4	1	04	07	00	000	00	00	Pendapatan Denda Atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
193	0	4	1	04	07	01	000	00	00	Pendapatan Denda Atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
194	0	4	1	04	12	00	000	00	00	Pendapatan Denda Pajak	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
245	4	4	1	01	04	01	01	00	00	Reklame Papan	25	0	0	0	2020-01-01	2022-12-31	\N	0
246	4	4	1	01	04	01	02	00	00	Reklame Billboard	25	0	0	0	2020-01-01	2022-12-31	\N	0
247	4	4	1	01	04	01	03	00	00	Reklame Bersinar Papan	25	0	0	0	2020-01-01	2022-12-31	\N	0
248	4	4	1	01	04	01	04	00	00	Reklame Bersinar Megatron/Billboard	25	0	0	0	2020-01-01	2022-12-31	\N	0
249	4	4	1	01	04	01	05	00	00	Reklame Bersinar Neon Box	25	0	0	0	2020-01-01	2022-12-31	\N	0
252	11	4	1	01	16	01	001	00	00	BPHTB-Pemindahan Hak	0	0	0	0	2021-01-01	2025-01-01	\N	0
253	11	4	1	01	16	02	001	00	00	BPHTB-Pemberian Hak Baru	0	0	0	0	2021-01-01	2025-01-01	\N	0
254	6	4	1	01	14	38	001	00	00	Zirkon	15	1000000	0	0	2021-01-01	2025-12-31	\N	0
255	6	4	1	01	14	39	001	00	00	Intan	15	5000000	0	0	2021-01-01	2025-12-31	\N	0
256	6	4	1	01	14	40	001	00	00	Batu Belah > 5cm (Granit/Andesit/Granodiorit)	5	150000	0	0	2021-01-01	2025-12-31	\N	0
257	6	4	1	01	14	41	001	00	00	Batu Split 1-5 cm (Granit/Andesit/Granodiorit)	5	175000	0	0	2021-01-01	2025-12-31	\N	0
258	6	4	1	01	14	42	001	00	00	Tanah Sirtu	5	125000	0	0	2021-01-01	2025-12-31	\N	0
259	6	4	1	01	14	43	001	00	00	Tanah Kuning	5	90000	0	0	2021-01-01	2025-12-31	\N	0
260	6	4	1	01	14	44	001	00	00	Tanah Urug	5	80000	0	0	2021-01-01	2025-12-31	\N	0
261	6	4	1	01	14	45	001	00	00	Tanah Merah (Lateri)	5	90000	0	0	2021-01-01	2025-12-31	\N	0
262	6	4	1	01	14	46	001	00	00	Pasir Beton	5	60000	0	0	2021-01-01	2025-12-31	\N	0
263	6	4	1	01	14	47	001	00	00	Pasir Urug	5	40000	0	0	2021-01-01	2025-12-31	\N	0
264	6	4	1	01	14	48	001	00	00	Batu Bata / Genteng	5	600	0	0	2021-01-01	2025-12-31	\N	0
265	1	4	1	01	06	07	001	00	00	Penginapan dan sejenisnya	10	0	0	0	2020-01-01	2025-12-13	Yes	0
266	1	4	1	01	06	08	000	00	00	Pajak Rumah Kos dengan Jumlah Kamar \nLebih dari 10 (Sepuluh)	10	0	0	0	2020-01-01	2025-12-13	Yes	0
267	8	4	1	01	12	01	000	00	0	Pajak Air Tanah	20	0	0	0	2020-01-01	2025-12-31	Yes	0
268	5	4	1	01	10	01	000	00	00	Pajak Penerangan Jalan dihasilkan sendiri	1.5	0	0	0	2020-01-01	2025-12-31	Yes	0
269	5	4	1	01	10	02	000	00	00	Pajak Penerangan Jalan sumber lain	3	0	0	0	2020-01-01	2025-12-31	Yes	0
270	1	4	1	04	12	06	000	00	00	Pendapatan Denda Pajak Hotel	\N	\N	\N	\N	2020-01-01	2026-01-18	\N	0
271	1	4	1	04	12	06	001	00	00	Pendapatan Denda Pajak Hotel	\N	\N	\N	\N	2020-01-01	2026-02-05	\N	0
272	1	4	1	04	12	06	002	00	00	Pendapatan Denda Pajak Motel	\N	\N	\N	\N	2020-01-01	2026-02-23	\N	0
273	1	4	1	04	12	06	003	00	00	Pendapatan Denda Pajak Losmen	\N	\N	\N	\N	2020-01-01	2026-03-13	\N	0
274	1	4	1	04	12	06	004	00	00	Pendapatan Denda Pajak Gubuk Pariwisata	\N	\N	\N	\N	2020-01-01	2026-03-31	\N	0
275	1	4	1	04	12	06	005	00	00	Pendapatan Denda Pajak Wisma Pariwisata	\N	\N	\N	\N	2020-01-01	2026-04-18	\N	0
276	1	4	1	04	12	06	006	00	00	Pendapatan Denda Pajak Pesanggrahan	\N	\N	\N	\N	2020-01-01	2026-05-06	\N	0
277	1	4	1	04	12	06	007	00	00	Pendapatan Denda Pajak Rumah Penginapan dan Sejenisnya	\N	\N	\N	\N	2020-01-01	2026-05-24	\N	0
278	1	4	1	04	12	06	008	00	00	Pendapatan Denda Pajak Rumah Kos dengan Jumlah Kamar Lebih dari 10 (Sepuluh)	\N	\N	\N	\N	2020-01-01	2026-06-11	\N	0
279	2	4	1	04	12	07	000	00	00	Pendapatan Denda Pajak Restoran	\N	\N	\N	\N	2020-01-01	2026-06-29	\N	0
280	2	4	1	04	12	07	001	00	00	Pendapatan Denda Pajak Restoran dan Sejenisnya	\N	\N	\N	\N	2020-01-01	2026-07-17	\N	0
281	2	4	1	04	12	07	002	00	00	Pendapatan Denda Pajak Rumah Makan dan Sejenisnya	\N	\N	\N	\N	2020-01-01	2026-08-04	\N	0
282	2	4	1	04	12	07	003	00	00	Pendapatan Denda Pajak Kafetaria dan Sejenisnya	\N	\N	\N	\N	2020-01-01	2026-08-22	\N	0
283	2	4	1	04	12	07	004	00	00	Pendapatan Denda Pajak Kantin dan Sejenisnya	\N	\N	\N	\N	2020-01-01	2026-09-09	\N	0
284	2	4	1	04	12	07	005	00	00	Pendapatan Denda Pajak Warung dan Sejenisnya	\N	\N	\N	\N	2020-01-01	2026-09-27	\N	0
285	2	4	1	04	12	07	006	00	00	Pendapatan Denda Pajak Bar dan Sejenisnya	\N	\N	\N	\N	2020-01-01	2026-10-15	\N	0
286	2	4	1	04	12	07	007	00	00	Pendapatan Jasa Boga/Katering dan Sejenisnya	\N	\N	\N	\N	2020-01-01	2026-11-02	\N	0
287	3	4	1	04	12	08	000	00	00	Pendapatan Denda Pajak Hiburan	\N	\N	\N	\N	2020-01-01	2026-11-20	\N	0
288	3	4	1	04	12	08	001	00	00	Pendapatan Denda Pajak Tontonan Film	\N	\N	\N	\N	2020-01-01	2026-12-08	\N	0
289	3	4	1	04	12	08	002	00	00	Pendapatan Denda Pajak Pagelaran	\N	\N	\N	\N	2020-01-01	2026-12-26	\N	0
290	3	4	1	04	12	08	003	00	00	Pendapatan Denda Pajak Kontes Kecantikan, Binaraga, dan Sejenisnya	\N	\N	\N	\N	2020-01-01	2027-01-13	\N	0
291	3	4	1	04	12	08	004	00	00	Pendapatan Denda Pajak Pameran	\N	\N	\N	\N	2020-01-01	2027-01-31	\N	0
292	3	4	1	04	12	08	005	00	00	Pendapatan Denda Pajak Diskotik, Karaoke, Klub Malam, dan Sejenisnya	\N	\N	\N	\N	2020-01-01	2027-02-18	\N	0
293	3	4	1	04	12	08	006	00	00	Pendapatan Denda Pajak Sirkus/Akrobat/ Sulap	\N	\N	\N	\N	2020-01-01	2027-03-08	\N	0
294	3	4	1	04	12	08	007	00	00	Pendapatan Denda Pajak Permainan Biliar dan Bowling	\N	\N	\N	\N	2020-01-01	2027-03-26	\N	0
295	3	4	1	04	12	08	008	00	00	Pendapatan Denda Pajak Pacuan Kuda, Kendaraan Bermotor, dan Permainan Ketangkasan	\N	\N	\N	\N	2020-01-01	2027-04-13	\N	0
296	3	4	1	04	12	08	009	00	00	Pendapatan Denda Pajak Panti Pijat, Refleksi, Mandi Uap/Spa, dan Pusat Kebugaran (Fitness Center	\N	\N	\N	\N	2020-01-01	2027-05-01	\N	0
297	3	4	1	04	12	08	010	00	00	Pendapatan Denda Pajak Pertandingan Olahraga	\N	\N	\N	\N	2020-01-01	2027-05-19	\N	0
298	4	4	1	04	12	09	000	00	00	Pendapatan Denda Pajak Reklame	\N	\N	\N	\N	2020-01-01	2027-06-06	\N	0
299	4	4	1	04	12	09	001	00	00	Pendapatan Denda Pajak Reklame Papan/ Billboard/Videotron/Megatron	\N	\N	\N	\N	2020-01-01	2027-06-24	\N	0
300	4	4	1	04	12	09	002	00	00	Pendapatan Denda Pajak Reklame Kain	\N	\N	\N	\N	2020-01-01	2027-07-12	\N	0
301	4	4	1	04	12	09	003	00	00	Pendapatan Denda Pajak Reklame Melekat/Stiker	\N	\N	\N	\N	2020-01-01	2027-07-30	\N	0
302	4	4	1	04	12	09	004	00	00	Pendapatan Denda Pajak Reklame Selebaran	\N	\N	\N	\N	2020-01-01	2027-08-17	\N	0
303	4	4	1	04	12	09	005	00	00	Pendapatan Denda Pajak Reklame Berjalan	\N	\N	\N	\N	2020-01-01	2027-09-04	\N	0
304	4	4	1	04	12	09	006	00	00	Pendapatan Denda Pajak Reklame Udara	\N	\N	\N	\N	2020-01-01	2027-09-22	\N	0
305	4	4	1	04	12	09	007	00	00	Pendapatan Denda Pajak Reklame Apung	\N	\N	\N	\N	2020-01-01	2027-10-10	\N	0
306	4	4	1	04	12	09	008	00	00	Pendapatan Denda Pajak Reklame Suara	\N	\N	\N	\N	2020-01-01	2027-10-28	\N	0
307	4	4	1	04	12	09	009	00	00	Pendapatan Denda Pajak Reklame Film/Slide	\N	\N	\N	\N	2020-01-01	2027-11-15	\N	0
308	4	4	1	04	12	09	010	00	00	Pendapatan Denda Pajak Reklame Peragaan	\N	\N	\N	\N	2020-01-01	2027-12-03	\N	0
309	5	4	1	04	12	10	000	00	00	Pendapatan Denda Pajak Penerangan Jalan	\N	\N	\N	\N	2020-01-01	2027-12-21	\N	0
310	5	4	1	04	12	10	001	00	00	Pendapatan Denda Pajak Penerangan Jalan Dihasilkan Sendiri	\N	\N	\N	\N	2020-01-01	2028-01-08	\N	0
311	5	4	1	04	12	10	002	00	00	Pendapatan Denda Pajak Penerangan Jalan Sumber Lain	\N	\N	\N	\N	2020-01-01	2028-01-26	\N	0
312	6	4	1	04	12	11	000	00	00	Pendapatan Denda Pajak Parkir	\N	\N	\N	\N	2020-01-01	2028-02-13	\N	0
313	6	4	1	04	12	11	001	00	00	Pendapatan Denda Pajak Parkir	\N	\N	\N	\N	2020-01-01	2028-03-02	\N	0
314	7	4	1	04	12	12	000	00	00	Pendapatan Denda Pajak Air Tanah	\N	\N	\N	\N	2020-01-01	2028-03-20	\N	0
315	7	4	1	04	12	12	001	00	00	Pendapatan Denda Pajak Air Tanah	\N	\N	\N	\N	2020-01-01	2028-04-07	\N	0
316	9	4	1	04	12	13	000	00	00	Pendapatan Denda Pajak Sarang Burung Walet	\N	\N	\N	\N	2020-01-01	2028-04-25	\N	0
317	9	4	1	04	12	13	001	00	00	Pendapatan Denda Pajak Sarang Burung Walet	\N	\N	\N	\N	2020-01-01	2028-05-13	\N	0
318	8	4	1	04	12	14	000	00	00	Pendapatan Denda Pajak Mineral Bukan Logam dan Batuan	\N	\N	\N	\N	2020-01-01	2028-05-31	\N	0
319	8	4	1	04	12	14	001	00	00	Pendapatan Denda Pajak Asbes	\N	\N	\N	\N	2020-01-01	2028-06-18	\N	0
320	8	4	1	04	12	14	002	00	00	Pendapatan Denda Pajak Batu Tulis	\N	\N	\N	\N	2020-01-01	2028-07-06	\N	0
321	8	4	1	04	12	14	003	00	00	Pendapatan Denda Pajak Batu Setengah Permata	\N	\N	\N	\N	2020-01-01	2028-07-24	\N	0
322	8	4	1	04	12	14	004	00	00	Pendapatan Denda Pajak Batu Kapur	\N	\N	\N	\N	2020-01-01	2028-08-11	\N	0
323	8	4	1	04	12	14	005	00	00	Pendapatan Denda Pajak Batu Apung	\N	\N	\N	\N	2020-01-01	2028-08-29	\N	0
324	8	4	1	04	12	14	006	00	00	Pendapatan Denda Pajak Batu Permata	\N	\N	\N	\N	2020-01-01	2028-09-16	\N	0
325	8	4	1	04	12	14	007	00	00	Pendapatan Denda Pajak Bentonit	\N	\N	\N	\N	2020-01-01	2028-10-04	\N	0
326	8	4	1	04	12	14	008	00	00	Pendapatan Denda Pajak Dolomit	\N	\N	\N	\N	2020-01-01	2028-10-22	\N	0
327	8	4	1	04	12	14	009	00	00	Pendapatan Denda Pajak Felspar	\N	\N	\N	\N	2020-01-01	2028-11-09	\N	0
328	8	4	1	04	12	14	010	00	00	Pendapatan Denda Pajak Garam Batu (Halite)	\N	\N	\N	\N	2020-01-01	2028-11-27	\N	0
329	8	4	1	04	12	14	011	00	00	Pendapatan Denda Pajak Grafit	\N	\N	\N	\N	2020-01-01	2028-12-15	\N	0
330	8	4	1	04	12	14	012	00	00	Pendapatan Denda Pajak Granit/Andesit	\N	\N	\N	\N	2020-01-01	2029-01-02	\N	0
331	8	4	1	04	12	14	013	00	00	Pendapatan Denda Pajak Gips	\N	\N	\N	\N	2020-01-01	2029-01-20	\N	0
332	8	4	1	04	12	14	014	00	00	Pendapatan Denda Pajak Kalsit	\N	\N	\N	\N	2020-01-01	2029-02-07	\N	0
333	8	4	1	04	12	14	015	00	00	Pendapatan Denda Pajak Kaolin	\N	\N	\N	\N	2020-01-01	2029-02-25	\N	0
334	8	4	1	04	12	14	016	00	00	Pendapatan Denda Pajak Leusit	\N	\N	\N	\N	2020-01-01	2029-03-15	\N	0
335	8	4	1	04	12	14	017	00	00	Pendapatan Denda Pajak Magnesit	\N	\N	\N	\N	2020-01-01	2029-04-02	\N	0
336	8	4	1	04	12	14	018	00	00	Pendapatan Denda Pajak Mika	\N	\N	\N	\N	2020-01-01	2029-04-20	\N	0
337	8	4	1	04	12	14	019	00	00	Pendapatan Denda Pajak Marmer	\N	\N	\N	\N	2020-01-01	2029-05-08	\N	0
338	8	4	1	04	12	14	020	00	00	Pendapatan Denda Pajak Nitrat	\N	\N	\N	\N	2020-01-01	2029-05-26	\N	0
339	8	4	1	04	12	14	021	00	00	Pendapatan Denda Pajak Opsidien	\N	\N	\N	\N	2020-01-01	2029-06-13	\N	0
340	8	4	1	04	12	14	022	00	00	Pendapatan Denda Pajak Oker	\N	\N	\N	\N	2020-01-01	2029-07-01	\N	0
341	8	4	1	04	12	14	023	00	00	Pendapatan Denda Pajak Pasir dan Kerikil	\N	\N	\N	\N	2020-01-01	2029-07-19	\N	0
342	8	4	1	04	12	14	024	00	00	Pendapatan Denda Pajak Pasir Kuarsa	\N	\N	\N	\N	2020-01-01	2029-08-06	\N	0
343	8	4	1	04	12	14	025	00	00	Pendapatan Denda Pajak Perlit	\N	\N	\N	\N	2020-01-01	2029-08-24	\N	0
344	8	4	1	04	12	14	026	00	00	Pendapatan Denda Pajak Phospat	\N	\N	\N	\N	2020-01-01	2029-09-11	\N	0
345	8	4	1	04	12	14	027	00	00	Pendapatan Denda Pajak Talk	\N	\N	\N	\N	2020-01-01	2029-09-29	\N	0
346	8	4	1	04	12	14	028	00	00	Pendapatan Denda Pajak Tanah Serap (Fullers Earth)	\N	\N	\N	\N	2020-01-01	2029-10-17	\N	0
347	8	4	1	04	12	14	029	00	00	Pendapatan Denda Pajak Tanah Diatome	\N	\N	\N	\N	2020-01-01	2029-11-04	\N	0
348	8	4	1	04	12	14	030	00	00	Pendapatan Denda Pajak Tanah Liat	\N	\N	\N	\N	2020-01-01	2029-11-22	\N	0
349	8	4	1	04	12	14	031	00	00	Pendapatan Denda Pajak Tawas (Alum)	\N	\N	\N	\N	2020-01-01	2029-12-10	\N	0
350	8	4	1	04	12	14	032	00	00	Pendapatan Denda Pajak Tras	\N	\N	\N	\N	2020-01-01	2029-12-28	\N	0
351	8	4	1	04	12	14	033	00	00	Pendapatan Denda Pajak Yarosif	\N	\N	\N	\N	2020-01-01	2030-01-15	\N	0
352	8	4	1	04	12	14	034	00	00	Pendapatan Denda Pajak Zeolit	\N	\N	\N	\N	2020-01-01	2030-02-02	\N	0
353	8	4	1	04	12	14	035	00	00	Pendapatan Denda Pajak Basal	\N	\N	\N	\N	2020-01-01	2030-02-20	\N	0
354	8	4	1	04	12	14	036	00	00	Pendapatan Denda Pajak Trakit	\N	\N	\N	\N	2020-01-01	2030-03-10	\N	0
355	8	4	1	04	12	14	037	00	00	Pendapatan Denda Pajak Mineral Bukan Logam dan Batuan Lainnya	\N	\N	\N	\N	2020-01-01	2030-03-28	\N	0
356	10	4	1	04	12	15	000	00	00	Pendapatan Denda Pajak Bumi dan Bangunan Perdesaan dan Perkotaan (PBBP2)	\N	\N	\N	\N	2020-01-01	2030-04-15	\N	0
357	10	4	1	04	12	15	001	00	00	Pendapatan Denda Pajak Bumi dan Bangunan Perdesaan dan Perkotaan (PBBP2)	\N	\N	\N	\N	2020-01-01	2030-05-03	\N	0
358	11	4	1	04	12	16	000	00	00	Pendapatan Denda Bea Perolehan Hak atas Tanah dan Bangunan (BPHTB)	\N	\N	\N	\N	2020-01-01	2030-05-21	\N	0
359	11	4	1	04	12	16	001	00	00	Pendapatan Denda BPHTB-Pemindahan Hak	\N	\N	\N	\N	2020-01-01	2030-06-08	\N	0
360	11	4	1	04	12	16	002	00	00	Pendapatan Denda BPHTB-Pemberian Hak Baru	\N	\N	\N	\N	2020-01-01	2030-06-26	\N	0
361	7	4	1	01	11	01	001	00	00	Parkir	20	0	0	0	2020-01-01	2025-12-31	Yes	0
362	9	4	1	01	13	01	001	00	00	Sarang Burung Walet	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
363	0	4	1	02	01	00	000	00	00	Retribusi Jasa Umum	0	\N	\N	\N	2020-01-01	2019-12-31	\N	0
364	12	4	1	02	01	01	000	00	00	Retribusi Pelayanan Kesehatan 	0	\N	\N	\N	2020-01-01	2016-12-31	\N	0
365	12	4	1	02	01	01	001	00	00	Retribusi Pelayanan Kesehatan di Puskesmas	0	\N	\N	\N	2020-01-01	2013-12-31	\N	0
366	12	4	1	02	01	01	002	00	00	Retribusi Pelayanan Kesehatan di Puskesmas Keliling	0	\N	\N	\N	2020-01-01	2010-12-31	\N	0
367	12	4	1	02	01	01	003	00	00	Retribusi Pelayanan Kesehatan di Puskesmas Pembantu	0	\N	\N	\N	2020-01-01	2007-12-31	\N	0
368	12	4	1	02	01	01	004	00	00	Retribusi Pelayanan Kesehatan di Balai Pengobatan	0	\N	\N	\N	2020-01-01	2004-12-31	\N	0
369	12	4	1	02	01	01	005	00	00	Retribusi Pelayanan Kesehatan di Rumah Sakit Umum Daerah	0	\N	\N	\N	2020-01-01	2001-12-31	\N	0
370	12	4	1	02	01	01	006	00	00	Retribusi Pelayanan Kesehatan di Tempat Pelayanan Kesehatan Lainnya yang Sejenis	0	\N	\N	\N	2020-01-01	1998-12-31	\N	0
371	13	4	1	02	01	02	000	00	00	Retribusi Pelayanan Persampahan/Kebersihan	0	\N	\N	\N	2020-01-01	1995-12-31	\N	0
372	13	4	1	02	01	02	001	00	00	Retribusi Pelayanan Persampahan/ Kebersihan	0	\N	\N	\N	2020-01-01	1992-12-31	\N	0
373	15	4	1	02	01	03	000	00	00	Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	0	\N	\N	\N	2020-01-01	1989-12-31	\N	0
374	15	4	1	02	01	03	001	00	00	Retribusi Pelayanan Penguburan/Pemakaman termasuk Penggalian dan Pengurukan serta Pembakaran/Pengabuan Mayat	0	\N	\N	\N	2020-01-01	1986-12-31	\N	0
375	16	4	1	02	01	04	000	00	00	Retribusi Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2020-01-01	1983-12-31	\N	0
376	16	4	1	02	01	04	001	00	00	Retribusi Penyediaan Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2020-01-01	1980-12-31	\N	0
377	17	4	1	02	01	05	000	00	00	Retribusi Pelayanan Pasar	0	\N	\N	\N	2020-01-01	1977-12-31	\N	0
381	18	4	1	02	01	06	000	00	00	Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2020-01-01	1965-12-31	\N	0
382	18	4	1	02	01	06	001	00	00	Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2020-01-01	1962-12-31	\N	0
383	19	4	1	02	01	07	000	00	00	Retribusi Pemeriksaan Alat Pemadam Kebakaran	0	\N	\N	\N	2020-01-01	1959-12-31	\N	0
384	19	4	1	02	01	07	001	00	00	Retribusi Pelayanan Pemeriksaan dan/atau Pengujian Alat Pemadam Kebakaran	0	\N	\N	\N	2020-01-01	1956-12-31	\N	0
385	19	4	1	02	01	07	002	00	00	Retribusi Pelayanan Pemeriksaan dan/atau Pengujian Alat Penanggulangan Kebakaran	0	\N	\N	\N	2020-01-01	1953-12-31	\N	0
386	19	4	1	02	01	07	003	00	00	Retribusi Pelayanan Pemeriksaan dan/atau Pengujian Alat Penyelamatan Jiwa	0	\N	\N	\N	2020-01-01	1950-12-31	\N	0
387	20	4	1	02	01	08	000	00	00	Retribusi Penggantian Biaya Cetak Peta	0	\N	\N	\N	2020-01-01	1947-12-31	\N	0
388	20	4	1	02	01	08	001	00	00	Retribusi Penyediaan Peta Dasar (Garis)	0	\N	\N	\N	2020-01-01	1944-12-31	\N	0
389	20	4	1	02	01	08	002	00	00	Retribusi Penyediaan Peta Foto	0	\N	\N	\N	2020-01-01	1941-12-31	\N	0
390	20	4	1	02	01	08	003	00	00	Retribusi Penyediaan Peta Digital	0	\N	\N	\N	2020-01-01	1938-12-31	\N	0
391	20	4	1	02	01	08	004	00	00	Retribusi Penyediaan Peta Tematik	0	\N	\N	\N	2020-01-01	1935-12-31	\N	0
392	20	4	1	02	01	08	005	00	00	Retribusi Penyediaan Peta Teknis (Struktur)	0	\N	\N	\N	2020-01-01	1932-12-31	\N	0
393	20	4	1	02	01	09	000	00	00	Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2020-01-01	1929-12-31	\N	0
394	21	4	1	02	01	09	001	00	00	Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2020-01-01	1926-12-31	\N	0
395	22	4	1	02	01	10	000	00	00	Retribusi Pengolahan Limbah Cair	0	\N	\N	\N	2020-01-01	1923-12-31	\N	0
396	22	4	1	02	01	10	001	00	00	Retribusi Rumah Tangga	0	\N	\N	\N	2020-01-01	1920-12-31	\N	0
397	22	4	1	02	01	10	002	00	00	Retribusi Perkantoran	0	\N	\N	\N	2020-01-01	1917-12-31	\N	0
398	22	4	1	02	01	10	003	00	00	Retribusi Industri	0	\N	\N	\N	2020-01-01	1914-12-31	\N	0
399	23	4	1	02	01	11	000	00	00	Retribusi Pelayanan Tera/Tera Ulang	0	\N	\N	\N	2020-01-01	1911-12-31	\N	0
400	23	4	1	02	01	11	001	00	00	Retribusi Pelayanan Pengujian Alat-Alat Ukur, Takar, Timbang, dan Perlengkapannya	0	\N	\N	\N	2020-01-01	1908-12-31	\N	0
401	23	4	1	02	01	11	002	00	00	Retribusi Pengujian Barang dalam Keadaan Terbungkus	0	\N	\N	\N	2020-01-01	1905-12-31	\N	0
402	24	4	1	02	01	12	000	00	00	Retribusi Pelayanan Pendidikan	0	\N	\N	\N	2020-01-01	1902-12-31	\N	0
403	24	4	1	02	01	12	001	00	00	Retribusi Pelayanan Penyelenggaraan Pendidikan Teknis	0	\N	\N	\N	2020-01-01	0001-01-01	\N	0
404	24	4	1	02	01	12	002	00	00	Retribusi Pelayanan Penyelenggaraan Pelatihan Teknis	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
405	24	4	1	02	01	12	003	00	00	Retribusi Pelayanan Penyelenggaraan Pendidikan dan Pelatihan Teknis	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
406	25	4	1	02	01	13	000	00	00	Retribusi Pengawasan dan Pengendalian Menara Telekomunikasi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
407	25	4	1	02	01	13	001	00	00	Retribusi Pengawasan dan Pengendalian Menara Telekomunikasi 	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
408	0	4	1	02	02	00	000	00	00	Retribusi Jasa Usaha	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
380	17	4	1	02	01	05	003	00	00	Retribusi Kios	0	2000	\N	\N	2020-01-01	1968-12-31	\N	0
378	17	4	1	02	01	05	001	00	00	Retribusi Pelataran	0	2000	\N	\N	2020-01-01	1974-12-31	\N	0
409	26	4	1	02	02	01	000	00	00	Retribusi Pemakaian Kekayaan Daerah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
410	26	4	1	02	02	01	001	00	00	Retribusi Penyewaan Tanah dan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
411	26	4	1	02	02	01	002	00	00	Retribusi Penyewaan Tanah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
412	26	4	1	02	02	01	003	00	00	Retribusi Penyewaan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
413	26	4	1	02	02	01	004	00	00	Retribusi Pemakaian Laboratorium	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
414	26	4	1	02	02	01	005	00	00	Retribusi Pemakaian Ruangan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
415	26	4	1	02	02	01	006	00	00	Retribusi Pemakaian Kendaraan Bermotor	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
416	27	4	1	02	02	02	000	00	00	Retribusi Pasar Grosir dan/atau Pertokoan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
417	27	4	1	02	02	02	001	00	00	Retribusi Penyediaan Fasilitas Pasar Grosir Berbagai Jenis Barang yang Dikontrakkan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
418	27	4	1	02	02	02	002	00	00	Retribusi Penyediaan Fasilitas Pasar/Pertokoan yang Dikontrakkan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
419	28	4	1	02	02	03	000	00	00	Retribusi Tempat Pelelangan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
420	28	4	1	02	02	03	001	00	00	Retribusi Penyediaan Tempat Pelelangan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
421	28	4	1	02	02	03	002	00	00	Retribusi Penyediaan Fasilitas Lainnya di Tempat Pelelangan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
422	29	4	1	02	02	04	000	00	00	Retribusi Terminal	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
423	29	4	1	02	02	04	001	00	00	Retribusi Pelayanan Penyediaan Tempat Parkir untuk Kendaraan Penumpang dan Bus Umum	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
424	29	4	1	02	02	04	002	00	00	Retribusi Pelayanan Penyediaan Tempat Kegiatan Usaha	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
425	29	4	1	02	02	04	003	00	00	Retribusi Pelayanan Penyediaan Fasilitas Lainnya di Lingkungan Terminal	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
426	30	4	1	02	02	05	000	00	00	Retribusi Tempat Khusus Parkir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
427	30	4	1	02	02	05	001	00	00	Retribusi Pelayanan Tempat Khusus Parkir	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
428	31	4	1	02	02	06	000	00	00	Retribusi Tempat Penginapan/Pesanggrahan/ Vila	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
429	31	4	1	02	02	06	001	00	00	Retribusi Pelayanan Tempat Penginapan/ Pesanggrahan/Vila	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
430	32	4	1	02	02	07	000	00	00	Retribusi Pelayanan Tempat Penginapan/ Pesanggrahan/Vila	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
431	32	4	1	02	02	07	001	00	00	Retribusi Pelayanan Rumah Potong Hewan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
432	33	4	1	02	02	08	000	00	00	Retribusi Pelayanan Kepelabuhanan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
433	33	4	1	02	02	08	001	00	00	Retribusi Pelayanan Kepelabuhanan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
434	34	4	1	02	02	09	000	00	00	Retribusi Tempat Rekreasi dan Olahraga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
435	34	4	1	02	02	09	001	00	00	Retribusi Pelayanan Tempat Rekreasi dan Olahraga	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
436	35	4	1	02	02	10	000	00	00	Retribusi Penyeberangan di Air	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
437	35	4	1	02	02	10	001	00	00	Retribusi Pelayanan Penyeberangan Orang	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
438	35	4	1	02	02	10	002	00	00	Retribusi Pelayanan Penyeberangan Barang	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
439	36	4	1	02	02	11	000	00	00	Retribusi Penjualan Produksi Usaha Daerah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
440	36	4	1	02	02	11	001	00	00	Retribusi Penjualan Produksi Hasil Usaha Daerah berupa Bibit atau Benih Tanaman	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
441	36	4	1	02	02	11	002	00	00	Retribusi Penjualan Produksi hasil Usaha Daerah berupa Bibit Ternak	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
442	36	4	1	02	02	11	003	00	00	Retribusi Penjualan Produksi hasil Usaha	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
443	36	4	1	02	02	11	004	00	00	Retribusi Penjualan Produksi hasil Usaha Daerah selain Bibit atau Benih Tanaman, Ternak, dan Ikan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
444	0	4	1	02	03	00	000	00	00	Retribusi Perizinan Tertentu	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
445	37	4	1	02	03	01	000	00	00	Retribusi Izin Mendirikan Bangunan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
446	37	4	1	02	03	01	001	00	00	Retribusi Pemberian Izin Mendirikan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
447	38	4	1	02	03	02	000	00	00	Retribusi Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
448	38	4	1	02	03	02	001	00	00	Retribusi Pemberian Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
449	40	4	1	02	03	03	000	00	00	Retribusi Izin Trayek untuk Menyediakan Pelayanan Angkutan Umum	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
450	40	4	1	02	03	03	001	00	00	Retribusi Izin Trayek untuk Menyediakan Pelayanan Angkutan Umum	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
451	41	4	1	02	03	04	000	00	00	Retribusi Izin Usaha Perikanan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
452	41	4	1	02	03	04	001	00	00	Retribusi Pemberian Izin Kegiatan Usaha Penangkapan Ikan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
453	41	4	1	02	03	04	002	00	00	Retribusi Pemberian Izin Kegiatan Usaha Pembudidayaan Ikan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
454	42	4	1	02	03	05	000	00	00	Retribusi Pengendalian Lalu Lintas	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
455	42	4	1	02	03	05	001	00	00	Retribusi Pengendalian Lalu Lintas Penggunaan Ruas Jalan Tertentu	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
456	42	4	1	02	03	05	002	00	00	Retribusi Pengendalian Lalu Lintas Penggunaan Koridor Tertentu	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
457	42	4	1	02	03	05	003	00	00	Retribusi Pengendalian Lalu Lintas Penggunaan Kawasan Tertentu	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
458	43	4	1	02	03	06	000	00	00	Retribusi Perpanjangan Izin Mempekerjakan Tenaga Kerja Asing (IMTA)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
459	43	4	1	02	03	06	001	00	00	Retribusi Pemberian Perpanjangan IMTA kepada Pemberi Kerja Tenaga Kerja Asing	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
460	0	4	1	03	00	00	000	00	00	Hasil Pengelolaan Kekayaan Daerah yang Dipisahkan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
461	0	4	1	03	01	00	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMN	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
462	44	4	1	03	01	01	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMN	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
463	44	4	1	03	01	01	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMN …	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
464	0	4	1	03	02	00	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
465	45	4	1	03	02	01	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Lembaga Keuangan)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
466	45	4	1	03	02	01	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Lembaga Keuangan) …	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
467	46	4	1	03	02	02	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Aneka Usaha)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
468	46	4	1	03	02	02	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Aneka Usaha) …	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
469	47	4	1	03	02	03	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Air Minum)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
470	47	4	1	03	02	03	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada Perusahaan Milik Daerah/BUMD (Bidang Air Minum) …	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
471	48	4	1	03	02	04	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Limbah)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
472	48	4	1	03	02	04	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Limbah) …	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
473	49	4	1	03	02	05	000	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Sanitasi)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
474	49	4	1	03	02	05	001	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMD (Bidang Sanitasi) …	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
475	0	4	1	04	00	00	000	00	00	Lain-lain PAD yang Sah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
476	0	4	1	04	01	00	000	00	00	Hasil Penjualan BMD yang Tidak Dipisahkan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
477	50	4	1	04	01	01	000	00	00	Hasil Penjualan Tanah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
478	50	4	1	04	01	01	001	00	00	Hasil Penjualan Tanah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
479	51	4	1	04	01	02	000	00	00	Hasil Penjualan Peralatan dan Mesin	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
480	51	4	1	04	01	02	001	00	00	Hasil Penjualan Alat Besar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
481	51	4	1	04	01	02	002	00	00	Hasil Penjualan Alat Angkutan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
482	51	4	1	04	01	02	003	00	00	Hasil Penjualan Alat Bengkel dan Alat Ukur	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
483	51	4	1	04	01	02	004	00	00	Hasil Penjualan Alat Pertanian	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
484	51	4	1	04	01	02	005	00	00	Hasil Penjualan Alat Kantor dan Rumah Tangga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
485	51	4	1	04	01	02	006	00	00	Hasil Penjualan Alat Studio, Komunikasi, dan Pemancar	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
486	51	4	1	04	01	02	007	00	00	Hasil Penjualan Alat Kedokteran dan Kesehatan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
487	51	4	1	04	01	02	008	00	00	Hasil Penjualan Alat Laboratorium	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
488	51	4	1	04	01	02	010	00	00	Hasil Penjualan Komputer	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
489	51	4	1	04	01	02	011	00	00	Hasil Penjualan Alat Eksplorasi	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
490	51	4	1	04	01	02	012	00	00	Hasil Penjualan Alat Pengeboran	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
491	51	4	1	04	01	02	013	00	00	Hasil Penjualan Alat Produksi, Pengolahan, dan Pemurnian	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
492	51	4	1	04	01	02	014	00	00	Hasil Penjualan Alat Bantu Eksplorasi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
493	51	4	1	04	01	02	015	00	00	Hasil Penjualan Alat Keselamatan Kerja	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
494	51	4	1	04	01	02	016	00	00	Hasil Penjualan Alat Peraga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
495	51	4	1	04	01	02	017	00	00	Hasil Penjualan Peralatan Proses/Produksi	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
496	51	4	1	04	01	02	018	00	00	Hasil Penjualan Rambu-rambu	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
497	51	4	1	04	01	02	019	00	00	Hasil Penjualan Peralatan Olahraga	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
498	52	4	1	04	01	03	000	00	00	Hasil Penjualan Gedung dan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
499	52	4	1	04	01	03	001	00	00	Hasil Penjualan Gedung dan Bangunan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
500	52	4	1	04	01	03	002	00	00	Hasil Penjualan Monumen	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
501	52	4	1	04	01	03	003	00	00	Hasil Penjualan Bangunan Menara	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
502	52	4	1	04	01	03	004	00	00	Hasil Penjualan Tugu Titik Kontrol/Pasti	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
503	53	4	1	04	01	04	000	00	00	Hasil Penjualan Jalan, Jaringan, dan Irigasi	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
504	53	4	1	04	01	04	001	00	00	Hasil Penjualan Jalan dan Jembatan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
505	53	4	1	04	01	04	002	00	00	Hasil Penjualan Bangunan Air	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
506	53	4	1	04	01	04	003	00	00	Hasil Penjualan Instalasi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
507	53	4	1	04	01	04	004	00	00	Hasil Penjualan Jaringan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
508	54	4	1	04	01	05	000	00	00	Hasil Penjualan Aset Tetap Lainnya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
509	54	4	1	04	01	05	001	00	00	Hasil Penjualan Bahan Perpustakaan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
510	54	4	1	04	01	05	002	00	00	Hasil Penjualan Barang Bercorak Kesenian/Kebudayaan/Olahraga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
511	54	4	1	04	01	05	003	00	00	Hasil Penjualan Hewan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
512	54	4	1	04	01	05	004	00	00	Hasil Penjualan Biota Perairan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
513	54	4	1	04	01	05	005	00	00	Hasil Penjualan Tanaman	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
514	54	4	1	04	01	05	006	00	00	Hasil Penjualan Barang Koleksi Non Budaya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
515	54	4	1	04	01	05	007	00	00	Hasil Penjualan Aset Tetap Dalam Renovasi	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
516	55	4	1	04	01	06	000	00	00	Hasil Penjualan Aset Lainnya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
517	55	4	1	04	01	06	001	00	00	Hasil Penjualan Aset Lainnya-Aset Tidak Berwujud	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
518	55	4	1	04	01	06	002	00	00	Hasil Penjualan Aset Lainnya-Aset Lain-Lain	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
519	0	4	1	04	02	00	000	00	00	Hasil Selisih Lebih Tukar Menukar BMD yang Tidak Dipisahkan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
520	56	4	1	04	02	01	000	00	00	Hasil Selisih Lebih Tukar Menukar Tanah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
521	56	4	1	04	02	01	001	00	00	Hasil Selisih Lebih Tukar Menukar Tanah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
522	57	4	1	04	02	02	000	00	00	Hasil Selisih Lebih Tukar Menukar Peralatan dan Mesin	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
523	57	4	1	04	02	02	001	00	00	Hasil Selisih Lebih Tukar Menukar Alat Besar	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
524	57	4	1	04	02	02	002	00	00	Hasil Selisih Lebih Tukar Menukar Alat Angkutan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
525	57	4	1	04	02	02	003	00	00	Hasil Selisih Lebih Tukar Menukar Alat Bengkel dan Alat Ukur	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
526	57	4	1	04	02	02	004	00	00	Hasil Selisih Lebih Tukar Menukar Alat Pertanian	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
527	57	4	1	04	02	02	005	00	00	Hasil Selisih Lebih Tukar Menukar Alat Kantor dan Rumah Tangga	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
528	57	4	1	04	02	02	006	00	00	Hasil Selisih Lebih Tukar Menukar Alat Studio, Komunikasi, dan Pemancar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
529	57	4	1	04	02	02	007	00	00	Hasil Selisih Lebih Tukar Menukar Alat Kedokteran dan Kesehatan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
530	57	4	1	04	02	02	008	00	00	Hasil Selisih Lebih Tukar Menukar Alat Laboratorium	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
531	57	4	1	04	02	02	010	00	00	Hasil Selisih Lebih Tukar Menukar Komputer	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
532	57	4	1	04	02	02	011	00	00	Hasil Selisih Lebih Tukar Menukar Alat Eksplorasi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
533	57	4	1	04	02	02	012	00	00	Hasil Selisih Lebih Tukar Menukar Alat Pengeboran	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
534	57	4	1	04	02	02	013	00	00	Hasil Selisih Lebih Tukar Menukar Alat Produksi, Pengolahan, dan Pemurnian	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
535	57	4	1	04	02	02	014	00	00	Hasil Selisih Lebih Tukar Menukar Alat Bantu Eksplorasi	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
536	57	4	1	04	02	02	015	00	00	Hasil Selisih Lebih Tukar Menukar Alat Keselamatan Kerja	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
537	57	4	1	04	02	02	016	00	00	Hasil Selisih Lebih Tukar Menukar Alat Peraga	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
538	57	4	1	04	02	02	017	00	00	Hasil Selisih Lebih Tukar Menukar Peralatan Proses/Produksi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
539	57	4	1	04	02	02	018	00	00	Hasil Selisih Lebih Tukar Menukar RambuRambu	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
540	57	4	1	04	02	02	019	00	00	Hasil Selisih Lebih Tukar Menukar Peralatan Olahraga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
541	58	4	1	04	02	03	000	00	00	Hasil Selisih Lebih Tukar Menukar Gedung dan Bangunan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
542	58	4	1	04	02	03	001	00	00	Hasil Selisih Lebih Tukar Menukar Bangunan Gedung	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
543	58	4	1	04	02	03	002	00	00	Hasil Selisih Lebih Tukar Menukar Monumen	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
544	58	4	1	04	02	03	003	00	00	Hasil Selisih Lebih Tukar Menukar Bangunan Menara	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
545	58	4	1	04	02	03	004	00	00	Hasil Selisih Lebih Tukar Menukar Tugu Titik Kontrol/Pasti	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
546	59	4	1	04	02	04	000	00	00	Hasil Selisih Lebih Tukar Menukar Jalan, Jaringan, dan Irigasi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
547	59	4	1	04	02	04	001	00	00	Hasil Selisih Lebih Tukar Menukar Jalan dan Jembatan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
548	59	4	1	04	02	04	002	00	00	Hasil Selisih Lebih Tukar Menukar Bangunan Air	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
549	59	4	1	04	02	04	003	00	00	Hasil Selisih Lebih Tukar Menukar Instalasi	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
550	59	4	1	04	02	04	004	00	00	Hasil Selisih Lebih Tukar Menukar Jaringan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
551	60	4	1	04	02	05	000	00	00	Hasil Selisih Lebih Tukar Menukar Aset Tetap Lainnya	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
552	60	4	1	04	02	05	001	00	00	Hasil Selisih Lebih Tukar Menukar Bahan Perpustakaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
553	60	4	1	04	02	05	002	00	00	Hasil Selisih Lebih Tukar Menukar Barang Bercorak Kesenian/Kebudayaan/Olahraga	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
554	60	4	1	04	02	05	003	00	00	Hasil Selisih Lebih Tukar Menukar Hewan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
555	60	4	1	04	02	05	004	00	00	Hasil Selisih Lebih Tukar Menukar Biota Perairan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
556	60	4	1	04	02	05	005	00	00	Hasil Selisih Lebih Tukar Menukar Tanaman	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
557	60	4	1	04	02	05	006	00	00	Hasil Selisih Lebih Tukar Menukar Barang Koleksi Non Budaya	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
558	60	4	1	04	02	05	007	00	00	Hasil Selisih Lebih Tukar Menukar Aset Tetap Dalam Renovasi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
559	61	4	1	04	02	06	000	00	00	Hasil Selisih Lebih Tukar Menukar Aset Lainnya	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
560	61	4	1	04	02	06	001	00	00	Hasil Selisih Lebih Tukar Menukar Aset Lainnya-Aset Tidak Berwujud	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
561	61	4	1	04	02	06	002	00	00	Hasil Selisih Lebih Tukar Menukar Aset Lainnya-Aset Lain-Lain	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
562	0	4	1	04	03	00	000	00	00	Hasil Pemanfaatan BMD yang Tidak Dipisahkan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
563	62	4	1	04	03	01	000	00	00	Hasil Sewa BMD	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
564	62	4	1	04	03	01	001	00	00	Hasil Sewa BMD	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
565	63	4	1	04	03	01	000	00	00	Hasil Kerja Sama Pemanfaatan BMD	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
566	63	4	1	04	03	01	001	00	00	Hasil Kerja Sama Pemanfaatan BMD	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
567	64	4	1	04	03	01	000	00	00	Hasil dari Bangun Guna Serah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
568	64	4	1	04	03	01	001	00	00	Hasil dari Bangun Guna Serah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
569	65	4	1	04	03	01	000	00	00	Hasil dari Bangun Serah Guna	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
570	65	4	1	04	03	01	001	00	00	Hasil dari Bangun Serah Guna	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
571	0	4	1	04	04	00	000	00	00	Hasil Kerja Sama Daerah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
572	66	4	1	04	04	01	000	00	00	Hasil Kerja Sama Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
573	66	4	1	04	04	01	001	00	00	Hasil Kerja Sama Daerah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
574	0	4	1	04	05	00	000	00	00	Jasa Giro	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
575	67	4	1	04	05	01	000	00	00	Jasa Giro pada Kas Daerah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
576	67	4	1	04	05	01	001	00	00	Jasa Giro pada Kas Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
577	68	4	1	04	05	02	000	00	00	Jasa Giro pada Kas di Bendahara	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
578	68	4	1	04	05	02	001	00	00	Jasa Giro pada Kas di Bendahara	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
579	69	4	1	04	05	03	000	00	00	Jasa Giro pada Rekening Dana Cadangan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
580	69	4	1	04	05	03	001	00	00	Jasa Giro pada Rekening Dana Cadangan …	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
581	70	4	1	04	05	04	000	00	00	Jasa Giro pada BLUD	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
582	70	4	1	04	05	04	001	00	00	Jasa Giro pada BLUD…	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
583	71	4	1	04	05	05	000	00	00	Jasa Giro pada Rekening Dana BOS	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
584	71	4	1	04	05	05	001	00	00	Jasa Giro pada Rekening Dana BOS …	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
585	72	4	1	04	05	06	000	00	00	Jasa Giro Dana Kapitasi pada FKTP	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
586	72	4	1	04	05	06	001	00	00	Jasa Giro Dana Kapitasi pada FKTP …	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
587	0	4	1	04	06	00	000	00	00	Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
588	73	4	1	04	06	01	000	00	00	Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
589	73	4	1	04	06	01	001	00	00	Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
590	0	4	1	04	07	00	000	00	00	Pendapatan Bunga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
591	74	4	1	04	07	01	000	00	00	Pendapatan Bunga atas Penempatan Uang Pemerintah Daerah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
592	74	4	1	04	07	01	001	00	00	Pendapatan Bunga atas Penempatan Uang Pemerintah Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
593	0	4	1	04	08	00	000	00	00	Penerimaan atas Tuntutan Ganti Kerugian Keuangan Daerah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
594	75	4	1	04	08	01	000	00	00	Tuntutan Ganti Kerugian Daerah terhadap Bendahara	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
595	75	4	1	04	08	01	001	00	00	Tuntutan Ganti Kerugian Daerah terhadap Bendahara	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
596	76	4	1	04	08	02	000	00	00	Tuntutan Ganti Kerugian Daerah terhadap Pegawai Negeri Bukan Bendahara atau Pejabat Lain	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
597	76	4	1	04	08	02	001	00	00	Tuntutan Ganti Kerugian Daerah terhadap Pegawai Negeri Bukan Bendahara atau Pejabat Lain	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
598	0	4	1	04	09	00	000	00	00	Penerimaan Komisi, Potongan, atau Bentuk Lain	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
599	77	4	1	04	09	01	000	00	00	Penerimaan Komisi, Potongan, atau Bentuk Lain	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
600	77	4	1	04	09	01	001	00	00	Penerimaan Komisi, Potongan, atau Bentuk Lain	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
601	0	4	1	04	10	00	000	00	00	Penerimaan Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
602	78	4	1	04	10	01	000	00	00	Penerimaan Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
603	78	4	1	04	10	01	001	00	00	Penerimaan Keuntungan dari Selisih Nilai Tukar Rupiah terhadap Mata Uang Asing	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
604	0	4	1	04	11	00	000	00	00	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
605	79	4	1	04	11	01	000	00	00	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
606	79	4	1	04	11	01	001	00	00	Pendapatan Denda atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
607	0	4	1	04	12	00	000	00	00	Pendapatan Denda Pajak Daerah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
608	80	4	1	04	12	01	000	00	00	Pendapatan Denda Pajak Kendaraan Bermotor (PKB)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
609	80	4	1	04	12	01	001	00	00	Pendapatan Denda PKB-Mobil Penumpang Sedan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
610	80	4	1	04	12	01	002	00	00	Pendapatan Denda PKB-Mobil Penumpang Jeep	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
611	80	4	1	04	12	01	003	00	00	Pendapatan Denda PKB-Mobil Penumpang Minibus	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
612	80	4	1	04	12	01	004	00	00	Pendapatan Denda PKB-Mobil Bus-Microbus	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
613	80	4	1	04	12	01	005	00	00	Pendapatan Denda PKB-Mobil Bus-Bus	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
614	80	4	1	04	12	01	006	00	00	Pendapatan Denda PKB-Mobil Barang/Beban-Pick Up	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
615	80	4	1	04	12	01	007	00	00	Pendapatan Denda PKB-Mobil Barang/Beban-Light Truck	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
616	80	4	1	04	12	01	008	00	00	Pendapatan Denda PKB-Mobil Barang/Beban-Truck	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
617	80	4	1	04	12	01	009	00	00	Pendapatan Denda PKB-Mobil Barang/Beban-Blind Van	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
618	80	4	1	04	12	01	010	00	00	Pendapatan Denda PKB-Sepeda MotorSepeda Motor Roda Dua	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
619	80	4	1	04	12	01	011	00	00	Pendapatan Denda PKB-Sepeda MotorSepeda Motor Roda Tiga	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
620	80	4	1	04	12	01	012	00	00	Pendapatan Denda PKB-Kendaraan Bermotor yang Dioperasikan di Air	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
621	80	4	1	04	12	01	013	00	00	Pendapatan Denda PKB-Kendaraan Khusus Alat Berat/Alat Besar	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
622	80	4	1	04	12	01	014	00	00	Pendapatan Denda PKB-Mobil Roda Tiga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
623	81	4	1	04	12	02	000	00	00	Pendapatan Denda Bea Balik Nama Kendaraan Bermotor (BBNKB)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
624	81	4	1	04	12	02	001	00	00	Pendapatan Denda BBNKB-Mobil Penumpang-Sedan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
625	81	4	1	04	12	02	002	00	00	Pendapatan Denda BBNKB-Mobil Penumpang-Jeep	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
626	81	4	1	04	12	02	003	00	00	Pendapatan Denda BBNKB-Mobil Penumpang Minibus	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
627	81	4	1	04	12	02	004	00	00	Pendapatan Denda BBNKB-Mobil Bus-Microbus	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
628	81	4	1	04	12	02	005	00	00	Pendapatan Denda BBNKB-Mobil Bus-Bus	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
629	81	4	1	04	12	02	006	00	00	Pendapatan Denda BBNKB-Mobil Barang/Beban-Pick Up	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
630	81	4	1	04	12	02	007	00	00	Pendapatan Denda BBNKB-Mobil Barang/Beban-Light Truck	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
631	81	4	1	04	12	02	008	00	00	Pendapatan Denda BBNKB-Mobil Barang/Beban-Truck	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
632	81	4	1	04	12	02	009	00	00	Pendapatan Denda BBNKB-Mobil Barang/Beban-Blind Van	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
633	81	4	1	04	12	02	010	00	00	Pendapatan Denda BBNKB-Sepeda MotorSepeda Motor Roda Dua	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
634	81	4	1	04	12	02	011	00	00	Pendapatan Denda BBNKB-Sepeda MotorSepeda Motor Roda Tiga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
635	81	4	1	04	12	02	012	00	00	Pendapatan Denda BBNKB-Kendaraan Bermotor yang Dioperasikan di Air	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
636	81	4	1	04	12	02	013	00	00	Pendapatan Denda BBNKB-Kendaraan Khusus Alat Berat/Alat Besar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
637	81	4	1	04	12	02	014	00	00	Pendapatan Denda BBNKB-Mobil Roda Tiga	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
638	82	4	1	04	12	03	000	00	00	Pendapatan Denda Pajak Bahan Bakar Kendaraan Bermotor (PBBKB)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
639	82	4	1	04	12	03	001	00	00	Pendapatan Denda PPBKB-Bahan Bakar Bensin	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
640	82	4	1	04	12	03	002	00	00	Pendapatan Denda PPBKB-Bahan Bakar Solar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
641	82	4	1	04	12	03	003	00	00	Pendapatan Denda PPBKB-Bahan Bakar Gas	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
642	82	4	1	04	12	03	004	00	00	Pendapatan Denda PPBKB-Bahan Bakar Lainnya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
643	0	4	1	04	13	00	000	00	00	Pendapatan Denda Retribusi Daerah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
644	82	4	1	04	13	01	000	00	00	Pendapatan Denda Retribusi Jasa Umum	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
645	82	4	1	04	13	01	001	00	00	Pendapatan Denda Retribusi Pelayanan Kesehatan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
646	82	4	1	04	13	01	002	00	00	Pendapatan Denda Retribusi Pelayanan Persampahan/Kebersihan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
647	82	4	1	04	13	01	003	00	00	Pendapatan Denda Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
648	82	4	1	04	13	01	004	00	00	Pendapatan Denda Retribusi Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
649	82	4	1	04	13	01	005	00	00	Pendapatan Denda Retribusi Pelayanan Pasar	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
650	82	4	1	04	13	01	006	00	00	Pendapatan Denda Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
651	82	4	1	04	13	01	007	00	00	Pendapatan Denda Retribusi Pemeriksaan Alat Pemadam Kebakaran	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
652	82	4	1	04	13	01	008	00	00	Pendapatan Denda Retribusi Penggantian Biaya Cetak Peta	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
653	82	4	1	04	13	01	009	00	00	Pendapatan Denda Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
654	82	4	1	04	13	01	010	00	00	Pendapatan Denda Retribusi Pengolahan Limbah Cair	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
655	82	4	1	04	13	01	011	00	00	Pendapatan Denda Retribusi Pelayanan Tera/Tera Ulang	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
656	82	4	1	04	13	01	012	00	00	Pendapatan Denda Retribusi Pelayanan Pendidikan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
657	82	4	1	04	13	01	013	00	00	Pendapatan Denda Retribusi Pengawasan dan Pengendalian Menara Telekomunikasi	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
658	83	4	1	04	13	02	000	00	00	Pendapatan Denda Retribusi Jasa Usaha	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
659	83	4	1	04	13	02	001	00	00	Pendapatan Denda Retribusi Pemakaian Kekayaan Daerah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
660	83	4	1	04	13	02	002	00	00	Pendapatan Denda Retribusi Pasar Grosir dan/atau Pertokoan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
661	83	4	1	04	13	02	003	00	00	Pendapatan Denda Retribusi Tempat Pelelangan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
662	83	4	1	04	13	02	004	00	00	Pendapatan Denda Retribusi Terminal	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
663	83	4	1	04	13	02	005	00	00	Pendapatan Denda Retribusi Tempat Khusus Parkir	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
664	83	4	1	04	13	02	006	00	00	Pendapatan Denda Retribusi Tempat Penginapan/Pesanggrahan/Vila	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
665	83	4	1	04	13	02	007	00	00	Pendapatan Denda Retribusi Rumah Potong Hewan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
666	83	4	1	04	13	02	008	00	00	Pendapatan Denda Retribusi Pelayanan Kepelabuhanan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
667	83	4	1	04	13	02	009	00	00	Pendapatan Denda Retribusi Tempat Rekreasi dan Olahraga	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
668	83	4	1	04	13	02	010	00	00	Pendapatan Denda Retribusi Pelayanan Penyeberangan Air	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
669	83	4	1	04	13	02	011	00	00	Pendapatan Denda Retribusi Penjualan Produksi Usaha Daerah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
670	84	4	1	04	13	03	000	00	00	Pendapatan Denda Retribusi Perizinan Tertentu	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
671	84	4	1	04	13	03	001	00	00	Pendapatan Denda Retribusi Izin Mendirikan Bangunan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
672	84	4	1	04	13	03	002	00	00	Pendapatan Denda Retribusi Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
673	84	4	1	04	13	03	003	00	00	Pendapatan Denda Retribusi Izin Trayek untuk Menyediakan Pelayanan Angkutan Umum	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
674	84	4	1	04	13	03	004	00	00	Pendapatan Denda Retribusi Izin Usaha Perikanan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
675	84	4	1	04	13	03	005	00	00	Pendapatan Denda Retribusi Pengendalian Lalu Lintas	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
676	84	4	1	04	13	03	006	00	00	Pendapatan Denda Retribusi Perpanjangan Izin Mempekerjakan Tenaga Kerja Asing (IMTA)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
677	0	4	1	04	14	00	000	00	00	Pendapatan Hasil Eksekusi atas Jaminan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
678	85	4	1	04	14	01	000	00	00	Hasil Eksekusi atas Jaminan atas Pengadaan Barang/Jasa	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
679	85	4	1	04	14	01	001	00	00	Hasil Eksekusi atas Jaminan atas Pengadaan Barang/Jasa	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
680	0	4	1	04	15	00	000	00	00	Pendapatan dari Pengembalian	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
681	86	4	1	04	15	01	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Pajak Penghasilan Pasal 21	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
682	86	4	1	04	15	01	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Pajak Penghasilan Pasal 21	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
683	87	4	1	04	15	02	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
684	87	4	1	04	15	02	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
685	88	4	1	04	15	03	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Gaji dan Tunjangan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
686	88	4	1	04	15	03	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Gaji dan Tunjangan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
687	89	4	1	04	15	04	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Perjalanan Dinas	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
688	89	4	1	04	15	04	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Perjalanan Dinas	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
689	90	4	1	04	15	05	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kecelakaan Kerja (JKK)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
690	90	4	1	04	15	05	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kecelakaan Kerja (JKK)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
691	91	4	1	04	15	06	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kematian (JKM)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
692	91	4	1	04	15	06	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kematian (JKM)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
693	92	4	1	04	15	07	000	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan Nasional (JKN)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
694	92	4	1	04	15	07	001	00	00	Pendapatan dari Pengembalian Kelebihan Pembayaran Jaminan Kesehatan Nasional (JKN)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
695	0	4	1	04	16	00	000	00	00	Pendapatan BLUD	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
696	93	4	1	04	16	01	000	00	00	Pendapatan BLUD	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
697	93	4	1	04	16	01	001	00	00	Pendapatan BLUD	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
698	0	4	1	04	17	00	000	00	00	Pendapatan Denda Pemanfaatan BMD yang tidak Dipisahkan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
699	94	4	1	04	17	01	000	00	00	Pendapatan Denda Pengakhiran Sewa BMD	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
700	94	4	1	04	17	01	001	00	00	Pendapatan Denda Pengakhiran Sewa BMD	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
701	95	4	1	04	17	02	000	00	00	Pendapatan Denda Hasil dari Kerja Sama Penyediaan Infrastruktur	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
702	95	4	1	04	17	02	001	00	00	Pendapatan Denda Hasil dari Kerja Sama Penyediaan Infrastruktur	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
703	0	4	1	04	18	00	000	00	00	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional (JKN) pada Fasilitas Kesehatan Tingkat Pertama (FKTP)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
704	96	4	1	04	18	01	000	00	00	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional (JKN) pada Fasilitas Kesehatan Tingkat Pertama (FKTP)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
705	96	4	1	04	18	01	001	00	00	Pendapatan Dana Kapitasi Jaminan Kesehatan Nasional (JKN) pada Fasilitas Kesehatan Tingkat Pertama (FKTP)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
706	0	4	1	04	19	00	000	00	00	Pendapatan Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
707	97	4	1	04	19	01	000	00	00	Pendapatan Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
708	97	4	1	04	19	01	001	00	00	Pendapatan Hasil Pengelolaan Dana Bergulir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
709	0	4	1	04	20	00	000	00	00	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
710	98	4	1	04	20	01	000	00	00	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
711	98	4	1	04	20	01	001	00	00	Pendapatan Berdasarkan Putusan Pengadilan (Inkracht)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
712	0	4	1	04	21	00	000	00	00	Pendapatan Denda atas Pelanggaran Peraturan Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
713	99	4	1	04	21	01	000	00	00	Pendapatan Denda atas Pelanggaran Peraturan Daerah	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
714	99	4	1	04	21	01	001	00	00	Pendapatan Denda atas Pelanggaran Peraturan Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
715	0	4	1	04	22	00	000	00	00	Pendapatan Zakat	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
716	100	4	1	04	22	01	000	00	00	Pendapatan Zakat	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
717	100	4	1	04	22	01	001	00	00	Pendapatan Zakat	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
718	0	4	2	00	00	00	000	00	00	PENDAPATAN TRANSFER	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
719	0	4	2	01	00	00	000	00	00	Pendapatan Transfer Pemerintah Pusat	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
720	101	4	2	01	01	00	000	00	00	Dana Perimbangan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
721	101	4	2	01	01	01	000	00	00	Dana Transfer Umum-Dana Bagi Hasil (DBH)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
722	101	4	2	01	01	01	001	00	00	DBH Pajak Bumi dan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
723	101	4	2	01	01	01	002	00	00	DBH PPh Pasal 25 dan Pasal 29	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
724	101	4	2	01	01	01	003	00	00	DBH PPh Pasal 21	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
725	101	4	2	01	01	01	004	00	00	DBH Cukai Hasil Tembakau (CHT)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
726	101	4	2	01	01	00	005	00	00	DBH Sumber Daya Alam (SDA) Minyak Bumi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
727	101	4	2	01	01	01	006	00	00	DBH Sumber Daya Alam (SDA) Gas Bumi	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
728	101	4	2	01	01	01	007	00	00	DBH Sumber Daya Alam (SDA) Mineral dan Batubara-Landrent	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
729	101	4	2	01	01	01	008	00	00	Dana Bagi Hasil (DBH) Sumber Daya Alam (SDA) Mineral dan Batubara-Royalty	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
730	101	4	2	01	01	01	009	00	00	DBH Sumber Daya Alam (SDA) KehutananProvisi Sumber Daya Hutan (PSDH)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
731	101	4	2	01	01	01	010	00	00	DBH Sumber Daya Alam (SDA) KehutananIuran Izin Usaha Pemanfaatan Hutan (IIUPH)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
732	101	4	2	01	01	01	011	00	00	DBH Sumber Daya Alam (SDA) KehutananDana Reboisasi (DR)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
733	101	4	2	01	01	01	012	00	00	DBH Sumber Daya Alam (SDA) Perikanan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
734	101	4	2	01	01	01	013	00	00	DBH Sumber Daya Alam (SDA) Panas Bumi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
735	102	4	2	01	01	02	000	00	00	Dana Transfer Umum-Dana Alokasi Umum (DAU)	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
736	102	4	2	01	01	02	001	00	00	Dana Transfer Umum-Dana Alokasi Umum (DAU)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
737	102	4	2	01	01	02	002	00	00	Dana Transfer Umum-Dana Alokasi Umum (DAU) Tambahan untuk Dukungan Pendanaan Kelurahan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
738	103	4	2	01	01	03	000	00	00	Dana Transfer Khusus-Dana Alokasi Khusus (DAK) Fisik	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
739	103	4	2	01	01	03	001	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SD	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
740	103	4	2	01	01	03	002	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SMP	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
741	103	4	2	01	01	03	003	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SMA	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
742	103	4	2	01	01	03	004	00	00	DAK Fisik-Bidang Pendidikan-Reguler SDLB/ SMPLB/ SMALB	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
743	103	4	2	01	01	03	005	00	00	DAK Fisik-Bidang Pendidikan-Reguler-SKB	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
744	103	4	2	01	01	03	006	00	00	DAK Fisik-Bidang Pendidikan-RegulerPerpustakaan Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
379	17	4	1	02	01	05	002	00	00	Retribusi Los	0	2000	\N	\N	2020-01-01	1971-12-31	\N	0
745	103	4	2	01	01	03	007	00	00	DAK Fisik-Bidang Pendidikan-RegulerOlahraga	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
746	103	4	2	01	01	03	008	00	00	DAK Fisik-Bidang Air Minum-Reguler	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
747	103	4	2	01	01	03	009	00	00	DAK Fisik-Bidang Sanitasi-Reguler	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
748	103	4	2	01	01	03	010	00	00	DAK Fisik-Bidang Perumahan dan Permukiman-Reguler	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
749	103	4	2	01	01	03	011	00	00	DAK Fisik-Bidang Jalan-Reguler	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
750	103	4	2	01	01	03	012	00	00	DAK Fisik-Bidang Kesehatan-RegulerPelayanan Kesehatan Dasar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
751	103	4	2	01	01	03	013	00	00	DAK Fisik-Bidang Kesehatan-RegulerPelayanan Kesehatan Rujukan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
752	103	4	2	01	01	03	014	00	00	DAK Fisik-Bidang Kesehatan-RegulerPelayanan Kefarmasian dan Perbekalan Kesehatan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
753	103	4	2	01	01	03	015	00	00	DAK Fisik-Bidang Kesehatan-Reguler-KB	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
754	103	4	2	01	01	03	016	00	00	DAK Fisik-Bidang Pertanian-Reguler	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
755	103	4	2	01	01	03	017	00	00	DAK Fisik-Bidang Kelautan dan Perikanan Reguler	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
756	103	4	2	01	01	03	018	00	00	DAK Fisik-Bidang Pariwisata Reguler	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
757	103	4	2	01	01	03	019	00	00	DAK Fisik-Bidang Industri Kecil dan Menengah-Reguler	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
758	103	4	2	01	01	03	020	00	00	DAK Fisik-Bidang Pendidikan-Penugasan-SMK	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
759	103	4	2	01	01	03	021	00	00	DAK Fisik-Bidang Kesehatan-PenugasanPeningkatan Pelayanan Rujukan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
760	103	4	2	01	01	03	022	00	00	Dana Alokasi Khusus (DAK) Fisik-Bidang Kesehatan-Penugasan-Penurunan Stunting	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
761	103	4	2	01	01	03	023	00	00	DAK Fisik-Bidang Kesehatan-PenugasanPengendalian Penyakit	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
762	103	4	2	01	01	03	024	00	00	DAK Fisik-Bidang Kesehatan-PenugasanBalai Pelatihan Kesehatan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
763	103	4	2	01	01	03	025	00	00	DAK Fisik-Bidang Air Minum-Penugasan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
764	103	4	2	01	01	03	026	00	00	DAK Fisik-Bidang Pariwisata-Penugasan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
765	103	4	2	01	01	03	027	00	00	DAK Fisik-Bidang Sanitasi-Penugasan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
766	103	4	2	01	01	03	028	00	00	DAK Fisik-Bidang Jalan-Penugasan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
767	103	4	2	01	01	03	029	00	00	DAK Fisik-Bidang Pasar-Penugasan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
768	103	4	2	01	01	03	030	00	00	DAK Fisik-Bidang Irigasi-Penugasan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
769	103	4	2	01	01	03	031	00	00	DAK Fisik-Bidang Lingkungan Hidup dan Kehutanan-Penugasan-Lingkungan Hidup	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
770	103	4	2	01	01	03	032	00	00	DAK Fisik-Bidang Lingkungan Hidup dan Kehutanan-Penugasan-Kehutanan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
771	103	4	2	01	01	03	033	00	00	DAK Fisik-Bidang Kesehatan-AfirmasiPenguatan Puskesmas-DTPK	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
772	103	4	2	01	01	03	034	00	00	DAK Fisik-Bidang Kesehatan-AfirmasiPenguatan Pembangunan Rumah Sakit Pratama	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
773	103	4	2	01	01	03	035	00	00	DAK Fisik-Bidang Perumahan dan Permukiman-Afirmasi	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
774	103	4	2	01	01	03	036	00	00	DAK Fisik-Bidang Air Minum-Afirmasi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
775	103	4	2	01	01	03	037	00	00	DAK Fisik-Bidang Sanitasi-Afirmasi	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
776	103	4	2	01	01	03	038	00	00	DAK Fisik-Bidang Transportasi-Afirmasi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
777	103	4	2	01	01	03	039	00	00	DAK Fisik-Bidang Pendidikan-Afirmasi-SD	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
778	103	4	2	01	01	03	040	00	00	DAK Fisik-Bidang Pendidikan-Afirmasi-SMP	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
779	103	4	2	01	01	03	041	00	00	DAK Fisik-Bidang Pendidikan-Afirmasi-SMA	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
780	104	4	2	01	01	04	000	00	00	Dana Transfer Khusus-Dana Alokasi Khusus (DAK) Non Fisik	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
781	104	4	2	01	01	04	001	00	00	DAK Non Fisik-BOS Reguler	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
782	104	4	2	01	01	04	002	00	00	DAK Non Fisik-BOS Afirmasi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
783	104	4	2	01	01	04	003	00	00	DAK Non Fisik-BOS Kinerja	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
784	104	4	2	01	01	04	004	00	00	DAK Non Fisik-BOP PAUD	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
785	104	4	2	01	01	04	005	00	00	DAK Non Fisik-BOP Pendidikan Kesetaraan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
786	104	4	2	01	01	04	006	00	00	DAK Non Fisik-TPG PNSD	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
787	104	4	2	01	01	04	007	00	00	DAK Non Fisik-Tamsil Guru PNSD	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
788	104	4	2	01	01	04	008	00	00	DAK Non Fisik-TKG PNSD	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
789	104	4	2	01	01	04	009	00	00	DAK Non Fisik-BOP Museum dan Taman Budaya-Museum	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
790	104	4	2	01	01	04	010	00	00	DAK Non Fisik-BOP Museum dan Taman Budaya-Taman Budaya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
791	104	4	2	01	01	04	011	00	00	DAK Non Fisik-BOKKB-BOK	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
792	104	4	2	01	01	04	012	00	00	DAK Non Fisik-BOKKB-Akreditasi RS	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
793	104	4	2	01	01	04	013	00	00	DAK Non Fisik-BOKKB-Akreditasi Puskesmas	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
794	104	4	2	01	01	04	014	00	00	DAK Non Fisik-BOKKB-Akreditasi Labkesda	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
795	104	4	2	01	01	04	015	00	00	DAK Non Fisik-BOKKB-Jaminan Persalinan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
796	104	4	2	01	01	04	016	00	00	DAK Non Fisik-BOKKB-BOKB	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
797	104	4	2	01	01	04	017	00	00	DAK Non Fisik-PK2UKM	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
798	104	4	2	01	01	04	018	00	00	DAK Non Fisik-Dana Pelayanan Administrasi Kependudukan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
799	104	4	2	01	01	04	019	00	00	DAK Non Fisik-Dana Pelayanan Kepariwisataan	0	\N	\N	\N	2020-01-01	2025-12-31	\N	0
800	104	4	2	01	01	04	020	00	00	DAK Non Fisik-Dana BLPS	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
\.


--
-- Data for Name: s_rekening_dulu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_rekening_dulu (s_idkorek, s_jenisobjek, s_tipekorek, s_kelompokkorek, s_jeniskorek, s_objekkorek, s_rinciankorek, s_sub1korek, s_sub2korek, s_sub3korek, s_namakorek, s_persentarifkorek, s_tarifdasarkorek, s_voldasarkorek, s_tariftambahkorek, s_tglawalkorek, s_tglakhirkorek, t_berdasarmasa, is_deluser) FROM stdin;
268	5	4	1	01	10	01	00	00	00	Pajak Penerangan Jalan dihasilkan sendiri	1.5	0	0	0	2020-01-01	2025-12-31	Yes	0
269	5	4	1	01	10	02	00	00	00	Pajak Penerangan Jalan sumber lain	3	0	0	0	2020-01-01	2025-12-31	Yes	0
1	0	4	0	0	0	0	00	00	00	PENDAPATAN DAERAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
2	0	4	1	0	0	0	00	00	00	PENDAPATAN ASLI DAERAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
3	0	4	1	01	0	0	00	00	00	HASIL PAJAK DAERAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
4	1	4	1	01	06	00	00	00	00	Pajak Hotel	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
5	1	4	1	01	06	01	00	00	00	Pajak Hotel	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
6	1	4	1	01	06	01	001	00	00	Hotel	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
7	1	4	1	01	06	02	00	00	00	Pajak Motel	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
8	1	4	1	01	06	02	001	00	00	Motel	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
9	1	4	1	01	06	03	00	00	00	Pajak Losmen	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
10	1	4	1	01	06	03	001	00	00	Losmen	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
11	1	4	1	01	06	04	00	00	00	Pajak Gubuk Pariwisata	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
12	1	4	1	01	06	04	001	00	00	Gubuk Pariwisata	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
13	1	4	1	01	06	05	00	00	00	Pajak Wisma Pariwisata	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
14	1	4	1	01	06	05	001	00	00	Wisma Pariwisata	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
15	1	4	1	01	06	06	00	00	00	Pajak Pesanggrahan	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
17	1	4	1	01	06	07	00	00	00	Rumah Penginapan dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
18	1	4	1	01	06	08	00	00	00	Rumah Kos dengan jumlah kamar lebih dari 10 (sepuluh)	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
19	2	4	1	01	07	00	00	00	00	Pajak Restoran	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
20	2	4	1	01	07	01	00	00	00	Pajak Restoran dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
21	2	4	1	01	07	01	001	00	00	Restoran dan dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
22	2	4	1	01	07	02	00	00	00	Pajak Rumah Makan dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
23	2	4	1	01	07	02	001	00	00	Rumah Makan dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
24	2	4	1	01	07	03	00	00	00	Pajak Kafetaria dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
25	2	4	1	01	07	03	001	00	00	Kafetaria dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
26	2	4	1	01	07	04	00	00	00	Pajak Kafetaria dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
27	2	4	1	01	07	04	00	00	00	Pajak Kantin dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
28	2	4	1	01	07	04	001	00	00	Kantin Kantin dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
29	2	4	1	01	07	05	00	00	00	Pajak Warung dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
30	2	4	1	01	07	05	001	00	00	Warung dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
31	2	4	1	01	07	06	00	00	00	Pajak Bar dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
32	2	4	1	01	07	06	001	00	00	Bar dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
33	2	4	1	01	07	07	00	00	00	Pajak  Jasa Boga/Katering dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
34	2	4	1	01	07	07	001	00	00	Jasa Boga /Katering dan Sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
35	3	4	1	01	08	00	00	00	00	Pajak Hiburan	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
36	3	4	1	01	08	01	00	00	00	Pajak Tontonan Film / Bioskop	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
37	3	4	1	01	08	01	001	00	00	Tontonan Film / Bioskop	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
38	3	4	1	01	08	02	00	00	00	Pajak Pagelaran Kesenian/Musik/Tari/ Busana	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
39	3	4	1	01	08	02	001	00	00	Pagelaran Kesenian/Musik/Tari/ Busana	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
40	3	4	1	01	08	03	00	00	00	Pajak Kontes Kecantikan, Binaraga, dan Sejenisnya 	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
41	3	4	1	01	08	03	001	00	00	Kontes Kecantikan, Binaraga, dan Sejenisnya 	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
42	3	4	1	01	08	04	00	00	00	Pajak Pameran	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
43	3	4	1	01	08	04	001	00	00	Pameran	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
44	3	4	1	01	08	05	00	00	00	Pajak Diskotik, Karaoke, Klab Malam dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
45	3	4	1	01	08	05	001	00	00	Diskotik, Karaoke, Klab Malam dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
46	3	4	1	01	08	06	00	00	00	Pajak Sirkus / Akrobat/Sulap	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
47	3	4	1	01	08	06	001	00	00	Sirkus / Akrobat/Sulap	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
48	3	4	1	01	08	07	00	00	00	Pajak Permainan Bilyar dan  Bowling	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
49	3	4	1	01	08	07	001	00	00	Permainan Bilyar dan  Bowling	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
50	3	4	1	01	08	08	00	00	00	Pajak Pacuan Kuda, Kendaraan Bermotor, Permainan Ketangkasan	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
51	3	4	1	01	08	08	001	00	00	Pacuan Kuda, Kendaraan Bermotor, Permainan Ketangkasan	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
52	3	4	1	01	08	09	00	00	00	Pajak  Panti  Pijat,  Refleksi,  Mandi  Uap/Spa dan Pusat Kebugaran (Fitness Center)	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
53	3	4	1	01	08	09	001	00	00	Panti  Pijat,  Refleksi,  Mandi  Uap/Spa dan Pusat Kebugaran (Fitness Center)	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
54	3	4	1	01	08	10	00	00	00	Pertandingan Olahraga	35	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
55	3	4	1	01	08	10	001	00	00	Pertandingan Olahraga	35	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
56	4	4	1	01	09	00	00	00	00	Pajak Reklame	\N	\N	\N	\N	2019-01-01	2024-12-31	Yes	0
57	4	4	1	01	09	04	00	00	00	Reklame Selebaran	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
58	4	4	1	01	09	01	00	00	00	Pajak Reklame Papan/Billboard/Videotron/Megatron	\N	\N	\N	\N	0001-01-01	0001-01-01	\N	0
59	4	4	1	01	09	01	001	00	00	Reklame Papan/Billboard/Videotron/Megatron	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
60	4	4	1	01	09	02	00	00	00	Pajak Reklame Kain	\N	\N	\N	\N	0001-01-01	0001-01-01	\N	0
61	4	4	1	01	09	02	001	00	00	Reklame Kain	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
62	4	4	1	01	09	03	00	00	00	Pajak Reklame melekat/Stiker	\N	\N	\N	\N	0001-01-01	0001-01-01	\N	0
63	4	4	1	01	09	03	001	00	00	Reklame melekat/Stiker	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
64	4	4	1	01	09	04	00	00	00	Pajak Reklame Selebaran	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
65	4	4	1	01	09	04	001	00	00	Reklame Selebaran	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
66	4	4	1	01	09	06	00	00	00	Pajak Reklame Udara	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
67	4	4	1	01	09	06	001	00	00	Reklame Udara	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
68	4	4	1	01	09	07	00	00	00	Pajak Reklame Apung	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
69	4	4	1	01	09	07	001	00	00	Reklame Apung	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
70	4	4	1	01	09	08	00	00	00	Pajak Reklame Suara	20	\N	\N	\N	2019-01-01	2024-12-31	Yes	0
71	4	4	1	01	09	08	001	00	00	Reklame Suara	20	\N	\N	\N	2019-01-01	2024-12-31	Yes	0
72	4	4	1	01	09	09	00	00	00	Rekame Filem/Slide	20	\N	\N	\N	2019-01-01	2024-12-31	Yes	0
73	4	4	1	01	09	09	001	00	00	Rekame Filem/Slide	20	\N	\N	\N	2019-01-01	2024-12-31	Yes	0
74	4	4	1	01	09	10	00	00	00	Pajak Reklame Peragaan	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
75	4	4	1	01	09	10	001	00	00	Reklame Peragaan	10	\N	\N	\N	2021-01-01	2024-12-31	yes	0
76	5	4	1	01	10	00	00	00	00	Pajak Penerangan Jalan	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
128	0	4	1	02	0	0	00	00	00	HASIL RETRIBUSI DAERAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
129	0	4	1	02	01	00	00	00	00	Retribusi Jasa Umum	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
131	13	4	1	02	01	02	00	00	00	Retribusi Pelayanan Persampahan/Kebersihan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
78	5	4	1	01	10	02	001	00	00	Pajak Penerangan Jalan sumber lain	3	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
85	6	4	1	01	14	00	00	00	00	Pajak Mineral Bukan Logam dan Batuan	0	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
87	6	4	1	01	14	02	001	00	00	Batu Tulis	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
88	6	4	1	01	14	03	001	00	00	Batu Setengah Permata	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
89	6	4	1	01	14	04	001	00	00	Batu Kapur	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
90	6	4	1	01	14	05	001	00	00	Batu Apung	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
91	6	4	1	01	14	06	001	00	00	Batu Permata	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
92	6	4	1	01	14	07	001	00	00	Bentonit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
93	6	4	1	01	14	08	001	00	00	Dolomit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
94	6	4	1	01	14	09	001	00	00	Feldspar	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
96	6	4	1	01	14	11	001	00	00	Grafit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
95	6	4	1	01	14	10	001	00	00	Garam Batu (Halite)	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
97	6	4	1	01	14	12	001	00	00	Granit / Andesit	5	150000	\N	\N	2020-01-01	2022-12-31	Yes	0
116	6	4	1	01	14	31	001	00	00	Tawas (Alum)	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
99	6	4	1	01	14	14	001	00	00	Kalsit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
100	6	4	1	01	14	15	001	00	00	Kaolin	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
101	6	4	1	01	14	16	001	00	00	Leusit	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
102	6	4	1	01	14	17	001	00	00	Magnesit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
103	6	4	1	01	14	18	001	00	00	Mika	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
104	6	4	1	01	14	19	001	00	00	Marmer	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
105	6	4	1	01	14	20	001	00	00	Nitrat	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
106	6	4	1	01	14	21	001	00	00	Opsidien	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
111	6	4	1	01	14	26	001	00	00	Phospat	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
109	6	4	1	01	14	24	001	00	00	Pasir Kuarsa	15	60000	\N	\N	2020-01-01	2022-12-31	Yes	0
107	6	4	1	01	14	22	001	00	00	Oker	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
98	6	4	1	01	14	13	001	00	00	Gips	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
113	6	4	1	01	14	28	001	00	00	Tanah Serap (Fullers earth)	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
112	6	4	1	01	14	27	001	00	00	Talk	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
114	6	4	1	01	14	29	001	00	00	Tanah Diatome	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
115	6	4	1	01	14	30	001	00	00	Tanah Liat	5	80000	\N	\N	2020-01-01	2022-12-31	Yes	0
86	6	4	1	01	14	01	001	00	00	Asbes	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
117	6	4	1	01	14	32	001	00	00	Tras	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
118	6	4	1	01	14	33	001	00	00	Yarosif	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
119	6	4	1	01	14	34	001	00	00	Zeolit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
120	6	4	1	01	14	35	001	00	00	Basal	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
121	6	4	1	01	14	36	001	00	00	Trakit	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
122	6	4	1	01	14	37	001	00	00	Mineral bukan logam dan lainnya	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
130	12	4	1	02	01	01	00	00	00	Retribusi Pelayanan Kesehatan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
79	7	4	1	01	11	00	00	00	00	Pajak Parkir	20	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
80	7	4	1	01	11	01	00	00	00	Pajak Parkir	20	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
81	8	4	1	01	12	00	00	00	00	Pajak Air Tanah	20	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
82	8	4	1	01	12	01	001	00	00	Air Tanah	20	2668	\N	\N	2020-01-01	2022-12-31	Yes	0
125	11	4	1	01	16	00	00	00	00	Bea Perolehan Hak Atas Tanah dan Bangunan (BPHTB)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
127	11	4	1	01	16	02	00	00	00	BPHTB - Pemberian Hak Baru	5	\N	\N	\N	2020-01-01	2022-12-31	\N	0
126	11	4	1	01	16	01	00	00	00	BPHTB - Pemindahan Hak	5	\N	\N	\N	2020-01-01	2022-12-31	\N	0
83	9	4	1	01	13	00	00	00	00	Pajak Sarang Burung Walet	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
124	10	4	1	01	15	01	001	00	00	PBBP2	2	\N	\N	\N	2020-01-01	2022-12-31	\N	0
84	9	4	1	01	13	01	00	00	00	Pajak Sarang Burung Walet	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
110	6	4	1	01	14	25	001	00	00	Perlit	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
133	15	4	1	02	01	03	00	00	00	Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
134	16	4	1	02	01	04	00	00	00	Retribusi Pelayanan Parkir di Tepi Jalan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
135	17	4	1	02	01	05	00	00	00	Retribusi Pelayanan Pasar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
195	1	4	1	04	12	06	000	00	00	Pendapatan Denda Pajak Hotel	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
144	0	4	1	02	02	00	00	00	00	Retribusi Jasa Usaha	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
145	26	4	1	02	02	01	00	00	00	Retribusi Pemakaian Kekayaan Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
146	27	4	1	02	02	02	00	00	00	Retribusi Pasar Grosir dan/atau Pertokoan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
147	28	4	1	02	02	03	00	00	00	Retribusi Tempat Pelelangan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
148	29	4	1	02	02	04	00	00	00	Retribusi Terminal	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
149	30	4	1	02	02	05	00	00	00	Retribusi Tempat Khusus Parkir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
150	31	4	1	02	02	06	00	00	00	Retribusi Tempat Penginapan/Pesanggrahan/Villa	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
151	32	4	1	02	02	07	00	00	00	Retribusi Rumah Potong Hewan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
152	33	4	1	02	02	08	00	00	00	Retribusi Pelayanan Kepelabuhanan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
153	34	4	1	02	02	09	00	00	00	Retribusi Tempat Rekreasi dan Olahraga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
154	35	4	1	02	02	10	00	00	00	Retribusi Penyeberangan di Air	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
155	36	4	1	02	02	11	00	00	00	Retribusi Penjualan Produksi Usaha Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
156	0	4	1	02	03	00	00	00	00	Retribusi Perizinan Tertentu	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
157	37	4	1	02	03	01	00	00	00	Retribusi Izin Mendirikan Bangunan	0	3000	\N	\N	2020-01-01	2022-12-31	\N	0
158	38	4	1	02	03	02	00	00	00	Retribusi Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
162	0	4	1	03	0	0	00	00	00	HASIL PENGELOLAAN KEKAYAAN DAERAH YANG DIPISAHKAN	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
192	0	4	1	04	07	00	000	00	00	Pendapatan Denda Atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
164	0	4	1	03	01	01	00	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Daerah/BUMD ........	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
165	0	4	1	03	02	00	00	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Milik Negara/BUMN	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
166	0	4	1	03	02	01	00	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada BUMN ..............	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
167	0	4	1	03	03	00	00	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Milik Swasta	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
168	0	4	1	03	03	01	00	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Milik Swasta…….	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
169	0	4	1	04	0	0	00	00	00	LAIN-LAIN PENDAPATAN ASLI DAERAH YANG SAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
170	0	4	1	04	01	00	00	00	00	Hasil Penjualan Aset Daerah Yang Tidak Dipisahkan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
171	0	4	1	04	01	01	00	00	00	Hasil Penjualan Tanah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
172	0	4	1	04	01	02	00	00	00	Hasil Penjualan Peralatan dan Mesin	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
173	0	4	1	04	01	03	00	00	00	Hasil Penjualan Gedung dan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
174	0	4	1	04	01	04	00	00	00	Hasil Penjualan Jalan, Irigasi dan Jaringan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
175	0	4	1	04	01	05	00	00	00	Hasil Penjualan Aset Tetap Lainnya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
176	0	4	1	04	02	00	00	00	00	Hasil Penjualan Aset Lainnya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
177	0	4	1	04	02	01	00	00	00	Hasil Penjualan Aset Lainnya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
178	0	4	1	04	03	00	00	00	00	Jasa Giro	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
179	0	4	1	04	03	01	00	00	00	Jasa Giro Kas Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
180	0	4	1	04	03	02	00	00	00	Jasa Giro Bendahara	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
181	0	4	1	04	03	03	00	00	00	Jasa Giro Dana Cadangan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
182	0	4	1	04	04	00	00	00	00	Pendapatan Bunga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
183	0	4	1	04	04	01	00	00	00	Pendapatan Bunga Deposito	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
184	0	4	1	04	04	02	00	00	00	Dana Bergulir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
185	0	4	1	04	05	00	00	00	00	Tuntutan Ganti Kerugian Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
186	0	4	1	04	05	01	00	00	00	Tuntutan Ganti Kerugian Daerah Terhadap Bendahara	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
187	0	4	1	04	05	02	00	00	00	Tuntutan Ganti Kerugian Daerah Terhadap Pegawai Negeri Bukan Bendahara	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
188	0	4	1	04	06	00	00	00	00	Komisi, Potongan dan Keuntungan Selisih Nilai Tukar Rupiah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
189	0	4	1	04	06	01	00	00	00	Penerimaan Komisi dari Penempatan Kas Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
190	0	4	1	04	06	02	00	00	00	Penerimaan Potongan dari	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
191	0	4	1	04	06	03	00	00	00	Penerimaan Keuntungan Selisih Nilai Tukar Rupiah dari ...	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
137	19	4	1	02	01	07	00	00	00	Retribusi Pemeriksaan Alat Pemadam Kebakaran	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
138	20	4	1	02	01	08	00	00	00	Retribusi Penggantian Biaya Cetak Peta	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
140	22	4	1	02	01	10	00	00	00	Retribusi Pengolahan Limbah Cair	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
141	23	4	1	02	01	11	00	00	00	Retribusi Pelayanan Tera/Tera Ulang	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
142	24	4	1	02	01	12	00	00	00	Retribusi Pelayanan Pendidikan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
143	25	4	1	02	01	13	00	00	00	Retribusi Pengawasan dan Pengendalian Menara Telekomunikasi 	2	\N	\N	\N	2020-01-01	2022-12-31	\N	0
159	39	4	1	02	03	03	00	00	00	Retribusi Izin Trayek untuk Menyediakan Pelayanan Angkutan Umum	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
160	40	4	1	02	03	04	00	00	00	Retribusi Izin Usaha Perikanan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
161	41	4	1	02	03	05	00	00	00	Retribusi Pengendalian Lalu Lintas	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
193	0	4	1	04	07	01	000	00	00	Pendapatan Denda Atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
194	0	4	1	04	12	00	000	00	00	Pendapatan Denda Pajak	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
202	8	4	1	04	12	12	000	00	00	Pendapatan Denda Pajak Air Tanah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
223	28	4	1	04	13	17	000	00	00	Pendapatan Denda Retribusi Tempat Pelelangan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
203	9	4	1	04	12	13	000	00	00	Pendapatan Denda Pajak Sarang Burung Walet	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
205	11	4	1	04	12	16	000	00	00	Pendapatan Denda Bea Perolehan Hak Atas Tanah dan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
206	0	4	1	04	13	00	000	00	00	Pendapatan Denda Retribusi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
208	13	4	1	04	13	02	000	00	00	Pendapatan Denda Retribusi Pelayanan Persampahan/ Kebersihan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
207	12	4	1	04	13	01	000	00	00	Pendapatan Denda Retribusi Pelayanan Kesehatan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
245	4	4	1	01	04	01	01	00	00	Reklame Papan	25	0	0	0	2020-01-01	2022-12-31	\N	0
246	4	4	1	01	04	01	02	00	00	Reklame Billboard	25	0	0	0	2020-01-01	2022-12-31	\N	0
247	4	4	1	01	04	01	03	00	00	Reklame Bersinar Papan	25	0	0	0	2020-01-01	2022-12-31	\N	0
248	4	4	1	01	04	01	04	00	00	Reklame Bersinar Megatron/Billboard	25	0	0	0	2020-01-01	2022-12-31	\N	0
249	4	4	1	01	04	01	05	00	00	Reklame Bersinar Neon Box	25	0	0	0	2020-01-01	2022-12-31	\N	0
200	6	4	1	04	12	14	000	00	00	Pendapatan Denda Pajak Mineral Bukan Logam dan Batuan	0	5000	\N	\N	2020-01-01	2022-12-31	\N	0
221	26	4	1	04	13	15	000	00	00	Pendapatan Denda Retribusi Pemakaian Kekayaan Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
77	5	4	1	01	10	01	001	00	00	Pajak Penerangan Jalan dihasilkan sendiri	1.5	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
222	27	4	1	04	13	16	000	00	00	Pendapatan Denda Retribusi Pasar Grosir dan/ atau Pertokoan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
237	16	4	1	02	03	06	00	00	00	Retribusi  Perpanjangan  Izin  Mempekerjakan Tenaga Kerja Asing (IMTA)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
209	14	4	1	04	13	03	000	00	00	Pendapatan Denda Retribusi Penggantian Biaya Cetak Kartu Tanda Penduduk dan Akta Catatan Sipil	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
210	15	4	1	04	13	04	000	00	00	Pendapatan Denda Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
211	16	4	1	04	13	05	000	00	00	Pendapatan Denda Retribusi Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
213	18	4	1	04	13	07	000	00	00	Pendapatan Denda Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
216	21	4	1	04	13	10	000	00	00	Pendapatan Denda Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
217	22	4	1	04	13	11	000	00	00	Pendapatan Denda Retribusi Pengolahan Limbah Cair	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
218	23	4	1	04	13	12	000	00	00	Pendapatan Denda Retribusi Pelayanan Tera/Tera Ulang	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
219	24	4	1	04	13	13	000	00	00	Pendapatan Denda Retribusi Pelayanan Pendidikan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
224	29	4	1	04	13	18	000	00	00	Pendapatan Denda Retribusi Terminal	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
220	25	4	1	04	13	14	000	00	00	Pendapatan Denda Retribusi Pengendalian Menara Telekomunikasi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
225	30	4	1	04	13	19	000	00	00	Pendapatan Denda Retribusi Tempat Khusus Parkir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
226	31	4	1	04	13	20	000	00	00	Pendapatan Denda Retribusi Tempat Penginapan/ Pesanggrahan/ Villa	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
227	32	4	1	04	13	21	000	00	00	Pendapatan Denda Retribusi Rumah Potong Hewan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
228	33	4	1	04	13	22	000	00	00	Pendapatan Denda Retribusi Pelayanan Kepelabuhan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
196	2	4	1	04	12	07	000	00	00	Pendapatan Denda Pajak Restoran	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
197	3	4	1	04	12	08	000	00	00	Pendapatan Denda Pajak Hiburan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
198	4	4	1	04	12	09	000	00	00	Pendapatan Denda Pajak Reklame	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
229	34	4	1	04	13	23	000	00	00	Pendapatan Denda Retribusi Tempat Rekreasi dan Olah raga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
214	19	4	1	04	13	08	000	00	00	Pendapatan Denda Retribusi Pemeriksaan Alat Pemadam Kebakaran	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
215	20	4	1	04	13	09	000	00	00	Pendapatan Denda Retribusi Penggantian Biaya Cetak Peta	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
212	17	4	1	04	13	06	000	00	00	Pendapatan Denda Retribusi Pelayanan Pasar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
230	35	4	1	04	13	24	000	00	00	Pendapatan Denda Retribusi Penyeberangan Air	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
231	36	4	1	04	13	25	000	00	00	Pendapatan Denda Retribusi Penjualan Produksi Usaha Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
232	37	4	1	04	13	26	000	00	00	Pendapatan Denda Retribusi Izin Mendirikan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
233	38	4	1	04	13	27	000	00	00	Pendapatan Denda Retribusi Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
234	39	4	1	04	13	28	000	00	00	Pendapatan Denda Retribusi Izin Gangguan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
235	40	4	1	04	13	29	000	00	00	Pendapatan Denda Retribusi Izin Trayek	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
236	41	4	1	04	13	30	000	00	00	Pendapatan Denda Retribusi Izin Perikanan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
199	5	4	1	04	12	10	000	00	00	Pendapatan Denda Pajak Penerangan Jalan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
201	7	4	1	04	12	11	000	00	00	Pendapatan Denda Pajak Parkir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
204	10	4	1	04	12	15	000	00	00	Pendapatan Denda Pajak Bumi dan Bangunan Perdesaan dan Perkotaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
252	11	4	1	01	16	01	001	00	00	BPHTB-Pemindahan Hak	0	0	0	0	2021-01-01	2025-01-01	\N	0
253	11	4	1	01	16	02	001	00	00	BPHTB-Pemberian Hak Baru	0	0	0	0	2021-01-01	2025-01-01		0
123	10	4	1	01	15	00	00	00	00	Pajak  Bumi  dan  Bangunan  Perdesaan  dan Perkotaan (PBBP2)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
108	6	4	1	01	14	23	001	00	00	Pasir dan kerikil	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
254	6	4	1	01	14	38	001	00	00	Zirkon	15	1000000	0	0	2021-01-01	2025-12-31	\N	0
255	6	4	1	01	14	39	001	00	00	Intan	15	5000000	0	0	2021-01-01	2025-12-31	\N	0
256	6	4	1	01	14	40	001	00	00	Batu Belah > 5cm (Granit/Andesit/Granodiorit)	5	150000	0	0	2021-01-01	2025-12-31	\N	0
257	6	4	1	01	14	41	001	00	00	Batu Split 1-5 cm (Granit/Andesit/Granodiorit)	5	175000	0	0	2021-01-01	2025-12-31	\N	0
258	6	4	1	01	14	42	001	00	00	Tanah Sirtu	5	125000	0	0	2021-01-01	2025-12-31	\N	0
259	6	4	1	01	14	43	001	00	00	Tanah Kuning	5	90000	0	0	2021-01-01	2025-12-31	\N	0
260	6	4	1	01	14	44	001	00	00	Tanah Urug	5	80000	0	0	2021-01-01	2025-12-31	\N	0
261	6	4	1	01	14	45	001	00	00	Tanah Merah (Lateri)	5	90000	0	0	2021-01-01	2025-12-31	\N	0
262	6	4	1	01	14	46	001	00	00	Pasir Beton	5	60000	0	0	2021-01-01	2025-12-31	\N	0
263	6	4	1	01	14	47	001	00	00	Pasir Urug	5	40000	0	0	2021-01-01	2025-12-31	\N	0
264	6	4	1	01	14	48	001	00	00	Batu Bata / Genteng	5	600	0	0	2021-01-01	2025-12-31	\N	0
136	18	4	1	02	01	06	00	00	00	Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
139	21	4	1	02	01	9	00	00	00	Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
163	0	4	1	03	01	00	00	00	00	Bagian Laba yang Dibagikan kepada Pemerintah Daerah (Dividen) atas Penyertaan Modal pada BUMN	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
16	1	4	1	01	06	06	001	00	00	Pesanggrahan	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
265	1	4	1	01	06	07	001	00	00	Penginapan dan sejenisnya	10	0	0	0	2020-01-01	2025-12-13	Yes	0
266	1	4	1	01	06	08	00	00	00	Kos dengan Jumlah kamar lebih dari 10 (sepuluh)	10	0	0	0	2020-01-01	2025-12-13	Yes	0
267	8	4	1	01	12	01	00	00	0	Pajak Air Tanah	20	0	0	0	2020-01-01	2025-12-31	Yes	0
\.


--
-- Data for Name: s_reklamebentuk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklamebentuk (s_idreklamebentuk, s_namareklamebentuk) FROM stdin;
1	Persegi/Kubus
2	Segitiga
3	Lingkaran
4	Silinder
\.


--
-- Data for Name: s_reklamejenis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklamejenis (s_idreklamejenis, s_namareklamejenis, s_idrekening, s_permanen, s_njop, s_urut, s_ukuran) FROM stdin;
5	Tinplat	59	1	30000	\N	1
11	Flagchain (Bendera)	61	2	5000	15	2
12	Selebaran	65	2	3000	15	2
7	Rombong	59	1	150000	\N	1
13	Baliho Udara	67	2	4000000	15	2
10	Poster/Stiker	63	2	5000	15	2
8	Spanduk	61	2	10000	15	1
9	Umbul umbul	61	2	10000	15	1
1	Tiang dan Perangkat	59	1	150000	\N	1
2	Tiang pakai ns/lampu	59	1	150000	\N	1
4	Neonbox	59	1	100000	15	1
6	Kendaraan	860	1	100000	15	1
3	Tempel	59	1	100000	\N	1
14	Baliho	61	2	60000	15	1
\.


--
-- Data for Name: s_reklamelokasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklamelokasi (s_idreklamelokasi, s_namareklamelokasi, s_klasifikasilokasi) FROM stdin;
1	Jl Tingang Menteng	1
2	Jl Trans Kalimantan KM 10	1
8	Jl Pemda	2
9	Jl Pananjung Tarung	2
15	Jl Darung Bawan	3
16	Jl Masyumi Layar	3
17	Jl Rey 2	3
18	Jl Tajakan Antang 	3
19	Kelurahan Kalawa	3
24	Diluar Kecamatan Kahayan Hulu	4
\.


--
-- Data for Name: s_reklamenilaiinsidentil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklamenilaiinsidentil (s_idreklamenilaiinsidentil, s_idjenisreklame, s_tipewaktu, s_nilaipersatuan, s_tahun) FROM stdin;
1	13	2	15000	2019
3	14	2	15000	2019
4	14	3	5000	2019
5	15	2	1000	2019
10	19	3	5000	2019
9	19	2	100000	2019
8	18	2	1000000	2019
7	17	2	1000	2019
6	16	2	1000	2019
2	13	3	5000	2019
\.


--
-- Data for Name: s_reklamenilaijalan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklamenilaijalan (s_idreklamenilaijalan, s_idjenisreklame, s_klasifikasilokasi, s_indeks) FROM stdin;
1	1	1	2.7
2	1	2	2.3
3	1	3	2
4	1	4	1.7
5	1	5	1.5
6	2	1	2.7
7	2	2	2.3
8	2	3	2
9	2	4	1.7
10	2	5	1.5
11	3	1	3
12	3	2	2
13	3	3	1
14	3	4	0.6
21	5	1	3
22	5	2	2.5
23	5	3	2
24	5	4	1.7
25	5	5	1.5
26	6	1	3
27	6	2	2.5
28	6	3	2
29	6	4	1.7
30	6	5	1.5
31	7	1	3
15	3	5	0.35
32	7	2	2.5
33	7	3	2
34	7	4	1.7
35	7	5	1.5
36	8	1	3
37	8	2	2
39	8	3	1
40	8	4	0.6
41	8	5	0.35
42	9	1	3
43	9	2	2
44	9	3	1
45	9	4	0.6
46	9	5	0.35
47	10	1	3
48	10	2	2
49	10	3	1
50	10	4	0.6
52	11	1	3
53	11	2	2
54	11	3	1
55	11	4	0.6
51	10	5	0.35
56	11	5	0.35
57	12	1	3
58	12	2	2
59	12	3	1
60	12	4	0.6
61	12	5	0.35
16	4	1	4.5
17	4	2	2
18	4	3	1
19	4	4	0.6
20	4	5	0.35
62	13	1	3
63	13	2	2.5
64	13	3	2
65	13	4	1.7
66	13	5	1.5
\.


--
-- Data for Name: s_reklamenilaiukuran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklamenilaiukuran (s_idukurannilaireklame, s_idjenisreklame, s_rangeukuran1, s_rangeukuran2, s_indeks, s_satuanukuran, s_keteranganukuran) FROM stdin;
1	1	0	1	0.1	m2	s/d 1 m²
2	1	1	5	0.3	m2	>1 s/d 5 m²
3	1	5	15	0.9	m2	>5 s/d 15 m²
4	1	15	40	2	m2	>15 s/d 40 m²
5	1	40	9999	2.5	m2	>40 m²
6	2	0	1	0.1	m2	s/d 1 m²
7	2	1	5	0.3	m2	>1 s/d 5 m²
8	2	5	15	0.9	m2	>5 s/d 15 m²
9	2	15	40	2	m2	>15 s/d 40 m²
10	2	40	9999	2.5	m2	>40 m²
11	3	0	1	0.1	m2	s/d 1 m²
12	3	1	5	0.3	m2	>1 s/d 5 m²
13	3	5	15	0.9	m2	>5 s/d 15 m²
14	3	15	40	2	m2	>15 s/d 40 m²
15	3	40	9999	2.5	m2	>40 m²
16	4	0	1	0.1	m2	s/d 1 m²
17	4	1	5	0.3	m2	>1 s/d 5 m²
18	4	5	15	0.9	m2	>5 s/d 15 m²
19	4	15	40	2	m2	>15 s/d 40 m²
20	4	40	9999	2.5	m2	>40 m²
21	5	0	1	0.1	m2	s/d 1 m²
22	5	1	5	0.3	m2	>1 s/d 5 m²
23	5	5	15	0.9	m2	>5 s/d 15 m²
25	5	40	9999	2.5	m2	>40 m²
24	5	15	40	2	m2	>15 s/d 40 m²
26	6	0	1	1	m2	s/d 1 m²
27	6	1	9999	2	m2	>1  m²
28	7	0	70	1	cm2	s/d 70 cm²
29	7	70	9999	2	cm2	> 70 cm²
30	8	0	2	2	m	s/d Ø 2 m
31	8	2	5	3	m	> Ø 2 s/d Ø 5 m
32	8	5	9999	5	m	> Ø 5 m 
33	9	0	1	0.4	jam	s/d 1 jam
34	9	1	3	0.6	jam	>1 s/d 3 jam
35	9	3	6	0.8	jam	>3 s/d 6 jam
36	9	6	10	1.1	jam	>6 s/d 10 jam
37	9	10	24	1.5	jam	>10 jam
38	10	0	15	1	detik	s/d 15 detik
39	10	15	60	2	detik	>15 s/d 60 detik
40	10	1.001	10	4	menit	> 60 detik s/d 10 menit
41	10	10	60	8	menit	>10 menit s/d 60 menit
42	10	1	24	10	jam	>1 jam
43	11	1	15	1	detik	s/d 15 detik
44	11	15	60	2	detik	>15 s/d 60 detik
45	11	1	10	4	menit	> 60 detik s/d 10 menit
46	11	10	60	8	menit	>10 menit s/d 60 menit
47	11	1	24	10	jam	>1 jam
48	12	0	1	2	jam	s/d 1 jam
49	12	1	6	3	jam	>1 s/d 6 jam
50	12	6	12	5	jam	>6 s/d 12 jam
51	12	12	24	9	jam	>12 jam
52	13	0	70	2	cm2	s/d 70 cm²
53	13	70	100	3	cm2	> 70 cm² s/d 100 cm²/(1m²)
54	13	1	2	6	m2	1 m² s/d 2 m²
55	13	2	9999	9	m2	> 2 m²
\.


--
-- Data for Name: s_reklamenilaiwaktu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklamenilaiwaktu (s_idjangkawaktu, s_idjenisreklame, s_waktu1, s_waktu2, s_indeks, s_idreklamewaktu) FROM stdin;
2	1	2	3	2.5	2
3	1	4	6	4	2
4	1	7	12	6	2
6	2	2	3	2.5	2
7	2	4	6	4	2
8	2	7	12	6	2
10	3	2	3	5	2
11	3	4	6	9	2
12	3	7	12	17	2
14	4	2	3	5	2
15	4	4	6	9	2
16	4	7	12	17	2
18	5	2	3	5	2
19	5	4	6	9.5	2
20	5	7	12	18	2
22	6	2	3	5	2
23	6	4	6	9	2
24	6	7	12	16	2
26	7	2	3	5	2
27	7	4	6	9	2
28	7	7	12	16	2
30	8	2	3	5	2
31	8	4	6	9	2
32	8	7	12	18	2
34	9	2	3	5	2
35	9	4	6	9	2
36	9	7	12	18	2
38	10	8	30	5	3
40	10	91	365	18	3
39	10	31	90	9.5	3
42	11	8	30	5	3
43	11	31	90	9.5	3
44	11	91	365	18	3
37	10	1	7	2.4	3
33	9	1	1	2	2
29	8	1	1	2	2
41	11	1	7	2.4	3
25	7	1	1	2	2
21	6	1	1	2	2
17	5	1	1	2.4	2
1	1	1	1	1	2
5	2	1	1	1	2
9	3	1	1	2.4	2
13	4	1	1	2.4	2
45	12	1	3	2.4	3
46	12	4	7	5	3
47	12	8	30	9.5	3
48	12	31	365	18	3
49	13	1	1	2	2
50	13	2	3	5	2
51	13	4	6	9	2
52	13	7	12	18	2
\.


--
-- Data for Name: s_reklamenjop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklamenjop (s_idnjopreklame, s_idjenisreklame, s_njopdasar, s_klasifikasilokasi) FROM stdin;
1	1	200000	1
2	1	200000	2
3	1	200000	3
4	1	200000	4
5	1	150000	5
6	2	200000	1
7	2	200000	2
8	2	200000	3
9	2	200000	4
10	2	150000	5
11	3	300000	1
12	3	300000	2
13	3	300000	3
14	3	300000	4
15	3	250000	5
16	4	300000	1
17	4	300000	2
18	4	300000	3
19	4	300000	4
20	4	250000	5
21	5	50000	1
22	5	50000	2
23	5	50000	3
24	5	50000	4
26	6	1000	1
25	5	45000	5
27	6	1000	2
28	6	1000	3
29	6	1000	4
30	6	750	5
31	7	500	1
32	7	500	2
33	7	500	3
34	7	500	4
35	7	400	5
36	8	450000	1
37	8	450000	2
38	8	450000	3
39	8	450000	4
40	8	400000	5
41	9	350000	1
42	9	350000	2
43	9	350000	3
44	9	350000	4
45	9	300000	5
46	10	4000	1
47	10	4000	2
48	10	4000	3
49	10	4000	4
50	10	3500	5
51	11	25000	1
52	11	25000	2
53	11	25000	3
54	11	25000	4
55	11	20000	5
56	12	50000	1
57	12	50000	2
59	12	50000	4
60	12	40000	5
58	12	50000	3
59	13	3000	1
60	13	3000	2
61	13	3000	3
62	13	3000	4
63	13	2500	5
\.


--
-- Data for Name: s_reklamesatuan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklamesatuan (s_idsatuanreklame, s_idjenisreklame, s_namasatuan) FROM stdin;
6	6	Lembar
8	8	Hari
9	9	Hari
10	10	Unit
11	11	Buah
1	1	Buah
2	2	Buah
3	3	Buah
4	4	Buah
5	5	Buah
7	7	Buah
\.


--
-- Data for Name: s_reklametarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklametarif (s_idtarifreklame, s_idrekening, s_tarifreklame, s_jenistarif, s_keterangan) FROM stdin;
1	\N	20	1	Rokok
2	\N	15	2	Lainya
\.


--
-- Data for Name: s_reklametariftambahan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklametariftambahan (s_idreklametariftambahan, s_idjenisreklame, s_tariftambahan) FROM stdin;
1	1	25
2	2	25
\.


--
-- Data for Name: s_reklamewaktu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklamewaktu (s_idreklamewaktu, s_namareklamewaktu) FROM stdin;
1	Tahun
2	Bulan
3	Hari
4	Minggu
\.


--
-- Data for Name: s_satker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_satker (s_idsatker, s_kodesatker, s_namasatker) FROM stdin;
1	1.01 . 1-01.0-00.0-00.01	Dinas Pendidikan
26	4.01 . 7-01.0-00.0-00.32	Kecamatan Jabiren Raya
27	4.01 . 7-01.0-00.0-00.33	Kecamatan Maliku
28	4.01 . 7-01.0-00.0-00.34	Kecamatan Pandih Batu
29	4.01 . 7-01.0-00.0-00.35	Kecamatan Kahayan Kuala
30	4.01 . 7-01.0-00.0-00.36	Kecamatan Sebangau Kuala
31	4.01 . 7-01.0-00.0-00.37	Kecamatan Kahayan Tengah
32	4.01 . 7-01.0-00.0-00.38	Kecamatan Banama Tingang
33	4.01 . 7-01.0-00.0-00.31	Kecamatan Kahayan Hilir
34	4.01 . 8-01.0-00.0-00.06	Badan Kesatuan Bangsa, Politikan Perlindungan Masyarakat
2	1.02 . 1-02.0-00.0-00.02	Dinas Kesehatan
18	2.23 . 2-23.2-24.0-00.22	Dinas Perpustakaan dan Kearsipan
19	3.25 . 3-25.0-00.0-00.23	Dinas Perikanan
3	1.03 . 1-03.1-04.0-00.04	Dinas Pekerjaan Umum, Penataan Ruang
4	1.05 . 1-05.0-00.0-00.07	Satuan Polisi Pamong Praja
20	3.27 . 3-27.0-00.0-00.24	Dinas Pertanian
5	1.05 . 8-01.0-00.0-00.06	Badan Kesatuan Bangsa, Politik dan Perlindungan Masyarakat
6	1.06 . 1-06.0-00.0-00.08	Dinas Sosial
7	1.06 . 1-06.0-00.0-00.09	Badan Penanggulangan Bencana Daerah
23	4.01 . 4-01.3-29.5-06.25	Sekretariat Daerah Kabupaten Pulang Pisau
9	2.08 . 2-08.2-14.0-00.10	Dinas Pemberdayaan Perempuan, Perlindungan Anak, Pengendalian Penduduk Dan Keluarga Berencana
8	2.07 . 2-07.3-32.0-00.10	Dinas Tenaga Kerja dan Transmigrasi
10	2.09 . 2-09.0-00.0-00.12	Dinas Ketahanan Pangan
11	2.11 . 2-11.3-28.0-00.12	Dinas Lingkungan Hidup
12	2.12 . 2-12.0-00.0-00.14	Dinas Kependudukan dan Pencatatan Sipil
13	2.13 . 2-13.0-00.0-00.15	Dinas Pemberdayaan Masyarakat dan Desa
14	2.15 . 2-15.0-00.0-00.16	Dinas Perhubungan
15	2.16 . 2-16.0-00.0-00.15	Dinas Komunikasi dan Informatika, Statistik dan Persandian
16	2.18 . 2-18.0-00.0-00.19	Dinas Penanaman Modal Dan Pelayanan Terpadu Satu Pintu
17	2.19 . 2-19.0-00.0-00.20	Dinas Kepemudaan Dan Olah Raga
24	4.01 . 4-02.0-00.0-00.26	Sekretariat DPRD
35	5.01 . 5-01.5-05.0-00.27	Badan Perencanaan Pembangunan Daerah, Penelitian dan Pengembangan
36	5.02 . 5-02.0-00.0-00.28	Badan Pendapatan Pengelolaan Keuangan dan Aset Daerah
37	5.03 . 5-03.0-00.0-00.29	Badan Kepegawaian, Pendidikan dan Pelatihan
38	6.01 . 6-01.0-00.0-00.30	Inspektorat
22	2.22 . 3-26.3-26.0-00.21	Dinas Kebudayaan dan Pariwisata
21	3.30 . 3-30.3-31.3-31.18	Dinas Perdagangan, Perindustrian, Koperasi Dan Usaha Kecil Menengah
25	1.02 . 1-02.0-00.0-00.03	Rumah Sakit Umum Daerah
\.


--
-- Data for Name: s_target; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_target (s_idtarget, s_tahuntarget, s_statustarget, s_keterangantarget) FROM stdin;
1	2022	1	Target Pendapatan
2	2022	1	PAJAK DAERAH
\.


--
-- Data for Name: s_targetdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_targetdetail (s_idtargetdetail, s_idtargetheader, s_targetrekening, s_targetjumlah) FROM stdin;
1	1	265	7000000
2	1	23	30000000
3	1	30	25000000
4	1	34	900000000
5	1	59	15000000
6	1	61	30000000
7	1	45	5250000
8	1	51	1875000
9	1	53	1500000
10	1	55	1500000
11	1	78	3200000000
12	1	362	50000000
13	1	97	150000000
14	1	108	2500000000
15	1	113	75000000
16	1	124	1500000000
17	1	252	1000000000
18	1	253	11725149320
19	1	365	1061500000
20	1	372	148500000
21	1	376	45500000
22	1	378	17228400
23	1	379	35000000
24	1	400	50000000
25	1	410	240000000
26	1	414	120000000
27	1	415	240500000
28	1	429	184000000
29	1	431	17500000
30	1	433	50000000
31	1	437	750000000
32	1	440	12750000
33	1	858	123250000
34	1	446	1885000000
35	1	450	21000000
36	1	459	35000000
37	1	466	4942536465
38	1	576	2000000000
39	1	592	1100000000
40	1	697	25000000000
41	1	705	6000000000
42	1	722	10722523000
43	1	723	3745944000
44	1	726	196378000
45	1	728	26697158000
46	1	730	5415168000
47	1	733	1918826000
48	1	736	515815678000
49	1	855	10977718000
50	1	739	4227709000
51	1	752	3286572000
52	1	753	18030715000
53	1	754	138684000
54	1	781	20418390000
55	1	803	6170065000
56	1	806	79514196000
57	1	810	4260436530
58	1	811	4713758972
59	1	812	16638893814
60	1	813	29457100
61	1	814	6132453585
62	1	845	20418390000
63	1	762	2097201000
64	1	854	8004264000
65	1	755	4994750000
66	1	749	10530214000
67	1	766	11781618000
68	1	763	5774059000
69	1	765	4012416000
70	1	768	8226412000
71	1	769	2600000000
72	1	863	4210189000
73	1	864	1088794000
74	1	760	892254000
75	1	786	53825173000
76	1	787	2136000000
77	1	788	4787108000
78	1	784	2840770000
79	1	785	58480000
80	1	791	15486542000
81	1	797	400800000
82	1	865	374435000
83	1	796	2103759000
84	1	867	451800000
85	1	868	516800000
86	1	856	2079980000
87	2	265	7000000
88	2	23	30000000
89	2	30	25000000
90	2	34	900000000
91	2	45	5250000
92	2	51	1875000
93	2	53	1500000
94	2	55	1500000
95	2	59	15000000
96	2	61	30000000
97	2	269	3200000000
98	2	362	50000000
99	2	97	150000000
100	2	108	2500000000
101	2	113	75000000
102	2	124	1500000000
103	2	252	1000000000
104	2	253	11725149320
\.


--
-- Data for Name: s_targetjenis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_targetjenis (s_idtargetjenis, s_namatargetjenis) FROM stdin;
1	Murni
2	Perubahan
\.


--
-- Data for Name: s_targetsatker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_targetsatker (s_idtargetsatker, s_idkorek, s_idkelompoktargetsatker, s_target) FROM stdin;
\.


--
-- Data for Name: s_tarifbudidaya; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tarifbudidaya (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
\.


--
-- Data for Name: s_tarifbudidayamutiara; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tarifbudidayamutiara (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
\.


--
-- Data for Name: s_tarifgedung; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tarifgedung (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
1	S. Kamal Junaidi	5000000	/hari
2	S. GBK	7500000	/hari
3	S. GBK || Lapangan Rumput - Sepak Bola Komersial	5000000	
4	S. GBK || Lapangan Rumput - Sepak Bola non Komersial	2000000	
5	S. GBK || Tribun Beratap - Kegiatan Komersial	500000	
6	S. GBK || Tribun Beratap - Kegiatan non Komersial	250000	
7	S. GBK || Tribun Terbuka - Kegiatan Komersial	250000	
8	S. GBK || Tribun Terbuka - Kegiatan non Komersial	150000	
9	S. GBK || Pemakaian Genset dan Lampu	2500000	/hari
10	Kolam Renang	5000	/orang
11	Tempat/Gedung Olah Raga Lainnya	30000	/jam
\.


--
-- Data for Name: s_tarifkapal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tarifkapal (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
\.


--
-- Data for Name: s_tarifkebersihan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tarifkebersihan (s_idtarif, s_idklasifikasi, s_keterangan, s_tarifdasar, s_satuan) FROM stdin;
2	1	Asrama / Rumah Kost (<=50 orang)	8000	bulan
3	1	Asrama / Rumah Kost (>50 orang)	11000	bulan
4	2	Warung Makan / Restoran	15000	bulan
5	2	Toko / Kios / Salon / Sejenisnya	10000	bulan
6	2	Hotel / Penginapan	25000	bulan
7	2	Rumah sakit / Klinik / Puskesmas /Apotek / Sejenisnya	20000	bulan
8	2	Bioskop / Tempat hiburan /Warnet	15000	bulan
10	2	Perkantoran / Bank (Pemerintah)	15000	bulan
11	2	Perkantoran / Bank (Swasta)	25000	bulan
1	1	Rumah Tinggal	2000	bulan
9	2	Industri Pengolahan Temasuk Usaha Pertukangan dan Pergudangan	20000	bulan
12	3	Mall	1000000	bulan
\.


--
-- Data for Name: s_tarifkir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tarifkir (s_idtarif, s_keterangan, s_tarif, s_satuan) FROM stdin;
1	PENGUJIAN || Mobil Penumpang Umum	200000	\N
2	PENGUJIAN || Mobil Bus	300000	\N
3	PENGUJIAN || Mobil Barang	300000	\N
4	PENGUJIAN || Kendaraan Khusus	300000	\N
5	PENGUJIAN || Kereta Tempelan	300000	\N
6	PENGUJIAN || Kereta Gandengan	300000	\N
7	PERGANTIAN || Plat Uji	30000	\N
8	PERGANTIAN || Surat Tanda Uji Kendaraan / Buku	50000	\N
9	PERGANTIAN || Tanda Samping Kendaraan / Stiker	50000	\N
\.


--
-- Data for Name: s_tarifparkirtepi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tarifparkirtepi (s_idtarif, s_keterangan, s_tarif, s_satuan) FROM stdin;
1	Sedan, Jeep, Pickup, Minibus dan sejenisnya	2000	Sekali Parkir
2	Bus, Truk dan Alat Berat lainnya	3000	Sekali Parkir
3	Sepeda Motor	1000	Sekali Parkir
4	Gerobak	1000	Sekali Parkir
5	Roda Dua	60000	Berlangganan
6	Roda Empat	150000	Berlangganan
\.


--
-- Data for Name: s_tarifpasar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tarifpasar (s_idtarif, s_idklasifikasi, s_keterangan, s_tarifdasar, s_luas, s_satuan) FROM stdin;
1	1	Los Pasar [Meja]	2000	m2	hari
2	1	Los Pasar [Pelataran]	1000	m2	hari
3	1	Los Pasar [Kios Semi Permanen]	7500	m2	bulan
4	1	Kios [Permanen]	8000	m2	bulan
5	1	Kios [Semi Permanen]	7000	m2	bulan
6	2	Los Pasar [Meja]	1500	m2	hari
7	2	Los Pasar [Pelataran]	1000	m2	hari
8	2	Kios [Permanen]	7500	m2	bulan
9	2	Kios [Semi Permanen]	5000	m2	bulan
10	3	Bea Balik hak Pakai Kios Milik Pemda	300000	-	-
\.


--
-- Data for Name: s_tarifpasargrosir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tarifpasargrosir (s_idtarif, s_idklasifikasi, s_keterangan, s_tarifdasar, s_luas, s_satuan) FROM stdin;
1	1	Lantai Pertama	25000	m2	bulan
2	1	Lantai kedua	20000	m2	bulan
3	2	Lantai Pertama	25000	m2	bulan
5	3	Dalam Ibukota Kabupaten	20000	m2	bulan
4	2	Lantai kedua	20000	m2	bulan
6	3	Dalam Ibukota Kecamtan dan Kelurahan/Desa	15000	m2	bulan
\.


--
-- Data for Name: s_tarifpemadam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tarifpemadam (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
1	Super Busa || isi lebih dari 25 liter	12000	per tabung
2	Super Busa || isi lebih dari 25 liter s/d 50 liter	15000	per tabung
3	Super Busa || isi lebih dari 50 liter s/d 150 liter	20000	per tabung
4	Super Busa || isi lebih dari 150 liter	25000	per tabung
5	Dry Powder (sebuk), Gen CO2 || berat sampai dengan 6 Kg	12500	buah
6	Dry Powder (sebuk), Gen CO2 || berat lebih dari 6 Kg s/d 20 Kg	17500	buah
7	Dry Powder (sebuk), Gen CO2 || berat lebih dari 20 Kg s/d 150 Kg	25000	buah
8	Dry Powder (sebuk), Gen CO2 || berat lebih dari 150 Kg	30000	buah
\.


--
-- Data for Name: s_tarifrumahdinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tarifrumahdinas (s_idtarifret, s_namatarif, s_luasawal, s_luasakhir, s_satuan, s_tarif) FROM stdin;
1	Luas s/d 36 m2	1	36	m2/bulan	3000
2	Luas s/d 50 m2	36	50	m2/bulan	3100
3	Luas s/d 70 m2	50	70	m2/bulan	3500
4	Luas s/d 120 m2	70	120	m2/bulan	4000
5	Luas s/d 250 m2	120	250	m2/bulan	4500
6	Luas lebih dari 250 m2	250	10000	m2/bulan	5000
\.


--
-- Data for Name: s_tariftanahreklame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tariftanahreklame (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
1	Strategis I || Bisnis	3000	/m2/bulan
2	Strategis I || Perumahan	200	/m2/bulan
3	Strategis I || Pertanian	30	/m2/bulan
4	Strategis I || Warung dan Bangunan Lainnya tidak permanen(Sewa Harian)	150	/m2/hari
5	Strategis I || untuk kepentingan lainnya	200	/m2/hari
6	Strategis II || Bisnis	1000	/m2/bulan
7	Strategis II || Perumahan	150	/m2/bulan
8	Strategis II || Pertanian	25	/m2/bulan
9	Strategis II || Warung dan Bangunan Lainnya tidak permanen(Sewa Harian)	100	/m2/hari
10	Strategis II || untuk kepentingan lainnya	150	/m2/hari
11	Strategis III || Bisnis	750	/m2/bulan
12	Strategis III || Perumahan	100	/m2/bulan
13	Strategis III || Pertanian	20	/m2/bulan
14	Strategis III || Warung dan Bangunan Lainnya tidak permanen(Sewa Harian)	75	/m2/hari
\.


--
-- Data for Name: s_tariftempatparkir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tariftempatparkir (s_idtarif, s_jeniskendaraan, s_tarifdasar) FROM stdin;
1	Sedan, Jeep, Pickup, Minibus dan sejenisnya	2000
2	Bus, Truk dan Alat Berat lainnya	3000
3	Sepeda Motor	1000
4	Gerobak	1000
\.


--
-- Data for Name: s_tariftera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tariftera (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
1	Ukuran Pajang (salib ukur, Blok ukur, Alat ukur tinggi)	10000	\N
2	Alat Ukur Permukaan Cairan (Level Gauge) mekanik,elektronik)	100000	\N
3	Takarang Basah/Kering (2L sampai 25L dan diatas 25L)	20000	\N
4	Tangki Ukur Air (500KL, 10.000 KL sampai 20.000 KL)	200000	\N
5	Tangki Ukur Gerak (tangki ukur mobil/wagon)	80000	\N
6	Alat Ukur dari Gelas (labu ukur, buret,pipet dan alat suntik)	3000	\N
7	Bejana Ukur (50L, 200L, 500L, 1000L)	40000	\N
8	Meter Taksi	10000	\N
9	Spedometer	15000	\N
10	Meter Rem	15000	\N
11	Tackmometer	30000	\N
12	Thermometer	6000	\N
13	Densimeter	6000	\N
14	VIskometer	6000	\N
15	Alat ukur Luas	5000	\N
16	Alat Ukur Sudut	5000	\N
17	Alat Ukur Cairan Minyak	40000	\N
18	Alat Ukur Gas	100000	\N
19	Meter Air (15m3/h, 100 m3/h, atau lebih dari 100 m3/h	20000	\N
21	Pembatasan Arus air	10000	\N
20	Meter Cairan Minum selain Air (15m3/h, 100m3/h	60000	\N
22	Alat Kompensasi : Suhu (ATC) Tenakanan/Kompensasi	10000	\N
23	Meter Prover	100000	\N
24	Meter Arus Massa	50000	\N
25	Alat Ukur Pengisi (Filing Machine)	20000	\N
26	Meter Listrik (Meter KWH)	12000	\N
27	Meter Energi Listrik	12000	\N
28	Pembatasan Arus Listrik	5000	\N
29	Stop Watch	1000	\N
30	Meter Parkir	2500	\N
31	Anak Timbangan	5000	\N
32	Timbangan	50000	\N
33	Dead Weight Testing	10000	\N
34	Pencap Kartu	5000	\N
35	Meter Kadar Air	2500	\N
\.


--
-- Data for Name: s_tarifterminal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tarifterminal (s_idtarif, s_idjenispelayanan, s_keterangan, s_tarifdasar, s_satuan) FROM stdin;
1	1	Angkutan Kota || Otolet Kapasitas Penumpang s/d 11 orang	2000	sekali keluar
2	1	Angkutan Kota || Bis Kecil Kapasitas Penumpang s/d 14 orang	2500	sekali keluar
3	1	Angkutan Kota || Bis Kota Kapasitas Penumpang s/d 76 orang	3000	sekali keluar
4	1	Angkutan antar Distrik || Bis Sedang Kapasitas Penumpang s/d 30 orang	2500	sekali keluar
5	1	Angkutan antar Distrik || Bis besar kapasitas Penumpang s/d 30 orang	3000	sekali keluar
6	2	Kios	2500	per hari
7	2	Warung	3000	per hari
8	3	Fasilitas WC || Buang Air Besar / orang	2000	per orang
9	3	Fasilitas WC || Buang Air Kecil / orang	1000	per orang
10	3	Fasilitas Kamar Mandi || Mandi / orang	2000	sekali per orang
\.


--
-- Data for Name: s_tariftrayek; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tariftrayek (s_idtarif, s_keterangan, s_tarif, s_satuan) FROM stdin;
1	Mobil Penumpang s/d 8 Orang	200000	Per Kendaraan Pertahun
2	Mobil Bus 9 s/d 15 Orang	300000	Per Kendaraan Pertahun
3	Mini Bus 16 s/d 25 Orang	400000	Per Kendaraan Pertahun
4	Angkutan Pedesaan	300000	Per Kendaraan Pertahun
\.


--
-- Data for Name: s_tipeusaha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_tipeusaha (s_idusaha, s_kodeusaha, s_namausaha) FROM stdin;
1	1	PT
2	2	CV
3	3	BIRO REKLAME
4	4	RUMAH MAKAN
5	5	HOTEL
6	6	PRIBADI
7	7	PAGELARAN & PERTUNJUKAN
8	8	PANTI PIJAT URUT TRADISIONAL
9	9	BILIAR
10	10	PERMAINAN KETANGKASAN
11	11	KARAOKE/LIVE MUSIC
12	12	RENTAL
13	13	WARUNG MAKAN
14	14	RESTORAN
16	16	TV GAME
17	17	RUMAH SEWA/KONTRAK
18	18	LOSMEN
19	19	WISMA
20	20	LASER DISC
21	21	KESEHATAN
24	24	KOLAM RENANG
26	26	TOKO
27	27	BENGKEL/SERVICE
28	28	APOTIK
30	30	WARNET
33	33	JASA ANGKUTAN
34	34	KIOS
35	35	SALON
36	36	HIBURAN
15	15	CAFETARIA
22	22	MEUBEL/TUKANG KAYU
23	23	WARTEL
25	25	KOPERASI
29	29	AGEN MINYAK
31	31	INDUSTRI
32	32	PETERNAKAN
37	99	LAIN_LAIN
\.


--
-- Data for Name: s_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_users (s_iduser, s_username, s_password, s_akses, s_noidentitas, s_nama, s_alamat, s_email, s_notelp, s_usipad, s_tgldaftar, s_jenisidentitas, s_kewarganegaraan, s_jenisizin, s_jabatan, s_tipeoperator, s_passwordreset, s_passwordresetvalid, s_menu, s_wp) FROM stdin;
17	agnes	827ccb0eea8a706c4c34a16891f84e7b	3	-	AGNES SABATINI	\N	\N	\N	\N	\N	\N	\N	\N	Operator DafDa	\N	\N	\N	(1),(2),(3),(4),(5),(6),(7),(11),(12)	0
13	arul	827ccb0eea8a706c4c34a16891f84e7b	6	198903272014021005	QAMARUL SYA'BAN, S.H	\N	\N	\N	\N	\N	\N	\N	\N	Bendahara Penerima	\N	\N	\N	(1),(8),(11),(12)	0
37	litri	2fe2790cab9d8dccb8c4e163e805874d	3	-	LITRI	\N	\N	\N	\N	\N	\N	\N	\N	Operator DafDa	\N	\N	\N	(1),(2),(3),(4),(5),(6),(7),(11),(12)	0
41	perizinan	827ccb0eea8a706c4c34a16891f84e7b	11	-	perizinan	\N	\N	\N	\N	\N	\N	\N	\N	-	\N	\N	\N	(29),(30)	0
3	fino	e3a0ddc2518d29e6c93299bf24d2c04e	3	-	ELVINO PRAYOGO	\N	\N	\N	\N	\N	\N	\N	\N	Operator DafDa	\N	\N	\N	(1),(2),(3),(4),(5),(6),(7),(11),(12)	0
5	SANDRA	827ccb0eea8a706c4c34a16891f84e7b	2	199105262014021001	SANDRA WIJAYA, SE	\N	\N	\N	\N	\N	\N	\N	\N	PENGELOLA SUMBER PAD	\N	\N	\N	(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(27),(29),(30)	0
1	siti	db25a6d8e75a6b0a39c887723b30e404	3	-	SITI NORDIANTIE	\N	\N	\N	\N	\N	\N	\N	\N	Operator DafDa	\N	\N	\N	(1),(2),(3),(4),(5),(6),(7),(11),(12)	0
39	teguh	827ccb0eea8a706c4c34a16891f84e7b	6	-	Teguh	\N	\N	\N	\N	\N	\N	\N	\N	Bendahara	\N	\N	\N	(1),(8),(11),(12)	0
2	admin	827ccb0eea8a706c4c34a16891f84e7b	2	\N	Administrator Aplikasi	\N	\N	\N	\N	\N	\N	\N	\N	Administrator	\N	\N	\N	(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(27),(29),(30)	0
42	satpol	827ccb0eea8a706c4c34a16891f84e7b	11	-	Satpol	\N	\N	\N	\N	\N	\N	\N	\N	Satpol	\N	\N	\N	(29),(30)	0
43	uus	827ccb0eea8a706c4c34a16891f84e7b	12	F	F	\N	\N	\N	\N	\N	\N	\N	\N	F	\N	\N	\N	(1),(11)	0
44	yessie	827ccb0eea8a706c4c34a16891f84e7b	12	-	Yessie	\N	\N	\N	\N	\N	\N	\N	\N	Kepala Bidang Pendapatan 	\N	\N	\N	(1),(11)	0
4	erni	827ccb0eea8a706c4c34a16891f84e7b	2	198602072010012024	ERNI ANITASARI, S.Kom	\N	\N	\N	\N	\N	\N	\N	\N	KEPALA SUB BIDANG PENDATAAN DAN PENETAPAN	\N	\N	\N	(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(27)	0
38	SYAIFUL	6cfd762a08ddc2024e23ebfe7a1e92ed	3	198204292010011009	SYAIFUL RASYID, SE	\N	\N	\N	\N	\N	\N	\N	\N	VERIFIKATOR KEUANGAN PADA SUB BIDANG PENDATAAN PENETAPAN	\N	\N	\N	(1),(2),(3),(4),(5),(6),(7),(11),(12)	0
40	indah	827ccb0eea8a706c4c34a16891f84e7b	8	198008032006042012	INDAH RAHMAWATI	\N	\N	\N	\N	\N	\N	\N	\N	KEPALA SUB BIDANG PELAYANAN DAN PENAGIHAN	\N	\N	\N	(1),(4),(3),(5),(6),(7),(9),(11)	0
\.


--
-- Data for Name: t_angsuran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_angsuran (t_idangsuran, t_idwpobjek, t_idketetapan, t_jenispajak, t_jenisketetapan, t_noangsuran, t_tglketetapanangsuran, t_jumlahkaliangsuran, t_tgljadwalangsuran, t_nominalangsuran, t_angsuranke, t_kodebayarangsuran, t_inputangsuran, t_pokokpembayaranangsuran, t_bungapembayaranangsuran, t_totalpembayaranangsuran, t_tglpembayaranangsuran, t_inputpembayaranangsuran) FROM stdin;
2	4735	1118	8	2	1	2020-08-25	4	2020-08-25	100000	1	8209081120000001	28	\N	\N	\N	\N	\N
3	4735	1118	8	2	2	2020-08-25	4	2020-09-25	10000	2	8209081120000002	28	\N	\N	\N	\N	\N
4	4735	1118	8	2	3	2020-08-25	4	2020-10-25	50000	3	8209081120000003	28	\N	\N	\N	\N	\N
5	4735	1118	8	2	4	2020-08-25	4	2020-11-25	106800	4	8209081120000004	28	\N	\N	\N	\N	\N
\.


--
-- Data for Name: t_berkas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_berkas (t_idberkas, t_idtransaksi, t_namaberkas, t_letakberkas) FROM stdin;
24	252	index.jpg	public/upload/filetransaksi/252
25	252	clock.png	public/upload/filetransaksi/252
26	252	Nama2 OPD Kab. Kapuas.xls	public/upload/filetransaksi/252
29	1728	PB1 Juli 2021 - Kapuas Kab. (ABB).pdf	public/upload/filetransaksi/1728
30	1727	PB1 Juli 2021 - Kapuas Kab. (KPP).pdf	public/upload/filetransaksi/1727
31	1934	PB1 Juni 2021 - Kapuas Kab. (ABB).pdf	public/upload/filetransaksi/1934
32	1935	PB1 Juni 2021 - Kapuas Kab. (KPP).pdf	public/upload/filetransaksi/1935
33	2227	PB1 Agustus 2021 - Kapuas Kab. (KPP).pdf	public/upload/filetransaksi/2227
34	2228	PB1 Agustus 2021 - Kapuas Kab. (ABB).pdf	public/upload/filetransaksi/2228
35	2844	PB1 September 2021 - Kapuas Kab. (KPP).pdf	public/upload/filetransaksi/2844
36	2845	PB1 September 2021 - Kapuas Kab. (ABB).pdf	public/upload/filetransaksi/2845
37	3740	PB1 Oktober 2021 - Kapuas Kab. (KPP).pdf	public/upload/filetransaksi/3740
38	3741	PB1 Oktober 2021 - Kapuas Kab. (ABB).pdf	public/upload/filetransaksi/3741
39	4706	PB1 November 2021 - Kapuas Kab. (KPP).pdf	public/upload/filetransaksi/4706
40	4707	PB1 November 2021 - Kapuas Kab. (ABB).pdf	public/upload/filetransaksi/4707
\.


--
-- Data for Name: t_dataop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_dataop (t_idop, t_npwpd, t_ayat) FROM stdin;
\.


--
-- Data for Name: t_datatransaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_datatransaksi (t_idtransaksi, t_npwpd, t_ayat, t_type, t_klas, t_tglditerima, t_tglawal, t_tglakhir, t_periode, t_pajak) FROM stdin;
\.


--
-- Data for Name: t_datawpdaftar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_datawpdaftar (t_idwp, t_npwpd, t_namawp, t_alamatwp, t_tgldaftarwp) FROM stdin;
\.


--
-- Data for Name: t_datawpusaha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_datawpusaha (t_idwp, t_npwpd, t_namausaha, t_alamatusaha, t_tgldaftarusaha) FROM stdin;
\.


--
-- Data for Name: t_detailair; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailair (t_idair, t_idtransaksi, t_volume, t_kodekelompok, t_volumeair0, t_hargadasar0, t_tarif0, t_jumlah0, t_volumeair1, t_hargadasar1, t_tarif1, t_jumlah1, t_volumeair2, t_hargadasar2, t_tarif2, t_jumlah2, t_volumeair3, t_hargadasar3, t_tarif3, t_jumlah3, t_volumeair4, t_hargadasar4, t_tarif4, t_jumlah4, t_volumeair5, t_hargadasar5, t_tarif5, t_jumlah5, t_volumeair6, t_hargadasar6, t_tarif6, t_jumlah6, t_fna, t_tarifdasarkorek, t_perhitungan, t_totalnpa, t_lamawaktu, t_debitair, t_kualitasair, t_peruntukan, t_totalbiaya, t_npa) FROM stdin;
\.


--
-- Data for Name: t_detailgedung; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailgedung (t_idgedung, t_idtransaksi, t_tarifdasar, t_jenis, t_jumlah, t_total) FROM stdin;
\.


--
-- Data for Name: t_detailho; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailho (t_idretho, t_idtransaksi, t_panjang, t_lebar, t_luas, t_indeksluas, t_kwslokasi, t_gangguan, t_skala, t_tarifdasar, t_jmlhpajak) FROM stdin;
\.


--
-- Data for Name: t_detailimb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailimb (t_idretimb, t_idtransaksi, t_jmlhbangunan, t_panjang, t_lebar, t_luas, t_imbluas, t_imblantai, t_imbgunabgn, t_imblokasi, t_imbkondisi, t_tarifdasar, t_jmlhpajak, t_peruntukan) FROM stdin;
\.


--
-- Data for Name: t_detailkebersihan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailkebersihan (t_idkebersihan, t_idtransaksi, t_idklasifikasi, t_idtarif, t_tarifdasar, t_jmlhbln, t_potongan) FROM stdin;
\.


--
-- Data for Name: t_detailkekayaan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailkekayaan (t_idkekayaan, t_idtransaksi, t_tarifdasar, t_jenislayanan, t_jeniskekayaan, t_jumlah, t_lamawaktu, t_keterangan, t_jumlahitem) FROM stdin;
\.


--
-- Data for Name: t_detailkir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailkir (t_iddetailkir, t_idtransaksi, t_idtarif, t_hargadasar, t_jumlah) FROM stdin;
\.


--
-- Data for Name: t_detailminerba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailminerba (t_idminerba, t_idtransaksi, t_idkorek, t_volume, t_hargapasaran, t_jumlah, t_tarifpersen, t_pajak, t_idjenis) FROM stdin;
5	5	108	4038.51	25000	100962750	20	20192550	1
6	9	108	1.8	35000	63000	20	12600	4
7	9	108	1.51	25000	37750	20	7550	1
8	36	108	27.47	25000	686750	20	137350	1
9	36	108	20.4	35000	714000	20	142800	4
10	39	108	4038.51	25000	100962750	20	20192550	1
11	46	108	0.93	25000	23250	20	4650	1
12	46	108	0.62	35000	21700	20	4340	4
13	51	108	3208.8	25000	80220000	20	16044000	1
14	53	108	1551.76	25000	38794000	20	7758800	1
15	71	108	19.33	25000	483250	20	96650	1
16	72	108	9.06	35000	317100	20	63420	4
17	79	108	5475.5	25000	136887500	20	27377500	1
18	80	108	11.34	25000	170100	20	34020	1
19	81	108	8.84	25000	221000	20	44200	1
20	82	108	13.64	35000	477400	20	95480	4
21	83	108	1.4	25000	35000	20	7000	1
22	85	108	1.85	35000	64750	20	12950	4
23	89	108	36.64	15000	549600	20	109920	2
24	90	108	15.1	25000	377500	20	75500	1
25	91	108	6.94	35000	242900	20	48580	4
26	93	108	17.48	15000	262200	20	52440	2
27	94	108	20.96	25000	524000	20	104800	1
28	95	97	11.68	50000	584000	20	116800	10
29	96	108	14.51	25000	362750	20	72550	1
30	97	108	6.77	35000	236950	20	47390	4
31	100	108	7.66	15000	114900	20	22980	2
32	100	108	9.15	25000	228750	20	45750	1
33	100	108	2.92	35000	102200	20	20440	4
34	101	108	4017.05	25000	100426250	20	20085250	1
35	103	108	0.4	25000	10000	20	2000	1
36	103	108	0.04	35000	1400	20	280	4
37	105	108	17.43	25000	435750	20	87150	1
38	105	108	21.47	35000	751450	20	150290	4
39	106	108	5192	25000	129800000	20	25960000	1
40	116	108	69.71	25000	1742750	20	348550	1
41	118	108	23.11	35000	808850	20	161770	4
42	119	882	69.75	15000	1046250	20	209250	7
43	120	108	103.31	15000	1549650	20	309930	2
44	121	108	11.81	25000	295250	20	59050	1
45	122	108	10.37	35000	362950	20	72590	4
46	130	108	1.15	15000	17250	20	3450	2
47	130	108	7.07	25000	176750	20	35350	1
48	130	108	9.33	35000	326550	20	65310	4
49	161	108	0.2	15000	3000	20	600	2
50	162	108	0.31	25000	7750	20	1550	1
51	164	108	0.47	35000	16450	20	3290	4
52	186	108	3.8	25000	95000	20	19000	1
53	187	108	4.63	35000	162050	20	32410	4
54	188	882	14.4	25000	360000	20	72000	5
55	214	108	5.21	25000	130250	20	26050	1
56	215	108	3.77	35000	131950	20	26390	4
57	216	108	29.67	15000	445050	20	89010	2
58	217	108	11.48	25000	287000	20	57400	1
59	218	108	3.76	35000	131600	20	26320	4
60	219	108	0.9	25000	22500	20	4500	1
61	220	97	0.66	50000	33000	20	6600	10
62	222	108	6.94	25000	173500	20	34700	1
63	223	97	3.84	50000	192000	20	38400	10
64	224	108	14.51	25000	362750	20	72550	1
65	225	108	6.77	35000	236950	20	47390	4
66	235	108	4010.25	25000	100256250	20	20051250	1
67	236	108	4245.8	25000	106145000	20	21229000	1
68	270	108	4034.69	25000	100867250	20	20173450	1
69	271	108	50.71	15000	760650	20	152130	2
70	272	108	10.39	25000	259750	20	51950	1
71	273	108	11.63	35000	407050	20	81410	4
72	274	108	12.31	25000	307750	20	61550	1
73	275	97	10.57	50000	528500	20	105700	10
74	276	882	28.14	15000	422100	20	84420	7
75	279	108	12.31	25000	307750	20	61550	1
76	280	97	10.57	50000	528500	20	105700	10
77	281	882	28.14	15000	422100	20	84420	7
78	298	108	103.23	25000	2580750	20	516150	1
79	299	97	129.38	50000	6469000	20	1293800	10
80	301	108	8.45	25000	211250	20	42250	1
81	302	108	3.41	35000	119350	20	23870	4
82	303	882	6.15	15000	92250	20	18450	7
83	304	108	9.93	25000	248250	20	49650	1
84	305	108	2.98	35000	104300	20	20860	4
85	306	882	9.96	15000	149400	20	29880	7
86	307	108	17.9	25000	447500	20	89500	1
87	308	108	11.74	35000	410900	20	82180	4
88	309	882	76.34	15000	1145100	20	229020	7
89	310	108	57.6	15000	864000	20	172800	2
90	311	108	11.92	25000	298000	20	59600	1
91	312	108	9.43	35000	330050	20	66010	4
92	313	108	5.84	25000	146000	20	29200	1
93	314	108	2.52	35000	88200	20	17640	4
94	315	108	3.33	25000	83250	20	16650	1
95	316	108	0.38	15000	5700	20	1140	2
96	317	108	2.82	35000	98700	20	19740	4
105	323	108	10.07	25000	251750	20	50350	1
106	323	108	4.14	35000	144900	20	28980	4
\.


--
-- Data for Name: t_detailpanggungreklame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailpanggungreklame (t_idrpangrek, t_idtransaksi, t_panjang, t_lebar, t_luas, t_tarifdasar, t_jmlhbln, t_potongan) FROM stdin;
\.


--
-- Data for Name: t_detailparkir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailparkir (t_idparkir, t_idtransaksi, t_idkorek, t_jmlh_kendaraan, t_hargadasar, t_jumlah, t_tarifpersen, t_pajak) FROM stdin;
\.


--
-- Data for Name: t_detailparkirtepi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailparkirtepi (t_iddetailret, t_idtransaksi, t_idtarif, t_volume, t_hargadasar, t_jumlah, t_uraianretribusi) FROM stdin;
\.


--
-- Data for Name: t_detailpasar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailpasar (t_idpasar, t_idtransaksi, t_idklasifikasi, t_jenisbangunan, t_panjang, t_lebar, t_luas, t_tarifdasar, t_jmlhbln, t_potongan, t_keteranganpasar, t_nokios) FROM stdin;
\.


--
-- Data for Name: t_detailpasargrosir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailpasargrosir (t_idpasargrosir, t_idtransaksi, t_idklasifikasi, t_jenisbangunan, t_panjang, t_lebar, t_luas, t_tarifdasar, t_jmlhbln, t_potongan) FROM stdin;
\.


--
-- Data for Name: t_detailpemadam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailpemadam (t_idretpemadam, t_idtransaksi, t_idtarif, t_jmltitikbuah, t_tarifdasar, t_satuan, t_jumlah) FROM stdin;
\.


--
-- Data for Name: t_detailperikanan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailperikanan (t_idperikanan, t_idtransaksi, t_jeniskapal, t_jenisbudidaya, t_jmlhgt, t_hargadasar, t_jumlah) FROM stdin;
\.


--
-- Data for Name: t_detailppj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailppj (t_iddetailppj, t_idtransaksi, t_klasifikasi, t_hargasatuanlistrik, t_jumlahbagihasil, t_jumlahtagihan, t_biayapemakaian, t_jumlahkwh, t_jumlahkvautama, t_jumlahkvacadangan, t_jumlahkvadarurat, t_jamnyalautama, t_jamnyalacadangan, t_jamnyaladarurat, t_faktordaya, t_tarif) FROM stdin;
\.


--
-- Data for Name: t_detailreklame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailreklame (t_iddetailreklame, t_idtransaksi, t_jenisreklame, t_naskah, t_lokasi, t_panjang, t_lebar, t_jumlah, t_jangkawaktu, t_tipewaktu, t_jenisreklameusaha, t_sudutpandang, t_nsr, t_tarifreklame, t_kelasjalan, t_ukuranmedia, t_satuanukuranmedia, t_idlokasi, t_parameter, t_kompensasi, t_jmlhpajakasli, t_tinggi, t_suratrekomendasi, t_namafilerekomendasi) FROM stdin;
2	7	3	qwe	qwe	3.00	2.00	1	1	1	2	1	30000	\N	1	\N	\N	\N	((( 3 m x 2 m)  Rp. 30.000 ) x 1 sisi x 1 Tahun ) x 1 Buah	\N	180000	0	\N	\N
3	8	3	CV. Tikum Dua Tiga	Di Depan Kantor Perusahaan	1.50	1.00	1	1	1	2	1	25000	\N	4	\N	\N	\N	((( 1.5 m x 1 m)  Rp. 25.000 ) x 1 sisi x 1 Tahun ) x 1 Buah	\N	37500	0	\N	\N
4	28	3	Pangkalan Gas Agung	JL. Desa Sigi RT. 004, Desa Sigi, Kec. Kahayan Tengah	0.60	0.40	1	2	1	2	1	25000	\N	4	\N	\N	\N	((( 0.6 m x 0.4 m)  Rp. 25.000 ) x 1 sisi x 2 Tahun ) x 1 Buah	\N	25000	0	\N	\N
5	32	3	Bintang Awai	JL. A. Yani RT. 002 RW. 001, Desa Sebangau Permai, Kec. Sebangau Kuala	0.60	0.40	1	1	1	2	1	25000	\N	4	\N	\N	\N	((( 0.6 m x 0.4 m)  Rp. 25.000 ) x 1 sisi x 1 Tahun ) x 1 Buah	\N	25000	0	\N	\N
6	40	3	Toko Obat rafela	Jl. Lintas Palangka Raya - Kuala Kurun RT.002 Desa Tuwung Kec. Kahayan Tengah	0.60	0.40	1	1	1	2	1	30000	\N	4	\N	\N	\N	((( 0.6 m x 0.4 m)  Rp. 30.000 ) x 1 sisi x 1 Tahun ) x 1 Buah	\N	30000	0	\N	\N
8	41	3	Apotek Aina	JL. Lintas Kalimantan RT. 009, Desa Maliku Baru, Kec. Maliku	0.60	0.40	1	1	1	2	1	25000	\N	4	\N	\N	\N	((( 0.6 m x 0.4 m)  Rp. 25.000 ) x 1 sisi x 1 Tahun ) x 1 Buah	\N	25000	0	\N	\N
9	42	3	Toko Obat Rafela	Jl. Lintas Palangkaraya	0.60	0.40	1	1	1	2	1	25000	\N	4	\N	\N	\N	((( 0.6 m x 0.4 m)  Rp. 25.000 ) x 0 sisi x 1 Tahun ) x 1 Buah	\N	25000	0	\N	\N
10	67	1	Alfamart	JL. LIntas Kalimantan RT. 6	0.00	0.00	1	1	1	2	0	70000	\N	1	\N	\N	\N	(( 6 m x Rp. 70.000 ) x 1 Tahun ) x 1 Buah	\N	420000	6	\N	\N
11	67	4	Alfamart	JL. LIntas Kalimantan RT. 6	2.44	1.50	1	1	1	2	2	34000	\N	1	\N	\N	\N	((( 2.44 m x 1.5 m)  Rp. 34.000 ) x 2 sisi x 1 Tahun ) x 1 Buah	\N	248880	0	\N	\N
12	67	4	Alfamart	JL. LIntas Kalimantan RT. 6	2.00	0.80	1	1	1	2	1	34000	\N	1	\N	\N	\N	((( 2 m x 0.8 m)  Rp. 34.000 ) x 1 sisi x 1 Tahun ) x 1 Buah	\N	54400	0	\N	\N
13	68	3	Pangkalan Gas Lpg Tintin	Jl. Lintas Palangkaraya - Kuala kurun Desa Kasali Baru ,Kec. Banama Tingang	0.60	0.40	1	1	1	2	1	25000	\N	4	\N	\N	\N	((( 0.6 m x 0.4 m)  Rp. 25.000 ) x 1 sisi x 1 Tahun ) x 1 Buah	\N	25000	0	\N	\N
14	69	1	Alfamart	JL. Lintas Kalimantan RT. 014	0.00	0.00	1	1	1	2	0	70000	\N	1	\N	\N	\N	(( 6 m x Rp. 70.000 ) x 1 Tahun ) x 1 Buah	\N	420000	6	\N	\N
15	69	4	Alfamart	JL. Lintas Kalimantan RT. 014	3.50	2.25	1	1	1	2	2	34000	\N	1	\N	\N	\N	((( 3.5 m x 2.25 m)  Rp. 34.000 ) x 2 sisi x 1 Tahun ) x 1 Buah	\N	535500	0	\N	\N
16	69	4	Alfamart	JL. Lintas Kalimantan RT. 014	2.00	0.80	1	1	1	2	1	34000	\N	1	\N	\N	\N	((( 2 m x 0.8 m)  Rp. 34.000 ) x 1 sisi x 1 Tahun ) x 1 Buah	\N	54400	0	\N	\N
17	107	3	Papan Nama Usaha (Pangkalan Gas Empat Bersaudara)	Jl. Lintas Palangkaraya - Kuala kurun RT.005 Desa Bawan Kec. Banama Tingang Kab. Pulang Pisau	0.60	0.40	1	1	1	2	1	25000	\N	4	\N	\N	\N	((( 0.6 m x 0.4 m)  Rp. 25.000 ) x 1 sisi x 1 Tahun ) x 1 Buah	\N	25000	0	\N	\N
18	108	9	Brand Rokok Magnum	Simpang Buntoi dan JL. Cilik Riwut Lintas Kalimantan	1.00	3.00	10	14	3	2	1	2000	\N	5	\N	\N	\N	((( 1 m x 3 m)  Rp. 2.000 ) x 1 sisi x 14 Hari ) x 10 Buah	\N	840000	0	public/upload/rekomendasireklame/108	PENGAJUAN VB MAGNUM PULPIS.xlsx
19	113	3	Papan Nama usaha ( RM CANDI LARAS )	Jl. Lintas Kalimantan RT.014 Desa Anjir Pulang Pisau Kec. Kahayan Hilir	0.60	0.40	1	1	1	2	1	30000	\N	1	\N	\N	\N	((( 0.6 m x 0.4 m)  Rp. 30.000 ) x 0 sisi x 1 Tahun ) x 1 Buah	\N	30000	0	\N	\N
20	114	3	Papan Nama Toko ( Toko Nisa )	Jl. Tingang Menteng RT.014 Kel. Pulang Pisau Kec. Kahayan hilir	0.60	0.40	1	1	1	2	1	30000	\N	1	\N	\N	\N	((( 0.6 m x 0.4 m)  Rp. 30.000 ) x 0 sisi x 1 Tahun ) x 1 Buah	\N	30000	0	\N	\N
21	115	3	Papan Nama Perusahaan ( CV SINAR ABADI PANGKOH TIGA )	Jl. Desa Kantan Muara RT.003 RW.001 Desa Kantan Muara Kec. Pandih batu	1.50	1.00	1	1	1	2	1	25000	\N	4	\N	\N	\N	((( 1.5 m x 1.0 m)  Rp. 25.000 ) x 1 sisi x 1 Tahun ) x 1 Buah	\N	37500	0	\N	\N
22	117	14	DJARUM	JL LINTAS KALIMANTAN KM. 10 RT. 14 DESA ANJIR PULANG PISAU	6.00	4.00	1	12	2	2	1	30000	\N	1	\N	\N	\N	((( 6 m x 4 m)  Rp. 30.000 ) x 1 sisi x 12 Bulan ) x 1 Buah	\N	8640000	0	\N	\N
23	211	3	Papan Nama Usaha ( Tempel ) Pangkalan LPG Salat Nusa	Jl.Desa Tumbang nusa RT.004 Desa Tumbang Nusa Kec. Jabiren Raya Kab. Pulang Pisua	0.60	0.40	1	1	1	2	1	25000	\N	4	\N	\N	\N	((( 0.6 m x 0.4 m)  Rp. 25.000 ) x 0 sisi x 1 Tahun ) x 1 Buah	\N	25000	0	\N	\N
24	212	3	Pangkalan LPG Mantike Indah ,Papan Nama Usaha( Tempel )	Jl. Lintas Kalimantan RT.006 Desa jabiren Kec. Jabiren Raya	0.60	0.40	1	1	1	2	1	25000	\N	4	\N	\N	\N	((( 0.6 m x 0.4 m)  Rp. 25.000 ) x 0 sisi x 1 Tahun ) x 1 Buah	\N	25000	0	\N	\N
25	300	8	Produk Rokok PT. HM SAMPOERNA Tbk	Kab. Pulang Pisau	1.00	2.00	10	7	3	2	1	2000	\N	5	\N	\N	\N	((( 1 m x 2 m)  Rp. 2.000 ) x 1 sisi x 7 Hari ) x 10 Buah	\N	280000	0	public/upload/rekomendasireklame/300	Rekomendasi.pdf
26	320	3	CV. AL-Hikmah	JL. Tingang Menteng RT. 009, Kel. Pulang Pisau, Kec. Kahayan Hilir	1.50	1.00	1	1	1	2	1	30000	\N	1	\N	\N	\N	((( 1.5 m x 1 m)  Rp. 30.000 ) x 1 sisi x 1 Tahun ) x 1 Buah	\N	45000	0	\N	\N
27	398	3	Papan Nama Usaha ( Tempel ) UD. Absa Aron mandiri	Jl. Lintas Palangkaraya - Bahaur RT.006 Desa Buntoi Kec. Kahayan Hilir	1.00	0.60	1	1	1	2	1	26000	\N	3	\N	\N	\N	((( 1 m x 0.6 m)  Rp. 26.000 ) x 0 sisi x 1 Tahun ) x 1 Buah	\N	26000	0	\N	\N
\.


--
-- Data for Name: t_detailretribusi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailretribusi (t_iddetailret, t_idtransaksi, t_volume, t_hargadasar, t_jumlah, t_uraianretribusi) FROM stdin;
\.


--
-- Data for Name: t_detailrumahdinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailrumahdinas (t_idrumahdinas, t_idtransaksi, t_panjang, t_lebar, t_luas, t_tarifdasar, t_jmlhbln, t_potongan) FROM stdin;
\.


--
-- Data for Name: t_detailtanahlain; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailtanahlain (t_idrpangrek, t_idtransaksi, t_panjang, t_lebar, t_luas, t_tarifdasar, t_jmlhbln, t_potongan) FROM stdin;
\.


--
-- Data for Name: t_detailtanahreklame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailtanahreklame (t_idrpangrek, t_idtransaksi, t_panjang, t_lebar, t_luas, t_tarifdasar, t_jmlhblnhari, t_lokasitanah, t_potongan) FROM stdin;
\.


--
-- Data for Name: t_detailtempatparkir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailtempatparkir (t_idtempatparkir, t_idtransaksi, t_jeniskendaraan, t_jumlah, t_tarifdasar, t_potongan) FROM stdin;
\.


--
-- Data for Name: t_detailtera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailtera (t_idtera, t_idtransaksi, t_idtarif, t_jarak, t_volume, t_transportasi, t_hargadasar, t_jumlah, t_lokasi) FROM stdin;
\.


--
-- Data for Name: t_detailterminal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailterminal (t_iddetailret, t_idtransaksi, t_idjenispelayanan, t_idtarif, t_volume, t_hargadasar, t_jumlah) FROM stdin;
\.


--
-- Data for Name: t_detailtrayek; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailtrayek (t_iddetailret, t_idtransaksi, t_idtarif, t_jmlhkendaraan, t_jmlhperjalanan, t_hargadasar, t_jumlah, t_satuan) FROM stdin;
\.


--
-- Data for Name: t_detailwalet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailwalet (t_iddetailwalet, t_idtransaksi, t_hargapasar, t_volume) FROM stdin;
\.


--
-- Data for Name: t_jenispelayanan_terminal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_jenispelayanan_terminal (t_idjenispelayanan, t_keterangan) FROM stdin;
\.


--
-- Data for Name: t_kantorskpd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_kantorskpd (t_idskpd, t_tglbysistem, t_namaskpd, t_jalanskpd, t_idkecskpd, t_kecamatanskpd, t_idkelskpd, t_kelurahanskpd, is_userpendaftaran, t_tutupskpd, is_tutupskpd) FROM stdin;
\.


--
-- Data for Name: t_keberatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_keberatan (t_idkeberatan, t_idwpobjek, t_idketetapan, t_jenisketetapan, t_jenispajak, t_nokeberatan, t_tglketetapankeberatan, t_alasankeberatan, t_jmlhketetapanseharusnya, t_inputkeberatan, t_tglverifikasi, t_statusverifikasi, t_pejabatverifikasi, t_nilaipengurangan, t_jmlhpengurangan, t_jmlhditetapkan, t_nomorsk, t_jangkawaktu, t_ukuranmedia, t_parameter, t_jumlah, t_jenisreklameusaha, t_debitair, t_lamawaktu, t_totalbiaya, t_kualitasair, t_peruntukan, t_volume, t_restitusi, t_statuskompensasi) FROM stdin;
\.


--
-- Data for Name: t_klasifikasi_kebersihan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_klasifikasi_kebersihan (t_idklasifikasi, t_keterangan) FROM stdin;
1	Rumah Tangga
2	Tempat Usaha / Pertokoan
3	Mall
\.


--
-- Data for Name: t_klasifikasi_pasar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_klasifikasi_pasar (t_idklasifikasi, t_keterangan) FROM stdin;
\.


--
-- Data for Name: t_klasifikasi_pasargrosir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_klasifikasi_pasargrosir (t_idklasifikasi, t_keterangan) FROM stdin;
\.


--
-- Data for Name: t_lampiranppj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_lampiranppj (t_idlampiranppj, t_idtransaksi, t_goltarifpln, t_batasdaya, t_jmlpelanggan, t_jmlkwhterjual, t_tarifperkwh, t_jmllistrikterjual, t_jmlbiayabeban, t_jmlnilaijuallistrik, t_tarif, t_jumlah, t_row) FROM stdin;
\.


--
-- Data for Name: t_setoranlain; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_setoranlain (t_idsetoranlain, t_idsatker, t_idrekening, t_tahunpajak, t_jumlahsetor, t_tglsetor, t_viasetor, t_kodebukti, t_issetorandeleted, t_nomorurut, t_keterangan) FROM stdin;
1	44	265	2022	500000	2022-06-01	2	3	0	1	Pajak Penginapan dan sejenisnya Bulan Juni
2	44	265	2022	400000	2022-05-01	2	3	0	2	Pajak Penginapan dan sejenisnya Bulan Mei
3	44	265	2022	200000	2022-04-01	2	3	0	3	Pajak Penginapan dan sejenisnya Bulan April
5	1	6	2022	1000000	2022-07-21	1	3	0	5	Hotel Luwansa
6	36	265	2022	200000	2022-02-02	1	3	0	6	Ub. Desember 2021
4	36	265	2022	200000	2022-03-01	2	3	0	4	Pajak Rumah Penginapan dan sejenisnya s/d Triwulan 1
\.


--
-- Data for Name: t_setorbankdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_setorbankdetail (t_idsbd, t_idsbh, t_idkoreksbd, t_jmlhsbd, t_issbddeleted, t_idtransaksi) FROM stdin;
3876	144	34	100000	0	5888
3877	145	85	7000	0	37
3878	145	265	1000	0	36
\.


--
-- Data for Name: t_setorbankheader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_setorbankheader (t_idsbh, t_tglsbh, t_nosbh, t_issbhdeleted) FROM stdin;
144	2022-07-15	123	0
145	2022-07-20	123	0
\.


--
-- Data for Name: t_skpdkb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_skpdkb (t_idskpdkb, t_idtransaksi, t_nopemeriksaan, t_noskpdkb, t_periodeskpdkb, t_tglskpdkb, t_tgljatuhtemposkpdkb, t_tarifpajak, t_dasarrevisi, t_selisihdasar, t_jmlhbln, t_tarifpersen, t_jmlhdendaskpdkb, t_jmlhpajakseharusnya, t_jmlhpajakskpdkb, t_kodebayarskpdkb, t_totalskpdkb, t_operatorskpdkb, t_tglbayarskpdkb, t_viabayarskpdkb, t_jmlhbayarskpdkb, t_operatorbayarskpdkb, t_jenispemeriksaan) FROM stdin;
5	5886	123	1	2022	2022-07-15	2022-08-14	10	21000000	21000000	24	2	1008000	2100000	2100000	820901052200001	3108000	2	\N	\N	\N	\N	2
\.


--
-- Data for Name: t_skpdkbt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_skpdkbt (t_idskpdkbt, t_idtransaksi, t_nopemeriksaan, t_noskpdkbt, t_periodeskpdkbt, t_tglskpdkbt, t_tgljatuhtemposkpdkbt, t_tarifpajak, t_dasarrevisi, t_selisihdasar, t_jmlhbln, t_tarifpersen, t_jmlhdendaskpdkbt, t_jmlhpajakseharusnya, t_jmlhpajakskpdkbt, t_kodebayarskpdkbt, t_totalskpdkbt, t_operatorskpdkbt, t_tglbayarskpdkbt, t_viabayarskpdkbt, t_jmlhbayarskpdkbt, t_operatorbayarskpdkbt, t_jenispemeriksaan) FROM stdin;
\.


--
-- Data for Name: t_skpdlb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_skpdlb (t_idskpdlb, t_idtransaksi, t_nopemeriksaan, t_noskpdlb, t_periodeskpdlb, t_tglskpdlb, t_tarifpajak, t_dasarrevisi, t_selisihdasar, t_jmlhpajakseharusnya, t_totalskpdlb, t_kodebayarskpdlb, t_operatorskpdlb, t_tglpengembalianskpdlb, t_jmlhpengembalianskpdlb, t_operatorpengembalianskpdlb, t_jenispemeriksaan) FROM stdin;
\.


--
-- Data for Name: t_skpdn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_skpdn (t_idskpdn, t_idtransaksi, t_nopemeriksaan, t_noskpdn, t_periodeskpdn, t_tglskpdn, t_tarifpajak, t_dasarrevisi, t_selisihdasar, t_jmlhpajakseharusnya, t_totalskpdn, t_operatorskpdn, t_jenispemeriksaan) FROM stdin;
\.


--
-- Data for Name: t_skpdt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_skpdt (t_idskpdt, t_idtransaksi, t_nopemeriksaan, t_noskpdt, t_periodeskpdt, t_tglskpdt, t_tgljatuhtemposkpdt, t_tarifpajak, t_dasarrevisi, t_selisihdasar, t_jmlhbln, t_tarifpersen, t_jmlhdendaskpdt, t_jmlhpajakseharusnya, t_tarifkenaikan, t_jmlhkenaikan, t_jmlhpajakskpdt, t_kodebayarskpdt, t_totalskpdt, t_operatorskpdt, t_tglbayarskpdt, t_viabayarskpdt, t_jmlhbayarskpdt, t_operatorbayarskpdt) FROM stdin;
\.


--
-- Data for Name: t_suratkesanggupan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_suratkesanggupan (t_idsurat, t_idwpobjek, t_noangsuran, t_tempatlahir, t_tgllahir, t_pekerjaan, t_jns_kelamin, t_jns_pemungutan, t_jns_izin, t_jmlhsetoran, t_start_setoran, t_operator, t_status_cetak) FROM stdin;
\.


--
-- Data for Name: t_teguranlaporpajak; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_teguranlaporpajak (t_idteguran, t_noteguran, t_idobjekteguran, t_tglteguran, t_operatorinputteguran, t_bulanpajak, t_tahunpajak) FROM stdin;
3	1	1	2022-07-20	2	01	2022
4	2	1	2022-08-01	5	05	2022
\.


--
-- Data for Name: t_transaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_transaksi (t_idtransaksi, t_idwpobjek, t_idkorek, t_jenispajak, t_nourut, t_periodepajak, t_tglpendataan, t_masaawal, t_masaakhir, t_dasarpengenaan, t_nilaiperolehan, t_tarifpajak, t_tarifdasarkorek, t_jmlhpajak, t_namakegiatan, t_noskpdjab, t_tarifkenaikan, t_jmlhkenaikan, t_operatorpendataan, is_deluserpendataan, t_tglpenetapan, t_nopenetapan, t_operatorpenetapan, is_deluserpenetapan, t_tgljatuhtempo, t_kodebayar, t_viapembayaran, t_jmlhpembayaran, t_nopembayaran, t_tglpembayaran, t_operatorpembayaran, is_deluserpembayaran, t_nostpd, t_idkorekdenda, t_jmlhdendapembayaran, t_jmlhbulandendapembayaran, t_tgldendapembayaran, t_operatordendapembayaran, is_deluserdendapembayaran, t_viapembayarandenda, t_jmlhbayardenda, t_tglbayardenda, t_operatorbayardenda, is_deluserbayardenda, t_alasanpembatalanskpd, t_tglpembatalanskpd, t_nopembatalanskpd, is_esptpd, t_tglentry_system, t_file_berkas, t_jenissarang, t_umurbangunan, t_keterangankatering, t_opdkatering, t_kompensasi, t_jmlhpajakasli, t_lamawaktu, t_id_bank, "keRekening", "dariRekening", t_reffnum) FROM stdin;
3	180	34	2	2	2022	2022-08-02	2022-06-01	2022-07-31	5625000	\N	10	\N	562500	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200002	2	562500	103	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-16 10:51:09.855138	\N	\N	\N	Belanja Makan Minum Rapat NO. STS 02117	DISHUB	\N	\N	\N	\N	\N	\N	\N
4	216	34	2	3	2022	2022-08-02	2022-07-01	2022-07-31	1463000	\N	10	\N	146300	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200003	2	146300	104	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-16 10:53:09.904947	\N	\N	\N	Belanja Makan Minum Tamu NO. STS 02117	DISHUB	\N	\N	\N	\N	\N	\N	\N
8	350	59	4	5	2022	2022-08-01	2022-08-01	2023-07-31	0	\N	\N	\N	37500	\N	\N	0	0	3	0	2022-08-01	1	3	\N	2022-08-31	621104022200005	2	37500	105	2022-08-01	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-16 11:51:38.008065	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
10	59	30	2	6	2022	2022-08-16	2022-07-01	2022-07-31	400000	\N	10	\N	40000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200006	2	40000	106	2022-08-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-18 10:25:23.604866	\N	\N	\N	Wm. Gajah mungkur Pajak ub. juli 	-	\N	\N	\N	\N	\N	\N	\N
12	60	30	2	8	2022	2022-08-16	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200008	2	50000	108	2022-08-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-18 10:40:05.619519	\N	\N	\N	Wm. Mama Mila/Amang Anang ub juli	-	\N	\N	\N	\N	\N	\N	\N
13	60	30	2	9	2022	2022-08-16	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200009	2	50000	109	2022-08-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-18 10:40:13.005738	\N	\N	\N	Wm. Mama Mila/Amang Anang ub juli	-	\N	\N	\N	\N	\N	\N	\N
14	60	30	2	10	2022	2022-08-16	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200010	2	50000	110	2022-09-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-18 10:40:16.230665	\N	\N	\N	Wm. Mama Mila/Amang Anang ub juli	-	\N	\N	\N	\N	\N	\N	\N
15	58	30	2	11	2022	2022-08-16	2022-07-01	2022-07-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200011	2	100000	111	2022-09-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-18 10:42:16.796466	\N	\N	\N	Wm. Bakso urat ub. juli	-	\N	\N	\N	\N	\N	\N	\N
16	45	30	2	12	2022	2022-08-16	2022-07-01	2022-07-31	250000	\N	10	\N	25000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200012	2	25000	112	2022-08-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-18 10:45:21.676087	\N	\N	\N	Wm. Pecal ub Juli	-	\N	\N	\N	\N	\N	\N	\N
17	46	30	2	13	2022	2022-08-16	2022-07-01	2022-07-31	750000	\N	10	\N	75000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200013	2	75000	113	2022-08-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-18 10:54:48.655112	\N	\N	\N	Wm. punjer Roso ub juli	-	\N	\N	\N	\N	\N	\N	\N
18	352	30	2	14	2022	2022-08-16	2022-07-01	2022-07-31	750000	\N	10	\N	75000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200014	2	75000	114	2022-08-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-18 11:03:09.540175	\N	\N	\N	Wm. Mama Mutia	-	\N	\N	\N	\N	\N	\N	\N
19	52	30	2	15	2022	2022-08-16	2022-07-01	2022-07-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200015	2	100000	115	2022-08-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-18 11:05:50.546629	\N	\N	\N	Wm. Depot mie kenzie	-	\N	\N	\N	\N	\N	\N	\N
21	29	30	2	17	2022	2022-08-23	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-09-30	621102012200017	2	50000	117	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-23 12:19:51.618852	\N	\N	\N	Ub.Juli WM.HAswarga	-	\N	\N	\N	\N	\N	\N	\N
22	6	30	2	18	2022	2022-08-23	2022-07-01	2022-07-31	1000000	\N	10	\N	100000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200018	2	100000	118	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-23 12:22:01.703442	\N	\N	\N	Ub.Juli WM.Bakso Mentari	-	\N	\N	\N	\N	\N	\N	\N
24	194	34	2	20	2022	2022-08-01	1970-01-01	2022-07-31	2560000	\N	10	\N	256000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200020	2	256000	119	2022-08-01	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-23 15:29:01.690399	\N	\N	\N	Belanja Fasilitas Kunjungan Tamu no STS 2116	Dinas Perkimtan	\N	\N	\N	\N	\N	\N	\N
25	14	30	2	21	2022	2022-08-02	2022-06-01	2022-06-30	300000	\N	10	\N	30000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-07-30	621102012200021	2	30000	120	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-23 15:40:52.087111	\N	\N	\N	Ub.Juni WM. Samawa	-	\N	\N	\N	\N	\N	\N	\N
26	38	30	2	22	2022	2022-08-23	2022-07-01	2022-07-31	200000	\N	10	\N	20000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200022	2	20000	121	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-23 15:50:32.799646	\N	\N	\N	Ub.Juli WM.Cak Li	-	\N	\N	\N	\N	\N	\N	\N
27	204	34	2	23	2022	2022-08-24	2022-07-01	2022-07-01	1500000	\N	10	\N	150000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200023	2	150000	122	2022-09-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:30:21.408469	\N	\N	\N	ub. juli Wm. Yeyen	-	\N	\N	\N	\N	\N	\N	\N
28	353	59	4	24	2022	2022-08-08	2022-07-12	2023-08-11	0	\N	\N	\N	25000	\N	\N	0	0	3	0	2022-08-08	2	3	\N	2022-09-07	621104022200024	2	25000	123	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:32:09.930664	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
29	178	34	2	25	2022	2022-08-24	2022-07-01	2022-07-01	2075000	\N	10	\N	207500	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200025	2	207500	124	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:33:16.241477	\N	\N	\N	Ub. Juli Catering Aulia	-	\N	\N	\N	\N	\N	\N	\N
31	36	30	2	27	2022	2022-08-02	2022-06-01	2022-06-30	600000	\N	10	\N	60000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-07-30	621102012200027	2	60000	126	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:36:59.466151	\N	\N	\N	Ub. Juni WM.Banjar I	-	\N	\N	\N	\N	\N	\N	\N
32	354	59	4	28	2022	2022-08-09	2022-03-22	2023-03-21	0	\N	\N	\N	25000	\N	\N	0	0	3	0	2022-08-09	3	3	\N	2022-09-08	621104022200028	2	25000	127	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:37:43.32558	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
33	186	34	2	29	2022	2022-08-24	2022-07-01	2022-07-01	3900000	\N	10	\N	390000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200029	2	390000	128	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:37:52.029137	\N	\N	\N	Ub. Juli Catering Nurul	-	\N	\N	\N	\N	\N	\N	\N
34	39	30	2	30	2022	2022-08-02	2022-06-01	2022-06-30	700000	\N	10	\N	70000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-07-30	621102012200030	2	70000	129	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:39:57.605561	\N	\N	\N	Ub.Juni WM.Ponorogo	-	\N	\N	\N	\N	\N	\N	\N
35	16	30	2	31	2022	2022-08-02	2022-06-01	2022-06-30	300000	\N	10	\N	0	\N	\N	0	0	17	0	\N	\N	0	\N	2022-07-30	621102012200031	2	0	130	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:41:50.795845	\N	\N	\N	Ub. Juni WM.Borneo	-	\N	\N	\N	\N	\N	\N	\N
36	343	85	6	32	2022	2022-08-09	2022-07-01	2022-07-31	1400750	\N	20	\N	280150	Penyediaan Fasilitas Pelayanan Kesehatan untuk UKM dan UKP Kewenangan Daerah Kabupaten/Kota	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621106012200032	2	280150	131	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:46:51.069447	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	355	34	2	34	2022	2022-08-24	2022-07-01	2022-07-01	2025000	\N	10	\N	202500	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200034	2	202500	133	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:56:34.888229	\N	\N	\N	Rapat Pada Kantor Kel. Bereng ub Juli Kegiatan Penyediaan logistik Kantor ( 02158)	Kantor Kec. Kahayan Hilir	\N	\N	\N	\N	\N	\N	\N
39	119	85	6	35	2022	2022-08-03	2022-07-01	2022-07-31	100962750	\N	20	\N	20192550	Penambangan Pasir 	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621106012200035	2	20192550	134	2022-08-03	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:57:20.876987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	357	59	4	37	2022	2022-08-02	2022-08-02	2023-08-01	0	\N	\N	\N	25000	\N	\N	0	0	3	0	2022-08-02	5	3	\N	2022-09-01	621104022200037	2	25000	135	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:21:19.302167	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
42	356	59	4	38	2022	2022-08-03	2022-08-24	2023-08-23	0	\N	\N	\N	25000	\N	\N	0	0	1	0	2022-08-03	6	1	\N	2022-09-02	621104022200038	2	25000	136	2022-08-03	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:30:12.405464	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
43	55	30	2	39	2022	2022-08-24	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200039	2	50000	137	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:33:44.630521	\N	\N	\N	Wm. Tamban Ub Juli	-	\N	\N	\N	\N	\N	\N	\N
45	47	30	2	41	2022	2022-08-24	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200041	2	50000	139	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:36:14.304473	\N	\N	\N	Wm. Rahmah Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
46	358	85	6	42	2022	2022-08-02	2022-07-01	2022-07-31	44950	\N	20	\N	8990	Penyediaan Fasilitas Pelayanan Kesehatan untuk UKM dan UKP Kewenangan Daerah Kabupaten/Kota	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621106012200042	2	8990	140	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:36:50.399223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	66	30	2	43	2022	2022-08-24	2022-07-01	2022-07-31	150000	\N	10	\N	15000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200043	2	15000	141	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:37:25.766841	\N	\N	\N	Wm. Mekar Arum Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
48	150	34	2	44	2022	2022-08-03	2022-07-01	2022-07-31	25500000	\N	10	\N	2550000	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200044	2	2550000	142	2022-08-03	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:41:05.833183	\N	\N	\N	Konsumsi Rapat	Kecamatan Maliku	\N	\N	\N	\N	\N	\N	\N
49	49	30	2	45	2022	2022-08-24	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200045	2	50000	143	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:42:10.885417	\N	\N	\N	Wm. Yeyen Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
50	44	30	2	46	2022	2022-08-24	2022-07-01	2022-07-31	750000	\N	10	\N	75000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200046	2	75000	144	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:43:36.807606	\N	\N	\N	Wm. Mama Nia Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
51	117	85	6	47	2022	2022-08-09	2022-07-01	2022-07-31	80220000	\N	20	\N	16044000	Penambangan Pasir	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621106012200047	2	16044000	145	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:45:02.919141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	119	85	6	49	2022	2022-08-05	2022-07-01	2022-07-31	38794000	\N	20	\N	7758800	Pasir dan Kerikil ( Hery )	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200049	2	7758800	147	2022-08-05	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:51:46.130481	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	264	23	2	50	2022	2022-08-05	2022-07-01	2022-07-31	14090000	\N	10	\N	1409000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621102012200050	2	1409000	148	2022-08-05	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:52:03.474531	\N	\N	\N	Ub. Juli Rocket Chicken	-	\N	\N	\N	\N	\N	\N	\N
55	73	30	2	51	2022	2022-08-05	2022-07-01	2022-07-31	200000	\N	10	\N	20000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621102012200051	2	20000	149	2022-08-05	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:54:17.400811	\N	\N	\N	Wm. Usun H Ayus ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
56	168	34	2	52	2022	2022-08-05	2022-04-01	2022-06-01	5000000	\N	10	\N	500000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200052	2	500000	150	2022-08-05	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:01:43.536278	\N	\N	\N	Belanja Makan Minum Rapat Lokakarya Mini Tingkat puskesmas Sebangau Ub April,Mei,juni	Dinas Kesehatan	\N	\N	\N	\N	\N	\N	\N
59	168	34	2	55	2022	2022-08-08	2022-04-01	2022-06-01	6800000	\N	10	\N	680000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200055	2	680000	151	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:10:34.408548	\N	\N	\N	Belanja Makan Minum Rapat Lokakarya Mini Tingkat puskesmas Sebangau Ub April,Mei,juni	Dinas Kesehatan	\N	\N	\N	\N	\N	\N	\N
62	146	34	2	58	2022	2022-08-09	2022-08-01	2022-08-31	8000000	\N	10	\N	800000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200058	2	800000	155	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:19:57.516333	\N	\N	\N	Belanja Makanan dan Minuman Rapat Kantor Kec, Jabiren Raya Ub. Mei - Juli	Kantor Kec. Jabiren Raya	\N	\N	\N	\N	\N	\N	\N
61	146	34	2	57	2022	2022-08-09	2022-08-01	2022-08-31	7000000	\N	10	\N	700000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200057	2	700000	154	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:18:21.342561	\N	\N	\N	Belanja Makanan dan Minuman Rapat Kantor Kec, Jabiren Raya Ub. juni - Juli	Kantor Kec. Jabiren Raya	\N	\N	\N	\N	\N	\N	\N
63	251	34	2	59	2022	2022-08-08	2022-07-01	2022-07-31	4920000	\N	10	\N	492000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200059	2	492000	156	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:23:02.052076	\N	\N	\N	Penyediaan Makan dan Minum Pegawai Untuk Keperluan Disperkimtan Ub. Juli	Disperkimtan	\N	\N	\N	\N	\N	\N	\N
64	221	34	2	60	2022	2022-08-09	2022-08-01	2022-08-31	2365000	\N	10	\N	236500	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200060	2	236500	157	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:25:32.83935	\N	\N	\N	Belanja Makan minum Rapat Bulan Agustus	Bappedalitbang	\N	\N	\N	\N	\N	\N	\N
66	46	34	2	62	2022	2022-08-09	2022-08-01	2022-08-31	385000	\N	10	\N	38500	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200062	2	38500	158	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:44:09.81782	\N	\N	\N	Pembayaran Makan Minum ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
67	271	59	4	63	2022	2022-08-10	2022-09-03	2023-09-02	0	\N	\N	\N	723280	\N	\N	0	0	3	0	2022-08-24	7	3	\N	2022-09-23	621104022200063	2	723280	159	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:53:24.505525	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
57	170	34	2	53	2022	2022-08-08	2022-04-01	2022-06-01	9580000	\N	10	\N	958000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200053	2	958000	160	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:06:14.37157	\N	\N	\N	Rapat Belanja Makan minum Lokakarya Mini Sektor Ke Puskesmas Tahai Bln April,Mei,Juni	Dinas Kesehatan	\N	\N	\N	\N	\N	\N	\N
58	168	34	2	54	2022	2022-08-08	2022-04-01	2022-06-01	8600000	\N	10	\N	860000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200054	2	860000	161	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:08:52.579883	\N	\N	\N	Belanja Makan Minum Rapat Lokakarya Mini Tingkat puskesmas Sebangau Ub April,Mei,juni	Dinas Kesehatan	\N	\N	\N	\N	\N	\N	\N
65	363	34	2	61	2022	2022-08-09	2022-08-01	2022-08-31	350000	\N	10	\N	35000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200061	2	35000	162	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:34:02.871134	\N	\N	\N	Pembayaran Makan Minum ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
68	364	59	4	64	2022	2022-08-08	2022-08-23	2023-08-22	0	\N	\N	\N	25000	\N	\N	0	0	1	0	2022-08-08	8	1	\N	2022-09-07	621104022200064	2	25000	163	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:55:02.162475	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
69	271	59	4	65	2022	2022-08-10	2022-09-03	2023-09-02	0	\N	\N	\N	1009900	\N	\N	0	0	3	0	2022-08-10	9	3	\N	2022-09-09	621104022200065	2	1009900	164	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:55:29.775054	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
71	366	85	6	67	2022	2022-08-08	2022-08-01	2022-07-31	483250	\N	20	\N	96650	CV. VILIA ALAM SEJAHTERA	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200067	2	96650	167	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 12:15:08.33184	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	365	34	2	66	2022	2022-08-08	2022-08-01	2022-08-31	2500000	\N	10	\N	250000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200066	2	250000	166	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 12:02:26.625097	\N	\N	\N	Biaya Snack pelepasan , Snack vip dan Snack Untuk Perjalanan dalam Rangka Mengikuti MTQ Tingkat Provinsi di Palangkaraya	-	\N	\N	\N	\N	\N	\N	\N
72	366	85	6	68	2022	2022-08-08	2022-08-01	2022-08-31	317100	\N	20	\N	63420	CV. VILIA ALAM SEJAHTERA	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200068	2	63420	168	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 12:16:21.441986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	121	85	6	75	2022	2022-08-12	2022-07-01	2022-07-31	136887500	\N	20	\N	27377500	Pasir dan Kerikil ( Erlinawati Tarung )	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200075	2	27377500	173	2022-08-12	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 08:47:13.144173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
80	341	85	6	76	2022	2022-08-10	2022-07-01	2022-07-31	170100	\N	20	\N	34020	CV TERAS SELARAS ABADI	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200076	2	34020	174	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 08:48:52.264886	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
81	341	85	6	77	2022	2022-08-10	2022-07-01	2022-07-31	221000	\N	20	\N	44200	CV TERAS SELARAS ABADI	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200077	2	44200	175	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 08:50:09.318435	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	341	85	6	78	2022	2022-08-10	2022-07-01	2022-07-31	477400	\N	20	\N	95480	CV TERAS SELARAS ABADI	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200078	2	95480	176	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 08:51:18.953297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	29	30	2	72	2022	2022-08-08	2022-06-01	2022-06-30	500000	\N	10	\N	50000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-07-30	621102012200072	2	50000	170	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 14:06:48.307176	\N	\N	\N	Wm. Haswarga ub juni	-	\N	\N	\N	\N	\N	\N	\N
77	67	30	2	73	2022	2022-08-08	2022-06-01	2022-06-30	500000	\N	10	\N	50000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-07-30	621102012200073	2	50000	171	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 14:08:27.291648	\N	\N	\N	Wm. Mie Agung 99 Ub. juni	-	\N	\N	\N	\N	\N	\N	\N
83	341	85	6	79	2022	2022-08-10	2022-07-01	2022-07-31	35000	\N	20	\N	7000	CV TERAS SELARAS ABADI	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200079	2	7000	177	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 08:52:25.644171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	236	34	2	80	2022	2022-08-12	2022-06-01	2022-06-30	7506000	\N	10	\N	750600	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200080	2	750600	178	2022-08-12	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 08:53:07.835734	\N	\N	\N	Pembayaran makanan dan minuman No. STS. 2273	Disperindagkop	\N	\N	\N	\N	\N	\N	\N
85	341	85	6	81	2022	2022-08-10	2022-07-01	2022-07-31	64750	\N	20	\N	12950	CV TERAS SELARAS ABADI	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200081	2	12950	179	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 08:53:10.447831	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
87	236	34	2	83	2022	2022-08-12	2022-05-01	2022-05-31	3436000	\N	10	\N	343600	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200083	2	343600	181	2022-08-12	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:00:46.327009	\N	\N	\N	Pembayaran makanan dan minuman No. STS. 2273	Disperindagkop	\N	\N	\N	\N	\N	\N	\N
88	236	34	2	84	2022	2022-08-12	2022-07-01	2022-07-31	7022000	\N	10	\N	702200	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200084	2	702200	182	2022-08-12	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:01:38.708821	\N	\N	\N	Pembayaran makanan dan minuman No. STS. 2273	Disperindagkop	\N	\N	\N	\N	\N	\N	\N
89	367	85	6	85	2022	2022-08-10	2022-07-01	2022-07-31	549600	\N	20	\N	109920	CV. WIDIA MULIA	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200085	2	109920	183	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:01:54.228491	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
90	367	85	6	86	2022	2022-08-10	2022-07-01	2022-07-31	377500	\N	20	\N	75500	CV. WIDIA MULIA	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200086	2	75500	184	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:02:43.673459	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
91	367	85	6	87	2022	2022-08-10	2022-07-01	2022-07-31	242900	\N	20	\N	48580	CV. WIDIA MULIA	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200087	2	48580	185	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:03:30.263432	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	225	34	2	88	2022	2022-08-12	2022-07-01	2022-07-31	2486000	\N	10	\N	248600	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200088	2	248600	186	2022-08-12	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:04:46.16546	\N	\N	\N	Pembayaran biaya makanan dan minuman tamu	RSUD	\N	\N	\N	\N	\N	\N	\N
93	368	85	6	89	2022	2022-08-10	2022-07-01	2022-07-31	262200	\N	20	\N	52440	CV. DANAYES AMIN	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200089	2	52440	187	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:11:10.434037	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
94	368	85	6	90	2022	2022-08-10	2022-07-01	2022-07-31	524000	\N	20	\N	104800	CV. DANAYES AMIN	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200090	2	104800	188	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:11:52.604404	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
95	368	85	6	91	2022	2022-08-10	2022-07-01	2022-07-31	584000	\N	20	\N	116800	CV. DANAYES AMIN	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200091	2	116800	189	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:14:36.339043	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
96	342	85	6	92	2022	2022-08-11	2022-07-01	2022-07-31	362750	\N	20	\N	72550	CV. RAJAKI PUTRA KAHAYAN	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200092	2	72550	190	2022-08-11	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:15:51.197978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
98	225	34	2	94	2022	2022-08-11	2022-07-01	2022-07-31	4400000	\N	10	\N	440000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200094	2	440000	193	2022-08-11	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:19:47.066935	\N	\N	\N	Belanja Makan Minum Kegiatan Rapat Penyerapqan Anggaran Per 31 Juli 	Bappedalitbang	\N	\N	\N	\N	\N	\N	\N
99	225	34	2	95	2022	2022-08-11	2022-07-01	2022-07-31	1650000	\N	10	\N	165000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200095	2	165000	194	2022-08-11	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:22:08.269184	\N	\N	\N	Belanja Makan dan Snack Kegiatan Koordinasi Pembinaan dan Pemanfaatan data dan informasi perencanaan Pembangunan SKPD	Bappedalitbang	\N	\N	\N	\N	\N	\N	\N
100	369	85	6	96	2022	2022-08-12	2022-07-01	2022-07-31	445150	\N	20	\N	89030	Pengelolaan Pendidikan Sekolah Dasar	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621106012200096	2	89030	195	2022-08-12	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:22:37.541638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101	119	85	6	97	2022	2022-08-11	2022-07-01	2022-07-31	100426250	\N	20	\N	20085250	Pasir dan Kerikil ( Hery )	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200097	2	20085250	196	2022-08-11	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:23:39.942111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102	225	34	2	98	2022	2022-08-10	2022-07-01	2022-07-31	1050000	\N	10	\N	105000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200098	2	105000	197	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:25:34.689425	\N	\N	\N	Belanja Makanan dan Minuman Rapat 	Dinas pertanian	\N	\N	\N	\N	\N	\N	\N
103	344	85	6	99	2022	2022-08-12	2022-07-01	2022-07-31	11400	\N	20	\N	2280	Penyediaan Fasilitas Pelayanan Kesehatan untuk UKM dan UKP Kewenangan Daerah Kabupaten/Kota	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621106012200099	2	2280	198	2022-08-12	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:27:49.297203	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
105	341	85	6	101	2022	2022-08-10	2022-07-01	2022-07-31	1187200	\N	20	\N	237440	Penyediaan Fasilitas Pelayanan KEsehatan untuk UKM dan UKP Kewenangan Daerah Kabupaten/Kota	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621106012200101	2	237440	200	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:36:00.39694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
106	125	85	6	102	2022	2022-08-12	2022-07-01	2022-07-31	129800000	\N	20	\N	25960000	Penambangan Pasir	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621106012200102	2	25960000	201	2022-08-12	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:37:19.033292	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
107	370	59	4	103	2022	2022-08-09	2022-08-12	2023-08-11	0	\N	\N	\N	25000	\N	\N	0	0	1	0	2022-08-09	10	1	\N	2022-09-08	621104022200103	2	25000	202	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:40:02.160155	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
108	289	61	4	104	2022	2022-08-15	2022-07-11	2022-07-24	0	\N	\N	\N	840000	\N	\N	0	0	3	0	2022-08-15	11	3	\N	2022-09-14	621104022200104	2	840000	203	2022-08-15	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:47:01.594452	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
109	49	34	2	105	2022	2022-08-15	2022-08-03	2022-08-03	8316000	\N	10	\N	831600	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200105	2	831600	204	2022-08-15	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:52:26.386467	\N	\N	\N	Pembayaran makanan dan minuman No. STS. 2288	BPPKAD	\N	\N	\N	\N	\N	\N	\N
110	49	34	2	106	2022	2022-08-15	2022-08-02	2022-08-02	5316000	\N	10	\N	531600	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200106	2	531600	205	2022-08-15	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:54:27.233273	\N	\N	\N	Pembayaran makanan dan minuman No. STS. 2288	BPPKAD	\N	\N	\N	\N	\N	\N	\N
111	49	34	2	107	2022	2022-08-15	2022-08-01	2022-08-01	4020000	\N	10	\N	402000	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200107	2	402000	206	2022-08-15	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:57:54.596232	\N	\N	\N	Pembayaran makanan dan minuman No. STS. 2288	BPPKAD	\N	\N	\N	\N	\N	\N	\N
112	49	34	2	108	2022	2022-08-15	2022-08-04	2022-08-04	2850000	\N	10	\N	285000	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200108	2	285000	207	2022-08-15	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:59:16.355066	\N	\N	\N	Pembayaran makanan dan minuman No. STS. 2288	BPPKAD	\N	\N	\N	\N	\N	\N	\N
113	371	59	4	109	2022	2022-08-09	2022-08-09	2023-08-08	0	\N	\N	\N	30000	\N	\N	0	0	1	0	2022-08-09	12	1	\N	2022-09-08	621104022200109	2	30000	208	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:59:41.619972	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
115	373	59	4	111	2022	2022-08-09	2022-08-08	2023-08-07	0	\N	\N	\N	37500	\N	\N	0	0	1	0	2022-08-09	14	1	\N	2022-09-08	621104022200111	2	37500	210	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:16:25.926638	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
116	375	85	6	112	2022	2022-08-10	2022-07-01	2022-07-31	1742750	\N	20	\N	348550	Penyelenggaraan bangunan Gedung di Wilayah daerah Kabupaten/kota pemberian Izin Mendrikian Bangunan ( IMB ) KODIM 1011 KUALA KAPUAS	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200112	2	348550	211	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:34:26.904218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
119	375	85	6	115	2022	2022-08-10	2022-07-01	2022-07-31	1046250	\N	20	\N	209250	Penyelenggaraan Bangunan Gedung di Wilayah Daerah Kabupaten/Kota pemberian Izin Mendirikan Bangunan ( IMB ) KODIM 1011 KUALA KAPUAS	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200115	2	209250	215	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:39:02.456945	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
117	374	61	4	113	2022	2022-08-25	2022-08-08	2023-08-07	0	\N	\N	\N	8640000	\N	\N	0	0	38	0	2022-08-25	15	38	\N	2022-09-24	621104022200113	2	8640000	213	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:36:24.572068	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
120	337	85	6	116	2022	2022-08-10	2022-07-01	2022-07-31	1549650	\N	20	\N	309930	Penyelenggaraan Penataan Bangunan dan lingkungan di Daerah kabupaten/kota	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200116	2	309930	216	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:42:33.438654	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
122	337	85	6	118	2022	2022-08-10	2022-07-01	2022-07-31	362950	\N	20	\N	72590	Penyelenggaraan Penataan Bangunan dan lingkungannya di Daerah kabupaten/kota	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200118	2	72590	219	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:45:19.993468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
121	337	85	6	117	2022	2022-08-10	2022-07-01	2022-07-31	295250	\N	20	\N	59050	Penyelenggaraan Penataan Bangunan dan lingkungannya di Daerah kabupaten/kota	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200117	2	59050	218	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:44:27.616269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
123	376	34	2	119	2022	2022-08-25	2022-08-01	2022-08-01	22980000	\N	10	\N	2298000	\N	\N	0	0	38	0	\N	\N	0	\N	\N	621102012200119	2	2298000	220	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:50:45.993716	\N	\N	\N	BELANJA MAKAN DAN MINUM RAPAT	DINAS PEKERJAAN UMUM SDAN PENATAAN RUANG	\N	\N	\N	\N	\N	\N	\N
124	378	34	2	120	2022	2022-08-09	2022-07-01	2022-07-31	7740000	\N	10	\N	774000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200120	2	774000	221	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:53:17.278644	\N	\N	\N	Belanja Makanan dan minuman Aktivitas Lapangan	DISPORA	\N	\N	\N	\N	\N	\N	\N
125	132	34	2	121	2022	2022-08-10	2022-07-01	2022-07-31	3850000	\N	10	\N	385000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200121	2	385000	222	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:55:10.732049	\N	\N	\N	Pembayaran Makan dan Minum Kecamatan Kahayan kuala	Kantor Kec. Kahayan Kuala	\N	\N	\N	\N	\N	\N	\N
126	194	34	2	122	2022	2022-08-09	2022-07-01	2022-07-31	1015000	\N	10	\N	101500	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200122	2	101500	223	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:57:12.765936	\N	\N	\N	Pembayaran Makan dan Minum Rapat Ub. Juli	Dinas Sosial	\N	\N	\N	\N	\N	\N	\N
127	379	34	2	123	2022	2022-08-10	2022-07-01	2022-07-31	4900000	\N	10	\N	490000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200123	2	490000	224	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 11:05:27.08577	\N	\N	\N	Pembelian Makanan dan Minuman Rapat Kegiatan Pelaksanaan Reses Anggota DPRD Kab. Pulang Pisau	Sekretariat DPRD	\N	\N	\N	\N	\N	\N	\N
128	192	34	2	124	2022	2022-08-10	2022-07-01	2022-07-31	5400000	\N	10	\N	540000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200124	2	540000	225	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 11:06:53.156408	\N	\N	\N	Pembelian Makanan dan Minuman Rapat Kegiatan Pelaksanaan Reses Anggota DPRD Kab. Pulang Pisau	Sekretariat DPRD	\N	\N	\N	\N	\N	\N	\N
129	256	34	2	125	2022	2022-08-10	2022-07-01	2022-07-31	4900000	\N	10	\N	490000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200125	2	490000	226	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 11:08:45.491698	\N	\N	\N	Pembelian Makanan dan Minuman Rapat Kegiatan Pelaksanaan Reses Anggota DPRD Kab. Pulang Pisau	Sekretariat DPRD	\N	\N	\N	\N	\N	\N	\N
130	380	85	6	126	2022	2022-08-12	2022-07-01	2022-07-31	520550	\N	20	\N	104110	Perecanaan, pembangunan, pengawasan dan pemanfaatan bangunan gedung daerah kabupaten/kota	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621106012200126	2	104110	227	2022-08-12	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 11:12:27.711183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
131	381	34	2	127	2022	2022-08-10	2022-07-01	2022-07-31	2450000	\N	10	\N	245000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200127	2	245000	228	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 11:15:16.15277	\N	\N	\N	Pembelian Makanan dan Minuman Rapat Kegiatan Pelaksanaan Reses Anggota DPRD Kab. Pulang Pisau	Sekretariat DPRD	\N	\N	\N	\N	\N	\N	\N
133	383	34	2	129	2022	2022-08-10	2022-07-01	2022-07-31	2450000	\N	10	\N	245000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200129	2	245000	230	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 11:24:12.144564	\N	\N	\N	Pembelian Makanan dan Minuman Rapat Kegiatan Pelaksanaan Reses Anggota DPRD Kab. Pulang Pisau	Sekretariat DPRD	\N	\N	\N	\N	\N	\N	\N
134	384	34	2	130	2022	2022-08-10	2022-07-01	2022-07-31	2450000	\N	10	\N	245000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200130	2	245000	231	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 11:28:35.959948	\N	\N	\N	Pembelian Makanan dan Minuman Rapat Kegiatan Pelaksanaan Reses Anggota DPRD Kab. Pulang Pisau	Sekretariat DPRD	\N	\N	\N	\N	\N	\N	\N
135	151	34	2	131	2022	2022-08-10	2022-07-01	2022-07-31	2450000	\N	10	\N	245000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200131	2	245000	232	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 11:29:27.571778	\N	\N	\N	Pembelian Makanan dan Minuman Rapat Kegiatan Pelaksanaan Reses Anggota DPRD Kab. Pulang Pisau	Sekretariat DPRD	\N	\N	\N	\N	\N	\N	\N
136	385	34	2	132	2022	2022-08-10	2022-07-01	2022-07-31	2450000	\N	10	\N	245000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200132	2	245000	233	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 11:33:08.576527	\N	\N	\N	Pembelian Makanan dan Minuman Rapat Kegiatan Pelaksanaan Reses Anggota DPRD Kab. Pulang Pisau	Sekretariat DPRD	\N	\N	\N	\N	\N	\N	\N
137	195	34	2	133	2022	2022-08-10	2022-07-01	2022-07-31	5000000	\N	10	\N	500000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200133	2	500000	234	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 11:43:34.115086	\N	\N	\N	Pembayaran Makan minum Kegiatan Hari Lahir Pancasila	Kesbangpol	\N	\N	\N	\N	\N	\N	\N
139	387	30	2	135	2022	2022-08-23	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200135	2	50000	236	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 12:07:29.090028	\N	\N	\N	Wm. Sumber Barokah ub juli	-	\N	\N	\N	\N	\N	\N	\N
141	29	30	2	137	2022	2022-08-24	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200137	2	50000	237	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 12:20:16.818516	\N	\N	\N	Wm. Haswarga ub juli	-	\N	\N	\N	\N	\N	\N	\N
142	359	34	2	138	2022	2022-08-01	2022-04-16	2022-04-16	500000	\N	10	\N	50000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200138	2	50000	238	2022-08-01	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 14:38:15.195332	\N	\N	\N	Makan Minum Kegiatan	Dinas Pendidikan	\N	\N	\N	\N	\N	\N	\N
143	386	34	2	139	2022	2022-08-01	2022-03-10	2022-03-11	1000000	\N	10	\N	100000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200139	2	100000	239	2022-08-01	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 14:40:16.535467	\N	\N	\N	Makan Minum ( Nasi Kotak )	Dinas Pendidikan	\N	\N	\N	\N	\N	\N	\N
144	388	34	2	140	2022	2022-08-01	2022-03-31	2022-03-31	250000	\N	10	\N	25000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200140	2	25000	240	2022-08-01	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 14:42:12.847903	\N	\N	\N	Kosumsi rapat	Dinas Pendidikan	\N	\N	\N	\N	\N	\N	\N
145	389	34	2	141	2022	2022-08-01	2022-03-10	2022-03-10	200000	\N	10	\N	20000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200141	2	20000	241	2022-08-01	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 14:50:24.212736	\N	\N	\N	Kosumsi Makan dan Minum Rapat	Dinas Pendidikan	\N	\N	\N	\N	\N	\N	\N
166	40	30	2	162	2022	2022-08-02	2022-06-01	2022-06-30	600000	\N	10	\N	60000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-07-30	621102012200162	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:52:15.263211	\N	\N	\N	Ub. Juni. WM.Rizky II	-	\N	\N	\N	\N	\N	\N	\N
167	222	34	2	163	2022	2022-08-15	2022-08-01	2022-08-31	132000	\N	10	\N	13200	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200163	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:52:48.523601	\N	\N	\N	pembayaran Belanja Minuman ub Agustus	BKPP	\N	\N	\N	\N	\N	\N	\N
156	169	34	2	152	2022	2022-08-26	2022-06-01	2022-06-30	4830000	\N	10	\N	483000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200152	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:31:24.972003	\N	\N	\N	Belanja Makanan dan Minuman Puskesmas Sebangau Ub. Juni	Dinas Kesehatan	\N	\N	\N	\N	\N	\N	\N
155	31	30	2	151	2022	2022-08-26	2022-07-01	2022-07-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200151	\N	\N	\N	\N	125	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:14:23.086946	\N	\N	\N	Wm. Wahyu Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
157	194	34	2	153	2022	2022-08-02	2022-05-01	2022-07-31	4800000	\N	10	\N	480000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200153	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:37:22.595336	\N	\N	\N	Belanja makanan dan minuman rapat sub keg Pendampingan,Asistensi,Verifikasi dan Penilaian Reformasi	Inspektorat	\N	\N	\N	\N	\N	\N	\N
158	390	34	2	154	2022	2022-08-26	2022-04-01	2022-06-30	6360000	\N	10	\N	636000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200154	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:39:38.386547	\N	\N	\N	Pembayaran Makan Minum Rapat untuk Keperluan Puskesmas Jabiren 	Dinas Kesehatan	\N	\N	\N	\N	\N	\N	\N
159	162	34	2	155	2022	2022-08-26	2022-06-01	2022-06-30	5480000	\N	10	\N	548000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200155	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:42:12.300882	\N	\N	\N	Belanja Makan minum Rapat Puskesmas Pangkoh 	Dinas Kesehatan	\N	\N	\N	\N	\N	\N	\N
160	191	34	2	156	2022	2022-08-02	2022-05-01	2022-07-31	35740000	\N	10	\N	3574000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200156	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:43:02.431903	\N	\N	\N	Kegiatan makanan dan minuman	Inspektorat	\N	\N	\N	\N	\N	\N	\N
161	351	85	6	157	2022	2022-08-26	2022-08-01	2022-07-31	3000	\N	20	\N	600	Pengelolaan dan pengembangan Sistem Penyediaan Air minum ( SPAM) Kec. Jabiren Raya	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200157	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:45:43.628808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
162	351	85	6	158	2022	2022-08-26	2022-08-01	2022-08-31	7500	\N	20	\N	1500	Pembuatan Sumber Bor Desa Pilang , Jabiren , Sakakajang , Henda dan Garung	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200158	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:47:38.415873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
163	162	34	2	159	2022	2022-08-02	2022-01-06	2022-06-07	5175000	\N	10	\N	517500	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200159	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:47:48.87382	\N	\N	\N	Belanja makanan dan minuman rapat sub keg Pendampingan,Asistensi,Verifikasi dan Penilaian Reformasi	Dinas Kesehatan	\N	\N	\N	\N	\N	\N	\N
164	351	85	6	160	2022	2022-08-26	2022-08-01	2022-08-31	16450	\N	20	\N	3290	pembuatan Sumor bor Desa pilang ,Jabiren ,Sakakajang, Henda dan Garung	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200160	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:49:54.895289	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
165	145	34	2	161	2022	2022-08-02	2022-04-01	2022-06-30	7500000	\N	10	\N	750000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200161	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:49:57.170124	\N	\N	\N	Belanja Makanan dan Minuman	Dinas Kesehatan	\N	\N	\N	\N	\N	\N	\N
168	222	34	2	164	2022	2022-08-15	2022-08-01	2022-08-31	295000	\N	10	\N	29500	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200164	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:54:14.155187	\N	\N	\N	Pembayaran Belanja minuman ub.Agustus	BKPP	\N	\N	\N	\N	\N	\N	\N
169	253	34	2	165	2022	2022-08-15	2022-08-01	2022-08-31	1760000	\N	10	\N	176000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200165	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:56:13.419457	\N	\N	\N	pembayaran Belanja Makanan dan Minuman kegiatan penyediaan Bahan Logistik Kantor ub. Agustus ub Agustus	BKPP	\N	\N	\N	\N	\N	\N	\N
170	180	34	2	166	2022	2022-08-04	2022-08-04	2022-08-04	4120000	\N	10	\N	412000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200166	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:57:59.530795	\N	\N	\N	Belanja Makanaan Minuman Pelatihan Keterampilan Anggota DWP	DP3AP2KB	\N	\N	\N	\N	\N	\N	\N
171	195	34	2	167	2022	2022-08-04	2022-08-02	2022-08-02	2000000	\N	10	\N	200000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200167	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:59:45.993259	\N	\N	\N	Belanja Maknan Minuman (Nasi dan Snack) Keg.soso AD/ART DWP ke Kec Maliku	DP3AP2KB	\N	\N	\N	\N	\N	\N	\N
172	391	34	2	168	2022	2022-08-26	2022-08-01	2022-08-31	1760000	\N	10	\N	176000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200168	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 11:05:07.343861	\N	\N	\N	Belanja Makanan dan Minuman Kegiatan penyediaan bahan logistik kantor ub. Agustus	BKPP	\N	\N	\N	\N	\N	\N	\N
173	392	34	2	169	2022	2022-08-04	2022-08-04	2022-08-04	2200000	\N	10	\N	220000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200169	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 11:06:56.931408	\N	\N	\N	Belanja Makanan minuman pelatihan keterampilan anggota DWP	DP3AP2KB	\N	\N	\N	\N	\N	\N	\N
174	201	34	2	170	2022	2022-08-04	2022-07-01	2022-07-31	3465000	\N	10	\N	346500	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200170	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 11:09:49.23311	\N	\N	\N	Pembayaran belanja bahan logistik (kue basah)	DPMPTSP	\N	\N	\N	\N	\N	\N	\N
176	201	34	2	172	2022	2022-08-04	2022-07-07	2022-07-31	1500000	\N	10	\N	150000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200172	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 11:11:57.234957	\N	\N	\N	Belanja MAkan Minum tamu	DPMPTSP	\N	\N	\N	\N	\N	\N	\N
177	132	34	2	173	2022	2022-08-04	2022-07-01	2022-07-31	1250000	\N	10	\N	125000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200173	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 11:13:43.072606	\N	\N	\N	Belanja bahan logistil (kue basah) ub,juli	DPMPTSP	\N	\N	\N	\N	\N	\N	\N
185	49	34	2	181	2022	2022-08-29	2022-08-01	2022-08-31	3850000	\N	10	\N	385000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200181	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 08:47:56.3114	\N	\N	\N	Pembayaran Belanja Makanan dan Minuman Rapat Kegiatan Pemberian Penghargaan Gerakan budaya Gemar membaca 	Dinas Perpustakaandan Kearsipan	\N	\N	\N	\N	\N	\N	\N
147	194	34	2	143	2022	2022-08-02	2022-07-06	2022-07-06	22000000	\N	10	\N	2200000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200143	2	2200000	243	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 15:07:24.584177	\N	\N	\N	Belanja Makan Minum dan Snack Keg Rapat TAPD	Dinas Bappedalitbang	\N	\N	\N	\N	\N	\N	\N
148	225	34	2	144	2022	2022-08-02	2022-07-20	2022-07-20	46750000	\N	10	\N	4675000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200144	2	4675000	244	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 15:10:12.912217	\N	\N	\N	Belanja Makan Minum dan Snack Keg Rapat TAPD	Dinas Bappedalitbang	\N	\N	\N	\N	\N	\N	\N
150	253	34	2	146	2022	2022-08-01	2022-07-25	2022-07-25	22000000	\N	10	\N	2200000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200146	2	2200000	246	2022-08-01	39	\N	\N	\N	\N	\N	\N	125	\N	\N	\N	\N	125	\N	\N	\N	\N	0	2022-08-25 15:26:50.558829	\N	\N	\N	Belanja Makan Minum dan Snack Keg Rapat TAPD	Dinas Bappedalitbang	\N	\N	\N	\N	\N	\N	\N
151	30	30	2	147	2022	2022-08-26	2022-07-01	2022-07-31	700000	\N	10	\N	70000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200147	2	70000	247	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:04:08.683656	\N	\N	\N	Wm. Syafi'i ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
152	41	30	2	148	2022	2022-08-26	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200148	2	50000	248	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:05:39.534409	\N	\N	\N	Wm.Tombo Loi Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
153	34	30	2	149	2022	2022-08-26	2022-07-01	2022-07-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200149	2	20000	249	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:07:05.657253	\N	\N	\N	Wm. Mama iwan Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
154	33	30	2	150	2022	2022-08-26	2022-07-01	2022-07-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200150	2	20000	250	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 10:11:10.448423	\N	\N	\N	Wm. Inayah ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
186	393	85	6	182	2022	2022-08-10	2022-08-01	2022-08-31	95000	\N	20	\N	19000	Pembangunan Gapura Desa Pahawan	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200182	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 08:56:59.389338	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
187	393	85	6	183	2022	2022-08-10	2022-08-01	2022-08-31	162050	\N	20	\N	32410	Pembangunan Gapura Desa Pahawan	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200183	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 08:58:09.279888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
188	393	85	6	184	2022	2022-08-10	2022-08-01	2022-08-31	360000	\N	20	\N	72000	Pembangunan Gapura Desa Pahawan	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200184	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:01:36.440774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
190	42	30	2	186	2022	2022-08-16	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200186	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:07:28.214246	\N	\N	\N	Ub. Juli 2022		\N	\N	\N	\N	\N	\N	\N
196	197	34	2	192	2022	2022-08-18	2022-08-01	2022-08-01	1520000	\N	10	\N	152000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200192	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:24:05.192066	\N	\N	\N	Pembayaran belanja makan siang No. STS. 2352	BKPP	\N	\N	\N	\N	\N	\N	\N
197	197	34	2	193	2022	2022-08-18	2022-08-01	2022-08-02	1950000	\N	10	\N	195000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200193	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:28:13.522526	\N	\N	\N	Pembayaran belanjan makan snack No. STS. 2352	BKPP	\N	\N	\N	\N	\N	\N	\N
198	197	34	2	194	2022	2022-08-18	2022-08-01	2022-08-03	1200000	\N	10	\N	120000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200194	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:29:24.774753	\N	\N	\N	Pembayaran belanjan makan snack No. STS. 2352	BKPP	\N	\N	\N	\N	\N	\N	\N
199	197	34	2	195	2022	2022-08-18	2022-08-01	2022-08-04	1520000	\N	10	\N	152000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200195	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:30:45.423884	\N	\N	\N	Pembayaran belanja makan siang No. STS. 2352	BKPP	\N	\N	\N	\N	\N	\N	\N
200	199	34	2	196	2022	2022-08-22	2022-08-01	2022-08-04	12800000	\N	10	\N	1280000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200196	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:34:05.062168	\N	\N	\N	Belanja makanan dan minuman jamuan tamu dan rapat 	Kecamatan Banama Tingang 	\N	\N	\N	\N	\N	\N	\N
201	225	34	2	197	2022	2022-08-19	2022-07-12	2022-07-12	4070000	\N	10	\N	407000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621102012200197	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:37:14.928725	\N	\N	\N	Belanja makan minum rapat No. STS. 2384	DINKES	\N	\N	\N	\N	\N	\N	\N
202	225	34	2	198	2022	2022-08-19	2022-07-14	2022-07-14	7500000	\N	10	\N	750000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621102012200198	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:39:24.371957	\N	\N	\N	DINKES	Belanja makan minum aktivitas fisik No. STS. 2384	\N	\N	\N	\N	\N	\N	\N
203	394	34	2	199	2022	2022-08-19	2022-07-04	2022-07-04	2200000	\N	10	\N	220000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200199	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:49:09.968763	\N	\N	\N	Pembayaran Makan Minum Kegiatan Rapat Pakem Tahun 2022	Kesbangpollinmas	\N	\N	\N	\N	\N	\N	\N
204	395	34	2	200	2022	2022-08-19	2022-07-11	2022-07-11	250000	\N	10	\N	25000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621102012200200	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:52:44.575885	\N	\N	\N	Makan minum tamu No. STS. 2384	-	\N	\N	\N	\N	\N	\N	\N
205	144	34	2	201	2022	2022-08-19	2022-02-28	2022-05-01	728000	\N	10	\N	72800	\N	\N	0	0	3	0	\N	\N	0	\N	2022-03-30	621102012200201	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:54:41.236242	\N	\N	\N	Konsumsi makan minum No. STS. 2384	-	\N	\N	\N	\N	\N	\N	\N
206	396	34	2	202	2022	2022-08-19	2022-05-25	2022-05-25	400000	\N	10	\N	40000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-06-30	621102012200202	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:00:28.939625	\N	\N	\N	Makanan dan minuman No. STS. 2384	-	\N	\N	\N	\N	\N	\N	\N
207	128	34	2	203	2022	2022-08-19	2022-07-04	2022-07-04	375000	\N	10	\N	37500	\N	\N	0	0	3	0	\N	\N	0	\N	2022-08-30	621102012200203	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:02:15.071649	\N	\N	\N	Makan minum rapat No. STS. 2384	-	\N	\N	\N	\N	\N	\N	\N
184	52	30	2	180	2022	2022-08-16	2022-07-01	2022-07-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200180	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 08:42:34.305786	\N	\N	\N	Wm. Depot mie kenzie Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
183	45	30	2	179	2022	2022-08-16	2010-07-01	2010-07-31	250000	\N	10	\N	25000	\N	\N	0	0	1	0	\N	\N	0	\N	2010-08-30	621102012200179	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 08:30:01.525119	\N	\N	\N	Wm. Pecal ub Juli	-	\N	\N	\N	\N	\N	\N	\N
181	352	30	2	177	2022	2022-08-16	2022-07-01	2022-07-31	750000	\N	10	\N	75000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200177	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 11:19:09.568398	\N	\N	\N	Wm. Mama Mutia ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
178	46	30	2	174	2022	2022-08-16	2022-07-01	2022-07-31	750000	\N	10	\N	75000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200174	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 11:14:09.657144	\N	\N	\N	Wm. Punjer Roso Ub. juli	-	\N	\N	\N	\N	\N	\N	\N
182	57	30	2	178	2022	2022-08-16	2010-07-01	2010-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2010-08-30	621102012200178	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 08:28:16.428692	\N	\N	\N	Wm. Reformasi Ub Juli	-	\N	\N	\N	\N	\N	\N	\N
179	58	30	2	175	2022	2022-08-16	2022-07-01	2022-07-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200175	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 11:15:45.653724	\N	\N	\N	Wm. Bakso urat ub. juli	-	\N	\N	\N	\N	\N	\N	\N
175	59	30	2	171	2022	2022-08-16	2022-07-01	2022-07-31	400000	\N	10	\N	40000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200171	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 11:11:07.098172	\N	\N	\N	Wm. Gajah Mungkur Wonogiri Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
194	50	30	2	190	2022	2022-08-16	2022-07-01	2022-07-31	800000	\N	10	\N	80000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200190	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:17:29.27677	\N	\N	\N	Ub. Juli 2022 Banyu Langit	-	\N	\N	\N	\N	\N	\N	\N
193	43	30	2	189	2022	2022-08-16	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200189	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:15:04.884128	\N	\N	\N	Ub. Juli 2022 Habibi	-	\N	\N	\N	\N	\N	\N	\N
192	208	34	2	188	2022	2022-08-16	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200188	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:13:56.896444	\N	\N	\N	Ub. Juli 2022 Kafe & Resto Bunda 08	-	\N	\N	\N	\N	\N	\N	\N
191	53	30	2	187	2022	2022-08-16	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200187	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:11:58.314309	\N	\N	\N	Ub. Juli 2022 Jowo	-	\N	\N	\N	\N	\N	\N	\N
189	72	30	2	185	2022	2022-08-16	2022-07-01	2022-07-31	300000	\N	10	\N	30000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200185	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:07:01.918675	\N	\N	\N	Ub. Juli 2022 Tenda Biru	-	\N	\N	\N	\N	\N	\N	\N
209	129	34	2	205	2022	2022-08-22	2022-08-10	2022-08-10	1870000	\N	10	\N	187000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200205	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:05:03.87249	\N	\N	\N	Pembayaran belanja makan siang No. STS. 2384	DPMPTSP	\N	\N	\N	\N	\N	\N	\N
210	201	34	2	206	2022	2022-08-22	2022-08-09	2022-08-09	660000	\N	10	\N	66000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200206	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:06:12.140549	\N	\N	\N	Pembayaran belanja makan siang No. STS. 2384	DPMPTSP	\N	\N	\N	\N	\N	\N	\N
211	397	59	4	207	2022	2022-08-22	2022-08-24	2023-08-23	0	\N	\N	\N	25000	\N	\N	0	0	1	0	2022-08-22	16	1	\N	2022-09-21	621104022200207	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:40:33.517409	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
212	398	59	4	208	2022	2022-08-22	2022-08-24	2023-08-23	0	\N	\N	\N	25000	\N	\N	0	0	1	0	2022-08-22	17	1	\N	2022-09-21	621104022200208	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:46:53.5769	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
213	167	34	2	209	2022	2022-08-22	2022-08-02	2022-08-02	7600000	\N	10	\N	760000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-09-30	621102012200209	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:52:10.639038	\N	\N	\N	Belanja Makanan dan Minuman aktifitas lapangan	Kecamatan Sebangau Kuala	\N	\N	\N	\N	\N	\N	\N
214	341	85	6	210	2022	2022-08-22	2022-08-01	2022-07-31	130250	\N	20	\N	26050	Lanjutan Pembangunan pesantren Darul Ma'Rifah Desa Anjir pulang Pisau	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200210	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:52:36.048452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
215	341	85	6	211	2022	2022-08-22	2022-08-01	2022-08-31	131950	\N	20	\N	26390	Lanjutan pembangunan Pesantren Darul Ma'rifah Desa Anjir pulang Pisau	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200211	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:54:09.583438	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
216	341	85	6	212	2022	2022-08-22	2022-08-01	2022-08-31	445050	\N	20	\N	89010	Lanjutan Pembangunan Mushola diKomplek Marina permai Kec. Kahayan Hilir	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200212	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:55:44.789062	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
217	341	85	6	213	2022	2022-08-22	2022-08-01	2022-08-31	287000	\N	20	\N	57400	Lanjutan Pembangunan Mushola diKomplek Marina permai Kec. Kahayan Hilir	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200213	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:56:41.351654	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
218	341	85	6	214	2022	2022-08-22	2022-08-01	2022-08-31	131600	\N	20	\N	26320	Lanjutan Pembangunan Mushola diKomplek Marina permai Kec. Kahayan Hilir	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200214	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:57:31.805954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
221	379	34	2	217	2022	2022-08-23	2022-08-01	2022-08-02	1400000	\N	10	\N	140000	\N	\N	0	0	37	0	\N	\N	0	\N	2022-09-30	621102012200217	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:01:31.275695	\N	\N	\N	pembayaran belanja makan dan minum no. sts 02421	DPMD	\N	\N	\N	\N	\N	\N	\N
222	367	85	6	218	2022	2022-08-22	2022-08-01	2022-08-31	173500	\N	20	\N	34700	Rehab Sedang Pustu Barunai di Kec. Kahayan kuala	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200218	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:02:51.859862	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
223	367	85	6	219	2022	2022-08-22	2022-08-01	2022-08-31	192000	\N	20	\N	38400	Rehab Sedang Pustu Barunai di Kec. Kahayan kuala	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200219	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:04:03.110458	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
219	342	85	6	215	2022	2022-08-22	2022-08-01	2022-08-31	22500	\N	20	\N	4500	Rehab Sedang Pustu Pudak di Kec. Kahayan Kuala	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 10:59:11.134568	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
231	257	34	2	227	2022	2022-08-22	2022-06-01	2022-06-30	980000	\N	10	\N	98000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-07-30	621102012200227	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:35:35.278256	\N	\N	\N	Pembayaran Belanja Makanan dan Minuman jamuan Tamu ub juni	Dinas Tenaga kerja dan Transmigrasi	\N	\N	\N	\N	\N	\N	\N
232	256	34	2	228	2022	2022-08-22	2022-06-01	2022-08-31	2058000	\N	10	\N	205800	\N	\N	0	0	1	0	\N	\N	0	\N	2022-07-30	621102012200228	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:37:22.376831	\N	\N	\N	Pembayaran belanja Makan dan Minuman Rapat ub. juni	Dinas Tenaga kerja dan Transmigrasi	\N	\N	\N	\N	\N	\N	\N
240	5	30	2	236	2022	2022-08-18	2022-07-01	2022-07-31	1000000	\N	10	\N	100000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200236	2	100000	79	2022-08-18	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:00:42.887909	\N	\N	\N	Ub. Juli 2022		\N	\N	\N	\N	\N	\N	\N
239	54	30	2	235	2022	2022-08-18	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200235	2	50000	80	2022-08-18	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 13:59:12.777581	\N	\N	\N	Ub. Juli 2022		\N	\N	\N	\N	\N	\N	\N
238	28	30	2	234	2022	2022-08-16	2022-07-01	2022-07-31	300000	\N	10	\N	30000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200234	2	30000	81	2022-08-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 13:57:35.773591	\N	\N	\N	Ub. Juli 2022		\N	\N	\N	\N	\N	\N	\N
237	61	30	2	233	2022	2022-08-19	2022-07-01	2022-07-31	300000	\N	10	\N	30000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200233	2	30000	82	2022-08-19	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:59:06.422497	\N	\N	\N	Ub. Juli 2022		\N	\N	\N	\N	\N	\N	\N
235	120	85	6	231	2022	2022-08-23	2022-08-21	2022-07-23	100256250	\N	20	\N	20051250	Pengambilan Pasri pasang a/n : Ahmad Mustafa	\N	0	0	17	0	\N	\N	0	\N	2022-09-30	621106012200231	2	20051250	84	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:42:46.646314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
234	132	34	2	230	2022	2022-08-22	2022-08-01	2022-08-31	8525000	\N	10	\N	852500	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200230	2	852500	85	2022-08-22	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:42:45.771326	\N	\N	\N	Belanja Makanan dan Minuman Rapat di Kec. Kahayan Kuala	Kec. Kahayan Kuala	\N	\N	\N	\N	\N	\N	\N
233	257	34	2	229	2022	2022-08-22	2022-07-01	2022-07-31	980000	\N	10	\N	98000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200229	2	98000	86	2022-08-22	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:38:41.250173	\N	\N	\N	Pembayaran belanja Makan dan Minuman Rapat ub. juli	Dinas Tenaga kerja dan Transmigrasi	\N	\N	\N	\N	\N	\N	\N
230	209	34	2	226	2022	2022-08-23	2022-08-01	2022-08-02	8650000	\N	10	\N	865000	\N	\N	0	0	37	0	\N	\N	0	\N	2022-09-30	621102012200226	2	865000	87	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:26:59.478766	\N	\N	\N	pembayaran belanja makan dan minum no. sts 02421	DPMD	\N	\N	\N	\N	\N	\N	\N
229	201	34	2	225	2022	2022-08-23	2022-08-01	2022-08-31	5490000	\N	10	\N	549000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200225	2	549000	88	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:26:57.471727	\N	\N	\N	Pembayaran belanja Makanan dan Minuman rapat	DPMPTSP	\N	\N	\N	\N	\N	\N	\N
228	256	34	2	224	2022	2022-08-23	2022-08-01	2022-08-02	5200000	\N	10	\N	520000	\N	\N	0	0	37	0	\N	\N	0	\N	2022-09-30	621102012200224	2	520000	89	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:25:04.968202	\N	\N	\N	pembayaran belanja makan dan minum no. sts 02421	DPMD	\N	\N	\N	\N	\N	\N	\N
227	227	34	2	223	2022	2022-08-23	2022-08-01	2022-08-02	2750000	\N	10	\N	275000	\N	\N	0	0	37	0	\N	\N	0	\N	2022-09-30	621102012200223	2	275000	90	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:22:36.877184	\N	\N	\N	pembayaran belanja makan dan minum no. sts 02421	DPMD	\N	\N	\N	\N	\N	\N	\N
226	241	34	2	222	2022	2022-08-23	2022-08-01	2022-08-03	1400000	\N	10	\N	140000	\N	\N	0	0	37	0	\N	\N	0	\N	2022-09-30	621102012200222	2	140000	91	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:19:44.943937	\N	\N	\N	Pembayaran belanja makan dan minum no. sts 02421	DPMD	\N	\N	\N	\N	\N	\N	\N
224	399	85	6	220	2022	2022-08-19	2022-08-01	2022-08-31	362750	\N	20	\N	72550	Pembangunan Ruang UKS beserta Perabotnya SDN Tumbang Nusa 1 Kec. Jabiren Raya	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200220	2	72550	94	2022-08-19	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:10:52.40731	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
220	342	85	6	216	2022	2022-08-22	2022-08-01	2022-08-31	33000	\N	20	\N	6600	Rehab Sedang pustu Pudak di Kec. Kahayan Kuala	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200216	\N	\N	\N	\N	125	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:00:41.812748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
259	404	34	2	255	2022	2022-08-26	2022-06-08	2022-07-13	1190000	\N	10	\N	119000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-07-30	621102012200255	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:38:26.627931	\N	\N	\N	Makan minum panitia rapat	-	\N	\N	\N	\N	\N	\N	\N
273	406	85	6	269	2022	2022-08-22	2022-08-01	2022-08-31	407050	\N	20	\N	81410	Rehab / Peningkatan Balai Penyuluh KB. Kec. Pandih Batu	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200269	2	81410	47	2022-08-22	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:31:57.583666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
271	406	85	6	267	2022	2022-08-22	2022-08-01	2022-08-31	760650	\N	20	\N	152130	Rehab / Peningkatan Balai Penyuluh KB. Kec. Pandih Batu	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200267	2	152130	49	2022-08-22	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:29:58.454278	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
270	120	85	6	266	2022	2022-08-26	2022-08-24	2022-08-26	100867250	\N	20	\N	20173450	Penambangan Pasir 	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621106012200266	2	20173450	50	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:59:20.277238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
269	184	34	2	265	2022	2022-08-23	2022-07-01	2022-07-31	1920000	\N	10	\N	192000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200265	2	192000	51	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:57:34.929667	\N	\N	\N	Belanja Makanan dan Minuman untuk tamu ub.Juli	DP3AP2KB	\N	\N	\N	\N	\N	\N	\N
268	184	34	2	264	2022	2022-08-23	2022-07-01	2022-08-31	1530000	\N	10	\N	153000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200264	2	153000	52	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:55:36.658635	\N	\N	\N	Belanja Makanan dan Minuman ub Juli	DP3AP2KB	\N	\N	\N	\N	\N	\N	\N
267	241	34	2	263	2022	2022-08-23	2022-08-09	2022-07-09	1800000	\N	10	\N	180000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-09-30	621102012200263	2	180000	53	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:52:56.308882	\N	\N	\N	Belanja Makanan dan Minuman	DP3AP2KB	\N	\N	\N	\N	\N	\N	\N
266	195	34	2	262	2022	2022-08-23	2022-08-09	2022-08-09	2000000	\N	10	\N	200000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-09-30	621102012200262	2	200000	54	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:50:21.894087	\N	\N	\N	Belanja Maknan-Minuman lap ( Nasi Kotak)	DP3AP2KB	\N	\N	\N	\N	\N	\N	\N
264	184	34	2	260	2022	2022-08-23	2022-08-09	2022-08-10	1350000	\N	10	\N	135000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-09-30	621102012200260	2	135000	56	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:46:22.963968	\N	\N	\N	Belanja maknan-Minuman lap ( Snack)	DP3AP2KB	\N	\N	\N	\N	\N	\N	\N
263	194	34	2	259	2022	2022-08-23	2022-08-10	2022-08-10	1600000	\N	10	\N	160000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-09-30	621102012200259	2	160000	57	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:44:05.817013	\N	\N	\N	Belanja makanan-minuman lap (Nasi Kotak)	DP3AP2KB	\N	\N	\N	\N	\N	\N	\N
261	150	34	2	257	2022	2022-08-22	2022-08-01	2022-08-31	22000000	\N	10	\N	2200000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200257	2	2200000	59	2022-08-22	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:39:54.99084	\N	\N	\N	Belanja makan dan minuman rapat 	Kecamatan Maliku	\N	\N	\N	\N	\N	\N	\N
260	197	34	2	256	2022	2022-08-23	2022-07-20	2022-07-20	320000	\N	10	\N	32000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200256	2	32000	60	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:38:41.957995	\N	\N	\N	Belanja Kosummsi makan dan minum lapangan distribusi alat dan obat kontrasepsi	DP3AP2KB	\N	\N	\N	\N	\N	\N	\N
258	376	34	2	254	2022	2022-08-22	2022-08-01	2022-08-31	23500000	\N	10	\N	2350000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200254	2	2350000	61	2022-08-22	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:36:40.02826	\N	\N	\N	Biaya pembayaran LS 100% Pekerjaan belanja makanan dan minuman lokmin puskesmas pulang pisau	Dinas Kesehatan	\N	\N	\N	\N	\N	\N	\N
257	183	34	2	253	2022	2022-08-26	2022-08-22	2022-08-22	1925000	\N	10	\N	192500	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200253	2	192500	62	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:33:36.824342	\N	\N	\N	Belanja makanan dan minuman rapat No. STS. 2441	DISDIK	\N	\N	\N	\N	\N	\N	\N
256	180	34	2	252	2022	2022-08-23	2022-07-19	2022-07-19	4000000	\N	10	\N	400000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200252	2	400000	63	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:33:29.401888	\N	\N	\N	Biaya Makanan dan Minuman aktivitas Lapangan	DP3AP2KB	\N	\N	\N	\N	\N	\N	\N
255	402	34	2	251	2022	2022-08-26	2022-08-22	2022-08-22	600000	\N	10	\N	60000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200251	2	60000	64	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:32:36.710488	\N	\N	\N	Belanja makanan dan minuman rapat No. STS. 2441	DISDIK	\N	\N	\N	\N	\N	\N	\N
254	403	34	2	250	2022	2022-08-26	2022-08-22	2022-08-22	2250000	\N	10	\N	225000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200250	2	225000	65	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:31:05.156179	\N	\N	\N	Belanja makanan dan minuman rapat No. STS. 2441	DISDIK	\N	\N	\N	\N	\N	\N	\N
253	403	34	2	249	2022	2022-08-26	2022-08-22	2022-08-22	6000000	\N	10	\N	600000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200249	2	600000	66	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:29:35.149759	\N	\N	\N	Belanja makanan dan minuman rapat No. STS. 2441	DISDIK	\N	\N	\N	\N	\N	\N	\N
252	225	34	2	248	2022	2022-08-23	2022-08-03	2022-08-03	2486000	\N	10	\N	248600	\N	\N	0	0	17	0	\N	\N	0	\N	2022-09-30	621102012200248	2	248600	67	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:28:28.691036	\N	\N	\N	Pembayaran Makanan dan Minuman	RSUD Pulang PIsau	\N	\N	\N	\N	\N	\N	\N
250	402	34	2	246	2022	2022-08-26	2022-08-22	2022-08-22	660000	\N	10	\N	66000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200246	2	66000	69	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:22:58.102769	\N	\N	\N	Belanja makanan dan minuman rapat No. STS. 2441	DISDIK	\N	\N	\N	\N	\N	\N	\N
249	376	34	2	245	2022	2022-08-23	2022-07-01	2022-07-31	12595000	\N	10	\N	1259500	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200245	2	1259500	70	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:22:41.241949	\N	\N	\N	Biaya Makanan dan Minuman rapat	RSUD Pulang Pisau	\N	\N	\N	\N	\N	\N	\N
248	225	34	2	244	2022	2022-08-23	2022-07-01	2022-07-31	1595000	\N	10	\N	159500	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200244	2	159500	71	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:20:15.77573	\N	\N	\N	Biaya Makanan dan Minuman tamu oleh Catering Inang untuk Keperluan BLUD RSUD Pulpis	RSUD Pulang PIsau	\N	\N	\N	\N	\N	\N	\N
247	182	34	2	243	2022	2022-08-26	2022-08-22	2022-08-22	1760000	\N	10	\N	176000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200243	2	176000	72	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:17:20.284703	\N	\N	\N	Belanja makanan dan minuman rapat No. STS. 2441	DISDIK	\N	\N	\N	\N	\N	\N	\N
246	182	34	2	242	2022	2022-08-26	2022-08-22	2022-08-22	1600000	\N	10	\N	160000	\N	\N	0	0	3	0	\N	\N	0	\N	2022-09-30	621102012200242	2	160000	73	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:15:47.989421	\N	\N	\N	Belanja makanan dan minuman rapat No. STS. 2441	DISDIK	\N	\N	\N	\N	\N	\N	\N
245	401	34	2	241	2022	2022-08-22	2022-08-01	2022-08-31	74250000	\N	10	\N	7425000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200241	2	7425000	74	2022-08-22	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:14:00.436562	\N	\N	\N	Pembayaran Pengadaan Makanan dan Minuman beserta Snack untuk kegiatan pendidikan dan pelatihan paskibraka	DISPORA	\N	\N	\N	\N	\N	\N	\N
244	221	34	2	240	2022	2022-08-22	2022-08-01	2022-08-31	5500000	\N	10	\N	550000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200240	2	550000	75	2022-08-22	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:07:29.380551	\N	\N	\N	Belanja Makanan dan minuman Sosialisasi dan Pelatihan verifikasi usulan Musrenbang	Bappedalitbang	\N	\N	\N	\N	\N	\N	\N
243	56	30	2	239	2022	2022-08-16	2022-07-01	2022-07-31	1000000	\N	10	\N	100000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200239	2	100000	76	2022-08-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:06:31.315061	\N	\N	\N	Ub. Juli 2022		\N	\N	\N	\N	\N	\N	\N
242	74	30	2	238	2022	2022-08-16	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200238	2	50000	77	2022-08-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:04:55.859685	\N	\N	\N	Ub. Juli 2022		\N	\N	\N	\N	\N	\N	\N
265	405	23	2	261	2022	2022-08-26	2022-07-01	2022-08-31	10000000	\N	10	\N	1000000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200261	2	1000000	99	2022-08-26	5	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:49:35.347206	\N	\N	\N	Ub. Juli 2022 Candi Laras	-	\N	\N	\N	\N	\N	\N	\N
284	378	34	2	280	2022	2022-08-22	2022-04-01	2022-06-30	2493000	\N	10	\N	249300	\N	\N	0	0	1	0	\N	\N	0	\N	2022-05-30	621102012200280	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:57:08.658441	\N	\N	\N	DISPORA	Pembayaran Belanja makanan dan minuman jamuan tamu - kegiatan fasilitas kunjungan tamu ub april sd juni 2022	\N	\N	\N	\N	\N	\N	\N
286	378	34	2	282	2022	2022-08-22	2022-06-01	2022-07-29	2450000	\N	10	\N	245000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-07-30	621102012200282	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:00:41.570567	\N	\N	\N	Pembayaran Belanja makanan dan minuman Rapat Ub juni sd  juli 2022	DISPORA	\N	\N	\N	\N	\N	\N	\N
289	378	34	2	285	2022	2022-08-19	2022-04-01	2022-05-31	2000000	\N	10	\N	200000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-05-30	621102012200285	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:04:17.249301	\N	\N	\N	Pembayaran belanja Makan dan Minuman Rapat ub. April sd Mei 2022	DISPORA	\N	\N	\N	\N	\N	\N	\N
302	411	85	6	298	2022	2022-08-25	2022-08-01	2022-08-31	119350	\N	20	\N	23870	Pembangunan Toilet ( Jamban ) beserta Sanitasinya TK Aisyiah Bustanul ( DAK)	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200298	2	23870	21	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:58:49.11393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
301	411	85	6	297	2022	2022-08-25	2022-08-01	2022-08-31	211250	\N	20	\N	42250	Pembangunan Toilet ( Jamban ) beserta Sanitasinya TK Aisyiah Bustanul ( DAK)	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200297	2	42250	22	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:58:05.609695	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
300	289	61	4	296	2022	2022-08-25	2022-08-26	2022-09-01	0	\N	\N	\N	280000	\N	\N	0	0	1	0	2022-08-25	18	1	\N	2022-09-24	621104022200296	2	280000	23	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:40:54.119163	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
299	410	85	6	295	2022	2022-08-25	2022-08-01	2022-08-31	6469000	\N	20	\N	1293800	Peningkatan Jalan Menuju Desa Lawang uru	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200295	2	1293800	24	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:25:35.337071	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
298	410	85	6	294	2022	2022-08-25	2022-08-01	2022-08-31	2580750	\N	20	\N	516150	Peningkatan Jalan Menuju Desa Lawang uru	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200294	2	516150	25	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:24:28.514456	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
296	409	34	2	292	2022	2022-08-19	2022-08-01	2022-08-31	945000	\N	10	\N	94500	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200292	2	94500	27	2022-08-19	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:15:13.94739	\N	\N	\N	Pembayaran Makanan dan minuman rapat Sub kegiatan Dukungan Pelaksanaan Sistem Pemerintah Berbasis Elektronik pada SKPD	Inspektorat	\N	\N	\N	\N	\N	\N	\N
295	241	34	2	291	2022	2022-08-24	2022-08-09	2022-08-09	34000000	\N	10	\N	3400000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-09-30	621102012200291	2	3400000	28	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:13:14.898851	\N	\N	\N	Pembayaran biaya penyediaan makanan dan minuman aktifitas lapangan dilingkungan Sekretariat daerah	Sekretariat Daerah	\N	\N	\N	\N	\N	\N	\N
294	246	34	2	290	2022	2022-08-24	2022-07-21	2022-07-21	40080000	\N	10	\N	4008000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200290	2	4008000	29	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:10:18.829689	\N	\N	\N	Pembayaran Biaya pembelian makanan dan minuman aktifitas pegawai dilingkungan sekretariat daerah	Sekretariat Daerah	\N	\N	\N	\N	\N	\N	\N
293	194	34	2	289	2022	2022-08-19	2022-08-01	2022-08-31	1800000	\N	10	\N	180000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200289	2	180000	30	2022-08-19	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:10:08.155764	\N	\N	\N	Pembayaran belanja makanan dan minuman rapat kegiatan dukungan pelaksanaan sistem pemerintah berbasis elektronik pada SKPDada	Inspektorat	\N	\N	\N	\N	\N	\N	\N
292	245	34	2	288	2022	2022-08-24	2022-08-02	2022-08-02	6000000	\N	10	\N	600000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-09-30	621102012200288	2	600000	31	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:07:56.338481	\N	\N	\N	Pembayaran Biaya penyediaan Makanan dan minuman aktivitas lapangan pegawai (Senam Jumat Pagi) dilingkungan Sekretariat daerah	Sekretariat Daerah	\N	\N	\N	\N	\N	\N	\N
291	191	34	2	287	2022	2022-08-19	2022-08-01	2022-08-31	800000	\N	10	\N	80000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200287	2	80000	32	2022-08-19	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:06:52.238518	\N	\N	\N	pembayaran belanja makanan dan minuman rapat sub kegiatan pendampingan , asistensi, verifikasi dan penilaian rb inspektorat ub. Agustus	Inspektorat	\N	\N	\N	\N	\N	\N	\N
290	245	34	2	286	2022	2022-08-24	2022-07-06	2022-07-06	5100000	\N	10	\N	510000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200286	2	510000	33	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:04:54.579081	\N	\N	\N	Pembayaran Biaya penyediaan Maknan dan Minuman Aktifitas Lapangan Dilingkungan Sekretariat Daerah	Sekretariat Daerah	\N	\N	\N	\N	\N	\N	\N
288	378	34	2	284	2022	2022-08-22	2022-08-01	2022-08-31	1520000	\N	10	\N	152000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200284	2	152000	34	2022-08-22	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:02:33.11894	\N	\N	\N	Pembayaran belanja Makan dan Minuman Rapat ub. Agustus	DISPORA	\N	\N	\N	\N	\N	\N	\N
287	245	34	2	283	2022	2022-08-24	2022-08-03	2022-08-03	3000000	\N	10	\N	300000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-09-30	621102012200283	2	300000	35	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:02:15.464093	\N	\N	\N	Pembayaran Biaya Penyediaan Makanan dan Minuman Rapat rapat Koordinasi di Lingkungan Sekretariat Daerah	Sekretariat Daerah	\N	\N	\N	\N	\N	\N	\N
285	69	30	2	281	2022	2022-08-23	2022-07-01	2022-07-31	400000	\N	10	\N	40000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200281	2	40000	36	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:57:48.111084	\N	\N	\N	Ub.Juli WM.Pasundan	-	\N	\N	\N	\N	\N	\N	\N
283	408	23	2	279	2022	2022-08-24	2022-08-01	2022-08-31	2500000	\N	10	\N	250000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-09-30	621102012200279	2	250000	37	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:56:22.85838	\N	\N	\N	Ub. Juli RM Anugrah	-	\N	\N	\N	\N	\N	\N	\N
282	378	34	2	278	2022	2022-08-19	2022-07-01	2022-08-31	1718000	\N	10	\N	171800	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200278	2	171800	38	2022-08-19	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:53:11.207838	\N	\N	\N	Pembayaran Belanja Makanan dan Minuman Rapat ub juli sd Agustus 2022	DISPORA	\N	\N	\N	\N	\N	\N	\N
281	407	85	6	277	2022	2022-08-23	2022-08-01	2022-08-31	422100	\N	20	\N	84420	Pembangunan Dryver Ultra Violet di Desa Mulya Sari ( Poktan Mulyasari Tani )	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200277	2	84420	39	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:48:30.698836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
280	407	85	6	276	2022	2022-08-23	2022-08-01	2022-08-31	528500	\N	20	\N	105700	Pembangunan Dryver Ultra Violet di Desa Mulya Sari ( Poktan Mulyasari Tani )	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200276	2	105700	40	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:47:44.619344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
278	62	30	2	274	2022	2022-08-23	2022-07-01	2022-07-31	300000	\N	10	\N	30000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200274	2	30000	42	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:46:29.287881	\N	\N	\N	Ub.Juli WM.Esa	-	\N	\N	\N	\N	\N	\N	\N
277	18	30	2	273	2022	2022-08-23	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200273	2	50000	43	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:44:53.473312	\N	\N	\N	Ub.Juli WM.Wong Jogja	-	\N	\N	\N	\N	\N	\N	\N
276	377	85	6	272	2022	2022-08-23	2022-08-01	2022-08-31	422100	\N	20	\N	84420	Pembangunan dryver ultra violet didesa Belanti Siam ( poktan Sumber Mulyo )	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200272	2	84420	44	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:41:59.185031	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
275	377	85	6	271	2022	2022-08-23	2022-08-01	2022-08-31	528500	\N	20	\N	105700	Pembangunan dryver ultra violet didesa Belanti Siam ( poktan Sumber Mulyo )	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200271	2	105700	45	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:41:15.198488	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
319	65	30	2	315	2022	2022-08-24	2022-07-01	2022-07-31	300000	\N	10	\N	30000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200315	2	30000	100	2022-08-24	5	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:25:54.492948	\N	\N	\N	Wm. Mama Hairin ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
279	407	85	6	275	2022	2022-08-23	2022-08-01	2022-08-31	307750	\N	20	\N	61550	Pembangunan Dryver Ultra Violet di Desa Mulya Sari ( Poktan Mulyasari Tani )	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200275	2	61550	41	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:46:58.429653	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
352	64	30	2	348	2022	2022-09-01	2022-08-01	2022-08-31	400000	\N	10	\N	40000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200348	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:26:10.086836	\N	\N	\N	Wm. Mama Ebi ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
320	413	59	4	316	2022	2022-08-26	2022-09-12	2023-09-11	0	\N	\N	\N	45000	\N	\N	0	0	3	0	2022-08-26	19	3	\N	2022-09-25	621104022200316	2	45000	4	2022-08-26	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:40:50.341694	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
317	393	85	6	313	2022	2022-08-24	2022-07-01	2022-07-31	98700	\N	20	\N	19740	Penataan Taman Bermain Kahanjak Pulang Pisau	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200313	2	19740	5	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:22:32.425408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
316	393	85	6	312	2022	2022-08-24	2022-07-01	2022-07-31	5700	\N	20	\N	1140	Penataan Taman Bermain Kahanjak	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200312	2	1140	92	2022-08-24	5	\N	1	\N	\N	\N	\N	5	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:21:42.393687	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
315	393	85	6	311	2022	2022-08-24	2022-07-01	2022-07-31	83250	\N	20	\N	16650	Penataan Taman Bermain Kahanjak	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200311	2	16650	7	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:20:53.40921	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
314	367	85	6	310	2022	2022-08-25	2022-07-01	2022-07-31	88200	\N	20	\N	17640	Lanjutan Pembangunan Madrasah Al Mububah Hanjak Maju	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200310	2	17640	8	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:19:09.625299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
313	367	85	6	309	2022	2022-08-25	2022-07-01	2022-07-31	146000	\N	20	\N	29200	Lanjutan Pembangunan Madrasah Al Mububah Hanjak Maju	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200309	2	29200	9	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:18:13.811609	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
312	368	85	6	308	2022	2022-08-25	2022-08-01	2022-08-31	330050	\N	20	\N	66010	Pembangunan Mesjid Nur Jannah desa Pahawan Kec. banama Tingang	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200308	2	66010	10	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:15:36.508026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
311	368	85	6	307	2022	2022-08-25	2022-08-01	2022-08-31	298000	\N	20	\N	59600	Pembangunan Mesjid Nur Jannah desa Pahawan Kec. Banama tingang	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200307	2	59600	11	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:14:39.759389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
310	368	85	6	306	2022	2022-08-25	2022-08-01	2022-08-31	864000	\N	20	\N	172800	Pembangunan Mesjid Nur Jannah desa Pahawan	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200306	2	172800	12	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:12:50.270713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
309	411	85	6	305	2022	2022-08-25	2022-08-01	2022-08-31	1145100	\N	20	\N	229020	Pembangunan Area Bermain  beserta APE luara Ruangan TK Aisyiah bustanul ( DAK)	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200305	2	229020	13	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:11:25.224017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
308	411	85	6	304	2022	2022-08-25	2022-08-01	2022-08-31	410900	\N	20	\N	82180	Pembangunan Area Bermain  beserta APE luara Ruangan TK Aisyiah bustanul ( DAK)	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200304	2	82180	14	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:10:35.566012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
274	377	85	6	270	2022	2022-08-23	2022-08-01	2022-08-31	307750	\N	20	\N	61550	Pembangunan dryver ultra violet didesa Belanti Siam ( poktan Sumber Mulyo )	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200270	2	61550	46	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:40:19.198053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
318	63	30	2	314	2022	2022-08-24	2022-07-01	2022-07-31	1000000	\N	10	\N	100000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200314	2	100000	98	2022-08-24	5	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:24:47.2564	\N	\N	\N	Wm. Lalapan P Jhoen ub. juli	-	\N	\N	\N	\N	\N	\N	\N
307	411	85	6	303	2022	2022-08-25	2022-08-01	2022-08-31	447500	\N	20	\N	89500	Pembangunan Area Bermain  beserta APE luara Ruangan TK Aisyiah bustanul ( DAK)	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200303	2	89500	16	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:09:20.110786	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
306	412	85	6	302	2022	2022-08-25	2022-08-01	2022-08-31	149400	\N	20	\N	29880	Pembangunan Ruang UKS TK Aisyiyah Bustanul ( DAK)	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200302	2	29880	17	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:07:37.809314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
305	412	85	6	301	2022	2022-08-25	2022-08-01	2022-08-31	104300	\N	20	\N	20860	Pembangunan Ruang UKS TK Aisyiyah Bustanul ( DAK)	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200301	2	20860	18	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:06:44.13851	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
304	412	85	6	300	2022	2022-08-25	2022-08-01	2022-08-31	248250	\N	20	\N	49650	Pembangunan Ruang UKS TK Aisyiyah Bustanul ( DAK)	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200300	2	49650	19	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:05:50.309112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
303	411	85	6	299	2022	2022-08-25	2022-08-01	2022-08-31	92250	\N	20	\N	18450	Pembangunan Toilet ( Jamban ) beserta Sanitasinya TK Aisyiah Bustanul ( DAK)	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200299	2	18450	20	2022-08-25	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:59:27.424117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
297	378	34	2	293	2022	2022-08-19	2022-08-01	2022-08-31	2400000	\N	10	\N	240000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200293	2	240000	26	2022-08-19	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 08:17:30.907147	\N	\N	\N	Pembayaran belanja makanan dan minuman jamuan tamu kegiatan fasilitas kunjungan tamu dalam kegiatan senam bersama dalam rangka pembagian 1000 bendera agustus	DISPORA	\N	\N	\N	\N	\N	\N	\N
272	406	85	6	268	2022	2022-08-22	2022-08-01	2022-08-31	259750	\N	20	\N	51950	Rehab / Peningkatan Balai Penyuluh KB. Kec. Pandih Batu	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200268	2	51950	48	2022-08-22	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 07:30:49.049442	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
262	197	34	2	258	2022	2022-08-23	2022-07-12	2022-07-12	160000	\N	10	\N	16000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200258	2	16000	58	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:40:58.322348	\N	\N	\N	Belanja kosumsi makana dan minum lapangan keg pelayanan KB	DP3AP2KB	\N	\N	\N	\N	\N	\N	\N
251	376	34	2	247	2022	2022-08-23	2022-07-01	2022-07-01	49950000	\N	10	\N	4995000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200247	2	4995000	68	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:24:35.526624	\N	\N	\N	Biaya Makanan dan Minuman Jaga	RSUD Pulang PIsau	\N	\N	\N	\N	\N	\N	\N
241	17	30	2	237	2022	2022-08-18	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200237	2	50000	78	2022-08-18	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 14:03:01.545378	\N	\N	\N	Ub. Juli 2022		\N	\N	\N	\N	\N	\N	\N
236	125	85	6	232	2022	2022-08-24	2022-08-20	2022-08-22	106145000	\N	20	\N	21229000	Pengambilan Pasir Pasang di Desa Tumbang Nusa (Edwin Rangga)	\N	0	0	5	0	\N	\N	0	\N	2022-09-30	621106012200232	2	21229000	83	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:53:43.022063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
322	414	34	2	318	2022	2022-08-26	2022-08-01	2022-08-26	4870000	\N	10	\N	487000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-09-30	621102012200318	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-30 09:55:54.518234	\N	\N	\N	Belanja makanan dan minuman rapat	DINKES	\N	\N	\N	\N	\N	\N	\N
353	42	30	2	349	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200349	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:27:10.45782	\N	\N	\N	Wm.Ayam Geprek Mama Ifit	-	\N	\N	\N	\N	\N	\N	\N
225	399	85	6	221	2022	2022-08-19	2022-08-01	2022-08-31	236950	\N	20	\N	47390	Pembangunan Ruang UKS beserta Perabotnya SDN Tumbang Nusa 1 Kec. Jabiren Raya	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621106012200221	2	47390	93	2022-08-19	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 11:11:46.462917	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	38	30	2	69	2022	2022-08-05	2022-06-01	2022-06-30	200000	\N	10	\N	20000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-07-30	621102012200069	2	20000	95	2022-08-05	5	\N	2	284	400	1 	2022-08-05	5	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 13:57:02.045385	\N	\N	\N	Wm. Cak li Ub. Juni	-	\N	\N	\N	\N	\N	\N	\N
195	64	30	2	191	2022	2022-08-16	2022-07-01	2022-07-31	400000	\N	10	\N	40000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200191	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-29 09:19:17.385436	\N	\N	\N	Ub. Juli 2022 Mama Ebi	-	\N	\N	\N	\N	\N	\N	\N
180	60	30	2	176	2022	2022-08-16	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200176	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-26 11:17:06.353933	\N	\N	\N	Wm. Mama Mila/Amang Anang ub juli	-	\N	\N	\N	\N	\N	\N	\N
74	37	30	2	70	2022	2022-08-05	2022-06-01	2022-06-30	1000000	\N	10	\N	100000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-07-30	621102012200070	2	100000	96	2022-08-05	5	\N	3	284	2000	1 	2022-08-05	5	\N	2	2000	2022-08-05	0	\N	\N	\N	\N	0	2022-08-24 13:58:32.65048	\N	\N	\N	Wm. Bariklana ub Juni	-	\N	\N	\N	\N	\N	\N	\N
140	37	30	2	136	2022	2022-08-26	2022-07-01	2022-07-31	1000000	\N	10	\N	100000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-08-30	621102012200136	2	100000	97	2022-08-26	5	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 12:18:33.884057	\N	\N	\N	Wm. Bariklana Ub juli	-	\N	\N	\N	\N	\N	\N	\N
324	3	23	2	320	2022	2022-08-30	2022-07-01	2022-07-31	2000000	\N	10	\N	200000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200320	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:10:08.070681	\N	\N	\N	RM. Anni ub. juli	-	\N	\N	\N	\N	\N	\N	\N
325	15	30	2	321	2022	2022-08-30	2022-07-01	2022-07-31	300000	\N	10	\N	30000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200321	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:11:03.440881	\N	\N	\N	Wm. Abah Mirhan Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
326	416	30	2	322	2022	2022-08-30	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200322	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:16:30.810514	\N	\N	\N	Wm. Melati kuin ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
327	23	30	2	323	2022	2022-09-01	2022-08-01	2022-08-31	300000	\N	10	\N	30000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-09-30	621102012200323	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:16:34.871703	\N	\N	\N	Ub. Agustus 2022	0	\N	\N	\N	\N	\N	\N	\N
138	387	30	2	134	2022	2022-08-05	2022-06-01	2022-06-30	500000	\N	10	\N	50000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-07-30	621102012200134	2	50000	235	2022-08-05	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 11:54:15.74764	\N	\N	\N	Wm. Sumber Barokah Ub. Juni	-	\N	\N	\N	\N	\N	\N	\N
328	22	30	2	324	2022	2022-09-01	2022-08-01	2022-08-31	300000	\N	10	\N	30000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-09-30	621102012200324	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:21:25.976556	\N	\N	\N	Ub. Agustus 2022	0	\N	\N	\N	\N	\N	\N	\N
329	417	30	2	325	2022	2022-08-30	2022-07-01	2022-07-31	600000	\N	10	\N	60000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200325	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:21:27.851557	\N	\N	\N	Wm. Mama Aida ub juli	-	\N	\N	\N	\N	\N	\N	\N
330	418	30	2	326	2022	2022-08-30	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200326	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:25:12.776195	\N	\N	\N	Wm. Adelia Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
331	419	30	2	327	2022	2022-08-30	2022-07-01	2022-07-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200327	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:30:26.578987	\N	\N	\N	Wm. H Idah ub Juli	-	\N	\N	\N	\N	\N	\N	\N
332	420	30	2	328	2022	2022-08-30	2022-07-01	2022-07-31	250000	\N	10	\N	25000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200328	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:33:20.151304	\N	\N	\N	Wm. 99 Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
333	20	30	2	329	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200329	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:40:51.414671	\N	\N	\N	Wm. Banjar Sari Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
334	26	30	2	330	2022	2022-09-01	2022-08-01	2022-08-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200330	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:47:02.653332	\N	\N	\N	Wm. Nani Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
335	21	30	2	331	2022	2022-09-01	2022-08-01	2022-08-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200331	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:50:45.48291	\N	\N	\N	Wm. Hafizah Ub Agustus	-	\N	\N	\N	\N	\N	\N	\N
336	21	30	2	332	2022	2022-09-01	2022-08-01	2022-08-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200332	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:50:50.858934	\N	\N	\N	Wm. Hafizah Ub Agustus	-	\N	\N	\N	\N	\N	\N	\N
337	27	30	2	333	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200333	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:52:57.263681	\N	\N	\N	Wm. Reihan RGL 30 Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
338	24	30	2	334	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200334	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:55:12.230834	\N	\N	\N	Wm. Mama dia/diko ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
339	19	30	2	335	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200335	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:57:18.914644	\N	\N	\N	Wm. Al mira Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
340	68	30	2	336	2022	2022-09-02	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	37	0	\N	\N	0	\N	2022-09-30	621102012200336	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:58:26.370119	\N	\N	\N	Ub. Agustus 2022	-	\N	\N	\N	\N	\N	\N	\N
341	25	30	2	337	2022	2022-09-01	2022-08-01	2022-08-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200337	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 09:59:39.670029	\N	\N	\N	Wm. Mama Sidik Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
342	13	30	2	338	2022	2022-09-01	2022-08-01	2022-08-31	300000	\N	10	\N	30000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200338	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:01:40.083376	\N	\N	\N	Wm. Rona Asyila Ub. Agustus 	-	\N	\N	\N	\N	\N	\N	\N
343	11	30	2	339	2022	2022-09-01	2022-08-01	2022-08-31	300000	\N	10	\N	30000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200339	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:02:41.57562	\N	\N	\N	Wm. Aulia Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
344	68	30	2	340	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200340	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:09:26.836317	\N	\N	\N	Mie Ayam & Bakso Sragen/suko Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
345	61	30	2	341	2022	2022-09-01	2022-08-01	2022-08-31	300000	\N	10	\N	30000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200341	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:11:05.757446	\N	\N	\N	Wm. Al- Hurr Ub. Agustus 	-	\N	\N	\N	\N	\N	\N	\N
346	61	30	2	342	2022	2022-09-01	2022-08-01	2022-08-31	300000	\N	10	\N	30000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200342	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:11:10.116066	\N	\N	\N	Wm. Al- Hurr Ub. Agustus 	-	\N	\N	\N	\N	\N	\N	\N
347	53	30	2	343	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200343	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:12:03.140424	\N	\N	\N	Wm. Jowo Ub. Agustus 	-	\N	\N	\N	\N	\N	\N	\N
348	51	30	2	344	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200344	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:13:25.149182	\N	\N	\N	Wm. Cafe & Resto Bunda 08 Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
349	43	30	2	345	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200345	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:14:13.533169	\N	\N	\N	Wm. Habibi Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
350	69	30	2	346	2022	2022-09-01	2022-08-01	2022-08-31	400000	\N	10	\N	40000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200346	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:15:12.436514	\N	\N	\N	Wm. Pasundan Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
351	73	30	2	347	2022	2022-09-01	2022-08-01	2022-08-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200347	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:25:11.523772	\N	\N	\N	Wm. Usun H Ayus Ub. Agustus 	-	\N	\N	\N	\N	\N	\N	\N
354	72	30	2	350	2022	2022-09-01	2022-08-01	2022-08-31	300000	\N	10	\N	30000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200350	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:28:30.368711	\N	\N	\N	Wm. Tenda Biru ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
355	54	30	2	351	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200351	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:29:59.797451	\N	\N	\N	Warung Syahrini ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
356	62	30	2	352	2022	2022-09-01	2022-08-01	2022-08-31	300000	\N	10	\N	30000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200352	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:31:03.557587	\N	\N	\N	Warung Makan Esa ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
359	408	23	2	355	2022	2022-09-01	2022-08-01	2022-08-31	2500000	\N	10	\N	250000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200355	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:43:23.686871	\N	\N	\N	RM. Anugrah Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
357	3	23	2	353	2022	2022-09-01	2022-08-01	2022-08-31	2000000	\N	10	\N	200000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200353	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:40:34.470583	\N	\N	\N	RM. Anni Ub. Agustus 	-	\N	\N	\N	\N	\N	\N	\N
358	405	23	2	354	2022	2022-09-01	2022-08-01	2022-08-31	10000000	\N	10	\N	1000000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200354	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:41:46.798776	\N	\N	\N	RM. Candi Laras Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
360	18	30	2	356	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200356	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:46:58.961453	\N	\N	\N	Wm. Wong Jogja ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
361	17	30	2	357	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200357	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:48:11.351616	\N	\N	\N	Wm. Mama Nisa Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
362	15	30	2	358	2022	2022-09-01	2022-08-01	2022-08-31	300000	\N	10	\N	30000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200358	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:49:28.007764	\N	\N	\N	Wm. Abah Mirhan ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
363	70	30	2	359	2022	2022-09-01	2022-08-01	2022-08-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200359	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:57:16.430761	\N	\N	\N	Wm. Soponyono A Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
364	71	30	2	360	2022	2022-09-01	2022-08-01	2022-08-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200360	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 10:58:33.738811	\N	\N	\N	Wm. Soponyono B Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
365	66	30	2	361	2022	2022-09-01	2022-08-01	2022-08-31	150000	\N	10	\N	15000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200361	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:00:33.797616	\N	\N	\N	Wm. Mekar Arum Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
366	47	30	2	362	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200362	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:01:29.97453	\N	\N	\N	Wm. Rahmah ub Agustus	-	\N	\N	\N	\N	\N	\N	\N
367	55	30	2	363	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200363	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:02:24.970119	\N	\N	\N	Wm. Tamban Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
368	44	30	2	364	2022	2022-09-01	2022-08-01	2022-08-31	750000	\N	10	\N	75000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200364	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:03:15.66152	\N	\N	\N	Wm. Mama Nia ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
369	49	30	2	365	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200365	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:04:02.989474	\N	\N	\N	Wm. Yeyen Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
370	65	30	2	366	2022	2022-09-01	2022-08-01	2022-08-31	300000	\N	10	\N	30000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200366	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:16:18.077248	\N	\N	\N	Wm. Mama Hairin ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
371	57	30	2	367	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200367	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:17:31.586033	\N	\N	\N	Wm. Reformasi Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
372	1	265	1	368	2022	2022-09-01	2022-08-01	2022-08-31	2000000	\N	10	\N	200000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621101012200368	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:18:31.091212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
373	59	30	2	369	2022	2022-09-01	2022-08-01	2022-08-31	400000	\N	10	\N	40000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200369	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:19:41.561047	\N	\N	\N	Wm. Gajah Mungkur Wonogiri Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
374	60	30	2	370	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200370	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:20:52.131201	\N	\N	\N	Wm. Mama Mila/Amang Nanang Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
375	58	30	2	371	2022	2022-09-01	2022-08-01	2022-08-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200371	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:22:03.69471	\N	\N	\N	Wm. Bakso Urat Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
376	45	30	2	372	2022	2022-09-01	2022-08-01	2022-08-31	250000	\N	10	\N	25000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200372	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:31:15.272143	\N	\N	\N	Wm. Pecal Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
377	46	30	2	373	2022	2022-09-01	2022-08-01	2022-08-31	750000	\N	10	\N	75000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200373	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:32:29.118249	\N	\N	\N	Wm. Punjer Roso Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
378	67	30	2	374	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200374	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:33:45.604012	\N	\N	\N	Wm. Mie Agung Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
379	63	30	2	375	2022	2022-09-01	2022-08-01	2022-08-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200375	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:34:44.975576	\N	\N	\N	Wm. Lalapan P Jhoen Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
380	48	30	2	376	2022	2022-09-01	2022-08-01	2022-08-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200376	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:36:30.88844	\N	\N	\N	Wm. Sate Ayam Suramadu Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
381	352	30	2	377	2022	2022-09-01	2022-08-01	2022-08-31	750000	\N	10	\N	75000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200377	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:37:17.844462	\N	\N	\N	Wm.Mama Mutia Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
382	52	30	2	378	2022	2022-09-01	2022-08-01	2022-08-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200378	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:38:10.836983	\N	\N	\N	Wm. Depot Mie Kenzie Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
383	9	30	2	379	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200379	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:48:53.740032	\N	\N	\N	Wm. Angelia B2 dan RW Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
384	14	30	2	380	2022	2022-09-01	2022-08-01	2022-08-31	300000	\N	10	\N	30000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200380	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:49:47.547302	\N	\N	\N	Wm. Samawa ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
385	40	30	2	381	2022	2022-09-01	2022-08-01	2022-08-31	600000	\N	10	\N	60000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200381	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:51:06.371825	\N	\N	\N	Wm. Rizky II Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
386	36	30	2	382	2022	2022-09-01	2022-08-01	2022-08-31	600000	\N	10	\N	60000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200382	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 11:52:23.137907	\N	\N	\N	Wm. Banjar I Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
387	37	30	2	383	2022	2022-09-01	2022-08-01	2022-08-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200383	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 12:00:04.421067	\N	\N	\N	Wm. Bariklana Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
388	41	30	2	384	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200384	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 12:01:09.822757	\N	\N	\N	Wm. Tombo Loi Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
389	30	30	2	385	2022	2022-09-01	2022-08-01	2022-08-31	700000	\N	10	\N	70000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200385	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 12:02:07.813637	\N	\N	\N	Wm. Syafi'i Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
390	33	30	2	386	2022	2022-09-01	2022-08-01	2022-08-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200386	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 12:02:58.281712	\N	\N	\N	Wm. Inayah Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
391	31	30	2	387	2022	2022-09-01	2022-08-01	2022-08-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200387	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 12:03:51.702083	\N	\N	\N	Wm. Wahyu Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
392	32	30	2	388	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200388	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 12:04:54.108161	\N	\N	\N	Wm. Banyuwangi Kaganangan Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
393	34	30	2	389	2022	2022-09-01	2022-08-01	2022-08-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200389	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 12:05:45.142417	\N	\N	\N	Wm. Mama Iwan Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
394	28	30	2	390	2022	2022-09-01	2022-08-01	2022-08-31	300000	\N	10	\N	30000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200390	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 12:06:38.105796	\N	\N	\N	Wm. Depot 95 Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
395	208	34	2	391	2022	2022-08-30	2022-08-01	2022-08-31	1375000	\N	10	\N	137500	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200391	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 12:43:24.954994	\N	\N	\N	Belanja Makanan dan minuman Rapat Koordinasi Pengisian dan pengecekan data air minum dan sanitasi dalam rangka penyusunan kebijakan dan strategi daerah sistem penyedian air minum ( Jakstrada SPAM)	Bappedalitbang	\N	\N	\N	\N	\N	\N	\N
396	208	34	2	392	2022	2022-08-30	2022-08-01	2022-08-31	1375000	\N	10	\N	137500	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200392	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 12:45:14.035296	\N	\N	\N	Belanja makanan dan minuman dan snack rapat tindak lanjut pecernaan peta indikatif tumpang tindih IGT ( PITTI )	Bappedalitbang	\N	\N	\N	\N	\N	\N	\N
397	68	30	2	393	2022	2022-08-31	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200393	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 13:02:56.827568	\N	\N	\N	Wm. Mie Ayam & Bakso Sragen/Suko Ub juli	-	\N	\N	\N	\N	\N	\N	\N
398	421	59	4	394	2022	2022-08-30	2022-08-25	2023-08-24	0	\N	\N	\N	26000	\N	\N	0	0	1	0	2022-08-30	20	1	\N	2022-09-29	621104022200394	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 13:04:46.437362	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
399	50	30	2	395	2022	2022-09-01	2022-08-01	2022-08-31	800000	\N	10	\N	80000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200395	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 13:12:37.640132	\N	\N	\N	Wm. Banyu Langit Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
400	5	30	2	396	2022	2022-09-01	2022-08-01	2022-08-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200396	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 13:13:44.253644	\N	\N	\N	Wm. Watta cafe Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
401	74	30	2	397	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200397	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 13:20:14.706772	\N	\N	\N	Wm,. Wei Wei Ub. Agustus 	-	\N	\N	\N	\N	\N	\N	\N
402	56	30	2	398	2022	2022-09-01	2022-08-01	2022-08-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200398	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 13:21:07.192546	\N	\N	\N	Wm. Lalapan Yan ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
403	39	30	2	399	2022	2022-09-01	2022-08-01	2022-08-31	700000	\N	10	\N	70000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200399	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 13:29:24.822783	\N	\N	\N	Wm. Ponorogo Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
404	418	30	2	400	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200400	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 13:31:48.90073	\N	\N	\N	Wm. Adelia ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
405	420	30	2	401	2022	2022-09-01	2022-08-01	2022-08-31	250000	\N	10	\N	25000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200401	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 13:32:41.179384	\N	\N	\N	Wm. 99 ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
406	417	30	2	402	2022	2022-09-01	2022-08-01	2022-08-31	600000	\N	10	\N	60000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200402	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 13:33:59.959441	\N	\N	\N	Wm. Mama Aida ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
407	416	30	2	403	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200403	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 13:34:55.091367	\N	\N	\N	Wm. Melati Kuin Ub.Agustus	-	\N	\N	\N	\N	\N	\N	\N
408	419	30	2	404	2022	2022-09-01	2022-08-01	2022-08-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200404	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 13:35:54.69183	\N	\N	\N	Wm. H idah Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
409	387	30	2	405	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200405	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 14:15:27.08289	\N	\N	\N	Wm. Sumber Barokah Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
410	35	30	2	406	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200406	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 14:16:34.55724	\N	\N	\N	Wm. Amanah Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
411	38	30	2	407	2022	2022-09-01	2022-08-01	2022-08-31	200000	\N	10	\N	20000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200407	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 14:17:42.105735	\N	\N	\N	Wm. Cak Li Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
412	6	30	2	408	2022	2022-09-01	2022-08-01	2022-08-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200408	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 14:18:43.811191	\N	\N	\N	Wm. Bakso Mentari ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
413	6	30	2	409	2022	2022-09-01	2022-08-01	2022-08-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200409	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 14:18:46.185104	\N	\N	\N	Wm. Bakso Mentari ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
414	29	30	2	410	2022	2022-09-01	2022-08-01	2022-08-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-09-30	621102012200410	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-09-01 14:19:54.705619	\N	\N	\N	Wm. Haswarga Ub. Agustus	-	\N	\N	\N	\N	\N	\N	\N
97	342	85	6	93	2022	2022-08-11	2022-07-01	2022-07-31	236950	\N	20	\N	47390	CV. RAJAKI PUTRA KAHAYAN	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200093	2	47390	192	2022-08-11	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:16:49.219114	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
104	225	34	2	100	2022	2022-08-10	2022-07-01	2022-07-31	6000000	\N	10	\N	600000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200100	2	600000	199	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 09:27:58.063573	\N	\N	\N	Belanja Makanan dan Minuman Rapat Kegiatan Peningkatan Kapasitas Kelembagaan Penyuluhan Pertanian di Kecamatan dan Desa	Dinas pertanian	\N	\N	\N	\N	\N	\N	\N
114	372	59	4	110	2022	2022-08-09	2022-08-09	2023-08-08	0	\N	\N	\N	30000	\N	\N	0	0	1	0	2022-08-09	13	1	\N	2022-09-08	621104022200110	2	30000	209	2022-08-09	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:07:26.058732	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N
118	375	85	6	114	2022	2022-08-10	2022-07-01	2022-07-31	808850	\N	20	\N	161770	Pemyelenggaraan Bangunan Gedung Wilayah Daerah Kabupaten/Kota Pemberian Izin Mendirikan Bangunan ( IMB ) KODIM 1011 KUALA KAPUAS	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621106012200114	2	161770	214	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 10:36:57.755028	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
323	342	85	6	319	2022	2022-08-30	2022-08-01	2022-08-31	396650	\N	20	\N	79330	Rehabilitasi Ruang Tata Usaha beserta Perabotnya SMPN-1 Kahayan Kuala	\N	0	0	5	0	\N	\N	0	\N	2022-09-30	621106012200319	2	79330	101	2022-09-01	125	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	0	\N	\N	\N	\N	0	2022-08-31 09:18:00.355207	\N	\N	\N	\N	\N	\N	\N	\N	1	601002610101071360	601002610101045360	123
2	211	34	2	1	2022	2022-08-02	2022-08-02	2022-09-01	7125000	\N	10	\N	712500	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200001	2	712500	102	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-16 10:24:21.556358	\N	\N	\N	Belanja Makan Minum Rapat NO. STS 02117	DISHUB	\N	\N	\N	\N	\N	\N	\N
11	57	30	2	7	2022	2022-08-16	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200007	2	50000	107	2022-09-16	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-18 10:36:20.140567	\N	\N	\N	Wm. Reformasi ub juli	-	\N	\N	\N	\N	\N	\N	\N
20	35	30	2	16	2022	2022-08-23	2022-07-01	2022-07-31	500000	\N	10	\N	50000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-08-30	621102012200016	2	50000	116	2022-08-23	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-23 12:18:09.469598	\N	\N	\N	Ub.Juli WM.Amanah	-	\N	\N	\N	\N	\N	\N	\N
30	9	30	2	26	2022	2022-08-02	2022-06-01	2022-06-30	500000	\N	10	\N	50000	\N	\N	0	0	17	0	\N	\N	0	\N	2022-07-30	621102012200026	2	50000	125	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:34:25.242876	\N	\N	\N	Ub. Juni WM.Angelia B2 dan RW	-	\N	\N	\N	\N	\N	\N	\N
37	225	34	2	33	2022	2022-08-03	2022-08-02	2022-08-02	3930000	\N	10	\N	393000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200033	2	393000	132	2022-08-03	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 09:49:28.350808	\N	\N	\N	Belaja Natura dan Pakan natura Kegiatan Fasilitas kunjungan tamu pada catering Inang Pulang Pisau	Dinas Pertanian	\N	\N	\N	\N	\N	\N	\N
44	71	30	2	40	2022	2022-08-24	2022-07-01	2022-07-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200040	2	100000	138	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:35:11.847771	\N	\N	\N	Wm. Soponyono B Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
52	70	30	2	48	2022	2022-08-24	2022-07-01	2022-07-31	1000000	\N	10	\N	100000	\N	\N	0	0	1	0	\N	\N	0	\N	2022-08-30	621102012200048	2	100000	146	2022-08-24	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 10:47:34.171516	\N	\N	\N	Wm. Soponyono A Ub. Juli	-	\N	\N	\N	\N	\N	\N	\N
60	3	34	2	56	2022	2022-08-08	2022-08-01	2022-08-31	8082000	\N	10	\N	808200	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200056	2	808200	152	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 11:15:54.869194	\N	\N	\N	Pembayaran Biaya Belanja Makan dan minum Kegiatan pelatihan Pengelolaan Pengembangan dan Manajemen Bisnis Potensi Biji Kopi	Disperindagkop & UKM	\N	\N	\N	\N	\N	\N	\N
75	6	30	2	71	2022	2022-08-03	2022-06-01	2022-06-30	1000000	\N	10	\N	100000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-07-30	621102012200071	2	100000	169	2022-08-03	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 14:00:03.597279	\N	\N	\N	Wm. Bakso Mentari Ub, Juni	-	\N	\N	\N	\N	\N	\N	\N
78	35	30	2	74	2022	2022-08-08	2022-06-01	2022-06-30	500000	\N	10	\N	50000	\N	\N	0	0	5	0	\N	\N	0	\N	2022-07-30	621102012200074	2	50000	172	2022-08-08	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-24 14:50:39.884726	\N	\N	\N	Wm. Amanah Ub. Juni	-	\N	\N	\N	\N	\N	\N	\N
86	236	34	2	82	2022	2022-08-12	2022-04-01	2022-04-30	2502000	\N	10	\N	250200	\N	\N	0	0	3	0	\N	\N	0	\N	\N	621102012200082	2	250200	180	2022-08-12	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 08:58:54.416298	\N	\N	\N	Pembayaran makanan dan minuman No. STS. 2273	Disperindagkop	\N	\N	\N	\N	\N	\N	\N
132	382	34	2	128	2022	2022-08-10	2022-07-01	2022-07-31	2450000	\N	10	\N	245000	\N	\N	0	0	1	0	\N	\N	0	\N	\N	621102012200128	2	245000	229	2022-08-10	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 11:20:27.623162	\N	\N	\N	Pembelian Makanan dan Minuman Rapat Kegiatan Pelaksanaan Reses Anggota DPRD Kab. Pulang Pisau	Sekretariat DPRD	\N	\N	\N	\N	\N	\N	\N
146	221	34	2	142	2022	2022-08-02	2022-07-12	2022-07-12	93500000	\N	10	\N	9350000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200142	2	9350000	242	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 15:03:23.612344	\N	\N	\N	Belanja Makan dan Snack	Dinas Bappedalitbang	\N	\N	\N	\N	\N	\N	\N
149	225	34	2	145	2022	2022-08-02	2022-06-30	2022-06-30	16500000	\N	10	\N	1650000	\N	\N	0	0	17	0	\N	\N	0	\N	\N	621102012200145	2	1650000	245	2022-08-02	39	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2022-08-25 15:12:36.988106	\N	\N	\N	Belanja Makan Koordinasi Penyusunan Profil Pembangunan 	Dinas Bappedalitbang	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: t_wp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_wp (t_idwp, t_tgldaftar, t_jenispendaftaran, t_bidangusaha, t_nopendaftaran, t_nik, t_nama, t_alamat, t_rt, t_rw, t_kelurahan, t_kecamatan, t_kelurahanluar, t_kecamatanluar, t_kabupaten, t_notelp, t_kodepos, t_email, t_operatorid, is_deluser, t_nama_badan, t_jalan_badan, t_rt_badan, t_rw_badan, t_kecamatan_badan, t_kelurahan_badan, t_kabupaten_badan, t_kecamatan_badan_luar, t_kelurahan_badan_luar, t_status_wp, t_tgl_tutup, t_ket_tutup, t_operatorid_tutup, t_noberita, t_tgl_buka, t_ket_buka, t_operatorid_buka, t_noberita_buka, t_photowp) FROM stdin;
2	2022-01-01	P	1	2	2	RM. Candi Laras 	Jl. Lintas Kalimantan Desa Anjir Pulang Pisau 	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	2022-01-01	P	1	3	3	RM. Anni	Jl. Lintas Kalimantan Desa Anjir Pulang Pisau 	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	2022-01-01	P	1	5	5	WM. Watta Cafe	Jl. Abel Gawei Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	2022-01-01	P	1	6	6	WM. Bakso Mentari 	Jl. Darung Bawan Desa Anjir	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	2022-01-01	P	1	7	7	RM. 99	Jl. Lintas Kalimantan 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	2022-01-01	P	1	8	8	WM. Adelia	Jl. Lintas Kalimantan 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	2022-01-01	P	1	9	9	WM. Angelia B2 dan RW	Jl. Lintas Kalimantan 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	2022-01-01	P	1	11	11	WM. Aulia	Jl. Lintas Kalimantan Desa Anjir	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	2022-01-01	P	1	12	12	WM. H. Idah 	Jl. Lintas Kalimantan Desa Anjir	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	2022-01-01	P	1	14	14	WM. Samawa	Jl. Lintas Kalimantan Desa Anjir	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	2022-01-01	P	1	15	15	WM. Abah Mirhan 	Jl. Lintas Kalimantan Desa Anjir P. Pisau 	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	2022-01-01	P	1	16	16	WM. Borneo	Jl. Lintas Kalimantan Desa Anjir P. Pisau 	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	2022-01-01	P	1	17	17	WM. Mama Nisa	Jl. Lintas Kalimantan Desa Anjir P. Pisau 	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	2022-01-01	P	1	18	18	WM. Wong Jogja	Jl. Lintas Kalimantan Desa Anjir P. Pisau 	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	2022-01-01	P	1	19	19	WM. Al - Mira	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	95	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	2022-01-01	P	1	20	20	WM. Banjar Sari	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	95	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	2022-01-01	P	1	21	21	WM. Hafizah	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	95	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	2022-01-01	P	1	22	22	WM. Hayati	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	95	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	2022-01-01	P	1	23	23	WM. Mama Angga	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	95	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	2022-01-01	P	1	24	24	WM. Mama Dia/Dika	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	95	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	2022-01-01	P	1	25	25	WM. Mama Sidik	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	95	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	2022-01-01	P	1	26	26	WM. Nani	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	95	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	2022-01-01	P	1	27	27	WM. Reihan RGL 30	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	95	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	2022-01-01	P	1	28	28	WM. Depot 95 ( Bakso dan Mie Ayam )	Jl. Lintas Kalimantan Desa Mantaren I P. Pisau 	0  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	2022-01-01	P	1	29	29	WM. Haswarga	Jl. Lintas Kalimantan Desa Mantaren I P. Pisau 	0  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	2022-01-01	P	1	30	30	WM. Syafi'i	Jl. Lintas Kalimantan Desa Mantaren II P. Pisau 	0  	0  	91	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	2022-01-01	P	1	31	31	WM. Wahyu	Jl. Lintas Kalimantan Desa Mantaren II P. Pisau 	0  	0  	91	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	2022-01-01	P	1	32	32	WM. Banyuwangi Kaganangan 	Jl. Lintas Kalimantan Desa Mintin 	0  	0  	90	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	2022-01-01	P	1	33	33	WM. Inayah 	Jl. Lintas Kalimantan Desa Mintin 	0  	0  	90	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	2022-01-01	P	1	34	34	WM. Mama Iwan 	Jl. Lintas Kalimantan Desa Mintin 	0  	0  	90	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	2022-01-01	P	1	35	35	WM. Amanah 	Jl. Lintas Kalimantan P. Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	2022-01-01	P	1	36	36	WM. Banjar I	Jl. Lintas Kalimantan P. Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	2022-01-01	P	1	37	37	WM. Bariklana	Jl. Lintas Kalimantan P. Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	2022-01-01	P	1	38	38	WM. Cak Li 	Jl. Lintas Kalimantan P. Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	2022-01-01	P	1	39	39	WM. Ponorogo	Jl. Lintas Kalimantan P. Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	2022-01-01	P	1	40	40	WM. Rizky II	Jl. Lintas Kalimantan P. Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	2022-01-01	P	1	41	41	WM. Tombo Loi	Jl. Lintas Kalimantan P. Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	2022-01-01	P	1	42	42	WM. Ayam Geprek Mama Ifit	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	2022-01-01	P	1	43	43	WM. Habibi	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	2022-01-01	P	1	44	44	WM. Mama Nia	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	2022-01-01	P	1	45	45	WM. Pecal	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	2022-01-01	P	1	46	46	WM. Punjer Roso 	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	2022-01-01	P	1	47	47	WM. Rahmah	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	2022-01-01	P	1	50	50	WM. Banyu Langit 	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	2022-01-01	P	1	10	10	WM. Sumber Barokah	Jl. Lintas Kalimantan 	0  	0  	93	5			PULANG PISAU	0			3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	2022-01-01	P	1	51	51	WM. Café & Resto Bunda 08	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	2022-01-01	P	1	53	53	WM. Jowo 	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	2022-01-01	P	1	54	54	WM. Syahrini	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	2022-01-01	P	1	55	55	WM. Tamban	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	2022-01-01	P	1	56	56	WM. Lalapan Yan	Jl. Perintis Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	2022-01-01	P	1	57	57	WM. Reformasi	Jl. Perintis Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
59	2022-01-01	P	1	59	59	WM. Gajah Mungkur Wonogiri	Jl. Tingang Menteng Kel. Pulang Pisau	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	2022-01-01	P	1	60	60	WM. Mama Mila/ Amang Nanang	Jl. Tingang Menteng Kel. Pulang Pisau	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	2022-01-01	P	1	61	61	WM. Al - Hurri	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	2022-01-01	P	1	62	62	WM. Esa	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	2022-01-01	P	1	63	63	WM. Lalapan P. Jhoen	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	2022-01-01	P	1	64	64	WM. Mama Ebi	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
65	2022-01-01	P	1	65	65	WM. Mama Hairin	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
66	2022-01-01	P	1	66	66	WM. Mekar Arum	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	2022-01-01	P	1	67	67	WM. Mie Agung 99	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	2022-01-01	P	1	68	68	WM. Mie Ayam & Bakso Sragen	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	2022-01-01	P	1	69	69	WM. Pasundan	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	2022-01-01	P	1	70	70	WM. Soponyono A	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	2022-01-01	P	1	71	71	WM. Soponyono B	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	2022-01-01	P	1	72	72	WM. Tenda Biru	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	2022-01-01	P	1	73	73	WM. Usun H Ayus	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
74	2022-01-01	P	1	74	74	WM. Wei Wei	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
75	2022-01-01	P	1	75	75	 Karaoke Yanti	 Kelurahan  Kalawa Kec. Kahayan Hilir 	0  	0  	53	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	2022-01-01	P	1	76	76	 Karaoke Semarang 	 Jl. Saka Payung RT. 01 Kel. Kalawa	1  	0  	53	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	2022-01-01	P	1	77	77	 Karaoke Ken Lia / Enzie	 Jl. Saka Payung RT. 01 Kel. Kalawa	1  	0  	53	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	2022-01-01	P	1	78	78	Tan Toen Ping	Jl. Poros Palangka Desa Gadabung Kec. Pandih Batu	0  	0  	23	1	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	2022-01-01	P	1	79	79	Tinarto	Desa Gohong Kec. Kahayan Hilir	0  	0  	95	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
80	2022-01-01	P	1	80	80	Toto Wiratmoko 	Desa mandomai	0  	0  	0	0	Mandomai	Kapuas Barat		0	\N	\N	2	\N	\N	\N	\N	\N	0	0	KAPUAS	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
81	2022-01-01	P	1	81	81	Harsanto	Jl. Kuripan No. 62 RT. 06 Kuripan Banjarmasin Timur	6  	0  	0	0	Kuripan	Banjarmasin Timur		0	\N	\N	2	\N	\N	\N	\N	\N	0	0	BANJARMASIN	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	2022-01-01	P	1	82	82	Herawati	Jl. Darung Bawan Km. XII Anjir Pulang Pisau 	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
83	2022-01-01	P	1	83	83	Anugerah Mulya	Jl. Tajahan Antang RT. 01 Kelurahan Bereng	1  	0  	57	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	2022-01-01	P	1	84	84	Apotek " Haikal"	Jl. Tingang Menteng RT. 01 Kel. Pulang Pisau 	1  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
85	2022-01-01	P	1	85	85	Toko Hanafi	Jl. Abel Gawei Blok B No. 46 RT. 15 Desa Anjir Komp. BTN Marina Permai 	15 	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
86	2022-01-01	P	1	86	86	Kios Harapan Bersama	Jl. Ahmad Yani RT. 02 RW. 01 Desa Sebangau Permai	2  	1  	43	8	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
87	2022-01-01	P	1	87	87	Kios Naila	Jl. Ardi Tanang RT. 05 RW. 02 Kel. Bahaur Basantan	5  	2  	4	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
88	2022-01-01	P	1	88	88	Pangkalan Gas LPG 3 Kg (PSO)	Jl. Bromo RT. 01 RT. 03 Desa Gandang Kec. Maliku 	1  	3  	7	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
89	2022-01-01	P	1	89	89	Pangkalan Gas LPG 3 Kg " Batuah "	Jl. Dambung Enes Tiup RT. 02 Desa Pamarunan Kec. Kahayan Tengah 	2  	0  	83	3	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
90	2022-01-01	P	1	90	90	Bengkel Fit Motor	Jl. Darung Bawan Desa Anjir	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
91	2022-01-01	P	1	91	91	Katering Imam & Dapur Mama Tevin	Jl. Darung Bawan Rt. 09 Desa Anjir Pulang Pisau 	9  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
93	2022-01-01	P	1	93	93	Pangkalan LPG Batu Raya	Jl. Desa Bahaur Batu Raya RT. 03	3  	0  	6	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
94	2022-01-01	P	1	94	94	Kios Norhayati	Jl. Desa Bahaur Hilir  Desa Bahaur Hilir	0  	0  	38	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
95	2022-01-01	P	1	95	95	Kios Nanda	Jl. Desa Bahaur Hilir  RT. 02 Desa Bahaur Hilir	2  	0  	38	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
96	2022-01-01	P	1	96	96	Pangkalan LPG 3 Kg Andra	Jl. Desa Bahaur Hilir RT. 04	4  	0  	38	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
238	2022-01-01	P	1	238	238	Wong Solo 	Kuala Kapuas	0  	0  	0	0	Kapuas	Kapuas	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	2022-01-01	P	1	97	97	Apotik " Telu Pahari "	Jl. Lintas Kalimantan Km. 24 RT. 01 Desa Mintin	1  	0  	90	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
98	2022-01-01	P	1	98	98	Kios M Fazri Nor	Jl. Lintas Kalimantan RT. 03 Desa Mintin	3  	0  	90	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
99	2022-01-01	P	1	99	99	Toko Shohibah	Jl. Lintas Kalimantan RT. 06 Desa Mantaren I	6  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
100	2022-01-01	P	1	100	100	Kios " Berkat Tasidi "	Jl. Lintas Kalimantan RT. 07 Desa Jabiren 	7  	0  	50	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
101	2022-01-01	P	1	101	101	Toko Obat " Naufal Alfakih "	Jl. Lintas Palangkaraya - Bahaur RT. 012 Desa Kanamit	12 	0  	12	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
102	2022-01-01	P	1	102	102	Toko Obat " Tito "	Jl. Lintas Palangkaraya - Bahaur RT. 08 Desa Kanamit	8  	0  	12	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
103	2022-01-01	P	1	103	103	Toko Ubat " Irfan "	Jl. Lintas Palangkaraya - Kuala Kurun RT. 01 Desa Pangi	1  	0  	73	4	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
104	2022-01-01	P	1	104	104	Toko Obat Berijin Aina	Jl. Lintas Praya - Bahaur RT. 07 Desa Maliku Baru	7  	0  	99	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
105	2022-01-01	P	1	105	105	Kios Muhidin	Jl. Maliku Permai RT. 01 RW. 03 Desa Maliku Baru	1  	0  	99	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
106	2022-01-01	P	1	106	106	Pangkalan Gas LPG  " Sumber Rezeki "	Jl. Musi RT. 10 RW. 05 Desa Tahai Baru Kec. Maliku 	10 	5  	99	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
107	2022-01-01	P	1	107	107	Kios Tasik	Jl. Ngambun Hawun RT. 03 Kel. Bereng Kec. Kahayan Hilir	3  	0  	57	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
108	2022-01-01	P	1	108	108	Penginapan Indah 	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
109	2022-01-01	P	1	109	109	Toko Kahayan Jaya 	Jl. Pahlawan Ucun RT. 03 Desa Gohong Kec. Kahayan Hilir	3  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
110	2022-01-01	P	1	110	110	Kios Ridho Arjun	Jl. Pelita RT. 04 RW. 02 Maliku Mulya Desa Maliku Baru	4  	2  	99	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	2022-01-01	P	1	111	111	Maju Mandiri 	Jl. Perjuangan RT.01 RW. 01 Desa Sei Pudak	1  	1  	33	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
112	2022-01-01	P	1	112	112	Pangkalan LPG 3 Kg Abirra	Jl. Sapilah RT. 04 Desa Bahaur Hulu 	4  	0  	40	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
113	2022-01-01	P	1	113	113	Pangkalan LPG 3 Kg Tara	Jl. Sapilah RT. 04 Desa Bahaur Hulu Permai	4  	0  	3	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
114	2022-01-01	P	1	114	114	Toko Sembako Siti Nurbaya	Jl. STI Pelabuhan Sawit RT. 06	6  	0  	0	0	Mandomai	Kapuas Barat	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
115	2022-01-01	P	1	115	115	Koperasi " Kartika Jaya " 	Jl. Tingang Menteng No. 136 RT. 09 Kel. Pulang Pisau 	9  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
116	2022-01-01	P	1	116	116	Fotocopy Kawanku	Jl. WAD. Duha RT. 06 Komp. Perkantoran No. 39 Desa Mantaren I	6  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
117	2022-01-01	P	1	117	117	Berlin I Rahu	Desa Jabiren	0  	0  	50	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
118	2022-01-01	P	1	118	118	Arafik	Desa Pilang 	0  	0  	51	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
119	2022-01-01	P	1	119	119	Hery	Desa Pilang 	0  	0  	51	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
120	2022-01-01	P	1	120	120	Ahmad Mustafa	Desa Pilang 	0  	0  	51	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
121	2022-01-01	P	1	121	121	Erlinawati Tarung 	Desa Pilang 	0  	0  	51	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
122	2022-01-01	P	1	122	122	Adi Ijon Usin	Desa Tumbang Nusa	0  	0  	52	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
123	2022-01-01	P	1	123	123	Nor Hasanah	Desa Tumbang Nusa	0  	0  	52	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
124	2022-01-01	P	1	124	124	Sintong 	Desa Tumbang Nusa	0  	0  	52	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
125	2022-01-01	P	1	125	125	Edwin Rangga	Desa Tumbang Nusa	0  	0  	52	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
126	2022-01-01	P	1	126	126	Reza Vahlefi	Desa Tumbang Nusa Kec. Jabiren Raya	0  	0  	52	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
128	2022-01-01	P	1	128	128	SDN Pulang Pisau - 1 	 Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
129	2022-01-01	P	1	129	129	PKK Kahayan Tengah 	Bukit Rawi	0  	0  	77	3	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
130	2022-01-01	P	1	130	130	WM. Wiwin	Bukit Rawi	0  	0  	77	3	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
131	2022-01-01	P	1	131	131	Kantin Sekolah Palapa SDN Badirih I	Desa Badirih Kec. Maliku	0  	0  	11	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
132	2022-01-01	P	1	132	132	Evi Catering 	Desa Bahaur	0  	0  	39	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
133	2022-01-01	P	1	133	133	WM. Tama	Desa Bahaur Hilir	0  	0  	38	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
134	2022-01-01	P	1	134	134	Warung Sembako " Mangat " 	Desa Bahu Palawa	0  	0  	82	3	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
135	2022-01-01	P	1	135	135	Catering Regariansi	Desa Bawan	0  	0  	70	4	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
136	2022-01-01	P	1	136	136	Pokdarwis	Desa Bukit Liti	0  	0  	81	3	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
137	2022-01-01	P	1	137	137	WM. Edo	Desa Bukit Rawi	0  	0  	77	3	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
265	2022-01-01	P	2	265	265	UD. Syalom	Jl SDN Kalawa i No. 22 RT. 05 Kel. Kalawa	5  	0  	53	5	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Syalom	Jl SDN Kalawa i No. 22 RT. 05 Kel. Kalawa	5  	0  	5	53	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
267	2022-01-01	P	2	267	267	PT. Bhakti Idola Tama	Jl. A. Yani Km. 8.4 Komp. Persada Mas Roko 7-8 RT. 10 Banjar	0  	0  	0	0	Martapura	Banjar	Banjar		\N	\N	0	\N	PT. Bhakti Idola Tama	Jl. A. Yani Km. 8.4 Komp. Persada Mas Roko 7-8 RT. 10 Banjar	0  	0  	0	0	Banjar	Banjar	Martapura	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
268	2022-01-01	P	2	268	268	UD. Mararin Jaya	Jl. Ahmad Yani  RT. 04 RW. 01 Desa Gandang Barat 	4  	1  	55	6	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Mararin Jaya	Jl. Ahmad Yani  RT. 04 RW. 01 Desa Gandang Barat 	4  	1  	6	55	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
269	2022-01-01	P	2	269	269	CV. Wiratama	Jl. Ahmad Yani No. 27 RT. 21 RW. 08 Ketapang 	4  	1  	55	6	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Wiratama	Jl. Ahmad Yani No. 27 RT. 21 RW. 08 Ketapang 	4  	1  	6	55	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
270	2022-01-01	P	2	270	270	CV. Sumber Jaya Mandiri	Jl. Ardi Tanang RT. 02 RW. 01 Desa Tanjung Perawan	2  	1  	60	2	\N	\N			\N	\N	0	\N	CV. Sumber Jaya Mandiri	Jl. Ardi Tanang RT. 02 RW. 01 Desa Tanjung Perawan	2  	1  	2	60	0	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
271	2022-01-01	P	2	271	271	CV. Fajar Bersinar	Jl. Bakti No Kavling 22 RT. 32 RW. 004 Banjarmasin Selatan	32 	4  	0	0	Banjarmasin Selatan	Banjarmasin Selatan	Banjarmasin		\N	\N	0	\N	CV. Fajar Bersinar	Jl. Bakti No Kavling 22 RT. 32 RW. 004 Banjarmasin Selatan	32 	4  	0	0	Banjarmasin	Banjarmasin Selatan	Banjarmasin Selatan	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
272	2022-01-01	P	2	272	272	CV. Makmur Jaya Perkasa	Jl. Barito III RT. 08 RW. 03 Desa Balanti Siam	8  	3  	19	1	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Makmur Jaya Perkasa	Jl. Barito III RT. 08 RW. 03 Desa Balanti Siam	8  	3  	1	19	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
273	2022-01-01	P	2	273	273	UD. Yasmin	Jl. Budal Laju No. 14 RT. 01 Desa Goha	14 	1  	69	4	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Yasmin	Jl. Budal Laju No. 14 RT. 01 Desa Goha	14 	1  	4	69	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
274	2022-01-01	P	2	274	274	UD. Sumber Mulia	Jl. Cilik Riwut No. 89 RT. 01 Desa Bukit Liti	1  	0  	81	3	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Sumber Mulia	Jl. Cilik Riwut No. 89 RT. 01 Desa Bukit Liti	1  	0  	3	81	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
275	2022-01-01	P	2	275	275	CV. Lampayung Persada 	Jl. Darung Bawan  RT. 01 Kel. Pulang Pisau Kec. Kahayan Hilir	1  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Lampayung Persada 	Jl. Darung Bawan  RT. 01 Kel. Pulang Pisau Kec. Kahayan Hilir	1  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
276	2022-01-01	P	2	276	276	CV. Sinar Pagi	Jl. Darung Bawan Gg. Hidrah No. 13 RT. 13 Desa Anjir	13 	0  	94	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Sinar Pagi	Jl. Darung Bawan Gg. Hidrah No. 13 RT. 13 Desa Anjir	13 	0  	5	94	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
277	2022-01-01	P	2	277	277	CV. Bumi Tehang Lestari	Jl. Darung Bawan KM. 13  Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Bumi Tehang Lestari	Jl. Darung Bawan KM. 13  Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
278	2022-01-01	P	2	278	278	PT. Ris Bend Glory	Jl. Darung Bawan KM. 13 RT. 02 Kel. Pulang Pisau 	2  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	PT. Ris Bend Glory	Jl. Darung Bawan KM. 13 RT. 02 Kel. Pulang Pisau 	2  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
279	2022-01-01	P	2	279	279	CV. Garantung Jaya	Jl. Darung Bawan Rt. 02 Kel. Pulang Pisau 	2  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Garantung Jaya	Jl. Darung Bawan Rt. 02 Kel. Pulang Pisau 	2  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
280	2022-01-01	P	2	280	280	CV. Febi Putri Pratama	Jl. Darung Bawan RT. 10 Desa Anjir Pulang Pisau 	10 	0  	94	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Febi Putri Pratama	Jl. Darung Bawan RT. 10 Desa Anjir Pulang Pisau 	10 	0  	5	94	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
281	2022-01-01	P	2	281	281	CV. Abdi Jaya Perkasa	Jl. Desa Bahaur Hulu RT. 06 Desa Bahaur Hulu	6  	0  	40	2	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Abdi Jaya Perkasa	Jl. Desa Bahaur Hulu RT. 06 Desa Bahaur Hulu	6  	0  	2	40	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
282	2022-01-01	P	2	282	282	UD. Tunggal Bawi	Jl. Desa Bawan RT. 05 Desa Bawan	5  	0  	70	4	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Tunggal Bawi	Jl. Desa Bawan RT. 05 Desa Bawan	5  	0  	4	70	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
283	2022-01-01	P	2	283	283	UD. Kurnia Usaha	Jl. Desa Cemantan RT. 01 Desa Cemantan 	1  	0  	32	2	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Kurnia Usaha	Jl. Desa Cemantan RT. 01 Desa Cemantan 	1  	0  	2	32	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
284	2022-01-01	P	2	284	284	UD. Putra Tunggal	Jl. Desa Tambak RT. 01 Desa Tambak Kec. Banama Tingang 	1  	0  	67	4	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Putra Tunggal	Jl. Desa Tambak RT. 01 Desa Tambak Kec. Banama Tingang 	1  	0  	4	67	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
285	2022-01-01	P	2	285	285	CV. Rekatama Mulya Jasa	Jl. Durian RT. 05 RW. 01 Desa Tahai Baru Kec. Maliku	5  	1  	10	6	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Rekatama Mulya Jasa	Jl. Durian RT. 05 RW. 01 Desa Tahai Baru Kec. Maliku	5  	1  	6	10	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
286	2022-01-01	P	2	286	286	CV. Kabali Jaya	Jl. Folder RT. 05 Desa Mantaren I Kec. Kah. Hilir	5  	0  	92	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Kabali Jaya	Jl. Folder RT. 05 Desa Mantaren I Kec. Kah. Hilir	5  	0  	5	92	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
287	2022-01-01	P	2	287	287	CV. Betang Pambelum Utama	Jl. Hantasan Raya RT. 02 Kel. Pulang Pisau 	2  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Betang Pambelum Utama	Jl. Hantasan Raya RT. 02 Kel. Pulang Pisau 	2  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
288	2022-01-01	P	2	288	288	CV. Harapan Jaya	Jl. Imam Bonjol RT. 01 RW. 01 Desa Kanamit Barat 	1  	1  	15	6	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Harapan Jaya	Jl. Imam Bonjol RT. 01 RW. 01 Desa Kanamit Barat 	1  	1  	6	15	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
289	2022-01-01	P	2	289	289	CV. Muara Sami	Jl. Jalawat No. 20 Perum Betang Raya	0  	0  	0	0	Sampit	Sampit	Sampit		\N	\N	0	\N	CV. Muara Sami	Jl. Jalawat No. 20 Perum Betang Raya	0  	0  	0	0	Sampit	Sampit	Sampit	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
138	2022-01-01	P	1	138	138	Warung Makan Dan Kue Mey Mey	Desa Bukit Rawi	0  	0  	77	3	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
139	2022-01-01	P	1	139	139	Kedemangan Kahayan Tengah	Desa Bukit Rawi	0  	0  	77	3	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
140	2022-01-01	P	1	140	140	Catering Sahai Tambi Balu	Desa Bulit Rawi	0  	0  	77	3	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
141	2022-01-01	P	1	141	141	SDN Dandanng - 3 	Desa Dandang 	0  	0  	17	1	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
142	2022-01-01	P	1	142	142	Warung Mba Wati	Desa Garantung Kec. Maliku	0  	0  	8	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
319	2022-01-01	P	2	319	319	UD. Justin	Jl. Nusa Indah VII RT. 07 RT. 02 Desa Tahai Jaya	7  	0  	9	6	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Justin	Jl. Nusa Indah VII RT. 07 RT. 02 Desa Tahai Jaya	7  	0  	6	9	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
291	2022-01-01	P	2	291	291	PT. Kahayan Berseri	Jl. Lintas Kalimantan Km. 71RT. 01 Desa Garung 	1  	0  	49	7	\N	\N	PULANG PISAU		\N	\N	0	\N	PT. Kahayan Berseri	Jl. Lintas Kalimantan Km. 71RT. 01 Desa Garung 	1  	0  	7	49	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
292	2022-01-01	P	2	292	292	UD. Berkah Andy	Jl. Lintas Kalimantan RT. 02 Desa Mantaren II	2  	0  	91	5	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Berkah Andy	Jl. Lintas Kalimantan RT. 02 Desa Mantaren II	2  	0  	5	91	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
293	2022-01-01	P	2	293	293	UD 3 Pahari 	Jl. Lintas Kalimantan RT. 03 Desa Anjir Pulang Pisau	3  	0  	94	5	\N	\N	PULANG PISAU		\N	\N	0	\N	UD 3 Pahari 	Jl. Lintas Kalimantan RT. 03 Desa Anjir Pulang Pisau	3  	0  	5	94	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
294	2022-01-01	P	2	294	294	CV. Cipta Jaya	Jl. Lintas Kalimantan RT. 03 Desa Mantaren II	3  	0  	91	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Cipta Jaya	Jl. Lintas Kalimantan RT. 03 Desa Mantaren II	3  	0  	5	91	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
295	2022-01-01	P	2	295	295	CV. Nucleus	Jl. Lintas Kalimantan RT. 03 Desa Mintin Kec. Kahayan Hilir	3  	0  	90	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Nucleus	Jl. Lintas Kalimantan RT. 03 Desa Mintin Kec. Kahayan Hilir	3  	0  	5	90	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
296	2022-01-01	P	2	296	296	UD. Dodo Bersaudara	Jl. Lintas Kalimantan RT. 04 Desa Mintin	4  	0  	90	5	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Dodo Bersaudara	Jl. Lintas Kalimantan RT. 04 Desa Mintin	4  	0  	5	90	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
297	2022-01-01	P	2	297	297	PT. Karya Halim Sampoerna	Jl. Lintas Kalimantan RT. 04 Desa Sakakajang 	4  	0  	97	7	\N	\N	PULANG PISAU		\N	\N	0	\N	PT. Karya Halim Sampoerna	Jl. Lintas Kalimantan RT. 04 Desa Sakakajang 	4  	0  	7	97	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
298	2022-01-01	P	2	298	298	CV. Teras Jaya	Jl. Lintas Kalimantan RT. 06 Desa Jabiren	6  	0  	50	7	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Teras Jaya	Jl. Lintas Kalimantan RT. 06 Desa Jabiren	6  	0  	7	50	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
299	2022-01-01	P	2	299	299	PT. Indomarco Prismatama	Jl. Lintas Kalimantan RT. 06 Desa Jabiren 	6  	0  	50	7	\N	\N	PULANG PISAU		\N	\N	0	\N	PT. Indomarco Prismatama	Jl. Lintas Kalimantan RT. 06 Desa Jabiren 	6  	0  	7	50	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
300	2022-01-01	P	2	300	300	UD. Abril	Jl. Lintas Kalimantan RT. 09 Desa Bahaur Tengah 	9  	0  	39	2	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Abril	Jl. Lintas Kalimantan RT. 09 Desa Bahaur Tengah 	9  	0  	2	39	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
301	2022-01-01	P	2	301	301	CV. Sumber Sari	Jl. Lintas Kalimantan RT. 14 Desa Anjir Pulang Pisau	14 	0  	94	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Sumber Sari	Jl. Lintas Kalimantan RT. 14 Desa Anjir Pulang Pisau	14 	0  	5	94	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
303	2022-01-01	P	2	303	303	PT. Rukmini Mandiri	Jl. Lintas P Raya - Bahaur RT. 25 RW. 05 Desa Purwodadi	25 	5  	13	6	\N	\N	PULANG PISAU		\N	\N	0	\N	PT. Rukmini Mandiri	Jl. Lintas P Raya - Bahaur RT. 25 RW. 05 Desa Purwodadi	25 	5  	6	13	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
304	2022-01-01	P	2	304	304	PT. Sukses Rama Jaya	Jl. Lintas P Raya - Kuala Kurun RT. 03 Desa Bukit Liti	3  	0  	81	3	\N	\N	PULANG PISAU		\N	\N	0	\N	PT. Sukses Rama Jaya	Jl. Lintas P Raya - Kuala Kurun RT. 03 Desa Bukit Liti	3  	0  	3	81	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
305	2022-01-01	P	2	305	305	CV. Karya Mandiri	Jl. Lintas P Raya - Kuala Kurun RT. 08 Desa Tangkahen 	8  	0  	74	4	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Karya Mandiri	Jl. Lintas P Raya - Kuala Kurun RT. 08 Desa Tangkahen 	8  	0  	4	74	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
306	2022-01-01	P	2	306	306	CV. Bersaudara Jaya	Jl. Lintas Palangkaraya - Bahaur RT. 08 Desa Maliku	8  	0  	98	6	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Bersaudara Jaya	Jl. Lintas Palangkaraya - Bahaur RT. 08 Desa Maliku	8  	0  	6	98	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
307	2022-01-01	P	2	307	307	UD. Harapan Jaya	Jl. Lintas Palangkaraya - Kuala Kurun RT. 01 Desa Penda Barania	1  	0  	76	3	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Harapan Jaya	Jl. Lintas Palangkaraya - Kuala Kurun RT. 01 Desa Penda Barania	1  	0  	3	76	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
308	2022-01-01	P	2	308	308	UD. Rambang	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 Desa Bereng Rambang	2  	0  	88	3	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Rambang	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 Desa Bereng Rambang	2  	0  	3	88	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
309	2022-01-01	P	2	309	309	UD. Rambang Hagatang	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 Desa Lawang Uru	2  	0  	63	4	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Rambang Hagatang	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 Desa Lawang Uru	2  	0  	4	63	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
310	2022-01-01	P	2	310	310	UD. Dohong Family	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 Desa Pahawan	2  	0  	68	4	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Dohong Family	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 Desa Pahawan	2  	0  	4	68	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
311	2022-01-01	P	2	311	311	UD. Tayo Gas	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 Desa Ramang	2  	0  	66	4	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Tayo Gas	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 Desa Ramang	2  	0  	4	66	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
312	2022-01-01	P	2	312	312	UD. Danum Mahasur	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 RW. 01 Desa Tuwung 	2  	0  	78	3	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Danum Mahasur	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 RW. 01 Desa Tuwung 	2  	0  	3	78	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
313	2022-01-01	P	2	313	313	UD. Ramang Hagatang	Jl. Lintas Palangkaraya - Kuala Kurun RT. 04 Desa Ramang 	4  	0  	66	4	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Ramang Hagatang	Jl. Lintas Palangkaraya - Kuala Kurun RT. 04 Desa Ramang 	4  	0  	4	66	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
314	2022-01-01	P	2	314	314	UD. Sinar Daha	Jl. Lonok Desa Paduran Sebangau 	0  	0  	48	8	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Sinar Daha	Jl. Lonok Desa Paduran Sebangau 	0  	0  	8	48	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
315	2022-01-01	P	2	315	315	UD. Harapan Baru	Jl. Martinus Manggang RT. 01 Desa Bukit Bamba	1  	0  	85	3	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Harapan Baru	Jl. Martinus Manggang RT. 01 Desa Bukit Bamba	1  	0  	3	85	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
316	2022-01-01	P	2	316	316	CV. Rafi'i	Jl. Masrumi Layar No. 15 RT. 02 Desa Anjir Pulang Pisau 	2  	0  	94	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Rafi'i	Jl. Masrumi Layar No. 15 RT. 02 Desa Anjir Pulang Pisau 	2  	0  	5	94	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
317	2022-01-01	P	2	317	317	CV. Karunia Jaya Perkasa	Jl. Masrumi Layar No. 40 RT. 08 Kel. Bereng Kec. Kahayan Hilir	8  	0  	57	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Karunia Jaya Perkasa	Jl. Masrumi Layar No. 40 RT. 08 Kel. Bereng Kec. Kahayan Hilir	8  	0  	5	57	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
318	2022-01-01	P	2	318	318	CV. Anugrah Perdana	Jl. Merdeka RT. 03 Desa Mantaren II	3  	0  	91	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Anugrah Perdana	Jl. Merdeka RT. 03 Desa Mantaren II	3  	0  	5	91	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
174	2022-01-01	P	1	174	174	Catering Edi Rahman	Desa Tangkahen 	0  	0  	74	4	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
321	2022-01-01	P	2	321	321	UD. Nicola	Jl. Pahlawan Ucun RT. 07 Desa Gohong 	7  	0  	95	5	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Nicola	Jl. Pahlawan Ucun RT. 07 Desa Gohong 	7  	0  	5	95	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
322	2022-01-01	P	2	322	322	UD. Sinar Logam	Jl. Panunjung Tarung RT. 07 Kel. Pulang Pisau 	7  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Sinar Logam	Jl. Panunjung Tarung RT. 07 Kel. Pulang Pisau 	7  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
323	2022-01-01	P	2	323	323	PT. Bank Pembangunan Daerah Kalteng	Jl. Panunjung Tarung RT. 12 Kel. Pulang Pisau 	12 	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	PT. Bank Pembangunan Daerah Kalteng	Jl. Panunjung Tarung RT. 12 Kel. Pulang Pisau 	12 	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
324	2022-01-01	P	2	324	324	CV. Putra Jaya Grup	Jl. Pejuang RT. 02 Desa Mantaren II Kec. Kahayan Hilir	2  	0  	91	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Putra Jaya Grup	Jl. Pejuang RT. 02 Desa Mantaren II Kec. Kahayan Hilir	2  	0  	5	91	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
325	2022-01-01	P	2	325	325	UD. Mekar Sari	Jl. Poros Elang RT. 17 RW. 04 Desa Garantung 	17 	4  	8	6	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Mekar Sari	Jl. Poros Elang RT. 17 RW. 04 Desa Garantung 	17 	4  	6	8	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
326	2022-01-01	P	2	326	326	PT. Sarana Sampit Mentaya Utama	Jl. Samudra No. 01 RT. 13 Kel. Pulang Pisau 	13 	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	PT. Sarana Sampit Mentaya Utama	Jl. Samudra No. 01 RT. 13 Kel. Pulang Pisau 	13 	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
327	2022-01-01	P	2	327	327	CV.  Bersama Mulia Jaya	Jl. Soka II RT. 02 RW. 01 Desa Kantan Muara Kec. Pandih Batu	2  	1  	31	1	\N	\N	PULANG PISAU		\N	\N	0	\N	CV.  Bersama Mulia Jaya	Jl. Soka II RT. 02 RW. 01 Desa Kantan Muara Kec. Pandih Batu	2  	1  	1	31	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
328	2022-01-01	P	2	328	328	UD. Mitra	Jl. Tajahan Antang RT. 02 Kelurahan Bereng	2  	0  	57	5	\N	\N	PULANG PISAU		\N	\N	0	\N	UD. Mitra	Jl. Tajahan Antang RT. 02 Kelurahan Bereng	2  	0  	5	57	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
329	2022-01-01	P	2	329	329	CV. Berkat Mufakat Jaya 	Jl. Tingang Menteng No. 01 RT. 011 Kel. Pulang Pisau 	11 	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Berkat Mufakat Jaya 	Jl. Tingang Menteng No. 01 RT. 011 Kel. Pulang Pisau 	11 	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
330	2022-01-01	P	2	330	330	CV. Harapan Ibu 	Jl. Tingang Menteng No. 11  Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Harapan Ibu 	Jl. Tingang Menteng No. 11  Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
143	2022-01-01	P	1	143	143	SMPN SA - 1 Kahayan Hilir Kantin Partini 	Desa Gohong Kec. Kahayan Hilir 	0  	0  	95	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
144	2022-01-01	P	1	144	144	Kantin SDN Hurung - 1 	Desa Hurung Kec. Banama Tingang	0  	0  	64	4	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
145	2022-01-01	P	1	145	145	RM. Ojo Lali 	Desa Jabiren	0  	0  	50	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
146	2022-01-01	P	1	146	146	Catering Nia	Desa Jabiren	0  	0  	50	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
147	2022-01-01	P	1	147	147	Kios Forland	Desa Jabiren 	0  	0  	50	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
148	2022-01-01	P	1	148	148	Kantin SDN Kanamit Jaya - 1 	Desa Kanamit Jaya Kec. Maliku	0  	0  	12	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
149	2022-01-01	P	1	149	149	PKK Desa Kiapak	Desa Kiapak	0  	0  	34	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
150	2022-01-01	P	1	150	150	Lando Catering 	Desa Maliku	0  	0  	99	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
151	2022-01-01	P	1	151	151	PKK Maliku 	Desa Maliku	0  	0  	99	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
152	2022-01-01	P	1	152	152	Kantin SDN Maliku Baru 0 4 	Desa Maliku Baru	0  	0  	99	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
153	2022-01-01	P	1	153	153	WM. Lisa	Desa Maliku Baru	0  	0  	99	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
154	2022-01-01	P	1	154	154	Warung Bulek	Desa Maliku Baru	0  	0  	99	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
155	2022-01-01	P	1	155	155	SMPN - 3 Maliku	Desa Maliku Baru	0  	0  	99	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
156	2022-01-01	P	1	156	156	SDN Trisari - 1 	Desa Manatren I	0  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
157	2022-01-01	P	1	157	157	Toko Agung 	Desa Mantaren I	0  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
158	2022-01-01	P	1	158	158	Catering Lula	Desa Mantaren I	0  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
159	2022-01-01	P	1	159	159	Catering Yuliana	Desa Mantaren I	0  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
160	2022-01-01	P	1	160	160	SMPN - 2 Kahayan Hilir	Desa Mintin	0  	0  	90	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
161	2022-01-01	P	1	161	161	Kantin SDN Paduran Mulya	Desa Paduran Mulya Kec. Sabangau	0  	0  	47	8	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
162	2022-01-01	P	1	162	162	WM. Masturi	Desa Pangkoh Hilir	0  	0  	20	1	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
163	2022-01-01	P	1	163	163	PKK Desa Pangkoh Sari	Desa Pangkoh Sari	0  	0  	26	1	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
164	2022-01-01	P	1	164	164	SMPN - 4 Pandih Batu ( Kantin Hana )	Desa Pangkoh VIII Kec. Pandih Batu	0  	0  	26	1	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
165	2022-01-01	P	1	165	165	Toko Faisal	Desa Pilang Kec. Jabiren Raya	0  	0  	51	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
167	2022-01-01	P	1	167	167	Catering Sumber Rezeki	Desa Sebangau Permai	0  	0  	43	8	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
168	2022-01-01	P	1	168	168	Catering Herawati	Desa Sebangau Permai	0  	0  	43	8	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
169	2022-01-01	P	1	169	169	Warung Mama Sundari	Desa Sebangau Permai	0  	0  	43	8	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
170	2022-01-01	P	1	170	170	Warung Indri	Desa Tahai Jaya	0  	0  	9	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
171	2022-01-01	P	1	171	171	Kantin Sekolah SDN Tahai Jaya 2	Desa Tahai Jaya Kec. Maliku	0  	0  	9	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
166	2022-01-01	P	1	166	166	Kantin SDN Saka Kajang - 1	Desa Saka Kajang	0  	0  	97	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
172	2022-01-01	P	1	172	172	Kantin SDN Tahawa - 1 	Desa Tahawa Kec. Kahayan Tengah 	0  	0  	86	3	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
173	2022-01-01	P	1	173	173	Kantin Ulifah	Desa Talio Hulu Kec. Pandih Batu	0  	0  	22	1	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
176	2022-01-01	P	1	176	176	Kantin SDN Tanjung Sangalang 1 	Desa Tanjung Sangalang Kec. Kahayan Tengah 	0  	0  	75	3	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
177	2022-01-01	P	1	177	177	Toko Lian Jaya	Jl. Anggrek Desa Hanjak Maju 	0  	0  	5	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
178	2022-01-01	P	1	178	178	Catering Aulia	Jl. Bereng Kalingu Kel. Bereng 	0  	0  	57	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
179	2022-01-01	P	1	179	179	Toko Eno	Jl. Brigjend Katamso No. 51 Banjarmasin	0  	0  	0	0	Banjarmasin	Banjarmasin	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
180	2022-01-01	P	1	180	180	Tyas Catering 	Jl. Darung Bawan Km. 11 Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
181	2022-01-01	P	1	181	181	Depot Air Minum Aga Water	Jl. Darung Bawan Km. 13 Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
182	2022-01-01	P	1	182	182	WM. Sederhana 	Jl. Darung Bawan Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
183	2022-01-01	P	1	183	183	Warung Keluarga	Jl. Darung Bawan Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
184	2022-01-01	P	1	184	184	Toko Kue MM Qomar	Jl. Family Kuala Kapuas	0  	0  	0	0	Kapuas	Kapuas	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
185	2022-01-01	P	1	185	185	Catering Reva	Jl. HM. Sanusi RT. VI Kel. Bereng 	4  	0  	57	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
186	2022-01-01	P	1	186	186	Catering Nurul	Jl. Kalawa Kel. Kalawa	0  	0  	53	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
187	2022-01-01	P	1	187	187	Toko Anggi	Jl. Kasih Sebangau Permai	0  	0  	43	8	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
188	2022-01-01	P	1	188	188	Toko Hanafi	Jl. Komp. Marina Permai Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
189	2022-01-01	P	1	189	189	SMP Islam Bahaur ( WM. Sederhana )	Jl. Komp. Pasar Bahaur 	0  	0  	39	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
190	2022-01-01	P	1	190	190	Toko Kue Bunda Eka	Jl. Lintas Desa Mantaren 	0  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
191	2022-01-01	P	1	191	191	Toko Suriansyah	Jl. Lintas Kalimantan ( Depan Perkantoran Pemda) Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
192	2022-01-01	P	1	192	192	Catering Noor Ikhsan	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	95	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
193	2022-01-01	P	1	193	193	Toko Rayhan	Jl. Lintas Kalimantan Desa Mantaren 	0  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
194	2022-01-01	P	1	194	194	WM. Ampera	Jl. Lintas Kalimantan Desa Mantaren I	0  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
196	2022-01-01	P	1	196	196	WM. K. Windy	Jl. Lintas Kalimantan Km. 24 RT. 03 Desa Mintin	3  	0  	90	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
197	2022-01-01	P	1	197	197	WM. Anni	Jl. Lintas Kalimantan KM.10 Pulang Pisau	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
198	2022-01-01	P	1	198	198	SDN Tumbang Nusa - 2 ( WM. Arjun )	Jl. Lintas Kalimantan KM.35 Tumbang Nusa	0  	0  	52	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
199	2022-01-01	P	1	199	199	WM. Mama Andi	Jl. Lintas Provinsi P raya - K Kurun Desa Bawan	0  	0  	70	4	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
200	2022-01-01	P	1	200	200	Yuliana Catering 	Jl. Manunggal XV RT. 04 Desa Mantaren 	0  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
201	2022-01-01	P	1	201	201	Catering Amel 	Jl. Masrumi Layar RT. 09 Kel. Bereng 	0  	0  	57	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
202	2022-01-01	P	1	202	202	Depot Untung & Es Teler Azam " Dua Rasa "	Jl. Oberlin Metar Kel. Pulang Pisau	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
205	2022-01-01	P	1	205	205	Toko Arbani	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
207	2022-01-01	P	1	207	207	Toko H Jali	Jl. Pangkoh 10	0  	0  	20	1	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
209	2022-01-01	P	1	209	209	Sakura MW Catering 	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
210	2022-01-01	P	1	210	210	Aina Catering	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
211	2022-01-01	P	1	211	211	Dapoer Nenek	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
212	2022-01-01	P	1	212	212	Mba Ning Catering	Jl. Patih Rumbih Desa Pangkoh	0  	0  	20	1	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
213	2022-01-01	P	1	213	213	Nandifa Mart	Jl. Patih Rumbih No. 07 RT. 40 Kuala Kapuas	40 	0  	0	0	Kapuas	Kapuas	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
214	2022-01-01	P	1	214	214	Toko Menanti	Jl. Pemda No. 103 Pulang Pisau	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
216	2022-01-01	P	1	216	216	Toko Sembako 3 R	Jl. Perintis Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
217	2022-01-01	P	1	217	217	Catering Winda	Jl. Tajahan Antang Kel. Bereng 	0  	0  	57	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
218	2022-01-01	P	1	218	218	WM. Mama Edo	Jl. Tajahan Antang Kel. Bereng 	0  	0  	57	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
219	2022-01-01	P	1	219	219	Kantin SMPN - 1 Kahayan Hilir	Jl. Tajahan Antang Kel. Bereng 	0  	0  	57	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
220	2022-01-01	P	1	220	220	Toko Nia	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
221	2022-01-01	P	1	221	221	Catering Al - Hikmah	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
223	2022-01-01	P	1	223	223	Sheila Cosmetic	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
224	2022-01-01	P	1	224	224	Catering Rizni	Jl. Tingang Menteng RT. 09 Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
225	2022-01-01	P	1	225	225	Catering Inang 	Jl. Tingang Menteng RT. VIII Gg Bersaudara	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
226	2022-01-01	P	1	226	226	Catering 5 Bersaudara	Jl. Tingang Menteng RT. VIII No. 127 Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
227	2022-01-01	P	1	227	227	RM. Bandung 	Jl. Trans Kalimantan Desa Bawan	0  	0  	70	4	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
228	2022-01-01	P	1	228	228	Toko Yun Yun	Jl. Trans Kalimantan Km. 57 Desa Jabiren	0  	0  	50	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
229	2022-01-01	P	1	229	229	Toko Dea	Jl. Trans Kalimantan Km. 6,7 RT. 01 Desa Henda Kec.  Jabiren Raya	1  	0  	41	7	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
231	2022-01-01	P	1	231	231	Green Cafe	Kapuas	0  	0  	0	0	Kapuas	Kapuas	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
232	2022-01-01	P	1	232	232	SDN Sei Tunggul	Kec. Kahayan Kuala	0  	0  	3	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
233	2022-01-01	P	1	233	233	Kantin SDN Sei Tunggul	Kecamatan Kahayan Kuala	0  	0  	3	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
234	2022-01-01	P	1	234	234	KKKS Maliku	Kecamatan Maliku	0  	0  	7	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
235	2022-01-01	P	1	235	235	WM. Maliku Baru	Kecamatan Maliku	0  	0  	7	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
236	2022-01-01	P	1	236	236	Catering Hidayatul	Kelurahan Bereng 	0  	0  	57	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
237	2022-01-01	P	1	237	237	Toko Kue Holland	Kuala Kapuas	0  	0  	0	0	Kapuas	Kapuas	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
195	2022-01-01	P	1	195	195	WM. Sumber Barokah 	Jl. Lintas Kalimantan Desa Mantaren I	0  	0  	92	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	f	2022-08-25	Hapus	3		\N	\N	\N	\N	\N
204	2022-01-01	P	1	204	204	WM. Yeyen	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	93	5			PULANG PISAU	0			3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
239	2022-01-01	P	1	239	239	Kantin SDN Maliku Baru - 5	Maliku Baru	0  	0  	7	6	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
240	2022-01-01	P	1	240	240	Catering Synoya	Palangkaraya	0  	0  	0	0	Palangka Raya	Palangka Raya	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
241	2022-01-01	P	1	241	241	Catering Aisyiah	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
242	2022-01-01	P	1	242	242	Toko Heni	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
243	2022-01-01	P	1	243	243	Toko Siti	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
244	2022-01-01	P	1	244	244	Pawoon Meika	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
245	2022-01-01	P	1	245	245	Catering Jannah	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
246	2022-01-01	P	1	246	246	Toko Winda Sejahtera	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
247	2022-01-01	P	1	247	247	Toko Lian	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
248	2022-01-01	P	1	248	248	Catering Mama Azril	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
249	2022-01-01	P	1	249	249	Memori Daun Pisang	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
250	2022-01-01	P	1	250	250	Catering Henie	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
251	2022-01-01	P	1	251	251	Umai Homemade Cake	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
252	2022-01-01	P	1	252	252	Warung Soponyono Crysral	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
253	2022-01-01	P	1	253	253	Fufu Catering 	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
254	2022-01-01	P	1	254	254	Catering Juli Lestari	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
255	2022-01-01	P	1	255	255	WM. Mama Alif	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
256	2022-01-01	P	1	256	256	Toko Kue Niniex Harly	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
257	2022-01-01	P	1	257	257	Toko Arifin	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
258	2022-01-01	P	1	258	258	Dapoer Mami A'A	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
259	2022-01-01	P	1	259	259	Catering Gina	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
260	2022-01-01	P	1	260	260	Naila Catering	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
261	2022-01-01	P	1	261	261	Catering Ibu Apri	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
262	2022-01-01	P	1	262	262	Deos Catering 	Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
263	2022-01-01	P	1	263	263	PKK Sebangau Kuala 	Sebangau Kuala 	0  	0  	43	8	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
332	2022-01-01	P	2	332	332	CV. Redrock	Jl. Tingang Menteng No. 74 RT. 11 Kel. Pulang Pisau 	11 	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Redrock	Jl. Tingang Menteng No. 74 RT. 11 Kel. Pulang Pisau 	11 	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
333	2022-01-01	P	2	333	333	CV. David Family	Jl. Tingang Menteng RT. 09 Kel. Pulang Pisau 	9  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. David Family	Jl. Tingang Menteng RT. 09 Kel. Pulang Pisau 	9  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	2022-01-01	P	1	1	1	Penginapan Reformasi 	Jl. Perintis Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	2022-01-01	P	1	13	13	WM. Rona Asyifa	Jl. Lintas Kalimantan Desa Anjir	0  	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	2022-01-01	P	1	48	48	WM. Sate Ayam Suramadu	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	2022-01-01	P	1	58	58	WM. Bakso Urat 	Jl. Tingang Menteng Kel. Pulang Pisau	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	2022-01-01	P	1	92	92	Kios Rizal	Jl. Darung Bawan RT. 12 Desa Anjir Pulang Pisau 	12 	0  	94	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
127	2022-01-01	P	1	127	127	H. Najidi	Palangka Raya 	0  	0  	0	0	Palangka Raya	Palangka Raya	Palangka Raya	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PALANGKA RAYA	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
266	2022-01-01	P	2	266	266	CV. Restu Guru Promosindo	Jl. A. Yani Km. 38. 7 Martapura Kab. Banjar 	0  	0  	0	0	Martapura	Banjar	Banjar		\N	\N	0	\N	CV. Restu Guru Promosindo	Jl. A. Yani Km. 38. 7 Martapura Kab. Banjar 	0  	0  	0	0	Banjar	Banjar	Martapura	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
290	2022-01-01	P	2	290	290	PT. Aldeca Energi Utama	Jl. Lintas Kalimantan Km 52.9 Desa Jabiren	0  	0  	50	7	\N	\N	PULANG PISAU		\N	\N	0	\N	PT. Aldeca Energi Utama	Jl. Lintas Kalimantan Km 52.9 Desa Jabiren	0  	0  	7	50	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
302	2022-01-01	P	2	302	302	PT. Badingsanak Jaya Abadi	Jl. Lintas Kalimantan RT. 14 Desa Anjir Pulang Pisau	14 	0  	94	5	\N	\N	PULANG PISAU		\N	\N	0	\N	PT. Badingsanak Jaya Abadi	Jl. Lintas Kalimantan RT. 14 Desa Anjir Pulang Pisau	14 	0  	5	94	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
320	2022-01-01	P	2	320	320	CV. Swadaya Putra	Jl. Oberlin Metar No. 06 RT. 09 Kel. Pulang Pisau 	9  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Swadaya Putra	Jl. Oberlin Metar No. 06 RT. 09 Kel. Pulang Pisau 	9  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
175	2022-01-01	P	1	175	175	PKK Desa Tanjung Perawan	Desa Tanjung Perawan	0  	0  	60	2	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
208	2022-01-01	P	1	208	208	Cafe & Catering Bunda 08	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
222	2022-01-01	P	1	222	222	Toko Dua Sekawan / Mikko	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU	0	\N	\N	2	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
331	2022-01-01	P	2	331	331	CV. Citizen	Jl. Tingang Menteng No. 26 RT. 01 Kel. Pulang Pisau 	1  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Citizen	Jl. Tingang Menteng No. 26 RT. 01 Kel. Pulang Pisau 	1  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
334	2022-01-01	P	2	334	334	CV. One	Jl. Batu Suli 5 B Gg Bersama N0. 75 RT. 03 RW. 15 Palangkaraya	3  	15 	0	0	Palangkaraya	Palangkaraya	Palangkaraya		\N	\N	0	\N	CV. One	Jl. Batu Suli 5 B Gg Bersama N0. 75 RT. 03 RW. 15 Palangkaraya	3  	15 	0	0	Palangkaraya	Palangkaraya	Palangkaraya	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
414	2022-01-03	P	1	414	0	Wm. Adelia	Jl. Lintas Kalimantan	0  	0  	93	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
416	2022-01-03	P	1	416	0	Wm. H Idah	Jl. Lintas Kalimantan	0  	0  	93	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
335	2022-01-01	P	2	335	335	CV. Garantung Jaya	Jl. Darung Bawan RT. 2 Pulang Pisau 	2  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Garantung Jaya	Jl. Darung Bawan RT. 2 Pulang Pisau 	2  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
336	2022-01-01	P	2	336	336	CV. Surya Jaya Abadi	Jl. Darung Bawan RT. I Pulang Pisau 	1  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Surya Jaya Abadi	Jl. Darung Bawan RT. I Pulang Pisau 	1  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
337	2022-01-01	P	2	337	337	CV. Sumber Berkat Utama	Jl. Marina Permai IV B No. 177 Palangka Raya 	0  	0  	0	0	Palangkaraya	Palangkaraya	Palangkaraya		\N	\N	0	\N	CV. Sumber Berkat Utama	Jl. Marina Permai IV B No. 177 Palangka Raya 	0  	0  	0	0	Palangkaraya	Palangkaraya	Palangkaraya	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
338	2022-01-01	P	2	338	338	CV. Genezhio Ebenezher	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Genezhio Ebenezher	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
339	2022-01-01	P	2	339	339	CV. Basewut Batuah Marajaki	Jl. Panenga Permai VI Palangkaraya	0  	0  	0	0	Palangkaraya	Palangkaraya	Palangkaraya		\N	\N	0	\N	CV. Basewut Batuah Marajaki	Jl. Panenga Permai VI Palangkaraya	0  	0  	0	0	Palangkaraya	Palangkaraya	Palangkaraya	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
340	2022-01-01	P	2	340	340	CV. Cipta Nusa Mandiri	Jl. Rajawali I Ujung Gg II No. 40 Palangkaraya 	0  	0  	0	0	Palangkaraya	Palangkaraya	Palangkaraya		\N	\N	0	\N	CV. Cipta Nusa Mandiri	Jl. Rajawali I Ujung Gg II No. 40 Palangkaraya 	0  	0  	0	0	Palangkaraya	Palangkaraya	Palangkaraya	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
341	2022-01-01	P	2	341	341	CV. Teras Selaras Abadi	Jl. Rey II Perum Komp. Pemda Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Teras Selaras Abadi	Jl. Rey II Perum Komp. Pemda Pulang Pisau 	0  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
342	2022-01-01	P	2	342	342	CV. Rajaki Putra Kahayan 	Jl. Tingang Menteng Gang Nurul Iman RT. 5 Pulang Pisau 	5  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Rajaki Putra Kahayan 	Jl. Tingang Menteng Gang Nurul Iman RT. 5 Pulang Pisau 	5  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
343	2022-01-01	P	2	343	343	CV. Borneo Bangun Perkasa	Jl. Tingang Menteng RT. 1 Pulang Pisau 	1  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Borneo Bangun Perkasa	Jl. Tingang Menteng RT. 1 Pulang Pisau 	1  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
344	2022-01-01	P	2	344	344	CV. Lampayung Persada	Jl. Tingang Menteng RT. 1 Pulang Pisau 	1  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Lampayung Persada	Jl. Tingang Menteng RT. 1 Pulang Pisau 	1  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
345	2022-01-01	P	2	345	345	CV. Rindang Bumi Utama	Pusat Palangka Raya	0  	0  	0	0	Palangkaraya	Palangkaraya	Palangkaraya		\N	\N	0	\N	CV. Rindang Bumi Utama	Pusat Palangka Raya	0  	0  	0	0	Palangkaraya	Palangkaraya	Palangkaraya	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
346	2022-01-01	P	2	346	346	CV. Almawa Dinar	Pusat Pulang Pisau 	0  	0  	93	5	\N	\N	PULANG PISAU		\N	\N	0	\N	CV. Almawa Dinar	Pusat Pulang Pisau 	0  	0  	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
348	2022-01-01	P	1	348	6212098709874567	Budi Santoso	Jalan Lintas Kalimantan	7  	7  	94	5	\N	\N	PULANG PISAU	085720761309	74812	\N	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
349	2022-01-01	P	1	349	6322222222222222	Badu	JL. Pemda	7  	7  	91	5	\N	\N	PULANG PISAU	08204440000	74812	\N	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	1	\N	\N
350	2022-01-01	P	1	350	6666666666666666	Alahuma	JL. Rey	8  	8  	91	5	\N	\N	PULANG PISAU	08204440008	74812	\N	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
351	2022-01-01	P	2	351	0	Ridwan Ismail	JL. Jenderal Ahmad Yani	3  	8  	15	6			PULANG PISAU	0	0	0	3	\N	CV. Tikum Dua Tiga	JL. Jenderal Ahmad Yani	3  	3  	6	15	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
352	2022-01-03	P	2	352	0	Berdy K. Andin	Jl. Lintas Kalimantan No. 23	0  	0  	92	5			PULANG PISAU	0	0	0	2	\N	CV. Arsitektur Wijaya Agung	Jl. Lintas Kalimantan No. 23	\N	\N	5	92	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
353	2022-01-03	P	1	353	0	Mama Mutia	Jl. Panunjung tarung	0  	0  	93	5			PULANG PISAU	0	74811	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
264	2022-01-01	P	2	264	264	PT. Rocket Chicken	Jl. Oberlin Metar Kel. Pulang Pisau	3  	0  	93	5			PULANG PISAU	0	0	0	3	\N	PT. Rocket Chicken	Jl. Oberlin Metar Kel. Pulang Pisau	3  	\N	5	93	PULANG PISAU	0	0	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
354	2022-01-01	P	1	354	0	Ristinie, S,Pd	Desa Sigi 	4  	0  	79	3			PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
355	2022-01-01	P	1	355	0	Wilyady	JL. A. Yani 	2  	1  	43	8			PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
356	2022-01-03	P	1	356	0	Catering Rama	Jl. Tajahan Antang RT.01 Kel. Bereng	01 	0  	57	5			PULANG PISAU	0	74811	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
358	2022-01-01	P	1	358	0	Soryatie	JL. Lintas Bahaur 	9  	0  	99	6			PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
357	2022-01-03	P	1	357	0	Rafela	Jl. Lintas Palangkaraya - Kurun RT.002 Desa Tuwung kec. Kahayan Tengah	02 	0  	78	3			PULANG PISAU	0	74862		1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
367	2022-01-01	P	2	367	0	Runalhard Wawan, BcKN 	JL. Darung Bawan Km.13	13 	0  	94	5			PULANG PISAU	0	74813	0	3	\N	CV. Antang Budi Utama	JL. Darung Bawan Km.13	13 	\N	5	94	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
361	2022-01-03	P	1	361	0	Omah Gong	Jl. Kasturi Pulang Pisau	014	0  	94	5			PULANG PISAU	0	74813	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
362	2022-01-03	P	1	362	0	Suley Anggen	Jl. Lintas Palangkaraya - Kuala Kurun	002	0  	54	4			PULANG PISAU	0	74863	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
363	2022-01-03	P	1	363	0	Azkiya	Jl. Nurul Iman Pulang Pisau	04 	0  	93	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
364	2022-01-03	P	1	364	0	CV. Vilia Alam Sejahtera	Jl. Menteng V No. 9 Kel. Menteng	0  	0  	93	5			PULANG PISAU	0	74813	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
359	2022-01-03	P	1	359	0	Kantin SDN Purwodadi-1	Desa Purwodadi Kecamtan Maliku	0  	0  	13	6			PULANG PISAU	0		0	17	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
366	2022-01-03	P	2	366	0	CV. DANAYES AMIN	Jl. Manunggal XV Mantaren I Pulang Pisau	03 	0  	92	5			PULANG PISAU	0	74861	0	1	\N	CV. DANAYES AMIN	Jl. Manunggal XV Mantaren I Pulang Pisau	03 	\N	5	92	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
368	2022-01-03	P	1	368	0	Roma	Jl. Lintas Palangka Raya - Kuala Kurun 	05 	0  	70	4			PULANG PISAU	0	74863	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
365	2022-01-01	P	2	365	0	CV. WIDIA MULIA	Jl. Darung Bawan Km.13 Anjir pulang Pisau	0  	0  	94	5			PULANG PISAU	0	74813	0	3	\N	CV WIDIA MULIA	Jl. Darung Bawan Km. 13 Anjir Pulang Pisau	\N	\N	5	94	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
360	2022-01-01	P	2	360	0	Septo Gunawan	JL. Tingang Menteng 	1  	0  	93	5			PULANG PISAU	0	0	0	3	\N	CV. Bintang Katatau	JL. Tingang Menteng	1  	\N	5	93	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	2022-01-01	P	1	52	52	WM. Depot Mie Kenzie	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	93	5			PULANG PISAU	0			1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
415	2022-01-03	P	1	415	0	Wm. H Idah	Jl. Lintas Kalimantan	0  	0  	93	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
417	2022-01-03	P	1	417	0	Wm. 99	Jl. Lintas Kalimantan	0  	0  	93	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
369	2022-01-03	P	1	369	0	Hj. Herni	Jl. Lintas Kalimantan Desa Anjir pulang Pisau , Kec. Kahayan hilir	014	0  	94	5			PULANG PISAU	0	74813	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
370	2022-01-03	P	1	370	0	Hj. Herni	Jl. Tingang Menteng Kel. Pulang Pisau 	014	0  	93	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
372	2022-01-03	P	1	372	0	Joko Wahyudi	Jl. Desa Kantan Muara 	003	001	31	1			PULANG PISAU	0	74871	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
373	2022-01-03	P	2	373	0	ANDRE PRASETYOADI	JL RTA MILONO KM. 6	0  	0  	0	0	MENTENG	JEKAN RAYA	PALANGKA RAYA	0	0	0	38	\N	PT. DJARUM	JL RTA MILONO KM. 6	\N	\N	0	0	PALANGKA RAYA	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
398	2022-01-01	P	1	398	0	WM. Aisyah	JL. Tingang Menteng 	0  	0  	93	5			PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
374	2022-01-03	P	1	374	0	KODIM 1011 KUALA KAPUAS	Desa Tahai Jaya	0  	0  	9	6			PULANG PISAU	0	0	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
376	2022-01-03	P	1	376	0	Mama Edo	Pulang pisau	06 	0  	57	5			PULANG PISAU	081250382363	74811	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
377	2022-01-03	P	1	377	0	WR. Lesehan Nisa Abuya	Pulang pisau	0  	0  	93	5			PULANG PISAU	0	74811	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
399	2022-01-01	P	1	399	0	Kedai Berkawan	Kuala Kapuas	0  	0  	0	0		-	PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
378	2022-01-03	P	1	378	0	PKK BAHAUR BASANTAN	Kecamatan Kahayan Kuala	0  	0  	4	2			PULANG PISAU	0	74872	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
379	2022-01-03	P	1	379	0	Mama Rizki	Desa Mulyasari	0  	0  	28	1			PULANG PISAU	0	74871	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
380	2022-01-03	P	1	380	0	PKK Jabiren Raya	Kecamatan Jabiren Raya	0  	0  	50	7			PULANG PISAU	0	74816	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
381	2022-01-03	P	1	381	0	PKK Bahaur Hulu Permai	Kecamatan Kahayan Kuala	0  	0  	3	2			PULANG PISAU	0	74872	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
382	2022-01-03	P	1	382	0	Ari	Desa Henda	0  	0  	41	7			PULANG PISAU	0	74816	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
375	2022-01-01	P	2	375	0	CV. BORNEO BANGUN PERKASA	PULANG PISAU	0  	0  	93	5			PULANG PISAU	0	0	0	3	\N	CV. BORNEO BANGUN PERKASA	PULANG PISAU	\N	\N	5	93	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
383	2022-01-01	P	1	383	0	Kantin SDN Gadabung - 2	Desa Gadabung, Kec. Pandih Batu	0  	0  	23	1			PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
371	2022-01-01	P	2	371	0	CV. Nazril Hadi Pratama	JL. Seroja No. 09	34 	4  	0	0			PULANG PISAU	0	0	0	3	\N	CV. Nazril Hadi Pratama	JL. Seroja No. 09	34 	4  	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
384	2022-01-01	P	1	384	0	Kantin SDN Maliku Baru - 3	Desa Maliku Baru	0  	0  	99	6			PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
385	2022-01-01	P	1	385	0	Kantin SDN Sei Pal Dalam	-	0  	0  	38	2			PULANG PISAU	0		0	17	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
400	2022-01-01	P	1	400	0	Kantin SDN Pamarunan - 1	-	0  	0  	83	3			PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
386	2022-01-03	P	1	386	0	Wm. Arema jabiren	Desa Jabiren	0  	0  	50	7			PULANG PISAU	0	74816	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
387	2022-01-03	P	1	387	0	Indah Rahmawati	Jl. Darung Bawan Permail Komplek BTN Pal.11	0  	0  	94	5			PULANG PISAU	081256700036	74813	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
388	2022-01-01	P	1	388	0	MIMIE PANGKOH	Kecamatan Pandih Batu	0  	0  	20	1			PULANG PISAU	0		0	17	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
389	2022-01-01	P	1	389	0	CV. Gatra Mega	Jl. Turi No.02 Palangkaraya	0  	0  	68	4			PULANG PISAU	0	74863	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
390	2022-01-03	P	1	390	0	Arsila Catering	Jl. Masrumi Layar Pulang Pisau	0  	0  	57	5			PULANG PISAU	0	74831	0	5	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
391	2022-01-01	P	1	391	0	Kantin SDN Pulang Pisau - 3	Kec. Kahayan Hilir	0  	0  	57	5			PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
392	2022-01-01	P	1	392	0	Kantin SDN Maliku Baru - 6	Desa Maliku Baru, Kec. Maliku 	0  	0  	99	6			PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
393	2022-01-03	P	1	393	0	Lamsani	Jl. Desa Tumbang Nusa 	004	0  	52	7			PULANG PISAU	0	74816	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
394	2022-01-03	P	1	394	0	Rahman	Jl. Lintas Kalimantan Desa Jabiren Raya	006	0  	50	7			PULANG PISAU	0	74816	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
395	2022-01-03	P	1	395	0	CV. Berkat Ortomoro	Jl. Tingang Menteng No. 58 B Pulang pisau	013	0  	52	7			PULANG PISAU	0	74816	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
396	2022-01-03	P	1	396	0	CV. Fajar	Pulang Pisau	0  	0  	93	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
397	2022-01-03	P	1	397	0	Dewi Indah Rahmawati	Pulang Pisau	0  	0  	93	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
401	2022-01-01	P	1	401	0	RM. Candi Laras	JL. Lintas Kalimantan 	10 	0  	94	5			PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
402	2022-01-03	P	1	402	0	CV. ANUGRAH PERDANA	Jl. Merdeka No.03 Mantaren II Pulang Pisau	0  	0  	91	5			PULANG PISAU	0	74816	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
403	2022-01-03	P	1	403	0	CV. Redrock	Jl. Tingang Menteng no.74 	09 	0  	93	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
404	2022-01-01	P	1	404	0	RM.Anugrah	Jl.Lintas Kalimantan	0  	0  	94	5			PULANG PISAU	0			17	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
405	2022-01-03	P	1	405	0	Angelica Amenia	Pulang Pisau	0  	0  	93	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
406	2022-01-03	P	1	406	0	CV. HBK MANASA	Jl. Beliang No.39 Palangkaraya	0  	0  	63	4			PULANG PISAU	0	74863	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
407	2022-01-03	P	1	407	0	CV. KARUHEI TATAU	Jl. Ngambun hawun Kel. Bereng Kec. Kahayan Hilir	05 	0  	57	5			PULANG PISAU	0	74831	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
408	2022-01-03	P	1	408	0	CV. NOORMA SARI	Jl. Pemuda komp. pemuda Permai Blok C No.01 Kapuas	0  	0  	0	0	Kuala kapuas	Kuala Kapuas	PULANG PISAU	0	0	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
409	2022-01-01	P	1	409	0	Dewi Indah Rakhmawati	JL. Tingang Menteng	9  	0  	93	5			PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
410	2022-01-01	P	1	410	0	Novi	JL. Darung Bawan Perumahan Pal. 11	11 	0  	94	5			PULANG PISAU	0	0	0	3	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
411	2022-08-31	P	1	411	0	JEFRIAH TARIGAN	Jl. Desa Tuwung RT. 002 Nomor 06 Desa Tuwung	002	0  	78	3			PULANG PISAU	0	0	0	5	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
412	2022-01-03	P	1	412	0	Wm. Melati Kuin	Jl. Lintas Kalimantan	0  	0  	93	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
413	2022-01-03	P	1	413	0	Wm. Mama Aida	Jl. Lintas Kalimantan	0  	0  	93	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
418	2022-01-03	P	1	418	0	Yuapriadi Mangkin	Jl. Lintas Palangkaraya- bahaur Desa buntoi 	006	0  	89	5			PULANG PISAU	0	74841	0	1	\N	\N	\N	\N	\N	0	0	PULANG PISAU	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: t_wpobjek; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_wpobjek (t_idobjek, t_idwp, t_noobjek, t_tgldaftarobjek, t_namaobjekpj, t_alamatobjekpj, t_namaobjek, t_alamatobjek, t_rtobjek, t_rwobjek, t_kecamatanobjek, t_kelurahanobjek, t_kabupatenobjek, t_notelpobjek, t_jenisobjek, t_kodeposobjek, t_latitudeobjek, t_longitudeobjek, t_gambarobjek, t_operatorid, t_korekobjek, t_kamar, t_statusobjek, t_operatoridtutup, t_tipeusaha) FROM stdin;
3	3	3	2022-01-01	\N	\N	RM. Anni	Jl. Lintas Kalimantan Desa Anjir Pulang Pisau 	0  	0  	5	94	PULANG PISAU	\N	2	\N			\N	0	22	\N	t	\N	4
5	5	5	2022-01-01	\N	\N	WM. Watta Cafe	Jl. Abel Gawei Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
6	6	6	2022-01-01	\N	\N	WM. Bakso Mentari 	Jl. Darung Bawan Desa Anjir	0  	0  	5	94	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
7	7	7	2022-01-01	\N	\N	RM. 99	Jl. Lintas Kalimantan 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
8	8	8	2022-01-01	\N	\N	WM. Adelia	Jl. Lintas Kalimantan 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
9	9	9	2022-01-01	\N	\N	WM. Angelia B2 dan RW	Jl. Lintas Kalimantan 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
11	11	11	2022-01-01	\N	\N	WM. Aulia	Jl. Lintas Kalimantan Desa Anjir	0  	0  	5	94	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
12	12	12	2022-01-01	\N	\N	WM. H. Idah 	Jl. Lintas Kalimantan Desa Anjir	0  	0  	5	94	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
13	13	13	2022-01-01	\N	\N	WM. Rona Asyifa	Jl. Lintas Kalimantan Desa Anjir	0  	0  	5	94	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
14	14	14	2022-01-01	\N	\N	WM. Samawa	Jl. Lintas Kalimantan Desa Anjir	0  	0  	5	94	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
16	16	16	2022-01-01	\N	\N	WM. Borneo	Jl. Lintas Kalimantan Desa Anjir P. Pisau 	0  	0  	5	94	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
17	17	17	2022-01-01	\N	\N	WM. Mama Nisa	Jl. Lintas Kalimantan Desa Anjir P. Pisau 	0  	0  	5	94	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
18	18	18	2022-01-01	\N	\N	WM. Wong Jogja	Jl. Lintas Kalimantan Desa Anjir P. Pisau 	0  	0  	5	94	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
19	19	19	2022-01-01	\N	\N	WM. Al - Mira	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	5	95	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
20	20	20	2022-01-01	\N	\N	WM. Banjar Sari	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	5	95	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
21	21	21	2022-01-01	\N	\N	WM. Hafizah	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	5	95	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
22	22	22	2022-01-01	\N	\N	WM. Hayati	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	5	95	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
23	23	23	2022-01-01	\N	\N	WM. Mama Angga	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	5	95	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
24	24	24	2022-01-01	\N	\N	WM. Mama Dia/Dika	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	5	95	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
25	25	25	2022-01-01	\N	\N	WM. Mama Sidik	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	5	95	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
26	26	26	2022-01-01	\N	\N	WM. Nani	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	5	95	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
27	27	27	2022-01-01	\N	\N	WM. Reihan RGL 30	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	5	95	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
28	28	28	2022-01-01	\N	\N	WM. Depot 95 ( Bakso dan Mie Ayam )	Jl. Lintas Kalimantan Desa Mantaren I P. Pisau 	0  	0  	5	92	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
29	29	29	2022-01-01	\N	\N	WM. Haswarga	Jl. Lintas Kalimantan Desa Mantaren I P. Pisau 	0  	0  	5	92	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
30	30	30	2022-01-01	\N	\N	WM. Syafi'i	Jl. Lintas Kalimantan Desa Mantaren II P. Pisau 	0  	0  	5	91	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
31	31	31	2022-01-01	\N	\N	WM. Wahyu	Jl. Lintas Kalimantan Desa Mantaren II P. Pisau 	0  	0  	5	91	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
32	32	32	2022-01-01	\N	\N	WM. Banyuwangi Kaganangan 	Jl. Lintas Kalimantan Desa Mintin 	0  	0  	5	90	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
33	33	33	2022-01-01	\N	\N	WM. Inayah 	Jl. Lintas Kalimantan Desa Mintin 	0  	0  	5	90	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
34	34	34	2022-01-01	\N	\N	WM. Mama Iwan 	Jl. Lintas Kalimantan Desa Mintin 	0  	0  	5	90	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
35	35	35	2022-01-01	\N	\N	WM. Amanah 	Jl. Lintas Kalimantan P. Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
36	36	36	2022-01-01	\N	\N	WM. Banjar I	Jl. Lintas Kalimantan P. Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
37	37	37	2022-01-01	\N	\N	WM. Bariklana	Jl. Lintas Kalimantan P. Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
38	38	38	2022-01-01	\N	\N	WM. Cak Li 	Jl. Lintas Kalimantan P. Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
39	39	39	2022-01-01	\N	\N	WM. Ponorogo	Jl. Lintas Kalimantan P. Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
40	40	40	2022-01-01	\N	\N	WM. Rizky II	Jl. Lintas Kalimantan P. Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
41	41	41	2022-01-01	\N	\N	WM. Tombo Loi	Jl. Lintas Kalimantan P. Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
42	42	42	2022-01-01	\N	\N	WM. Ayam Geprek Mama Ifit	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
43	43	43	2022-01-01	\N	\N	WM. Habibi	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
44	44	44	2022-01-01	\N	\N	WM. Mama Nia	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
45	45	45	2022-01-01	\N	\N	WM. Pecal	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
46	46	46	2022-01-01	\N	\N	WM. Punjer Roso 	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
47	47	47	2022-01-01	\N	\N	WM. Rahmah	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
48	48	48	2022-01-01	\N	\N	WM. Sate Ayam Suramadu	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
50	50	50	2022-01-01	\N	\N	WM. Banyu Langit 	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
4	349	4	2022-01-01	\N	\N	RM. Anugerah	Jl. Lintas Kalimantan Desa Anjir Pulang Pisau 	0  	0  	5	94	PULANG PISAU	\N	2	\N			\N	0	22	\N	t	\N	4
51	51	51	2022-01-01	\N	\N	WM. Café & Resto Bunda 08	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
53	53	53	2022-01-01	\N	\N	WM. Jowo 	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
54	54	54	2022-01-01	\N	\N	WM. Syahrini	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
49	204	49	2022-01-01	\N	\N	WM. Yeyen	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
55	55	55	2022-01-01	\N	\N	WM. Tamban	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
56	56	56	2022-01-01	\N	\N	WM. Lalapan Yan	Jl. Perintis Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
57	57	57	2022-01-01	\N	\N	WM. Reformasi	Jl. Perintis Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
58	58	58	2022-01-01	\N	\N	WM. Bakso Urat 	Jl. Tingang Menteng Kel. Pulang Pisau	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
59	59	59	2022-01-01	\N	\N	WM. Gajah Mungkur Wonogiri	Jl. Tingang Menteng Kel. Pulang Pisau	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
60	60	60	2022-01-01	\N	\N	WM. Mama Mila/ Amang Nanang	Jl. Tingang Menteng Kel. Pulang Pisau	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
61	61	61	2022-01-01	\N	\N	WM. Al - Hurri	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
62	62	62	2022-01-01	\N	\N	WM. Esa	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
63	63	63	2022-01-01	\N	\N	WM. Lalapan P. Jhoen	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
64	64	64	2022-01-01	\N	\N	WM. Mama Ebi	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
65	65	65	2022-01-01	\N	\N	WM. Mama Hairin	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
66	66	66	2022-01-01	\N	\N	WM. Mekar Arum	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
68	68	68	2022-01-01	\N	\N	WM. Mie Ayam & Bakso Sragen	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
69	69	69	2022-01-01	\N	\N	WM. Pasundan	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
70	70	70	2022-01-01	\N	\N	WM. Soponyono A	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
71	71	71	2022-01-01	\N	\N	WM. Soponyono B	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
72	72	72	2022-01-01	\N	\N	WM. Tenda Biru	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
73	73	73	2022-01-01	\N	\N	WM. Usun H Ayus	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
74	74	74	2022-01-01	\N	\N	WM. Wei Wei	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
75	75	75	2022-01-01	\N	\N	 Karaoke Yanti	 Kelurahan  Kalawa Kec. Kahayan Hilir 	0  	0  	5	53	PULANG PISAU	\N	3	\N			\N	0	44	\N	t	\N	11
76	76	76	2022-01-01	\N	\N	 Karaoke Semarang 	 Jl. Saka Payung RT. 01 Kel. Kalawa	1  	0  	5	53	PULANG PISAU	\N	3	\N			\N	0	44	\N	t	\N	11
77	77	77	2022-01-01	\N	\N	 Karaoke Ken Lia / Enzie	 Jl. Saka Payung RT. 01 Kel. Kalawa	1  	0  	5	53	PULANG PISAU	\N	3	\N			\N	0	44	\N	t	\N	11
78	78	78	2022-01-01	\N	\N	Tan Toen Ping	Jl. Poros Palangka Desa Gadabung Kec. Pandih Batu	0  	0  	1	23	PULANG PISAU	\N	9	\N			\N	0	84	\N	t	\N	6
79	79	79	2022-01-01	\N	\N	Tinarto	Desa Gohong Kec. Kahayan Hilir	0  	0  	5	95	PULANG PISAU	\N	9	\N			\N	0	84	\N	t	\N	6
80	80	80	2022-01-01	\N	\N	Toto Wiratmoko 	Desa mandomai	0  	0  	5	93	Pulang Pisau	\N	9	\N			\N	0	84	\N	t	\N	6
81	81	81	2022-01-01	\N	\N	Harsanto	Jl. Kuripan No. 62 RT. 06 Kuripan Banjarmasin Timur	0  	0  	5	93	Pulang Pisau	\N	9	\N			\N	0	84	\N	t	\N	6
82	82	82	2022-01-01	\N	\N	Herawati	Jl. Darung Bawan Km. XII Anjir Pulang Pisau 	0  	0  	5	94	PULANG PISAU	\N	9	\N			\N	0	84	\N	t	\N	6
83	83	83	2022-01-01	\N	\N	Anugerah Mulya	Jl. Tajahan Antang RT. 01 Kelurahan Bereng	1  	0  	5	57	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
84	84	84	2022-01-01	\N	\N	Apotek " Haikal"	Jl. Tingang Menteng RT. 01 Kel. Pulang Pisau 	1  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
85	85	85	2022-01-01	\N	\N	Toko Hanafi	Jl. Abel Gawei Blok B No. 46 RT. 15 Desa Anjir Komp. BTN Marina Permai 	15 	0  	5	94	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
86	86	86	2022-01-01	\N	\N	Kios Harapan Bersama	Jl. Ahmad Yani RT. 02 RW. 01 Desa Sebangau Permai	2  	1  	8	43	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
87	87	87	2022-01-01	\N	\N	Kios Naila	Jl. Ardi Tanang RT. 05 RW. 02 Kel. Bahaur Basantan	5  	2  	2	4	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
88	88	88	2022-01-01	\N	\N	Pangkalan Gas LPG 3 Kg (PSO)	Jl. Bromo RT. 01 RT. 03 Desa Gandang Kec. Maliku 	1  	3  	6	7	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
89	89	89	2022-01-01	\N	\N	Pangkalan Gas LPG 3 Kg " Batuah "	Jl. Dambung Enes Tiup RT. 02 Desa Pamarunan Kec. Kahayan Tengah 	2  	0  	3	83	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
90	90	90	2022-01-01	\N	\N	Bengkel Fit Motor	Jl. Darung Bawan Desa Anjir	0  	0  	5	94	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
91	91	91	2022-01-01	\N	\N	Katering Imam & Dapur Mama Tevin	Jl. Darung Bawan Rt. 09 Desa Anjir Pulang Pisau 	9  	0  	5	94	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
92	92	92	2022-01-01	\N	\N	Kios Rizal	Jl. Darung Bawan RT. 12 Desa Anjir Pulang Pisau 	12 	0  	5	94	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
93	93	93	2022-01-01	\N	\N	Pangkalan LPG Batu Raya	Jl. Desa Bahaur Batu Raya RT. 03	3  	0  	2	6	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
94	94	94	2022-01-01	\N	\N	Kios Norhayati	Jl. Desa Bahaur Hilir  Desa Bahaur Hilir	0  	0  	2	38	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
95	95	95	2022-01-01	\N	\N	Kios Nanda	Jl. Desa Bahaur Hilir  RT. 02 Desa Bahaur Hilir	2  	0  	2	38	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
96	96	96	2022-01-01	\N	\N	Pangkalan LPG 3 Kg Andra	Jl. Desa Bahaur Hilir RT. 04	4  	0  	2	38	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
97	97	97	2022-01-01	\N	\N	Apotik " Telu Pahari "	Jl. Lintas Kalimantan Km. 24 RT. 01 Desa Mintin	1  	0  	5	90	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
98	98	98	2022-01-01	\N	\N	Kios M Fazri Nor	Jl. Lintas Kalimantan RT. 03 Desa Mintin	3  	0  	5	90	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
99	99	99	2022-01-01	\N	\N	Toko Shohibah	Jl. Lintas Kalimantan RT. 06 Desa Mantaren I	6  	0  	5	92	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
101	101	101	2022-01-01	\N	\N	Toko Obat " Naufal Alfakih "	Jl. Lintas Palangkaraya - Bahaur RT. 012 Desa Kanamit	12 	0  	6	12	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
102	102	102	2022-01-01	\N	\N	Toko Obat " Tito "	Jl. Lintas Palangkaraya - Bahaur RT. 08 Desa Kanamit	8  	0  	6	12	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
103	103	103	2022-01-01	\N	\N	Toko Ubat " Irfan "	Jl. Lintas Palangkaraya - Kuala Kurun RT. 01 Desa Pangi	1  	0  	4	73	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
104	104	104	2022-01-01	\N	\N	Toko Obat Berijin Aina	Jl. Lintas Praya - Bahaur RT. 07 Desa Maliku Baru	7  	0  	6	99	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
105	105	105	2022-01-01	\N	\N	Kios Muhidin	Jl. Maliku Permai RT. 01 RW. 03 Desa Maliku Baru	1  	0  	6	99	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
106	106	106	2022-01-01	\N	\N	Pangkalan Gas LPG  " Sumber Rezeki "	Jl. Musi RT. 10 RW. 05 Desa Tahai Baru Kec. Maliku 	10 	5  	6	99	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
107	107	107	2022-01-01	\N	\N	Kios Tasik	Jl. Ngambun Hawun RT. 03 Kel. Bereng Kec. Kahayan Hilir	3  	0  	5	57	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
108	108	108	2022-01-01	\N	\N	Penginapan Indah 	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
109	109	109	2022-01-01	\N	\N	Toko Kahayan Jaya 	Jl. Pahlawan Ucun RT. 03 Desa Gohong Kec. Kahayan Hilir	3  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
110	110	110	2022-01-01	\N	\N	Kios Ridho Arjun	Jl. Pelita RT. 04 RW. 02 Maliku Mulya Desa Maliku Baru	4  	2  	6	99	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
111	111	111	2022-01-01	\N	\N	Maju Mandiri 	Jl. Perjuangan RT.01 RW. 01 Desa Sei Pudak	1  	1  	2	33	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
112	112	112	2022-01-01	\N	\N	Pangkalan LPG 3 Kg Abirra	Jl. Sapilah RT. 04 Desa Bahaur Hulu 	4  	0  	2	40	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
113	113	113	2022-01-01	\N	\N	Pangkalan LPG 3 Kg Tara	Jl. Sapilah RT. 04 Desa Bahaur Hulu Permai	4  	0  	2	3	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
114	114	114	2022-01-01	\N	\N	Toko Sembako Siti Nurbaya	Jl. STI Pelabuhan Sawit RT. 06	6  	0  	5	94	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
115	115	115	2022-01-01	\N	\N	Koperasi " Kartika Jaya " 	Jl. Tingang Menteng No. 136 RT. 09 Kel. Pulang Pisau 	9  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
116	116	116	2022-01-01	\N	\N	Fotocopy Kawanku	Jl. WAD. Duha RT. 06 Komp. Perkantoran No. 39 Desa Mantaren I	6  	0  	5	92	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
117	117	117	2022-01-01	\N	\N	Berlin I Rahu	Desa Jabiren	0  	0  	7	50	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	6
118	118	118	2022-01-01	\N	\N	Arafik	Desa Pilang 	0  	0  	7	51	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	6
119	119	119	2022-01-01	\N	\N	Hery	Desa Pilang 	0  	0  	7	51	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	6
120	120	120	2022-01-01	\N	\N	Ahmad Mustafa	Desa Pilang 	0  	0  	7	51	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	6
121	121	121	2022-01-01	\N	\N	Erlinawati Tarung 	Desa Pilang 	0  	0  	7	51	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	6
122	122	122	2022-01-01	\N	\N	Adi Ijon Usin	Desa Tumbang Nusa	0  	0  	7	52	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	6
123	123	123	2022-01-01	\N	\N	Nor Hasanah	Desa Tumbang Nusa	0  	0  	7	52	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	6
124	124	124	2022-01-01	\N	\N	Sintong 	Desa Tumbang Nusa	0  	0  	7	52	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	6
126	126	126	2022-01-01	\N	\N	Reza Vahlefi	Desa Tumbang Nusa Kec. Jabiren Raya	0  	0  	7	52	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	6
127	127	127	2022-01-01	\N	\N	H. Najidi	Palangka Raya 	0  	0  	7	52	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	6
128	128	128	2022-01-01	\N	\N	SDN Pulang Pisau - 1 	 Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
129	129	129	2022-01-01	\N	\N	PKK Kahayan Tengah 	Bukit Rawi	0  	0  	3	77	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
130	130	130	2022-01-01	\N	\N	WM. Wiwin	Bukit Rawi	0  	0  	3	77	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
132	132	132	2022-01-01	\N	\N	Evi Catering 	Desa Bahaur	0  	0  	2	39	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
133	133	133	2022-01-01	\N	\N	WM. Tama	Desa Bahaur Hilir	0  	0  	2	38	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
134	134	134	2022-01-01	\N	\N	Warung Sembako " Mangat " 	Desa Bahu Palawa	0  	0  	3	82	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
135	135	135	2022-01-01	\N	\N	Catering Regariansi	Desa Bawan	0  	0  	4	70	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
136	136	136	2022-01-01	\N	\N	Pokdarwis	Desa Bukit Liti	0  	0  	3	81	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
137	137	137	2022-01-01	\N	\N	WM. Edo	Desa Bukit Rawi	0  	0  	3	77	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
138	138	138	2022-01-01	\N	\N	Warung Makan Dan Kue Mey Mey	Desa Bukit Rawi	0  	0  	3	77	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
139	139	139	2022-01-01	\N	\N	Kedemangan Kahayan Tengah	Desa Bukit Rawi	0  	0  	3	77	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
140	140	140	2022-01-01	\N	\N	Catering Sahai Tambi Balu	Desa Bulit Rawi	0  	0  	3	77	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
141	141	141	2022-01-01	\N	\N	SDN Dandanng - 3 	Desa Dandang 	0  	0  	1	17	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
142	142	142	2022-01-01	\N	\N	Warung Mba Wati	Desa Garantung Kec. Maliku	0  	0  	6	8	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
143	143	143	2022-01-01	\N	\N	SMPN SA - 1 Kahayan Hilir Kantin Partini 	Desa Gohong Kec. Kahayan Hilir 	0  	0  	5	95	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
144	144	144	2022-01-01	\N	\N	Kantin SDN Hurung - 1 	Desa Hurung Kec. Banama Tingang	0  	0  	4	64	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
145	145	145	2022-01-01	\N	\N	RM. Ojo Lali 	Desa Jabiren	0  	0  	7	50	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
146	146	146	2022-01-01	\N	\N	Catering Nia	Desa Jabiren	0  	0  	7	50	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
147	147	147	2022-01-01	\N	\N	Kios Forland	Desa Jabiren 	0  	0  	7	50	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
148	148	148	2022-01-01	\N	\N	Kantin SDN Kanamit Jaya - 1 	Desa Kanamit Jaya Kec. Maliku	0  	0  	6	12	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
149	149	149	2022-01-01	\N	\N	PKK Desa Kiapak	Desa Kiapak	0  	0  	2	34	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
150	150	150	2022-01-01	\N	\N	Lando Catering 	Desa Maliku	0  	0  	6	99	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
152	152	152	2022-01-01	\N	\N	Kantin SDN Maliku Baru 0 4 	Desa Maliku Baru	0  	0  	6	99	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
153	153	153	2022-01-01	\N	\N	WM. Lisa	Desa Maliku Baru	0  	0  	6	99	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
154	154	154	2022-01-01	\N	\N	Warung Bulek	Desa Maliku Baru	0  	0  	6	99	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
155	155	155	2022-01-01	\N	\N	SMPN - 3 Maliku	Desa Maliku Baru	0  	0  	6	99	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
156	156	156	2022-01-01	\N	\N	SDN Trisari - 1 	Desa Manatren I	0  	0  	5	92	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
157	157	157	2022-01-01	\N	\N	Toko Agung 	Desa Mantaren I	0  	0  	5	92	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
158	158	158	2022-01-01	\N	\N	Catering Lula	Desa Mantaren I	0  	0  	5	92	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
159	159	159	2022-01-01	\N	\N	Catering Yuliana	Desa Mantaren I	0  	0  	5	92	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
160	160	160	2022-01-01	\N	\N	SMPN - 2 Kahayan Hilir	Desa Mintin	0  	0  	5	90	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
162	162	162	2022-01-01	\N	\N	WM. Masturi	Desa Pangkoh Hilir	0  	0  	1	20	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
163	163	163	2022-01-01	\N	\N	PKK Desa Pangkoh Sari	Desa Pangkoh Sari	0  	0  	1	26	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
164	164	164	2022-01-01	\N	\N	SMPN - 4 Pandih Batu ( Kantin Hana )	Desa Pangkoh VIII Kec. Pandih Batu	0  	0  	1	26	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
165	165	165	2022-01-01	\N	\N	Toko Faisal	Desa Pilang Kec. Jabiren Raya	0  	0  	7	51	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
166	166	166	2022-01-01	\N	\N	Kantin SDN Saka Kajang - 1	Desa Saka Kajang	0  	0  	1	97	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
167	167	167	2022-01-01	\N	\N	Catering Sumber Rezeki	Desa Sebangau Permai	0  	0  	8	43	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
168	168	168	2022-01-01	\N	\N	Catering Herawati	Desa Sebangau Permai	0  	0  	8	43	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
169	169	169	2022-01-01	\N	\N	Warung Mama Sundari	Desa Sebangau Permai	0  	0  	8	43	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
170	170	170	2022-01-01	\N	\N	Warung Indri	Desa Tahai Jaya	0  	0  	6	9	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
171	171	171	2022-01-01	\N	\N	Kantin Sekolah SDN Tahai Jaya 2	Desa Tahai Jaya Kec. Maliku	0  	0  	6	9	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
172	172	172	2022-01-01	\N	\N	Kantin SDN Tahawa - 1 	Desa Tahawa Kec. Kahayan Tengah 	0  	0  	3	86	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
173	173	173	2022-01-01	\N	\N	Kantin Ulifah	Desa Talio Hulu Kec. Pandih Batu	0  	0  	1	22	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
174	174	174	2022-01-01	\N	\N	Catering Edi Rahman	Desa Tangkahen 	0  	0  	4	74	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
175	175	175	2022-01-01	\N	\N	PKK Desa Tanjung Perawan	Desa Tanjung Perawan	0  	0  	2	60	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
176	176	176	2022-01-01	\N	\N	Kantin SDN Tanjung Sangalang 1 	Desa Tanjung Sangalang Kec. Kahayan Tengah 	0  	0  	3	75	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
177	177	177	2022-01-01	\N	\N	Toko Lian Jaya	Jl. Anggrek Desa Hanjak Maju 	0  	0  	5	5	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
178	178	178	2022-01-01	\N	\N	Catering Aulia	Jl. Bereng Kalingu Kel. Bereng 	0  	0  	5	57	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
179	179	179	2022-01-01	\N	\N	Toko Eno	Jl. Brigjend Katamso No. 51 Banjarmasin	0  	0  	0	0	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
180	180	180	2022-01-01	\N	\N	Tyas Catering 	Jl. Darung Bawan Km. 11 Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
181	181	181	2022-01-01	\N	\N	Depot Air Minum Aga Water	Jl. Darung Bawan Km. 13 Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
182	182	182	2022-01-01	\N	\N	WM. Sederhana 	Jl. Darung Bawan Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
183	183	183	2022-01-01	\N	\N	Warung Keluarga	Jl. Darung Bawan Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
184	184	184	2022-01-01	\N	\N	Toko Kue MM Qomar	Jl. Family Kuala Kapuas	0  	0  	0	0	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
185	185	185	2022-01-01	\N	\N	Catering Reva	Jl. HM. Sanusi RT. VI Kel. Bereng 	4  	0  	5	57	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
186	186	186	2022-01-01	\N	\N	Catering Nurul	Jl. Kalawa Kel. Kalawa	0  	0  	5	53	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
187	187	187	2022-01-01	\N	\N	Toko Anggi	Jl. Kasih Sebangau Permai	0  	0  	8	43	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
188	188	188	2022-01-01	\N	\N	Toko Hanafi	Jl. Komp. Marina Permai Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
189	189	189	2022-01-01	\N	\N	SMP Islam Bahaur ( WM. Sederhana )	Jl. Komp. Pasar Bahaur 	0  	0  	2	39	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
190	190	190	2022-01-01	\N	\N	Toko Kue Bunda Eka	Jl. Lintas Desa Mantaren 	0  	0  	5	92	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
191	191	191	2022-01-01	\N	\N	Toko Suriansyah	Jl. Lintas Kalimantan ( Depan Perkantoran Pemda) Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
192	192	192	2022-01-01	\N	\N	Catering Noor Ikhsan	Jl. Lintas Kalimantan Desa Gohong 	0  	0  	5	95	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
193	193	193	2022-01-01	\N	\N	Toko Rayhan	Jl. Lintas Kalimantan Desa Mantaren 	0  	0  	5	92	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
194	194	194	2022-01-01	\N	\N	WM. Ampera	Jl. Lintas Kalimantan Desa Mantaren I	0  	0  	5	92	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
196	196	196	2022-01-01	\N	\N	WM. K. Windy	Jl. Lintas Kalimantan Km. 24 RT. 03 Desa Mintin	3  	0  	5	90	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
197	197	197	2022-01-01	\N	\N	WM. Anni	Jl. Lintas Kalimantan KM.10 Pulang Pisau	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
198	198	198	2022-01-01	\N	\N	SDN Tumbang Nusa - 2 ( WM. Arjun )	Jl. Lintas Kalimantan KM.35 Tumbang Nusa	0  	0  	7	52	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
199	199	199	2022-01-01	\N	\N	WM. Mama Andi	Jl. Lintas Provinsi P raya - K Kurun Desa Bawan	0  	0  	4	70	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
200	200	200	2022-01-01	\N	\N	Yuliana Catering 	Jl. Manunggal XV RT. 04 Desa Mantaren 	0  	0  	5	92	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
201	201	201	2022-01-01	\N	\N	Catering Amel 	Jl. Masrumi Layar RT. 09 Kel. Bereng 	0  	0  	5	57	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
205	205	205	2022-01-01	\N	\N	Toko Arbani	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
207	207	207	2022-01-01	\N	\N	Toko H Jali	Jl. Pangkoh 10	0  	0  	1	20	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
208	208	208	2022-01-01	\N	\N	Cafe & Catering Bunda 08	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
209	209	209	2022-01-01	\N	\N	Sakura MW Catering 	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
195	10	195	2022-01-01			WM. Sumber Barokah 	Jl. Lintas Kalimantan Desa Mantaren I	0  	0  	5	92	PULANG PISAU		2					3	33	\N	t	\N	13
204	204	204	2022-01-01	\N	\N	WM. Yeyen	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	f	3	4
210	210	210	2022-01-01	\N	\N	Aina Catering	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
211	211	211	2022-01-01	\N	\N	Dapoer Nenek	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
212	212	212	2022-01-01	\N	\N	Mba Ning Catering	Jl. Patih Rumbih Desa Pangkoh	0  	0  	1	20	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
213	213	213	2022-01-01	\N	\N	Nandifa Mart	Jl. Patih Rumbih No. 07 RT. 40 Kuala Kapuas	40 	0  	0	0	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
214	214	214	2022-01-01	\N	\N	Toko Menanti	Jl. Pemda No. 103 Pulang Pisau	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
216	216	216	2022-01-01	\N	\N	Toko Sembako 3 R	Jl. Perintis Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
217	217	217	2022-01-01	\N	\N	Catering Winda	Jl. Tajahan Antang Kel. Bereng 	0  	0  	5	57	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
218	218	218	2022-01-01	\N	\N	WM. Mama Edo	Jl. Tajahan Antang Kel. Bereng 	0  	0  	5	57	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
219	219	219	2022-01-01	\N	\N	Kantin SMPN - 1 Kahayan Hilir	Jl. Tajahan Antang Kel. Bereng 	0  	0  	5	57	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
220	220	220	2022-01-01	\N	\N	Toko Nia	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
221	221	221	2022-01-01	\N	\N	Catering Al - Hikmah	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
222	222	222	2022-01-01	\N	\N	Toko Dua Sekawan / Mikko	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
223	223	223	2022-01-01	\N	\N	Sheila Cosmetic	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
224	224	224	2022-01-01	\N	\N	Catering Rizni	Jl. Tingang Menteng RT. 09 Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
225	225	225	2022-01-01	\N	\N	Catering Inang 	Jl. Tingang Menteng RT. VIII Gg Bersaudara	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
227	227	227	2022-01-01	\N	\N	RM. Bandung 	Jl. Trans Kalimantan Desa Bawan	0  	0  	4	70	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
228	228	228	2022-01-01	\N	\N	Toko Yun Yun	Jl. Trans Kalimantan Km. 57 Desa Jabiren	0  	0  	7	50	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
229	229	229	2022-01-01	\N	\N	Toko Dea	Jl. Trans Kalimantan Km. 6,7 RT. 01 Desa Henda Kec.  Jabiren Raya	1  	0  	7	41	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
231	231	231	2022-01-01	\N	\N	Green Cafe	Kapuas	0  	0  	0	0	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
232	232	232	2022-01-01	\N	\N	SDN Sei Tunggul	Kec. Kahayan Kuala	0  	0  	2	3	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
233	233	233	2022-01-01	\N	\N	Kantin SDN Sei Tunggul	Kecamatan Kahayan Kuala	0  	0  	2	3	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
234	234	234	2022-01-01	\N	\N	KKKS Maliku	Kecamatan Maliku	0  	0  	6	7	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
235	235	235	2022-01-01	\N	\N	WM. Maliku Baru	Kecamatan Maliku	0  	0  	6	7	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
236	236	236	2022-01-01	\N	\N	Catering Hidayatul	Kelurahan Bereng 	0  	0  	5	57	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
237	237	237	2022-01-01	\N	\N	Toko Kue Holland	Kuala Kapuas	0  	0  	0	0	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
238	238	238	2022-01-01	\N	\N	Wong Solo 	Kuala Kapuas	0  	0  	0	0	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
239	239	239	2022-01-01	\N	\N	Kantin SDN Maliku Baru - 5	Maliku Baru	0  	0  	6	7	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
240	240	240	2022-01-01	\N	\N	Catering Synoya	Palangkaraya	0  	0  	0	0	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
241	241	241	2022-01-01	\N	\N	Catering Aisyiah	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
242	242	242	2022-01-01	\N	\N	Toko Heni	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
243	243	243	2022-01-01	\N	\N	Toko Siti	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
244	244	244	2022-01-01	\N	\N	Pawoon Meika	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
245	245	245	2022-01-01	\N	\N	Catering Jannah	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
246	246	246	2022-01-01	\N	\N	Toko Winda Sejahtera	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
247	247	247	2022-01-01	\N	\N	Toko Lian	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
248	248	248	2022-01-01	\N	\N	Catering Mama Azril	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
249	249	249	2022-01-01	\N	\N	Memori Daun Pisang	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
250	250	250	2022-01-01	\N	\N	Catering Henie	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
251	251	251	2022-01-01	\N	\N	Umai Homemade Cake	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
252	252	252	2022-01-01	\N	\N	Warung Soponyono Crysral	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
253	253	253	2022-01-01	\N	\N	Fufu Catering 	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
254	254	254	2022-01-01	\N	\N	Catering Juli Lestari	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
255	255	255	2022-01-01	\N	\N	WM. Mama Alif	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
256	256	256	2022-01-01	\N	\N	Toko Kue Niniex Harly	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
257	257	257	2022-01-01	\N	\N	Toko Arifin	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
258	258	258	2022-01-01	\N	\N	Dapoer Mami A'A	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
261	261	261	2022-01-01	\N	\N	Catering Ibu Apri	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
262	262	262	2022-01-01	\N	\N	Deos Catering 	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
263	263	263	2022-01-01	\N	\N	PKK Sebangau Kuala 	Sebangau Kuala 	0  	0  	8	43	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
265	265	265	2022-01-01	\N	\N	UD. Syalom	Jl SDN Kalawa i No. 22 RT. 05 Kel. Kalawa	5  	0  	5	53	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
266	266	266	2022-01-01	\N	\N	CV. Restu Guru Promosindo	Jl. A. Yani Km. 38. 7 Martapura Kab. Banjar 	0  	0  	0	0	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
267	267	267	2022-01-01	\N	\N	PT. Bhakti Idola Tama	Jl. A. Yani Km. 8.4 Komp. Persada Mas Roko 7-8 RT. 10 Banjar	0  	0  	0	0	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
268	268	268	2022-01-01	\N	\N	UD. Mararin Jaya	Jl. Ahmad Yani  RT. 04 RW. 01 Desa Gandang Barat 	4  	1  	6	55	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
269	269	269	2022-01-01	\N	\N	CV. Wiratama	Jl. Ahmad Yani No. 27 RT. 21 RW. 08 Ketapang 	4  	1  	6	55	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
270	270	270	2022-01-01	\N	\N	CV. Sumber Jaya Mandiri	Jl. Ardi Tanang RT. 02 RW. 01 Desa Tanjung Perawan	2  	1  	2	60	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
271	271	271	2022-01-01	\N	\N	CV. Fajar Bersinar	Jl. Bakti No Kavling 22 RT. 32 RW. 004 Banjarmasin Selatan	32 	4  	0	0	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
272	272	272	2022-01-01	\N	\N	CV. Makmur Jaya Perkasa	Jl. Barito III RT. 08 RW. 03 Desa Balanti Siam	8  	3  	1	19	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
273	273	273	2022-01-01	\N	\N	UD. Yasmin	Jl. Budal Laju No. 14 RT. 01 Desa Goha	14 	1  	4	69	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
274	274	274	2022-01-01	\N	\N	UD. Sumber Mulia	Jl. Cilik Riwut No. 89 RT. 01 Desa Bukit Liti	1  	0  	3	81	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
275	275	275	2022-01-01	\N	\N	CV. Lampayung Persada 	Jl. Darung Bawan  RT. 01 Kel. Pulang Pisau Kec. Kahayan Hilir	1  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
276	276	276	2022-01-01	\N	\N	CV. Sinar Pagi	Jl. Darung Bawan Gg. Hidrah No. 13 RT. 13 Desa Anjir	13 	0  	5	94	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
277	277	277	2022-01-01	\N	\N	CV. Bumi Tehang Lestari	Jl. Darung Bawan KM. 13  Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
278	278	278	2022-01-01	\N	\N	PT. Ris Bend Glory	Jl. Darung Bawan KM. 13 RT. 02 Kel. Pulang Pisau 	2  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
279	279	279	2022-01-01	\N	\N	CV. Garantung Jaya	Jl. Darung Bawan Rt. 02 Kel. Pulang Pisau 	2  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
280	280	280	2022-01-01	\N	\N	CV. Febi Putri Pratama	Jl. Darung Bawan RT. 10 Desa Anjir Pulang Pisau 	10 	0  	5	94	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
281	281	281	2022-01-01	\N	\N	CV. Abdi Jaya Perkasa	Jl. Desa Bahaur Hulu RT. 06 Desa Bahaur Hulu	6  	0  	2	40	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
282	282	282	2022-01-01	\N	\N	UD. Tunggal Bawi	Jl. Desa Bawan RT. 05 Desa Bawan	5  	0  	4	70	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
283	283	283	2022-01-01	\N	\N	UD. Kurnia Usaha	Jl. Desa Cemantan RT. 01 Desa Cemantan 	1  	0  	2	32	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
285	285	285	2022-01-01	\N	\N	CV. Rekatama Mulya Jasa	Jl. Durian RT. 05 RW. 01 Desa Tahai Baru Kec. Maliku	5  	1  	6	10	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
286	286	286	2022-01-01	\N	\N	CV. Kabali Jaya	Jl. Folder RT. 05 Desa Mantaren I Kec. Kah. Hilir	5  	0  	5	92	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
287	287	287	2022-01-01	\N	\N	CV. Betang Pambelum Utama	Jl. Hantasan Raya RT. 02 Kel. Pulang Pisau 	2  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
288	288	288	2022-01-01	\N	\N	CV. Harapan Jaya	Jl. Imam Bonjol RT. 01 RW. 01 Desa Kanamit Barat 	1  	1  	6	15	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
259	259	265	2022-01-01	\N	\N	Catering Gina	Pulang Pisau 	0  	0  	5	5	PULANG PISAU	\N	2	\N			\N	2	33	\N	t	\N	4
289	289	289	2022-01-01	\N	\N	CV. Muara Sami	Jl. Jalawat No. 20 Perum Betang Raya	0  	0  	0	0	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
290	290	290	2022-01-01	\N	\N	PT. Aldeca Energi Utama	Jl. Lintas Kalimantan Km 52.9 Desa Jabiren	0  	0  	7	50	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
291	291	291	2022-01-01	\N	\N	PT. Kahayan Berseri	Jl. Lintas Kalimantan Km. 71RT. 01 Desa Garung 	1  	0  	7	49	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
292	292	292	2022-01-01	\N	\N	UD. Berkah Andy	Jl. Lintas Kalimantan RT. 02 Desa Mantaren II	2  	0  	5	91	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
293	293	293	2022-01-01	\N	\N	UD 3 Pahari 	Jl. Lintas Kalimantan RT. 03 Desa Anjir Pulang Pisau	3  	0  	5	94	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
294	294	294	2022-01-01	\N	\N	CV. Cipta Jaya	Jl. Lintas Kalimantan RT. 03 Desa Mantaren II	3  	0  	5	91	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
295	295	295	2022-01-01	\N	\N	CV. Nucleus	Jl. Lintas Kalimantan RT. 03 Desa Mintin Kec. Kahayan Hilir	3  	0  	5	90	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
296	296	296	2022-01-01	\N	\N	UD. Dodo Bersaudara	Jl. Lintas Kalimantan RT. 04 Desa Mintin	4  	0  	5	90	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
297	297	297	2022-01-01	\N	\N	PT. Karya Halim Sampoerna	Jl. Lintas Kalimantan RT. 04 Desa Sakakajang 	4  	0  	7	97	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
298	298	298	2022-01-01	\N	\N	CV. Teras Jaya	Jl. Lintas Kalimantan RT. 06 Desa Jabiren	6  	0  	7	50	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
299	299	299	2022-01-01	\N	\N	PT. Indomarco Prismatama	Jl. Lintas Kalimantan RT. 06 Desa Jabiren 	6  	0  	7	50	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
300	300	300	2022-01-01	\N	\N	UD. Abril	Jl. Lintas Kalimantan RT. 09 Desa Bahaur Tengah 	9  	0  	2	39	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
301	301	301	2022-01-01	\N	\N	CV. Sumber Sari	Jl. Lintas Kalimantan RT. 14 Desa Anjir Pulang Pisau	14 	0  	5	94	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
303	303	303	2022-01-01	\N	\N	PT. Rukmini Mandiri	Jl. Lintas P Raya - Bahaur RT. 25 RW. 05 Desa Purwodadi	25 	5  	6	13	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
304	304	304	2022-01-01	\N	\N	PT. Sukses Rama Jaya	Jl. Lintas P Raya - Kuala Kurun RT. 03 Desa Bukit Liti	3  	0  	3	81	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
305	305	305	2022-01-01	\N	\N	CV. Karya Mandiri	Jl. Lintas P Raya - Kuala Kurun RT. 08 Desa Tangkahen 	8  	0  	4	74	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
306	306	306	2022-01-01	\N	\N	CV. Bersaudara Jaya	Jl. Lintas Palangkaraya - Bahaur RT. 08 Desa Maliku	8  	0  	6	98	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
307	307	307	2022-01-01	\N	\N	UD. Harapan Jaya	Jl. Lintas Palangkaraya - Kuala Kurun RT. 01 Desa Penda Barania	1  	0  	3	76	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
308	308	308	2022-01-01	\N	\N	UD. Rambang	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 Desa Bereng Rambang	2  	0  	3	88	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
309	309	309	2022-01-01	\N	\N	UD. Rambang Hagatang	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 Desa Lawang Uru	2  	0  	4	63	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
310	310	310	2022-01-01	\N	\N	UD. Dohong Family	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 Desa Pahawan	2  	0  	4	68	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
311	311	311	2022-01-01	\N	\N	UD. Tayo Gas	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 Desa Ramang	2  	0  	4	66	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
312	312	312	2022-01-01	\N	\N	UD. Danum Mahasur	Jl. Lintas Palangkaraya - Kuala Kurun RT. 02 RW. 01 Desa Tuwung 	2  	0  	3	78	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
313	313	313	2022-01-01	\N	\N	UD. Ramang Hagatang	Jl. Lintas Palangkaraya - Kuala Kurun RT. 04 Desa Ramang 	4  	0  	4	66	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
314	314	314	2022-01-01	\N	\N	UD. Sinar Daha	Jl. Lonok Desa Paduran Sebangau 	0  	0  	8	48	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
315	315	315	2022-01-01	\N	\N	UD. Harapan Baru	Jl. Martinus Manggang RT. 01 Desa Bukit Bamba	1  	0  	3	85	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
316	316	316	2022-01-01	\N	\N	CV. Rafi'i	Jl. Masrumi Layar No. 15 RT. 02 Desa Anjir Pulang Pisau 	2  	0  	5	94	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
317	317	317	2022-01-01	\N	\N	CV. Karunia Jaya Perkasa	Jl. Masrumi Layar No. 40 RT. 08 Kel. Bereng Kec. Kahayan Hilir	8  	0  	5	57	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
318	318	318	2022-01-01	\N	\N	CV. Anugrah Perdana	Jl. Merdeka RT. 03 Desa Mantaren II	3  	0  	5	91	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
319	319	319	2022-01-01	\N	\N	UD. Justin	Jl. Nusa Indah VII RT. 07 RT. 02 Desa Tahai Jaya	7  	0  	6	9	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
320	320	320	2022-01-01	\N	\N	CV. Swadaya Putra	Jl. Oberlin Metar No. 06 RT. 09 Kel. Pulang Pisau 	9  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
321	321	321	2022-01-01	\N	\N	UD. Nicola	Jl. Pahlawan Ucun RT. 07 Desa Gohong 	7  	0  	5	95	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
322	322	322	2022-01-01	\N	\N	UD. Sinar Logam	Jl. Panunjung Tarung RT. 07 Kel. Pulang Pisau 	7  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
323	323	323	2022-01-01	\N	\N	PT. Bank Pembangunan Daerah Kalteng	Jl. Panunjung Tarung RT. 12 Kel. Pulang Pisau 	12 	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
324	324	324	2022-01-01	\N	\N	CV. Putra Jaya Grup	Jl. Pejuang RT. 02 Desa Mantaren II Kec. Kahayan Hilir	2  	0  	5	91	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
325	325	325	2022-01-01	\N	\N	UD. Mekar Sari	Jl. Poros Elang RT. 17 RW. 04 Desa Garantung 	17 	4  	6	8	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
326	326	326	2022-01-01	\N	\N	PT. Sarana Sampit Mentaya Utama	Jl. Samudra No. 01 RT. 13 Kel. Pulang Pisau 	13 	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
327	327	327	2022-01-01	\N	\N	CV.  Bersama Mulia Jaya	Jl. Soka II RT. 02 RW. 01 Desa Kantan Muara Kec. Pandih Batu	2  	1  	1	31	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
328	328	328	2022-01-01	\N	\N	UD. Mitra	Jl. Tajahan Antang RT. 02 Kelurahan Bereng	2  	0  	5	57	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
329	329	329	2022-01-01	\N	\N	CV. Berkat Mufakat Jaya 	Jl. Tingang Menteng No. 01 RT. 011 Kel. Pulang Pisau 	11 	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
330	330	330	2022-01-01	\N	\N	CV. Harapan Ibu 	Jl. Tingang Menteng No. 11  Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
331	331	331	2022-01-01	\N	\N	CV. Citizen	Jl. Tingang Menteng No. 26 RT. 01 Kel. Pulang Pisau 	1  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
332	332	332	2022-01-01	\N	\N	CV. Redrock	Jl. Tingang Menteng No. 74 RT. 11 Kel. Pulang Pisau 	11 	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
333	333	333	2022-01-01	\N	\N	CV. David Family	Jl. Tingang Menteng RT. 09 Kel. Pulang Pisau 	9  	0  	5	93	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
334	334	334	2022-01-01	\N	\N	CV. One	Jl. Batu Suli 5 B Gg Bersama N0. 75 RT. 03 RW. 15 Palangkaraya	3  	15 	0	0	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
335	335	335	2022-01-01	\N	\N	CV. Garantung Jaya	Jl. Darung Bawan RT. 2 Pulang Pisau 	2  	0  	5	93	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
336	336	336	2022-01-01	\N	\N	CV. Surya Jaya Abadi	Jl. Darung Bawan RT. I Pulang Pisau 	1  	0  	5	93	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
337	337	337	2022-01-01	\N	\N	CV. Sumber Berkat Utama	Jl. Marina Permai IV B No. 177 Palangka Raya 	0  	0  	0	0	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
338	338	338	2022-01-01	\N	\N	CV. Genezhio Ebenezher	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
339	339	339	2022-01-01	\N	\N	CV. Basewut Batuah Marajaki	Jl. Panenga Permai VI Palangkaraya	0  	0  	0	0	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
340	340	340	2022-01-01	\N	\N	CV. Cipta Nusa Mandiri	Jl. Rajawali I Ujung Gg II No. 40 Palangkaraya 	0  	0  	0	0	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
341	341	341	2022-01-01	\N	\N	CV. Teras Selaras Abadi	Jl. Rey II Perum Komp. Pemda Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
343	343	343	2022-01-01	\N	\N	CV. Borneo Bangun Perkasa	Jl. Tingang Menteng RT. 1 Pulang Pisau 	1  	0  	5	93	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
344	344	344	2022-01-01	\N	\N	CV. Lampayung Persada	Jl. Tingang Menteng RT. 1 Pulang Pisau 	1  	0  	5	93	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
345	345	345	2022-01-01	\N	\N	CV. Rindang Bumi Utama	Pusat Palangka Raya	0  	0  	0	0	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
346	346	346	2022-01-01	\N	\N	CV. Almawa Dinar	Pusat Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
1	1	1	2022-01-01	\N	\N	Penginapan Reformasi	Jl. Perintis Kel. Pulang Pisau 	0  	0  	5	93	Pulang Pisau	\N	1	\N			\N	2	17	\N	t	\N	5
15	15	15	2022-01-01	\N	\N	WM. Abah Mirhan 	Jl. Lintas Kalimantan Desa Anjir P. Pisau 	0  	0  	5	94	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
67	67	67	2022-01-01	\N	\N	WM. Mie Agung 99	Jl. Tingang Menteng Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	29	\N	t	\N	4
100	100	100	2022-01-01	\N	\N	Kios " Berkat Tasidi "	Jl. Lintas Kalimantan RT. 07 Desa Jabiren 	7  	0  	7	50	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	34
131	131	131	2022-01-01	\N	\N	Kantin Sekolah Palapa SDN Badirih I	Desa Badirih Kec. Maliku	0  	0  	6	11	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
151	151	151	2022-01-01	\N	\N	PKK Maliku 	Desa Maliku	0  	0  	6	99	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
161	161	161	2022-01-01	\N	\N	Kantin SDN Paduran Mulya	Desa Paduran Mulya Kec. Sabangau	0  	0  	8	47	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
202	202	202	2022-01-01	\N	\N	Depot Untung & Es Teler Azam " Dua Rasa "	Jl. Oberlin Metar Kel. Pulang Pisau	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
226	226	226	2022-01-01	\N	\N	Catering 5 Bersaudara	Jl. Tingang Menteng RT. VIII No. 127 Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
260	260	260	2022-01-01	\N	\N	Naila Catering	Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
284	284	284	2022-01-01	\N	\N	UD. Putra Tunggal	Jl. Desa Tambak RT. 01 Desa Tambak Kec. Banama Tingang 	1  	0  	4	67	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
302	302	302	2022-01-01	\N	\N	PT. Badingsanak Jaya Abadi	Jl. Lintas Kalimantan RT. 14 Desa Anjir Pulang Pisau	14 	0  	5	94	PULANG PISAU	\N	4	\N			\N	0	58	\N	t	\N	1
342	342	342	2022-01-01	\N	\N	CV. Rajaki Putra Kahayan 	Jl. Tingang Menteng Gang Nurul Iman RT. 5 Pulang Pisau 	5  	0  	5	93	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	\N
348	348	266	2022-01-01	Budi	Jalan Lintas Kalimantan	RM. Amanah	JL. Lintas Kalimantan	8  	9  	5	91	Pulang Pisau	085720761309	2	74812			\N	3	22	\N	t	\N	4
2	348	2	2022-01-01	\N	\N	RM. Candi Laras 	Jl. Lintas Kalimantan Desa Anjir Pulang Pisau 	0  	0  	5	94	PULANG PISAU	\N	2	\N			\N	0	22	\N	f	3	4
349	349	267	2022-01-01	Badu	JL. Pemda	WM. Untung	JL. Pemda	7  	7  	5	93	Pulang Pisau	085720761309	2	74812			\N	1	20	\N	t	1	4
350	351	334	2022-01-01	Ridwan Ismail	JL. Jenderal Ahmad Yani RT. 003 RW. 008, Desa Kanamit Barat, Kec. Maliku	CV. Tikum Dua Tiga	JL. Jenderal Ahmad Yani	3  	8  	6	15	Pulang Pisau	0	4	0				3	58	\N	t	\N	2
351	352	347	2022-01-03	Berdy K. Andin	Jl. Lintas Kalimantan No. 23	CV. Arsitektur Wijaya Agung	Jl. Lintas Kalimantan No. 23	0  	0  	5	92	Pulang Pisau	0	6	0				2	85	\N	t	\N	2
215	57	215	2022-01-01	\N	\N	WM. Reformasi 	Jl. Perintis Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
203	46	203	2022-01-01	\N	\N	WM. Punjer Roso 	Jl. Oberlin Metar Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU	\N	2	\N			\N	0	33	\N	t	\N	4
352	353	268	2022-01-03	Mutia	Jl. Panunjung Tarung	Wm. Mama mutia	Jl. Panunjung tarung	   	   	5	93	Pulang Pisau	0	2	74811				1	29	\N	t	\N	13
371	369	341	2022-01-03	Hj. Herni	Jl. Lintas Kalimantan Desa Anjir Pulang Pisau	RM. CANDI LARAS	Jl. Lintas Kalimantan Desa Anjir Pulang Pisau Kec. Kahayan hilir	014	0  	5	94	Pulang Pisau		4	74813				1	58	\N	t	\N	6
353	354	335	2022-01-01	Ristinie,S,Pd	Desa Sigi RT. 004, Desa Sigi, Kec. Kahayan Tengah	Pangkalan Gas Agung	Desa Sigi	4  	0  	3	5	Pulang Pisau		4	0				3	58	\N	t	\N	34
354	355	336	2022-01-01	Wilyady	JL. A. Yani RT. 002 RW. 001, Desa Sebangau Permai, Kec. Sebangau Kuala	Bintang Awai	JL. A. YAni	2  	1  	8	43	Pulang Pisau	0	4	0				3	58	\N	t	\N	34
355	356	269	2022-01-03	Rama	Jl. Tajahan Antang	Catering Rama	Jl. Tajahan Antang RT.01 Kel. Bereng	01 	00 	5	57	Pulang Pisau	0	2	74811				1	33	\N	t	\N	6
357	358	338	2022-08-24	Soryatie	JL. Lintas Bahaur RT. 009, Desa Maliku BAru, Kec. Maliku	Apotek Aina	JL. Lintas Bahaur	9  	0  	6	99	Pulang Pisau	0	4	0				3	58	\N	t	\N	28
356	357	337	2022-01-03	Rafela	Jl. Lintas PalangKaraya	Toko Obat " Rafela "	Jl. Lintas Palangkaraya - Kuala Kurun	02 	0  	3	78	Pulang Pisau		4	74862				1	58	\N	t	\N	6
358	360	348	2022-01-01	Septo Gunawan	JL. Tingang Menteng RT. 001, Pulang Pisau	CV. Bintang Katatau	JL. Tingang Menteng 	1  	0  	5	93	Pulang Pisau	0	6	0				3	85	\N	t	\N	2
359	359	270	2022-01-01	SDN Purwodadi-1	Desa Purwodadi, Kecamtan Maliku	Kantin SDN Purwodadi-1	Desa Purwodadi, Kecamatan Maliku	0  	0  	6	13	Pulang Pisau	0	2	0				17	33	\N	t	\N	6
264	264	264	2022-01-01	PT. Rocket Chicken	JL. Oberlin Metar Kel. Pulang Pisau	PT. Rocket Chicken	Jl. Oberlin Metar Kel. Pulang Pisau	0  	0  	5	93	PULANG PISAU	0	2					3	20	\N	t	\N	4
363	361	274	2022-01-03	Omah Gong	Jl. Kasturi	Omah Gong	Jl. Kasturi	014	0  	5	94	Pulang Pisau		2	74813				1	33	\N	t	\N	6
364	362	339	2022-01-03	Suley Anggen	Jl. Lintas PalangKaraya- Kuala Kurun	Pangkalan Gas LPG Tintin	Jl. Lintas Palangkaraya - Kuala Kurun	002	0  	4	15	Pulang Pisau		4	74863				1	58	\N	t	\N	6
365	363	275	2022-01-03	Azkiya	Jl. Nurul Iman	Catering Azkiya	Jl. Nurul Iman Pulang Pisau	04 	0  	5	93	Pulang Pisau	0	2	74841				1	33	\N	t	\N	6
366	364	349	2022-01-03	CV. VILIA ALAM SEJAHTERA	Jl. Menteng V No. 9 Kel. Menteng	CV. VILIA ALAM SEJAHTERA	Jl. Menteng  V No.9 Kel. Menteng	0  	0  	5	93	Pulang Pisau	0	6	74813				1	85	\N	t	\N	2
373	372	343	2022-01-03	Joko Wahyudi	Jl. Desa kantan Muara	CV. Sinar Abadi Pangkoh Tiga	Jl. Desa Kantan Muara	003	001	1	31	Pulang Pisau		4	74871				1	58	\N	t	\N	6
52	52	52	2022-01-01			WM. Depot Mie Kenzie	Jl. Panunjung Tarung Kel. Pulang Pisau 	0  	0  	5	93	PULANG PISAU		2					1	29	\N	t	\N	13
367	365	350	2022-01-03	CV. WIDIA MULIA	Jl. Darung Bawan Km. 13 Anjir Pulang Pisau	CV. WIDIA MULIA	Jl. Darung Bawan Km. 13 Anjir Pulang Pisau	0  	0  	5	6	Pulang Pisau		6	74813				1	85	\N	t	\N	2
368	366	351	2022-01-03	CV. DANAYES AMIN	Jl. Manunggal XV Mantaren I Pulang Pisau	CV. DANAYES AMIN	Jl. Manunggal XV Mantaren I Pulang Pisau	03 	0  	5	92	Pulang Pisau	0	6	74863				1	85	\N	t	\N	2
369	367	352	2022-01-01	Runalhard Wawan, BcKN	JL. Darung Bawan Km. 13	CV. Antang Budi Utama	JL. Darung Bawan Km. 13	13 	0  	5	94	Pulang Pisau	0	6	74813				3	85	\N	t	\N	2
10	10	10	2022-01-01			WM. Sumber Barokah	Jl. Lintas Kalimantan 	0  	0  	5	92	PULANG PISAU		2					3	29	\N	f	3	13
370	368	340	2022-01-03	Roma	Jl. Lintas PalangKaraya- Kuala Kurun	Pangkalan Gas Empat Bersaudara	Jl. Lintas Palangkaraya - Kuala Kurun	005	0  	4	10	Pulang Pisau		4	74863				1	58	\N	t	\N	6
374	373	344	2022-01-03	ANDRE PRASETYOADI	JL. RTA MILONO KM 6 PALANGKA RAYA	PT. DJARUM	JL. LINTAS KALIMANTAN KM. 10 	14 	00 	5	94	Pulang Pisau	0	4	0				38	58	\N	t	\N	1
372	370	342	2022-01-03	Hj. Herni	Jl. Tingang Menteng Pulang Pisau	Toko Nisa	Jl. Tingang Menteng Kel. Pulang Pisau	014	0  	5	93	Pulang Pisau		4	74841				1	58	\N	t	\N	6
375	374	353	2022-01-03	KODIM 1011 KUALA KAPUAS	Desa Tahai Jaya kec. Maliku	KODIM 1011 KUALA KAPUAS	Desa Tahai Jaya Kec. Maliku	0  	0  	6	9	Pulang Pisau		6	74873				1	85	\N	t	\N	37
377	375	354	2022-01-03	SEPTO GUNAWAN	PULANG PISAU	CV. BORNEO BANGUN PERKASA	PULANG PISAU	0  	0  	5	93	Pulang Pisau	0	6	0				38	85	\N	t	\N	2
376	375	276	2022-01-03	SEPTO GUNAWAN	PULANG PISAU	CV. BORNEO BANGUN PERKASA	PULANG PISAU	0  	0  	5	93	Pulang Pisau	0	2	0				38	33	\N	t	\N	2
378	376	277	2022-01-03	Mama Edo	Pulang Pisau	RM MAMA EDO	Pulang Pisau	06 	0  	5	57	Pulang Pisau	081250382363	2	74811				1	33	\N	t	\N	13
379	377	278	2022-01-03	Nisa Abuya	Pulang Pisau	WR. Lesehan Nisa Abuya	Pulang pisau	0  	0  	5	93	Pulang Pisau	0	2	74811				1	33	\N	t	\N	13
380	371	355	2022-01-01			CV. Nazril Hadi Pratama	Gohong	0  	0  	5	95	Pulang Pisau		6	0				3	85	\N	t	\N	2
381	378	279	2022-01-03	PKK Bahaur Basantan	Kecamatan Kahayan Kuala	PKK Bahaur Basantan	Kec. Kahayan Kuala	0  	0  	2	4	Pulang Pisau	0	2	74872				1	33	\N	t	\N	37
382	379	280	2022-01-03	Mama Rizki	Desa Mulyasari	WM. Mama Rizki	Desa Mulyasari	0  	0  	1	28	Pulang Pisau	0	2	74871				1	33	\N	t	\N	13
383	380	281	2022-01-03	PKK Jabiren Raya	Jabiren Raya	PKK Jabiren Raya	Kecamatan Jabiren Raya	0  	0  	7	50	Pulang Pisau	0	2	74816				1	33	\N	t	\N	37
384	381	282	2022-01-03	PKK Bahaur Hulu permai	Kahayan kuala	PKK Bahaur Hulu Permai	Kecamatan Kahayan Kuala	0  	0  	2	3	Pulang Pisau	0	2	74872				1	33	\N	t	\N	37
385	382	283	2022-01-03	Ari	Desa henda	Warung Ari	Desa henda	0  	0  	7	41	Pulang Pisau	0	2	74816				1	33	\N	t	\N	13
386	383	284	2022-01-01			Kantin SDN Gadabung - 2	Desa Gadabung	0  	0  	1	23	Pulang Pisau		2	0				3	33	\N	t	\N	6
387	10	285	2022-01-03	BAROKAH	Jl. Lintas Kalimantan	WM SUMBER BAROKAH	Jl. Lintas Kalimantan	0  	0  	5	93	Pulang Pisau		2	74811				1	29	\N	t	\N	13
388	384	286	2022-01-01			Kantin SDN Maliku Baru - 3	Desa Maliku Baru	0  	0  	6	99	Pulang Pisau		2	0				3	33	\N	t	\N	6
389	385	287	2022-08-25			Kantin Sei Pal Dalam	Kecamatan Kahayan Kuala	0  	0  	2	38	Pulang Pisau		2	0				17	33	\N	t	\N	6
418	414	305	2022-01-03	Wm. Adelia	Jl. Lintas Kalimantan	Wm. Adelia	Jl. Lintas Kalimantan	0  	0  	5	93	Pulang Pisau	0	2	74841				1	29	\N	t	\N	6
390	386	288	2022-01-03	Arema jabiren	Desa Jabiren	Wm. Arema Jabiren	Desa Jabiren	0  	0  	7	50	Pulang Pisau		2	74816				1	33	\N	t	\N	6
391	387	289	2022-01-03	Indah Rahmawati	Jl. Darung Bawan	Ufaira's Kitchen	Jl. Darung Bawan permai Komplek BTN Pal. 11 pulang Pisau	0  	0  	5	94	Pulang Pisau	081256700036	2	74813				1	33	\N	t	\N	6
392	388	290	2022-01-01	Warung MIMIE PANGKOH	Kec.Pandih Batu	Warung MIMIE PANGKOH	Kecamatan Pandih Batu	   	   	1	19	Pulang Pisau		2					17	33	\N	t	\N	6
393	389	356	2022-01-01	CV. GATRA MEGA	Jl. Turi No.02 Palangkaraya	CV. GATRA MEGA	Jl. Turi No.02 Palangkaraya	0  	0  	4	68	Pulang Pisau	0	6	74863				1	85	\N	t	\N	2
394	390	291	2022-01-03	Arsila Catering	Jl. Masrumi Layar Pulang Pisau	Arsila Catering	Jl. Masrumi Layar Pulang Pisau	0  	0  	5	57	Pulang Pisau	0	2	74831				5	33	\N	t	\N	13
395	391	292	2022-01-01	SDN Pulang Pisau - 3	Kec. Kahayan Hilir	Kantin SDN Pulang Pisau - 3	Kec. Kahayan Hilir	0  	0  	5	57	Pulang Pisau	0	2	0				3	33	\N	t	\N	6
396	392	293	2022-01-01	Kantin SDN Maliku Baru - 6	Desa Maliku Baru, Kec. Maliku	Kantin SDN Maliku Baru - 6	-	0  	0  	6	99	Pulang Pisau		2	0				3	33	\N	t	\N	6
397	393	345	2022-01-03	Lamsani	Jl. Desa Tumbang Nusa	Pangkalan LPG Salat Nusa	Jl. Desa Tumbang Nusa	004	0  	7	52	Pulang Pisau	0	4	74816				1	58	\N	t	\N	6
398	394	346	2022-01-03	Rahman	Jl. Lintas Kalimantan Desa jabiren Raya	Pangkalan LPG Mantike Indah	Jl. Lintas Kalimantan Desa jabiren Raya	006	0  	7	50	Pulang Pisau	0	4	74816				1	58	\N	t	\N	6
125	125	125	2022-01-01	\N	\N	Edwin Rangga	Desa Tumbang Nusa	0  	0  	7	52	PULANG PISAU	\N	6	\N			\N	0	85	\N	t	\N	6
399	395	357	2022-01-03	CV. Berka Ortomoro	Jl. Tingang Menteng No.58 b pulang Pisau	CV. Berkat Ortomoro	Jl. Tingang Menteng No.58 b pulang Pisau	013	0  	7	52	Pulang Pisau	0	6	74816				1	85	\N	t	\N	2
400	396	294	2022-01-03	CV. Fajar	Pulang Pisau	CV. Fajar	Pulang Pisau	0  	0  	5	93	Pulang Pisau	0	2	74841				1	33	\N	t	\N	6
401	397	295	2022-01-03	Dewi Indah Rahmawati	Pulang Pisau	CV AL - HIKMAH	Pulang Pisau	0  	0  	5	93	Pulang Pisau	0	2	74841				1	33	\N	t	\N	6
402	398	296	2022-01-01	WM. Aisyah	JL. Tingang Menteng Pulang Pisau	WM. Aisyah	JL. Tingang Menteng 	0  	0  	5	92	Pulang Pisau		2	0				3	29	\N	t	\N	6
403	399	297	2022-08-29	Kedai Berkawan	Kuala Kapuas	Kedai Berkawan	-	0  	0  	5	93	Pulang Pisau		2	0				3	33	\N	t	\N	6
404	400	298	2022-01-01	Kantin SDN Pamarunan - 1	Desa Pamarunan, Kec. Kahayan Tengah	Kantin SDN Pamarunan - 1	-	0  	0  	3	83	Pulang Pisau		2	0				3	33	\N	t	\N	6
405	401	299	2022-01-01	RM. Candi Laras	JL. Lintas Kalimantan 	RM. Candi Laras	JL. Lintas Kalimantan 	10 	   	5	94	Pulang Pisau		2	0				3	22	\N	t	\N	6
406	402	358	2022-01-03	CV. Anugrah Perdana	Jl.Merdeka No.03 Mantaren II Pulang Pisau	CV. Anugrah Perdana	Jl. Merdeka No.03 Mantaren II Pulang Pisau	0  	0  	5	91	Pulang Pisau	0	6	74816				1	85	\N	t	\N	2
407	403	359	2022-01-03	CV. REDROCK	Jl. Tingang Menteng Pulang Pisau	CV. REDROCK	Jl. Tingang Menteng No.74 	09 	0  	5	93	Pulang Pisau	0	6	74841				1	85	\N	t	\N	2
408	404	300	2022-01-01			RM. Anugrah	Jl. Lintas Kalimantan	   	   	5	94	Pulang Pisau		2					17	22	\N	t	\N	6
409	405	301	2022-01-03	Angelica amenia	Pulang Pisau	Angelica Kitchen	Pulang Pisau	0  	0  	5	93	Pulang Pisau	0	2	74841				1	33	\N	t	\N	6
410	406	360	2022-01-03	CV. HBK MANASA	Jl. Beliang No.39	CV. HBK MANASA	Jl. Beliang No. 39	0  	0  	4	63	Pulang Pisau	0	6	74863				1	85	\N	t	\N	2
411	407	361	2022-01-03	CV. KARUHEI TATAU	Jl. Ngambun Hawun Kel. Bereng	CV. KARUHEI TATAU	Jl. Ngambun Hawun Kel. Bereng	05 	0  	5	57	Pulang Pisau	0	6	74831				1	85	\N	t	\N	2
412	408	362	2022-01-03	CV. NOORMA SARI	Pulang Pisau	CV. NOORMA SARI	Jl. Pemuda komp. Pemuda permai	0  	0  	1	21	Pulang Pisau	0	6	74871				1	85	\N	t	\N	2
413	409	347	2022-01-01	Dewi Indah Rakhmawati	JL. TIngang Menteng RT. 009, Kel. Pulang Pisau, Kec. Kahayan Hilir	CV. AL-Hikmah	JL. Tingang Menteng 	9  	0  	5	93	Pulang Pisau		4	0				3	58	\N	t	\N	6
414	410	302	2022-01-01	Novi	JL. Darung Bawan Perumahan Pal. 11	Catering Widya	JL. Darung Bawan Perumahan Pal. 11	11 	   	5	94	Pulang Pisau		2	0				3	33	\N	t	\N	6
415	411	348	2022-08-31	JEPRIAH TARIGAN	Jl. Desa Tuwung RT. 002 Nomor 06 Desa Tuwung	RIKO FARM	Jl. Desa Tuwung RT. 002 Nomor 06 Desa Tuwung	002	0  	3	78	Pulang Pisau	0	4	0				5	58	\N	t	\N	6
416	412	303	2022-01-03	Wm. Melati Kuin	Jl. Lintas Kalimantan	Wm. Melati Kuin	Jl. Lintas Kalimantan	0  	0  	5	93	Pulang Pisau	0	2	74841				1	29	\N	t	\N	6
417	413	304	2022-01-03	Wm. Mama Aida	Jl. Lintas Kalimantan	Wm. Mama Aida	Jl. Lintas Kalimantan	0  	0  	5	93	Pulang Pisau	0	2	74841				1	29	\N	t	\N	6
419	416	306	2022-01-03	Wm. H Idah	Jl. Lintas Kalimantan	Wm. H Idah	Jl. Lintas Kalimantan	0  	0  	5	93	Pulang Pisau	0	2	74841				1	29	\N	t	\N	6
420	417	307	2022-01-03	Wm. 99	Jl. Lintas Kalimantan	Wm. 99	Jl. Lintas Kalimantan	0  	0  	5	93	Pulang Pisau	0	2	74841				1	29	\N	t	\N	6
421	418	349	2022-01-03	Yuapriadi Mangkin	Jl. Lintas Palangkaraya - Bahaur Desa Buntoi	UD. Absa Aron Mandiri	Jl. Lintas Palangkaraya - Bahaur Desa Buntoi	006	0  	5	89	Pulang Pisau	0	4	74841				1	58	\N	t	\N	6
\.


--
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_id_seq', 420, false);


--
-- Name: rekam_penyetoran_ke_bank_rektorkebank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rekam_penyetoran_ke_bank_rektorkebank_id_seq', 1, false);


--
-- Name: resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resource_id_seq', 34, false);


--
-- Name: role_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_rid_seq', 7, false);


--
-- Name: s_air_jenis_s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_air_jenis_s_id_seq', 1, false);


--
-- Name: s_air_kelompok_s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_air_kelompok_s_id_seq', 1, false);


--
-- Name: s_air_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_air_seq', 1, false);


--
-- Name: s_air_tarif_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_air_tarif_s_idtarif_seq', 1, false);


--
-- Name: s_air_tarifpipa_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_air_tarifpipa_s_idtarif_seq', 1, false);


--
-- Name: s_air_zona_s_idzona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_air_zona_s_idzona_seq', 1, false);


--
-- Name: s_airperuntukan_s_idperuntukan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_airperuntukan_s_idperuntukan_seq', 2, false);


--
-- Name: s_cekungan_s_idcekungan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_cekungan_s_idcekungan_seq', 1, false);


--
-- Name: s_faktorkerusakan_s_idkerusakan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_faktorkerusakan_s_idkerusakan_seq', 1, false);


--
-- Name: s_faktorkualitasair_s_idfaktorkualitas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_faktorkualitasair_s_idfaktorkualitas_seq', 1, false);


--
-- Name: s_faktorluasarea_s_idfaktorluasarea_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_faktorluasarea_s_idfaktorluasarea_seq', 1, false);


--
-- Name: s_faktorsumberair_s_idsumberair_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_faktorsumberair_s_idsumberair_seq', 1, false);


--
-- Name: s_hargaairbaku_s_idhargaairbaku_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_hargaairbaku_s_idhargaairbaku_seq', 1, false);


--
-- Name: s_ho_gangguan_s_idgangguan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_ho_gangguan_s_idgangguan_seq', 1, false);


--
-- Name: s_ho_lokasi_s_idlokasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_ho_lokasi_s_idlokasi_seq', 1, false);


--
-- Name: s_ho_luas_s_idluas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_ho_luas_s_idluas_seq', 1, false);


--
-- Name: s_ho_skala_s_idskala_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_ho_skala_s_idskala_seq', 1, false);


--
-- Name: s_imb_gunabgn_s_idgunabgn_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_imb_gunabgn_s_idgunabgn_seq', 1, false);


--
-- Name: s_imb_kondisi_s_idkondisi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_imb_kondisi_s_idkondisi_seq', 1, false);


--
-- Name: s_imb_lantai_s_idlantai_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_imb_lantai_s_idlantai_seq', 1, false);


--
-- Name: s_imb_lokasi_s_idlokasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_imb_lokasi_s_idlokasi_seq', 1, false);


--
-- Name: s_imb_luas_s_idluas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_imb_luas_s_idluas_seq', 1, false);


--
-- Name: s_imb_tarif_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_imb_tarif_s_idtarif_seq', 1, false);


--
-- Name: s_jaringanpdam_s_idjaringan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_jaringanpdam_s_idjaringan_seq', 1, false);


--
-- Name: s_jenisobjek_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_jenisobjek_seq', 15, false);


--
-- Name: s_jenisreklame_s_idjenisreklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_jenisreklame_s_idjenisreklame_seq', 1, false);


--
-- Name: s_jenissurat_s_idsurat; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_jenissurat_s_idsurat', 1, false);


--
-- Name: s_jenissurat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_jenissurat_seq', 10, false);


--
-- Name: s_kecamatan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_kecamatan_seq', 1, false);


--
-- Name: s_kekayaan_tarif_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_kekayaan_tarif_s_idtarif_seq', 1, false);


--
-- Name: s_kekayaankategorisatu_s_idkategorisatu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_kekayaankategorisatu_s_idkategorisatu_seq', 1, false);


--
-- Name: s_kekayaanpenggunaan_s_idpenggunaan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_kekayaanpenggunaan_s_idpenggunaan_seq', 1, false);


--
-- Name: s_kekayaantarif_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_kekayaantarif_s_idtarif_seq', 1, false);


--
-- Name: s_kelompoktargetsatker_s_idkelompoktarget_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_kelompoktargetsatker_s_idkelompoktarget_seq', 1, true);


--
-- Name: s_kelurahan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_kelurahan_seq', 1, false);


--
-- Name: s_minerba_jenis_s_idjenisminerba_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_minerba_jenis_s_idjenisminerba_seq', 109, true);


--
-- Name: s_pejabat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_pejabat_seq', 47, true);


--
-- Name: s_pemda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_pemda_seq', 1, false);


--
-- Name: s_rekening_s_idkorek_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_rekening_s_idkorek_seq', 900, true);


--
-- Name: s_rekening_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_rekening_seq', 881, true);


--
-- Name: s_reklame_berjalan_s_idberjalan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_berjalan_s_idberjalan_seq', 1, false);


--
-- Name: s_reklame_index_tinggi_s_idindex_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_index_tinggi_s_idindex_seq', 1, false);


--
-- Name: s_reklame_index_zona_s_idindex_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_index_zona_s_idindex_seq', 1, false);


--
-- Name: s_reklame_jangkawaktureklame_s_idjangkawaktureklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_jangkawaktureklame_s_idjangkawaktureklame_seq', 1, false);


--
-- Name: s_reklame_jenis_s_idjenis_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_jenis_s_idjenis_seq', 58, true);


--
-- Name: s_reklame_kawasan_s_idkawasan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_kawasan_s_idkawasan_seq', 4, true);


--
-- Name: s_reklame_klarifikasi_jalan_s_idklj_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_klarifikasi_jalan_s_idklj_seq', 1, false);


--
-- Name: s_reklame_koefisienjenis_s_idkoefisienjenis_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_koefisienjenis_s_idkoefisienjenis_seq', 1, false);


--
-- Name: s_reklame_koefisienpemasangan_s_idkoefisienpemasangan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_koefisienpemasangan_s_idkoefisienpemasangan_seq', 1, false);


--
-- Name: s_reklame_lokasi_s_idlokasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_lokasi_s_idlokasi_seq', 1, false);


--
-- Name: s_reklame_njopr_s_idnjopr_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_njopr_s_idnjopr_seq', 1, false);


--
-- Name: s_reklame_selebaran_s_idselebaran_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_selebaran_s_idselebaran_seq', 1, false);


--
-- Name: s_reklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_seq', 1, false);


--
-- Name: s_reklame_skorukuran_s_idskorukuran_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_skorukuran_s_idskorukuran_seq', 1, false);


--
-- Name: s_reklame_stiker_s_idstiker_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_stiker_s_idstiker_seq', 1, false);


--
-- Name: s_reklame_tarif_kawasan_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_tarif_kawasan_s_idtarif_seq', 1, false);


--
-- Name: s_reklame_tarif_klarifikasi_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_tarif_klarifikasi_s_idtarif_seq', 1, false);


--
-- Name: s_reklame_tarif_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_tarif_s_idtarif_seq', 1, false);


--
-- Name: s_reklame_tarif_supiori_s_idtarifsupiori_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_tarif_supiori_s_idtarifsupiori_seq', 5, true);


--
-- Name: s_reklame_tarif_tinggi_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_tarif_tinggi_s_idtarif_seq', 1, false);


--
-- Name: s_reklame_wilayah_s_idwilayah_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_wilayah_s_idwilayah_seq', 1, false);


--
-- Name: s_reklame_zonawilayah_s_idzona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklame_zonawilayah_s_idzona_seq', 1, false);


--
-- Name: s_reklamenilaiinsidentil_s_idreklamenilaiinsidentil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklamenilaiinsidentil_s_idreklamenilaiinsidentil_seq', 13, true);


--
-- Name: s_reklamenilaijalan_s_idreklamenilaijalan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklamenilaijalan_s_idreklamenilaijalan_seq', 67, true);


--
-- Name: s_reklamenjop_s_idnjopreklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklamenjop_s_idnjopreklame_seq', 37, true);


--
-- Name: s_reklamesatuan_s_idsatuanreklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklamesatuan_s_idsatuanreklame_seq', 20, true);


--
-- Name: s_reklametariftambahan_s_idreklametariftambahan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_reklametariftambahan_s_idreklametariftambahan_seq', 3, true);


--
-- Name: s_satker_s_idsatker_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_satker_s_idsatker_seq', 1, false);


--
-- Name: s_target_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_target_seq', 3, true);


--
-- Name: s_targetdetail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_targetdetail_seq', 104, true);


--
-- Name: s_targetjenis_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_targetjenis_seq', 1, false);


--
-- Name: s_targetsatker_s_idtargetsater_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_targetsatker_s_idtargetsater_seq', 1, true);


--
-- Name: s_tarifbudidaya_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tarifbudidaya_s_idtarif_seq', 1, false);


--
-- Name: s_tarifbudidayamutiara_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tarifbudidayamutiara_s_idtarif_seq', 1, false);


--
-- Name: s_tarifgedung_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tarifgedung_seq', 1, false);


--
-- Name: s_tarifkapal_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tarifkapal_s_idtarif_seq', 1, false);


--
-- Name: s_tarifkebersihan_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tarifkebersihan_s_idtarif_seq', 1, false);


--
-- Name: s_tarifkir_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tarifkir_s_idtarif_seq', 1, false);


--
-- Name: s_tarifparkirtepi_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tarifparkirtepi_s_idtarif_seq', 1, false);


--
-- Name: s_tarifpasar_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tarifpasar_s_idtarif_seq', 1, false);


--
-- Name: s_tarifpasargrosir_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tarifpasargrosir_s_idtarif_seq', 1, false);


--
-- Name: s_tarifpemadam_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tarifpemadam_s_idtarif_seq', 1, false);


--
-- Name: s_tarifrumahdinas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tarifrumahdinas_seq', 1, false);


--
-- Name: s_tariftanahreklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tariftanahreklame_seq', 1, false);


--
-- Name: s_tariftempatparkir_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tariftempatparkir_s_idtarif_seq', 1, false);


--
-- Name: s_tariftera_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tariftera_s_idtarif_seq', 1, false);


--
-- Name: s_tarifterminal_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tarifterminal_s_idtarif_seq', 1, false);


--
-- Name: s_tariftrayek_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tariftrayek_s_idtarif_seq', 1, false);


--
-- Name: s_tipeusaha_s_idusaha_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_tipeusaha_s_idusaha_seq', 1, false);


--
-- Name: s_users_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_users_seq', 44, true);


--
-- Name: t_angsuran_t_idangsuran_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_angsuran_t_idangsuran_seq', 5, true);


--
-- Name: t_berkas_t_idberkas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_berkas_t_idberkas_seq', 40, true);


--
-- Name: t_datailwalet_t_iddetailwalet_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_datailwalet_t_iddetailwalet_seq', 1, true);


--
-- Name: t_dataop_t_idop_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_dataop_t_idop_seq', 1, false);


--
-- Name: t_datatransaksi_t_idtransaksi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_datatransaksi_t_idtransaksi_seq', 1, false);


--
-- Name: t_datawpdaftar_t_idwp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_datawpdaftar_t_idwp_seq', 1, false);


--
-- Name: t_datawpusaha_t_idwp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_datawpusaha_t_idwp_seq', 1, false);


--
-- Name: t_detailair_t_idair_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailair_t_idair_seq', 79, true);


--
-- Name: t_detailgedung_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailgedung_seq', 1, false);


--
-- Name: t_detailho_t_idretho_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailho_t_idretho_seq', 1, false);


--
-- Name: t_detailimb_t_idretimb_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailimb_t_idretimb_seq', 1, false);


--
-- Name: t_detailkebersihan_t_idkebersihan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailkebersihan_t_idkebersihan_seq', 370, true);


--
-- Name: t_detailkekayaan_t_idkekayaan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailkekayaan_t_idkekayaan_seq', 19, true);


--
-- Name: t_detailkir_t_iddetailkir_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailkir_t_iddetailkir_seq', 1, false);


--
-- Name: t_detailminerba_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailminerba_seq', 106, true);


--
-- Name: t_detailpanggungreklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailpanggungreklame_seq', 1, false);


--
-- Name: t_detailparkir_t_idparkir_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailparkir_t_idparkir_seq', 1, false);


--
-- Name: t_detailparkirtepi_t_iddetailret_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailparkirtepi_t_iddetailret_seq', 1, false);


--
-- Name: t_detailpasar_t_idpasar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailpasar_t_idpasar_seq', 298, true);


--
-- Name: t_detailpasargrosir_t_idpasargrosir_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailpasargrosir_t_idpasargrosir_seq', 310, true);


--
-- Name: t_detailpemadam_t_idretpemadam_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailpemadam_t_idretpemadam_seq', 1, false);


--
-- Name: t_detailperikanan_t_idperikanan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailperikanan_t_idperikanan_seq', 1, false);


--
-- Name: t_detailppj_t_iddetailppj_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailppj_t_iddetailppj_seq', 1, false);


--
-- Name: t_detailreklame_t_iddetailreklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailreklame_t_iddetailreklame_seq', 27, true);


--
-- Name: t_detailretribusi_t_iddetailret_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailretribusi_t_iddetailret_seq', 1, false);


--
-- Name: t_detailrumahdinas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailrumahdinas_seq', 1, false);


--
-- Name: t_detailtanahlain_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailtanahlain_seq', 1, false);


--
-- Name: t_detailtanahreklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailtanahreklame_seq', 1, false);


--
-- Name: t_detailtempatparkir_t_idtempatparkir_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailtempatparkir_t_idtempatparkir_seq', 1, false);


--
-- Name: t_detailtera_t_idtera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailtera_t_idtera_seq', 1, false);


--
-- Name: t_detailterminal_t_iddetailret_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailterminal_t_iddetailret_seq', 1, false);


--
-- Name: t_detailtrayek_t_iddetailret_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailtrayek_t_iddetailret_seq', 1, false);


--
-- Name: t_jenispelayanan_terminal_t_idjenispelayanan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_jenispelayanan_terminal_t_idjenispelayanan_seq', 1, false);


--
-- Name: t_kantorskpd_t_idskpd_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_kantorskpd_t_idskpd_seq', 1, false);


--
-- Name: t_keberatan_t_idkeberatan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_keberatan_t_idkeberatan_seq', 20, true);


--
-- Name: t_klasifikasi_kebersihan_t_idklasifikasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_klasifikasi_kebersihan_t_idklasifikasi_seq', 1, false);


--
-- Name: t_klasifikasi_pasar_t_idklasifikasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_klasifikasi_pasar_t_idklasifikasi_seq', 1, false);


--
-- Name: t_klasifikasi_pasargrosir_t_idklasifikasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_klasifikasi_pasargrosir_t_idklasifikasi_seq', 1, false);


--
-- Name: t_lampiranppj_t_idlampiranppj_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_lampiranppj_t_idlampiranppj_seq', 1, false);


--
-- Name: t_setoranlain_t_idsetoranlain_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_setoranlain_t_idsetoranlain_seq', 6, true);


--
-- Name: t_setoranlain_t_nomorurut_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_setoranlain_t_nomorurut_seq', 6, true);


--
-- Name: t_setorbankdetail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_setorbankdetail_seq', 3878, true);


--
-- Name: t_setorbankheader_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_setorbankheader_seq', 145, true);


--
-- Name: t_skpdkb_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_skpdkb_seq', 5, true);


--
-- Name: t_skpdkbt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_skpdkbt_seq', 1, true);


--
-- Name: t_skpdlb_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_skpdlb_seq', 1, true);


--
-- Name: t_skpdn_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_skpdn_seq', 1, true);


--
-- Name: t_skpdt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_skpdt_seq', 7, true);


--
-- Name: t_suratkesanggupan_t_idsurat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_suratkesanggupan_t_idsurat_seq', 1, false);


--
-- Name: t_teguranlaporpajak_t_idteguran_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_teguranlaporpajak_t_idteguran_seq', 4, true);


--
-- Name: t_transaksi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_transaksi_seq', 414, true);


--
-- Name: t_wp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_wp_seq', 418, true);


--
-- Name: t_wpobjek_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_wpobjek_seq', 421, true);


--
-- Name: t_wpobjekgenset_t_idgensetobjek_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_wpobjekgenset_t_idgensetobjek_seq', 1, false);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: s_airperuntukan s_airperuntukan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.s_airperuntukan
    ADD CONSTRAINT s_airperuntukan_pkey PRIMARY KEY (s_idperuntukan);


--
-- Name: s_targetsatker s_targetsatker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.s_targetsatker
    ADD CONSTRAINT s_targetsatker_pkey PRIMARY KEY (s_idtargetsatker);


--
-- Name: t_berkas t_berkas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_berkas
    ADD CONSTRAINT t_berkas_pkey PRIMARY KEY (t_idberkas);


--
-- Name: t_transaksi t_transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_transaksi
    ADD CONSTRAINT t_transaksi_pkey PRIMARY KEY (t_idtransaksi);


--
-- Name: t_wp t_wp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_wp
    ADD CONSTRAINT t_wp_pkey PRIMARY KEY (t_idwp);


--
-- Name: t_wpobjek t_wpobjek_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_wpobjek
    ADD CONSTRAINT t_wpobjek_pkey PRIMARY KEY (t_idobjek);


--
-- PostgreSQL database dump complete
--

