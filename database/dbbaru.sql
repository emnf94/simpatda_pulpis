--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: coba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coba (
    s_idtarifsupiori integer,
    s_idjenisreklame integer,
    s_njopr integer,
    s_nspr integer,
    s_nsr integer,
    s_kodejangkawaktu integer,
    s_satuan character varying(255),
    s_keterangan character varying(255)
);


ALTER TABLE public.coba OWNER TO postgres;

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
    status character(255) DEFAULT 'Active'::bpchar NOT NULL
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
    s_keterangan character varying(255)
);


ALTER TABLE public.s_minerba_jenis OWNER TO postgres;

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
    is_deluser integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.s_rekening OWNER TO postgres;

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
    s_indeks real
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
    s_satuanukuran character varying(10)
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
    s_kodesatker character varying(15) NOT NULL,
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
    t_idklasifikasi integer NOT NULL,
    t_nilailuastanah double precision NOT NULL,
    t_nilailuasbangunan double precision NOT NULL,
    t_luastanah double precision NOT NULL,
    t_luasbangunan double precision NOT NULL,
    t_jmlhbln double precision NOT NULL,
    t_potongan integer,
    t_kategorisatu integer,
    t_kategoridua integer,
    t_hargatanah double precision,
    t_hargadasarsewa double precision
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
    t_volume numeric(22,2) NOT NULL,
    t_hargapasaran integer NOT NULL,
    t_jumlah double precision NOT NULL,
    t_tarifpersen double precision NOT NULL,
    t_pajak double precision NOT NULL
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
    t_jenisbangunan integer NOT NULL,
    t_panjang double precision NOT NULL,
    t_lebar double precision NOT NULL,
    t_luas double precision NOT NULL,
    t_tarifdasar double precision NOT NULL,
    t_jmlhbln double precision NOT NULL,
    t_potongan integer,
    t_keteranganpasar character varying(255),
    t_nokios integer
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
    t_idkorek integer NOT NULL,
    t_nilailistrik double precision NOT NULL,
    t_subtotalpajak double precision NOT NULL,
    t_pajak double precision
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
    t_parameter character varying(255)
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
    t_jmlhditetapkan double precision
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
    t_nomorurut integer DEFAULT nextval('public.t_setoranlain_t_nomorurut_seq'::regclass) NOT NULL
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
    t_file_berkas character varying(255)
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
     LEFT JOIN public.s_jenisobjek f ON ((e.t_jenisobjek = f.s_idjenis)))
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
    view_rekening.s_objekkorek,
    view_rekening.s_rinciankorek,
    view_rekening.s_sub1korek,
    view_rekening.s_sub2korek,
    view_rekening.s_sub3korek,
    view_rekening.s_namakorek,
    view_rekening.s_persentarifkorek,
    view_rekening.s_voldasarkorek,
    view_rekening.s_tariftambahkorek,
    view_rekening.s_tglawalkorek,
    view_rekening.s_tglakhirkorek,
    view_rekening.is_deluser,
    view_rekening.s_namajenis,
    view_rekening.t_berdasarmasa,
    view_rekening.s_idjenis
   FROM (public.s_minerba_jenis
     JOIN public.view_rekening ON ((s_minerba_jenis.s_idkorek = view_rekening.s_idkorek)));


ALTER TABLE public.view_rekmin OWNER TO postgres;

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
    a.t_nama_badan,
    a.t_nama,
        CASE
            WHEN (a.t_bidangusaha = 1) THEN (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((b.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((c.s_kodekel)::text, 2, '0'::text))
            ELSE (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((d.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((e.s_kodekel)::text, 2, '0'::text))
        END AS t_npwpd,
    a.t_nik,
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


ALTER TABLE public.view_wp_v2 OWNER TO postgres;

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
-- Data for Name: coba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coba (s_idtarifsupiori, s_idjenisreklame, s_njopr, s_nspr, s_nsr, s_kodejangkawaktu, s_satuan, s_keterangan) FROM stdin;
\.


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
29	81
29	79
29	196
29	195
29	197
29	198
29	200
29	201
29	202
29	203
29	210
29	211
29	213
29	204
29	212
29	207
29	206
29	208
29	209
29	219
29	221
29	220
29	218
29	216
29	215
29	214
29	245
29	247
29	237
29	239
29	241
29	242
29	243
29	244
29	248
29	246
29	249
29	309
29	391
29	381
29	379
29	378
29	307
29	305
29	304
29	310
29	311
29	308
29	306
29	407
29	406
29	392
29	404
29	403
29	402
29	401
29	400
29	399
29	398
29	396
29	395
29	394
29	393
29	428
29	452
29	453
29	456
29	455
29	454
29	427
29	457
29	449
29	448
29	451
29	450
29	447
29	424
29	425
29	490
29	500
29	539
29	397
29	199
29	205
29	217
29	496
29	501
29	499
29	497
29	495
29	494
29	238
29	520
29	250
29	385
29	312
29	383
29	502
29	78
29	80
29	357
29	380
29	503
29	405
29	426
29	498
29	493
29	382
29	240
29	526
29	528
29	536
29	537
29	538
29	540
29	541
29	542
28	81
28	173
28	82
28	84
28	85
28	86
28	87
28	88
28	89
28	91
28	92
28	93
28	94
28	95
28	96
28	97
28	147
28	148
28	149
28	150
28	151
28	152
28	153
28	154
28	155
28	101
28	102
28	103
28	104
28	105
28	107
28	99
28	108
28	109
28	119
28	120
28	121
28	122
28	124
28	125
28	126
28	127
28	128
28	129
28	131
28	132
28	133
28	134
28	135
28	139
28	142
28	143
28	144
28	164
28	156
28	157
28	158
28	159
28	161
28	162
28	163
28	165
28	166
28	169
28	167
28	168
28	170
28	79
28	171
28	182
28	180
28	177
28	184
28	183
28	172
28	178
28	179
28	185
28	175
28	145
28	188
28	191
28	190
28	230
28	194
28	192
28	193
28	196
28	195
28	197
28	198
28	200
28	201
28	202
28	203
28	210
28	211
28	213
28	204
28	212
28	207
28	206
28	208
28	209
30	81
30	79
30	230
30	281
30	233
30	282
30	235
30	245
30	247
30	237
30	239
30	241
30	242
30	243
30	244
30	248
30	278
30	280
30	246
30	249
30	236
30	288
30	279
30	287
30	284
30	285
30	286
30	232
30	293
30	376
30	381
30	379
30	378
30	377
30	374
30	292
30	384
30	291
30	375
30	456
30	455
30	454
30	457
30	490
30	500
30	496
30	501
30	499
30	497
30	495
30	494
30	238
30	520
30	250
30	385
30	290
30	283
30	383
30	502
30	78
30	80
30	357
30	380
30	503
30	231
30	498
30	493
30	382
30	240
30	234
30	289
30	526
30	528
30	536
28	219
28	221
28	220
28	218
28	216
28	215
28	214
28	223
28	224
28	226
28	227
28	222
28	229
28	228
28	281
28	233
28	282
28	235
28	186
28	245
28	247
28	237
28	239
28	241
28	242
28	243
28	244
28	248
28	278
28	280
28	246
28	249
28	236
28	251
28	252
28	256
28	255
28	253
28	258
28	257
28	259
28	264
28	263
28	262
28	261
28	260
28	267
28	268
28	269
28	270
28	266
28	271
28	276
28	272
28	274
28	275
28	277
28	288
28	279
28	287
28	284
28	285
28	286
28	232
28	367
28	370
28	371
28	309
28	315
28	319
28	314
28	373
28	391
28	293
28	376
28	313
28	381
28	379
28	378
28	377
28	374
28	292
28	307
28	305
28	304
28	384
28	310
28	311
28	308
28	306
28	388
28	387
28	386
28	291
28	323
28	320
28	294
28	298
28	295
28	296
28	297
28	299
28	300
28	301
28	302
28	303
28	322
28	316
28	317
28	318
28	375
28	334
28	332
28	358
28	331
28	341
28	340
28	339
28	338
28	337
28	336
28	335
28	330
28	329
28	328
28	326
25	81
25	173
25	82
25	84
25	85
25	86
25	87
25	88
25	89
25	91
25	92
25	93
25	94
25	95
25	96
25	97
25	147
25	148
25	149
25	150
25	151
25	152
25	153
25	154
25	155
25	101
25	102
25	103
25	104
25	105
25	107
25	99
25	108
25	109
25	119
25	120
25	121
25	122
25	124
25	125
25	126
25	127
25	128
25	129
25	131
25	132
25	133
25	134
25	135
25	139
25	142
25	143
25	144
25	164
25	156
25	157
25	158
25	159
25	161
25	162
25	163
25	165
25	166
25	169
25	167
25	168
25	170
25	79
25	171
25	182
25	180
25	177
25	184
25	183
25	172
25	178
25	179
25	185
25	175
25	145
25	188
25	191
25	190
25	194
25	192
25	193
33	81
33	173
33	82
33	84
33	85
33	86
33	87
33	88
33	89
33	91
33	92
33	93
33	94
33	95
33	96
33	97
33	147
33	148
33	149
33	150
33	151
33	152
33	153
33	154
33	155
33	101
33	102
33	103
33	104
33	105
33	107
33	99
33	108
33	109
33	119
33	120
33	121
33	122
33	124
28	325
28	324
28	364
28	363
28	362
33	125
33	126
33	127
33	128
33	129
33	131
33	132
33	133
33	134
33	135
33	139
33	142
33	143
33	144
33	164
33	156
33	157
33	158
33	159
33	161
33	162
33	163
33	165
33	166
33	169
33	167
33	168
33	170
33	79
33	171
33	182
33	180
33	177
33	184
33	183
33	172
33	178
33	179
33	185
33	175
33	145
33	188
33	191
33	190
33	230
33	194
33	192
33	193
33	196
33	195
33	197
33	198
33	200
33	201
33	202
33	203
25	186
25	245
25	247
25	237
25	239
25	241
25	242
28	361
28	360
28	359
28	390
28	343
28	342
28	389
28	347
28	346
28	345
28	350
28	349
28	348
28	355
28	354
28	366
28	365
28	356
28	352
28	351
28	369
28	418
28	422
28	420
28	421
28	417
28	416
28	410
28	409
28	408
28	491
28	407
28	406
28	392
28	404
28	403
28	402
28	401
28	400
28	399
28	398
28	396
28	395
28	394
28	393
28	428
28	452
28	453
28	431
28	429
28	456
28	455
28	454
28	427
28	457
28	449
28	488
28	458
28	459
28	460
28	461
28	462
28	463
28	464
28	466
28	467
28	468
28	469
28	470
28	471
28	472
28	473
28	474
28	475
28	476
28	477
28	478
28	479
28	480
28	481
28	482
28	483
28	484
28	485
28	486
28	448
28	451
28	450
28	447
28	424
28	425
28	490
28	433
28	432
28	437
28	436
28	435
28	440
28	438
28	439
28	443
28	441
28	444
28	445
28	446
28	489
28	500
28	83
28	90
28	98
28	505
28	419
28	368
28	507
28	506
28	519
28	517
28	516
28	515
28	514
28	513
28	512
28	511
28	510
28	508
28	504
28	423
28	539
28	397
28	199
28	205
28	217
28	225
28	430
28	496
28	501
28	499
28	497
28	495
28	494
28	238
28	520
28	250
28	385
28	290
28	100
28	254
28	265
28	273
28	465
28	487
28	333
28	327
28	344
28	353
28	434
28	442
28	283
28	146
28	106
28	518
28	123
28	130
28	140
28	141
28	160
28	492
28	372
28	312
28	383
28	502
28	78
28	80
28	357
28	189
28	380
28	503
28	176
28	187
28	181
28	321
28	405
28	231
28	426
28	498
28	493
28	382
28	240
28	174
28	234
28	289
28	524
28	525
28	526
28	527
28	530
28	528
28	529
28	531
28	532
28	533
28	534
28	535
28	536
28	537
28	543
28	544
28	545
28	546
28	547
28	548
28	549
28	550
28	551
28	538
28	540
28	541
28	542
28	552
28	553
28	554
28	555
28	556
28	557
28	558
28	559
28	560
28	565
28	562
28	561
28	566
28	567
28	568
28	569
28	570
28	571
28	572
28	573
28	574
28	575
28	576
28	578
28	577
28	579
28	580
28	581
28	582
28	583
28	584
12	81
12	79
12	196
12	195
12	197
12	198
12	200
12	201
12	202
12	203
12	210
12	211
12	213
12	204
12	212
12	207
12	206
12	208
12	209
12	219
12	221
12	220
12	218
12	216
12	215
12	214
12	245
12	247
12	237
12	239
12	241
12	242
12	243
12	244
12	248
12	246
12	249
12	309
12	391
12	381
12	379
12	378
12	307
12	305
12	304
12	310
12	311
12	308
12	306
12	407
12	406
12	392
12	404
12	403
12	402
12	401
12	400
12	399
12	398
12	396
12	395
12	394
12	393
12	428
12	452
12	453
12	456
12	455
12	454
12	427
12	457
12	449
12	448
12	451
12	450
12	447
12	424
12	425
12	490
12	500
12	539
12	397
12	199
12	205
12	217
12	496
12	501
12	499
12	497
12	495
12	494
12	238
12	520
12	250
12	385
12	312
12	383
12	502
12	78
12	80
12	357
12	380
12	503
12	405
12	426
12	498
12	493
12	382
12	240
12	526
12	528
12	536
12	537
12	538
12	540
12	541
12	542
12	552
12	553
12	554
12	555
12	556
12	557
12	558
12	559
12	560
12	565
12	562
12	561
13	81
13	173
13	82
13	84
13	85
13	86
13	87
13	88
13	89
13	91
13	92
13	93
13	94
13	95
13	96
13	97
13	147
13	148
13	149
13	150
13	151
13	152
13	153
13	154
13	155
13	101
13	102
13	103
13	104
13	105
13	107
13	99
13	108
13	109
13	119
13	120
13	121
13	122
13	124
13	125
13	126
13	127
13	128
13	129
13	131
13	132
13	133
13	134
13	135
13	139
13	142
13	143
13	144
13	164
13	156
13	157
13	158
13	159
13	161
13	162
13	163
13	165
13	166
13	169
13	167
13	168
13	170
13	79
13	171
13	182
13	180
13	177
13	184
13	183
13	172
13	178
13	179
13	185
13	175
13	145
13	188
13	191
13	190
13	194
13	192
13	193
13	186
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
13	367
13	370
13	371
13	315
13	314
13	373
13	313
13	381
13	379
13	378
13	369
13	418
13	422
13	420
13	421
13	417
13	416
13	410
13	409
13	408
13	491
13	456
13	455
13	454
13	457
13	490
13	489
13	500
13	83
13	90
13	98
13	505
13	419
13	368
13	507
13	506
13	519
13	517
13	516
13	515
13	514
13	513
13	512
13	511
13	510
13	508
13	504
13	423
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
13	100
13	146
13	106
13	518
13	123
13	130
13	140
13	141
13	160
13	492
13	372
13	383
13	502
13	78
13	80
13	357
13	189
13	380
13	503
13	176
13	187
13	181
13	498
13	493
13	382
13	240
13	174
13	524
13	525
13	526
13	528
13	536
13	543
13	544
13	545
13	546
13	547
13	548
13	549
13	550
13	551
13	566
13	567
13	568
13	569
13	570
13	571
13	572
13	573
13	574
13	575
13	576
13	578
13	577
13	579
13	580
13	581
13	582
13	583
13	584
25	243
25	244
25	248
25	246
25	249
25	367
25	370
25	371
25	315
25	314
25	373
25	313
25	381
25	379
25	378
25	369
25	418
25	422
25	420
25	421
25	417
25	416
25	410
25	409
25	408
25	491
25	456
25	455
25	454
25	457
25	490
25	489
25	500
25	83
25	90
25	98
25	505
25	419
25	368
25	507
25	506
25	519
25	517
25	516
25	515
25	514
25	513
25	512
25	511
25	510
25	508
25	504
25	423
25	496
25	501
25	499
25	497
25	495
25	494
25	238
25	520
25	250
25	385
25	100
25	146
25	106
25	518
25	123
25	130
25	140
25	141
25	160
25	492
25	372
25	383
25	502
25	78
25	80
25	357
25	189
25	380
25	503
25	176
25	187
25	181
25	498
25	493
25	382
25	240
25	174
25	524
25	525
25	526
25	528
25	536
25	543
25	544
25	545
25	546
25	547
25	548
25	549
25	550
25	551
25	566
25	567
25	568
25	569
25	570
25	571
25	572
25	573
25	574
25	575
25	576
25	578
25	577
25	579
25	580
25	581
25	582
25	583
25	584
33	210
33	211
33	213
33	204
33	212
33	207
33	206
33	208
33	209
33	219
33	221
33	220
33	218
33	216
33	215
33	214
33	223
33	224
33	226
33	227
33	222
33	229
33	228
33	281
33	233
33	282
33	235
33	186
33	245
33	247
33	237
33	239
33	241
33	242
33	243
33	244
33	248
33	278
33	280
33	246
33	249
33	236
33	251
33	252
33	256
33	255
33	253
33	258
33	257
33	259
33	264
33	263
33	262
33	261
33	260
33	267
33	268
33	269
33	270
33	266
33	271
33	276
33	272
33	274
33	275
33	277
33	288
33	279
33	287
33	284
33	285
33	286
33	232
33	367
33	370
33	371
33	309
33	315
33	319
33	314
33	373
33	391
33	293
33	376
33	313
33	381
33	379
33	378
33	377
33	374
33	292
33	307
33	305
33	304
33	384
33	310
33	311
33	308
33	306
33	388
33	387
33	386
33	291
33	323
33	320
33	294
33	298
33	295
33	296
33	297
33	299
33	300
33	301
33	302
33	303
33	322
33	316
33	317
33	318
33	375
33	334
33	332
33	358
33	331
33	341
33	340
33	339
33	338
33	337
33	336
33	335
33	330
33	329
33	328
33	326
33	325
33	324
33	364
33	363
33	362
33	361
33	360
33	359
33	390
33	343
33	342
33	389
33	347
33	346
33	345
33	350
33	349
33	348
33	355
33	354
33	366
33	365
33	356
33	352
33	351
33	369
33	418
33	422
33	420
33	421
33	417
33	416
33	410
33	409
33	408
33	491
33	407
33	406
33	392
33	404
33	403
33	402
33	401
33	400
33	399
33	398
33	396
33	395
33	394
33	393
33	428
33	452
33	453
33	431
33	429
33	456
33	455
33	454
33	427
33	457
33	449
33	488
33	458
33	459
33	460
33	461
33	462
33	463
33	464
33	466
33	467
33	468
33	469
33	470
33	471
33	472
33	473
33	474
33	475
33	476
33	477
33	478
33	479
33	480
33	481
33	482
33	483
33	484
33	485
33	486
33	448
33	451
33	450
33	447
33	424
33	425
33	490
33	433
33	432
33	437
33	436
33	435
33	440
33	438
33	439
33	443
33	441
33	444
33	445
33	446
33	489
33	500
33	83
33	90
33	98
33	505
33	419
33	368
33	507
33	506
33	519
33	517
33	516
33	515
33	514
33	513
33	512
33	511
33	510
33	508
33	504
33	423
33	539
33	397
33	199
33	205
33	217
33	225
33	430
33	496
33	501
33	499
33	497
33	495
33	494
33	238
33	520
33	250
33	385
33	290
33	100
33	254
33	265
33	273
33	465
33	487
33	333
33	327
33	344
33	353
33	434
33	442
33	283
33	146
33	106
33	518
33	123
33	130
33	140
33	141
33	160
33	492
33	372
33	312
33	383
33	502
33	78
33	80
33	357
33	189
33	380
33	503
33	176
33	187
33	181
33	321
33	405
33	231
33	426
33	498
33	493
33	382
33	240
33	174
33	234
33	289
33	524
33	525
33	526
33	527
33	530
33	528
33	529
33	531
33	532
33	533
33	534
33	535
33	536
33	537
33	543
33	544
33	545
33	546
33	547
33	548
33	549
33	550
33	551
33	538
33	540
33	541
33	542
33	552
33	553
33	554
33	555
33	556
33	557
33	558
33	559
33	560
33	565
33	562
33	561
33	566
33	567
33	568
33	569
33	570
33	571
33	572
33	573
33	574
33	575
33	576
33	578
33	577
33	579
33	580
33	581
33	582
33	583
33	584
15	81
15	173
15	82
15	84
15	85
15	86
15	87
15	88
15	89
15	91
15	92
15	93
15	94
15	95
15	96
15	97
15	147
15	148
15	149
15	150
15	151
15	152
15	153
15	154
15	155
15	101
15	102
15	103
15	104
15	105
15	107
15	99
15	108
15	109
15	119
15	120
15	121
15	122
15	124
15	125
15	126
15	127
15	128
15	129
15	131
15	132
15	133
15	134
15	135
15	139
15	142
15	143
15	144
15	164
15	156
15	157
15	158
15	159
15	161
15	162
15	163
15	165
15	166
15	169
15	167
15	168
15	170
15	79
15	171
15	182
15	180
15	177
15	184
15	183
15	172
15	178
15	179
15	185
15	175
15	145
15	188
15	191
15	190
15	194
15	192
15	193
15	186
15	245
15	247
15	237
15	239
15	241
15	242
15	243
15	244
15	248
15	246
15	249
15	367
15	370
15	371
15	315
15	314
15	373
15	313
15	381
15	379
15	378
15	369
15	418
15	422
15	420
15	421
15	417
15	416
15	410
15	409
15	408
15	491
15	456
15	455
15	454
15	457
15	490
15	489
15	500
15	83
15	90
15	98
15	505
15	419
15	368
15	507
15	506
15	519
15	517
15	516
15	515
15	514
15	513
15	512
15	511
15	510
15	508
15	504
15	423
15	496
15	501
15	499
15	497
15	495
15	494
15	238
15	520
15	250
15	385
15	100
15	146
15	106
15	518
15	123
15	130
15	140
15	141
15	160
15	492
15	372
15	383
15	502
15	78
15	80
15	357
15	189
15	380
15	503
15	176
15	187
15	181
15	498
15	493
15	382
15	240
15	174
15	524
15	525
15	526
15	528
15	536
15	543
15	544
15	545
15	546
15	547
15	548
15	549
15	550
15	551
15	566
15	567
15	568
15	569
15	570
15	571
15	572
15	573
15	574
15	575
15	576
15	578
15	577
15	579
15	580
15	581
15	582
15	583
15	584
26	81
26	173
26	147
26	148
26	149
26	150
26	151
26	152
26	153
26	154
26	155
26	101
26	102
26	103
26	104
26	105
26	107
26	99
26	108
26	109
26	119
26	120
26	121
26	122
26	124
26	125
26	126
26	127
26	128
26	129
26	131
26	132
26	133
26	134
26	135
26	139
26	142
26	143
26	144
26	164
26	156
26	157
26	158
26	159
26	161
26	162
26	163
26	165
26	166
26	169
26	167
26	168
26	170
26	79
26	171
26	182
26	180
26	177
26	184
26	183
26	172
26	178
26	179
26	185
26	175
26	145
26	188
26	191
26	190
26	230
26	194
26	192
26	193
26	233
26	235
26	186
26	245
26	247
26	237
26	239
26	241
26	242
26	243
26	244
26	248
26	246
26	249
26	236
26	232
26	370
26	371
26	315
26	319
26	314
26	373
26	376
26	313
26	381
26	379
26	378
26	377
26	374
26	323
26	320
26	322
26	316
26	317
26	318
26	375
26	369
26	422
26	420
26	421
26	417
26	416
26	410
26	409
26	408
26	491
26	456
26	455
26	454
26	457
26	490
26	489
26	500
26	519
26	517
26	516
26	515
26	514
26	513
26	512
26	511
26	510
26	508
26	504
26	423
26	496
26	501
26	499
26	497
26	495
26	494
26	238
26	520
26	250
26	385
26	100
26	146
26	106
26	518
26	123
26	130
26	140
26	141
26	160
26	492
26	372
26	383
26	502
26	78
26	80
26	357
26	189
26	380
26	503
26	176
26	187
26	181
26	321
26	231
26	498
26	493
26	382
26	240
26	174
26	234
26	524
26	526
26	528
26	536
27	81
27	79
27	223
27	224
27	226
27	227
27	222
27	229
27	228
27	281
27	282
27	245
27	247
27	237
27	239
27	241
27	242
27	243
27	244
27	248
27	278
27	280
27	246
27	249
27	288
27	279
27	287
27	284
27	285
27	286
27	293
27	381
27	379
27	378
27	292
27	384
27	291
27	431
27	429
27	456
27	455
27	454
27	457
27	490
27	500
27	225
27	430
27	496
27	501
27	499
27	497
27	495
27	494
27	238
27	520
27	250
27	385
27	290
27	283
27	383
27	502
27	78
27	80
27	357
27	380
27	503
27	498
27	493
27	382
27	240
27	289
27	526
27	527
27	530
27	528
27	529
27	531
27	532
27	533
27	534
27	535
27	536
14	81
14	173
14	147
14	148
14	149
14	150
14	151
14	152
14	153
14	154
14	155
14	101
14	102
14	103
14	104
14	105
14	107
14	99
14	108
14	109
14	119
14	120
14	121
14	122
14	124
14	125
14	126
14	127
14	128
14	129
14	131
14	132
14	133
14	134
14	135
14	139
14	142
14	143
14	144
14	164
14	156
14	157
14	158
14	159
14	161
14	162
14	163
14	165
14	166
14	169
14	167
14	168
14	170
14	79
14	171
14	182
14	180
14	177
14	184
14	183
14	172
14	178
14	179
14	185
14	175
14	145
14	188
14	191
14	190
14	230
14	194
14	192
14	193
14	233
14	235
14	186
14	245
14	247
14	237
14	239
14	241
14	242
14	243
14	244
14	248
14	246
14	249
14	236
14	232
14	370
14	371
14	315
14	319
14	314
14	373
14	376
14	313
14	381
14	379
14	378
14	377
14	374
14	323
14	320
14	322
14	316
14	317
14	318
14	375
14	369
14	422
14	420
14	421
14	417
14	416
14	410
14	409
14	408
14	491
14	456
14	455
14	454
14	457
14	490
14	489
14	500
14	519
14	517
14	516
14	515
14	514
14	513
14	512
14	511
14	510
14	508
14	504
14	423
14	496
14	501
14	499
14	497
14	495
14	494
14	238
14	520
14	250
14	385
14	100
14	146
14	106
14	518
14	123
14	130
14	140
14	141
14	160
14	492
14	372
14	383
14	502
14	78
14	80
14	357
14	189
14	380
14	503
14	176
14	187
14	181
14	321
14	231
14	498
14	493
14	382
14	240
14	174
14	234
14	524
14	526
14	528
14	536
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
8	Operator	Active                                                                                                                                                                                                                                                         
\.


--
-- Data for Name: s_air; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_air (s_idair, s_idperuntukan, s_volume1, s_volume2, s_volume3, s_volume5, s_volume4) FROM stdin;
1	1	1	1.10000000000000009	1.19999999999999996	1.39999999999999991	1.30000000000000004
2	2	2	2.20000000000000018	2.39999999999999991	2.79999999999999982	2.60000000000000009
3	3	4	4.40000000000000036	4.79999999999999982	5.59999999999999964	5.20000000000000018
4	4	3	3.29999999999999982	3.60000000000000009	4.5	3.89999999999999991
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
2	Bangunan semi permanen (max 15 tahun)	0.900000000000000022
3	Bangunan tidak permanen (umur max 5 tahun)	0.400000000000000022
4	Bangunan darurat (umur max 1 tahun)	0.100000000000000006
\.


--
-- Data for Name: s_imb_lantai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_imb_lantai (s_idlantai, s_namalantai, s_koefisien) FROM stdin;
1	Satu Lantai	1
2	Dua Lantai	1.5
3	Tiga Lantai	2
4	Tower	9.59999999999999964
\.


--
-- Data for Name: s_imb_lokasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_imb_lokasi (s_idlokasi, s_namalokasi, s_koefisien) FROM stdin;
1	Dipinggir Jalan Arteri	1.5
2	Langsung Berada dibelakang jalan Arteri	1.39999999999999991
3	Dipinggir jalan kolektor	1.30000000000000004
4	Langsung Berada dibelakang jalan kolektor	1.25
5	Bangunan dipinggir jalan lokal bangunan yang langsung berada di belakang	1.19999999999999996
6	Jalan Lokal	1.10000000000000009
7	Jalan setapak	0.5
\.


--
-- Data for Name: s_imb_luas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_imb_luas (s_idluas, s_namaluas, s_koefisien) FROM stdin;
1	Bangunan tertutup dengan atap / dindingan	1
2	Bangunan tetutup atap dinding	0.699999999999999956
3	Bangunan teras / rabat	0.5
4	Bangunan jembatan	1
5	Bangunan Plat beton terbuka	0.75
9	Bangunan Kolam Khusus (kolam buaya dll)	1.25
8	Bangunan Gudang	1.19999999999999996
7	Bangunan Kolam biasa tanpa lantai konstruksi	0.100000000000000006
6	Bangunan Kolam berlantai konstruksi/beton	0.75
10	Bangunan Menara / Tower / Siklop	2
11	Bangunan Pelindung Binatang Liar / buas	1.19999999999999996
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
10	Pajak Bumi dan Bangunan Perdesaan\rdan Perkotaan	PBB-P2			\N	Pajak
11	Bea Perolehan Hak Atas Tanah dan\rBangunan	BPHTB			\N	Pajak
12	Retribusi Pelayanan Kesehatan\r	Ret. Pelayanan Kesehatan			30	Retribusi
13	Retribusi Pelayanan Persampahan/Kebersihan	Ret. Pelayanan Kebersihan			30	Retribusi
14	Retribusi Penggantian Biaya Cetak Kartu Tanda Penduduk dan Akta Catatan Sipil	Ret. CAPIL			30	Retribusi
15	Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	Ret. Pemakaman			30	Retribusi
16	Retribusi Pelayanan Parkir di Tepi Jalan Umum	Ret. Parkir Tepi Jalan			30	Retribusi
18	Retribusi Pengujian Kendaraan Bermotor	Ret. Kendaraan Bermotor			30	Retribusi
19	Retribusi Pemeriksaan Alat Pemadam Kebakaran	Ret. Pemadam Kebakaran			30	Retribusi
20	Retribusi Penggantian Biaya Cetak Peta	Ret. Cetak Peta			30	Retribusi
21	Retribusi Penyediaan dan/atau Penyedotan Kakus	Ret. Penyedotan Kakus			30	Retribusi
22	Retribusi Pengolahan Limbah Cair	Ret. Limbah Cair			30	Retribusi
23	Retribusi Pelayanan Tera/Tera Ulang	Ret. Tera Ulang			30	Retribusi
24	Retribusi Pelayanan Pendidikan	Ret. Pelayanan Pendidikan			30	Retribusi
25	Retribusi Pengendalian Menara Telekomunikasi	Ret. Menara Telekomunikasi			30	Retribusi
26	Retribusi Pemakaian Kekayaan Daerah	Ret. Kekayaan Daerah			30	Retribusi
28	Retribusi Tempat Pelelangan	Ret. Tempat Pelelangan			30	Retribusi
31	Retribusi Tempat Penginapan/Pesanggrahan/Villa	Ret. Pesanggrahan Villa			30	Retribusi
32	Retribusi Rumah Potong Hewan	Ret. Potong Hewan			30	Retribusi
36	Retribusi Penjualan Produksi Usaha Daerah	Ret. Usaha Daerah			30	Retribusi
37	Retribusi Izin Mendirikan Bangunan	Ret. IMB			30	Retribusi
38	Retribusi Izin Tempat Penjualan Minuman Beralkohol	Ret. Izin Minuman Beralkohol			30	Retribusi
39	Retribusi Izin Gangguan	Ret. Izin Gangguan			30	Retribusi
40	Retribusi Izin Trayek	Ret. Izin Trayek			30	Retribusi
41	Retribusi Izin Usaha Perikanan	Ret. Izin Usaha Perikanan			30	Retribusi
35	Retribusi Penyeberangan di Air	Ret. Penyeberangan di Air			30	Retribusi
29	Retribusi Terminal	Ret. Terminal			30	Retribusi
27	Retribusi Pasar Grosir dan/atau Pertokoan	Ret. Pasar Grosir			30	Retribusi
9	Pajak Sarang Burung Walet	Pajak Sarang Burung Walet	15	15	\N	Pajak
7	Pajak Parkir	Pajak Parkir	15	15	\N	Pajak
6	Pajak Mineral Bukan Logam dan Batuan	Pajak MINERBA	15	15	\N	Pajak
5	Pajak Penerangan Jalan	Pajak Penerangan Jalan	15	15	\N	Pajak
3	Pajak Hiburan	Pajak Hiburan	15	15	\N	Pajak
2	Pajak Restoran	Pajak Restoran	15	15	\N	Pajak
1	Pajak Hotel	Pajak Hotel	15	15	\N	Pajak
17	Retribusi Pelayanan Pasar	Ret. Pelayanan Pasar			30	Retribusi
30	Retribusi Tempat Khusus Parkir	Ret. Tempat Khusus Parkir			30	Retribusi
33	Retribusi Pelayanan Kepelabuhanan	Ret. Kepelabuhanan			30	Retribusi
34	Retribusi Tempat Rekreasi dan Olahraga	Ret. Rekreasi dan Olahraga			30	Retribusi
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
1	1	Pulang Pisau KUALA	\N
2	2	SELAT	\N
3	3	Pulang Pisau TIMUR	\N
4	4	BASARANG	\N
5	5	Pulang Pisau HILIR	\N
6	6	PULAU PETAK	\N
7	7	Pulang Pisau MURUNG	\N
8	8	Pulang Pisau BARAT	\N
9	9	MANTANGAI	\N
10	10	TIMPAH	\N
11	11	Pulang Pisau TENGAH	\N
12	12	Pulang Pisau HULU	\N
13	13	MANDAU TALAWANG	\N
14	14	DADAHUP	\N
15	15	TAMBAN CATUR	\N
16	16	PASAK TALAWANG	\N
17	17	BATAGUH	\N
18	18	LUAR KOTA	\N
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
1	1	Klasifikasi I [dalam kota Biak dan sekitarnya]	\N	\N
2	1	Klasifikasi II [diluar klasifikasi I]	\N	\N
4	2	Klasifikasi I	\N	\N
5	2	Klasifikasi II	\N	\N
6	2	Klasifikasi III	\N	\N
8	2	Balai Pertemuan / Gedung Wanita	\N	\N
9	2	Penggunaan VIP Room Bandara Udara Frans Kaiseipo Pemda Biak Numfor	\N	\N
10	3	Dump Truck	100000	perhari
11	3	Bulldozer	250000	perhari
12	3	Mesin Gilas MG-6	165000	perhari
13	3	Stamper Pilat	50000	perhari
14	3	Loader Wheel	426000	perhari
15	3	Mobil Tinja	150000	perhari
16	3	Stone Cruiser	680000	perhari
17	3	Roller Mini	110000	perhari
18	3	Mixer	90000	perhari
19	3	Aspal prayer	90000	perhari
20	3	Genset	80000	perhari
21	3	Grader	522000	perhari
22	4	space iklan	105000	perhari/meter
7	2	Klasifikasi IV	\N	\N
3	1	Untuk tempat tinggal	0.5	perbulan
\.


--
-- Data for Name: s_kekayaanpenggunaan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_kekayaanpenggunaan (s_idpenggunaan, s_keterangan) FROM stdin;
1	Penggunaan Tanah
2	Pengunaan Bangunan / Gedung / Rumah Dinas
3	Pemakaian Kendaraan / alat-alat Berat
4	Penggunaan Space Iklan
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
-- Data for Name: s_kelurahan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_kelurahan (s_idkel, s_kodekel, s_namakel, s_idkeckel, is_delete) FROM stdin;
1	1	BATANJUNG	1	\N
2	2	CEMARA LABAT	1	\N
3	3	PALAMPAI	1	\N
4	4	SUNGAI TERAS	1	\N
5	5	LUPAK DALAM	1	\N
6	6	TAMBAN BARU SELATAN	1	\N
7	7	TAMBAN LUPAK	1	\N
8	8	SEI BAKUT	1	\N
9	9	LUPAK TIMUR	1	\N
10	10	WARGO MULYO	1	\N
11	11	PEMATANG	1	\N
12	12	SIMPANG BUNGA TANJUNG	1	\N
13	13	BARANGGAU	1	\N
14	1	SELAT HILIR	2	\N
15	2	SELAT TENGAH	2	\N
16	3	SELAT HULU	2	\N
17	4	SELAT DALAM	2	\N
18	5	MURUNG KERAMAT	2	\N
19	6	SELAT UTARA	2	\N
20	7	SELAT BARAT	2	\N
21	8	PANAMAS	2	\N
22	9	PULAU TELO	2	\N
23	10	PULAU TELO BARU	2	\N
24	1	ANJIR SERAPAT TIMUR	3	\N
25	2	ANJIR SERAPAT BARAT	3	\N
26	3	ANJIR SERAPAT TENGAH	3	\N
27	4	ANJIR MAMBULAU TIMUR	3	\N
28	5	ANJIR MAMBULAU TENGAH	3	\N
29	6	ANJIR MAMBULAU BARAT	3	\N
30	7	ANJIR SERAPAT BARU	3	\N
31	1	PANGKALAN REKAN	4	\N
32	2	ANJIR BASARANG	4	\N
33	3	MALUEN	4	\N
34	4	BATUAH	4	\N
35	5	LUNUK RAMBA	4	\N
36	6	BASUNGKAI	4	\N
37	7	TAMBUN RAYA	4	\N
38	8	PANGKALAN SARI	4	\N
39	9	BUNGAI JAYA	4	\N
40	10	BASARANG JAYA	4	\N
41	11	PANARUNG	4	\N
42	12	BATU NINDAN	4	\N
43	13	TARUNG MANUAH	4	\N
44	14	NANING	4	\N
45	1	MAMBULAU	5	\N
46	2	HAMPATUNG	5	\N
47	3	DAHIRANG	5	\N
48	4	BARIMBA	5	\N
49	5	SEI PASAH	5	\N
50	6	SEI ASAM	5	\N
51	7	BAKUNGIN	5	\N
52	8	SAKA BATUR	5	\N
53	1	SEI TATAS	6	\N
54	2	SEI TATAS HILIR	6	\N
55	3	TELUK PALINGET	6	\N
56	4	SAKA LAGUN	6	\N
57	5	NARAHAN	6	\N
58	6	BUNGA MAWAR	6	\N
59	7	PALANGKAI	6	\N
60	8	HANDIWUNG	6	\N
61	9	ANJIR PALAMBANG	6	\N
62	10	MAWAR MEKAR	6	\N
63	11	BANAMA	6	\N
64	12	NARAHAN BARU	6	\N
65	1	PALINGKAU BARU	7	\N
66	2	PALINGKAU LAMA	7	\N
67	3	TAJEPAN	7	\N
68	4	MAMPAI	7	\N
69	5	MUARA DADAHUP	7	\N
70	6	BELAWANG	7	\N
71	7	PALANGKAU LAMA	7	\N
72	8	PALANGKAU BARU	7	\N
73	9	PALANGKAU JAYA	7	\N
74	10	PALINGKAU ASRI	7	\N
75	11	PALINGKAU SEJAHTERA	7	\N
76	12	SAKA BINJAI	7	\N
77	13	BINA SEJAHTERA	7	\N
78	14	SUKAREJA	7	\N
79	15	SUKA MUKTI	7	\N
80	16	BINA KARYA	7	\N
81	17	BINA MEKAR	7	\N
82	18	RAWA SUBUR	7	\N
83	19	SUMBER MULYA	7	\N
84	20	BUMI RAHAYU	7	\N
85	21	MANGGALA PERMAI	7	\N
86	22	DUSUN TALEKUNG PUNAI	7	\N
87	23	KARYA BERSAMA	7	\N
88	1	MANDOMAI	8	\N
89	2	SEI KAYU	8	\N
90	3	SAKA MANGKAHAI	8	\N
91	4	ANJIR KALAMPAN	8	\N
92	5	PANTAI	8	\N
93	6	SAKA TAMIANG	8	\N
94	7	PENDA KATAPI	8	\N
95	8	TELUK HIRI	8	\N
96	9	SEI DUSUN	8	\N
97	10	SEI PITUNG	8	\N
98	11	MAJU BERSAMA	8	\N
99	12	BASUTA RAYA	8	\N
100	1	MANTANGAI HULU	9	\N
101	2	MANTANGAI TENGAH	9	\N
102	3	MANTANGAI HILIR	9	\N
103	4	MANUSUP	9	\N
104	5	SEI KAPAR	9	\N
105	6	TARANTANG	9	\N
106	7	LAMUNTI	9	\N
107	8	PULAU KALADAN	9	\N
108	9	KALUMPANG	9	\N
109	10	SEI AHAS	9	\N
110	11	KATUNJUNG	9	\N
111	12	TUMBANG MUROI	9	\N
112	13	DANAU RAWAH	9	\N
113	14	KATIMPUN	9	\N
114	15	LAHEI MANGKUTUP	9	\N
115	16	MANUSUP HILIR	9	\N
116	17	MUROI RAYA	9	\N
117	18	SEI GITA	9	\N
118	19	BUKIT BATU	9	\N
119	20	SEI GAWING	9	\N
120	21	HUMBANG RAYA	9	\N
121	22	TABORE	9	\N
122	23	TUMBANG MANGKUTUP	9	\N
123	24	LAPETAN	9	\N
124	25	LAMUNTI PERMAI	9	\N
125	26	MANYAHI	9	\N
126	27	SEKATA MAKMUR	9	\N
127	28	KALADAN JAYA	9	\N
128	29	RANTAU JAYA	9	\N
129	30	WARGA MULYA	9	\N
130	31	LAMUNTI BARU	9	\N
131	32	SRIWIDADI	9	\N
132	33	SUMBER MAKMUR	9	\N
133	34	SIDO MULYO	9	\N
134	35	HARAPAN JAYA	9	\N
135	36	SEKATA BANGUN	9	\N
136	37	SARI MAKMUR	9	\N
137	38	SUKA MAJU	9	\N
138	1	TIMPAH	10	\N
139	2	PETAK PUTI	10	\N
140	3	ARUK	10	\N
141	4	LAWANG KAJANG	10	\N
142	5	LUNGKUH LAYANG	10	\N
143	6	DANAU PANTAU	10	\N
144	7	TUMBANG RANDANG	10	\N
145	8	LAWANG KAMAH	10	\N
146	9	BATAPAH	10	\N
147	1	PUJON	11	\N
148	2	MASARAN	11	\N
149	3	KAYU BULAN	11	\N
150	4	KOTA BARU	11	\N
151	5	PENDA MUNTEI	11	\N
152	6	TAPEN	11	\N
153	7	MARAPIT	11	\N
154	8	MANIS	11	\N
155	9	BAJUH	11	\N
156	10	KARUKUS	11	\N
157	11	BARUNANG	11	\N
158	12	BUHUT JAYA	11	\N
159	13	HURUNG PUKUNG	11	\N
160	1	SEI HANYU	12	\N
161	2	SUPANG	12	\N
162	3	HURUNG TABENGAN	12	\N
163	4	RAHUNG BUNGAI	12	\N
164	5	TANGIRANG	12	\N
165	6	BULAU NGANDUNG	12	\N
166	7	TUMBANG PUROH	12	\N
167	8	KATANJUNG	12	\N
168	9	HURUNG TAMPANG	12	\N
169	10	BARUNANG II	12	\N
170	11	JEKATAN PARI	12	\N
171	12	TUMBANG SIRAT	12	\N
172	13	MAMPAI JAYA	12	\N
173	14	DIRUNG KORAM	12	\N
174	1	SEI PINANG	13	\N
175	2	MASAHA	13	\N
176	3	LAWANG TAMANG	13	\N
177	4	KARETAU MANTA'A	13	\N
178	5	TUMBANG BUKOI	13	\N
179	6	TUMBANG TIHIS	13	\N
180	7	TUMBANG MANYARUNG	13	\N
181	8	TANJUNG RENDAN	13	\N
182	9	MASUPARIA	13	\N
183	10	JAKATAN MASAHA	13	\N
184	1	DADAHUP	14	\N
185	2	TAMBAK BAJA'I	14	\N
186	3	BINA JAYA	14	\N
187	4	SUMBER AGUNG	14	\N
188	5	HARAPAN BARU	14	\N
189	6	BENTUK JAYA	14	\N
190	7	TANJUNG HARAPAN	14	\N
191	8	KAHURIPAN PERMAI	14	\N
192	9	SUMBER ALASKA	14	\N
193	10	DADAHUP RAYA	14	\N
194	11	MANUNTUNG	14	\N
195	12	MENTENG KARYA	14	\N
196	13	PETAK BATUAH	14	\N
197	1	TAMBAN BARU TIMUR	15	\N
198	2	TAMBAN BARU TENGAH	15	\N
199	3	TAMBAN BARU MEKAR	15	\N
200	4	BANDAR RAYA	15	\N
201	5	SIDOREJO	15	\N
202	6	WARNA SARI	15	\N
203	7	SIDO MULYO	15	\N
204	8	BANDAR MEKAR	15	\N
205	9	TAMBAN MAKMUR	15	\N
206	10	TAMBAN JAYA	15	\N
207	1	JANGKANG	16	\N
208	2	TUMBANG TUKUN	16	\N
209	3	SEI RINGIN	16	\N
210	4	KABURAN	16	\N
211	5	BALAI BANJANG	16	\N
212	6	TUMBANG DIRING	16	\N
213	7	DANDANG	16	\N
214	8	HURUNG KAMPIN	16	\N
215	9	BATU SAMBUNG	16	\N
216	10	TUMBANG NUSA	16	\N
217	1	PULAU KUPANG	17	\N
218	2	PULAU MAMBULAU	17	\N
219	3	SEI LUNUK	17	\N
220	4	SEI JANGKIT	17	\N
221	5	TAMBAN LUAR	17	\N
222	6	BAMBAN RAYA	17	\N
223	7	TERUSAN RAYA	17	\N
224	8	TERUSAN KARYA	17	\N
225	9	TERUSAN MAKMUR	17	\N
226	10	TERUSAN MULYA	17	\N
227	11	BANGUN HARJO	17	\N
228	12	TERUSAN RAYA BARAT	17	\N
229	13	TERUSAN RAYA HULU	17	\N
230	14	TERUSAN BAGUNTAN RAYA	17	\N
231	15	BUDI MUFAKAT	17	\N
232	0	LUAR KOTA	18	\N
\.


--
-- Data for Name: s_minerba_jenis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_minerba_jenis (s_idjenisminerba, s_namajenisminerba, s_idkorek, s_idzona, s_harga, s_keterangan) FROM stdin;
1	Asbes || Sedang	48	1	0	-
2	Asbes || Sulit	48	2	0	-
3	Asbes || Sangat Sulit	48	3	0	-
4	Batu Tulis || Sedang	49	1	602402	-
5	Batu Tulis || Sulit	49	2	633056	-
6	Batu Tulis || Sangat Sulit	49	3	640309	-
7	Batu Setengah Permata || Sedang	50	1	0	-
8	Batu Setengah Permata || Sulit	50	2	0	-
9	Batu Setengah Permata || Sangat Sulit	50	3	0	-
10	Batu Kapur || Sedang	51	1	602402	-
11	Batu Kapur || Sulit	51	2	633056	-
12	Batu Kapur || Sangat Sulit	51	3	640309	- 
13	Batu Apung || Sedang	52	1	27108	-
14	Batu Apung || Sulit	52	2	28487	-
15	Batu Apung || Sangat Sulit	52	3	28814	-
16	Batu Permata || Sedang	53	1	0	-
17	Batu Permata || Sulit	53	2	0	-
18	Batu Permata || Sangat Sulit	53	3	0	-
19	Bentonit || Sedang	54	1	0	-
20	Bentonit || Sulit	54	2	0	-
21	Bentonit || Sangat Sulit	54	3	0	-
22	Dolomit || Sedang	55	1	0	-
23	Dolomit || Sulit	55	2	0	-
24	Dolomit || Sangat Sulit	55	3	0	- 
25	Feldspar || Sedang	56	1	0	-
26	Feldspar || Sulit	56	2	0	-
27	Feldspar || Sangat Sulit	56	3	0	-
28	Garam Batu (Halite)  || Sedang	57	1	0	-
29	Garam Batu (Halite) || Sulit	57	2	0	-
30	Garam Batu (Halite) || Sangat Sulit	57	3	0	-
31	Grafit || Sedang	58	1	0	-
32	Grafit || Sulit	58	2	0	-
33	Grafit || Sangat Sulit	58	3	0	-
34	Granit || Sedang	59	1	1108721	-
35	Granit  || Sulit	59	2	1165139	-
36	Granit  || Sangat Sulit	59	3	1178489	- 
37	Gips || Sedang	60	1	0	-
38	Gips || Sulit	60	2	0	-
39	Gips || Sangat Sulit	60	3	0	-
40	Kalsit || Sedang	61	1	0	-
41	Kalsit || Sulit	61	2	0	-
42	Kalsit || Sangat Sulit	61	3	0	-
43	Kaolin || Sedang	62	1	0	-
44	Kaolin || Sulit	62	2	0	-
45	Kaolin || Sangat Sulit	62	3	0	-
46	Leusit || Sedang	63	1	0	-
47	Leusit || Sulit	63	2	0	-
48	Leusit || Sangat Sulit	63	3	0	- 
49	Magnesit || Sedang	64	1	0	-
50	Magnesit || Sulit	64	2	0	-
51	Magnesit || Sangat Sulit	64	3	0	-
52	Mika || Sedang	65	1	0	-
53	Mika || Sulit	65	2	0	-
54	Mika || Sangat Sulit	65	3	0	-
55	Marmer || Sedang	66	1	1055408	-
56	Marmer || Sulit	66	2	1109113	-
57	Marmer || Sangat Sulit	66	3	1121821	-
58	Nitrat || Sedang	67	1	0	-
59	Nitrat || Sulit	67	2	0	-
60	Nitrat || Sangat Sulit	67	3	0	- 
61	Opsidien || Sedang	68	1	0	-
62	Opsidien || Sulit	68	2	0	-
63	Opsidien || Sangat Sulit	68	3	0	-
64	Oker || Sedang	69	1	0	-
65	Oker || Sulit	69	2	0	-
66	Oker || Sangat Sulit	69	3	0	-
67	Pasir dan kerikil || Sedang	70	1	722882	-
68	Pasir dan kerikil || Sulit	70	2	759667	-
69	Pasir dan kerikil || Sangat Sulit	70	3	768371	-
70	Pasir Kuarsa || Sedang	71	1	722882	-
71	Pasir Kuarsa || Sulit	71	2	759667	-
72	Pasir Kuarsa || Sangat Sulit	71	3	768371	- 
73	Perlit || Sedang	72	1	722882	-
74	Perlit || Sulit	72	2	759667	-
76	Phospat || Sedang	73	1	0	-
77	Phospat || Sulit	73	2	0	-
78	Phospat || Sangat Sulit	73	3	0	-
79	Talk || Sedang	74	1	0	-
80	Talk || Sulit	74	2	0	-
81	Talk || Sangat Sulit	74	3	0	-
82	Tanah Serap (Fullers earth) || Sedang	75	1	0	-
83	Tanah Serap (Fullers earth) || Sulit	75	2	0	-
84	Tanah Serap (Fullers earth) || Sangat Sulit	75	3	0	- 
85	Tanah Diatome || Sedang	76	1	542162	-
86	Tanah Diatome || Sulit	76	2	569750	-
87	Tanah Diatome || Sangat Sulit	76	3	576278	-
88	Tanah Liat || Sedang	77	1	542162	-
89	Tanah Liat || Sulit	77	2	569750	-
91	Tawas (Alum) || Sedang	78	1	0	-
92	Tawas (Alum) || Sulit	78	2	0	-
93	Tawas (Alum) || Sangat Sulit	78	3	0	-
94	Yarosif || Sedang	80	1	0	-
95	Yarosif || Sulit	80	2	0	-
96	Yarosif || Sangat Sulit	80	3	0	- 
97	Zeolit || Sedang	81	1	0	-
98	Zeolit || Sulit	81	2	0	-
99	Zeolit || Sangat Sulit	81	3	0	-
100	Basal || Sedang	82	1	0	-
101	Basal || Sulit	82	2	0	-
102	Basal || Sangat Sulit	82	3	0	-
103	Trakit || Sedang	83	1	0	-
104	Trakit || Sulit	83	2	0	-
106	Mineral bukan logam dan lainnya  || Sedang	84	1	0	-
75	Perlit || Sangat Sulit	72	3	768371	-
90	Tanah Liat || Sangat Sulit	77	3	576278	-
105	Trakit || Sangat Sulit	83	3	0	-
107	Mineral bukan logam dan lainnya || Sulit	84	2	0	-
108	Mineral bukan logam dan lainnya || Sangat Sulit	84	3	0	- 
\.


--
-- Data for Name: s_pejabat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_pejabat (s_idpej, s_namapej, s_jabatanpej, s_pangkatpej, s_nippej) FROM stdin;
7	YONATHAN RUMBEKWAN, S.Sos	KEPALA BIDANG PENDAFTARAN, PENDATAAN DAN PENETAPAN	-	19780308 2006 05 1 001
5	JOSSIAS W. SADA, S.Sos	KEPALA SUB BIDANG ANGSURAN DAN KEBERATAN	-	1966111920 0701 1 009
8	JOHN AFASEDANYA, S.Sos	KEPALA BIDANG PENAGIHAN DAN PEMBUKUAN 	-	19750127 2007 01 1 001
3	BENHUR RUMASEUW, S.IP	KEPALA SUB BIDANG PEMBUKUAN, PENERIMAAN DAN TUNGGAKAN BENDAHARA PENERIMAAN	-	19680626 2004 05 1 002
2	RATIH I. WAMBRAUW, SH	KEPALA SUB BIDANG PENAGIHAN	-	19810412 2006 05 2 001
6	ROY P. RUMABAR, SE	SEKRETARIS	-	19790412 2006 05 1 003
4	YUSTUS N. AMSAMSYUM, S.Sos.M.Si	KEPALA BADAN	IVC Penata Muda 	19760720 2001 12 1 005
9	BEATRIKS Y. MANSAWAN, S.Sos	KEPALA SUB BIDANG PENDATAAN, PERHITUNGAN DAN PENETAPAN	-	19800412 2007 01 2 017
\.


--
-- Data for Name: s_pemda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_pemda (s_idpemda, s_namaprov, s_namakabkota, s_namaibukotakabkota, s_kodeprovinsi, s_kodekabkot, s_namainstansi, s_namasingkatinstansi, s_alamatinstansi, s_notelinstansi, s_namabank, s_norekbank, s_kodepos, s_logo) FROM stdin;
1	Propinsi kalimantan Tengah	Kabupaten Pulang Pisau	Kuala Pulang Pisau	62	03	BADAN PENGELOLAAN PAJAK DAN RETRIBUSI DAERAH 	BPPRD	JL. Tambun Bungai No. 43 	(0981) 492202	Bank KALTENG	000000000000	98163	public/upload\\Lambang_Kabupaten_Pulang Pisau.png
\.


--
-- Data for Name: s_rekening; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_rekening (s_idkorek, s_jenisobjek, s_tipekorek, s_kelompokkorek, s_jeniskorek, s_objekkorek, s_rinciankorek, s_sub1korek, s_sub2korek, s_sub3korek, s_namakorek, s_persentarifkorek, s_tarifdasarkorek, s_voldasarkorek, s_tariftambahkorek, s_tglawalkorek, s_tglakhirkorek, t_berdasarmasa, is_deluser) FROM stdin;
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
16	1	4	1	01	06	06	006	00	00	Pesanggrahan	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
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
83	9	4	1	01	13	00	00	00	00	Pajak Sarang Burung Walet	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
84	9	4	1	01	13	01	00	00	00	Pajak Sarang Burung Walet	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
123	10	4	1	01	15	00	00	00	00	Pajak Bumi dan Bangunan Perdesaan dan Perkotaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
124	10	4	1	01	16	01	00	00	00	Pajak Bumi dan Bangunan Perdesaan dan Perkotaan	2	\N	\N	\N	2020-01-01	2022-12-31	\N	0
125	11	4	1	01	11	00	00	00	00	Bea Perolehan Hak Atas Tanah dan Bangunan (BPHTB)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
126	11	4	1	01	11	01	00	00	00	BPHTB - Pemindahan Hak	5	\N	\N	\N	2020-01-01	2022-12-31	\N	0
127	11	4	1	01	11	02	00	00	00	BPHTB - Pemberian Hak Baru	5	\N	\N	\N	2020-01-01	2022-12-31	\N	0
128	0	4	1	02	0	0	00	00	00	HASIL RETRIBUSI DAERAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
129	0	4	1	02	01	00	00	00	00	Retribusi Jasa Umum	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
130	12	4	1	02	01	01	00	00	00	Retribusi Pelayanan Kesehatan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
131	13	4	1	02	01	02	00	00	00	Retribusi Pelayanan Persampahan/Kebersihan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
132	14	4	1	02	01	03	00	00	00	Retribusi Penggantian Biaya Cetak Kartu Tanda Penduduk dan Akta Catatan Sipil	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
133	15	4	1	02	01	04	00	00	00	Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
134	16	4	1	02	01	05	00	00	00	Retribusi Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
135	17	4	1	02	01	06	00	00	00	Retribusi Pelayanan Pasar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
78	5	4	1	01	10	02	001	00	00	Pajak Penerangan Jalan sumber lain	3	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
85	6	4	1	01	14	00	00	00	00	Pajak Mineral Bukan Logam dan Batuan	0	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
86	6	4	1	01	14	01	00	00	00	Asbes	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
87	6	4	1	01	14	02	00	00	00	Batu Tulis	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
88	6	4	1	01	14	03	00	00	00	Batu Setengah Permata	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
89	6	4	1	01	14	04	00	00	00	Batu Kapur	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
90	6	4	1	01	14	05	00	00	00	Batu Apung	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
91	6	4	1	01	14	06	00	00	00	Batu Permata	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
92	6	4	1	01	14	07	00	00	00	Bentonit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
93	6	4	1	01	14	08	00	00	00	Dolomit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
95	6	4	1	01	14	10	00	00	00	Garam Batu (Halite)	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
94	6	4	1	01	14	09	00	00	00	Feldspar	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
96	6	4	1	01	14	11	00	00	00	Grafit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
97	6	4	1	01	14	12	00	00	00	Granit / Andesit	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
98	6	4	1	01	14	13	00	00	00	Gips	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
99	6	4	1	01	14	14	00	00	00	Kalsit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
100	6	4	1	01	14	15	00	00	00	Kaolin	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
101	6	4	1	01	14	16	00	00	00	Leusit	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
102	6	4	1	01	14	17	00	00	00	Magnesit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
103	6	4	1	01	14	18	00	00	00	Mika	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
104	6	4	1	01	14	19	00	00	00	Marmer	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
105	6	4	1	01	14	20	00	00	00	Nitrat	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
110	6	4	1	01	14	25	00	00	00	Perlit	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
107	6	4	1	01	14	22	00	00	00	Oker	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
106	6	4	1	01	14	21	00	00	00	Opsidien	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
109	6	4	1	01	14	24	00	00	00	Pasir Kuarsa	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
112	6	4	1	01	14	27	00	00	00	Talk	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
111	6	4	1	01	14	26	00	00	00	Phospat	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
113	6	4	1	01	14	28	00	00	00	Tanah Serap (Fullers earth)	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
114	6	4	1	01	14	29	00	00	00	Tanah Diatome	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
115	6	4	1	01	14	30	00	00	00	Tanah Liat	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
116	6	4	1	01	14	31	00	00	00	Tawas (Alum)	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
117	6	4	1	01	14	32	00	00	00	Tras	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
118	6	4	1	01	14	33	00	00	00	Yarosif	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
119	6	4	1	01	14	34	00	00	00	Zeolit	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
120	6	4	1	01	14	35	00	00	00	Basal	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
121	6	4	1	01	14	36	00	00	00	Trakit	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
122	6	4	1	01	14	37	00	00	00	Mineral bukan logam dan lainnya	15	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
79	7	4	1	01	11	00	00	00	00	Pajak Parkir	20	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
80	7	4	1	01	11	01	00	00	00	Pajak Parkir	20	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
81	8	4	1	01	12	00	00	00	00	Pajak Air Tanah	20	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
82	8	4	1	01	12	01	00	00	00	Pajak Air Tanah	20	2668	\N	\N	2020-01-01	2022-12-31	Yes	0
136	18	4	1	02	01	07	00	00	00	Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
137	19	4	1	02	01	08	00	00	00	Retribusi Pemeriksaan Alat Pemadam Kebakaran	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
138	20	4	1	02	01	09	00	00	00	Retribusi Penggantian Biaya Cetak Peta	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
139	21	4	1	02	01	10	00	00	00	Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
140	22	4	1	02	01	11	00	00	00	Retribusi Pengolahan Limbah Cair	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
141	23	4	1	02	01	12	00	00	00	Retribusi Pelayanan Tera/Tera Ulang	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
142	24	4	1	02	01	13	00	00	00	Retribusi Pelayanan Pendidikan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
143	25	4	1	02	01	14	00	00	00	Retribusi Pengendalian Menara Telekomunikasi	2	\N	\N	\N	2020-01-01	2022-12-31	\N	0
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
159	39	4	1	02	03	03	00	00	00	Retribusi Izin Gangguan/ SIGTU	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
160	40	4	1	02	03	04	00	00	00	Retribusi Izin Trayek	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
161	41	4	1	02	03	05	00	00	00	Retribusi Izin Usaha Perikanan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
162	0	4	1	03	0	0	00	00	00	HASIL PENGELOLAAN KEKAYAAN DAERAH YANG DIPISAHKAN	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
163	0	4	1	03	01	00	00	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Milik Daerah/BUMD	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
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
192	0	4	1	04	07	00	00	00	00	Pendapatan Denda Atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
193	0	4	1	04	07	01	00	00	00	Pendapatan Denda Atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
194	0	4	1	04	08	00	00	00	00	Pendapatan Denda Pajak	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
195	1	4	1	04	08	01	00	00	00	Pendapatan Denda Pajak Hotel	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
196	2	4	1	04	08	02	00	00	00	Pendapatan Denda Pajak Restoran	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
197	3	4	1	04	08	03	00	00	00	Pendapatan Denda Pajak Hiburan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
198	4	4	1	04	08	04	00	00	00	Pendapatan Denda Pajak Reklame	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
199	5	4	1	04	08	05	00	00	00	Pendapatan Denda Pajak Penerangan Jalan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
200	6	4	1	04	08	06	00	00	00	Pendapatan Denda Pajak Mineral Bukan Logam dan Batuan	0	5000	\N	\N	2020-01-01	2022-12-31	\N	0
201	7	4	1	04	08	07	00	00	00	Pendapatan Denda Pajak Parkir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
202	8	4	1	04	08	08	00	00	00	Pendapatan Denda Pajak Air Tanah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
203	9	4	1	04	08	09	00	00	00	Pendapatan Denda Pajak Sarang Burung Walet	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
204	10	4	1	04	08	10	00	00	00	Pendapatan Denda Pajak Bumi dan Bangunan Perdesaan dan Perkotaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
205	11	4	1	04	08	11	00	00	00	Pendapatan Denda Bea Perolehan Hak Atas Tanah dan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
206	0	4	1	04	09	00	00	00	00	Pendapatan Denda Retribusi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
207	12	4	1	04	09	01	00	00	00	Pendapatan Denda Retribusi Pelayanan Kesehatan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
208	13	4	1	04	09	02	00	00	00	Pendapatan Denda Retribusi Pelayanan Persampahan/ Kebersihan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
209	14	4	1	04	09	03	00	00	00	Pendapatan Denda Retribusi Penggantian Biaya Cetak Kartu Tanda Penduduk dan Akta Catatan Sipil	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
210	15	4	1	04	09	04	00	00	00	Pendapatan Denda Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
211	16	4	1	04	09	05	00	00	00	Pendapatan Denda Retribusi Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
212	17	4	1	04	09	06	00	00	00	Pendapatan Denda Retribusi Pelayanan Pasar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
213	18	4	1	04	09	07	00	00	00	Pendapatan Denda Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
214	19	4	1	04	09	08	00	00	00	Pendapatan Denda Retribusi Pemeriksaan Alat Pemadam Kebakaran	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
215	20	4	1	04	09	09	00	00	00	Pendapatan Denda Retribusi Penggantian Biaya Cetak Peta	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
216	21	4	1	04	09	10	00	00	00	Pendapatan Denda Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
217	22	4	1	04	09	11	00	00	00	Pendapatan Denda Retribusi Pengolahan Limbah Cair	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
218	23	4	1	04	09	12	00	00	00	Pendapatan Denda Retribusi Pelayanan Tera/Tera Ulang	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
219	24	4	1	04	09	13	00	00	00	Pendapatan Denda Retribusi Pelayanan Pendidikan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
220	25	4	1	04	09	14	00	00	00	Pendapatan Denda Retribusi Pengendalian Menara Telekomunikasi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
221	26	4	1	04	09	15	00	00	00	Pendapatan Denda Retribusi Pemakaian Kekayaan Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
222	27	4	1	04	09	16	00	00	00	Pendapatan Denda Retribusi Pasar Grosir dan/ atau Pertokoan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
223	28	4	1	04	09	17	00	00	00	Pendapatan Denda Retribusi Tempat Pelelangan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
224	29	4	1	04	09	18	00	00	00	Pendapatan Denda Retribusi Terminal	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
225	30	4	1	04	09	19	00	00	00	Pendapatan Denda Retribusi Tempat Khusus Parkir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
226	31	4	1	04	09	20	00	00	00	Pendapatan Denda Retribusi Tempat Penginapan/ Pesanggrahan/ Villa	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
227	32	4	1	04	09	21	00	00	00	Pendapatan Denda Retribusi Rumah Potong Hewan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
228	33	4	1	04	09	22	00	00	00	Pendapatan Denda Retribusi Pelayanan Kepelabuhan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
229	34	4	1	04	09	23	00	00	00	Pendapatan Denda Retribusi Tempat Rekreasi dan Olah raga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
230	35	4	1	04	09	24	00	00	00	Pendapatan Denda Retribusi Penyeberangan Air	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
231	36	4	1	04	09	25	00	00	00	Pendapatan Denda Retribusi Penjualan Produksi Usaha Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
232	37	4	1	04	09	26	00	00	00	Pendapatan Denda Retribusi Izin Mendirikan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
233	38	4	1	04	09	27	00	00	00	Pendapatan Denda Retribusi Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
234	39	4	1	04	09	28	00	00	00	Pendapatan Denda Retribusi Izin Gangguan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
235	40	4	1	04	09	29	00	00	00	Pendapatan Denda Retribusi Izin Trayek	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
236	41	4	1	04	09	30	00	00	00	Pendapatan Denda Retribusi Izin Perikanan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
237	16	4	1	02	01	05	01	00	00	Sekali Parkir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
238	16	4	1	02	01	05	02	00	00	Parkir Berlangganan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
239	41	4	1	02	03	05	01	00	00	Surat Izin Usaha Penangkapan Ikan (SIUP)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
240	41	4	1	02	03	05	02	00	00	Surat Izin Penangkapan Ikan (SIPI)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
241	41	4	1	02	03	05	03	00	00	Surat Izin Kapan Penangkapan Ikan (SIKPI)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
242	41	4	1	02	03	05	04	00	00	Surat Izin Budi daya Ikan Air Tawar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
243	41	4	1	02	03	05	05	00	00	Surat Izin Budi daya Ikan Air Payau	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
244	41	4	1	02	03	05	06	00	00	Surat Izin Budi daya Ikan Air Laut	0	\N	\N	\N	2020-01-01	2019-12-31	\N	0
245	4	4	1	01	04	01	01	00	00	Reklame Papan	25	0	0	0	2020-01-01	2022-12-31	\N	0
246	4	4	1	01	04	01	02	00	00	Reklame Billboard	25	0	0	0	2020-01-01	2022-12-31	\N	0
247	4	4	1	01	04	01	03	00	00	Reklame Bersinar Papan	25	0	0	0	2020-01-01	2022-12-31	\N	0
248	4	4	1	01	04	01	04	00	00	Reklame Bersinar Megatron/Billboard	25	0	0	0	2020-01-01	2022-12-31	\N	0
249	4	4	1	01	04	01	05	00	00	Reklame Bersinar Neon Box	25	0	0	0	2020-01-01	2022-12-31	\N	0
250	26	4	1	02	02	01	01	00	00	Kerja Sama Pemanfaatan Aset Daerah	0	0	0	0	2020-01-01	2021-12-31	\N	0
251	26	4	1	02	02	01	02	00	00	Sewa Penggunaan Rumah Dinas	0	0	0	0	2020-01-01	2021-12-31	\N	0
77	5	4	1	01	10	01	001	00	00	Pajak Penerangan Jalan dihasilkan sendiri	1.5	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
108	6	4	1	01	14	23	00	00	00	Pasir dan kerikil	5	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
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

COPY public.s_reklamejenis (s_idreklamejenis, s_namareklamejenis, s_idrekening, s_permanen, s_indeks) FROM stdin;
5	Kain Spanduk/Umbul-umbul/Spanduk/sejenisnya	61	2	1
6	Melekat/Stiker	63	2	1
7	Selebaran	65	2	1
8	Udara	67	2	1.5
9	Apung	69	2	1
10	Suara	71	2	1
11	Film/Slide	73	2	1.20000005
12	Peragaan	75	2	1
3	Megatron / Videotron /Billboard dan Sejenisnya	59	1	1.5
2	Tiang	59	1	2
1	Papan	59	1	1
4	Baliho	59	1	4.5
\.


--
-- Data for Name: s_reklamelokasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklamelokasi (s_idreklamelokasi, s_namareklamelokasi, s_klasifikasilokasi) FROM stdin;
1	Jl Jenderal Ahmad Yani	1
2	Jl Jenderal Sudirman	1
3	Jl Mawar	1
4	Jl Anggrek	1
5	Jl Tambun Bungai	1
6	Jl Pemuda	1
8	Jl Trans Kalimantan	2
9	Jl Teratai	2
10	Jl Barito	2
11	Jl Seroja	2
12	Jl Patih Rumbih	2
13	Jl Mahakam	2
14	Jl Tjilik Riwut	2
15	Jl Aipda K S Tubun	3
16	Jl Letjen S Parman	3
17	Jl Kapten P Tendean	3
18	Jl kalimantan	3
19	Jl Mayjen MT Haryono	3
20	Jl Letkol Pdt Seth Adji	3
21	Jl Panglima Batur	3
22	Jl Brigjen DI Panjaitan	3
23	Jl Mayjen Soetoyo	3
24	Jl Sulawesi	4
25	Jl Garuda	4
26	Jl Sumatera	4
27	Pulau Telo	4
28	Jl Nusa Indah	4
29	Ibukota Kecamatan	4
30	Di luar ibukota kecamatan (selain Kecamatan Selat)	5
7	Jl Letjen Suprapto	1
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
1	1	1	2.70000005
2	1	2	2.29999995
3	1	3	2
4	1	4	1.70000005
5	1	5	1.5
6	2	1	2.70000005
7	2	2	2.29999995
8	2	3	2
9	2	4	1.70000005
10	2	5	1.5
11	3	1	3
12	3	2	2
13	3	3	1
14	3	4	0.600000024
16	4	1	3
17	4	2	2.5
18	4	3	2
19	4	4	1.70000005
20	4	5	1.5
21	5	1	3
22	5	2	2.5
23	5	3	2
24	5	4	1.70000005
25	5	5	1.5
26	6	1	3
27	6	2	2.5
28	6	3	2
29	6	4	1.70000005
30	6	5	1.5
31	7	1	3
15	3	5	0.349999994
32	7	2	2.5
33	7	3	2
34	7	4	1.70000005
35	7	5	1.5
36	8	1	3
37	8	2	2
39	8	3	1
40	8	4	0.600000024
41	8	5	0.349999994
42	9	1	3
43	9	2	2
44	9	3	1
45	9	4	0.600000024
46	9	5	0.349999994
47	10	1	3
48	10	2	2
49	10	3	1
50	10	4	0.600000024
52	11	1	3
53	11	2	2
54	11	3	1
55	11	4	0.600000024
51	10	5	0.349999994
56	11	5	0.349999994
57	12	1	3
58	12	2	2
59	12	3	1
60	12	4	0.600000024
61	12	5	0.349999994
\.


--
-- Data for Name: s_reklamenilaiukuran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_reklamenilaiukuran (s_idukurannilaireklame, s_idjenisreklame, s_rangeukuran1, s_rangeukuran2, s_indeks, s_satuanukuran) FROM stdin;
40	10	1.00100005	10	4	menit
43	11	1	15	1	detik
47	11	1	24	10	jam
28	7	0	70	1	cm2
21	5	0	1	0.100000001	m2
16	4	0	1	0.100000001	m2
1	1	0	1	0.100000001	m2
6	2	0	1	0.100000001	m2
11	3	0	1	0.100000001	m2
26	6	0	1	1	m2
30	8	0	2	2	m
33	9	0	1	0.400000006	jam
38	10	0	15	1	detik
2	1	1	5	0.300000012	m2
3	1	5	15	0.899999976	m2
4	1	15	40	2	m2
5	1	40	9999	2.5	m2
7	2	1	5	0.300000012	m2
8	2	5	15	0.899999976	m2
9	2	15	40	2	m2
10	2	40	9999	2.5	m2
12	3	1	5	0.300000012	m2
13	3	5	15	0.899999976	m2
14	3	15	40	2	m2
15	3	40	9999	2.5	m2
17	4	1	5	0.300000012	m2
18	4	5	15	0.899999976	m2
19	4	15	40	2	m2
20	4	40	9999	2.5	m2
22	5	1	5	0.300000012	m2
23	5	5	15	0.899999976	m2
24	5	15	40	2	m2
25	5	40	9999	2.5	m2
27	6	1	9999	2	m2
29	7	70	9999	2	cm2
31	8	2	5	3	m
32	8	5	9999	5	m
34	9	1	3	0.600000024	jam
35	9	3	6	0.800000012	jam
36	9	6	10	1.10000002	jam
37	9	10	24	1.5	jam
39	10	15	60	2	detik
41	10	10	60	8	menit
42	10	1	24	10	jam
44	11	15	60	2	detik
45	11	1	10	4	menit
46	11	10	60	8	menit
48	12	0	1	2	jam
49	12	1	6	3	jam
50	12	6	12	5	jam
51	12	12	24	9	jam
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
37	10	1	7	2.4000001	3
33	9	1	1	2	2
29	8	1	1	2	2
41	11	1	7	2.4000001	3
25	7	1	1	2	2
21	6	1	1	2	2
17	5	1	1	2.4000001	2
1	1	1	1	1	2
5	2	1	1	1	2
9	3	1	1	2.4000001	2
13	4	1	1	2.4000001	2
45	12	1	3	2.4000001	3
46	12	4	7	5	3
47	12	8	30	9.5	3
48	12	31	365	18	3
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
1	10201	DINAS KESEHATAN
2	10202	RUMAH SAKIT UMUM DAERAH
3	10301	DINAS PEKERJAAN UMUM
4	10701	DINAS PERHUBUNGAN
5	11001	DINAS PEMUKIMAN DAN KEPENDUDUKAN
6	11401	DINAS TENAGA KERJA
7	11501	DINAS KOPERASI DAN UKM
8	12004	SEKRETARIAT DAERAH
12	12011	BADAN PENDAPATAN DAERAH
13	12101	BADAN DIKLAT
14	12501	DINAS INFORMASI DAN KOMUNIKASI
15	20103	DINAS PETERNAKAN DAN PERTANIAN
16	20201	DINAS KEHUTANAN DAN PERKEBUNAN
17	20501	DINAS KELAUTAN DAN PERIKANAN
18	20701	DINAS PERINDAG
19	20801	BP3D
20	20803	BADAN PEMBERDAYAAN MASYARAKAT KAMPUNG
21	20803	BPKAD
11	1200903	DISTRIK SUPIORI TIMUR
10	1200902	DISTRIK SUPIORI SELATAN
9	1200901	DISTRIK SUPIORI BARAT
22	1200904	KEPULAUAN ARURI
23	1200905	DISTRIK SUPIORI UTARA
\.


--
-- Data for Name: s_target; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_target (s_idtarget, s_tahuntarget, s_statustarget, s_keterangantarget) FROM stdin;
3	2020	1	Pajak Daerah (BAPENDA)
2	2020	1	Pajak Daerah 2020 (SIMDA)
1	2020	2	simpatda (perubahan 2020)
4	2021	1	Pendapatan Daerah 2021
\.


--
-- Data for Name: s_targetdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_targetdetail (s_idtargetdetail, s_idtargetheader, s_targetrekening, s_targetjumlah) FROM stdin;
36	3	15	3000000000
37	3	46	25000000
38	3	128	5000000
39	3	92	22000000
40	3	103	10000000
41	3	117	10000000
42	3	34	100000000
43	3	113	100000000
49	2	46	75000000
47	2	47	1500000000
50	2	98	225000000
51	2	99	50000000
52	2	114	25000000
53	2	117	15000000
44	2	15	3700000000
54	2	92	50000000
56	2	143	1750000000
57	3	3	3947000000
58	3	93	50000000
59	3	97	206840000
12	1	4	10000000000
60	3	96	206840000
61	3	2	5668840000
62	3	1	5668840000
55	2	300	125000000
63	2	301	50000000
64	2	127	55000000
65	2	207	35000000
66	2	3	5425000000
67	2	1	7755000000
68	2	2	7755000000
69	2	33	100000000
70	2	216	50000000
45	2	34	50000000
71	2	96	2365000000
72	2	97	2365000000
31	3	94	50000000
19	1	33	75000000
6	3	99	96840000
73	1	216	75000000
32	3	47	750000000
16	1	47	1000000000
74	1	46	75000000
35	3	138	1500000000
75	1	34	75000000
76	1	92	50000000
9	1	3	2700000000
10	1	2	4965000000
11	1	1	4965000000
77	1	98	225000000
78	1	99	50000000
79	1	117	25000000
80	1	127	55000000
81	1	207	35000000
82	1	300	125000000
83	1	144	1750000000
84	1	96	2265000000
85	1	97	2040000000
86	4	21	2500000
87	4	99	100000000
88	4	34	25000000
\.


--
-- Data for Name: s_targetjenis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_targetjenis (s_idtargetjenis, s_namatargetjenis) FROM stdin;
1	Murni
2	Perubahan
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
1	1	Perumahan (Orang Pribadi) di wilayah kampung/kelurahan	35000	bulan
2	2	Kios, Salon, Sablon, Panti Pijat, Bengkel/presban, dan Meubel	35000	bulan
3	2	Warung/Rumah Makan, Restoran, Bar, Cafe, Penjahit, Pemangkas Rambut dan Bengkel	35000	bulan
5	4	Pasar Kelas Kabupaten || Pedagang Los/Meja	35000	bulan
6	4	Pasar Kelas Kabupaten || Kios	35000	bulan
7	4	Pasar Kelas Kabupaten || Toko	35000	bulan
8	4	Pasar Kelas Distrik || Pedagang Los/Meja	35000	bulan
9	4	Pasar Kelas Distrik || Kios	35000	bulan
11	2	CV ( Badan Usaha )	35000	bulan
12	3	CV ( Badan Usaha )	35000	bulan
10	1	CV ( Badan Usaha )	35000	bulan
4	3	Toko, Supermarket, Hotel, Penginapan	35000	bulan
13	1	PT	35000	bulan
14	2	PT	35000	bulan
15	3	PT	35000	bulan
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
1	1	Semi Permanen	5000	m2	bulan
2	1	Permanen	7500	m2	bulan
3	2	Semi Permanen	5000	m2	bulan
4	2	Permanen	7500	m2	bulan
5	3	Semi Permanen	4000	m2	bulan
6	3	Permanen	4000	m2	bulan
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
29	bendahara	827ccb0eea8a706c4c34a16891f84e7b	6	\N	BENDAHARA	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	(1),(8),(11),(12)	0
30	pemeriksa	827ccb0eea8a706c4c34a16891f84e7b	7	\N	PEMERIKSA	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	(1),(10),(11),(12),(13),(14)	0
12	H2H	93114f3c91c0e9f63ee525c4a23c4015	6	-	BANK PAPUA	\N	\N	\N	\N	\N	\N	\N	\N	BANK	\N	\N	\N	(1),(8),(11),(12)	0
13	Operator	827ccb0eea8a706c4c34a16891f84e7b	3	1111	OPERATOR	\N	\N	\N	\N	\N	\N	\N	\N	STAF	\N	\N	\N	(1),(2),(3),(4),(5),(6),(11),(12)	0
28	admin	1b3231655cebb7a1f783eddf27d254ca	2		Administrator Aplikasi					\N	\N			Administrator			\N	(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(27)	0
25	bapenda	827ccb0eea8a706c4c34a16891f84e7b	3	-	DAFDA	\N	\N	\N	\N	\N	\N	\N	\N	Bapenda	\N	\N	\N	(1),(2),(3),(4),(5),(6),(11),(12)	0
33	develop	54eec8b2b2f5ea14ebd3da3f82dfe6ec	2		Development	\N	\N	\N	\N	\N	\N	\N	\N	Programmer	\N	\N	\N	(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(27)	0
15	robby	827ccb0eea8a706c4c34a16891f84e7b	3	1234567890	Robby	\N	\N	\N	\N	\N	\N	\N	\N	Staff	\N	\N	\N	(1),(2),(3),(4),(5),(6),(11),(12)	0
26	penetapan	827ccb0eea8a706c4c34a16891f84e7b	4	-	PENETAPAN	\N	\N	\N	\N	\N	\N	\N	\N	Penata 	\N	\N	\N	(1),(4),(5),(6),(7),(10),(11),(12)	0
27	penagihan	827ccb0eea8a706c4c34a16891f84e7b	5	-	PENAGIHAN	\N	\N	\N	\N	\N	\N	\N	\N	Staff	\N	\N	\N	(1),(9),(11),(12),(13),(14)	0
14	yonathan	827ccb0eea8a706c4c34a16891f84e7b	4	197803082006051001	Yonathan Rumbekwan, S. Sos	\N	\N	\N	\N	\N	\N	\N	\N	Kepala Bidang Penetapan	\N	\N	\N	(1),(4),(5),(6),(7),(10),(11),(12)	0
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
4	146	2900	\N	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	0	20	\N	0	30	50	1	1	1777777	3794947
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
1	1156	2	2	25000	12	\N
2	3	1	1	35000	12	\N
3	5	1	1	35000	12	\N
4	6	1	1	35000	12	\N
5	9	1	1	35000	12	\N
6	12	1	1	35000	12	\N
7	15	1	1	35000	12	\N
8	17	3	4	35000	12	\N
9	19	1	1	35000	12	\N
10	22	3	4	35000	12	\N
11	24	1	1	35000	12	\N
12	26	3	12	35000	12	\N
13	28	3	4	35000	12	\N
14	30	3	4	35000	12	\N
15	32	3	4	35000	12	\N
16	34	1	10	35000	12	\N
17	37	1	1	35000	12	\N
18	39	1	10	35000	12	\N
19	41	3	12	35000	12	\N
20	44	2	11	35000	12	\N
21	45	1	10	35000	12	\N
22	47	2	2	35000	12	\N
23	49	2	2	35000	12	\N
24	51	2	2	35000	12	\N
25	53	2	2	35000	12	\N
26	54	3	12	35000	12	\N
27	55	1	1	35000	12	\N
28	57	1	1	35000	12	\N
29	59	3	4	35000	12	\N
30	60	1	10	35000	12	\N
31	62	1	10	35000	12	\N
32	65	3	12	35000	12	\N
33	67	3	12	35000	12	\N
34	70	1	1	35000	12	\N
35	71	1	10	35000	12	\N
36	73	2	11	35000	12	\N
37	75	3	4	35000	12	\N
38	77	1	10	35000	12	\N
39	79	3	4	35000	12	\N
40	82	1	1	35000	12	\N
41	84	1	10	35000	12	\N
42	86	1	10	35000	12	\N
43	88	1	10	35000	12	\N
44	90	1	10	35000	12	\N
45	93	1	1	35000	12	\N
46	95	1	10	35000	12	\N
47	98	2	11	35000	12	\N
48	100	1	10	35000	12	\N
49	103	1	10	35000	12	\N
50	104	2	11	35000	12	\N
51	106	1	10	35000	12	\N
52	108	1	10	35000	12	\N
53	110	1	10	35000	12	\N
54	112	1	13	35000	12	\N
55	113	1	13	35000	12	\N
56	115	3	12	35000	12	\N
57	120	1	1	35000	12	\N
58	122	1	10	35000	12	\N
59	124	1	10	35000	12	\N
60	128	3	12	35000	12	\N
\.


--
-- Data for Name: t_detailkekayaan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailkekayaan (t_idkekayaan, t_idtransaksi, t_idklasifikasi, t_nilailuastanah, t_nilailuasbangunan, t_luastanah, t_luasbangunan, t_jmlhbln, t_potongan, t_kategorisatu, t_kategoridua, t_hargatanah, t_hargadasarsewa) FROM stdin;
\.


--
-- Data for Name: t_detailkir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailkir (t_iddetailkir, t_idtransaksi, t_idtarif, t_hargadasar, t_jumlah) FROM stdin;
\.


--
-- Data for Name: t_detailminerba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailminerba (t_idminerba, t_idtransaksi, t_idkorek, t_volume, t_hargapasaran, t_jumlah, t_tarifpersen, t_pajak) FROM stdin;
45	143	118	10.00	5000	50000	15	7500
46	143	120	5.00	5000	25000	5	1250
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

COPY public.t_detailppj (t_iddetailppj, t_idtransaksi, t_idkorek, t_nilailistrik, t_subtotalpajak, t_pajak) FROM stdin;
\.


--
-- Data for Name: t_detailreklame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_detailreklame (t_iddetailreklame, t_idtransaksi, t_jenisreklame, t_naskah, t_lokasi, t_panjang, t_lebar, t_jumlah, t_jangkawaktu, t_tipewaktu, t_jenisreklameusaha, t_sudutpandang, t_nsr, t_tarifreklame, t_kelasjalan, t_ukuranmedia, t_satuanukuranmedia, t_idlokasi, t_parameter) FROM stdin;
87	131	1	Roko L.A	Jl. Anggrek no 5	1.00	1.00	1	1	2	1	\N	\N	20	1	1	m2	4	1 x 2.7 x 1 x 1 x 0.1 x 200000
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

COPY public.t_keberatan (t_idkeberatan, t_idwpobjek, t_idketetapan, t_jenisketetapan, t_jenispajak, t_nokeberatan, t_tglketetapankeberatan, t_alasankeberatan, t_jmlhketetapanseharusnya, t_inputkeberatan, t_tglverifikasi, t_statusverifikasi, t_pejabatverifikasi, t_nilaipengurangan, t_jmlhpengurangan, t_jmlhditetapkan) FROM stdin;
\.


--
-- Data for Name: t_klasifikasi_kebersihan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_klasifikasi_kebersihan (t_idklasifikasi, t_keterangan) FROM stdin;
3	Klasifikasi III ( Lainnya )
2	Klasifikasi II ( Sedang )
1	Klasifikasi I ( Strategis )
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

COPY public.t_setoranlain (t_idsetoranlain, t_idsatker, t_idrekening, t_tahunpajak, t_jumlahsetor, t_tglsetor, t_viasetor, t_kodebukti, t_issetorandeleted, t_nomorurut) FROM stdin;
5	12	94	2020	30000000	2020-11-30	1	3	1	5
3	12	94	2020	5000000	2020-09-03	1	3	1	3
2	12	99	2020	100000000	2020-11-30	1	2	1	2
4	3	99	2020	20000000	2020-10-07	1	2	1	4
1	3	99	2020	10000000	2020-11-23	1	2	1	1
10	12	166	2020	355000	2020-12-10	1	1	1	10
9	12	176	2020	550000	2020-12-10	1	1	1	9
8	12	172	2020	250100	2020-12-10	1	1	1	8
7	3	99	2020	2550000	2020-05-01	1	1	1	7
6	3	103	2020	1000000	2020-12-10	1	1	1	6
\.


--
-- Data for Name: t_setorbankdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_setorbankdetail (t_idsbd, t_idsbh, t_idkoreksbd, t_jmlhsbd, t_issbddeleted, t_idtransaksi) FROM stdin;
\.


--
-- Data for Name: t_setorbankheader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_setorbankheader (t_idsbh, t_tglsbh, t_nosbh, t_issbhdeleted) FROM stdin;
\.


--
-- Data for Name: t_skpdkb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_skpdkb (t_idskpdkb, t_idtransaksi, t_nopemeriksaan, t_noskpdkb, t_periodeskpdkb, t_tglskpdkb, t_tgljatuhtemposkpdkb, t_tarifpajak, t_dasarrevisi, t_selisihdasar, t_jmlhbln, t_tarifpersen, t_jmlhdendaskpdkb, t_jmlhpajakseharusnya, t_jmlhpajakskpdkb, t_kodebayarskpdkb, t_totalskpdkb, t_operatorskpdkb, t_tglbayarskpdkb, t_viabayarskpdkb, t_jmlhbayarskpdkb, t_operatorbayarskpdkb, t_jenispemeriksaan) FROM stdin;
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
\.


--
-- Data for Name: t_transaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_transaksi (t_idtransaksi, t_idwpobjek, t_idkorek, t_jenispajak, t_nourut, t_periodepajak, t_tglpendataan, t_masaawal, t_masaakhir, t_dasarpengenaan, t_nilaiperolehan, t_tarifpajak, t_tarifdasarkorek, t_jmlhpajak, t_namakegiatan, t_noskpdjab, t_tarifkenaikan, t_jmlhkenaikan, t_operatorpendataan, is_deluserpendataan, t_tglpenetapan, t_nopenetapan, t_operatorpenetapan, is_deluserpenetapan, t_tgljatuhtempo, t_kodebayar, t_viapembayaran, t_jmlhpembayaran, t_nopembayaran, t_tglpembayaran, t_operatorpembayaran, is_deluserpembayaran, t_nostpd, t_idkorekdenda, t_jmlhdendapembayaran, t_jmlhbulandendapembayaran, t_tgldendapembayaran, t_operatordendapembayaran, is_deluserdendapembayaran, t_viapembayarandenda, t_jmlhbayardenda, t_tglbayardenda, t_operatorbayardenda, is_deluserbayardenda, t_alasanpembatalanskpd, t_tglpembatalanskpd, t_nopembatalanskpd, is_esptpd, t_tglentry_system, t_file_berkas) FROM stdin;
146	166	82	8	4	2021	2021-02-14	2021-01-01	2021-01-31	0	\N	20	\N	758990	\N	\N	0	0	28	0	2021-02-14	2	28	\N	2021-03-16	620308022100004	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2021-02-14 08:56:21.908026	\N
132	162	6	1	2	2021	2021-01-02	2021-01-01	2021-01-31	500000	\N	10	\N	50000	\N	\N	0	0	28	0	\N	\N	0	\N	2021-02-15	620301012100002	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2021-02-10 14:15:34.535365	\N
133	162	6	1	3	2021	2021-03-16	2021-02-01	2021-02-28	2000000	\N	10	\N	200000	\N	\N	\N	\N	81	0	\N	\N	0	\N	2021-03-15	140701012100003	1	200000	2	2021-03-17	28	\N	2	\N	4000	1 	2021-03-17	28	\N	0	\N	\N	0	\N	\N	\N	\N	1	2021-03-16 09:19:43.018038	\N
131	111	59	4	1	2021	2021-02-10	2021-02-01	2021-02-28	54000	\N	20	\N	10800	\N	\N	0	0	28	0	2021-02-10	1	28	\N	2021-03-12	620304022100001	1	10800	3	2021-03-17	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2021-02-10 11:43:59.18994	\N
\.


--
-- Data for Name: t_wp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_wp (t_idwp, t_tgldaftar, t_jenispendaftaran, t_bidangusaha, t_nopendaftaran, t_nik, t_nama, t_alamat, t_rt, t_rw, t_kelurahan, t_kecamatan, t_kelurahanluar, t_kecamatanluar, t_kabupaten, t_notelp, t_kodepos, t_email, t_operatorid, is_deluser, t_nama_badan, t_jalan_badan, t_rt_badan, t_rw_badan, t_kecamatan_badan, t_kelurahan_badan, t_kabupaten_badan, t_kecamatan_badan_luar, t_kelurahan_badan_luar, t_status_wp, t_tgl_tutup, t_ket_tutup, t_operatorid_tutup, t_noberita, t_tgl_buka, t_ket_buka, t_operatorid_buka, t_noberita_buka, t_photowp) FROM stdin;
2	2018-01-01	P	2	2		Sandy Efendy	Douwbo Supiori Timur, Papua	000	00 	10	1	\N	\N	SUPIORI	081344416882	98573	cv.gunturpratama171219@gmail.com	28	\N	CV. Guntur Pratama	Douwbo Supiori Timur, Papua	000	00 	1	10	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	2018-01-01	P	2	3		IWAN	Sorendiweri	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	DEPOT AIR MINUM MULIA	Sorendiweri	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	2018-01-01	P	2	4		PAULUS PATULA	Sorendiweri	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PAULUS	Sorendiweri	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	2018-01-01	P	2	5		FADLI	Sorendiweri	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO KIOS PUTRI	Sorendiweri	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	2018-01-01	P	2	6		AGUS R SUWARNO	Sorendiweri	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	RESTORAN RAMADHINA	Sorendiweri	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	2018-01-01	P	2	7		MELTI MASUANG	Sorendiweri	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	GTM COFFEE	Sorendiweri	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	2018-01-01	P	2	8		BARETHA PAKASI	Wombonda	   	   	5	1	\N	\N	SUPIORI		98163	\N	28	\N	MEUBEL BARRETHA	Wombonda	\N	\N	1	5	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	2018-01-01	P	2	9		ANWAR	Waryesi	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	PENJAHIT ALDY	Waryesi	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	2018-01-01	P	2	10		JEKSON MAKIS	Wafor	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV JORDAN INDAH	Wafor	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	2018-01-01	P	2	11		TANDE	Waryesi	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ADI	Waryesi	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	2018-01-01	P	2	12		IRMA	Syurdori	   	   	9	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO	Syurdori	\N	\N	1	9	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	2018-01-01	P	2	13		JUNIARSON PURBA	Wombonda RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	5	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Rojekkita	Wombonda RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	5	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	2018-01-01	P	2	14		SANTOS TOMANGIN	WAKRE RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS RANNU	WAKRE RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	2018-01-01	P	2	15		ULFIANI BUJUHARI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO MANADO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	2018-01-01	P	2	16		YOHANA SALU	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO DIRGA	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	2018-01-01	P	2	17		RUSMIATI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.REDJO	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	2018-01-01	P	2	18		SATTIMAH	SORENDIWERI RT/RW : - , Duber ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO YAKUSA	SORENDIWERI RT/RW : - , Duber ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	2018-01-01	P	2	19		MARGARETHA PATIUNG	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS FAJAR PADANG	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	2018-01-01	P	2	20		SANTO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	MEUBEL MANADO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	2018-01-01	P	2	21		TIGOR H SIMANJUNTAK	DOUWBO RT/RW : - , Douwbo , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	10	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS DOUWBO	DOUWBO RT/RW : - , Douwbo , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	10	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	2018-01-01	P	2	22		OSMAR PURBA	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SAROHA	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	2018-01-01	P	2	23		MUTMAINA	sorendiweri Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	RESTO MUTIARA	sorendiweri Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	2018-01-01	P	2	24		MARTHINUS DOMENG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO PURNA KARYA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	2018-01-01	P	2	25		TATANG	Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.FIKRI BANDUNG	Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	2018-01-01	P	2	26		PENINA MSIREN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO RAJAWALI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	2018-01-01	P	2	27		HERMAN	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KONVEKSI FIKRAN JAYA	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	2018-01-01	P	2	28		ONA VERA AG	SAWRKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS WAFOR INDAH	SAWRKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	2018-01-01	P	2	29		AGUS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	BATU TELA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	2018-01-01	P	2	30		AGUS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ARTHA INDAH PERMAI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
858	2020-12-04	R	2	430	20201790301	SILPA SAREWO	KAMPUNG MARSRAM 	000	00 	3	1			SUPIORI	00000000	98573		25	\N	CV. SINAR WAKRE	KAMPUNG MARSRAM	000	00 	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	2018-01-01	P	2	31		AGUS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	DEPOT AIR MINUM	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	2018-01-01	P	2	32		ADIRUDDIN	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	BENGKEL MAROS	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	2018-01-01	P	2	33		OLGA MANSOBEN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SUPIORI BERJUANG	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	2018-01-01	P	2	34		OLGA MANSOBEN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	RESTORAN WARPARAIDI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	2018-01-01	P	2	35		SITTI HAYATI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	BENGKEL AL-ERYOS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	2018-01-01	P	2	36		MANGAPUL SITUMEANG	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS KEMBAR	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	2018-01-01	P	2	37		LINA PAULUS GINTING	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS TOKO GICELI PERMAI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	2018-01-01	P	2	38		LUTER BANDASO	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS YITRO	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	2018-01-01	P	2	39		DENNY UMPAPAR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO DENNY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	2018-01-01	P	2	40		HAIRUL ANAM	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO ICHDA SUPIORI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	2018-01-01	P	2	41		JHON	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.BAKSO MANALAGI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	2018-01-01	P	2	42		KADEK JERO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. SUMBER SARI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	2018-01-01	P	2	43		LINCE RUMERE	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS BOSNIK	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	2018-01-01	P	2	44		RONALD	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO SUPIORI MAKMUR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	2018-01-01	P	2	45		OCE RUMBRAPUK	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS MAXROS	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	2018-01-01	P	2	46		YANTI L TEDANG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS AVC	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	2018-01-01	P	2	47		PEDI ARUNG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	MEUBEL BUKIT SION	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	2018-01-01	P	2	48		JOSIA BABIS	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS TUNAS BARU	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	2018-01-01	P	2	49		KAREL SOMBA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO LEON	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	2018-01-01	P	2	50		DAVID MANSOBEN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. PORES 1	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	2018-01-01	P	2	51		DAVID MANSOBEN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WW.PORES 2	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	2018-01-01	P	2	52		YOSEPHINA MSIREN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SANCHEN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	2018-01-01	P	2	53		YOAP MARYAR	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Warba Group	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	2018-01-01	P	2	54		YOAP MARYAR	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	PENCETAKAN WARBA GRUP	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	2018-01-01	P	2	55		YOAP MARYAR	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	RESTORAN WARBA GRUP	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	2018-01-01	P	2	56		BENYAMIN WABDARON	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	BENGKEL MANDIRI	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	2018-01-01	P	2	57		MARDA ZEDLY	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	AGEN MINYAK TANAH ANUGERAH	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	2018-01-01	P	2	58		MARDA ZEDLY	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SESEAN JAYA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
59	2018-01-01	P	2	59		MARDA ZEDLY	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ANUGERAH	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	2018-01-01	P	2	60		SYAMSUL	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.PODOMORO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	2018-01-01	P	2	61		AMIRUDIN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO SAMI INDAH	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	2018-01-01	P	2	62		ROSITA FONATABA	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS AFYAK	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	2018-01-01	P	2	63		CHOIRUL ANAM	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98613	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.RIZKY LAUT	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98613	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	2018-01-01	P	2	64		MELNANUS YENINAR	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	14	2	\N	\N	SUPIORI		98163	\N	28	\N	CV AYAMI MANDIRI	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
65	2018-01-01	P	2	65		IIS NURAISYAH	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO NABILA PUTRA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
66	2018-01-01	P	2	66		JUMAHI BARI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98168	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PIMI HOSANA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98168	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	2018-01-01	P	2	67		ABDUL AZIZ	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	WARUNG MAKAN SARI LAUT	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	2018-01-01	P	2	68		ERNIWATI	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO HAMDANA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	2018-01-01	P	2	69		SAFARI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. KETAPANG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	2018-01-01	P	2	70		ADOLOF KMUR	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO HORAS	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	2018-01-01	P	2	71		JANE METTY KUMAKAUW	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. TONDANO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	2018-01-01	P	2	72		NURHASANA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO HADI	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	2018-01-01	P	2	73		ROSIDAH	waryesi RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS /TOKO FAIRAH	waryesi RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
74	2018-01-01	P	2	74		EFRADUS BINUR	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO JUNIOR	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
75	2018-01-01	P	2	75		SANDY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.SEDERHANA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	2018-01-01	P	2	76		JERRY PATADIANANG	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	15	2	\N	\N	SUPIORI		98163	\N	28	\N	TOKO SIDURU	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	15	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	2018-01-01	P	2	77		MUSINA SWOM	WOMBONDA RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	5	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS MIOSER	WOMBONDA RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	5	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	2018-01-01	P	2	78		HERRY POMBOS	duber RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS /TOKO TERRY	duber RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	2018-01-01	P	2	79		ABDUL RAHMAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PERCETAKAN BATU HARAPAN BARU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
80	2018-01-01	P	2	80		JOIS GERUNGAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	0	\N	\N	SUPIORI		98163	\N	28	\N	RESTO WM NADI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	\N	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	2018-01-01	P	2	82		ARIE POMBOS	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO ARMAN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
83	2018-01-01	P	2	83		MINCE KAKE	waryesi RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ARROW	waryesi RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	2018-01-01	P	2	84		STANLI YAWAN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO VESTEN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
85	2018-01-01	P	2	85		HEINCE TAMBUKU	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS EDWIN	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
86	2018-01-01	P	2	86		PA. RUDI HADI SUMARNO	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	14	2	\N	\N	SUPIORI		98163	\N	28	\N	TOKO THIO	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
87	2018-01-01	P	2	87		AGUSTINA PONSIBIDANG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS KEJORA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
88	2018-01-01	P	2	88		LIDIA BELENG	WOMBONDA RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	5	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS BERKAT INDAH	WOMBONDA RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	5	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
89	2018-01-01	P	2	89		BENYAMIN JANU	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	14	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS REY	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
90	2018-01-01	P	2	90		MELKIAS TAPIPEA	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	BATU TELA FASOS ARWO	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
91	2018-01-01	P	2	91		DAUD BINUR	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS TMDI	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	2018-01-01	P	2	92		INDIRANDA KAPITARAU	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	15	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS KANDERA APUS	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	15	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
93	2018-01-01	P	2	93		SAJIKMAN	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 9810	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CONTER HP RB SELULER	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 9810	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
94	2018-01-01	P	2	94		ERNAMINTA PURBA	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SYALLOM	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
95	2018-01-01	P	2	95		LEGIMAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.BAROKAH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
96	2018-01-01	P	2	96		ROSWITHA NOYA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.VICTORY PAPUA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	2018-01-01	P	2	97		ROSWITHA NOYA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ENCI	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
98	2018-01-01	P	2	98		FALENTINA MUDA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS RISKY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
99	2018-01-01	P	2	99		JAIDUN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS   BUTON INDAH	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
100	2018-01-01	P	2	100		YENI MASIARO	waryesi RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SASA	waryesi RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
101	2018-01-01	P	2	101		RICKY OLIVER TAMBUNAN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PAHAE NAUDI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
102	2018-01-01	P	2	102		ESTER TIKI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS FEBY	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
103	2018-01-01	P	2	103		HARIANTO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS BUTON DAMAI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
104	2018-01-01	P	2	104		ERIANA BASRI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. ANNISA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
105	2018-01-01	P	2	105		AHMAD YADI	SORENDIWRI RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.MIE AYAM MORODADI	SORENDIWRI RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
860	2020-01-30	R	1	431	0104392504	RAMA SUANI LINGGA	KAMPUNG FANINDI	00 	00 	25	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
106	2018-01-01	P	2	106		JULIANTO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.MANGGOKOR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
107	2018-01-01	P	2	107		ABDUL LATIF	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.SATE SELERAKU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
108	2018-01-01	P	2	108		MARSEL	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.BUMBU DESA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
109	2018-01-01	P	2	109		FUSUF LEMBONGAN	WAKRE RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS YUSUP	WAKRE RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
110	2018-01-01	P	2	110		DESTRIANUS MANTONG	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS FAJAR MAMBA	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	2018-01-01	P	2	111		SONNY PABUNTANG	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ZEJA	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
112	2018-01-01	P	2	112		UTREK PARIARIBO	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	BENGKEL DYJY	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
113	2018-01-01	P	2	113		CRISTIA	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS CRISTIA	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
114	2018-01-01	P	2	114		NAOMI   MANDOWEN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SESAYE	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
115	2018-01-01	P	2	115		YULIANA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS BAADIA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
116	2018-01-01	P	2	116		HJ. NURHASANA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	PERCETAKAN BATU TELA HARIDA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
117	2018-01-01	P	2	117		ALEX C. GIRSANG	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CONTER HP AFRIAN CELL	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
118	2018-01-01	P	2	118		ALEX C. GIRSANG	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS AFRIAN	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
119	2018-01-01	P	2	119		ALEX C. GIRSANG	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO AFRIAN	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
120	2018-01-01	P	2	120		ERNAWAN NAINGIN	Sorendiwri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Lae	Sorendiwri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
121	2018-01-01	P	2	121		RIDESNI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Sumber Rejeki	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
122	2018-01-01	P	2	122		ADATANGKELANGGI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios AMANDA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
123	2018-01-01	P	2	123		MARLIN MAKABA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS TITANIA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
124	2018-01-01	P	2	124		ASARIA MAREWA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Restu Ibu	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
125	2018-01-01	P	2	125		LIMBONG PABUTUNGAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS R'CHA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
126	2018-01-01	P	2	126		JUMANIA PRAAS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Putri	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
127	2018-01-01	P	2	127		MARLINA PALEMBANGAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Gheral	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
128	2018-01-01	P	2	128		NELFINCE IMBIR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	AGEN MINYAK	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
129	2018-01-01	P	2	129		NELMA TANDIRAU	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS  EBY	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
130	2018-01-01	P	2	130		REXY LUDONG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PERCETAKAN SINAR BATU TELA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
131	2018-01-01	P	2	131		LALLO JUFRI	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MAROS	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
132	2018-01-01	P	2	132		LALLO JUFRI	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO MAROS JAYA	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
133	2018-01-01	P	2	133		FONY ALFONSINA ARFUSAU	WOMBONDA RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	5	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PUTRA KEMBAR	WOMBONDA RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	5	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
134	2018-01-01	P	2	134		IMAWATI	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	MAROS INDAH	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
135	2018-01-01	P	2	135		JAILINDA	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO INAYAH	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
136	2018-01-01	P	2	136		WHELMINA RUMBEKWAN	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS BRAZILA	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
137	2018-01-01	P	2	137		KARMAN	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SAROHA	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
138	2018-01-01	P	2	138		ANDI RIJALDI	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO MENTARI	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
139	2018-01-01	P	2	139		ANELCE MNIBER	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS RISDA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
140	2018-01-01	P	2	140		DAVID SAMBO	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS NELMA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
141	2018-01-01	P	2	141		NINCE KAKKE	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ARROW	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
142	2018-01-01	P	2	142		WILSON MSIREN	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO KARUNIA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
143	2018-01-01	P	2	143		MARKUS MANSOBEN	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS MAYBORI	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
144	2018-01-01	P	2	144		OKTOVINA FAKNIK	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98164	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS AURELIA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98164	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
145	2018-01-01	P	2	145		MERY PERIRA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS JHONET	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
147	2018-01-01	P	2	147		SONY AMUNAUW	SYURDORI RT/RW : - , Syurdori ,  Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	9	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ABHA	SYURDORI RT/RW : - , Syurdori ,  Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	9	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
148	2018-01-01	P	2	148		IKMAN HARIS	MARSRAM   RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	WARUNG KOPI	MARSRAM   RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
149	2018-01-01	P	2	149		MUH HARIYONO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	GORENGAN MAS GANTENG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
150	2018-01-01	P	2	150		WIDI MAYUDI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. LALAPAN SATRIA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
151	2018-01-01	P	2	151		PRIESLY SETERIANA . B	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	MARAMPA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
152	2018-01-01	P	2	152		YULES RUMBINO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	0	\N	\N	SUPIORI		98163	\N	28	\N	MEUBEL SURBABO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	\N	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
153	2018-01-01	P	2	153		DAMARES WAKUM	KORIDO RT/RW : - , Biniki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	28	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.AMPOMBAKEN	KORIDO RT/RW : - , Biniki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	28	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
154	2018-01-01	P	2	154		BILY MENINDA TELAUBUNUA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS DINDA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
155	2018-01-01	P	2	155		MUNAWARA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS AL FAIS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
156	2018-01-01	P	2	156		SLAMET R.D PURWANTO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.MAHKOTA LAMONGAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
157	2018-01-01	P	2	157		SUGIANTO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.DUA PUTRI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
158	2018-01-01	P	2	158		LAE	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS LAE	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
159	2018-01-01	P	2	159		IRNA ELFRIDA TAMPUBOLON	- RT/RW : - , Mburwandi , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	38	5	\N	\N	SUPIORI		98163	\N	28	\N	KIOS BERKAT	- RT/RW : - , Mburwandi , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	5	38	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
160	2018-01-01	P	2	160		KADIR SAILANE	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PUTRA MUNA	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
161	2018-01-01	P	2	161		BUHARI	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	KIOS MUA	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
162	2018-01-01	P	2	162		AHMAD MUTAKHI GHOSALI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	GORENGAN SUMBER REJEKI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
163	2018-01-01	P	2	163		LILIS ADA TANGKELANGI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	AGEN MINYAK TANAH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
164	2018-01-01	P	2	164		LILIS ADA TANGKELANGI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	RUMAH MAKAN RESTU IBU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
165	2018-01-01	P	2	165		LILIS ADA TANGKELANGI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO AMANDA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
166	2018-01-01	P	2	166		YULIO IMANUEL FAIDIBAN	SORENDIWERI RT/RW : - , Waryesi ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.IVANES PAPUA	SORENDIWERI RT/RW : - , Waryesi ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
167	2018-01-01	P	2	167		HAFIFA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS DAVATAR	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
168	2018-01-01	P	2	168		KETTY YARANGGA	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV. YARDOR PERMAI	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
169	2018-01-01	P	2	169		ADOLOF MSIREN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV FAJAR UTARA	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
170	2018-01-01	P	2	170		SANADI WABDARON	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.SUPIORI PERKASA	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
171	2018-01-01	P	2	171		LUIS MARYAR	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV TUBEKI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
172	2018-01-01	P	2	172		FRENGKY WADIWE	AMINWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SUPIORI OF NESIAN ALL STAR	AMINWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
173	2018-01-01	P	2	173		FRENGKY WADIWE	AMINWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS RATU	AMINWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
174	2018-01-01	P	2	174		SINTIA RUMBINO	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV MARIVE WAROMBA	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
175	2018-01-01	P	2	175		YAKOBUS RUMBARAR	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.SILAVILANA PERMAI	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
176	2018-01-01	P	2	176		BERNARD RUMAIKEUW	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SEDA INDAH	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
177	2018-01-01	P	2	177		ANDRIAS PADWA	WOMBONDA RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ISIAPEDO PASIEM	WOMBONDA RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
179	2018-01-01	P	2	179		ROBERTH M S	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	14	2	\N	\N	SUPIORI		98163	\N	28	\N	CV MENTARI INDAH	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
180	2018-01-01	P	2	180		PARTIEM	MARSRAM RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS NURAYU	MARSRAM RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
181	2018-01-01	P	2	181		YATI HERLINA MAYER	MARSRAM RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.Gerson Insumbrei	MARSRAM RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
182	2018-01-01	P	2	182		YATI HERLINA MAYER	MARSRAM RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PUTRI	MARSRAM RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
183	2018-01-01	P	2	183		MARTHEN MSIREN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV KAMASAN MAMBEYORI	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
184	2018-01-01	P	2	184		DIDIMUS PARIARIBO	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.BESUMA JAYA	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
185	2018-01-01	P	2	185		MARLYANTI	SORENDIWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. SARI BUNDO	SORENDIWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
186	2018-01-01	P	2	186		JAMALUDDIN	SORENDIWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. PANGKEP	SORENDIWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
187	2018-01-01	P	2	187		GOTLIF N. UBEY	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SASERA UBEY	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
188	2018-01-01	P	2	188		LUKAS EWEI	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV BILLY JAYA	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
189	2018-01-01	P	2	189		ARIUS MAKIS	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV INSERI	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
190	2018-01-01	P	2	190		YUSUF MANSOBEN	KOIRYAKAM RT/RW : - , Koryakam , Distrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	17	3	\N	\N	SUPIORI		98163	\N	28	\N	CV. SARISA BEFONDI	KOIRYAKAM RT/RW : - , Koryakam , Distrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	17	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
191	2018-01-01	P	2	191		MARTHINUS KAFIAR	MASYAI RT/RW : - , Masyai , Distrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	21	3	\N	\N	SUPIORI		98163	\N	28	\N	CV. MASYAI KURIYAKE	MASYAI RT/RW : - , Masyai , Distrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	21	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
192	2018-01-01	P	2	192		JOHN F. WOMSIWOR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ORISYUM	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
193	2018-01-01	P	2	193		MIA MARIA WAMBRAUW	RAYORI RT/RW : - , Rayori , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	   	   	33	5	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV\nINSORMBORI	RAYORI RT/RW : - , Rayori , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	\N	\N	5	33	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
194	2018-01-01	P	2	194		ROMMY D. LOBO	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. BINTANG PERSADA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
195	2018-01-01	P	2	195		HANNA M RUMAROPEN	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
196	2018-01-01	P	2	196		MOSES WAKMAN	AWAKI RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	   	   	244	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. INOWI	AWAKI RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	\N	\N	4	244	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
197	2018-01-01	P	2	197		JHONY POLOWIJAYA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	PT. IMMANUEL	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
198	2018-01-01	P	2	198		BILLY M. TELAMBANUA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS DINDA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
199	2018-01-01	P	2	199		BARNARD KAWER	RAYORI RT/RW : - , Rayori , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	   	   	33	5	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV JAYA	RAYORI RT/RW : - , Rayori , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	\N	\N	5	33	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
200	2018-01-01	P	2	200		BURHANUDIN P	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV ENGINEERING	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
201	2018-01-01	P	2	201		YUNUS BINSBAREK	DIDIABOLO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	29	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. AMOS DOREY	DIDIABOLO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	29	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
202	2018-01-01	P	2	202		ARISTOTELES KORWA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PT.BERLINS KARYA ABADI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
203	2018-01-01	P	2	203		DWIGHT ENGELBERTH. S	FANINDI RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. SANERARO	FANINDI RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
204	2018-01-01	P	2	204		ROLAND R AROGEAR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. RATU QIMORA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
205	2018-01-01	P	2	205		HILKIA SWAN RUMAKITO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV SYOWI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
206	2018-01-01	P	2	206		ELISA TITUS MOFU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. NOKEN PAPUA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
207	2018-01-01	P	2	207		NADARIAS PADWA	YENDOKER RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	5	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV	YENDOKER RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	5	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
829	2020-01-13	P	1	416	0103802504	HENY IRIANI	KAMPUNG FANINDI	000	0  	25	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
830	2020-01-13	R	1	416	0103802504	HENY IRIANI	KAMPUNG FANINDI	000	00 	25	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
208	2018-01-01	P	2	208		ANDRIS NARDUS MOAY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. BIN OSER	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
209	2018-01-01	P	2	209		GILBERTH KARUBABA	SAORENDIWERI RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. GIOFANNY	SAORENDIWERI RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
210	2018-01-01	P	2	210		FERDINAN KAFIAR	YAMNAISU RT/RW : - , Yamnaisu , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	   	   	30	5	\N	\N	SUPIORI		98163	\N	28	\N	CV.RANI JAYA	YAMNAISU RT/RW : - , Yamnaisu , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	\N	\N	5	30	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
211	2018-01-01	P	2	211		ESTERLITA RAMANDEY	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota Supioi Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.BEZALEE	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota Supioi Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
212	2018-01-01	P	2	212		JHON P. RAMANDEY	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. MAWAR SARON	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
213	2018-01-01	P	2	213		YUBEL BURDAM	KORIAKAM RT/RW : - , Koryakam , Distrik Supiori Barat Kab./Kota Supiori Kode Pos. 98163	   	   	17	3	\N	\N	SUPIORI		98163	\N	28	\N	CV.RASSANA	KORIAKAM RT/RW : - , Koryakam , Distrik Supiori Barat Kab./Kota Supiori Kode Pos. 98163	\N	\N	3	17	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
214	2018-01-01	P	2	214		MULIAWATI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SEMBAKO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
215	2018-01-01	P	2	215		MULIAWATI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV\nMULIAWATI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
217	2018-01-01	P	2	217		DOLFINA MANOBI	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV JAYA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
218	2018-01-01	P	2	218		BILLY L. WABISER	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV\nMANANSNOM	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
219	2018-01-01	P	2	219		ARMANDO TALAPESSY	Sorendiweri- RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ALONA KARMEL	Sorendiweri- RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
220	2018-01-01	P	2	220		HANS PERMESAS INFIANDAN	Sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. Anvan Wildan	Sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
221	2018-01-01	P	2	221		GEORGE BARRIHALEDO	WARBEFONDI RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	   	   	26	4	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV	WARBEFONDI RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	\N	\N	4	26	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
222	2018-01-01	P	2	222		ERI CHENJAUVA	Sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR.CV\nCENDRAWASI	Sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
224	2018-01-01	P	2	224		CHARLES RAY KAWER	Sauyas RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KAMARA JAYA	Sauyas RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
225	2018-01-01	P	2	225		RIFKY SUGIANTO WARIKAR	FANINDI RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. SUPIORI MARANNU	FANINDI RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
226	2018-01-01	P	2	226		FREDY MONTULATU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. MATOBI BANGUNPERKASA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
227	2018-01-01	P	2	227		YULES A. WOMPERE	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. TALITAKUM PERSADA	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
228	2018-01-01	P	2	228		LUCKY	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO LUCKY	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
229	2018-01-01	P	2	229		ROBBY MAMBENAR	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KENAF PAPUA GRACIA INDONESIAN	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
861	2020-01-30	P	2	432	0203602604	GEORGE BARRY HALEDO	KAMPUNG WARBEFONDI	00 	00 	26	4			SUPIORI	0	98573	0	25	\N	CV GERHANA	KAMPUNG WARBEFONDI	000	000	4	26	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
230	2018-01-01	P	2	230		MARKUS F. KREY	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. INAWOS STAR	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
231	2018-01-01	P	2	231		IRENE LATMI PIETER	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. GALAXY	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
232	2018-01-01	P	2	232		AGUS PEDAY	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. CAESAR ODORI	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
233	2018-01-01	P	2	233		JOHN F. WOMSIWOR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ORISYUM	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
234	2018-01-01	P	2	234		MARTHEN HEMBRING	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. RAJAWALI	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
235	2018-01-01	P	2	235		PRIDADE MANGIWA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SANDERAN SURYA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
236	2018-01-01	P	2	236		LAURENS MANSOBEN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SAHABAT ABADI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
237	2018-01-01	P	2	237		ONESIMUS RUMBEKWAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KARANG MAS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
238	2018-01-01	P	2	238		LEON GIDALTY WAYONG	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. HARAPAN BARU	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
239	2018-01-01	P	2	239		ARDIANSYAH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PT. INDOPRATAMA SARY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
240	2018-01-01	P	2	240		FARIDA MARYAR	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SAMON DEREK	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
241	2018-01-01	P	2	241		HERU PATRIA UTAMA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PT. MULTI BINA KREASI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
242	2018-01-01	P	2	242		CORNELES E. MALAJUANA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ALDA PAPUA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
243	2018-01-01	P	2	243		YOSEP MNIBER	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ASKI MANUNGGAL PERKASA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
244	2018-01-01	P	2	244		CRISLAN P. WOMPERE	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KARYA AGUNG	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
245	2018-01-01	P	2	245		YASON L. MNIBER	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. MNUDIDO JAYA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
246	2018-01-01	P	2	246		DESIANA SANGE	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. BETESDA INDAH	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
247	2018-01-01	P	2	247		SOLEMAN H. AMUNAUW	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. PAPUA MAKMUR ABADI	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
248	2018-01-01	P	2	248		CHRISTIAN KURNI	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. RIMBA POF-POF	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
249	2018-01-01	P	2	249		HERMAN SWOM	WAFOR   RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SAPODIKA STAR	WAFOR   RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
250	2018-01-01	P	2	250		SELFIANA POMBOS	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. INASIBO	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
251	2018-01-01	P	2	251		JUNASIUS KORWA	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. JOVALICO	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
252	2018-01-01	P	2	252		ELIM MARYAR	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ARWAI	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
253	2018-01-01	P	2	253		SUMARNO N. MARYEN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. CARIZON	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
862	2020-01-30	R	2	432	0203602604	GEORGE BARRY HALEDO	KAMPUNG WARBEFONDI	00 	00 	26	4			SUPIORI	0	98573	0	25	\N	CV GERHANA	KAMPUNG WARBEFONDI	000	000	4	26	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
254	2018-01-01	P	2	254		YAKOBUS MARYAR	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. HILANE PAPUA	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
255	2018-01-01	P	2	255		SUSUN BONSAPIA	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KEMBAR	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
256	2018-01-01	P	2	256		HOSEA MANSOBEN	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ORIDEK	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
257	2018-01-01	P	2	257		ELIAS TJIMAJUA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KIMAM USAHA MANDIRI	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
258	2018-01-01	P	2	258		HENGKI KMUR	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. BANDERI	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
259	2018-01-01	P	2	259		MULIA RAJIMAL ARITONA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	PT. RATIOS LIMA TUJU	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
260	2018-01-01	P	2	260		JULIO FAIDIBAN	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. IFANES PAPUA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
261	2018-01-01	P	2	261		MICCAL SUMILENA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. NEMA BINSYOWI	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
262	2018-01-01	P	2	262		MAKDALENA MENUFANDU	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SARWOR	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
263	2018-01-01	P	2	263		DEMETRIUS Y. KAFIAR	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. GLORIANUS STAR	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
264	2018-01-01	P	2	264		YOSUA SARAKAN	SYURDORI RT/RW : - , Syurdori ,  Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	9	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. AREMBORI	SYURDORI RT/RW : - , Syurdori ,  Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	9	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
265	2018-01-01	P	2	265		ALBERTHO P. BINUR	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.PAPUA INDAH PERKASA	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
266	2018-01-01	P	2	266		YOLIS A. BARANSANO	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.ELSANI	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
267	2018-01-01	P	2	267		MARIA BRABAR	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.INDAWI STAR	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
268	2018-01-01	P	2	268		LISIAS DAWAN	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	23	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.CETAK BATU TELA	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
269	2018-01-01	P	2	269		JIMMY RICKY YARANGGA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.TISAN KARYA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
270	2018-01-01	P	2	270		ASIS	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	23	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.ABABIADI	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
271	2018-01-01	P	2	271		ALFONSINA MANDOSIR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.YEN PIABO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
272	2018-01-01	P	2	272		YANSEN TURANG	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.DINDA PARYEM	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
273	2018-01-01	P	2	273		IRWAN SWABRA	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ABDI KARYA	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
274	2018-01-01	P	2	274		ADRIANUS MARNA	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.BERKAT PAPUA INDAH	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
275	2018-01-01	P	2	275		SAMUEL.R.POLOWIJAYA	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.VICTORIUS GLORY ROYALE	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
276	2018-01-01	P	2	276		MARRULY PANGGABEAN	SORINDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.PAPUA ANUGERAH JAYA	SORINDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
277	2018-01-01	P	2	277		EFRENDY.H.RUMBIAK	SABARMIOKRE RT/RW : - , Waryei ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.AMORI	SABARMIOKRE RT/RW : - , Waryei ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
863	2020-01-30	P	1	433	0103940701	MILAWATI	KAMPUNG SORENDIWERI	00 	00 	7	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
278	2018-01-01	P	2	278		REIN ELKANA MAER	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.NADI AWIN	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
279	2018-01-01	P	2	279		KABINET TARINGAN	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.PAKUAN GEMPITA	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
280	2018-01-01	P	2	280		W.TARINGAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SINAR GUNDALIN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
281	2018-01-01	P	2	281		AGUSTINUS MNIMNEMWARBA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.TRI TUNGGAL PAPUA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
282	2018-01-01	P	2	282		ALBERTUS.M.METEMKO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MIRANDAKU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
283	2018-01-01	P	2	283		CORNELIA RUMAINUM	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.BINYESU	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
284	2018-01-01	P	2	284		DANIEL.C.W.KAWER	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.DEVITA ARIHA INDAH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
285	2018-01-01	P	2	285		DIDIMUS.R.INFAINDAM	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	23	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.MAMBOYAR	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
286	2018-01-01	P	2	286		ELIA MANAMPAISEM	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ANUGERAH INDAH WAFOR	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
287	2018-01-01	P	2	287		MUH. SYAIFUL MALIK	KEPULAUAN ARURI RT/RW : - ,\nManggonswan , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	38	5	\N	\N	SUPIORI		98163	\N	28	\N	CV.SUPIORI JAYA MANDIRI	KEPULAUAN ARURI RT/RW : - ,\nManggonswan , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	5	38	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
288	2018-01-01	P	2	288		VIKTOR RUMBEKWAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.KORIDO JAYA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
289	2018-01-01	P	2	289		DORINCE WAKUM	SABARMIOKRE RT/RW : - , Amyas ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	19	3	\N	\N	SUPIORI		98163	\N	28	\N	CV NAERBA	SABARMIOKRE RT/RW : - , Amyas ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	19	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
290	2018-01-01	P	2	290		EKBERT SOMBUK	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KARYA BERSAMA MANDIRI	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
291	2018-01-01	P	2	291		SALMAN WARIKAR	KAMP. FANINDI RT/RW : - , Fanindi ,\nDistrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. RYAN JAYA	KAMP. FANINDI RT/RW : - , Fanindi ,\nDistrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
292	2018-01-01	P	2	292		NOVELA SANTI AWOM	YENGGARBUN RT/RW : - , Warbor ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV. ELSANE	YENGGARBUN RT/RW : - , Warbor ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
293	2018-01-01	P	2	293		YAKOBUS DAWAN	KAMP.MARYAIDORI RT/RW : - ,\nMaryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	27	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.MARADORI	KAMP.MARYAIDORI RT/RW : - ,\nMaryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
294	2018-01-01	P	2	294		YAKOB PETRUS AP	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV .ARURI JAYA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
295	2018-01-01	P	2	295		PATRIKS WARIKAR	KAMP.FANINDI RT/RW : - , Fanindi ,\nDistrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	3	\N	\N	SUPIORI		98163	\N	28	\N	CV.RUT ARAIMA	KAMP.FANINDI RT/RW : - , Fanindi ,\nDistrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
296	2018-01-01	P	2	296		DORCE SANDALEMBANG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.GREEN GRAFIK	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
297	2018-01-01	P	2	297		DORCE SANDALEMBANG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO GREEN GRAFIK	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
298	2018-01-01	P	2	298		POLI SAPAN	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	   	   	27	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.HOLY LADYS	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	\N	\N	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
299	2018-01-01	P	2	299		RUDIN	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	KIOS DEDE BOTON	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
300	2018-01-01	P	2	300		NURDIN	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PAKAIAN DEDE BUTON COLLECTION	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
301	2018-01-01	P	2	301		MUSTAFA	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ANJAR BUTON	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
864	2020-01-28	R	1	433	0103940701	MILAWATI	KAMPUNG SORENDIWERI	00 	00 	7	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
302	2018-01-01	P	2	302		DUATH.E.SALAWANE	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.SANERARO	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
303	2018-01-01	P	2	303		MILKA WABISER	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. WARMNU	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
304	2018-01-01	P	2	304		HERRY MSEN	SABARMIOKRE RT/RW : - , Mapia ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	22	3	\N	\N	SUPIORI		98163	\N	28	\N	CV.NUKUBUAT PERKASA	SABARMIOKRE RT/RW : - , Mapia ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	22	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
305	2018-01-01	P	2	305		SILPA SAREWO	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SINAR WAKRE	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
306	2018-01-01	P	2	306		ALFEUS KORWA	KORIDO RT/RW : - , Ineki , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	34	5	\N	\N	SUPIORI		98163	\N	28	\N	CV.RAK NUMFOR	KORIDO RT/RW : - , Ineki , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	5	34	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
307	2018-01-01	P	2	307		MARICE YOHANA RUMAINUM	SABARMIOKRE RT/RW : - , Amyas ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	19	3	\N	\N	SUPIORI		98163	\N	28	\N	CV.BIAK PRIBUMI	SABARMIOKRE RT/RW : - , Amyas ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	19	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
308	2018-01-01	P	2	308		MICHAEL RUMERE	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	   	   	27	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. EMBUN SUPIORI	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	\N	\N	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
309	2018-01-01	P	2	309		HELFRICK.H.F.L.PAIKI	JALAN RAYA MARSRAM RT/RW : - ,\nMarsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ARVENSIS	JALAN RAYA MARSRAM RT/RW : - ,\nMarsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
310	2018-01-01	P	2	310		MOSES MANSOBEN	MANSOBEN RT/RW : - , Waryesi ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MAMBENA DOYADORI	MANSOBEN RT/RW : - , Waryesi ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
311	2018-01-01	P	2	311		DRS.WOFF JUSTINUS.MM	KORIDO RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. WASEM JAYA	KORIDO RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
312	2018-01-01	P	2	312		ROLAND OMPI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.KRISOLIT	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
313	2018-01-01	P	2	313		EMMA OMPI SAWAKI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ROMESA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
314	2018-01-01	P	2	314		KRISTINA WARIKAR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.KRISEL BANGUN PERSADA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
316	2018-01-01	P	2	316		ZETH ARINDI KURNI	SORENDIWERI RT/RW : - , Wafor ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.PAPUA BARAKAS	SORENDIWERI RT/RW : - , Wafor ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
317	2018-01-01	P	2	317		YOSEFUS KAFIAR	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. AWAKI JAYA	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
318	2018-01-01	P	2	318		OKTOVIANUS WAKRIS	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	   	   	27	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.ASMAN PUTRA	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	\N	\N	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
319	2018-01-01	P	2	319		BARNABAS MANSOBEN	SABAR MIOKRE RT/RW : - , Amyas ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	19	3	\N	\N	SUPIORI		98163	\N	28	\N	CV RASIYAMA PAPUA STAR	SABAR MIOKRE RT/RW : - , Amyas ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	19	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
320	2018-01-01	P	2	320		YUSYINA.PS.MANUFANDU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. GUNUNG JATI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
321	2018-01-01	P	2	321		DWI SAPTAWATI TRIKORA DEWI	KORIDO RT/RW : - , Manggonswan , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	36	5	\N	\N	SUPIORI		98163	\N	28	\N	CV.INDAH PERMAI	KORIDO RT/RW : - , Manggonswan , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	5	36	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
322	2018-01-01	P	2	322		MARTHINUS MANSOBEN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.AMOSRE	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
323	2018-01-01	P	2	323		KAMELIA MAYER	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. SINAR SELATAN	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
324	2018-01-01	P	2	324		RAYMOND.J.M.RUMOKOY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.GELGRA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
325	2018-01-01	P	2	325		ESTER OVIAS	SORENDIWERI RT/RW : - , Wafor ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.WARMUN JAYA	SORENDIWERI RT/RW : - , Wafor ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
865	2020-01-30	P	2	434	0200323305	BERNARD KAWER	KAMPUNG RAYORI	00 	00 	33	5			SUPIORI	0	98573	0	25	\N	CV MELSAN JAYA	KAMPUNG RAYORI	000	000	5	33	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
326	2018-01-01	P	2	326		ISHAK SAMUEL MANDOSIR	WARYESI RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.EVOLET	WARYESI RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
327	2018-01-01	P	2	327		LISA JULIANA SARTJE BUDURI	SORENIDWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ANDROMEDA	SORENIDWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
328	2018-01-01	P	2	328		SELLA FLORCE ABIDONDIFU	SORENDIWEI RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ABISAK MAKMUR	SORENDIWEI RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
329	2018-01-01	P	2	329		MARTHINUS WABDARON	YENGGARBUN RT/RW : - , Puweri ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	14	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.PUWERI INDAH	YENGGARBUN RT/RW : - , Puweri ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
458	2018-01-01	R	2	49		KAREL SOMBA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO LEON	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
330	2018-01-01	P	2	330		RULAN RUDOLF ARONGGEAR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.RATU QIMORA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
331	2018-01-01	P	2	331		ONESIMUS KBAREK	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ERSAMBO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
332	2018-01-01	P	2	332		EDDY NUMBERI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. JEHOVA JIREH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
333	2018-01-01	P	2	333		ESAU MARYAR	MIOSARWAI RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. TUBEKI	MIOSARWAI RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
334	2018-01-01	P	2	334		HANS.P.INFAINDAN	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	23	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. ANVAN WILDAN	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
335	2018-01-01	P	2	335		FREDRICUS F. WIRJAYA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.TUJUH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
336	2018-01-01	P	2	336		PIRADE MANGIWA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SANDERAN SURYA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
337	2018-01-01	P	2	337		SALOMINA WARIKAR	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. REAN STAR	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
338	2018-01-01	P	2	338		BERNARD KAWER	KORIDO RT/RW : - , Rayori , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	33	5	\N	\N	SUPIORI		98163	\N	28	\N	CV.MELSAN JAYA	KORIDO RT/RW : - , Rayori , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	5	33	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
339	2018-01-01	P	2	339		LUTHER YOM	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.KARKIRI	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
340	2018-01-01	P	2	340		LUDIA SAMBO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO IMMANUEL	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
341	2018-01-01	P	2	341		LAADA	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.LAMENA JAYA	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
342	2018-01-01	P	2	342		MEIDY JHONIE TULANDI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO SINAR AWAKI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
343	2018-01-01	P	2	343		JACKLIN TUERAH	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. MANGUNDI JAYA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
344	2018-01-01	P	2	344		THERIANUS.H.A.AYOMI	KORIDO RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	26	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.BIAK MINANG BHAKTI	KORIDO RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	26	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
346	2018-01-01	P	2	346		BUN ARONGGEAR	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SHLOOM	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
347	2018-01-01	P	2	347		ARMAND MAER	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. AIBINDEI GROUP	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
348	2018-01-01	P	2	348		NIKOLAS KAFIAR	KORIDO RT/RW : - , Yamnaisu , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	30	5	\N	\N	SUPIORI		98163	\N	28	\N	CV.IRVAN RANI JAYA	KORIDO RT/RW : - , Yamnaisu , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	5	30	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
349	2018-01-01	P	2	349		SELVIANA POMBOS	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. INASIBO	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
866	2020-01-30	R	2	434	0200323305	BERNARD KAWER	KAMPUNG RAYORI	00 	00 	33	5			SUPIORI	0	98573	0	25	\N	CV MELSAN JAYA	KAMPUNG RAYORI	000	000	5	33	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
350	2018-01-01	P	2	350		MARKUS FRANS KREY	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. INAWOS STAR	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
351	2018-01-01	P	2	351		APILENA DIMARA	YAMNAISU RT/RW : - , Yamnaisu , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	30	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.MAMBENA ASEBI	YAMNAISU RT/RW : - , Yamnaisu , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	30	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
352	2018-01-01	P	2	352		DAUD KRISTIAN WABDARON	YENGGARBUN RT/RW : - , Fanjur ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV. KABOR SKORYAYE	YENGGARBUN RT/RW : - , Fanjur ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
353	2018-01-01	P	2	353		SAMSON ARNOL BINUR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SOWEK JAYA PERKASA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
354	2018-01-01	P	2	354		YANTJE WANMA	SORENDIWERI RT/RW : - , Duber ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.REQUEL JAYA	SORENDIWERI RT/RW : - , Duber ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
355	2018-01-01	P	2	355		ANDRIANUS WABDARON	YENGGARBUN RT/RW : - , Fanjur ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.SUPIORI PERKASA	YENGGARBUN RT/RW : - , Fanjur ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
356	2018-01-01	P	2	356		YUNUS BINSBAREK	KORIDO RT/RW : - , Didiabolo , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	29	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. AMOS DOREY	KORIDO RT/RW : - , Didiabolo , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	29	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
357	2018-01-01	P	2	357		JHON F WOMSIWOR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ORISYUN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
358	2018-01-01	P	2	358		AKSAMINA BOSEREN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ANUGRAH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
359	2018-01-01	P	2	359		YOHANES WARIKAR	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. VIAN	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
360	2018-01-01	P	2	360		ANDREAS RUMAROPEN	SORENDIWERI RT/RW : - , Syurdori ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	9	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SYURDORI INDAH	SORENDIWERI RT/RW : - , Syurdori ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	9	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
361	2018-01-01	P	2	361		BILLY LEONARD WABISER	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MANONSNON	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
362	2018-01-01	P	2	362		MUHAMAD TAUFIQ MUSKANTO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SURU FAMILY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
363	2018-01-01	P	2	363		MANASE YARANGGA	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. KAMSYUMI	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
364	2018-01-01	P	2	364		ADI SUPRIYADI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV..SYIBIL ARIZTA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
365	2018-01-01	P	2	365		NELES WARFANDU	SORENDIWERI RT/RW : - , Wafor ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.WAFOR INDAH	SORENDIWERI RT/RW : - , Wafor ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
366	2018-01-01	P	2	366		OTTIS MANSOBEN	SORENDIWERI RT/RW : - , Waryesi ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.PERSADA	SORENDIWERI RT/RW : - , Waryesi ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
367	2018-01-01	P	2	367		ROBERTH.M.S.AMARHOSEA	YENGGARBUN RT/RW : - , Puweri ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	14	2	\N	\N	SUPIORI		98163	\N	28	\N	CV. MENTARI INDAH	YENGGARBUN RT/RW : - , Puweri ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
368	2018-01-01	P	2	368		ARISTOTELES SOMBUK	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.YEREMIA PUTRA PERKASA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
369	2018-01-01	P	2	369		AGUSTINUS RUMBARAR	YENGGARBUN RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.ARISI	YENGGARBUN RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
370	2018-01-01	P	2	370		MARKUS R.KALILELE	YENGGARBUN RT/RW : - , Warsa ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	15	2	\N	\N	SUPIORI		98163	\N	28	\N	CV. MITRA FANGKASING	YENGGARBUN RT/RW : - , Warsa ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	15	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
371	2018-01-01	P	2	371		DANIEL WAMBRAUW	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MANSWAR BORI	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
372	2018-01-01	P	2	372		KRISTIAN M ARONGGEAR,SE	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ARONAI	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
373	2018-01-01	P	2	373		MARTHEN TODING	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MITRA PAPUA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
374	2018-01-01	P	2	374		TIGOR HARYANTO SIMANJUNTAK	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.BINTANG BARAT	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
375	2018-01-01	P	2	375		KRISLAND P WOMPERE	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.KARYA AGUNG	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
376	2018-01-01	P	2	376		SUKMA PUJANTORO	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. MANDE KENCANA	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
377	2018-01-01	P	2	377		ACEP NOLDI MUSU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ROLLER PERKASA MANDIIRI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
378	2018-01-01	P	2	378		JOHANIS.A.MANSNEMBRA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MAMBRI CIPTA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
379	2018-01-01	P	2	379		MARGARETHA RAHANGIAR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.METHA PERMAI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
380	2018-01-01	P	2	380		DRS.ADRIANUS KAWER	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KAMARA JAYA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
381	2018-01-01	P	2	381		FRANSISCUS L BINUR	YENGGARBUN RT/RW : - , Warbor ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.AMARE	YENGGARBUN RT/RW : - , Warbor ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
382	2018-01-01	P	2	382		ELIA TITUS MOFU	WAYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.NOKEN PAPUA	WAYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
383	2018-01-01	P	2	383		YETI YARANGGA	YENGGARBUN RT/RW : - , Fanjur ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.YARDOR PERMAI	YENGGARBUN RT/RW : - , Fanjur ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
384	2018-01-01	P	2	384		MOHAMAD FASAL HUSAIN	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.CIPTA KOROMATIKA PAPUA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
385	2018-01-01	P	2	385		SATRIO DWIJAYANTO,ST	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PT.ALAM DAYA MAKMUR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
386	2018-01-01	P	2	386		IR.WINANRNO,MM	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	PT.BANGUN NUSANTARA ENGINEERING	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
387	2018-01-01	P	2	387		MOREST KAINAMA	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.YOGLY	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
388	2018-01-01	P	2	388		JHONI FRENGKY REDJAUW	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.PUTRA AMANI SANAM	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
389	2018-01-01	P	2	389		MARTHINUS RUMERE	KORIDO RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	26	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.ORMAKI	KORIDO RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	26	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
390	2018-01-01	P	2	390		YUSUF KORWA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	PT.LINTAS CAKRAWALA PAPUA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
391	2018-01-01	P	2	392		SALMON MINGGUS SROYER	YAMERWA RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SONDU KAMASAN	YAMERWA RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
392	2018-01-01	P	2	393		YOHANES TERTIUS WAMBRAUW	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.WAMBAREK	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
393	2018-01-01	P	2	394		NUNCIK WIJAYA	SORENIWERI RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.YAKONME MULIA ABADI	SORENIWERI RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
394	2018-01-01	P	2	395		YOEDHA UTAMA WIDYATMAKA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.RANDU ALAS PAPUA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
395	2018-01-01	P	2	396		ALBERTH Y P PRAWAR	YENGGARBUN RT/RW : - , Warbor ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.PUTRA CENDRAWASIH	YENGGARBUN RT/RW : - , Warbor ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
396	2018-01-01	P	2	397		SUHARDJO	SORENDIWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.CITRA KIRANA	SORENDIWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
397	2018-01-01	P	2	398		H.MUH NAWIR	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.USAHA BARU	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
398	2018-01-01	P	2	399		OFAN EFRIANSYAH	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SORENDIWERI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PT. JASA PERENCANAAN NUSANTARA	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SORENDIWERI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
399	2018-01-01	P	2	400		PAULA RUMAROPEN	SABARMEOKRE RT/RW : - , Koryakam ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	17	3	\N	\N	SUPIORI		98163	\N	28	\N	CV.BINBOKI	SABARMEOKRE RT/RW : - , Koryakam ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	17	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
400	2018-01-01	P	2	401		SIMON J. TUBALAWONY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PT. RODA GEMILANG PERKASA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
401	2018-01-01	P	2	402		ANITA HELEN FAIDIBAN	SORENDIWERI RT/RW : - , Duber ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.BINMANDOS	SORENDIWERI RT/RW : - , Duber ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
402	2018-01-01	P	2	403		AGUNG CHRISTIAN RORENG	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	PENGECER MINYAK TANAH GAVRIEL	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
885	2020-01-30	P	1	446	0001	RAMA SUANI LINGGA	KAMPUNG FANINDI	01 	01 	25	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
403	2018-01-01	P	2	404		FRENGKI KOLONDAM	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.KANDERA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
404	2018-01-01	P	2	405		MUNUR CHRISTIAN YEWUN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.AY KONSTRUKSI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
405	2018-01-01	P	2	406		AGUS RUMERE	KORIDO RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	26	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.ABASI JAYA	KORIDO RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	26	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
406	2018-01-01	P	2	407		STEVEN REJAUW	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ENAM SAUDARA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
407	2018-01-01	P	2	408		YUSTIAN NOVIDY BUBUNGAN	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ADYCITRA CONSULTAN	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
408	2018-01-01	P	2	409		YANCE NANI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ZIVANIA JAYA ABADI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
409	2018-01-01	P	2	410		BASKAWEMPI	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	14	2	\N	\N	SUPIOI		98163	\N	28	\N	BENGKEL     KARA	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
410	2018-01-01	R	2	1		IFANALI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	2  	6	1	\N	\N	SUPIORI	090908908	\N	\N	28	\N	IFANALI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORi	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
411	2018-01-01	R	2	2		Sandy Efendy	Douwbo Supiori Timur, Papua	000	00 	10	1	\N	\N	SUPIORI	081344416882	98573	cv.gunturpratama171219@gmail.com	28	\N	Sandy Efendy	Douwbo Supiori Timur, Papua	000	00 	1	10	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
412	2018-01-01	R	2	3		IWAN	Sorendiweri	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	DEPOT AIR MINUM MULIA	Sorendiweri	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
413	2018-01-01	R	2	4		PAULUS PATULA	Sorendiweri	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PAULUS	Sorendiweri	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
414	2018-01-01	R	2	5		FADLI	Sorendiweri	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO KIOS PUTRI	Sorendiweri	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
415	2018-01-01	R	2	6		AGUS R SUWARNO	Sorendiweri	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	RESTORAN RAMADHINA	Sorendiweri	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
416	2018-01-01	R	2	7		MELTI MASUANG	Sorendiweri	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	GTM COFFEE	Sorendiweri	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
417	2018-01-01	R	2	8		BARETHA PAKASI	Wombonda	   	   	5	1	\N	\N	SUPIORI		98163	\N	28	\N	MEUBEL BARRETHA	Wombonda	\N	\N	1	5	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
418	2018-01-01	R	2	9		ANWAR	Waryesi	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	PENJAHIT ALDY	Waryesi	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
419	2018-01-01	R	2	10		JEKSON MAKIS	Wafor	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV JORDAN INDAH	Wafor	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
420	2018-01-01	R	2	11		TANDE	Waryesi	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ADI	Waryesi	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
421	2018-01-01	R	2	12		IRMA	Syurdori	   	   	9	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO	Syurdori	\N	\N	1	9	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
422	2018-01-01	R	2	13		JUNIARSON PURBA	Wombonda RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	5	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Rojekkita	Wombonda RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	5	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
423	2018-01-01	R	2	14		SANTOS TOMANGIN	WAKRE RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS RANNU	WAKRE RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
424	2018-01-01	R	2	15		ULFIANI BUJUHARI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO MANADO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
425	2018-01-01	R	2	16		YOHANA SALU	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO DIRGA	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
426	2018-01-01	R	2	17		RUSMIATI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.REDJO	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
427	2018-01-01	R	2	18		SATTIMAH	SORENDIWERI RT/RW : - , Duber ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO YAKUSA	SORENDIWERI RT/RW : - , Duber ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
428	2018-01-01	R	2	19		MARGARETHA PATIUNG	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS FAJAR PADANG	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
429	2018-01-01	R	2	20		SANTO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	MEUBEL MANADO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
430	2018-01-01	R	2	21		TIGOR H SIMANJUNTAK	DOUWBO RT/RW : - , Douwbo , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	10	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS DOUWBO	DOUWBO RT/RW : - , Douwbo , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	10	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
431	2018-01-01	R	2	22		OSMAR PURBA	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SAROHA	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
432	2018-01-01	R	2	23		MUTMAINA	sorendiweri Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	RESTO MUTIARA	sorendiweri Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
433	2018-01-01	R	2	24		MARTHINUS DOMENG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO PURNA KARYA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
434	2018-01-01	R	2	25		TATANG	Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.FIKRI BANDUNG	Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
435	2018-01-01	R	2	26		PENINA MSIREN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO RAJAWALI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
436	2018-01-01	R	2	27		HERMAN	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KONVEKSI FIKRAN JAYA	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
437	2018-01-01	R	2	28		ONA VERA AG	SAWRKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS WAFOR INDAH	SAWRKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
438	2018-01-01	R	2	29		AGUS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	BATU TELA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
439	2018-01-01	R	2	30		AGUS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ARTHA INDAH PERMAI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
440	2018-01-01	R	2	31		AGUS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	DEPOT AIR MINUM	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
441	2018-01-01	R	2	32		ADIRUDDIN	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	BENGKEL MAROS	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
442	2018-01-01	R	2	33		OLGA MANSOBEN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SUPIORI BERJUANG	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
443	2018-01-01	R	2	34		OLGA MANSOBEN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	RESTORAN WARPARAIDI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
444	2018-01-01	R	2	35		SITTI HAYATI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	BENGKEL AL-ERYOS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
445	2018-01-01	R	2	36		MANGAPUL SITUMEANG	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS KEMBAR	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
446	2018-01-01	R	2	37		LINA PAULUS GINTING	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS TOKO GICELI PERMAI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
447	2018-01-01	R	2	38		LUTER BANDASO	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS YITRO	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
448	2018-01-01	R	2	39		DENNY UMPAPAR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO DENNY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
449	2018-01-01	R	2	40		HAIRUL ANAM	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO ICHDA SUPIORI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
450	2018-01-01	R	2	41		JHON	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.BAKSO MANALAGI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
451	2018-01-01	R	2	42		KADEK JERO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. SUMBER SARI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
452	2018-01-01	R	2	43		LINCE RUMERE	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS BOSNIK	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
453	2018-01-01	R	2	44		RONALD	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO SUPIORI MAKMUR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
454	2018-01-01	R	2	45		OCE RUMBRAPUK	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS MAXROS	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
455	2018-01-01	R	2	46		YANTI L TEDANG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS AVC	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
456	2018-01-01	R	2	47		PEDI ARUNG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	MEUBEL BUKIT SION	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
457	2018-01-01	R	2	48		JOSIA BABIS	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS TUNAS BARU	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
459	2018-01-01	R	2	50		DAVID MANSOBEN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. PORES 1	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
460	2018-01-01	R	2	51		DAVID MANSOBEN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WW.PORES 2	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
461	2018-01-01	R	2	52		YOSEPHINA MSIREN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SANCHEN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
462	2018-01-01	R	2	53		YOAP MARYAR	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Warba Group	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
463	2018-01-01	R	2	54		YOAP MARYAR	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	PENCETAKAN WARBA GRUP	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
464	2018-01-01	R	2	55		YOAP MARYAR	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	RESTORAN WARBA GRUP	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
465	2018-01-01	R	2	56		BENYAMIN WABDARON	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	BENGKEL MANDIRI	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
466	2018-01-01	R	2	57		MARDA ZEDLY	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	AGEN MINYAK TANAH ANUGERAH	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
467	2018-01-01	R	2	58		MARDA ZEDLY	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SESEAN JAYA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
468	2018-01-01	R	2	59		MARDA ZEDLY	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ANUGERAH	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
469	2018-01-01	R	2	60		SYAMSUL	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.PODOMORO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
470	2018-01-01	R	2	61		AMIRUDIN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO SAMI INDAH	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
471	2018-01-01	R	2	62		ROSITA FONATABA	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS AFYAK	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
472	2018-01-01	R	2	63		CHOIRUL ANAM	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98613	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.RIZKY LAUT	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98613	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
473	2018-01-01	R	2	64		MELNANUS YENINAR	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	14	2	\N	\N	SUPIORI		98163	\N	28	\N	CV AYAMI MANDIRI	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
474	2018-01-01	R	2	65		IIS NURAISYAH	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO NABILA PUTRA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
475	2018-01-01	R	2	66		JUMAHI BARI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98168	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PIMI HOSANA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98168	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
476	2018-01-01	R	2	67		ABDUL AZIZ	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	WARUNG MAKAN SARI LAUT	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
477	2018-01-01	R	2	68		ERNIWATI	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO HAMDANA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
478	2018-01-01	R	2	69		SAFARI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. KETAPANG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
479	2018-01-01	R	2	70		ADOLOF KMUR	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO HORAS	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
480	2018-01-01	R	2	71		JANE METTY KUMAKAUW	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. TONDANO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
481	2018-01-01	R	2	72		NURHASANA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO HADI	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
482	2018-01-01	R	2	73		ROSIDAH	waryesi RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS /TOKO FAIRAH	waryesi RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
483	2018-01-01	R	2	74		EFRADUS BINUR	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO JUNIOR	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
484	2018-01-01	R	2	75		SANDY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.SEDERHANA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
485	2018-01-01	R	2	76		JERRY PATADIANANG	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	15	2	\N	\N	SUPIORI		98163	\N	28	\N	TOKO SIDURU	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	15	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
486	2018-01-01	R	2	77		MUSINA SWOM	WOMBONDA RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	5	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS MIOSER	WOMBONDA RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	5	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
487	2018-01-01	R	2	78		HERRY POMBOS	duber RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS /TOKO TERRY	duber RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
488	2018-01-01	R	2	79		ABDUL RAHMAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PERCETAKAN BATU HARAPAN BARU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
489	2018-01-01	R	2	80		JOIS GERUNGAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	0	\N	\N	SUPIORI		98163	\N	28	\N	RESTO WM NADI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	\N	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
490	2018-01-01	R	2	81		WELMINA MANDRIBO	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	2	\N	\N	SUPIORI		98163	\N	28	\N	TOKO MEKAR	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
491	2018-01-01	R	2	82		ARIE POMBOS	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO ARMAN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
492	2018-01-01	R	2	83		MINCE KAKE	waryesi RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ARROW	waryesi RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
493	2018-01-01	R	2	84		STANLI YAWAN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS/TOKO VESTEN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
494	2018-01-01	R	2	85		HEINCE TAMBUKU	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS EDWIN	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
495	2018-01-01	R	2	86		PA. RUDI HADI SUMARNO	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	14	2	\N	\N	SUPIORI		98163	\N	28	\N	TOKO THIO	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
496	2018-01-01	R	2	87		AGUSTINA PONSIBIDANG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS KEJORA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
497	2018-01-01	R	2	88		LIDIA BELENG	WOMBONDA RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	5	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS BERKAT INDAH	WOMBONDA RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	5	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
498	2018-01-01	R	2	89		BENYAMIN JANU	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	14	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS REY	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
499	2018-01-01	R	2	90		MELKIAS TAPIPEA	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	BATU TELA FASOS ARWO	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
500	2018-01-01	R	2	91		DAUD BINUR	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS TMDI	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
501	2018-01-01	R	2	92		INDIRANDA KAPITARAU	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	15	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS KANDERA APUS	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	15	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
502	2018-01-01	R	2	93		SAJIKMAN	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 9810	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CONTER HP RB SELULER	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 9810	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
503	2018-01-01	R	2	94		ERNAMINTA PURBA	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SYALLOM	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
504	2018-01-01	R	2	95		LEGIMAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.BAROKAH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
505	2018-01-01	R	2	96		ROSWITHA NOYA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.VICTORY PAPUA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
506	2018-01-01	R	2	97		ROSWITHA NOYA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ENCI	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
507	2018-01-01	R	2	98		FALENTINA MUDA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS RISKY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
508	2018-01-01	R	2	99		JAIDUN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS   BUTON INDAH	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
509	2018-01-01	R	2	100		YENI MASIARO	waryesi RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SASA	waryesi RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota supiori Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
510	2018-01-01	R	2	101		RICKY OLIVER TAMBUNAN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PAHAE NAUDI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
511	2018-01-01	R	2	102		ESTER TIKI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS FEBY	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
512	2018-01-01	R	2	103		HARIANTO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS BUTON DAMAI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
513	2018-01-01	R	2	104		ERIANA BASRI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. ANNISA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
514	2018-01-01	R	2	105		AHMAD YADI	SORENDIWRI RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.MIE AYAM MORODADI	SORENDIWRI RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
515	2018-01-01	R	2	106		JULIANTO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.MANGGOKOR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
516	2018-01-01	R	2	107		ABDUL LATIF	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.SATE SELERAKU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
517	2018-01-01	R	2	108		MARSEL	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.BUMBU DESA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
518	2018-01-01	R	2	109		FUSUF LEMBONGAN	WAKRE RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS YUSUP	WAKRE RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
519	2018-01-01	R	2	110		DESTRIANUS MANTONG	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS FAJAR MAMBA	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
520	2018-01-01	R	2	111		SONNY PABUNTANG	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ZEJA	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
521	2018-01-01	R	2	112		UTREK PARIARIBO	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	BENGKEL DYJY	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
522	2018-01-01	R	2	113		CRISTIA	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS CRISTIA	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
523	2018-01-01	R	2	114		NAOMI   MANDOWEN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SESAYE	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
524	2018-01-01	R	2	115		YULIANA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS BAADIA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
525	2018-01-01	R	2	116		HJ. NURHASANA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	PERCETAKAN BATU TELA HARIDA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
526	2018-01-01	R	2	117		ALEX C. GIRSANG	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CONTER HP AFRIAN CELL	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
527	2018-01-01	R	2	118		ALEX C. GIRSANG	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS AFRIAN	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
528	2018-01-01	R	2	119		ALEX C. GIRSANG	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO AFRIAN	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
529	2018-01-01	R	2	120		ERNAWAN NAINGIN	Sorendiwri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Lae	Sorendiwri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
530	2018-01-01	R	2	121		RIDESNI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Sumber Rejeki	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
531	2018-01-01	R	2	122		ADATANGKELANGGI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios AMANDA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
532	2018-01-01	R	2	123		MARLIN MAKABA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS TITANIA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
533	2018-01-01	R	2	124		ASARIA MAREWA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Restu Ibu	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
534	2018-01-01	R	2	125		LIMBONG PABUTUNGAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS R'CHA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
535	2018-01-01	R	2	126		JUMANIA PRAAS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Putri	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
536	2018-01-01	R	2	127		MARLINA PALEMBANGAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	Kios Gheral	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
537	2018-01-01	R	2	128		NELFINCE IMBIR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	AGEN MINYAK	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
538	2018-01-01	R	2	129		NELMA TANDIRAU	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS  EBY	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
539	2018-01-01	R	2	130		REXY LUDONG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PERCETAKAN SINAR BATU TELA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
540	2018-01-01	R	2	131		LALLO JUFRI	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MAROS	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
541	2018-01-01	R	2	132		LALLO JUFRI	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO MAROS JAYA	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
542	2018-01-01	R	2	133		FONY ALFONSINA ARFUSAU	WOMBONDA RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	5	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PUTRA KEMBAR	WOMBONDA RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	5	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
543	2018-01-01	R	2	134		IMAWATI	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	MAROS INDAH	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
544	2018-01-01	R	2	135		JAILINDA	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO INAYAH	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
545	2018-01-01	R	2	136		WHELMINA RUMBEKWAN	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS BRAZILA	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
546	2018-01-01	R	2	137		KARMAN	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SAROHA	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
547	2018-01-01	R	2	138		ANDI RIJALDI	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO MENTARI	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
548	2018-01-01	R	2	139		ANELCE MNIBER	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS RISDA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
549	2018-01-01	R	2	140		DAVID SAMBO	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS NELMA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
550	2018-01-01	R	2	141		NINCE KAKKE	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ARROW	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
551	2018-01-01	R	2	142		WILSON MSIREN	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO KARUNIA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
911	2020-02-17	R	2	452	00	RICKY YAKOB RUMKOREM	KAMPUNG SAUYAS	01 	01 	2	1			SUPIORI	0	98573	0	25	\N	CV. BINTANG PERSADA	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
552	2018-01-01	R	2	143		MARKUS MANSOBEN	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS MAYBORI	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
553	2018-01-01	R	2	144		OKTOVINA FAKNIK	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98164	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS AURELIA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98164	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
554	2018-01-01	R	2	145		MERY PERIRA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS JHONET	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
556	2018-01-01	R	2	147		SONY AMUNAUW	SYURDORI RT/RW : - , Syurdori ,  Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	9	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ABHA	SYURDORI RT/RW : - , Syurdori ,  Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	9	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
557	2018-01-01	R	2	148		IKMAN HARIS	MARSRAM   RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	WARUNG KOPI	MARSRAM   RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
558	2018-01-01	R	2	149		MUH HARIYONO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	GORENGAN MAS GANTENG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
559	2018-01-01	R	2	150		WIDI MAYUDI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. LALAPAN SATRIA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
560	2018-01-01	R	2	151		PRIESLY SETERIANA . B	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	MARAMPA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
561	2018-01-01	R	2	152		YULES RUMBINO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	0	\N	\N	SUPIORI		98163	\N	28	\N	MEUBEL SURBABO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	\N	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
562	2018-01-01	R	2	153		DAMARES WAKUM	KORIDO RT/RW : - , Biniki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	28	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.AMPOMBAKEN	KORIDO RT/RW : - , Biniki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	28	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
563	2018-01-01	R	2	154		BILY MENINDA TELAUBUNUA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS DINDA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
564	2018-01-01	R	2	155		MUNAWARA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS AL FAIS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
565	2018-01-01	R	2	156		SLAMET R.D PURWANTO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.MAHKOTA LAMONGAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
566	2018-01-01	R	2	157		SUGIANTO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	WM.DUA PUTRI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
567	2018-01-01	R	2	158		LAE	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS LAE	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
568	2018-01-01	R	2	159		IRNA ELFRIDA TAMPUBOLON	- RT/RW : - , Mburwandi , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	38	5	\N	\N	SUPIORI		98163	\N	28	\N	KIOS BERKAT	- RT/RW : - , Mburwandi , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	5	38	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
569	2018-01-01	R	2	160		KADIR SAILANE	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PUTRA MUNA	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
570	2018-01-01	R	2	161		BUHARI	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	KIOS MUA	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
571	2018-01-01	R	2	162		AHMAD MUTAKHI GHOSALI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	GORENGAN SUMBER REJEKI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
572	2018-01-01	R	2	163		LILIS ADA TANGKELANGI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	AGEN MINYAK TANAH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
573	2018-01-01	R	2	164		LILIS ADA TANGKELANGI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	RUMAH MAKAN RESTU IBU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
574	2018-01-01	R	2	165		LILIS ADA TANGKELANGI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO AMANDA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
575	2018-01-01	R	2	166		YULIO IMANUEL FAIDIBAN	SORENDIWERI RT/RW : - , Waryesi ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.IVANES PAPUA	SORENDIWERI RT/RW : - , Waryesi ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
867	2020-01-16	P	2	435	0204361202	MARIANA KRISTINA WOSPAKRIK	kampung kobari jaya	000	00 	12	2			SUPIORI	0	98573	-	25	\N	CV. HARAPAN ABADI	KAM.KOBARI JAYA	000	00 	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
905	2020-12-17	P	2	457	0207210501	OPPY KREY	KAMPUNG DUBER	003	002	6	1			SUPIORI	081344224647	98573	0	25	\N	CV. SOTERIO	KAMPUNG DUBER	003	001	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
576	2018-01-01	R	2	167		HAFIFA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS DAVATAR	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
577	2018-01-01	R	2	168		KETTY YARANGGA	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV. YARDOR PERMAI	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
578	2018-01-01	R	2	169		ADOLOF MSIREN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV FAJAR UTARA	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
579	2018-01-01	R	2	170		SANADI WABDARON	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.SUPIORI PERKASA	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
580	2018-01-01	R	2	171		LUIS MARYAR	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV TUBEKI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
581	2018-01-01	R	2	172		FRENGKY WADIWE	AMINWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SUPIORI OF NESIAN ALL STAR	AMINWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
582	2018-01-01	R	2	173		FRENGKY WADIWE	AMINWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS RATU	AMINWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
583	2018-01-01	R	2	174		SINTIA RUMBINO	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV MARIVE WAROMBA	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
584	2018-01-01	R	2	175		YAKOBUS RUMBARAR	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.SILAVILANA PERMAI	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
585	2018-01-01	R	2	176		BERNARD RUMAIKEUW	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SEDA INDAH	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
586	2018-01-01	R	2	177		ANDRIAS PADWA	WOMBONDA RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ISIAPEDO PASIEM	WOMBONDA RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
587	2018-01-01	R	2	178		HERMUS BINUR	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV WARTE STAR	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
588	2018-01-01	R	2	179		ROBERTH M S	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	14	2	\N	\N	SUPIORI		98163	\N	28	\N	CV MENTARI INDAH	PUWERI RT/RW : - , Puweri , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
589	2018-01-01	R	2	180		PARTIEM	MARSRAM RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS NURAYU	MARSRAM RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
590	2018-01-01	R	2	181		YATI HERLINA MAYER	MARSRAM RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.Gerson Insumbrei	MARSRAM RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
591	2018-01-01	R	2	182		YATI HERLINA MAYER	MARSRAM RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PUTRI	MARSRAM RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
592	2018-01-01	R	2	183		MARTHEN MSIREN	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV KAMASAN MAMBEYORI	FANJUR RT/RW : - , Fanjur , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
593	2018-01-01	R	2	184		DIDIMUS PARIARIBO	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.BESUMA JAYA	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
594	2018-01-01	R	2	185		MARLYANTI	SORENDIWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. SARI BUNDO	SORENDIWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
595	2018-01-01	R	2	186		JAMALUDDIN	SORENDIWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	WM. PANGKEP	SORENDIWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
596	2018-01-01	R	2	187		GOTLIF N. UBEY	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SASERA UBEY	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
597	2018-01-01	R	2	188		LUKAS EWEI	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV BILLY JAYA	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
598	2018-01-01	R	2	189		ARIUS MAKIS	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV INSERI	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
599	2018-01-01	R	2	190		YUSUF MANSOBEN	KOIRYAKAM RT/RW : - , Koryakam , Distrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	17	3	\N	\N	SUPIORI		98163	\N	28	\N	CV. SARISA BEFONDI	KOIRYAKAM RT/RW : - , Koryakam , Distrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	17	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
600	2018-01-01	R	2	191		MARTHINUS KAFIAR	MASYAI RT/RW : - , Masyai , Distrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	21	3	\N	\N	SUPIORI		98163	\N	28	\N	CV. MASYAI KURIYAKE	MASYAI RT/RW : - , Masyai , Distrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	21	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
601	2018-01-01	R	2	192		JOHN F. WOMSIWOR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ORISYUM	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
602	2018-01-01	R	2	193		MIA MARIA WAMBRAUW	RAYORI RT/RW : - , Rayori , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	   	   	33	5	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV\nINSORMBORI	RAYORI RT/RW : - , Rayori , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	\N	\N	5	33	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
603	2018-01-01	R	2	194		ROMMY D. LOBO	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. BINTANG PERSADA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
604	2018-01-01	R	2	195		HANNA M RUMAROPEN	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
605	2018-01-01	R	2	196		MOSES WAKMAN	AWAKI RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	   	   	244	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. INOWI	AWAKI RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	\N	\N	4	244	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
606	2018-01-01	R	2	197		JHONY POLOWIJAYA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	PT. IMMANUEL	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
607	2018-01-01	R	2	198		BILLY M. TELAMBANUA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS DINDA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
608	2018-01-01	R	2	199		BARNARD KAWER	RAYORI RT/RW : - , Rayori , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	   	   	33	5	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV JAYA	RAYORI RT/RW : - , Rayori , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	\N	\N	5	33	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
609	2018-01-01	R	2	200		BURHANUDIN P	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV ENGINEERING	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
610	2018-01-01	R	2	201		YUNUS BINSBAREK	DIDIABOLO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	29	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. AMOS DOREY	DIDIABOLO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	29	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
611	2018-01-01	R	2	202		ARISTOTELES KORWA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PT.BERLINS KARYA ABADI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
612	2018-01-01	R	2	203		DWIGHT ENGELBERTH. S	FANINDI RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. SANERARO	FANINDI RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
613	2018-01-01	R	2	204		ROLAND R AROGEAR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. RATU QIMORA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
614	2018-01-01	R	2	205		HILKIA SWAN RUMAKITO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV SYOWI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
615	2018-01-01	R	2	206		ELISA TITUS MOFU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. NOKEN PAPUA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
616	2018-01-01	R	2	207		NADARIAS PADWA	YENDOKER RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	5	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV	YENDOKER RT/RW : - , Wombonda , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	5	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
617	2018-01-01	R	2	208		ANDRIS NARDUS MOAY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. BIN OSER	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
618	2018-01-01	R	2	209		GILBERTH KARUBABA	SAORENDIWERI RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. GIOFANNY	SAORENDIWERI RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
619	2018-01-01	R	2	210		FERDINAN KAFIAR	YAMNAISU RT/RW : - , Yamnaisu , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	   	   	30	5	\N	\N	SUPIORI		98163	\N	28	\N	CV.RANI JAYA	YAMNAISU RT/RW : - , Yamnaisu , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	\N	\N	5	30	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
620	2018-01-01	R	2	211		ESTERLITA RAMANDEY	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota Supioi Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.BEZALEE	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota Supioi Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
621	2018-01-01	R	2	212		JHON P. RAMANDEY	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. MAWAR SARON	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
622	2018-01-01	R	2	213		YUBEL BURDAM	KORIAKAM RT/RW : - , Koryakam , Distrik Supiori Barat Kab./Kota Supiori Kode Pos. 98163	   	   	17	3	\N	\N	SUPIORI		98163	\N	28	\N	CV.RASSANA	KORIAKAM RT/RW : - , Koryakam , Distrik Supiori Barat Kab./Kota Supiori Kode Pos. 98163	\N	\N	3	17	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
623	2018-01-01	R	2	214		MULIAWATI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KIOS SEMBAKO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
624	2018-01-01	R	2	215		MULIAWATI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV\nMULIAWATI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
906	2020-07-21	R	2	449	0207210501	FILDA FELIKSINA RUMBEWAS	KAMPUNG DUBER	003	001	6	1			SUPIORI	081344224647	98573	0	25	\N	CV. SOTERIO	KAMPUNG DUBER	003	002	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
626	2018-01-01	R	2	217		DOLFINA MANOBI	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV JAYA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
627	2018-01-01	R	2	218		BILLY L. WABISER	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV\nMANANSNOM	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
628	2018-01-01	R	2	219		ARMANDO TALAPESSY	Sorendiweri- RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ALONA KARMEL	Sorendiweri- RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
629	2018-01-01	R	2	220		HANS PERMESAS INFIANDAN	Sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. Anvan Wildan	Sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
630	2018-01-01	R	2	221		GEORGE BARRIHALEDO	WARBEFONDI RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	   	   	26	4	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR/CV	WARBEFONDI RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	\N	\N	4	26	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
824	2020-12-03	R	2	413	0204330801	ISAK SEMUEL MANDOSIR	KAMPUNG WARYESI	000	00 	8	1			SUPIORI	0	98573	0	25	\N	CV.EVOLET	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
631	2018-01-01	R	2	222		ERI CHENJAUVA	Sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	KONTRAKTOR.CV\nCENDRAWASI	Sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
632	2018-01-01	R	2	223		DANIEL RUMBEKWAN	ODORI RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	   	   	23	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.OMKA	ODORI RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	\N	\N	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
633	2018-01-01	R	2	224		CHARLES RAY KAWER	Sauyas RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KAMARA JAYA	Sauyas RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
634	2018-01-01	R	2	225		RIFKY SUGIANTO WARIKAR	FANINDI RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. SUPIORI MARANNU	FANINDI RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
635	2018-01-01	R	2	226		FREDY MONTULATU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. MATOBI BANGUNPERKASA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
636	2018-01-01	R	2	227		YULES A. WOMPERE	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. TALITAKUM PERSADA	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
637	2018-01-01	R	2	228		LUCKY	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO LUCKY	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
638	2018-01-01	R	2	229		ROBBY MAMBENAR	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KENAF PAPUA GRACIA INDONESIAN	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
639	2018-01-01	R	2	230		MARKUS F. KREY	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. INAWOS STAR	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
640	2018-01-01	R	2	231		IRENE LATMI PIETER	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. GALAXY	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
641	2018-01-01	R	2	232		AGUS PEDAY	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. CAESAR ODORI	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
642	2018-01-01	R	2	233		JOHN F. WOMSIWOR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ORISYUM	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
643	2018-01-01	R	2	234		MARTHEN HEMBRING	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. RAJAWALI	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
644	2018-01-01	R	2	235		PRIDADE MANGIWA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SANDERAN SURYA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
645	2018-01-01	R	2	236		LAURENS MANSOBEN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SAHABAT ABADI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
646	2018-01-01	R	2	237		ONESIMUS RUMBEKWAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KARANG MAS	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
647	2018-01-01	R	2	238		LEON GIDALTY WAYONG	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. HARAPAN BARU	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
648	2018-01-01	R	2	239		ARDIANSYAH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PT. INDOPRATAMA SARY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
649	2018-01-01	R	2	240		FARIDA MARYAR	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SAMON DEREK	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
650	2018-01-01	R	2	241		HERU PATRIA UTAMA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PT. MULTI BINA KREASI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
651	2018-01-01	R	2	242		CORNELES E. MALAJUANA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ALDA PAPUA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
652	2018-01-01	R	2	243		YOSEP MNIBER	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ASKI MANUNGGAL PERKASA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
653	2018-01-01	R	2	244		CRISLAN P. WOMPERE	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KARYA AGUNG	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
654	2018-01-01	R	2	245		YASON L. MNIBER	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. MNUDIDO JAYA	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
827	2020-01-13	P	1	415	0101970201	MAHMUDI	KAMPUNG SAUYAS	000	00 	2	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
655	2018-01-01	R	2	246		DESIANA SANGE	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. BETESDA INDAH	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
656	2018-01-01	R	2	247		SOLEMAN H. AMUNAUW	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. PAPUA MAKMUR ABADI	SAUYAS RT/RW : - , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
657	2018-01-01	R	2	248		CHRISTIAN KURNI	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. RIMBA POF-POF	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
658	2018-01-01	R	2	249		HERMAN SWOM	WAFOR   RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SAPODIKA STAR	WAFOR   RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
659	2018-01-01	R	2	250		SELFIANA POMBOS	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. INASIBO	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
660	2018-01-01	R	2	251		JUNASIUS KORWA	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. JOVALICO	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
661	2018-01-01	R	2	252		ELIM MARYAR	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ARWAI	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
662	2018-01-01	R	2	253		SUMARNO N. MARYEN	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. CARIZON	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
663	2018-01-01	R	2	254		YAKOBUS MARYAR	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. HILANE PAPUA	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
664	2018-01-01	R	2	255		SUSUN BONSAPIA	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KEMBAR	DUBER   RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
665	2018-01-01	R	2	256		HOSEA MANSOBEN	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ORIDEK	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
666	2018-01-01	R	2	257		ELIAS TJIMAJUA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KIMAM USAHA MANDIRI	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
667	2018-01-01	R	2	258		HENGKI KMUR	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. BANDERI	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
668	2018-01-01	R	2	259		MULIA RAJIMAL ARITONA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	PT. RATIOS LIMA TUJU	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
669	2018-01-01	R	2	260		JULIO FAIDIBAN	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. IFANES PAPUA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
670	2018-01-01	R	2	261		MICCAL SUMILENA	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. NEMA BINSYOWI	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
671	2018-01-01	R	2	262		MAKDALENA MENUFANDU	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SARWOR	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
672	2018-01-01	R	2	263		DEMETRIUS Y. KAFIAR	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. GLORIANUS STAR	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
673	2018-01-01	R	2	264		YOSUA SARAKAN	SYURDORI RT/RW : - , Syurdori ,  Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	9	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. AREMBORI	SYURDORI RT/RW : - , Syurdori ,  Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	9	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
674	2018-01-01	R	2	265		ALBERTHO P. BINUR	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.PAPUA INDAH PERKASA	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
675	2018-01-01	R	2	266		YOLIS A. BARANSANO	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.ELSANI	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
676	2018-01-01	R	2	267		MARIA BRABAR	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.INDAWI STAR	KOBARI JAYA RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
677	2018-01-01	R	2	268		LISIAS DAWAN	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	23	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.CETAK BATU TELA	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
678	2018-01-01	R	2	269		JIMMY RICKY YARANGGA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.TISAN KARYA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
679	2018-01-01	R	2	270		ASIS	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	23	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.ABABIADI	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
828	2020-01-13	R	1	415	0101970201	MAHMUDI	KAMPUNG SAUYAS	000	00 	2	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
680	2018-01-01	R	2	271		ALFONSINA MANDOSIR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.YEN PIABO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
681	2018-01-01	R	2	272		YANSEN TURANG	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.DINDA PARYEM	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
682	2018-01-01	R	2	273		IRWAN SWABRA	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ABDI KARYA	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
683	2018-01-01	R	2	274		ADRIANUS MARNA	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.BERKAT PAPUA INDAH	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
684	2018-01-01	R	2	275		SAMUEL.R.POLOWIJAYA	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.VICTORIUS GLORY ROYALE	SORENDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
685	2018-01-01	R	2	276		MARRULY PANGGABEAN	SORINDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.PAPUA ANUGERAH JAYA	SORINDIWERI-YENGGARBUN RT/RW :\n- , Sauyas , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
686	2018-01-01	R	2	277		EFRENDY.H.RUMBIAK	SABARMIOKRE RT/RW : - , Waryei ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.AMORI	SABARMIOKRE RT/RW : - , Waryei ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
687	2018-01-01	R	2	278		REIN ELKANA MAER	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.NADI AWIN	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
688	2018-01-01	R	2	279		KABINET TARINGAN	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.PAKUAN GEMPITA	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
689	2018-01-01	R	2	280		W.TARINGAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SINAR GUNDALIN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
690	2018-01-01	R	2	281		AGUSTINUS MNIMNEMWARBA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.TRI TUNGGAL PAPUA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
691	2018-01-01	R	2	282		ALBERTUS.M.METEMKO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MIRANDAKU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
692	2018-01-01	R	2	283		CORNELIA RUMAINUM	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.BINYESU	WARYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
693	2018-01-01	R	2	284		DANIEL.C.W.KAWER	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.DEVITA ARIHA INDAH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
694	2018-01-01	R	2	285		DIDIMUS.R.INFAINDAM	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	23	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.MAMBOYAR	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
695	2018-01-01	R	2	286		ELIA MANAMPAISEM	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ANUGERAH INDAH WAFOR	SAWARKAR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
696	2018-01-01	R	2	287		MUH. SYAIFUL MALIK	KEPULAUAN ARURI RT/RW : - ,\nManggonswan , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	38	5	\N	\N	SUPIORI		98163	\N	28	\N	CV.SUPIORI JAYA MANDIRI	KEPULAUAN ARURI RT/RW : - ,\nManggonswan , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	5	38	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
697	2018-01-01	R	2	288		VIKTOR RUMBEKWAN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.KORIDO JAYA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
698	2018-01-01	R	2	289		DORINCE WAKUM	SABARMIOKRE RT/RW : - , Amyas ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	19	3	\N	\N	SUPIORI		98163	\N	28	\N	CV NAERBA	SABARMIOKRE RT/RW : - , Amyas ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	19	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
699	2018-01-01	R	2	290		EKBERT SOMBUK	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KARYA BERSAMA MANDIRI	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
700	2018-01-01	R	2	291		SALMAN WARIKAR	KAMP. FANINDI RT/RW : - , Fanindi ,\nDistrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. RYAN JAYA	KAMP. FANINDI RT/RW : - , Fanindi ,\nDistrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
701	2018-01-01	R	2	292		NOVELA SANTI AWOM	YENGGARBUN RT/RW : - , Warbor ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV. ELSANE	YENGGARBUN RT/RW : - , Warbor ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
702	2018-01-01	R	2	293		YAKOBUS DAWAN	KAMP.MARYAIDORI RT/RW : - ,\nMaryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	27	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.MARADORI	KAMP.MARYAIDORI RT/RW : - ,\nMaryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
703	2018-01-01	R	2	294		YAKOB PETRUS AP	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV .ARURI JAYA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
704	2018-01-01	R	2	295		PATRIKS WARIKAR	KAMP.FANINDI RT/RW : - , Fanindi ,\nDistrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	3	\N	\N	SUPIORI		98163	\N	28	\N	CV.RUT ARAIMA	KAMP.FANINDI RT/RW : - , Fanindi ,\nDistrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
705	2018-01-01	R	2	296		DORCE SANDALEMBANG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.GREEN GRAFIK	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
706	2018-01-01	R	2	297		DORCE SANDALEMBANG	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO GREEN GRAFIK	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
707	2018-01-01	R	2	298		POLI SAPAN	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	   	   	27	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.HOLY LADYS	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	\N	\N	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
708	2018-01-01	R	2	299		RUDIN	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	KIOS DEDE BOTON	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
709	2018-01-01	R	2	300		NURDIN	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	KIOS PAKAIAN DEDE BUTON COLLECTION	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
710	2018-01-01	R	2	301		MUSTAFA	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	KIOS ANJAR BUTON	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
711	2018-01-01	R	2	302		DUATH.E.SALAWANE	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.SANERARO	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
712	2018-01-01	R	2	303		MILKA WABISER	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. WARMNU	SORENDIWERI   RT/RW : - ,\nSorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
713	2018-01-01	R	2	304		HERRY MSEN	SABARMIOKRE RT/RW : - , Mapia ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	22	3	\N	\N	SUPIORI		98163	\N	28	\N	CV.NUKUBUAT PERKASA	SABARMIOKRE RT/RW : - , Mapia ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	22	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
714	2018-01-01	R	2	305		SILPA SAREWO	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SINAR WAKRE	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
715	2018-01-01	R	2	306		ALFEUS KORWA	KORIDO RT/RW : - , Ineki , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	34	5	\N	\N	SUPIORI		98163	\N	28	\N	CV.RAK NUMFOR	KORIDO RT/RW : - , Ineki , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	5	34	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
716	2018-01-01	R	2	307		MARICE YOHANA RUMAINUM	SABARMIOKRE RT/RW : - , Amyas ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	19	3	\N	\N	SUPIORI		98163	\N	28	\N	CV.BIAK PRIBUMI	SABARMIOKRE RT/RW : - , Amyas ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	19	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
717	2018-01-01	R	2	308		MICHAEL RUMERE	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	   	   	27	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. EMBUN SUPIORI	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	\N	\N	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
718	2018-01-01	R	2	309		HELFRICK.H.F.L.PAIKI	JALAN RAYA MARSRAM RT/RW : - ,\nMarsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ARVENSIS	JALAN RAYA MARSRAM RT/RW : - ,\nMarsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
719	2018-01-01	R	2	310		MOSES MANSOBEN	MANSOBEN RT/RW : - , Waryesi ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MAMBENA DOYADORI	MANSOBEN RT/RW : - , Waryesi ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
720	2018-01-01	R	2	311		DRS.WOFF JUSTINUS.MM	KORIDO RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. WASEM JAYA	KORIDO RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
721	2018-01-01	R	2	312		ROLAND OMPI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.KRISOLIT	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
907	2020-07-21	R	2	450	02039012304	DANIEL RUMBEKWAN	KAMPUNG ODORI	003	002	23	4			SUPIORI	085254369480	98573	0	25	\N	CV. OMKA	KAMPUNG ODORI	003	002	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
722	2018-01-01	R	2	313		EMMA OMPI SAWAKI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ROMESA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
723	2018-01-01	R	2	314		KRISTINA WARIKAR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.KRISEL BANGUN PERSADA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
724	2018-01-01	R	2	315		JULIA KAFIAR	SABARMIOKRE RT/RW : - , Masyai ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	21	3	\N	\N	SUPIORI		98163	\N	28	\N	CV.AIMANDO SARISA	SABARMIOKRE RT/RW : - , Masyai ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	21	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
725	2018-01-01	R	2	316		ZETH ARINDI KURNI	SORENDIWERI RT/RW : - , Wafor ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.PAPUA BARAKAS	SORENDIWERI RT/RW : - , Wafor ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
726	2018-01-01	R	2	317		YOSEFUS KAFIAR	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. AWAKI JAYA	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
727	2018-01-01	R	2	318		OKTOVIANUS WAKRIS	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	   	   	27	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.ASMAN PUTRA	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	\N	\N	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
728	2018-01-01	R	2	319		BARNABAS MANSOBEN	SABAR MIOKRE RT/RW : - , Amyas ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	19	3	\N	\N	SUPIORI		98163	\N	28	\N	CV RASIYAMA PAPUA STAR	SABAR MIOKRE RT/RW : - , Amyas ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	19	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
729	2018-01-01	R	2	320		YUSYINA.PS.MANUFANDU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. GUNUNG JATI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
730	2018-01-01	R	2	321		DWI SAPTAWATI TRIKORA DEWI	KORIDO RT/RW : - , Manggonswan , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	36	5	\N	\N	SUPIORI		98163	\N	28	\N	CV.INDAH PERMAI	KORIDO RT/RW : - , Manggonswan , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	5	36	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
731	2018-01-01	R	2	322		MARTHINUS MANSOBEN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.AMOSRE	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
732	2018-01-01	R	2	323		KAMELIA MAYER	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. SINAR SELATAN	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
733	2018-01-01	R	2	324		RAYMOND.J.M.RUMOKOY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.GELGRA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
734	2018-01-01	R	2	325		ESTER OVIAS	SORENDIWERI RT/RW : - , Wafor ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.WARMUN JAYA	SORENDIWERI RT/RW : - , Wafor ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
735	2018-01-01	R	2	326		ISHAK SAMUEL MANDOSIR	WARYESI RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.EVOLET	WARYESI RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota Supiori Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
736	2018-01-01	R	2	327		LISA JULIANA SARTJE BUDURI	SORENIDWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ANDROMEDA	SORENIDWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
737	2018-01-01	R	2	328		SELLA FLORCE ABIDONDIFU	SORENDIWEI RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ABISAK MAKMUR	SORENDIWEI RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
738	2018-01-01	R	2	329		MARTHINUS WABDARON	YENGGARBUN RT/RW : - , Puweri ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	14	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.PUWERI INDAH	YENGGARBUN RT/RW : - , Puweri ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
739	2018-01-01	R	2	330		RULAN RUDOLF ARONGGEAR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.RATU QIMORA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
740	2018-01-01	R	2	331		ONESIMUS KBAREK	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ERSAMBO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
741	2018-01-01	R	2	332		EDDY NUMBERI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. JEHOVA JIREH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
742	2018-01-01	R	2	333		ESAU MARYAR	MIOSARWAI RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. TUBEKI	MIOSARWAI RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
743	2018-01-01	R	2	334		HANS.P.INFAINDAN	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	23	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. ANVAN WILDAN	KORIDO RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
744	2018-01-01	R	2	335		FREDRICUS F. WIRJAYA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.TUJUH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
745	2018-01-01	R	2	336		PIRADE MANGIWA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SANDERAN SURYA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
908	2020-02-17	P	2	458	0200980101	NELES WARFANDU	KAMPUNG WAFOR	01 	01 	1	1			SUPIORI	0	98573	0	25	\N	CV.WAFOR INDAH	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
746	2018-01-01	R	2	337		SALOMINA WARIKAR	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. REAN STAR	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
747	2018-01-01	R	2	338		BERNARD KAWER	KORIDO RT/RW : - , Rayori , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	33	5	\N	\N	SUPIORI		98163	\N	28	\N	CV.MELSAN JAYA	KORIDO RT/RW : - , Rayori , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	5	33	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
748	2018-01-01	R	2	339		LUTHER YOM	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.KARKIRI	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
749	2018-01-01	R	2	340		LUDIA SAMBO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO IMMANUEL	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
750	2018-01-01	R	2	341		LAADA	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.LAMENA JAYA	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
751	2018-01-01	R	2	342		MEIDY JHONIE TULANDI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO SINAR AWAKI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
752	2018-01-01	R	2	343		JACKLIN TUERAH	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. MANGUNDI JAYA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
753	2018-01-01	R	2	344		THERIANUS.H.A.AYOMI	KORIDO RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	26	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.BIAK MINANG BHAKTI	KORIDO RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	26	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
754	2018-01-01	R	2	345		SEPTINUS RUMBINO	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	   	   	27	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.SINAR KASIH	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	\N	\N	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
755	2018-01-01	R	2	346		BUN ARONGGEAR	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SHLOOM	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
756	2018-01-01	R	2	347		ARMAND MAER	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. AIBINDEI GROUP	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
757	2018-01-01	R	2	348		NIKOLAS KAFIAR	KORIDO RT/RW : - , Yamnaisu , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	30	5	\N	\N	SUPIORI		98163	\N	28	\N	CV.IRVAN RANI JAYA	KORIDO RT/RW : - , Yamnaisu , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	5	30	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
758	2018-01-01	R	2	349		SELVIANA POMBOS	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. INASIBO	WAFOR RT/RW : - , Wafor , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
759	2018-01-01	R	2	350		MARKUS FRANS KREY	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. INAWOS STAR	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
760	2018-01-01	R	2	351		APILENA DIMARA	YAMNAISU RT/RW : - , Yamnaisu , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	   	   	30	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.MAMBENA ASEBI	YAMNAISU RT/RW : - , Yamnaisu , Distrik Kepulauan Aruri Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	30	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
761	2018-01-01	R	2	352		DAUD KRISTIAN WABDARON	YENGGARBUN RT/RW : - , Fanjur ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV. KABOR SKORYAYE	YENGGARBUN RT/RW : - , Fanjur ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
762	2018-01-01	R	2	353		SAMSON ARNOL BINUR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. SOWEK JAYA PERKASA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
763	2018-01-01	R	2	354		YANTJE WANMA	SORENDIWERI RT/RW : - , Duber ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.REQUEL JAYA	SORENDIWERI RT/RW : - , Duber ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
764	2018-01-01	R	2	355		ANDRIANUS WABDARON	YENGGARBUN RT/RW : - , Fanjur ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.SUPIORI PERKASA	YENGGARBUN RT/RW : - , Fanjur ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
765	2018-01-01	R	2	356		YUNUS BINSBAREK	KORIDO RT/RW : - , Didiabolo , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	29	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. AMOS DOREY	KORIDO RT/RW : - , Didiabolo , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	29	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
766	2018-01-01	R	2	357		JHON F WOMSIWOR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ORISYUN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
767	2018-01-01	R	2	358		AKSAMINA BOSEREN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ANUGRAH	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
768	2018-01-01	R	2	359		YOHANES WARIKAR	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. VIAN	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
769	2018-01-01	R	2	360		ANDREAS RUMAROPEN	SORENDIWERI RT/RW : - , Syurdori ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	9	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SYURDORI INDAH	SORENDIWERI RT/RW : - , Syurdori ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	9	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
909	2020-02-17	R	2	451	0200980101	NELES WARFANDU	KAMPUNG WAFOR	01 	01 	1	1			SUPIORI	0	98573	0	25	\N	CV.WAFOR INDAH	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
770	2018-01-01	R	2	361		BILLY LEONARD WABISER	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MANONSNON	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
771	2018-01-01	R	2	362		MUHAMAD TAUFIQ MUSKANTO	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SURU FAMILY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
772	2018-01-01	R	2	363		MANASE YARANGGA	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	CV. KAMSYUMI	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
773	2018-01-01	R	2	364		ADI SUPRIYADI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV..SYIBIL ARIZTA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
774	2018-01-01	R	2	365		NELES WARFANDU	SORENDIWERI RT/RW : - , Wafor ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	1	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.WAFOR INDAH	SORENDIWERI RT/RW : - , Wafor ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
775	2018-01-01	R	2	366		OTTIS MANSOBEN	SORENDIWERI RT/RW : - , Waryesi ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.PERSADA	SORENDIWERI RT/RW : - , Waryesi ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
776	2018-01-01	R	2	367		ROBERTH.M.S.AMARHOSEA	YENGGARBUN RT/RW : - , Puweri ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	14	2	\N	\N	SUPIORI		98163	\N	28	\N	CV. MENTARI INDAH	YENGGARBUN RT/RW : - , Puweri ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
777	2018-01-01	R	2	368		ARISTOTELES SOMBUK	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.YEREMIA PUTRA PERKASA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
778	2018-01-01	R	2	369		AGUSTINUS RUMBARAR	YENGGARBUN RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	12	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.ARISI	YENGGARBUN RT/RW : - , Kobari Jaya , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
779	2018-01-01	R	2	370		MARKUS R.KALILELE	YENGGARBUN RT/RW : - , Warsa ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	15	2	\N	\N	SUPIORI		98163	\N	28	\N	CV. MITRA FANGKASING	YENGGARBUN RT/RW : - , Warsa ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	15	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
780	2018-01-01	R	2	371		DANIEL WAMBRAUW	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MANSWAR BORI	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
781	2018-01-01	R	2	372		KRISTIAN M ARONGGEAR,SE	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ARONAI	SORENDIWERI RT/RW : - , Marsram ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
782	2018-01-01	R	2	373		MARTHEN TODING	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MITRA PAPUA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
783	2018-01-01	R	2	374		TIGOR HARYANTO SIMANJUNTAK	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.BINTANG BARAT	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
784	2018-01-01	R	2	375		KRISLAND P WOMPERE	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.KARYA AGUNG	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
785	2018-01-01	R	2	376		SUKMA PUJANTORO	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. MANDE KENCANA	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
786	2018-01-01	R	2	377		ACEP NOLDI MUSU	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. ROLLER PERKASA MANDIIRI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
787	2018-01-01	R	2	378		JOHANIS.A.MANSNEMBRA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.MAMBRI CIPTA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
788	2018-01-01	R	2	379		MARGARETHA RAHANGIAR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.METHA PERMAI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
789	2018-01-01	R	2	380		DRS.ADRIANUS KAWER	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV. KAMARA JAYA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
790	2018-01-01	R	2	381		FRANSISCUS L BINUR	YENGGARBUN RT/RW : - , Warbor ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.AMARE	YENGGARBUN RT/RW : - , Warbor ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
791	2018-01-01	R	2	382		ELIA TITUS MOFU	WAYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	8	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.NOKEN PAPUA	WAYESI RT/RW : - , Waryesi , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
792	2018-01-01	R	2	383		YETI YARANGGA	YENGGARBUN RT/RW : - , Fanjur ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	11	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.YARDOR PERMAI	YENGGARBUN RT/RW : - , Fanjur ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
793	2018-01-01	R	2	384		MOHAMAD FASAL HUSAIN	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.CIPTA KOROMATIKA PAPUA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
794	2018-01-01	R	2	385		SATRIO DWIJAYANTO,ST	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PT.ALAM DAYA MAKMUR	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
795	2018-01-01	R	2	386		IR.WINANRNO,MM	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	24	4	\N	\N	SUPIORI		98163	\N	28	\N	PT.BANGUN NUSANTARA ENGINEERING	KORIDO RT/RW : - , Awaki , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
796	2018-01-01	R	2	387		MOREST KAINAMA	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.YOGLY	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
797	2018-01-01	R	2	388		JHONI FRENGKY REDJAUW	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	3	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.PUTRA AMANI SANAM	MARSRAM RT/RW : - , Marsram , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
798	2018-01-01	R	2	389		MARTHINUS RUMERE	KORIDO RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	26	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.ORMAKI	KORIDO RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	26	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
799	2018-01-01	R	2	390		YUSUF KORWA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	PT.LINTAS CAKRAWALA PAPUA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
800	2018-01-01	R	2	392		SALMON MINGGUS SROYER	YAMERWA RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.SONDU KAMASAN	YAMERWA RT/RW : - , Yawerma , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
801	2018-01-01	R	2	393		YOHANES TERTIUS WAMBRAUW	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.WAMBAREK	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
802	2018-01-01	R	2	394		NUNCIK WIJAYA	SORENIWERI RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.YAKONME MULIA ABADI	SORENIWERI RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
803	2018-01-01	R	2	395		YOEDHA UTAMA WIDYATMAKA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.RANDU ALAS PAPUA	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
804	2018-01-01	R	2	396		ALBERTH Y P PRAWAR	YENGGARBUN RT/RW : - , Warbor ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	13	2	\N	\N	SUPIORI		98163	\N	28	\N	CV.PUTRA CENDRAWASIH	YENGGARBUN RT/RW : - , Warbor ,\nDistrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
805	2018-01-01	R	2	397		SUHARDJO	SORENDIWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	4	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.CITRA KIRANA	SORENDIWERI RT/RW : - , Yawerma ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
806	2018-01-01	R	2	398		H.MUH NAWIR	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	25	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.USAHA BARU	KORIDO RT/RW : - , Fanindi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
807	2018-01-01	R	2	399		OFAN EFRIANSYAH	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SORENDIWERI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PT. JASA PERENCANAAN NUSANTARA	sorendiweri RT/RW : - , Sorendiweri , Distrik Supiori Timur Kab./Kota SORENDIWERI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
808	2018-01-01	R	2	400		PAULA RUMAROPEN	SABARMEOKRE RT/RW : - , Koryakam ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	   	   	17	3	\N	\N	SUPIORI		98163	\N	28	\N	CV.BINBOKI	SABARMEOKRE RT/RW : - , Koryakam ,\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	3	17	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
809	2018-01-01	R	2	401		SIMON J. TUBALAWONY	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	PT. RODA GEMILANG PERKASA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
810	2018-01-01	R	2	402		ANITA HELEN FAIDIBAN	SORENDIWERI RT/RW : - , Duber ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	6	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.BINMANDOS	SORENDIWERI RT/RW : - , Duber ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
811	2018-01-01	R	2	403		AGUNG CHRISTIAN RORENG	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	PENGECER MINYAK TANAH GAVRIEL	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
812	2018-01-01	R	2	404		FRENGKI KOLONDAM	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.KANDERA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
813	2018-01-01	R	2	405		MUNUR CHRISTIAN YEWUN	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.AY KONSTRUKSI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
814	2018-01-01	R	2	406		AGUS RUMERE	KORIDO RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	   	   	26	4	\N	\N	SUPIORI		98163	\N	28	\N	CV.ABASI JAYA	KORIDO RT/RW : - , Warbefondi , Distrik Supiori Selatan Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	4	26	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
815	2018-01-01	R	2	407		STEVEN REJAUW	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ENAM SAUDARA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
816	2018-01-01	R	2	408		YUSTIAN NOVIDY BUBUNGAN	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	2	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ADYCITRA CONSULTAN	SORENDIWERI RT/RW : - , Sauyas ,\nDistrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
817	2018-01-01	R	2	409		YANCE NANI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	CV.ZIVANIA JAYA ABADI	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	2018-01-01	P	2	1		IFANALI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	2  	6	1	\N	\N	SUPIORI	090908908	98163	\N	28	\N	IFANALI	DUBER RT/RW : - , Duber , Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	6	SUPIORi	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
818	2020-01-16	P	2	411	20204350801	ESTERLITA Y.M RAMANDEY	KAMPUNG WARYESI	00 	000	8	1			SUPIORI	0	98573	0	25	\N	CV.BEZALEEL	KAMPUNG WARYESI	000	000	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
833	2020-01-16	P	2	418	0224350801	ESTERLITA YM RAMANDEY	KAMPUNG WARYESI	000	00 	8	1			SUPIORI	0	98573	0	25	\N	ESTERLITA YM RAMANDEY	KAMPUNG WARYESI	000	002	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
842	2020-01-22	P	1	423	0103862304	ASIS	KAMPUNG ABABIADI	00 	00 	23	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
843	2020-01-22	R	1	422	0103862304	ASIS	KAMPUNG ABABIADI	00 	00 	23	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
844	2020-01-22	P	1	424	0103672304	ASIS	KAMPUNG ABABIADI	00 	00 	23	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
821	2020-01-16	R	2	411	20204361202	MARINA K WOSPAKRIK	KAMPUNG KOBARIJAYA	000	00 	12	2			SUPIORI	0	98573	0	25	\N	CV.HARAPAN ABADI	KAMPUNG KOBARIJAYA	000	00 	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
820	2020-01-20	P	2	412	20204361202	MARINA K WOSPAKRIK	KAMPUNG KOBARIJAYA	000	00 	12	2			SUPIORI	0	98573	0	25	\N	CV.HARAPAN ABADI	KOBARIJAYA	000	00 	2	12	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
822	2020-01-20	P	1	413	20204370701	LIES LUSIANA KADIWARU	KAMPUNG SORENDIWERI	000	00 	7	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
823	2020-12-03	R	1	412	0104370701	LIES LUSIANA KADIWARU	KAMPUNG SORENDIWERI	000	00 	7	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
831	2020-01-16	P	2	417	0204340801	JHON PD RAMANDEY	KAMPUNG WARYESI	000	00 	8	1			SUPIORI	0	98573	0	25	\N	JHON PD RAMANDEY	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
832	2020-01-16	R	2	417	0204340801	JHON PD RAMANDEY	KAMPUNG WARYESI	000	00 	8	1			SUPIORI	0	98573	0	25	\N	JHON PD RAMANDEY	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
845	2020-01-22	R	1	423	0103672304	ASIS	KAMPUNG ABABIADI	0  	00 	23	4			SUPIORI	0	98573		25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
846	2020-01-28	P	2	425	0200910701	JAMES LOIS RONSUMBRE	KAMPUNG SORENDIWERI	00 	00 	7	1			SUPIORI	0	98573	0	25	\N	CV KARYA PAPUA BEFONDI	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
849	2020-04-01	R	1	425	0102740701	KIOS SEMBAKO /MULIAWATI	SORENDIWEWERI	000	00 	7	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
834	2020-01-20	P	2	419	0204382704	FELEX WOF	KAMPUNG MARYAIDORI	000	00 	27	4			SUPIORI	0	98573	0	25	\N	CV WARANAI	KAMPUNG MARYAIDORI	000	00 	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
835	2020-12-20	R	2	418	0204382704	CV.WARANAI	KAMPUNG MARYAIDORI	000	00 	27	4			SUPIORI	0	98573	0	25	\N	CV WARANAI	KAMPUNG MARYAIDORI	000	00 	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
836	2020-01-21	P	2	420	0204540701	JHON WOMSIWOR	KAMPUNG SORENDIWERI	000	00 	7	1			SUPIORI	0	98573	0	25	\N	CV ORISYUN	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
837	2020-01-21	R	2	419	0204540701	JHON WOMSIWOR	SORENDIWERI	000	00 	7	1			SUPIORI	0	98573	0	25	\N	CV ORISYUN	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
838	2020-01-22	P	2	421	0204222304	GERSON KORWA	ABABIADI	00 	00 	23	4			SUPIORI	0	98573	0	25	\N	CV ABABIADI PERMAI	KAMPUNG ABABIADI	000	000	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
840	2020-01-22	P	1	422	0102102304	ASIS	KAMPUNG ABABIADI	00 	00 	23	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
841	2020-01-22	R	1	421	0102102304	ASIS	KAMPUNG ABABIADI	00 	00 	23	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
839	2020-01-22	R	2	420	0204222304	GERSON KORWA	ABABIADI	00 	00 	23	4			SUPIORI	0	98573	0	25	\N	CV ABABIADI PERMAI	 KAMPUNG ABABIADI	000	000	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
146	2018-01-01	P	1	146	0	MIRAWATI	WARYESI 	000	00 	8	1			SUPIORI	0	98573	0	25	\N	KIOS SINAR GOA	WARYESI	000	00 	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
848	2020-01-28	R	2	424	0200910701	JAMES LOIS RONSUMBRE	KAMPUNG SORENDIWERI	00 	00 	7	1			SUPIORI	0	98573	0	25	\N	CV KARYA PAPUA BEFONDI	KAMPUNG SORENDIWERI	000	000	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
850	2020-01-28	P	2	427	0204380201	ARYANI WOMPERE	KAMPUNG SAUYAS	000	00 	2	1			SUPIORI	0	98573	0	25	\N	CV SAWABAS INDAH	KAMPUNG SAUYAS	000	000	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
851	2020-12-28	R	2	426	0204380201	ARYANI WOMPERE	KAMPUNG SAUYAS	00 	00 	2	1			SUPIORI	0	98573	0	25	\N	CV SAWABAS INDAH	KAMPUNG SAUYAS	000	000	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
847	2020-04-01	P	1	426	0102740701	KIOS SEMBAKO /MULIAWATI	SORENDIWERI	000	00 	7	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
853	2019-04-01	P	2	429	0202750701	CV.MULIAWATI	KAMPUNG SORENDIWERI	000	00 	7	1			SUPIORI	0	98573	0	25	\N	CV. MULIAWATI	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
854	2019-04-01	R	2	427	0202750701	MULIAWAI	KAMPUNG SORENDIWERI	000	00 	7	1			SUPIORI	0	98573	0	25	\N	CV.MULIAWATI	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
852	2020-01-30	P	2	428	0204402804	ROBERTH V AMSAMSYUM	KAMPUNG BINIKI	00 	00 	28	4			SUPIORI	0	98573	0	25	\N	CV DAMONI STAR	KAMPUNG BINIKI	000	000	4	28	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
855	2020-01-30	R	2	428	0204402804	ROBERTH V AMSAMSYUM	KAMPUNG BINIKI	00 	00 	28	4			SUPIORI	0	98573	0	25	\N	CV DAMONI STAR	KAMPUNG BINIKI	000	00 	4	28	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
856	2020-01-30	P	2	430	0204412804	DAMARES WAKUM	KAMPUNG BINIKI	00 	00 	28	4			SUPIORI	0	98573	0	25	\N	CV AMPOMBAKEN	KAMPUNG BINIKI	000	000	4	28	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
857	2020-01-30	R	2	429	0204412804	DAMARES WAKUM	KAMPUNG BINIKI	0  	00 	28	4			SUPIORI	0	98573	0	25	\N	CV AMPOMBAKEN	KAMPUNG BINIKI	000	000	4	28	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
859	2020-01-30	P	1	431	0104392504	RAMA SUANI LINGGA	KAMPUNG FANINDI	00 	00 	25	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
216	2018-01-01	P	2	216	200	MARKUS FAINSENEM	MANGOSWAN RT/RW : - ,\r\nManggonswan , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	000	00 	36	5			SUPIORI	0	98573	0	25	\N	CV. NOROSE STAR	MANGOSWAN RT/RW : - ,\r\nManggonswan , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	000	002	5	36	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
625	2018-01-13	R	2	216	20204523605	MARKUS FAINSENEM	MANGOSWAN RT/RW : - ,\r\nManggonswan , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	01 	01 	36	5			SUPIORI	081266677135	98573	0	25	\N	CV. NOROSE STAR	MANGOSWAN RT/RW : - ,\r\nManggonswan , Distrik Kepulauan Aruri Kab./Kota Supiori Kode Pos. 98163	01 	01 	5	36	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
871	2020-01-13	P	1	439	0202	HENY IRYANI	KAMPUNG FANINDI	000	00 	25	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
872	2020-01-14	P	2	440	0222	JHON PD RAMANDEY	KAMPUNG WARYESI	000	00 	8	1			SUPIORI	0	98573	0	25	\N	CV. MAWAR SHARON	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
873	2020-01-16	R	2	435	022	JHON PD RAMANDEY	KAMPUNG WARYESI	000	00 	8	1			SUPIORI	0	98573	0	25	\N	CV. MAWAR SHARON	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
819	2020-01-16	R	2	410	20204350801	ESTERLITA Y.M RAMANDEY	KAMPUNG WARYESI	000	00 	8	1			SUPIORI	0	98573	0	25	\N	CV.BEZALEEL	KAMPUNG WARYESI	000	000	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
874	2020-01-16	P	2	441	0204350801	ESTERLITA YM. RAMANDEY		000	00 	8	1			SUPIORI	0	98573	0	25	\N	CV. BAZALEEL	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
875	2020-01-20	P	2	442	0204382701	FELEX WOF	KAMPUNG MARYAIDORI	000	00 	27	4			SUPIORI	0	98573	0	25	\N	CV. WARANAI	KAMPUNG MARYAIDORI	000	00 	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
876	2020-01-20	R	2	436	0022	FELEX WOF	KAMPUNG MARYAIDORI	000	00 	27	4			SUPIORI	0	98573	0	25	\N	CV. WARANAI	KAMPUNG MARYAIDORI	000	00 	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
877	2020-01-20	P	1	443	0104370701	LIES LUSIANA KADIWARU	KAMPUNG SORENDIWERI	000	00 	7	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
878	2020-01-20	R	1	437	0104340701	LIES LUSIANA KADIWARU	KAMPUNG SORENDIWERI	000	00 	7	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
881	2010-02-18	P	2	444	0203371102	ADOLOF MSIREN	KAMPUNG FANJUR	000	00 	11	2			SUPIORI	0	98573	0	25	\N	CV. FAJAR UTARA	KAMPUNG FANJUR	000	00 	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
882	2020-02-18	R	2	438	02033371102	ADOLOF MSIREN	KAMPUNG FANJUR	000	00 	11	2			SUPIORI	0	98573	0	25	\N	CV. FAJAR UTARA	KAMPUNG FANJUR	000	00 	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
883	2020-02-18	P	2	445	0201910101	GELVIN POMBOS	KAMPUNG WAFOR	000	00 	1	1			SUPIORI	0	98573	0	25	\N	CV. SONAI BARAKAS	KAMPUNG WAFOR	000	00 	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
884	2020-02-19	R	2	439	0201910101	GELVIN POMBOS	KAMPUNG WAFOR	01 	01 	1	1			SUPIORI	0	98573	0	25	\N	CV. SONAI BARAKAS	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
886	2020-02-10	P	2	447	0204422304	ROSITA SADA	KAMPUNG ODORI	01 	01 	23	4			SUPIORI	0	98573	0	25	\N	CV. AUDREY	KAMPUBNG ODORI	01 	01 	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
887	2020-02-11	P	2	448	020112000701	BURHANUDDIN,P	KAMPUNG SORENDIWERI	01 	01 	8	1			SUPIORI	0	98573	0	25	\N	CV. ZALIKA ENGINEE	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
888	2020-02-11	R	2	440	0201100701	BURHANUDDIN,P	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV.ZALIKA ENGINEE	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
889	2020-02-11	P	1	449	0204451603	HAPLI SIPARE	KAMPUNG SABARMIOKRE	01 	01 	18	3			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
890	2020-02-11	R	1	441	0204451603	HAPLI SIPARE	KAMPUNG WAYORI	01 	01 	18	3			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
891	2020-02-11	P	2	450	0200170201	AYARI DONDAIFI PAPARE	KAMPUNG SAUYAS	01 	01 	2	1			SUPIORI	0	98573	0	25	\N	CV.AYIN PAPUA	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
892	2020-02-11	R	2	442	0200170201	AYARI DONDAIFI PAPARE	KAMPUNG SAUYAS	01 	01 	2	1			SUPIORI	0	98573	0	25	\N	CV.AYIN PAPUA	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
893	2020-02-12	P	2	451	0201610701	FONI RUMAYAUW	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV.ENDREY	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
894	2020-02-12	R	2	443	0202610701	FONI RUMAYAUW	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV.ENDREY	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
895	2020-02-17	P	2	452	0204460301	YUSTINUS REJAUW	KAMPUNG MARSRAM	01 	01 	3	1			SUPIORI	0	98573	0	25	\N	CV.MANDAUW SIWOSI	KAMPUNG MARSRAM	01 	01 	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
896	2020-02-17	R	2	444	0204460301	YUSTINUS REJAUW	KAMPUNG MARSRAM	01 	01 	3	1			SUPIORI	0	98573	0	25	\N	CV.MANDAUW SIWOSI	KAMPUNG MARSRAM	01 	01 	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
897	2020-02-17	P	2	453	0204270201	DEREK A. RUMBARAR	KAMPUNG SAUYAS	01 	01 	2	1			SUPIORI	0	98573	0	25	\N	CV. PAPUA ANUGERAH JAYA	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
898	2020-02-17	R	2	445	0204270201	DEREK A. RUMBARAR	KAMPUNG SAUYAS	01 	01 	2	1			SUPIORI	0	98573	0	25	\N	CV. PAPUA ANUGERAH JAYA	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
899	2020-02-17	P	2	454	001	DAVID SAMUEL MANSOBEN	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV.BONSFORI PORES SUPIORI	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
900	2020-02-17	R	2	446	001	DAVID SAMUEL MANSOBEN	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV.BONSFORI PORES SUPIORI	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
901	2020-02-17	P	2	455	0204470701	FERDINAND WAMBRAUW	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV. ROMOS	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
902	2020-02-17	R	2	447	0204470701	FERDINAND WAMBRAUW	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV. ROMOS	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
903	2020-02-17	P	2	456	0200100201	ARMANDO WAIRARA	KAMPUNG SAUYAS	01 	01 	2	1			SUPIORI	0	98573	0	25	\N	PT.VICTORIUS G.R	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
904	2020-02-17	R	2	448	0200100201	ARMANDO WAIRARA	KAMPUNG SAUYAS	01 	01 	2	1			SUPIORI	0	98573	0	25	\N	PT.VICTORIUS G.R	KAMPUNG SUYAS	01 	01 	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
910	2020-02-17	P	2	459	0200100201	RICKY YAKOB RUMKOREM	KAMPUNG SAUYAS	01 	01 	2	1			SUPIORI	0	98573	0	25	\N	CV. BINTANG PERSADA	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
912	2020-02-17	P	2	460	0204210201	JHON KAYOI	KAMPUNG SAUYAS	01 	01 	2	1			SUPIORI	0	98573	0	25	\N	CV. BERKAT PAPUA INDAH	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
913	2020-02-17	R	2	453	0204210201	JHON KAYOI	KAMPUNG SAUYAS	01 	01 	2	1			SUPIORI	0	97573	0	25	\N	CV. BERKAT PAPUA INDAH	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
178	2018-02-18	P	2	178	9119	HERMUS BINUR	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	01 	01 	13	2			SUPIORI	0	98573	0	25	\N	CV WARTE STAR	WARBOR RT/RW : - , Warbor , Distrik Supiori Utara Kab./Kota Supiori Kode Pos. 98163	01 	01 	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
914	2020-02-18	R	2	454	0200990303	HERMANUS BINUR	KAMPUNG WARBOR	01 	01 	13	2			SUPIORI	0	98573	0	25	\N	CV.WARTE STAR	KAMPUNG WARBOR	01 	01 	2	13	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
915	2020-02-18	P	2	461	0204320101	ESTER OFIAS	KAMPUNG WAFOR	01 	01 	1	1			SUPIORI	0	98573	0	25	\N	CV.WARMUN JAYA	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
916	2020-02-18	R	1	455	0204320101	ESTER OFIAS	KAMPUNG WAFOR	01 	01 	1	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
917	2020-02-18	P	2	462	0202190701	LALO JUFRI	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV. MAROS JAYA	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
918	2020-02-18	R	2	456	0202190701	LALO JUFRI	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV. MAROS JAYA	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
920	2020-12-17	R	2	457	9106126201950005	ELFIRA FRANSINA KAWER	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV. EVIVANIS STAR	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
921	2020-02-17	P	2	464	0204250201	ARMANDO WAIRARA	KAMPUNG SAUYAS	01 	01 	1	1			SUPIORI	0	98573	0	25	\N	PT.VICTORIUS G.R	KAMPUNG SAUYAS	01 	01 	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
922	2020-02-17	R	2	458	0204250201	ARMANDO WAIRARA	KAMPUNG WAFOR	01 	01 	1	1			SUPIORI	0	98573	0	25	\N	PT.VICTORIUS G.R	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
923	2020-02-17	P	2	465	0200090201	SAMUEL RUMBIAK	KAMPUNG SAUYAS	01 	01 	2	1			SUPIORI	0	98573	0	25	\N	PT. IMANUEL 	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
924	2020-02-17	R	2	459	0200090201	SEMUEL RUMBIAK	KAMPUNG SAUYAS	01 	01 	2	1			SUPIORI	0	98573	0	25	\N	PT. IMANUEL	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
925	2020-02-20	P	2	466	0200920701	ARIST SOMBUK	KAMPUNG SORENDIWERI	002	002	7	1			SUPIORI	0	98573	0	25	\N	CV. YERIMIA PUTRA	KAMPUNG SORENDIWERI	002	002	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
926	2020-02-20	R	2	460	0200290701	ARIST SOMBUK	KAMPUNG SORENDIWERI	002	002	7	1			SUPIORI	0	98573	0	25	\N	CV. YEREMIA PUTRA	KAMPUNG SORENDIWERI	002	002	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
927	2020-02-20	P	2	467	0204322103	MARTHINUS KAFIAR	KAMPUNG MASYAI	002	003	21	3			SUPIORI	0	98573	0	25	\N	CV.MASYAI KURIAKE	KAMPUNG MASYAI	002	003	3	21	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
928	2020-02-20	R	2	461	0204322103	MARTHINUS KAFIAR	KAMPUNG MASYAI	002	003	21	3			SUPIORI	0	98573	0	25	\N	CV. MASYAI PUTRA 	KAMPUNG MASYAI	002	003	3	21	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
929	2020-02-20	P	2	468	0203700701	MELIANUS SANADI	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	RAFFEY SEN WIDI	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
930	2020-02-20	R	2	462	0203700701	MELIANUS SANADI	KMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV,RAFFEYSEN WIDI	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
931	2020-02-20	P	2	469	0204490701	FANNY THALLIA KAFIAR	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV.THALLIA PERSADA	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
932	2020-02-20	R	2	463	0204490701	FANNY THALLIA KAFIAR	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV.THALLIA PERSADA	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
933	2020-02-24	P	2	470	0202250701	SOLAIMAN PERKASA	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV.WARSA PERKASA	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
934	2020-02-24	R	2	464	0202250701	SOLAIMAN PERKASA	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV.WARSA PERKASA	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
936	2020-09-07	R	2	465	0202602404	DUATT E.SILAWANE	KAMPUNG FANINDI	01 	01 	25	4			SUPIORI	0	98573	0	25	\N	CV.SANERARO	KAMPUNG FANINDI	01 	01 	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
938	2020-07-10	P	2	473	734842883954000	MIA MARIA WAMBRAUW	KAMPUNG RAYORI	000	000	33	5			SUPIORI	008219975589	98573	CV.INSORMBORI 83@gmail.com	25	\N	CV. INSORMBORI	KAMPUNG RAYORI	000	000	5	33	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
939	2020-07-10	R	2	466	777	MIA MARIA WAMBRAUW	KAMPUNG RAYORI	000	000	33	5			SUPIORI	082197558966	98573	CV.INSORMBORI 83@gmail.com	25	\N	CV. INSORMBORI	KAMPUNG RAYORI	000	000	5	33	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
223	2018-02-24	P	2	223	9119012707680002	DANIEL RUMBEKWAN	ODORI RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	001	001	23	4			SUPIORI	085254369480	98163	0	25	\N	CV.OMKA	ODORI RT/RW : - , Odori , Distrik Supiori Selatan Kab./Kota Supiori Kode Pos. 98163	001	001	4	23	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
919	2020-12-17	P	2	463	9106126201950005	ELFIRA FRANSINA KAWER	KAMPUNG SORENDIWERI	01 	01 	7	1			SUPIORI	0	98573	0	25	\N	CV. EVIVANIS STAR	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
941	2020-07-10	R	2	467	9119011005880001	REIN ELKANA MAER	KAMPUNG AWAKI	000	000	24	4			SUPIORI	081310637518	98573	0	25	\N	CV. NADI AWIN	KAMPUNG AWAKI	000	000	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
935	2020-02-24	P	2	471	9119012509740001	DUATT ENGELBERTH.SILAWANE 	KAMPUNG FANINDI	000	000	25	4			SUPIORI	085254369480	98573	0	25	\N	CV.SANERARO	KAMPUNG FANINDI	000	000	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
315	2020-06-30	P	2	315	9119056905840001	JULIA KAFIAR	SABARMIOKRE RT/RW : - , Masyai ,\r\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	001	001	21	3			SUPIORI	082399573993	98573	CV.AIMANDO @GMAIL.COM	25	\N	CV.AIMANDO SARISA	SABARMIOKRE RT/RW : - , Masyai ,\r\nDistrik Supiori Barat Kab./Kota SUPIORI Kode Pos. 98163	001	001	3	21	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
942	2020-06-30	R	2	468	9119056905840001	JULIA KAFIAR	KAMPUNG MASYAI	001	001	21	3			SUPIORI	082399573993		CV. AIMANDO SARISA.@MAIL.COM	25	\N	CV. AIMANDO SARISA	KAMPUNG MASYAI	001	001	3	21	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
943	2020-06-30	P	2	475	82225647954000	MARTHEN  MNSIREN	KAMPUNG FANJUR	004	002	11	2			SUPIORI	0	98573	0	25	\N	CV. KAMASAN MAMBEYORI	KAMPUNG FANJUR	004	002	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
944	2020-06-30	R	2	469	822256447954000	MARTHEN MSIREN	KAMPUNG FANJUR	004	002	11	2			SUPIORI	0	98573	0	25	\N	CV.KAMASAN MAMBEYORI	KAMPUNG FANJUR	004	002	2	11	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
940	2020-07-10	P	2	474	9119011005880001	REIN ELKANA MAER	KAMPUNG AWAKI 	000	000	24	4			SUPIORI	081310637518	98573	0	25	\N	CV. NADI AWIN	KAMPUNG AWAKI 	000	000	4	24	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
945	2020-02-26	P	2	476	0204500301	YOHANA A. KAWER	KAMPUNG MARSRAM	000	000	3	1			SUPIORI	0	98573	0	25	\N	CV. SYOWI BIN SOWEK	KAMPUNG MARSRAM	000	000	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
946	2020-02-26	R	2	470	0204500301	YOHANA A. KAWER	KAMPUNG MARSRAM	000	000	3	1			SUPIORI	0	98573	0	25	\N	CV. SYOWI BIN SOWEK	KAMPUNG MARSRAM	000	000	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
947	2020-03-03	P	2	477	0203370201	DOLVINA MANOBI	KAMPUNG SAUYAS	001	001	2	1			SUPIORI	0	98573	0	25	\N	CV. ANDINE JAYA	KAMPUNG SAUYAS	001	001	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
948	2020-03-03	R	2	471	0203370201	DOLFINA  MANOBI	KAMPUNG SAUYAS	001	001	2	1			SUPIORI	0	98573	0	25	\N	CV. ANDINE JAYA	KAMPUNG SAUYAS	001	001	1	2	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
949	2020-03-03	P	2	478	0204590701	ABRAHAM MANSAWAN	KAMPUNG SORENDIWERI	001	001	7	1			SUPIORI	0	98573	0	25	\N	CV. PAPUA BARAKAS	KAMPUNG SORENDIWERI	001	001	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
950	2020-03-03	R	2	472	0204690701	ABRAHAN MANSAWAN	KAMPUNG SORENDIWERI	001	001	7	1			SUPIORI	0	98573	0	25	\N	CV. PAPUA BARAKAS 	KAMPUNG SORENDIWERI	001	001	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
951	2020-03-03	P	2	479	0202710101	AKSAMINA BOSEREN	KAMPUNG WAFOR	000	000	1	1			SUPIORI	0	98573	0	25	\N	CV. ANUGERAH	KAMPUNG WAFOR	000	000	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
952	2020-03-03	R	2	473	0202710101	AKSAMINA BOSEREN	KAMPUNG WAFOR	000	000	1	1			SUPIORI	0	98573	0	25	\N	CV. ANUGERAH	KAMPUNG WAFOR	000	000	1	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
953	2020-03-03	P	2	480	02010620401	FRENGKI WADIWE	KAMPUNG YAWERMA	000	000	4	1			SUPIORI	0	98573	0	25	\N	CV.SUPIORI OF ALL STAR	KAMPUNG YAWERMA	000	000	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
954	2020-03-03	R	2	474	0201620401	FRENGKI WADIWE	KAMPUNG YAWERMA	000	000	4	1			SUPIORI	0	98573	0	25	\N	CV.SUPIORI OF ALL STAR	KAMPUNG YAWERMA	000	000	1	4	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
955	2020-03-03	P	2	481	0204510301	AMIRRUDIN	KAMPUNG MARSRAM	000	000	3	1			SUPIORI	0	98573	0	25	\N	CV. CAHAYA MAKMUR SUPIORI INDAH	KAMPUNG MARSRAM	000	000	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
956	2020-03-03	R	2	475	0204510301	AMIRUDDIN	KAMPUNG MARSRAM	000	000	3	1			SUPIORI	0	98573	0	25	\N	CV.CAHAYA MAKMUR SUPIORI INDAH	KMAPUNG MARSRAM	000	000	1	3	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
957	2020-03-03	P	2	482	0201741402	MARTINUS WABDARON	KAMPUNG PUERI	01 	01 	14	2			SUPIORI	0	98573	0	25	\N	CV. PUERI INDAH	KAMPUNG PUERI	01 	01 	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
958	2020-03-03	R	2	476	0201741402	MARTHINUS WABDARON	KAMPUNG PUWERI	01 	01 	14	2			SUPIORI	0	98573	0	25	\N	CV. PUWERI INDAH	KAMPUNG PUWERI 	01 	01 	2	14	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
345	2020-06-30	P	2	345	817924897954000	SEPTINUS RUMBINO	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	000	000	27	4			SUPIORI	081240343038	98573	KASIH SINAR WARKANA GMAIL@COM.	25	\N	CV.SINAR KASIH	KORIDO RT/RW : - , Maryaidori , Distrik Supiori Selatan Kab./Kota SUPIORI  Kode Pos. 98163	000	000	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
959	2020-06-30	R	2	477	817924897954000	SEPTINUS RUMBINO	KAMPUNG MARYAIDORI	000	000	27	4			SUPIORI	081240343038	98573	KASIH SINAR WARKANA GMAIL@COM.	25	\N	CV.SINAR KASIH	KAMPUNG MARYAIDORI	000	000	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
960	2020-03-03	P	2	483	0204522504	ERNI A. DEFRETES	KAMPUNG FANINDI	000	000	25	4			SUPIORI	0	98573	0	25	\N	CV.ADAIPUMBO	KAMPUNG FANINDI	000	000	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
961	2020-03-03	R	2	478	0204522504	ERNI A. DEFRETES	KAMPUNG FANINDI	000	000	25	4			SUPIORI	0	98573	0	25	\N	CV.ADAIPUMBO	KAMPUNG FANINDI	000	000	4	25	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
962	2020-02-25	P	2	484	0201162904	BASTIAN KAFIAR	KAMPUNG DIDIABOLO	001	001	29	4			SUPIORI	0	98573	0	25	\N	CV. DIRYANO	KAMPUNG DIDIABOLO	001	001	4	29	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
963	2020-02-25	R	2	479	020162904	BASTIAN KAFIAR	KAMPUNG DIDIABOLO	001	001	29	4			SUPIORI	0	98573	0	25	\N	CV. DIRYANO	KAMPUNG DIDIABOLO	001	001	4	29	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
964	2020-02-25	P	2	485	0203712704	LIDIA M.RUMERE	KAMPUNG MARYAIDORI	000	000	27	4			SUPIORI	0	98573	0	25	\N	CV. INSURBEDES	KAMPUNG MARAYAIDORI	000	000	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
965	2020-02-25	R	2	480	0203712704	LIDIA M.RUMERE	KAMPUNG MARYAIDORI	000	000	27	4			SUPIORI	0	98573	0	25	\N	CV.INSURBEDES	KAMPUNG MARYAIDORI	000	000	4	27	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
966	2020-02-25	P	2	486	0203780601	VANTJE WANMA	KAMPUNG DUBER	000	000	6	1			SUPIORI	0	98573	0	25	\N	CV.RAQUEL JAYA	KAMPUNG DUBER	000	000	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
967	2020-02-25	R	2	481	0203780601	VANTJE WANMA	KAMPUNG DUBER	000	000	6	1			SUPIORI	0	98573	0	25	\N	CV.RAQUEL JAYA	KAMPUNG DUBER	000	000	1	6	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
81	2018-01-01	P	2	81		WELMINA MANDRIBO	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	2	\N	\N	SUPIORI		98163	\N	28	\N	TOKO MEKAR	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
937	2020-12-18	P	2	472	0	DANIEL RUMBEKWAN	JL Jensud	0  	0  	3	1			Pulang Pisau	0	98573	0	28	\N	PT Pulang Pisau	JL. SORENDIWERI RAYA	1  	1  	1	7	Pulang Pisau	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
868	2020-12-14	P	2	436	20204523605	MARKUS FAINSENEM	KAMPUNG MANGGONSUN	01 	01 	1	5			SUPIORI	081266677135	98573	0	28	\N	CV.NOROSE STAR	KAMPUNG MANGGONSUAN	01 	01 	5	1	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: t_wpobjek; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_wpobjek (t_idobjek, t_idwp, t_noobjek, t_tgldaftarobjek, t_namaobjekpj, t_alamatobjekpj, t_namaobjek, t_alamatobjek, t_rtobjek, t_rwobjek, t_kecamatanobjek, t_kelurahanobjek, t_kabupatenobjek, t_notelpobjek, t_jenisobjek, t_kodeposobjek, t_latitudeobjek, t_longitudeobjek, t_gambarobjek, t_operatorid, t_korekobjek, t_kamar, t_statusobjek, t_operatoridtutup, t_tipeusaha) FROM stdin;
18	831	9	2020-01-16	JHON PD RAMANDEY	WARYESI	CV MAWAR SHARON	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	0	4					25	\N	\N	t	\N	2
19	832	9	2020-01-16	JHON PD RAMANDEY	WARYESI	CV.MAWAR SHARON	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
20	833	10	2020-01-16	ESTERLITA YM RAMANDEY	WARYESI	CV.BEZALEEL	KAMPUNG WARYESI	   	   	1	8	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
3	819	1	2020-01-16	ESTER Y.M RAMANDEY	KAMPUNG WARYESI	CV.BEZAEEL	KAMPUNG WARYESI	000	00 	1	8	SUPIORI		13	98573				25	\N	\N	t	\N	2
2	818	1	2020-01-16	ESTER Y.M RAMANDEY	KAMPUNG WARYESI	CV.BEZALEEL	WARYESI	000	00 	1	8	SUPIORI		4	98573	0	0		25	\N	\N	t	\N	2
21	834	11	2020-01-20	FELEX WOF	MARYAIDORI	CV WARANAI	KAMPUNG MARYAIDORI	000	00 	4	27	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
22	835	10	2020-01-20	FELEX WOF	MARYAIDORI	CV WARANAI	KAMPUNG MARYAIDORI	000	00 	4	27	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
23	836	12	2020-01-21	JHON WOMSIWOR	SORENDIWERI	CV ORISYUN	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
24	837	11	2020-01-21	JHON WOMSIWOR	SORENDIWERI	CV ORISYUN	SORENDIWERI	000	00 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
25	838	13	2020-01-22	GERSON KORWA	ABABIADI	CV ABABIADI	ABABIADI	000	02 	4	23	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
4	212	2	2020-01-16	JHON P.D RAMANDEY	KAMPUNG WARYESI	CV.MAWAR SHARON	KAMPUNG WARYESI	00 	00 	1	8	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
5	621	2	2020-01-16	JHON P.D RAMANDEY	KAMPUNG WARYESI	MAWAR SARON	KAMPUNG WARYESI	00 	000	1	8	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
6	820	3	2020-01-20	MARINA K. WOSPAKRIK	KAMPUNG KOBARIJAYA	CV.HARAPAN ABADI	KAMPUNG KOBARI JAYA	000	00 	2	12	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
7	821	3	2020-01-16	MARINA K. WOSPAKRIK	KAMPUNG KOBARIJAYA	CV.HARAPAN ABADI	KAMPUNG KOBARI JAYA	000	00 	2	12	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
8	822	4	2020-01-20	LIES LUSIANA KADIWARU	KAMPUNG SORENDIWERI	WARUNG MAKAN	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	13
9	823	4	2020-01-20	LIES LUSIANA KADIWARU	KAMPUNG SORENDIWERI	WARUNG MAKAN	SORENDIWERI	000	00 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	13
10	326	5	2020-01-16	ISAK SEMUEL MANDOSIR	KAMPUNG WARYESI	CV.EVOLET	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
11	824	5	2020-01-16	ISAK SEMUEL MANDOSIR	KAMPUNG WARYESI	CV.EVOLET	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
12	825	6	2020-01-13	MAHMUDI	KAMPUNG SAUYAS	BENGKEL ABADI	KAMPUNG SAUYAS	000	00 	1	2	SUPIORI	0	4	98573				25	\N	\N	t	\N	22
13	826	6	2020-01-13	MAHMUDI	KAMPUNG SAUYAS	BENGKEL ABADI MOTOR	KAMPUNG SAUYAS	000	00 	1	2	SUPIORI	0	13	98573				25	\N	\N	t	\N	27
14	827	7	2020-01-13	MAHMUDI	KAMPUNG SAUYAS	WARUNG MAKAN REJEKI	KAMPUNG SAUYAS	000	00 	1	2	SUPIORI	0	4	98573				25	\N	\N	t	\N	13
15	828	7	2020-01-13	MAHMUDI	KAMPUNG SAUYAS	WARUNG MAKAN REJEKI	KAMPUNG SAUYAS	000	00 	1	2	SUPIORI	0	13	98573				25	\N	\N	t	\N	13
16	829	8	2020-01-13	HENY IRIANI	KAMPUNG FANINDI	KIOS USAHA BARU	KAMPUNG FANINDI	000	00 	4	25	SUPIORI	0	4	9				25	\N	\N	t	\N	34
17	830	8	2020-01-13	HENY IRIANI	KAMPUNG FANINDI	KIOS USAHA BARU	KAMPUNG FANINDI	000	00 	4	25	SUPIORI	0	13	98573				25	\N	\N	t	\N	34
27	840	14	2020-01-22	ASIS	ABABIADI	TOKO MALIKA	KAMPUNG ABABIADI	000	00 	4	23	SUPIORI	0	4	98573				25	\N	\N	t	\N	26
28	841	13	2020-01-22	ASIS	ABABIADI	TOKO MALIKA	KAMPUNG ABABIADI	01 	00 	4	23	SUPIORI	0	13	98573				25	\N	\N	t	\N	26
41	852	21	2020-01-30	ROBERTH V AMSAMSYUM	BINIKI	CV DAMONI STAR	KAMPUNG BINIKI	000	00 	4	28	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
26	839	12	2020-01-22	GERSON KORWA	ABABIADI	CV ABABIADI	ABABIADI	000	00 	4	23	SUPIORI		13	98573				25	\N	\N	t	\N	2
29	842	15	2020-01-22	ASIS	ABABIADI	USAHA BATU TELA 	ABABIADI	01 	02 	4	23	SUPIORI	0	4	98573				25	\N	\N	t	\N	37
30	843	14	2020-01-22	ASIS	ABABIADI	USAHA BATU TELA	KAMPUNG ABABIADI	01 	02 	4	23	SUPIORI	0	13	98573				25	\N	\N	t	\N	37
31	844	16	2020-01-22	ASIS	ABABIADI	PENGECER MINYAK TANAH	KAMPUNG ABABIADI	   	   	4	23	SUPIORI	0	4	98573				25	\N	\N	t	\N	29
32	845	15	2020-01-22	ASIS	ABABIADI	PENGGECER MINYAK TANAH	KAMPUNG ABABIADI	   	   	4	23	SUPIORI	0	13	98573				25	\N	\N	t	\N	29
33	846	17	2020-01-28	JAMES LOIS RONSUMBRE	SORENDIWERI	CV KARYA PAPUA BEFONDI	KAMPUNG SORENDIWERI	01 	00 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
34	847	18	2020-04-01	MULIAWAI	SORENDIWERI	KIOS SEMBAKO MULIAWATI	SORENDIWERI	000	00 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	34
35	848	16	2020-01-28	JAMES LOIS RONSUMBRE	SORENDIWERI	CV KARYA PAPUA BEFONDI	KAMPUNG SORENDIWERI	   	   	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
36	849	17	2020-04-01	MULIAWATI	SORENDIWERI	KIOS SEMBAKO/ MULIAWATI	SORENDIWERI	00 	00 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	34
37	850	19	2020-01-28	ARYANI WOMPERE	SAUYAS	CV SAWABAS INDAH	KAMPUNG SAUYAS	000	00 	1	2	SUPIORI		4	98573				25	\N	\N	t	\N	2
38	851	18	2020-01-28	ARYANI WOMPERE	SAUYAS	CV SAWABAS INDAH	KAMUPUNG SAUYAS	01 	00 	1	2	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
39	853	20	2019-04-01	MULIAWAI	KAMPUNG SORENDIWERI	CV.MULIAWATI	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
40	854	19	2019-04-01	MULIAWAI	KAMPUNG SORENDIWERI	CV. MULIAWATI	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
42	305	22	2019-04-05	SILPA SAREWO	KAMPUNG MARSRAM	CV. SINAR WAKRE	KAMPUNG MARSRAM	000	00 	1	3	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
43	855	20	2020-01-30	ROBERTH V AMSAMSYUM	BINIKI	CV DAMONI STAR	KAMPUNG BINIKI	01 	00 	4	28	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
44	856	23	2020-01-30	DAMARES WAKUM	BINIKI	CV AMPOMBAKEN	KAMPUNG BINIKI	01 	02 	4	28	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
45	857	21	2020-01-30	DAMARES WAKUM	BINIKI	CV AMPOMBAKEN	KAMPUNG BINIKI	000	00 	4	28	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
46	858	22	2019-04-05	SILPA SAWOR	KAMPUNG MARSRAM	SINAR WAKRE	KAMPUNG MARSRAM	000	000	1	3	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
47	859	24	2020-01-30	RAMA SUANI LINGGA	FANINDI	KIOS KELONTONG	KAMPUNG FANINDI	000	00 	4	25	SUPIORI	0	4	98573				25	\N	\N	t	\N	34
48	860	23	2020-01-30	RAMA SUANI LINGGA	FANINDI	KIOS KELONTONG	KAMPUNG FANINDI	000	00 	4	25	SUPIORI	0	13	98573				25	\N	\N	t	\N	34
49	861	25	2020-01-30	GEORGE BARRY HALEDO	WARBEFONDI	CV GERHANA	KAMPUNG WARBEFONDI	000	00 	4	26	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
50	862	24	2020-01-30	GEORGE BARRY HALEDO	WARBEFONDI	CV GERHANA		000	00 	4	26	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
51	863	26	2020-01-30	MILAWATI	SORENDIWERI	KIOS SINAR GOWA	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	34
52	864	25	2020-01-30	MILAWATI	SORENDIWERI	KIOS SINAR GOWA	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	34
53	865	27	2020-01-30	BERNARD KAWER	RAYORI	CV.MELSAN JAYA	KAMPUNG RAYORI	000	00 	5	33	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
54	866	26	2020-01-30	BERNARD KAWER	RAYORI	CV.MELSAN JAYA	KAMPUNG RAYORI	000	00 	5	33	SUPIORI	0	13	9				25	\N	\N	t	\N	2
55	867	28	2020-01-16	MARIANA KRISTINA WOSPAKRIK	KAMPUNG KOBARI JAYA	CV.HARAPAN ABADI	KAMPUNG KOBARI JAYA	000	00 	2	12	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
56	625	27	2020-12-14	MARKUS FAINSENEM	KAMPUNG MANGGONSUAN	CV. NOROSE STAR	KAMPUNG MANGGONSUAN	01 	01 	5	36	SUPIORI	081266677135	13	98573				25	\N	\N	t	\N	2
57	868	29	2020-01-13	MARKUS FAINSENEM	KAMPUNG MANGGONSUAN	CV. NOROSE STAR	KAMPUNG MANGGONSUAN	   	   	5	36	SUPIORI	081266677135	4	98573				25	\N	\N	t	\N	2
58	869	30	2020-01-13	MAHMUDI	KAMPUNG SAUYAS	BENGKEL ABADI MOTOR	KAMPUNG SAUYAS	000	00 	1	2	SUPIORI	0	4	98573				25	\N	\N	t	\N	27
59	870	31	2020-01-13	MAHMUDI	KAMPUNG SAUYAS	WARUNG MAKAN REJEKI	KAMPUNG SAUYAS	000	00 	1	2	SUPIORI	0	4	98573				25	\N	\N	t	\N	13
60	871	32	2020-01-13	HENY IRIANI	KAMPUNG FANINDI	KIOS USAHA BARU	KAMPUNG FANINDI	000	00 	4	25	SUPIORI	0	4	98573				25	\N	\N	t	\N	34
61	872	33	2020-01-16	JHON RAMANDEY	KAMPUNG WARYESI	CV.MAWAR SHARON	KAMPUNG SAUYAS	000	00 	1	8	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
62	873	28	2020-01-16	JHON RAMANDEY	KAMPUNG WARYESI	CV. MAWAR SHARON	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
63	874	34	2020-01-16	ESTERLITA YM. RAMANDEY	KAMPUNG WARYESI	CV. BAZALEEL	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
64	875	35	2020-01-20	FELEX WOF	KAMPUNG MARYAIDORI	CV. WARANAI	KAMPUNG MARYAIDORI	000	00 	4	27	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
65	876	29	2020-01-20	FELEX WOF	KAMPUNG MARYAIDORI	CV. WARANAI	KAMPUNG MARYAIDORI	000	00 	4	27	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
66	877	36	2020-01-20	LIES LUSIANA KADIWARU	KAMPUNG SORENDIWERI	WARUNG MAKAN GRACE TAMA	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	081266677135	4	98573				25	\N	\N	t	\N	13
67	878	30	2020-01-20	LIES LUSIANA KADIWARU	KAMPUNG SORENDIWERI	WARUNG MAKAN GRACE TAMA	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	13
68	879	37	2020-01-21	JHON WOMSIWOR	KAMPUNG SORENDIWERI	CV. ORISYUN	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
69	880	31	2020-01-21	JHON WOMSIWOR	KAMPUNG SORENDIWERI	CV. ORISYUN	KAMPUNG SORENDIWERI	000	00 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
70	881	38	2020-02-18	ADOLOF MSIREN	KAMPUNG FANJUR	CV. FAJAR UTARA	KAMPUNG FANJUR	000	00 	2	11	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
71	882	32	2020-02-18	ADOLOF MSIREN	KAMAPUNG FANJUR	CV. FAJAR UTARA	KAMPUNG FANJUR	000	00 	2	11	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
72	883	39	2020-02-19	GELVIN POMBOS	KAMPUNG WAFOR	CV. SONAI BARAKAS	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
73	884	33	2020-02-19	GELVIN POMBOS	KAMPUNG WAFOR	CV. SONAI BARAKAS	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
74	885	40	2020-01-30	RAMA SUANI LINGGA	KAMPUNG FANINDI	KIOS KELONTONG	KAMPUNG FANINDI	01 	01 	4	25	SUPIORI	0	4	98573				25	\N	\N	t	\N	34
75	886	41	2020-02-10	ROSITA SADA	KAMPUNG ODORI	0204422304	CV.AUDREY	01 	01 	4	23	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
76	887	42	2020-02-11	BURHANUDDIN	KAMPUNG SORENDIWERI	CV. ZALIKA ENGINEE	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
77	888	34	2020-02-11	BURHANUDDIN,P	KAMPUNG SORENDIWERI	CV.ZALIKA ENGINEE	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
78	889	43	2020-02-11	HAPLI SIPARE	KAMPUNG WAYORI	KIOS ANUGERAH SEJATI	KAMPUNG WAYORI	01 	01 	3	18	SUPIORI	0	4	98573				25	\N	\N	t	\N	34
79	890	35	2020-02-11	HAPLI SIPARE	KAMPUNG WAYORI	KIOS ANUGERAH SEJATI	KAMPUNG WAYORI	01 	01 	3	18	SUPIORI	0	13	98573				25	\N	\N	t	\N	34
80	891	44	2020-02-11	AYARI DONDAIFI PAPARE	KAMPUNG SAUYAS	CV.AYIN PAPUA	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
81	892	36	2020-02-11	AYARI DONDAIFI PAPARE	KAMPUNG SAUYAS	CV.AYIN PAPUA	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
82	893	45	2020-02-12	FONI RUMAYAUW	KAMPUNG SORENDIWERI	CV ENDREY	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
83	894	37	2020-02-12	FONI RUMAYAUW	KAMPUNG SORENDIWERI	CV.ENDREY	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
84	895	46	2020-02-17	YUSTINUS REJAUW	KAMPUNG MARSRAM	CV. MANDAUW SIWOSI	KAMPUNG MARSRAM	01 	01 	1	3	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
85	896	38	2020-02-17	YUSTINUS REJAUW	KAMPUNG MARSRAM	CV. MANDAUW SIWOSI	KAMPUNG MARSRAM	01 	01 	1	3	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
86	897	47	2020-02-17	DEREK A RUMBARAR	KAMPUNG SAUYAS	CV.PAPUA ANUGERAH JAYA	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
87	898	39	2020-02-17	DEREK A. RUMBARAR	KAMPUNG SAUYAS	CV. PAPUA ANUGERAH JAYA	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
88	899	48	2020-02-17	DAVID SAMUEL MANSOBEN	KAMPUNG SORENDIWERI	CV. BONSFORI PORES SUPIORI	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
89	900	40	2020-02-17	DAVID SAMUEL MANSOBEN	KAMPUNG SORENDIWERI	CV. BONSFORI PORES SUPIORI	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
90	901	49	2020-02-17	FERDINAND WAMBRAUW	KAMPUNG SORENDIWERI	CV.ROMOS	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
91	902	41	2020-02-17	FERDINAND WAMBRAUW	KAMPUNG SORENDIWERI	CV.ROMOS	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
92	555	1	2020-12-17	a	a	Minerba	s	00 	00 	1	2	SUPIORI	4	6	2				28	\N	\N	t	\N	2
93	903	50	2020-02-17	ARMANDO WAIRARA	KAMPUNG SAUYAS	PT. VICTORIUS G.R	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	0	4	98573				25	\N	\N	t	\N	1
94	904	42	2020-02-17	ARMANDO WAIRARA	KAMPUNG SAUYAS	PT. VICTORIA G.R	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	0	13	98573				25	\N	\N	t	\N	1
95	905	51	2020-06-01	FILDA FELIKSINA RUMBEWAS	KAMPUNG DUBER	CV. SOTERIO	KAMPUNG DUBER	003	002	1	6	SUPIORI	081344224647	4	98573				25	\N	\N	t	\N	2
96	906	43	2020-07-21	FILDA FELIKSINA RUMBEWAS	KAMPUNG DUBER	CV. SOTERIO	KAMPUNG DUBER	003	002	1	6	SUPIORI	081344224647	13	98573				25	\N	\N	t	\N	2
97	223	52	2020-07-24	DANIEL RUMBEKWAN	KAMPUNG ODORI	CV.OMKA	KAMPUNG ODORI	003	002	4	23	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
98	907	44	2020-07-24	DANIEL RUMBEKWAN	KAMPUNG ODORI	CV. OMKA	KAMPUNG ODORI	003	002	4	23	SUPIORI	085254369480	13	98573				25	\N	\N	t	\N	2
99	908	53	2020-02-17	NELES WARFANDU	KAMPUNG WAFOR	CV.WAFOR INDAH	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
100	909	45	2020-02-17	NELES WARFANDU	KAMPUNG WAFOR	CV. WAFOR INDH	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
101	910	54	2020-02-17	RICKY YAKOB RUMKOREM	KAMPUNG SAUYAS	CV.BINTANG PERSADA	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
102	911	46	2020-02-17	RICKY YAKOB RUMKOREM	KAMPUNG SAUYAS	CV.BINTANG PERSADA	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
103	912	55	2020-02-17	JHON KAYOI	KAMPUNG SAUYAS	CV.BERKAT PAPUA INDAH	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
104	913	47	2020-02-17	JHON KAYOI	KAMPUNG SAUYAS	CV. BERKAT PAPUA INDAH	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
105	178	56	2020-02-18	HERMANUS BINUR	KAMPUNG WARBOR	CV.WARTE STAR	KAMPUNG WARBOR	01 	01 	2	13	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
106	914	48	2020-02-18	HERMANUS BINUR	KAMPUNG WARBOR	CV.WARTE STAR	KAMPUNG WARBOR	01 	01 	2	13	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
107	915	57	2020-02-18	ESTER OFIAS	KAMPUNG WAFOR	CV.WARMUN JAYA	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
108	916	49	2020-02-18	ESTER OFIAS	KAMPUNG WAFOR	CV.WARMUN JAYA	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
109	917	58	2020-02-18	LALO JUFRI	KAMPUNG SORENDIWERI	CV. LALO JUFRI	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
110	918	50	2020-02-18	LALO JUFRI	KAMPUNG SORENDIWERI	CV. MAROS JAYA	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
112	920	51	2020-12-17	ELFIRA FRANSINA KAWER	KAMPUNG SORENDIWERI	CV.EVIVANIS STAR	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
113	919	2	2020-12-01	EVIVANIS STAR	Sorendiweri	CV. EVIVANIS STAR MINERBA	Sorendiweri	00 	00 	1	1	SUPIORI	0856359797	6	98163				28	\N	\N	t	\N	2
114	921	60	2020-02-17	ARMANDO WAIRARA	KAMPUNG WAFOR	PT.VICTORIOUS G.R	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	0	4	98573				25	\N	\N	t	\N	1
115	922	52	2020-02-17	ARMANDO WAIRARA	KAMPUNG WAFOR	PT. VICTORIOUS G.R	KAMPUNG WAFOR	01 	01 	1	1	SUPIORI	0	13	98573				25	\N	\N	t	\N	1
116	923	61	2020-02-17	SEMUEL RUMBIAK	KAMPUNG SAUYAS	PT. IMANUEL	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	0	4	98573				25	\N	\N	t	\N	1
117	924	53	2020-02-17	SEMUEL RUMBIAK	KAMPUNG SAUYAS	PT. IMANUEL	KAMPUNG SAUYAS	01 	01 	1	2	SUPIORI	0	13	98573				25	\N	\N	t	\N	1
118	925	62	2020-02-20	ARIST SOMBUK	KAMPUNG SORENDIWERI	CV. YEREMIA PUTRA	KAMPUNG SORENDIWERI	002	002	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
119	926	54	2020-02-20	ARIST SOMBUK	KAMPUNG SORENDIWERI	CV. YEREMIA PUTRA	KAMPUNG SORENDIWERI	002	002	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
120	927	63	2020-02-20	MARTHINUS KAFIAR	KAMPUNG MASYAI	CV. MASYAI KURIAKE	KAMPUNG MASYAI	002	003	3	21	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
121	928	55	2020-02-20	MARTHINUS KAFIAR	KAMPUNG MASYAI	CV. MASYAI KURIAKE	KAMPUNG MASYAI	002	003	3	21	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
122	929	64	2020-02-20	MELIANUS SANADI	KAMPUNG SORENDIWERI	CV.RAFFEY SEN WIDI	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
123	930	56	2020-02-20	MELIANUS SANADI	KAMPUNG SORENDIWERI	CV,RAFFEYSEN WIDI	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
124	931	65	2020-02-20	FANNY THALLIA KAFIAR	KAMPUNG SORENDIWERI	CV.THALLIA PERSADA	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
125	932	57	2020-02-20	FANNY THALLIA KAFIAR	KAMPUNG SORENDIWERI	CV.THALLIA PERSADA	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
126	933	66	2020-02-24	SOLAIMAN PERKASA	KAMPUNG SORENDIWERI	CV.WARSA PERKASA	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
127	934	58	2020-02-24	SOLAIMAN PERKASA	KAMPUNG SORENDIWERI	CV.WARSA PERSADA	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
128	935	67	2020-02-24	DUATT E.SILAWANE	KAMPUNG FANINDI	CV.SANERARO	KAMPUNG FANINDI	01 	01 	4	25	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
130	936	59	2020-09-07	AKHMA PAUJI	KAMPUNG FANINDI	CV. SANERARO	KAMPUNG FANINDI	002	002	4	25	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
131	938	68	2020-07-10	MIA MARIA WAMBRAUW	KAMPUNG RAYORI	CV.INSORMBORI	KAMPUNG RAYORI	000	000	5	33	SUPIORI	082197558966	4	98573				25	\N	\N	t	\N	2
132	940	69	2020-07-10	REIN ELKANA MAER 	KAMPUNG AWAKI	CV. NADI AWIN 	KAMPUNG AWAKI	000	000	4	24	SUPIORI	081310637518	4	98573				25	\N	\N	t	\N	2
133	941	60	2020-07-10	REIN ELKANA MAER	KAMPUNG AWAKI	CV. NADI AWIN	KAMPUNG AWAKI	000	000	4	24	SUPIORI	081310637518	13	98573				25	\N	\N	t	\N	2
134	315	70	2020-06-30	JULIA KAFIAR	KAMPUNG MASYAI	CV. AIMANDO SARISA	KAMPUNG MASYAI	001	001	3	21	SUPIORI	082399573993	4	98573				25	\N	\N	t	\N	2
135	942	61	2020-06-30	JULIA KAFIAR	KAMPUNG MASYAI	CV. AIMANDO SARISA	KAMPUNG MASYAI	001	001	3	21	SUPIORI	082399573993	13	98573				25	\N	\N	t	\N	2
136	943	71	2020-06-30	MARTHEN MSIREN	KAMPUNG FANJUR	CV. KAMASAN MAMBEYORI	KAMPUNG FANJUR	004	002	2	11	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
137	944	62	2020-06-30	MARTHEN MSIREN	KAMPUNG FANJUR	CV. KAMASAN MABEYORI	KAMPUNG FANJUR	004	002	2	11	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
138	945	72	2020-02-26	YOHANA A. KAWER	KAMPUNG MARSRAM	CV.SYOWI BIN SOWEK	KAMPUNG MARSRAM	000	000	1	3	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
139	946	63	2020-02-26	YOHANA A KAWER	'KAMPUNG MARSRAM	CV. SYOWI BIN SOWEK	KAMPUNG MARSRAM	000	000	1	3	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
140	947	73	2020-03-03	DOLFINA MANOBI	KAMPUNG SAUYAS	CV. ANDINE JAYA	KAMPUNG SAUYAS	001	001	1	2	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
111	919	59	2021-02-01	ELVIRA FRANSISKA KAWER	KAMPUNG SORENDIWERI	CV. EVIVANIS STAR	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI		4	98573				28	\N	\N	t	\N	2
141	948	64	2020-03-03	DOLFINA MANOBA	KAMPUNG SAUYAS	CV. ANDINE JAYA	KAMPUNG SAUYAS	001	001	1	2	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
143	950	65	2020-03-03	ABRAHAM MANSAWAN	KAMPUNG SORENDIWERI	CV. PAPUA BARAKAS	KAMPUNG SORENDIWERIU	001	001	1	7	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
144	951	75	2020-03-03	AKSAMINA BOSEREN	KAMPUNG WAFOR	CV.ANUGERAH	KAMPUNG WAFOR	000	000	1	1	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
145	952	66	2020-03-03	AKSAMINA BOSEREN	KAMPUNG WAFOR	CV. ANUGERAH	KAMPUNG WAFOR	000	000	1	1	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
146	953	76	2020-03-03	FRENGKI WADIWE	KAMPUNG YAWERMA	CV. SUPIORI OF NASIAN ALL STAR	KAMPUNG YAWERMA	000	000	1	4	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
147	954	67	2020-03-03	FRENGKI WADIWE	KAMPUNG YAWERMA	CV. SUPIORI	KAMPUNG YAWERMA	000	000	1	4	SUPIORI	0	13					25	\N	\N	t	\N	2
148	955	77	2020-03-03	AMIRRUDIN	KAMPUNG MARSRAM	CV.CAHAYA MAKMUR SUPIORI INDAH	KAMPUNG MARSRAM	000	000	1	3	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
149	956	68	2020-03-03	AMIRUDDIN 	KAMPUNG MARSRAM	CV.CAHAYA MAKMUR SUPIORI INDAH	KAMPUNG MARSRAM	000	000	1	3	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
150	957	78	2020-03-03	MARTHINUS WABDARON	KAMPUNG PUWERI	CV.PUWERI INDAH	KAMPUNG PUWERI	01 	01 	2	14	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
151	958	69	2020-03-03	MARTHINUS WABDARON	KAMPUNG PUWERI	CV.PUWERI INDAH	KAMPUNG PUWERI	01 	01 	2	14	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
152	345	79	2020-06-30	SEPTINUS RUMBINO	KAMPUNG MARYAIDORI	CV. SINAR KASIH	KAMPUNG MARYAIDORI	000	000	4	27	SUPIORI	081240343038	4	98573				25	\N	\N	t	\N	2
153	959	70	2020-06-30	SEPTINUS RUMBINO	KAMPUNG MARYAIDORI	CV. SINAR KASIH	KAMPUNG MARYAIDORI	000	000	4	27	SUPIORI	081240343038	13	98573				25	\N	\N	t	\N	2
154	960	80	2020-03-03	ERNI A.DEFRETES	KAMPUNG FANINDI	CV.ADAIPUMBO	KAMPUNG FANINDI	000	000	4	25	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
155	961	71	2020-03-03	ERNI A DEFRETES	KAMPUNG FANINDI	CV. ADAIPUMBO	KAMPUNG FANINDI	000	000	4	25	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
156	962	81	2020-02-25	BASTIAN KAFIAR	KAMPUNG DIDIABOLO	CV. DIRYANO	KAMPUNG DIDIABOLO	001	001	4	29	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
157	963	72	2020-02-25	BASTIAN KAFIAR	KAMPUNG DIDIABOLO	CV. DIRYANO	KAMPUNG DIDIABOLO	001	001	4	29	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
158	964	82	2020-02-25	LIDIA M. RUMERE	KAMPUNG MARYAIDORI	CV. INSURBEDES	KAMPUNG MARYAIDORI	000	000	4	27	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
159	965	73	2020-02-25	LIDIA M. RUMERE	KAMPUNG MARYAIDORI	CV.INSURBEDES	KAMPUNG MARYAIDORI	000	000	4	27	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
160	966	83	2020-02-25	VANTJE WANMA	KAMPUNG DUBER	CV. RAQUEL JAYA	KAMPUNG DUBER	000	000	1	6	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
161	967	74	2020-02-25	VANTJE WANMA	KAMPUNG DUBER	CV.RAQUEL JAYA	KAMPUNG DUBER	000	000	1	6	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
162	937	2	2021-02-10	Budi	Pulang Pisau	Hotel Mawar	Jl.jendeal soedirman	1  	1  	3	1	Pulang Pisau		1	5432				28	6	\N	t	\N	1
129	937	3	2020-12-18	DANIEL RUMBEKWAN	JL. SORENDIWERI	CV. OMKA	JL. SORENDIWERI RAYA	   	   	1	7	Pulang Pisau		6	0				28	86	\N	t	\N	2
163	949	3	2021-03-16	Hufron	JL. SORENDIWERI	Hotel Bunga	JL. SORENDIWERI RAYA	   	   	9	9	Pulang Pisau		1	54343				28	5	\N	t	\N	5
142	949	74	2020-03-03	ABRAHAM MANSAWAN	KAMPUNG SORENDIWERI	CV. PAPUA BARAKAS	KAMPUNG SORENDIWERI	001	001	1	7	SUPIORI		4	98573				28	60	\N	t	\N	2
164	10	4	2021-01-01	Rudy	Tangerang	Hotel ABC	Jl Jalanan	1  	1  	6	5	Pulang Pisau		1	54354				28	5	\N	t	\N	1
165	868	1	2021-03-16	Yadi	jl.jensud ajb	PPJ	Jl.jendeal soedirman	   	   	13	6	Pulang Pisau		5					28	\N	\N	t	\N	6
166	937	1	2021-02-12	Andi		PDAM	Jl.jendeal soedirman	01 	01 	4	2	Pulang Pisau		8					28	82	\N	t	\N	1
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

SELECT pg_catalog.setval('public.s_pejabat_seq', 9, true);


--
-- Name: s_pemda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_pemda_seq', 1, false);


--
-- Name: s_rekening_s_idkorek_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_rekening_s_idkorek_seq', 231, true);


--
-- Name: s_rekening_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_rekening_seq', 2, true);


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

SELECT pg_catalog.setval('public.s_target_seq', 4, true);


--
-- Name: s_targetdetail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_targetdetail_seq', 88, true);


--
-- Name: s_targetjenis_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_targetjenis_seq', 1, false);


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

SELECT pg_catalog.setval('public.s_users_seq', 15, true);


--
-- Name: t_angsuran_t_idangsuran_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_angsuran_t_idangsuran_seq', 5, true);


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

SELECT pg_catalog.setval('public.t_detailair_t_idair_seq', 4, true);


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

SELECT pg_catalog.setval('public.t_detailkebersihan_t_idkebersihan_seq', 60, true);


--
-- Name: t_detailkekayaan_t_idkekayaan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailkekayaan_t_idkekayaan_seq', 1, false);


--
-- Name: t_detailkir_t_iddetailkir_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailkir_t_iddetailkir_seq', 1, false);


--
-- Name: t_detailminerba_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailminerba_seq', 46, true);


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

SELECT pg_catalog.setval('public.t_detailpasar_t_idpasar_seq', 1, false);


--
-- Name: t_detailpasargrosir_t_idpasargrosir_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_detailpasargrosir_t_idpasargrosir_seq', 1, false);


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

SELECT pg_catalog.setval('public.t_detailreklame_t_iddetailreklame_seq', 87, true);


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

SELECT pg_catalog.setval('public.t_keberatan_t_idkeberatan_seq', 1, false);


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

SELECT pg_catalog.setval('public.t_setoranlain_t_idsetoranlain_seq', 10, true);


--
-- Name: t_setoranlain_t_nomorurut_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_setoranlain_t_nomorurut_seq', 10, true);


--
-- Name: t_setorbankdetail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_setorbankdetail_seq', 2, true);


--
-- Name: t_setorbankheader_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_setorbankheader_seq', 1, true);


--
-- Name: t_skpdkb_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_skpdkb_seq', 2, true);


--
-- Name: t_skpdkbt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_skpdkbt_seq', 1, true);


--
-- Name: t_skpdlb_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_skpdlb_seq', 1, false);


--
-- Name: t_skpdn_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_skpdn_seq', 1, true);


--
-- Name: t_skpdt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_skpdt_seq', 5, true);


--
-- Name: t_suratkesanggupan_t_idsurat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_suratkesanggupan_t_idsurat_seq', 1, false);


--
-- Name: t_teguranlaporpajak_t_idteguran_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_teguranlaporpajak_t_idteguran_seq', 1, true);


--
-- Name: t_transaksi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_transaksi_seq', 146, true);


--
-- Name: t_wp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_wp_seq', 967, true);


--
-- Name: t_wpobjek_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_wpobjek_seq', 198, true);


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
-- Name: t_transaksi t_transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_transaksi
    ADD CONSTRAINT t_transaksi_pkey PRIMARY KEY (t_idtransaksi);


--
-- PostgreSQL database dump complete
--

