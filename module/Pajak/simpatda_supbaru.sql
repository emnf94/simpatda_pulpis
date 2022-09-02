--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: dblink_pkey_results; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE dblink_pkey_results AS (
);


ALTER TYPE public.dblink_pkey_results OWNER TO postgres;

--
-- Name: dblink(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text) OWNER TO postgres;

--
-- Name: dblink(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text, boolean) OWNER TO postgres;

--
-- Name: dblink(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text, text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text, text) OWNER TO postgres;

--
-- Name: dblink(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text, text, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_record';


ALTER FUNCTION public.dblink(text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_build_sql_delete(text, int2vector, integer, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_build_sql_delete(text, int2vector, integer, text[]) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_build_sql_delete';


ALTER FUNCTION public.dblink_build_sql_delete(text, int2vector, integer, text[]) OWNER TO postgres;

--
-- Name: dblink_build_sql_insert(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_build_sql_insert(text, int2vector, integer, text[], text[]) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_build_sql_insert';


ALTER FUNCTION public.dblink_build_sql_insert(text, int2vector, integer, text[], text[]) OWNER TO postgres;

--
-- Name: dblink_build_sql_update(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_build_sql_update(text, int2vector, integer, text[], text[]) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_build_sql_update';


ALTER FUNCTION public.dblink_build_sql_update(text, int2vector, integer, text[], text[]) OWNER TO postgres;

--
-- Name: dblink_cancel_query(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_cancel_query(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_cancel_query';


ALTER FUNCTION public.dblink_cancel_query(text) OWNER TO postgres;

--
-- Name: dblink_close(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text) OWNER TO postgres;

--
-- Name: dblink_close(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text, boolean) OWNER TO postgres;

--
-- Name: dblink_close(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text, text) OWNER TO postgres;

--
-- Name: dblink_close(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_close';


ALTER FUNCTION public.dblink_close(text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_connect(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_connect(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect(text) OWNER TO postgres;

--
-- Name: dblink_connect(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_connect(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect(text, text) OWNER TO postgres;

--
-- Name: dblink_connect_u(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_connect_u(text) RETURNS text
    LANGUAGE c STRICT SECURITY DEFINER
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect_u(text) OWNER TO postgres;

--
-- Name: dblink_connect_u(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_connect_u(text, text) RETURNS text
    LANGUAGE c STRICT SECURITY DEFINER
    AS '$libdir/dblink', 'dblink_connect';


ALTER FUNCTION public.dblink_connect_u(text, text) OWNER TO postgres;

--
-- Name: dblink_current_query(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_current_query() RETURNS text
    LANGUAGE c
    AS '$libdir/dblink', 'dblink_current_query';


ALTER FUNCTION public.dblink_current_query() OWNER TO postgres;

--
-- Name: dblink_disconnect(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_disconnect() RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_disconnect';


ALTER FUNCTION public.dblink_disconnect() OWNER TO postgres;

--
-- Name: dblink_disconnect(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_disconnect(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_disconnect';


ALTER FUNCTION public.dblink_disconnect(text) OWNER TO postgres;

--
-- Name: dblink_error_message(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_error_message(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_error_message';


ALTER FUNCTION public.dblink_error_message(text) OWNER TO postgres;

--
-- Name: dblink_exec(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text) OWNER TO postgres;

--
-- Name: dblink_exec(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text, boolean) OWNER TO postgres;

--
-- Name: dblink_exec(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text, text) OWNER TO postgres;

--
-- Name: dblink_exec(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_exec';


ALTER FUNCTION public.dblink_exec(text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_fetch(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, integer) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, integer) OWNER TO postgres;

--
-- Name: dblink_fetch(text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, integer, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, integer, boolean) OWNER TO postgres;

--
-- Name: dblink_fetch(text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, text, integer) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, text, integer) OWNER TO postgres;

--
-- Name: dblink_fetch(text, text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, text, integer, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_fetch';


ALTER FUNCTION public.dblink_fetch(text, text, integer, boolean) OWNER TO postgres;

--
-- Name: dblink_get_connections(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_connections() RETURNS text[]
    LANGUAGE c
    AS '$libdir/dblink', 'dblink_get_connections';


ALTER FUNCTION public.dblink_get_connections() OWNER TO postgres;

--
-- Name: dblink_get_notify(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_notify(OUT notify_name text, OUT be_pid integer, OUT extra text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_notify';


ALTER FUNCTION public.dblink_get_notify(OUT notify_name text, OUT be_pid integer, OUT extra text) OWNER TO postgres;

--
-- Name: dblink_get_notify(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_notify(conname text, OUT notify_name text, OUT be_pid integer, OUT extra text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_notify';


ALTER FUNCTION public.dblink_get_notify(conname text, OUT notify_name text, OUT be_pid integer, OUT extra text) OWNER TO postgres;

--
-- Name: dblink_get_pkey(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_pkey(text) RETURNS SETOF dblink_pkey_results
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_pkey';


ALTER FUNCTION public.dblink_get_pkey(text) OWNER TO postgres;

--
-- Name: dblink_get_result(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_result(text) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_result';


ALTER FUNCTION public.dblink_get_result(text) OWNER TO postgres;

--
-- Name: dblink_get_result(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_result(text, boolean) RETURNS SETOF record
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_get_result';


ALTER FUNCTION public.dblink_get_result(text, boolean) OWNER TO postgres;

--
-- Name: dblink_is_busy(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_is_busy(text) RETURNS integer
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_is_busy';


ALTER FUNCTION public.dblink_is_busy(text) OWNER TO postgres;

--
-- Name: dblink_open(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text) OWNER TO postgres;

--
-- Name: dblink_open(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_open(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text, text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text, text) OWNER TO postgres;

--
-- Name: dblink_open(text, text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text, text, boolean) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_open';


ALTER FUNCTION public.dblink_open(text, text, text, boolean) OWNER TO postgres;

--
-- Name: dblink_send_query(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_send_query(text, text) RETURNS integer
    LANGUAGE c STRICT
    AS '$libdir/dblink', 'dblink_send_query';


ALTER FUNCTION public.dblink_send_query(text, text) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: coba; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE coba (
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

CREATE SEQUENCE permission_id_seq
    START WITH 420
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_id_seq OWNER TO postgres;

--
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permission (
    id bigint DEFAULT nextval('permission_id_seq'::regclass) NOT NULL,
    permission_name character varying(45) NOT NULL,
    resource_id bigint NOT NULL,
    alias character varying(255),
    permission_role character varying(255)
);


ALTER TABLE public.permission OWNER TO postgres;

--
-- Name: permission_resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permission_resource (
    s_iduser integer,
    s_idpermission integer
);


ALTER TABLE public.permission_resource OWNER TO postgres;

--
-- Name: rekam_penyetoran_ke_bank_rektorkebank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rekam_penyetoran_ke_bank_rektorkebank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rekam_penyetoran_ke_bank_rektorkebank_id_seq OWNER TO postgres;

--
-- Name: resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_id_seq
    START WITH 34
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_id_seq OWNER TO postgres;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource (
    id bigint DEFAULT nextval('resource_id_seq'::regclass) NOT NULL,
    resource_name character varying(255) NOT NULL
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- Name: role_rid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_rid_seq
    START WITH 7
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_rid_seq OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role (
    rid bigint DEFAULT nextval('role_rid_seq'::regclass) NOT NULL,
    role_name character varying(60) NOT NULL,
    status character(255) DEFAULT 'Active'::bpchar NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: s_air_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_air_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_air_seq OWNER TO postgres;

--
-- Name: s_air; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_air (
    s_idair integer DEFAULT nextval('s_air_seq'::regclass) NOT NULL,
    s_peruntukan character varying(100) NOT NULL,
    s_nilai1 double precision DEFAULT 0,
    s_nilai2 double precision DEFAULT 0,
    s_nilai3 double precision DEFAULT 0,
    s_nilai4 double precision DEFAULT 0,
    s_nilai5 double precision DEFAULT 0,
    s_nilai6 double precision DEFAULT 0,
    s_nilai7 double precision DEFAULT 0
);


ALTER TABLE public.s_air OWNER TO postgres;

--
-- Name: s_air_jenis_s_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_air_jenis_s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_air_jenis_s_id_seq OWNER TO postgres;

--
-- Name: s_air_jenis; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_air_jenis (
    s_id integer DEFAULT nextval('s_air_jenis_s_id_seq'::regclass) NOT NULL,
    s_idkelompok integer NOT NULL,
    s_nourut integer NOT NULL,
    s_deskripsi character varying(100) NOT NULL
);


ALTER TABLE public.s_air_jenis OWNER TO postgres;

--
-- Name: s_air_kelompok_s_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_air_kelompok_s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_air_kelompok_s_id_seq OWNER TO postgres;

--
-- Name: s_air_kelompok; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_air_kelompok (
    s_id integer DEFAULT nextval('s_air_kelompok_s_id_seq'::regclass) NOT NULL,
    s_kode character varying(10) NOT NULL,
    s_deskripsi character varying(100) NOT NULL
);


ALTER TABLE public.s_air_kelompok OWNER TO postgres;

--
-- Name: s_air_tarif_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_air_tarif_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_air_tarif_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_air_tarif; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_air_tarif (
    s_idtarif integer DEFAULT nextval('s_air_tarif_s_idtarif_seq'::regclass) NOT NULL,
    s_idkelompok integer NOT NULL,
    s_nilai1 integer NOT NULL,
    s_nilai2 integer NOT NULL,
    s_nilai3 integer NOT NULL,
    s_nilai4 integer NOT NULL,
    s_nilai5 integer NOT NULL,
    s_nilai6 integer NOT NULL,
    s_nilai7 integer NOT NULL
);


ALTER TABLE public.s_air_tarif OWNER TO postgres;

--
-- Name: s_air_tarifpipa_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_air_tarifpipa_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_air_tarifpipa_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_air_tarifpipa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_air_tarifpipa (
    s_idtarif integer DEFAULT nextval('s_air_tarifpipa_s_idtarif_seq'::regclass) NOT NULL,
    s_idkelompok integer NOT NULL,
    s_pipa1 integer NOT NULL,
    s_pipa2 integer NOT NULL,
    s_pipa3 integer NOT NULL,
    s_pipa4 integer NOT NULL,
    s_pipa5 integer NOT NULL,
    s_pipa6 integer NOT NULL,
    s_pipa7 integer NOT NULL
);


ALTER TABLE public.s_air_tarifpipa OWNER TO postgres;

--
-- Name: s_air_zona_s_idzona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_air_zona_s_idzona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_air_zona_s_idzona_seq OWNER TO postgres;

--
-- Name: s_air_zona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_air_zona (
    s_idzona integer DEFAULT nextval('s_air_zona_s_idzona_seq'::regclass) NOT NULL,
    s_kode character varying(10) NOT NULL,
    s_deskripsi character varying(100) NOT NULL
);


ALTER TABLE public.s_air_zona OWNER TO postgres;

--
-- Name: s_cekungan_s_idcekungan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_cekungan_s_idcekungan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_cekungan_s_idcekungan_seq OWNER TO postgres;

--
-- Name: s_cekungan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_cekungan (
    s_idcekungan integer DEFAULT nextval('s_cekungan_s_idcekungan_seq'::regclass) NOT NULL,
    s_kriteria character varying(255) NOT NULL,
    s_nilai integer NOT NULL
);


ALTER TABLE public.s_cekungan OWNER TO postgres;

--
-- Name: s_faktorkerusakan_s_idkerusakan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_faktorkerusakan_s_idkerusakan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_faktorkerusakan_s_idkerusakan_seq OWNER TO postgres;

--
-- Name: s_faktorkerusakan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_faktorkerusakan (
    s_idkerusakan integer DEFAULT nextval('s_faktorkerusakan_s_idkerusakan_seq'::regclass) NOT NULL,
    s_kriteria character varying(255) NOT NULL,
    s_nilai integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.s_faktorkerusakan OWNER TO postgres;

--
-- Name: s_faktorkualitasair_s_idfaktorkualitas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_faktorkualitasair_s_idfaktorkualitas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_faktorkualitasair_s_idfaktorkualitas_seq OWNER TO postgres;

--
-- Name: s_faktorkualitasair; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_faktorkualitasair (
    s_idfaktorkualitas integer DEFAULT nextval('s_faktorkualitasair_s_idfaktorkualitas_seq'::regclass) NOT NULL,
    s_namafaktorkualitas character varying(255) NOT NULL,
    s_nilai integer
);


ALTER TABLE public.s_faktorkualitasair OWNER TO postgres;

--
-- Name: s_faktorluasarea_s_idfaktorluasarea_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_faktorluasarea_s_idfaktorluasarea_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_faktorluasarea_s_idfaktorluasarea_seq OWNER TO postgres;

--
-- Name: s_faktorluasarea; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_faktorluasarea (
    s_idfaktorluasarea integer DEFAULT nextval('s_faktorluasarea_s_idfaktorluasarea_seq'::regclass) NOT NULL,
    s_areapengaruh character varying(255) NOT NULL,
    s_nilai integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.s_faktorluasarea OWNER TO postgres;

--
-- Name: s_faktorsumberair_s_idsumberair_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_faktorsumberair_s_idsumberair_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_faktorsumberair_s_idsumberair_seq OWNER TO postgres;

--
-- Name: s_faktorsumberair; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_faktorsumberair (
    s_idsumberair integer DEFAULT nextval('s_faktorsumberair_s_idsumberair_seq'::regclass) NOT NULL,
    s_jenissumber character varying(255) NOT NULL,
    s_nilai integer NOT NULL
);


ALTER TABLE public.s_faktorsumberair OWNER TO postgres;

--
-- Name: s_hargaairbaku_s_idhargaairbaku_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_hargaairbaku_s_idhargaairbaku_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_hargaairbaku_s_idhargaairbaku_seq OWNER TO postgres;

--
-- Name: s_hargaairbaku; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_hargaairbaku (
    s_idhargaairbaku integer DEFAULT nextval('s_hargaairbaku_s_idhargaairbaku_seq'::regclass) NOT NULL,
    s_idjaringan integer NOT NULL,
    s_harga double precision NOT NULL
);


ALTER TABLE public.s_hargaairbaku OWNER TO postgres;

--
-- Name: s_ho_gangguan_s_idgangguan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_ho_gangguan_s_idgangguan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_ho_gangguan_s_idgangguan_seq OWNER TO postgres;

--
-- Name: s_ho_gangguan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_ho_gangguan (
    s_idgangguan integer DEFAULT nextval('s_ho_gangguan_s_idgangguan_seq'::regclass) NOT NULL,
    s_namagangguan character varying(100) NOT NULL,
    s_indeks double precision NOT NULL
);


ALTER TABLE public.s_ho_gangguan OWNER TO postgres;

--
-- Name: s_ho_lokasi_s_idlokasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_ho_lokasi_s_idlokasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_ho_lokasi_s_idlokasi_seq OWNER TO postgres;

--
-- Name: s_ho_lokasi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_ho_lokasi (
    s_idlokasi integer DEFAULT nextval('s_ho_lokasi_s_idlokasi_seq'::regclass) NOT NULL,
    s_namalokasi character varying(100) NOT NULL,
    s_indeks double precision NOT NULL
);


ALTER TABLE public.s_ho_lokasi OWNER TO postgres;

--
-- Name: s_ho_luas_s_idluas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_ho_luas_s_idluas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_ho_luas_s_idluas_seq OWNER TO postgres;

--
-- Name: s_ho_luas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_ho_luas (
    s_idluas integer DEFAULT nextval('s_ho_luas_s_idluas_seq'::regclass) NOT NULL,
    s_luasawal integer NOT NULL,
    s_luasakhir integer NOT NULL,
    s_indeks double precision NOT NULL
);


ALTER TABLE public.s_ho_luas OWNER TO postgres;

--
-- Name: s_ho_skala_s_idskala_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_ho_skala_s_idskala_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_ho_skala_s_idskala_seq OWNER TO postgres;

--
-- Name: s_ho_skala; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_ho_skala (
    s_idskala integer DEFAULT nextval('s_ho_skala_s_idskala_seq'::regclass) NOT NULL,
    s_namaskala character varying(100) NOT NULL,
    s_tarif integer,
    s_satuan character varying(15)
);


ALTER TABLE public.s_ho_skala OWNER TO postgres;

--
-- Name: s_imb_gunabgn_s_idgunabgn_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_imb_gunabgn_s_idgunabgn_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_imb_gunabgn_s_idgunabgn_seq OWNER TO postgres;

--
-- Name: s_imb_gunabgn; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_imb_gunabgn (
    s_idgunabgn integer DEFAULT nextval('s_imb_gunabgn_s_idgunabgn_seq'::regclass) NOT NULL,
    s_namagunabgn character varying(100) NOT NULL,
    s_koefisien double precision NOT NULL
);


ALTER TABLE public.s_imb_gunabgn OWNER TO postgres;

--
-- Name: s_imb_kondisi_s_idkondisi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_imb_kondisi_s_idkondisi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_imb_kondisi_s_idkondisi_seq OWNER TO postgres;

--
-- Name: s_imb_kondisi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_imb_kondisi (
    s_idkondisi integer DEFAULT nextval('s_imb_kondisi_s_idkondisi_seq'::regclass) NOT NULL,
    s_namakondisi character varying(100) NOT NULL,
    s_koefisien double precision NOT NULL
);


ALTER TABLE public.s_imb_kondisi OWNER TO postgres;

--
-- Name: s_imb_lantai_s_idlantai_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_imb_lantai_s_idlantai_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_imb_lantai_s_idlantai_seq OWNER TO postgres;

--
-- Name: s_imb_lantai; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_imb_lantai (
    s_idlantai integer DEFAULT nextval('s_imb_lantai_s_idlantai_seq'::regclass) NOT NULL,
    s_namalantai character varying(100) NOT NULL,
    s_koefisien double precision NOT NULL
);


ALTER TABLE public.s_imb_lantai OWNER TO postgres;

--
-- Name: s_imb_lokasi_s_idlokasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_imb_lokasi_s_idlokasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_imb_lokasi_s_idlokasi_seq OWNER TO postgres;

--
-- Name: s_imb_lokasi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_imb_lokasi (
    s_idlokasi integer DEFAULT nextval('s_imb_lokasi_s_idlokasi_seq'::regclass) NOT NULL,
    s_namalokasi character varying(100) NOT NULL,
    s_koefisien double precision NOT NULL
);


ALTER TABLE public.s_imb_lokasi OWNER TO postgres;

--
-- Name: s_imb_luas_s_idluas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_imb_luas_s_idluas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_imb_luas_s_idluas_seq OWNER TO postgres;

--
-- Name: s_imb_luas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_imb_luas (
    s_idluas integer DEFAULT nextval('s_imb_luas_s_idluas_seq'::regclass) NOT NULL,
    s_namaluas character varying(100) NOT NULL,
    s_koefisien double precision NOT NULL
);


ALTER TABLE public.s_imb_luas OWNER TO postgres;

--
-- Name: s_imb_tarif_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_imb_tarif_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_imb_tarif_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_imb_tarif; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_imb_tarif (
    s_idtarif integer DEFAULT nextval('s_imb_tarif_s_idtarif_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15)
);


ALTER TABLE public.s_imb_tarif OWNER TO postgres;

--
-- Name: s_jaringanpdam_s_idjaringan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_jaringanpdam_s_idjaringan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_jaringanpdam_s_idjaringan_seq OWNER TO postgres;

--
-- Name: s_jaringanpdam; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_jaringanpdam (
    s_idjaringan integer DEFAULT nextval('s_jaringanpdam_s_idjaringan_seq'::regclass) NOT NULL,
    s_namajaringan character varying(255) NOT NULL,
    s_nilai integer
);


ALTER TABLE public.s_jaringanpdam OWNER TO postgres;

--
-- Name: s_jenisobjek_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_jenisobjek_seq
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_jenisobjek_seq OWNER TO postgres;

--
-- Name: s_jenisobjek; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_jenisobjek (
    s_idjenis integer DEFAULT nextval('s_jenisobjek_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE s_jenisreklame_s_idjenisreklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_jenisreklame_s_idjenisreklame_seq OWNER TO postgres;

--
-- Name: s_jenisreklame; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_jenisreklame (
    s_idjenisreklame integer DEFAULT nextval('s_jenisreklame_s_idjenisreklame_seq'::regclass) NOT NULL,
    s_namajenisreklame character varying(50) NOT NULL
);


ALTER TABLE public.s_jenisreklame OWNER TO postgres;

--
-- Name: s_jenissurat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_jenissurat_seq
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_jenissurat_seq OWNER TO postgres;

--
-- Name: s_jenissurat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_jenissurat (
    s_idsurat integer DEFAULT nextval('s_jenissurat_seq'::regclass) NOT NULL,
    s_namasurat character varying(70) NOT NULL,
    s_namasingkatsurat character varying(20) NOT NULL
);


ALTER TABLE public.s_jenissurat OWNER TO postgres;

--
-- Name: s_kecamatan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_kecamatan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kecamatan_seq OWNER TO postgres;

--
-- Name: s_kecamatan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_kecamatan (
    s_idkec integer DEFAULT nextval('s_kecamatan_seq'::regclass) NOT NULL,
    s_kodekec integer NOT NULL,
    s_namakec character varying(255) NOT NULL,
    is_delete integer
);


ALTER TABLE public.s_kecamatan OWNER TO postgres;

--
-- Name: s_kekayaan_tarif_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_kekayaan_tarif_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kekayaan_tarif_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_kekayaan_tarif; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_kekayaan_tarif (
    s_idtarif integer DEFAULT nextval('s_kekayaan_tarif_s_idtarif_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE s_kekayaankategorisatu_s_idkategorisatu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kekayaankategorisatu_s_idkategorisatu_seq OWNER TO postgres;

--
-- Name: s_kekayaankategorisatu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_kekayaankategorisatu (
    s_idkategorisatu integer DEFAULT nextval('s_kekayaankategorisatu_s_idkategorisatu_seq'::regclass) NOT NULL,
    s_idklasifikasi integer,
    s_keterangan character varying(100),
    s_tarif double precision,
    s_satuan character varying(50)
);


ALTER TABLE public.s_kekayaankategorisatu OWNER TO postgres;

--
-- Name: s_kekayaanpenggunaan_s_idpenggunaan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_kekayaanpenggunaan_s_idpenggunaan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kekayaanpenggunaan_s_idpenggunaan_seq OWNER TO postgres;

--
-- Name: s_kekayaanpenggunaan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_kekayaanpenggunaan (
    s_idpenggunaan integer DEFAULT nextval('s_kekayaanpenggunaan_s_idpenggunaan_seq'::regclass) NOT NULL,
    s_keterangan character varying(100)
);


ALTER TABLE public.s_kekayaanpenggunaan OWNER TO postgres;

--
-- Name: s_kekayaantarif_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_kekayaantarif_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kekayaantarif_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_kekayaantarif; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_kekayaantarif (
    s_idtarif integer DEFAULT nextval('s_kekayaantarif_s_idtarif_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE s_kelurahan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_kelurahan_seq OWNER TO postgres;

--
-- Name: s_kelurahan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_kelurahan (
    s_idkel integer DEFAULT nextval('s_kelurahan_seq'::regclass) NOT NULL,
    s_kodekel integer NOT NULL,
    s_namakel character varying(255) NOT NULL,
    s_idkeckel integer NOT NULL,
    is_delete integer
);


ALTER TABLE public.s_kelurahan OWNER TO postgres;

--
-- Name: s_minerba_jenis_s_idjenisminerba_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_minerba_jenis_s_idjenisminerba_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_minerba_jenis_s_idjenisminerba_seq OWNER TO postgres;

--
-- Name: s_minerba_jenis; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_minerba_jenis (
    s_idjenisminerba integer DEFAULT nextval('s_minerba_jenis_s_idjenisminerba_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE s_pejabat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_pejabat_seq OWNER TO postgres;

--
-- Name: s_pejabat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_pejabat (
    s_idpej integer DEFAULT nextval('s_pejabat_seq'::regclass) NOT NULL,
    s_namapej character varying(100) NOT NULL,
    s_jabatanpej character varying(100) NOT NULL,
    s_pangkatpej character varying(100) NOT NULL,
    s_nippej character varying(25) NOT NULL
);


ALTER TABLE public.s_pejabat OWNER TO postgres;

--
-- Name: s_pemda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_pemda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_pemda_seq OWNER TO postgres;

--
-- Name: s_pemda; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_pemda (
    s_idpemda integer DEFAULT nextval('s_pemda_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE s_rekening_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_rekening_seq OWNER TO postgres;

--
-- Name: s_rekening; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_rekening (
    s_idkorek integer DEFAULT nextval('s_rekening_seq'::regclass) NOT NULL,
    s_jenisobjek integer,
    s_tipekorek character varying(1) NOT NULL,
    s_kelompokkorek character varying(1) NOT NULL,
    s_jeniskorek character varying(1) NOT NULL,
    s_objekkorek character varying(2) NOT NULL,
    s_rinciankorek character varying(2) NOT NULL,
    s_sub1korek character varying(2) DEFAULT 0,
    s_sub2korek character varying(2) DEFAULT 0,
    s_sub3korek character varying(2) DEFAULT 0,
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
-- Name: s_reklame_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_seq OWNER TO postgres;

--
-- Name: s_reklame; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame (
    s_idreklame integer DEFAULT nextval('s_reklame_seq'::regclass) NOT NULL,
    s_namareklame character varying(100) NOT NULL,
    s_ukuranreklame integer NOT NULL,
    s_satuanreklame character varying(10) NOT NULL,
    s_lokminggu1 integer NOT NULL,
    s_lokbulan1 integer NOT NULL,
    s_loktahun1 integer NOT NULL,
    s_lokminggu2 integer NOT NULL,
    s_lokbulan2 integer NOT NULL,
    s_loktahun2 integer NOT NULL,
    s_sewaminggu integer NOT NULL,
    s_sewabulan integer NOT NULL,
    s_sewatahun integer NOT NULL,
    s_idrekeningreklame integer NOT NULL
);


ALTER TABLE public.s_reklame OWNER TO postgres;

--
-- Name: s_reklame_berjalan_s_idberjalan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_berjalan_s_idberjalan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_berjalan_s_idberjalan_seq OWNER TO postgres;

--
-- Name: s_reklame_berjalan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_berjalan (
    s_idberjalan integer DEFAULT nextval('s_reklame_berjalan_s_idberjalan_seq'::regclass) NOT NULL,
    s_jeniskendaraan integer NOT NULL,
    s_masareklame integer NOT NULL,
    s_nsrberjalan integer NOT NULL
);


ALTER TABLE public.s_reklame_berjalan OWNER TO postgres;

--
-- Name: s_reklame_index_tinggi_s_idindex_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_index_tinggi_s_idindex_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_index_tinggi_s_idindex_seq OWNER TO postgres;

--
-- Name: s_reklame_index_zona_s_idindex_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_index_zona_s_idindex_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_index_zona_s_idindex_seq OWNER TO postgres;

--
-- Name: s_reklame_jangkawaktureklame_s_idjangkawaktureklame_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_jangkawaktureklame_s_idjangkawaktureklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_jangkawaktureklame_s_idjangkawaktureklame_seq OWNER TO postgres;

--
-- Name: s_reklame_jenis_s_idjenis_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_jenis_s_idjenis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_jenis_s_idjenis_seq OWNER TO postgres;

--
-- Name: s_reklame_jenis; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_jenis (
    s_idjenis integer DEFAULT nextval('s_reklame_jenis_s_idjenis_seq'::regclass) NOT NULL,
    s_nama character varying(100) NOT NULL,
    s_idkorek integer NOT NULL,
    s_kodekawasan integer,
    s_masa character varying(255),
    s_tarif integer,
    s_ket character varying(255)
);


ALTER TABLE public.s_reklame_jenis OWNER TO postgres;

--
-- Name: s_reklame_kawasan_s_idkawasan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_kawasan_s_idkawasan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_kawasan_s_idkawasan_seq OWNER TO postgres;

--
-- Name: s_reklame_kawasan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_kawasan (
    s_idkawasan integer DEFAULT nextval('s_reklame_kawasan_s_idkawasan_seq'::regclass) NOT NULL,
    s_kawasan character varying(255),
    s_lokasi character varying(255),
    s_kodekawasan integer
);


ALTER TABLE public.s_reklame_kawasan OWNER TO postgres;

--
-- Name: s_reklame_klarifikasi_jalan_s_idklj_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_klarifikasi_jalan_s_idklj_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_klarifikasi_jalan_s_idklj_seq OWNER TO postgres;

--
-- Name: s_reklame_koefisienjenis_s_idkoefisienjenis_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_koefisienjenis_s_idkoefisienjenis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_koefisienjenis_s_idkoefisienjenis_seq OWNER TO postgres;

--
-- Name: s_reklame_koefisienpemasangan_s_idkoefisienpemasangan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_koefisienpemasangan_s_idkoefisienpemasangan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_koefisienpemasangan_s_idkoefisienpemasangan_seq OWNER TO postgres;

--
-- Name: s_reklame_lokasi_s_idlokasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_lokasi_s_idlokasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_lokasi_s_idlokasi_seq OWNER TO postgres;

--
-- Name: s_reklame_njopr_s_idnjopr_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_njopr_s_idnjopr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_njopr_s_idnjopr_seq OWNER TO postgres;

--
-- Name: s_reklame_njopr; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_njopr (
    s_idnjopr integer DEFAULT nextval('s_reklame_njopr_s_idnjopr_seq'::regclass) NOT NULL,
    s_idkorek integer NOT NULL,
    s_tarif_njopr integer NOT NULL,
    s_keterangan character varying(255)
);


ALTER TABLE public.s_reklame_njopr OWNER TO postgres;

--
-- Name: s_reklame_selebaran_s_idselebaran_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_selebaran_s_idselebaran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_selebaran_s_idselebaran_seq OWNER TO postgres;

--
-- Name: s_reklame_selebaran; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_selebaran (
    s_idselebaran integer DEFAULT nextval('s_reklame_selebaran_s_idselebaran_seq'::regclass) NOT NULL,
    s_nsrselebaran integer DEFAULT 0 NOT NULL,
    s_luasselebaran_min double precision DEFAULT 0 NOT NULL,
    s_luasselebaran_max double precision DEFAULT 999999999 NOT NULL
);


ALTER TABLE public.s_reklame_selebaran OWNER TO postgres;

--
-- Name: s_reklame_skorukuran_s_idskorukuran_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_skorukuran_s_idskorukuran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_skorukuran_s_idskorukuran_seq OWNER TO postgres;

--
-- Name: s_reklame_skorukuran; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_skorukuran (
    s_idskorukuran integer DEFAULT nextval('s_reklame_skorukuran_s_idskorukuran_seq'::regclass) NOT NULL,
    s_ukuran_min double precision NOT NULL,
    s_ukuran_max double precision NOT NULL,
    s_skor integer NOT NULL
);


ALTER TABLE public.s_reklame_skorukuran OWNER TO postgres;

--
-- Name: s_reklame_stiker_s_idstiker_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_stiker_s_idstiker_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_stiker_s_idstiker_seq OWNER TO postgres;

--
-- Name: s_reklame_stiker; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_stiker (
    s_idstiker integer DEFAULT nextval('s_reklame_stiker_s_idstiker_seq'::regclass) NOT NULL,
    s_nsrstiker integer NOT NULL,
    s_luasstiker_min double precision DEFAULT 0 NOT NULL,
    s_luasstiker_max double precision DEFAULT 999999999 NOT NULL
);


ALTER TABLE public.s_reklame_stiker OWNER TO postgres;

--
-- Name: s_reklame_sudutpandang; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_sudutpandang (
    s_idsudutpandang integer NOT NULL,
    s_namasudutpandang character varying(20) NOT NULL,
    s_skorsudutpandang integer NOT NULL
);


ALTER TABLE public.s_reklame_sudutpandang OWNER TO postgres;

--
-- Name: s_reklame_tarif_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_tarif_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_tarif_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_reklame_tarif; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_tarif (
    s_idtarif integer DEFAULT nextval('s_reklame_tarif_s_idtarif_seq'::regclass) NOT NULL,
    s_idjenisreklame integer NOT NULL,
    s_njor1 integer NOT NULL,
    s_njor2 integer NOT NULL,
    s_njor3 integer NOT NULL,
    s_njor4 integer NOT NULL,
    s_njor_lainnya integer NOT NULL,
    s_satuan character varying(50) NOT NULL
);


ALTER TABLE public.s_reklame_tarif OWNER TO postgres;

--
-- Name: s_reklame_tarif_kawasan_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_tarif_kawasan_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_tarif_kawasan_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_reklame_tarif_kawasan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_tarif_kawasan (
    s_idtarif integer DEFAULT nextval('s_reklame_tarif_kawasan_s_idtarif_seq'::regclass) NOT NULL,
    s_idwilayah integer NOT NULL,
    s_tarif1 integer NOT NULL,
    s_tarif2 integer NOT NULL,
    s_tarif3 integer NOT NULL,
    s_tarif4 integer NOT NULL,
    s_tarif_lainnya integer NOT NULL
);


ALTER TABLE public.s_reklame_tarif_kawasan OWNER TO postgres;

--
-- Name: s_reklame_tarif_klarifikasi_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_tarif_klarifikasi_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_tarif_klarifikasi_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_reklame_tarif_klarifikasi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_tarif_klarifikasi (
    s_idtarif integer DEFAULT nextval('s_reklame_tarif_klarifikasi_s_idtarif_seq'::regclass) NOT NULL,
    s_idklarifikasi integer NOT NULL,
    s_nspr1 integer NOT NULL,
    s_nspr2 integer NOT NULL,
    s_nspr3 integer NOT NULL,
    s_nspr4 integer NOT NULL,
    s_nspr_lainnya integer NOT NULL
);


ALTER TABLE public.s_reklame_tarif_klarifikasi OWNER TO postgres;

--
-- Name: s_reklame_tarif_supiori_s_idtarifsupiori_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_tarif_supiori_s_idtarifsupiori_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_tarif_supiori_s_idtarifsupiori_seq OWNER TO postgres;

--
-- Name: s_reklame_tarif_supiori; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_tarif_supiori (
    s_idtarifsupiori integer DEFAULT nextval('s_reklame_tarif_supiori_s_idtarifsupiori_seq'::regclass) NOT NULL,
    s_idjenisreklame integer,
    s_njopr integer,
    s_nspr integer,
    s_nsr integer,
    s_kodejangkawaktu integer,
    s_satuan character varying(255),
    s_keterangan character varying(255)
);


ALTER TABLE public.s_reklame_tarif_supiori OWNER TO postgres;

--
-- Name: s_reklame_tarif_tinggi_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_tarif_tinggi_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_tarif_tinggi_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_reklame_tarif_tinggi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_tarif_tinggi (
    s_idtarif integer DEFAULT nextval('s_reklame_tarif_tinggi_s_idtarif_seq'::regclass) NOT NULL,
    s_tariftinggi integer NOT NULL,
    s_tinggi_min integer NOT NULL,
    s_tinggi_max integer NOT NULL
);


ALTER TABLE public.s_reklame_tarif_tinggi OWNER TO postgres;

--
-- Name: s_reklame_wilayah_s_idwilayah_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_wilayah_s_idwilayah_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_wilayah_s_idwilayah_seq OWNER TO postgres;

--
-- Name: s_reklame_wilayah; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_wilayah (
    s_idwilayah integer DEFAULT nextval('s_reklame_wilayah_s_idwilayah_seq'::regclass) NOT NULL,
    s_nama character varying(100) NOT NULL
);


ALTER TABLE public.s_reklame_wilayah OWNER TO postgres;

--
-- Name: s_reklame_zonawilayah_s_idzona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_reklame_zonawilayah_s_idzona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_reklame_zonawilayah_s_idzona_seq OWNER TO postgres;

--
-- Name: s_reklame_zonawilayah; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_reklame_zonawilayah (
    s_idzona integer DEFAULT nextval('s_reklame_zonawilayah_s_idzona_seq'::regclass) NOT NULL,
    s_zona integer,
    s_nourut integer,
    s_lokasi character varying(255)
);


ALTER TABLE public.s_reklame_zonawilayah OWNER TO postgres;

--
-- Name: s_satker_s_idsatker_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_satker_s_idsatker_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_satker_s_idsatker_seq OWNER TO postgres;

--
-- Name: s_satker; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_satker (
    s_idsatker integer DEFAULT nextval('s_satker_s_idsatker_seq'::regclass) NOT NULL,
    s_kodesatker character varying(15) NOT NULL,
    s_namasatker character varying(200) NOT NULL
);


ALTER TABLE public.s_satker OWNER TO postgres;

--
-- Name: s_target_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_target_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_target_seq OWNER TO postgres;

--
-- Name: s_target; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_target (
    s_idtarget integer DEFAULT nextval('s_target_seq'::regclass) NOT NULL,
    s_tahuntarget character varying(4) NOT NULL,
    s_statustarget integer NOT NULL,
    s_keterangantarget character varying(255) NOT NULL
);


ALTER TABLE public.s_target OWNER TO postgres;

--
-- Name: s_targetdetail_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_targetdetail_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_targetdetail_seq OWNER TO postgres;

--
-- Name: s_targetdetail; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_targetdetail (
    s_idtargetdetail integer DEFAULT nextval('s_targetdetail_seq'::regclass) NOT NULL,
    s_idtargetheader integer NOT NULL,
    s_targetrekening integer NOT NULL,
    s_targetjumlah bigint NOT NULL
);


ALTER TABLE public.s_targetdetail OWNER TO postgres;

--
-- Name: s_targetjenis_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_targetjenis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_targetjenis_seq OWNER TO postgres;

--
-- Name: s_targetjenis; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_targetjenis (
    s_idtargetjenis integer DEFAULT nextval('s_targetjenis_seq'::regclass) NOT NULL,
    s_namatargetjenis character varying(50) NOT NULL
);


ALTER TABLE public.s_targetjenis OWNER TO postgres;

--
-- Name: s_tarifbudidaya_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tarifbudidaya_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifbudidaya_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifbudidaya; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifbudidaya (
    s_idtarif integer DEFAULT nextval('s_tarifbudidaya_s_idtarif_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15) NOT NULL
);


ALTER TABLE public.s_tarifbudidaya OWNER TO postgres;

--
-- Name: s_tarifbudidayamutiara_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tarifbudidayamutiara_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifbudidayamutiara_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifbudidayamutiara; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifbudidayamutiara (
    s_idtarif integer DEFAULT nextval('s_tarifbudidayamutiara_s_idtarif_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15) NOT NULL
);


ALTER TABLE public.s_tarifbudidayamutiara OWNER TO postgres;

--
-- Name: s_tarifgedung_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tarifgedung_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifgedung_seq OWNER TO postgres;

--
-- Name: s_tarifgedung; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifgedung (
    s_idtarif integer DEFAULT nextval('s_tarifgedung_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15) NOT NULL
);


ALTER TABLE public.s_tarifgedung OWNER TO postgres;

--
-- Name: s_tarifkapal_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tarifkapal_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifkapal_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifkapal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifkapal (
    s_idtarif integer DEFAULT nextval('s_tarifkapal_s_idtarif_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15) NOT NULL
);


ALTER TABLE public.s_tarifkapal OWNER TO postgres;

--
-- Name: s_tarifkebersihan_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tarifkebersihan_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifkebersihan_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifkebersihan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifkebersihan (
    s_idtarif integer DEFAULT nextval('s_tarifkebersihan_s_idtarif_seq'::regclass) NOT NULL,
    s_idklasifikasi integer NOT NULL,
    s_keterangan character varying(255),
    s_tarifdasar double precision NOT NULL,
    s_satuan character varying(100)
);


ALTER TABLE public.s_tarifkebersihan OWNER TO postgres;

--
-- Name: s_tarifkir_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tarifkir_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifkir_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifkir; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifkir (
    s_idtarif integer DEFAULT nextval('s_tarifkir_s_idtarif_seq'::regclass) NOT NULL,
    s_keterangan character varying(100),
    s_tarif double precision DEFAULT 0,
    s_satuan character varying(30)
);


ALTER TABLE public.s_tarifkir OWNER TO postgres;

--
-- Name: s_tarifparkirtepi_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tarifparkirtepi_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifparkirtepi_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifparkirtepi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifparkirtepi (
    s_idtarif integer DEFAULT nextval('s_tarifparkirtepi_s_idtarif_seq'::regclass) NOT NULL,
    s_keterangan character varying(100),
    s_tarif double precision DEFAULT 0,
    s_satuan character varying(30)
);


ALTER TABLE public.s_tarifparkirtepi OWNER TO postgres;

--
-- Name: s_tarifpasar_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tarifpasar_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifpasar_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifpasar; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifpasar (
    s_idtarif integer DEFAULT nextval('s_tarifpasar_s_idtarif_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE s_tarifpasargrosir_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifpasargrosir_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifpasargrosir; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifpasargrosir (
    s_idtarif integer DEFAULT nextval('s_tarifpasargrosir_s_idtarif_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE s_tarifpemadam_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifpemadam_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifpemadam; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifpemadam (
    s_idtarif integer DEFAULT nextval('s_tarifpemadam_s_idtarif_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(25) NOT NULL
);


ALTER TABLE public.s_tarifpemadam OWNER TO postgres;

--
-- Name: s_tarifrumahdinas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tarifrumahdinas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifrumahdinas_seq OWNER TO postgres;

--
-- Name: s_tarifrumahdinas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifrumahdinas (
    s_idtarifret integer DEFAULT nextval('s_tarifrumahdinas_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE s_tariftanahreklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tariftanahreklame_seq OWNER TO postgres;

--
-- Name: s_tariftanahreklame; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tariftanahreklame (
    s_idtarif integer DEFAULT nextval('s_tariftanahreklame_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15) NOT NULL
);


ALTER TABLE public.s_tariftanahreklame OWNER TO postgres;

--
-- Name: s_tariftempatparkir_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tariftempatparkir_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tariftempatparkir_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tariftempatparkir; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tariftempatparkir (
    s_idtarif integer DEFAULT nextval('s_tariftempatparkir_s_idtarif_seq'::regclass) NOT NULL,
    s_jeniskendaraan character varying(255),
    s_tarifdasar double precision NOT NULL
);


ALTER TABLE public.s_tariftempatparkir OWNER TO postgres;

--
-- Name: s_tariftera_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tariftera_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tariftera_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tariftera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tariftera (
    s_idtarif integer DEFAULT nextval('s_tariftera_s_idtarif_seq'::regclass) NOT NULL,
    s_namatarif character varying(100) NOT NULL,
    s_tarif integer NOT NULL,
    s_satuan character varying(15)
);


ALTER TABLE public.s_tariftera OWNER TO postgres;

--
-- Name: s_tarifterminal_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tarifterminal_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tarifterminal_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tarifterminal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tarifterminal (
    s_idtarif integer DEFAULT nextval('s_tarifterminal_s_idtarif_seq'::regclass) NOT NULL,
    s_idjenispelayanan integer NOT NULL,
    s_keterangan character varying(255),
    s_tarifdasar double precision NOT NULL,
    s_satuan character varying(100)
);


ALTER TABLE public.s_tarifterminal OWNER TO postgres;

--
-- Name: s_tariftrayek_s_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tariftrayek_s_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tariftrayek_s_idtarif_seq OWNER TO postgres;

--
-- Name: s_tariftrayek; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tariftrayek (
    s_idtarif integer DEFAULT nextval('s_tariftrayek_s_idtarif_seq'::regclass) NOT NULL,
    s_keterangan character varying(100),
    s_tarif double precision DEFAULT 0,
    s_satuan character varying(30)
);


ALTER TABLE public.s_tariftrayek OWNER TO postgres;

--
-- Name: s_tipeusaha_s_idusaha_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_tipeusaha_s_idusaha_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_tipeusaha_s_idusaha_seq OWNER TO postgres;

--
-- Name: s_tipeusaha; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_tipeusaha (
    s_idusaha integer DEFAULT nextval('s_tipeusaha_s_idusaha_seq'::regclass) NOT NULL,
    s_kodeusaha integer NOT NULL,
    s_namausaha character varying(100) NOT NULL
);


ALTER TABLE public.s_tipeusaha OWNER TO postgres;

--
-- Name: s_users_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE s_users_seq
    START WITH 12
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.s_users_seq OWNER TO postgres;

--
-- Name: s_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE s_users (
    s_iduser integer DEFAULT nextval('s_users_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_angsuran_t_idangsuran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_angsuran_t_idangsuran_seq OWNER TO postgres;

--
-- Name: t_angsuran; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_angsuran (
    t_idangsuran integer DEFAULT nextval('t_angsuran_t_idangsuran_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_dataop_t_idop_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_dataop_t_idop_seq OWNER TO postgres;

--
-- Name: t_dataop; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_dataop (
    t_idop integer DEFAULT nextval('t_dataop_t_idop_seq'::regclass) NOT NULL,
    t_npwpd character varying(20),
    t_ayat character varying(255)
);


ALTER TABLE public.t_dataop OWNER TO postgres;

--
-- Name: t_datatransaksi_t_idtransaksi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_datatransaksi_t_idtransaksi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_datatransaksi_t_idtransaksi_seq OWNER TO postgres;

--
-- Name: t_datatransaksi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_datatransaksi (
    t_idtransaksi integer DEFAULT nextval('t_datatransaksi_t_idtransaksi_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_datawpdaftar_t_idwp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_datawpdaftar_t_idwp_seq OWNER TO postgres;

--
-- Name: t_datawpdaftar; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_datawpdaftar (
    t_idwp integer DEFAULT nextval('t_datawpdaftar_t_idwp_seq'::regclass) NOT NULL,
    t_npwpd character varying(20),
    t_namawp character varying(255),
    t_alamatwp character varying(255),
    t_tgldaftarwp date
);


ALTER TABLE public.t_datawpdaftar OWNER TO postgres;

--
-- Name: t_datawpusaha_t_idwp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_datawpusaha_t_idwp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_datawpusaha_t_idwp_seq OWNER TO postgres;

--
-- Name: t_datawpusaha; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_datawpusaha (
    t_idwp integer DEFAULT nextval('t_datawpusaha_t_idwp_seq'::regclass) NOT NULL,
    t_npwpd character varying(20),
    t_namausaha character varying(255),
    t_alamatusaha character varying(255),
    t_tgldaftarusaha date
);


ALTER TABLE public.t_datawpusaha OWNER TO postgres;

--
-- Name: t_detailair_t_idair_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_detailair_t_idair_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailair_t_idair_seq OWNER TO postgres;

--
-- Name: t_detailair; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailair (
    t_idair integer DEFAULT nextval('t_detailair_t_idair_seq'::regclass) NOT NULL,
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
    t_totalnpa double precision DEFAULT 0
);


ALTER TABLE public.t_detailair OWNER TO postgres;

--
-- Name: t_detailgedung_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_detailgedung_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailgedung_seq OWNER TO postgres;

--
-- Name: t_detailgedung; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailgedung (
    t_idgedung integer DEFAULT nextval('t_detailgedung_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailho_t_idretho_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailho_t_idretho_seq OWNER TO postgres;

--
-- Name: t_detailho; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailho (
    t_idretho integer DEFAULT nextval('t_detailho_t_idretho_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailimb_t_idretimb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailimb_t_idretimb_seq OWNER TO postgres;

--
-- Name: t_detailimb; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailimb (
    t_idretimb integer DEFAULT nextval('t_detailimb_t_idretimb_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailkebersihan_t_idkebersihan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailkebersihan_t_idkebersihan_seq OWNER TO postgres;

--
-- Name: t_detailkebersihan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailkebersihan (
    t_idkebersihan integer DEFAULT nextval('t_detailkebersihan_t_idkebersihan_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailkekayaan_t_idkekayaan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailkekayaan_t_idkekayaan_seq OWNER TO postgres;

--
-- Name: t_detailkekayaan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailkekayaan (
    t_idkekayaan integer DEFAULT nextval('t_detailkekayaan_t_idkekayaan_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailkir_t_iddetailkir_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailkir_t_iddetailkir_seq OWNER TO postgres;

--
-- Name: t_detailkir; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailkir (
    t_iddetailkir integer DEFAULT nextval('t_detailkir_t_iddetailkir_seq'::regclass) NOT NULL,
    t_idtransaksi integer NOT NULL,
    t_idtarif integer NOT NULL,
    t_hargadasar double precision NOT NULL,
    t_jumlah double precision NOT NULL
);


ALTER TABLE public.t_detailkir OWNER TO postgres;

--
-- Name: t_detailminerba_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_detailminerba_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailminerba_seq OWNER TO postgres;

--
-- Name: t_detailminerba; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailminerba (
    t_idminerba integer DEFAULT nextval('t_detailminerba_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailpanggungreklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailpanggungreklame_seq OWNER TO postgres;

--
-- Name: t_detailpanggungreklame; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailpanggungreklame (
    t_idrpangrek integer DEFAULT nextval('t_detailpanggungreklame_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailparkir_t_idparkir_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailparkir_t_idparkir_seq OWNER TO postgres;

--
-- Name: t_detailparkir; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailparkir (
    t_idparkir integer DEFAULT nextval('t_detailparkir_t_idparkir_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailparkirtepi_t_iddetailret_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailparkirtepi_t_iddetailret_seq OWNER TO postgres;

--
-- Name: t_detailparkirtepi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailparkirtepi (
    t_iddetailret integer DEFAULT nextval('t_detailparkirtepi_t_iddetailret_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailpasar_t_idpasar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailpasar_t_idpasar_seq OWNER TO postgres;

--
-- Name: t_detailpasar; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailpasar (
    t_idpasar integer DEFAULT nextval('t_detailpasar_t_idpasar_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailpasargrosir_t_idpasargrosir_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailpasargrosir_t_idpasargrosir_seq OWNER TO postgres;

--
-- Name: t_detailpasargrosir; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailpasargrosir (
    t_idpasargrosir integer DEFAULT nextval('t_detailpasargrosir_t_idpasargrosir_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailpemadam_t_idretpemadam_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailpemadam_t_idretpemadam_seq OWNER TO postgres;

--
-- Name: t_detailpemadam; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailpemadam (
    t_idretpemadam integer DEFAULT nextval('t_detailpemadam_t_idretpemadam_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailperikanan_t_idperikanan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailperikanan_t_idperikanan_seq OWNER TO postgres;

--
-- Name: t_detailperikanan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailperikanan (
    t_idperikanan integer DEFAULT nextval('t_detailperikanan_t_idperikanan_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailppj_t_iddetailppj_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailppj_t_iddetailppj_seq OWNER TO postgres;

--
-- Name: t_detailppj; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailppj (
    t_iddetailppj integer DEFAULT nextval('t_detailppj_t_iddetailppj_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailreklame_t_iddetailreklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailreklame_t_iddetailreklame_seq OWNER TO postgres;

--
-- Name: t_detailreklame; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailreklame (
    t_iddetailreklame integer DEFAULT nextval('t_detailreklame_t_iddetailreklame_seq'::regclass) NOT NULL,
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
    t_nspr numeric(10,2),
    t_njopr integer,
    t_kodekawasan integer,
    t_idkawasan integer
);


ALTER TABLE public.t_detailreklame OWNER TO postgres;

--
-- Name: t_detailretribusi_t_iddetailret_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_detailretribusi_t_iddetailret_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailretribusi_t_iddetailret_seq OWNER TO postgres;

--
-- Name: t_detailretribusi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailretribusi (
    t_iddetailret integer DEFAULT nextval('t_detailretribusi_t_iddetailret_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailrumahdinas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailrumahdinas_seq OWNER TO postgres;

--
-- Name: t_detailrumahdinas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailrumahdinas (
    t_idrumahdinas integer DEFAULT nextval('t_detailrumahdinas_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailtanahlain_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailtanahlain_seq OWNER TO postgres;

--
-- Name: t_detailtanahlain; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailtanahlain (
    t_idrpangrek integer DEFAULT nextval('t_detailtanahlain_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailtanahreklame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailtanahreklame_seq OWNER TO postgres;

--
-- Name: t_detailtanahreklame; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailtanahreklame (
    t_idrpangrek integer DEFAULT nextval('t_detailtanahreklame_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailtempatparkir_t_idtempatparkir_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailtempatparkir_t_idtempatparkir_seq OWNER TO postgres;

--
-- Name: t_detailtempatparkir; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailtempatparkir (
    t_idtempatparkir integer DEFAULT nextval('t_detailtempatparkir_t_idtempatparkir_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailtera_t_idtera_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailtera_t_idtera_seq OWNER TO postgres;

--
-- Name: t_detailtera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailtera (
    t_idtera integer DEFAULT nextval('t_detailtera_t_idtera_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailterminal_t_iddetailret_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailterminal_t_iddetailret_seq OWNER TO postgres;

--
-- Name: t_detailterminal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailterminal (
    t_iddetailret integer DEFAULT nextval('t_detailterminal_t_iddetailret_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_detailtrayek_t_iddetailret_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_detailtrayek_t_iddetailret_seq OWNER TO postgres;

--
-- Name: t_detailtrayek; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_detailtrayek (
    t_iddetailret integer DEFAULT nextval('t_detailtrayek_t_iddetailret_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_jenispelayanan_terminal_t_idjenispelayanan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_jenispelayanan_terminal_t_idjenispelayanan_seq OWNER TO postgres;

--
-- Name: t_jenispelayanan_terminal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_jenispelayanan_terminal (
    t_idjenispelayanan integer DEFAULT nextval('t_jenispelayanan_terminal_t_idjenispelayanan_seq'::regclass) NOT NULL,
    t_keterangan character varying(255)
);


ALTER TABLE public.t_jenispelayanan_terminal OWNER TO postgres;

--
-- Name: t_kantorskpd_t_idskpd_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_kantorskpd_t_idskpd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_kantorskpd_t_idskpd_seq OWNER TO postgres;

--
-- Name: t_kantorskpd; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_kantorskpd (
    t_idskpd integer DEFAULT nextval('t_kantorskpd_t_idskpd_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_keberatan_t_idkeberatan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_keberatan_t_idkeberatan_seq OWNER TO postgres;

--
-- Name: t_keberatan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_keberatan (
    t_idkeberatan integer DEFAULT nextval('t_keberatan_t_idkeberatan_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_klasifikasi_kebersihan_t_idklasifikasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_klasifikasi_kebersihan_t_idklasifikasi_seq OWNER TO postgres;

--
-- Name: t_klasifikasi_kebersihan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_klasifikasi_kebersihan (
    t_idklasifikasi integer DEFAULT nextval('t_klasifikasi_kebersihan_t_idklasifikasi_seq'::regclass) NOT NULL,
    t_keterangan character varying(255)
);


ALTER TABLE public.t_klasifikasi_kebersihan OWNER TO postgres;

--
-- Name: t_klasifikasi_pasar_t_idklasifikasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_klasifikasi_pasar_t_idklasifikasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_klasifikasi_pasar_t_idklasifikasi_seq OWNER TO postgres;

--
-- Name: t_klasifikasi_pasar; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_klasifikasi_pasar (
    t_idklasifikasi integer DEFAULT nextval('t_klasifikasi_pasar_t_idklasifikasi_seq'::regclass) NOT NULL,
    t_keterangan character varying(255)
);


ALTER TABLE public.t_klasifikasi_pasar OWNER TO postgres;

--
-- Name: t_klasifikasi_pasargrosir_t_idklasifikasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_klasifikasi_pasargrosir_t_idklasifikasi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_klasifikasi_pasargrosir_t_idklasifikasi_seq OWNER TO postgres;

--
-- Name: t_klasifikasi_pasargrosir; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_klasifikasi_pasargrosir (
    t_idklasifikasi integer DEFAULT nextval('t_klasifikasi_pasargrosir_t_idklasifikasi_seq'::regclass) NOT NULL,
    t_keterangan character varying(255)
);


ALTER TABLE public.t_klasifikasi_pasargrosir OWNER TO postgres;

--
-- Name: t_lampiranppj_t_idlampiranppj_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_lampiranppj_t_idlampiranppj_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_lampiranppj_t_idlampiranppj_seq OWNER TO postgres;

--
-- Name: t_lampiranppj; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_lampiranppj (
    t_idlampiranppj integer DEFAULT nextval('t_lampiranppj_t_idlampiranppj_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_setoranlain_t_idsetoranlain_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_setoranlain_t_idsetoranlain_seq OWNER TO postgres;

--
-- Name: t_setoranlain_t_nomorurut_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_setoranlain_t_nomorurut_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_setoranlain_t_nomorurut_seq OWNER TO postgres;

--
-- Name: t_setoranlain; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_setoranlain (
    t_idsetoranlain integer DEFAULT nextval('t_setoranlain_t_idsetoranlain_seq'::regclass) NOT NULL,
    t_idsatker integer NOT NULL,
    t_idrekening integer NOT NULL,
    t_tahunpajak character varying(5) NOT NULL,
    t_jumlahsetor double precision NOT NULL,
    t_tglsetor date DEFAULT now() NOT NULL,
    t_viasetor character(1) NOT NULL,
    t_kodebukti integer NOT NULL,
    t_issetorandeleted integer DEFAULT 0 NOT NULL,
    t_nomorurut integer DEFAULT nextval('t_setoranlain_t_nomorurut_seq'::regclass) NOT NULL
);


ALTER TABLE public.t_setoranlain OWNER TO postgres;

--
-- Name: t_setorbankdetail_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_setorbankdetail_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_setorbankdetail_seq OWNER TO postgres;

--
-- Name: t_setorbankdetail; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_setorbankdetail (
    t_idsbd integer DEFAULT nextval('t_setorbankdetail_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_setorbankheader_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_setorbankheader_seq OWNER TO postgres;

--
-- Name: t_setorbankheader; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_setorbankheader (
    t_idsbh integer DEFAULT nextval('t_setorbankheader_seq'::regclass) NOT NULL,
    t_tglsbh date NOT NULL,
    t_nosbh character varying(50) NOT NULL,
    t_issbhdeleted integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.t_setorbankheader OWNER TO postgres;

--
-- Name: t_skpdkb_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_skpdkb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_skpdkb_seq OWNER TO postgres;

--
-- Name: t_skpdkb; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_skpdkb (
    t_idskpdkb integer DEFAULT nextval('t_skpdkb_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_skpdkbt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_skpdkbt_seq OWNER TO postgres;

--
-- Name: t_skpdkbt; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_skpdkbt (
    t_idskpdkbt integer DEFAULT nextval('t_skpdkbt_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_skpdlb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_skpdlb_seq OWNER TO postgres;

--
-- Name: t_skpdlb; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_skpdlb (
    t_idskpdlb integer DEFAULT nextval('t_skpdlb_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_skpdn_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_skpdn_seq OWNER TO postgres;

--
-- Name: t_skpdn; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_skpdn (
    t_idskpdn integer DEFAULT nextval('t_skpdn_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_skpdt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_skpdt_seq OWNER TO postgres;

--
-- Name: t_skpdt; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_skpdt (
    t_idskpdt integer DEFAULT nextval('t_skpdt_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_suratkesanggupan_t_idsurat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_suratkesanggupan_t_idsurat_seq OWNER TO postgres;

--
-- Name: t_suratkesanggupan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_suratkesanggupan (
    t_idsurat integer DEFAULT nextval('t_suratkesanggupan_t_idsurat_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_teguranlaporpajak_t_idteguran_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_teguranlaporpajak_t_idteguran_seq OWNER TO postgres;

--
-- Name: t_teguranlaporpajak; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_teguranlaporpajak (
    t_idteguran integer DEFAULT nextval('t_teguranlaporpajak_t_idteguran_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_transaksi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_transaksi_seq OWNER TO postgres;

--
-- Name: t_transaksi; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_transaksi (
    t_idtransaksi integer DEFAULT nextval('t_transaksi_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_wp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_wp_seq OWNER TO postgres;

--
-- Name: t_wp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_wp (
    t_idwp integer DEFAULT nextval('t_wp_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE t_wpobjek_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_wpobjek_seq OWNER TO postgres;

--
-- Name: t_wpobjek; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_wpobjek (
    t_idobjek integer DEFAULT nextval('t_wpobjek_seq'::regclass) NOT NULL,
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
-- Name: v_surat_teguran; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v_surat_teguran AS
    SELECT a.t_idwp, i.t_nourut, CASE WHEN (a.t_bidangusaha = 1) THEN (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((b.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((c.s_kodekel)::text, 2, '0'::text)) ELSE (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((j.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((k.s_kodekel)::text, 2, '0'::text)) END AS t_npwpd, a.t_nama, ((((((lpad((e.t_jenisobjek)::text, 2, '0'::text) || '.'::text) || lpad((e.t_noobjek)::text, 5, '0'::text)) || '.'::text) || lpad((g.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((h.s_kodekel)::text, 3, '0'::text)) AS t_nop, e.t_namaobjek, i.t_tglpendataan, i.t_jmlhpajak, i.t_tglpembayaran, i.t_jmlhpembayaran, i.t_jenispajak, i.t_idtransaksi, i.t_tgljatuhtempo, date_part('day'::text, ((('now'::text)::date)::timestamp without time zone - (i.t_tgljatuhtempo)::timestamp without time zone)) AS hari_lebih_tempo, i.t_masaawal, i.t_masaakhir FROM ((((((((((t_wp a LEFT JOIN s_kecamatan b ON ((a.t_kecamatan = b.s_idkec))) LEFT JOIN s_kelurahan c ON ((a.t_kelurahan = c.s_idkel))) LEFT JOIN s_users d ON ((a.t_operatorid = d.s_iduser))) LEFT JOIN t_wpobjek e ON ((a.t_idwp = e.t_idwp))) LEFT JOIN s_jenisobjek f ON ((e.t_jenisobjek = f.s_idjenis))) LEFT JOIN s_kecamatan g ON ((e.t_kecamatanobjek = g.s_idkec))) LEFT JOIN s_kelurahan h ON ((e.t_kelurahanobjek = h.s_idkel))) LEFT JOIN t_transaksi i ON ((e.t_idobjek = i.t_idwpobjek))) LEFT JOIN s_kecamatan j ON ((a.t_kecamatan_badan = j.s_idkec))) LEFT JOIN s_kelurahan k ON ((a.t_kelurahan_badan = k.s_idkel))) WHERE (((i.t_jmlhpembayaran IS NULL) OR (i.t_jmlhpembayaran = (0)::double precision)) AND (i.t_tglpembayaran IS NULL)) ORDER BY i.t_nourut DESC;


ALTER TABLE public.v_surat_teguran OWNER TO postgres;

--
-- Name: view_realisasi_dashboard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_realisasi_dashboard AS
    SELECT s_rekening.s_jenisobjek, s_rekening.s_namakorek, (SELECT COALESCE(s_targetdetail.s_targetjumlah, (0)::bigint) AS "coalesce" FROM (s_target LEFT JOIN s_targetdetail ON ((s_target.s_idtarget = s_targetdetail.s_idtargetheader))) WHERE ((((s_target.s_tahuntarget)::integer)::double precision = date_part('year'::text, now())) AND (s_targetdetail.s_targetrekening = s_rekening.s_idkorek))) AS target, (SELECT COALESCE(sum(aa.t_jmlhpembayaran), (0)::double precision) AS "coalesce" FROM (t_transaksi aa LEFT JOIN s_rekening za ON ((aa.t_idkorek = za.s_idkorek))) WHERE (((((date_part('year'::text, aa.t_tglpembayaran) = date_part('year'::text, now())) AND ((za.s_tipekorek)::text = (s_rekening.s_tipekorek)::text)) AND ((za.s_kelompokkorek)::text = (s_rekening.s_kelompokkorek)::text)) AND ((za.s_jeniskorek)::text = (s_rekening.s_jeniskorek)::text)) AND ((za.s_objekkorek)::text = (s_rekening.s_objekkorek)::text))) AS real_tahunini, (SELECT COALESCE(sum(aa.t_jmlhbayarskpdkb), (0)::double precision) AS "coalesce" FROM ((t_skpdkb aa LEFT JOIN t_transaksi zb ON ((aa.t_idtransaksi = zb.t_idtransaksi))) LEFT JOIN s_rekening za ON ((zb.t_idkorek = za.s_idkorek))) WHERE (((((date_part('year'::text, aa.t_tglbayarskpdkb) = date_part('year'::text, now())) AND ((za.s_tipekorek)::text = (s_rekening.s_tipekorek)::text)) AND ((za.s_kelompokkorek)::text = (s_rekening.s_kelompokkorek)::text)) AND ((za.s_jeniskorek)::text = (s_rekening.s_jeniskorek)::text)) AND ((za.s_objekkorek)::text = (s_rekening.s_objekkorek)::text))) AS skpdkb_tahunini, (SELECT COALESCE(sum(aa.t_jmlhbayarskpdkbt), (0)::double precision) AS "coalesce" FROM ((t_skpdkbt aa LEFT JOIN t_transaksi zb ON ((aa.t_idtransaksi = zb.t_idtransaksi))) LEFT JOIN s_rekening za ON ((zb.t_idkorek = za.s_idkorek))) WHERE (((((date_part('year'::text, aa.t_tglbayarskpdkbt) = date_part('year'::text, now())) AND ((za.s_tipekorek)::text = (s_rekening.s_tipekorek)::text)) AND ((za.s_kelompokkorek)::text = (s_rekening.s_kelompokkorek)::text)) AND ((za.s_jeniskorek)::text = (s_rekening.s_jeniskorek)::text)) AND ((za.s_objekkorek)::text = (s_rekening.s_objekkorek)::text))) AS skpdkbt_tahunini FROM s_rekening WHERE (((s_rekening.s_rinciankorek)::text = '00'::text) AND ((s_rekening.s_jeniskorek)::text = '1'::text)) ORDER BY s_rekening.s_tipekorek, s_rekening.s_kelompokkorek, s_rekening.s_jeniskorek, s_rekening.s_objekkorek, s_rekening.s_rinciankorek, s_rekening.s_sub1korek;


ALTER TABLE public.view_realisasi_dashboard OWNER TO postgres;

--
-- Name: view_rekening; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_rekening AS
    SELECT CASE WHEN ((a.s_sub1korek)::text <> ''::text) THEN (((((((((((a.s_tipekorek)::text || '.'::text) || (a.s_kelompokkorek)::text) || '.'::text) || (a.s_jeniskorek)::text) || '.'::text) || (a.s_objekkorek)::text) || '.'::text) || (a.s_rinciankorek)::text) || '.'::text) || (a.s_sub1korek)::text) ELSE CASE WHEN ((a.s_sub2korek)::text <> ''::text) THEN (((((((((((((a.s_tipekorek)::text || '.'::text) || (a.s_kelompokkorek)::text) || '.'::text) || (a.s_jeniskorek)::text) || '.'::text) || (a.s_objekkorek)::text) || '.'::text) || (a.s_rinciankorek)::text) || '.'::text) || (a.s_sub1korek)::text) || '.'::text) || (a.s_sub2korek)::text) ELSE CASE WHEN ((a.s_sub3korek)::text <> ''::text) THEN (((((((((((((((a.s_tipekorek)::text || '.'::text) || (a.s_kelompokkorek)::text) || '.'::text) || (a.s_jeniskorek)::text) || '.'::text) || (a.s_objekkorek)::text) || '.'::text) || (a.s_rinciankorek)::text) || '.'::text) || (a.s_sub1korek)::text) || '.'::text) || (a.s_sub2korek)::text) || '.'::text) || (a.s_sub3korek)::text) ELSE (((((((((a.s_tipekorek)::text || '.'::text) || (a.s_kelompokkorek)::text) || '.'::text) || (a.s_jeniskorek)::text) || '.'::text) || (a.s_objekkorek)::text) || '.'::text) || (a.s_rinciankorek)::text) END END END AS korek, a.s_idkorek, a.s_jenisobjek, a.s_tipekorek, a.s_kelompokkorek, a.s_jeniskorek, a.s_objekkorek, a.s_rinciankorek, a.s_sub1korek, a.s_sub2korek, a.s_sub3korek, a.s_namakorek, a.s_persentarifkorek, a.s_tarifdasarkorek, a.s_voldasarkorek, a.s_tariftambahkorek, a.s_tglawalkorek, a.s_tglakhirkorek, a.is_deluser, b.s_namajenis, a.t_berdasarmasa, b.s_idjenis FROM (s_rekening a LEFT JOIN s_jenisobjek b ON ((b.s_idjenis = a.s_jenisobjek)));


ALTER TABLE public.view_rekening OWNER TO postgres;

--
-- Name: view_rekmin; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_rekmin AS
    SELECT s_minerba_jenis.s_idjenisminerba, s_minerba_jenis.s_namajenisminerba, s_minerba_jenis.s_idkorek, s_minerba_jenis.s_idzona, s_minerba_jenis.s_harga, s_minerba_jenis.s_keterangan, view_rekening.korek, view_rekening.s_jenisobjek, view_rekening.s_tipekorek, view_rekening.s_kelompokkorek, view_rekening.s_jeniskorek, view_rekening.s_objekkorek, view_rekening.s_rinciankorek, view_rekening.s_sub1korek, view_rekening.s_sub2korek, view_rekening.s_sub3korek, view_rekening.s_namakorek, view_rekening.s_persentarifkorek, view_rekening.s_voldasarkorek, view_rekening.s_tariftambahkorek, view_rekening.s_tglawalkorek, view_rekening.s_tglakhirkorek, view_rekening.is_deluser, view_rekening.s_namajenis, view_rekening.t_berdasarmasa, view_rekening.s_idjenis FROM (s_minerba_jenis JOIN view_rekening ON ((s_minerba_jenis.s_idkorek = view_rekening.s_idkorek)));


ALTER TABLE public.view_rekmin OWNER TO postgres;

--
-- Name: view_wp; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_wp AS
    SELECT a.t_idwp, a.t_tgldaftar, a.t_jenispendaftaran, a.t_bidangusaha, a.t_nopendaftaran, CASE WHEN (a.t_bidangusaha = 1) THEN (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((b.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((c.s_kodekel)::text, 2, '0'::text)) ELSE (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((d.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((e.s_kodekel)::text, 2, '0'::text)) END AS t_npwpd, a.t_nik, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_nama ELSE a.t_nama_badan END AS t_nama, CASE WHEN (a.t_bidangusaha = 1) THEN pg_catalog.concat(a.t_alamat, ', RT. ', a.t_rt, ', RW. ', a.t_rw, ', Desa ', c.s_namakel, ', Kec. ', b.s_namakec, ', Kab. ', a.t_kabupaten) ELSE pg_catalog.concat(a.t_jalan_badan, ', RT. ', a.t_rt_badan, ', RW. ', a.t_rw_badan, ', Desa ', e.s_namakel, ', Kec. ', d.s_namakec, ', Kab. ', a.t_kabupaten_badan) END AS t_alamat_lengkap, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_alamat ELSE a.t_jalan_badan END AS t_alamat, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_rt ELSE a.t_rt_badan END AS t_rt, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_rw ELSE a.t_rw_badan END AS t_rw, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_kelurahan ELSE a.t_kelurahan_badan END AS t_kelurahan, CASE WHEN (a.t_bidangusaha = 1) THEN c.s_namakel ELSE e.s_namakel END AS s_namakel, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_kecamatan ELSE a.t_kecamatan_badan END AS t_kecamatan, CASE WHEN (a.t_bidangusaha = 1) THEN b.s_namakec ELSE d.s_namakec END AS s_namakec, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_kabupaten ELSE a.t_kabupaten_badan END AS t_kabupaten, a.t_notelp, a.t_kodepos, a.t_email, a.t_operatorid, a.is_deluser, f.s_nama, a.t_status_wp, a.t_tgl_tutup, a.t_ket_tutup, a.t_operatorid_tutup, a.t_photowp FROM (((((t_wp a LEFT JOIN s_kecamatan b ON ((a.t_kecamatan = b.s_kodekec))) LEFT JOIN s_kelurahan c ON (((a.t_kelurahan = c.s_kodekel) AND (a.t_kecamatan = c.s_idkeckel)))) LEFT JOIN s_kecamatan d ON ((a.t_kecamatan_badan = d.s_kodekec))) LEFT JOIN s_kelurahan e ON (((a.t_kelurahan_badan = e.s_kodekel) AND (a.t_kecamatan_badan = e.s_idkeckel)))) LEFT JOIN s_users f ON ((a.t_operatorid = f.s_iduser)));


ALTER TABLE public.view_wp OWNER TO postgres;

--
-- Name: view_wp_v2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_wp_v2 AS
    SELECT a.t_idwp, a.t_tgldaftar, a.t_jenispendaftaran, a.t_bidangusaha, a.t_nopendaftaran, a.t_nama_badan, a.t_nama, CASE WHEN (a.t_bidangusaha = 1) THEN (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((b.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((c.s_kodekel)::text, 2, '0'::text)) ELSE (((((((((a.t_jenispendaftaran)::text || '.'::text) || a.t_bidangusaha) || '.'::text) || lpad((a.t_nopendaftaran)::text, 7, '0'::text)) || '.'::text) || lpad((d.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((e.s_kodekel)::text, 2, '0'::text)) END AS t_npwpd, a.t_nik, CASE WHEN (a.t_bidangusaha = 1) THEN pg_catalog.concat(a.t_alamat, ', RT. ', a.t_rt, ', RW. ', a.t_rw, ', Desa ', c.s_namakel, ', Kec. ', b.s_namakec, ', Kab. ', a.t_kabupaten) ELSE pg_catalog.concat(a.t_jalan_badan, ', RT. ', a.t_rt_badan, ', RW. ', a.t_rw_badan, ', Desa ', e.s_namakel, ', Kec. ', d.s_namakec, ', Kab. ', a.t_kabupaten_badan) END AS t_alamat_lengkap, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_alamat ELSE a.t_jalan_badan END AS t_alamat, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_rt ELSE a.t_rt_badan END AS t_rt, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_rw ELSE a.t_rw_badan END AS t_rw, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_kelurahan ELSE a.t_kelurahan_badan END AS t_kelurahan, CASE WHEN (a.t_bidangusaha = 1) THEN c.s_namakel ELSE e.s_namakel END AS s_namakel, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_kecamatan ELSE a.t_kecamatan_badan END AS t_kecamatan, CASE WHEN (a.t_bidangusaha = 1) THEN b.s_namakec ELSE d.s_namakec END AS s_namakec, CASE WHEN (a.t_bidangusaha = 1) THEN a.t_kabupaten ELSE a.t_kabupaten_badan END AS t_kabupaten, a.t_notelp, a.t_kodepos, a.t_email, a.t_operatorid, a.is_deluser, f.s_nama, a.t_status_wp, a.t_tgl_tutup, a.t_ket_tutup, a.t_operatorid_tutup, a.t_photowp FROM (((((t_wp a LEFT JOIN s_kecamatan b ON ((a.t_kecamatan = b.s_kodekec))) LEFT JOIN s_kelurahan c ON (((a.t_kelurahan = c.s_kodekel) AND (a.t_kecamatan = c.s_idkeckel)))) LEFT JOIN s_kecamatan d ON ((a.t_kecamatan_badan = d.s_kodekec))) LEFT JOIN s_kelurahan e ON (((a.t_kelurahan_badan = e.s_kodekel) AND (a.t_kecamatan_badan = e.s_idkeckel)))) LEFT JOIN s_users f ON ((a.t_operatorid = f.s_iduser)));


ALTER TABLE public.view_wp_v2 OWNER TO postgres;

--
-- Name: view_wpobjek; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_wpobjek AS
    SELECT a.t_idobjek, a.t_idwp, a.t_noobjek, a.t_tgldaftarobjek, ((((((lpad((a.t_jenisobjek)::text, 2, '0'::text) || '.'::text) || lpad((a.t_noobjek)::text, 5, '0'::text)) || '.'::text) || lpad((g.s_kodekec)::text, 2, '0'::text)) || '.'::text) || lpad((h.s_kodekel)::text, 2, '0'::text)) AS t_nop, a.t_namaobjek, a.t_alamatobjek, a.t_namaobjekpj, a.t_alamatobjekpj, a.t_rtobjek, a.t_rwobjek, a.t_kelurahanobjek, d.s_namakel, a.t_kecamatanobjek, c.s_namakec, a.t_kabupatenobjek, (((((((((a.t_alamatobjek)::text || ', RT. '::text) || (a.t_rtobjek)::text) || ', RW. '::text) || (a.t_rwobjek)::text) || ', Desa '::text) || (d.s_namakel)::text) || ', Kec. '::text) || (c.s_namakec)::text) AS t_alamatlengkapobjek, a.t_kodeposobjek, a.t_latitudeobjek, a.t_longitudeobjek, a.t_notelpobjek, a.t_jenisobjek, a.t_operatorid, b.s_idjenis, b.s_namajenis, b.s_namajenissingkat, b.t_akhirlapor, b.t_akhirbayar, b.t_jmlharitempo, a.t_gambarobjek, b.s_jenispungutan, (SELECT aa.t_npwpd FROM view_wp aa WHERE (aa.t_idwp = a.t_idwp)) AS t_npwpdwp, CASE WHEN (e.t_bidangusaha = 1) THEN e.t_nama ELSE e.t_nama_badan END AS t_namawp, CASE WHEN (e.t_bidangusaha = 1) THEN pg_catalog.concat(e.t_alamat, ', RT. ', e.t_rt, ', RW. ', e.t_rw, ', Desa ', d.s_namakel, ', Kec. ', c.s_namakec, ', Kab. ', e.t_kabupaten) ELSE pg_catalog.concat(e.t_jalan_badan, ', RT. ', e.t_rt_badan, ', RW. ', e.t_rw_badan, ', Desa ', h.s_namakel, ', Kec. ', g.s_namakec, ', Kab. ', e.t_kabupaten_badan) END AS t_alamat_lengkapwp, f.s_nama, a.t_korekobjek, e.t_noberita, a.t_statusobjek, e.t_nik AS t_nikwp, a.t_tipeusaha, i.s_namausaha FROM ((((((((t_wpobjek a LEFT JOIN s_jenisobjek b ON ((a.t_jenisobjek = b.s_idjenis))) LEFT JOIN s_kecamatan c ON ((a.t_kecamatanobjek = c.s_idkec))) LEFT JOIN s_kelurahan d ON (((a.t_kelurahanobjek = d.s_kodekel) AND (a.t_kecamatanobjek = d.s_idkeckel)))) LEFT JOIN t_wp e ON ((a.t_idwp = e.t_idwp))) LEFT JOIN s_users f ON ((a.t_operatorid = f.s_iduser))) LEFT JOIN s_kecamatan g ON ((a.t_kecamatanobjek = g.s_idkec))) LEFT JOIN s_kelurahan h ON (((a.t_kelurahanobjek = h.s_kodekel) AND (a.t_kecamatanobjek = h.s_idkeckel)))) LEFT JOIN s_tipeusaha i ON ((a.t_tipeusaha = i.s_idusaha)));


ALTER TABLE public.view_wpobjek OWNER TO postgres;

--
-- Data for Name: coba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY coba (s_idtarifsupiori, s_idjenisreklame, s_njopr, s_nspr, s_nsr, s_kodejangkawaktu, s_satuan, s_keterangan) FROM stdin;
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permission (id, permission_name, resource_id, alias, permission_role) FROM stdin;
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
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permission_id_seq', 420, false);


--
-- Data for Name: permission_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permission_resource (s_iduser, s_idpermission) FROM stdin;
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
-- Name: rekam_penyetoran_ke_bank_rektorkebank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rekam_penyetoran_ke_bank_rektorkebank_id_seq', 1, false);


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resource (id, resource_name) FROM stdin;
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
-- Name: resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_id_seq', 34, false);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY role (rid, role_name, status) FROM stdin;
2	Admin	Active                                                                                                                                                                                                                                                         
3	Pendaftaran & Pendataan	Active                                                                                                                                                                                                                                                         
4	Penetapan	Active                                                                                                                                                                                                                                                         
5	Penagihan	Active                                                                                                                                                                                                                                                         
6	Bendahara Penerima	Active                                                                                                                                                                                                                                                         
7	Pemeriksaan	Active                                                                                                                                                                                                                                                         
8	Operator	Active                                                                                                                                                                                                                                                         
\.


--
-- Name: role_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_rid_seq', 7, false);


--
-- Data for Name: s_air; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_air (s_idair, s_peruntukan, s_nilai1, s_nilai2, s_nilai3, s_nilai4, s_nilai5, s_nilai6, s_nilai7) FROM stdin;
1	Non Niaga	0.5	0.599999999999999978	0.699999999999999956	0.800000000000000044	0.900000000000000022	1	0
2	Niaga Kecil	2	2.20000000000000018	2.39999999999999991	2.60000000000000009	2.79999999999999982	3	0
3	Industri Kecil	3.5	3.79999999999999982	4.09999999999999964	4.40000000000000036	4.70000000000000018	5	0
4	Niaga Besar	5	5.40000000000000036	5.79999999999999982	6.20000000000000018	6.59999999999999964	7	0
5	Industri Besar	7.5	8	8.5	9	9.5	10	0
\.


--
-- Data for Name: s_air_jenis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_air_jenis (s_id, s_idkelompok, s_nourut, s_deskripsi) FROM stdin;
1	1	1	Rumah Tangga
2	1	2	Instansi Pemerintah
3	1	3	Instansi Non Pemerintah
4	1	4	Asrama Badan Sosial/Panti Asuhan/Rumah Ibadah/Terminal Bus/Stasiun KA/Pasar
5	2	1	Usaha Kecil yang berada dalam rumah tangga/rumah kost
6	2	2	Usaha Kecil/Losmen/Pencucian Kendaraan Bermotor
7	2	3	Rumah Sakit Swasta/Poliklinik/Laboratorium/Praktek Dokter
8	2	4	Pengacara/Notaris
9	2	5	Hotel Melati/Rumah Makan/Katering/Billiard/Bowling/Gedung Pertemuan/Pondok Wisata/Fitness Center
10	2	6	Niaga Kecil lainnya
11	3	1	Hotel Bintang 1,2 dan 3
12	3	2	Steambath/Salon
13	3	3	Bank/BUMN
14	3	4	Night Club/Bar/Pub/Panti Pijat/Bioskop/Supermarket/Persewaan Jasa Kantor
15	3	5	Service Station/Bengkel
16	3	6	Perdagangan/Grosir/Pertokoan/SPBU
17	3	7	Niaga Sedang Lainnya
18	4	1	Real Eastate/Perumahan/Lapangan Golf/Kolam Renang/GOR
19	4	2	Hotel Bintang 4,5/Apartement
20	4	3	Pelabuhan Udara/Pelabuhan Laut
21	4	4	Niaga Besar Lainnya
22	5	1	Industri Rumah Tangga
23	5	2	Pengrajin
24	5	3	Sanggar Seni
25	5	4	Usaha Konveksi
26	5	5	Industri Kecil Lainnya
27	6	1	Pabrik Es
28	6	2	Pabrik Makanan/Minuman
29	6	3	Industri Kimia/Obat-obatan/Kosmetik/Plastic
30	6	4	Pabrik Mesin/Elektronik/Otomotif/Manufacture
31	6	5	Pengolahan Logam
32	6	6	Pabrik Textile/Garment/Kulit/Sepatu/Ban
33	6	7	Pabrik Keramik/Gelas dan sejenisnya
34	6	8	Industri Pengolahan Kertas/Pulf/Kayu
35	6	9	Agro Industri
36	6	10	Industri Sedang Lainnya
37	7	1	Industri Air Minum dalam kemasan
38	7	2	Industri Besar Lainnya
39	8	1	Perkebunan
40	8	2	Perikanan
41	8	3	Peternakan
42	9	1	Kawasan Industri
43	9	2	Perusahaan Pembangunan Perumahan
44	9	3	Penjualan Air Lainnya
45	11	1	Untuk Perusahaan
46	10	1	-
47	12	1	-
\.


--
-- Name: s_air_jenis_s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_air_jenis_s_id_seq', 1, false);


--
-- Data for Name: s_air_kelompok; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_air_kelompok (s_id, s_kode, s_deskripsi) FROM stdin;
4	IV	Niaga Besar
1	I	Sosial / non Niaga
2	II	Niaga Kecil
3	III	Industri Kecil dan Menengah
5	V	Industri Besar
\.


--
-- Name: s_air_kelompok_s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_air_kelompok_s_id_seq', 1, false);


--
-- Name: s_air_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_air_seq', 1, false);


--
-- Data for Name: s_air_tarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_air_tarif (s_idtarif, s_idkelompok, s_nilai1, s_nilai2, s_nilai3, s_nilai4, s_nilai5, s_nilai6, s_nilai7) FROM stdin;
1	1	5100	5200	5300	5400	5500	5600	5700
2	2	5500	5600	5700	5800	5900	6000	6100
3	3	5700	5800	5900	6000	6100	6200	6300
4	4	6200	6300	6400	6500	6600	6700	6800
5	5	6600	6700	6800	6900	7000	7100	7200
\.


--
-- Name: s_air_tarif_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_air_tarif_s_idtarif_seq', 1, false);


--
-- Data for Name: s_air_tarifpipa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_air_tarifpipa (s_idtarif, s_idkelompok, s_pipa1, s_pipa2, s_pipa3, s_pipa4, s_pipa5, s_pipa6, s_pipa7) FROM stdin;
1	1	270	405	540	810	1080	1620	2160
3	3	540	810	1080	1620	2160	3240	4320
4	4	270	405	540	810	1080	1620	2160
5	5	540	810	1080	1620	2160	3240	4320
2	2	270	405	540	810	1080	1620	2160
\.


--
-- Name: s_air_tarifpipa_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_air_tarifpipa_s_idtarif_seq', 1, false);


--
-- Data for Name: s_air_zona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_air_zona (s_idzona, s_kode, s_deskripsi) FROM stdin;
1	A	Zona Aman
2	B	Zona Rawan
3	C	Zona Kritis
4	D	Zona Rusak
\.


--
-- Name: s_air_zona_s_idzona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_air_zona_s_idzona_seq', 1, false);


--
-- Data for Name: s_cekungan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_cekungan (s_idcekungan, s_kriteria, s_nilai) FROM stdin;
1	Daerah Imbuhan	10
2	Daerah Transisi	5
3	Daerah Lepasan	1
\.


--
-- Name: s_cekungan_s_idcekungan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_cekungan_s_idcekungan_seq', 1, false);


--
-- Data for Name: s_faktorkerusakan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_faktorkerusakan (s_idkerusakan, s_kriteria, s_nilai) FROM stdin;
2	Tinggi	10
1	Sedang	5
\.


--
-- Name: s_faktorkerusakan_s_idkerusakan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_faktorkerusakan_s_idkerusakan_seq', 1, false);


--
-- Data for Name: s_faktorkualitasair; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_faktorkualitasair (s_idfaktorkualitas, s_namafaktorkualitas, s_nilai) FROM stdin;
4	Kelas Empat || DHL <750 || Total Coliform <1.000	1
3	Kelas Tiga || DHL >1.000-2.000 || Total Coliform > 5.000-10.000	4
2	Kelas Dua || DHL >750-1.000 || Total Coliform <1.000	7
1	Kelas Satu || DHL <750 || Total Coliform <1.000	10
\.


--
-- Name: s_faktorkualitasair_s_idfaktorkualitas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_faktorkualitasair_s_idfaktorkualitas_seq', 1, false);


--
-- Data for Name: s_faktorluasarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_faktorluasarea (s_idfaktorluasarea, s_areapengaruh, s_nilai) FROM stdin;
2	>50-100 meter	2
3	>100-150 meter	5
4	>150-200 meter	7
5	>200 meter	10
1	<=50 meter	1
\.


--
-- Name: s_faktorluasarea_s_idfaktorluasarea_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_faktorluasarea_s_idfaktorluasarea_seq', 1, false);


--
-- Data for Name: s_faktorsumberair; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_faktorsumberair (s_idsumberair, s_jenissumber, s_nilai) FROM stdin;
1	Sumur Gali (0-30 meter)	10
2	Sumur Bor (>30-60 meter)	7
3	Sumur Bor (>60-85 meter)	4
4	Sumur Bor (>85-100 meter)	2
5	Sumur Bor (>100 meter)	1
\.


--
-- Name: s_faktorsumberair_s_idsumberair_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_faktorsumberair_s_idsumberair_seq', 1, false);


--
-- Data for Name: s_hargaairbaku; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_hargaairbaku (s_idhargaairbaku, s_idjaringan, s_harga) FROM stdin;
1	1	150
2	2	300
\.


--
-- Name: s_hargaairbaku_s_idhargaairbaku_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_hargaairbaku_s_idhargaairbaku_seq', 1, false);


--
-- Data for Name: s_ho_gangguan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_ho_gangguan (s_idgangguan, s_namagangguan, s_indeks) FROM stdin;
\.


--
-- Name: s_ho_gangguan_s_idgangguan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_ho_gangguan_s_idgangguan_seq', 1, false);


--
-- Data for Name: s_ho_lokasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_ho_lokasi (s_idlokasi, s_namalokasi, s_indeks) FROM stdin;
\.


--
-- Name: s_ho_lokasi_s_idlokasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_ho_lokasi_s_idlokasi_seq', 1, false);


--
-- Data for Name: s_ho_luas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_ho_luas (s_idluas, s_luasawal, s_luasakhir, s_indeks) FROM stdin;
\.


--
-- Name: s_ho_luas_s_idluas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_ho_luas_s_idluas_seq', 1, false);


--
-- Data for Name: s_ho_skala; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_ho_skala (s_idskala, s_namaskala, s_tarif, s_satuan) FROM stdin;
\.


--
-- Name: s_ho_skala_s_idskala_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_ho_skala_s_idskala_seq', 1, false);


--
-- Data for Name: s_imb_gunabgn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_imb_gunabgn (s_idgunabgn, s_namagunabgn, s_koefisien) FROM stdin;
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
-- Name: s_imb_gunabgn_s_idgunabgn_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_imb_gunabgn_s_idgunabgn_seq', 1, false);


--
-- Data for Name: s_imb_kondisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_imb_kondisi (s_idkondisi, s_namakondisi, s_koefisien) FROM stdin;
1	Bangunan Permanen	1
2	Bangunan semi permanen (max 15 tahun)	0.900000000000000022
3	Bangunan tidak permanen (umur max 5 tahun)	0.400000000000000022
4	Bangunan darurat (umur max 1 tahun)	0.100000000000000006
\.


--
-- Name: s_imb_kondisi_s_idkondisi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_imb_kondisi_s_idkondisi_seq', 1, false);


--
-- Data for Name: s_imb_lantai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_imb_lantai (s_idlantai, s_namalantai, s_koefisien) FROM stdin;
1	Satu Lantai	1
2	Dua Lantai	1.5
3	Tiga Lantai	2
4	Tower	9.59999999999999964
\.


--
-- Name: s_imb_lantai_s_idlantai_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_imb_lantai_s_idlantai_seq', 1, false);


--
-- Data for Name: s_imb_lokasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_imb_lokasi (s_idlokasi, s_namalokasi, s_koefisien) FROM stdin;
1	Dipinggir Jalan Arteri	1.5
2	Langsung Berada dibelakang jalan Arteri	1.39999999999999991
3	Dipinggir jalan kolektor	1.30000000000000004
4	Langsung Berada dibelakang jalan kolektor	1.25
5	Bangunan dipinggir jalan lokal bangunan yang langsung berada di belakang	1.19999999999999996
6	Jalan Lokal	1.10000000000000009
7	Jalan setapak	0.5
\.


--
-- Name: s_imb_lokasi_s_idlokasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_imb_lokasi_s_idlokasi_seq', 1, false);


--
-- Data for Name: s_imb_luas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_imb_luas (s_idluas, s_namaluas, s_koefisien) FROM stdin;
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
-- Name: s_imb_luas_s_idluas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_imb_luas_s_idluas_seq', 1, false);


--
-- Data for Name: s_imb_tarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_imb_tarif (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
\.


--
-- Name: s_imb_tarif_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_imb_tarif_s_idtarif_seq', 1, false);


--
-- Data for Name: s_jaringanpdam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_jaringanpdam (s_idjaringan, s_namajaringan, s_nilai) FROM stdin;
2	Tidak tersedia Jaringan PDAM	1
1	Tersedia Jaringan PDAM	10
\.


--
-- Name: s_jaringanpdam_s_idjaringan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_jaringanpdam_s_idjaringan_seq', 1, false);


--
-- Data for Name: s_jenisobjek; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_jenisobjek (s_idjenis, s_namajenis, s_namajenissingkat, t_akhirlapor, t_akhirbayar, t_jmlharitempo, s_jenispungutan) FROM stdin;
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
-- Name: s_jenisobjek_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_jenisobjek_seq', 15, false);


--
-- Data for Name: s_jenisreklame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_jenisreklame (s_idjenisreklame, s_namajenisreklame) FROM stdin;
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
-- Name: s_jenisreklame_s_idjenisreklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_jenisreklame_s_idjenisreklame_seq', 1, false);


--
-- Data for Name: s_jenissurat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_jenissurat (s_idsurat, s_namasurat, s_namasingkatsurat) FROM stdin;
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
-- Name: s_jenissurat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_jenissurat_seq', 10, false);


--
-- Data for Name: s_kecamatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_kecamatan (s_idkec, s_kodekec, s_namakec, is_delete) FROM stdin;
0	0	LUAR KOTA	\N
2	2	SUPIORI UTARA	\N
1	1	SUPIORI TIMUR	\N
4	4	SUPIORI SELATAN	\N
5	5	KEPULAUAN ARURI	\N
3	3	SUPIORI BARAT	\N
\.


--
-- Name: s_kecamatan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_kecamatan_seq', 1, false);


--
-- Data for Name: s_kekayaan_tarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_kekayaan_tarif (s_idtarif, s_idklasifikasi, s_klasifikasi, s_namajalan, s_nilailuastanah, s_nilailuasbangunan, s_satuan) FROM stdin;
1	1	Klasifikasi I	Jln. Yos Sudarso	100	2500	bulan
2	2	Klasifikasi II	Kel. Fandoy dan Jalan Pramuka	150	2000	bulan
3	3	Klasifikasi III	Kel. Saramom	150	1500	bulan
\.


--
-- Name: s_kekayaan_tarif_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_kekayaan_tarif_s_idtarif_seq', 1, false);


--
-- Data for Name: s_kekayaankategorisatu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_kekayaankategorisatu (s_idkategorisatu, s_idklasifikasi, s_keterangan, s_tarif, s_satuan) FROM stdin;
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
-- Name: s_kekayaankategorisatu_s_idkategorisatu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_kekayaankategorisatu_s_idkategorisatu_seq', 1, false);


--
-- Data for Name: s_kekayaanpenggunaan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_kekayaanpenggunaan (s_idpenggunaan, s_keterangan) FROM stdin;
1	Penggunaan Tanah
2	Pengunaan Bangunan / Gedung / Rumah Dinas
3	Pemakaian Kendaraan / alat-alat Berat
4	Penggunaan Space Iklan
\.


--
-- Name: s_kekayaanpenggunaan_s_idpenggunaan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_kekayaanpenggunaan_s_idpenggunaan_seq', 1, false);


--
-- Data for Name: s_kekayaantarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_kekayaantarif (s_idtarif, s_idkategorisatu, s_keterangan, s_nilaitanah, s_nilaibangunan, s_satuan) FROM stdin;
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
-- Name: s_kekayaantarif_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_kekayaantarif_s_idtarif_seq', 1, false);


--
-- Data for Name: s_kelurahan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_kelurahan (s_idkel, s_kodekel, s_namakel, s_idkeckel, is_delete) FROM stdin;
32	19	AMYAS	3	\N
40	0	LUAR KOTA	0	\N
72	20	NAPISNDI	3	\N
2	28	BINIKI/RAMARDORI	4	\N
1	24	AWAKI	4	\N
8	11	FANJUR	2	\N
3	29	DIDIABOLO/KUNEF	4	\N
4	25	FANINDI	4	\N
5	27	MARYAIDORI	4	\N
6	23	ODORI/ABABYADI	4	\N
7	26	WARBEFONDI	4	\N
9	12	KOBARI JAYA	2	\N
12	15	WARSA	2	\N
11	13	WARBOR	2	\N
10	14	PUWERI	2	\N
13	6	DUBER	1	\N
22	4	YAWERMA	1	\N
21	5	WOMBONDA/YENDOKER	1	\N
14	10	DOUWBO	1	\N
15	3	MARSRAM	1	\N
16	2	SAUYAS/PARIYEM	1	\N
17	7	SORENDIDORI/SORENDIWERI	1	\N
18	9	SYURDORI	1	\N
19	1	WAFOR	1	\N
20	8	WARYESI	1	\N
31	30	YAMNAISU	5	\N
30	31	WONGKEINA	5	\N
33	17	KOIRYAKAM	3	\N
25	34	INEKI	5	\N
26	37	INSUMBREI	5	\N
27	36	MANGGONSWAN	5	\N
29	33	RAYORI	5	\N
23	38	ARURI	5	\N
28	35	MBRURWANDI	5	\N
24	32	IMBIRSBARI	5	\N
34	22	MAPIA	3	\N
35	21	MASYAI	3	\N
37	16	WARYEI	3	\N
38	18	WAYORI	3	\N
\.


--
-- Name: s_kelurahan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_kelurahan_seq', 1, false);


--
-- Data for Name: s_minerba_jenis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_minerba_jenis (s_idjenisminerba, s_namajenisminerba, s_idkorek, s_idzona, s_harga, s_keterangan) FROM stdin;
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
-- Name: s_minerba_jenis_s_idjenisminerba_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_minerba_jenis_s_idjenisminerba_seq', 109, true);


--
-- Data for Name: s_pejabat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_pejabat (s_idpej, s_namapej, s_jabatanpej, s_pangkatpej, s_nippej) FROM stdin;
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
-- Name: s_pejabat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_pejabat_seq', 9, true);


--
-- Data for Name: s_pemda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_pemda (s_idpemda, s_namaprov, s_namakabkota, s_namaibukotakabkota, s_kodeprovinsi, s_kodekabkot, s_namainstansi, s_namasingkatinstansi, s_alamatinstansi, s_notelinstansi, s_namabank, s_norekbank, s_kodepos, s_logo) FROM stdin;
1	Propinsi Papua	Supiori	Supiori	82	15	Badan Pendapatan Daerah	BAPENDA	Jalan Marsram - Korido	(0981) 492202	Bank Papua	000000000000	98163	public/upload/logo_supiori.png
\.


--
-- Name: s_pemda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_pemda_seq', 1, false);


--
-- Data for Name: s_rekening; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_rekening (s_idkorek, s_jenisobjek, s_tipekorek, s_kelompokkorek, s_jeniskorek, s_objekkorek, s_rinciankorek, s_sub1korek, s_sub2korek, s_sub3korek, s_namakorek, s_persentarifkorek, s_tarifdasarkorek, s_voldasarkorek, s_tariftambahkorek, s_tglawalkorek, s_tglakhirkorek, t_berdasarmasa, is_deluser) FROM stdin;
49	6	4	1	1	06	02	00	00	00	Batu Tulis	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
50	6	4	1	1	06	03	00	00	00	Batu Setengah Permata	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
51	6	4	1	1	06	04	00	00	00	Batu Kapur	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
52	6	4	1	1	06	05	00	00	00	Batu Apung	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
53	6	4	1	1	06	06	00	00	00	Batu Permata	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
54	6	4	1	1	06	07	00	00	00	Bentonit	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
55	6	4	1	1	06	08	00	00	00	Dolomit	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
56	6	4	1	1	06	09	00	00	00	Feldspar	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
57	6	4	1	1	06	10	00	00	00	Garam Batu (Halite)	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
58	6	4	1	1	06	11	00	00	00	Grafit	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
59	6	4	1	1	06	12	00	00	00	Granit / Andesit	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
79	6	4	1	1	06	32	00	00	00	Tras	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
61	6	4	1	1	06	14	00	00	00	Kalsit	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
62	6	4	1	1	06	15	00	00	00	Kaolin	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
63	6	4	1	1	06	16	00	00	00	Leusit	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
64	6	4	1	1	06	17	00	00	00	Magnesit	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
65	6	4	1	1	06	18	00	00	00	Mika	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
66	6	4	1	1	06	19	00	00	00	Marmer	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
67	6	4	1	1	06	20	00	00	00	Nitrat	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
68	6	4	1	1	06	21	00	00	00	Opsidien	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
69	6	4	1	1	06	22	00	00	00	Oker	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
70	6	4	1	1	06	23	00	00	00	Pasir dan kerikil	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
71	6	4	1	1	06	24	00	00	00	Pasir Kuarsa	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
72	6	4	1	1	06	25	00	00	00	Perlit	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
73	6	4	1	1	06	26	00	00	00	Phospat	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
74	6	4	1	1	06	27	00	00	00	Talk	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
76	6	4	1	1	06	29	00	00	00	Tanah Diatome	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
1	0	4	0	0	0	0	00	00	00	PENDAPATAN DAERAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
77	6	4	1	1	06	30	00	00	00	Tanah Liat	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
78	6	4	1	1	06	31	00	00	00	Tawas (Alum)	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
2	0	4	1	0	0	0	00	00	00	PENDAPATAN ASLI DAERAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
146	0	4	1	4	03	00	00	00	00	Jasa Giro	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
3	0	4	1	1	0	0	00	00	00	HASIL PAJAK DAERAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
125	37	4	1	2	03	01	00	00	00	Retribusi Izin Mendirikan Bangunan	0	3000	\N	\N	2020-01-01	2022-12-31	\N	0
75	6	4	1	1	06	28	00	00	00	Tanah Serap (Fullers earth)	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
80	6	4	1	1	06	33	00	00	00	Yarosif	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
82	6	4	1	1	06	35	00	00	00	Basal	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
83	6	4	1	1	06	36	00	00	00	Trakit	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
81	6	4	1	1	06	34	00	00	00	Zeolit	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
84	6	4	1	1	06	37	00	00	00	Mineral bukan logam dan lainnya	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
60	6	4	1	1	06	13	00	00	00	Gips	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
205	16	4	1	2	01	05	01	00	00	Sekali Parkir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
206	16	4	1	2	01	05	02	00	00	Parkir Berlangganan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
25	3	4	1	1	03	03	00	00	00	Kontes Kecantikan, Binaraga, dan sejenisnya	35	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
26	3	4	1	1	03	04	00	00	00	Pameran	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
27	3	4	1	1	03	05	00	00	00	Diskotik, Karaoke, Klab Malam dan sejenisnya	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
28	3	4	1	1	03	06	00	00	00	Sirkus / Akrobat/Sulap	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
29	3	4	1	1	03	07	00	00	00	Permainan Bilyar, Golf, Bowling	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
30	3	4	1	1	03	08	00	00	00	Pacuan Kuda, Kendaraan Bermotor, Permainan Ketangkasan	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
31	3	4	1	1	03	09	00	00	00	Panti Pijat, Refleksi, Mandi Uap/Spa dan Pusat Kebugaran	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
32	3	4	1	1	03	10	00	00	00	Pertandingan Olahraga	35	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
33	4	4	1	1	04	00	00	00	00	Pajak Reklame	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
34	4	4	1	1	04	01	00	00	00	Reklame Papan/Billboard/Videotron/Megatron	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
35	4	4	1	1	04	02	00	00	00	Reklame Kain	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
36	4	4	1	1	04	03	00	00	00	Reklame Melekat/Stiker	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
37	4	4	1	1	04	04	00	00	00	Reklame Selebaran	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
163	1	4	1	4	08	01	00	00	00	Pendapatan Denda Pajak Hotel	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
149	0	4	1	4	03	03	00	00	00	Jasa Giro Dana Cadangan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
150	0	4	1	4	04	00	00	00	00	Pendapatan Bunga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
151	0	4	1	4	04	01	00	00	00	Pendapatan Bunga Deposito	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
152	0	4	1	4	04	02	00	00	00	Dana Bergulir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
153	0	4	1	4	05	00	00	00	00	Tuntutan Ganti Kerugian Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
154	0	4	1	4	05	01	00	00	00	Tuntutan Ganti Kerugian Daerah Terhadap Bendahara	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
155	0	4	1	4	05	02	00	00	00	Tuntutan Ganti Kerugian Daerah Terhadap Pegawai Negeri Bukan Bendahara	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
156	0	4	1	4	06	00	00	00	00	Komisi, Potongan dan Keuntungan Selisih Nilai Tukar Rupiah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
47	6	4	1	1	06	00	00	00	00	Pajak Mineral Bukan Logam dan Batuan	0	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
211	41	4	1	2	03	05	05	00	00	Surat Izin Budi daya Ikan Air Payau	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
207	41	4	1	2	03	05	01	00	00	Surat Izin Usaha Penangkapan Ikan (SIUP)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
208	41	4	1	2	03	05	02	00	00	Surat Izin Penangkapan Ikan (SIPI)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
209	41	4	1	2	03	05	03	00	00	Surat Izin Kapan Penangkapan Ikan (SIKPI)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
210	41	4	1	2	03	05	04	00	00	Surat Izin Budi daya Ikan Air Tawar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
212	41	4	1	2	03	05	06	00	00	Surat Izin Budi daya Ikan Air Laut	0	\N	\N	\N	2020-01-01	2019-12-31	\N	0
45	5	4	1	1	05	01	00	00	00	Pajak Penerangan Jalan dihasilkan sendiri	3	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
157	0	4	1	4	06	01	00	00	00	Penerimaan Komisi dari Penempatan Kas Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
158	0	4	1	4	06	02	00	00	00	Penerimaan Potongan dari	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
162	0	4	1	4	08	00	00	00	00	Pendapatan Denda Pajak	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
116	29	4	1	2	02	04	00	00	00	Retribusi Terminal	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
11	1	4	1	1	01	07	00	00	00	Rumah Penginapan dan sejenisnya	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
13	2	4	1	1	02	00	00	00	00	Pajak Restoran	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
14	2	4	1	1	02	01	00	00	00	Restoran	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
15	2	4	1	1	02	02	00	00	00	Rumah Makan	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
16	2	4	1	1	02	03	00	00	00	Kafetaria	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
17	2	4	1	1	02	04	00	00	00	Kantin	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
18	2	4	1	1	02	05	00	00	00	Warung	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
19	2	4	1	1	02	06	00	00	00	Bar	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
20	2	4	1	1	02	07	00	00	00	Jasa Boga	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
21	2	4	1	1	02	08	00	00	00	Katering	10	\N	\N	\N	2020-01-01	2022-12-31	No	0
22	3	4	1	1	03	00	00	00	00	Pajak Hiburan	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
24	3	4	1	1	03	02	00	00	00	Pagelaran Kesenian / Musik / Tari / Busana	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
12	1	4	1	1	01	08	00	00	00	Rumah Kos dengan jumlah kamar lebih dari 10 (sepuluh)	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
23	3	4	1	1	03	01	00	00	00	Tontonan Film / Bioskop	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
38	4	4	1	1	04	05	00	00	00	Reklame Berjalan	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
39	4	4	1	1	04	06	00	00	00	Reklame Udara	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
40	4	4	1	1	04	07	00	00	00	Reklame Apung	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
41	4	4	1	1	04	08	00	00	00	Reklame Suara	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
42	4	4	1	1	04	09	00	00	00	Reklame Film/Slide	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
43	4	4	1	1	04	10	00	00	00	Reklame Peragaan	25	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
215	4	4	1	1	04	01	01	00	00	Reklame Papan	25	0	0	0	2020-01-01	2022-12-31	\N	0
217	4	4	1	1	04	01	03	00	00	Reklame Bersinar Papan	25	0	0	0	2020-01-01	2022-12-31	\N	0
218	4	4	1	1	04	01	04	00	00	Reklame Bersinar Megatron/Billboard	25	0	0	0	2020-01-01	2022-12-31	\N	0
219	4	4	1	1	04	01	05	00	00	Reklame Bersinar Neon Box	25	0	0	0	2020-01-01	2022-12-31	\N	0
216	4	4	1	1	04	01	02	00	00	Reklame Billboard	25	0	0	0	2020-01-01	2022-12-31	\N	0
4	1	4	1	1	01	00	00	00	00	Pajak Hotel	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
5	1	4	1	1	01	01	00	00	00	Hotel	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
6	1	4	1	1	01	02	00	00	00	Motel	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
7	1	4	1	1	01	03	00	00	00	Losmen	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
8	1	4	1	1	01	04	00	00	00	Gubuk Pariwisata	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
44	5	4	1	1	05	00	00	00	00	Pajak Penerangan Jalan	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
46	5	4	1	1	05	02	00	00	00	Pajak Penerangan Jalan sumber lain	1.5	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
177	14	4	1	4	09	03	00	00	00	Pendapatan Denda Retribusi Penggantian Biaya Cetak Kartu Tanda Penduduk dan Akta Catatan Sipil	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
178	15	4	1	4	09	04	00	00	00	Pendapatan Denda Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
86	7	4	1	1	07	01	00	00	00	Pajak Parkir	30	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
89	9	4	1	1	09	00	00	00	00	Pajak Sarang Burung Walet	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
100	14	4	1	2	01	03	00	00	00	Retribusi Penggantian Biaya Cetak Kartu Tanda Penduduk dan Akta Catatan Sipil	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
130	0	4	1	3	0	0	00	00	00	HASIL PENGELOLAAN KEKAYAAN DAERAH YANG DIPISAHKAN	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
129	41	4	1	2	03	05	00	00	00	Retribusi Izin Usaha Perikanan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
172	10	4	1	4	08	10	00	00	00	Pendapatan Denda Pajak Bumi dan Bangunan Perdesaan dan Perkotaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
85	7	4	1	1	07	00	00	00	00	Pajak Parkir	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
87	8	4	1	1	08	00	00	00	00	Pajak Air Tanah	0	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
91	10	4	1	1	10	00	00	00	00	Pajak Bumi dan Bangunan Perdesaan dan Perkotaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
92	10	4	1	1	10	01	00	00	00	Pajak Bumi dan Bangunan Perdesaan dan Perkotaan	2	\N	\N	\N	2020-01-01	2022-12-31	\N	0
93	11	4	1	1	11	00	00	00	00	Bea Perolehan Hak Atas Tanah dan Bangunan (BPHTB)	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
94	11	4	1	1	11	01	00	00	00	BPHTB - Pemindahan Hak	5	\N	\N	\N	2020-01-01	2022-12-31	\N	0
95	11	4	1	1	11	02	00	00	00	BPHTB - Pemberian Hak Baru	5	\N	\N	\N	2020-01-01	2022-12-31	\N	0
96	0	4	1	2	0	0	00	00	00	HASIL RETRIBUSI DAERAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
97	0	4	1	2	01	00	00	00	00	Retribusi Jasa Umum	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
98	12	4	1	2	01	01	00	00	00	Retribusi Pelayanan Kesehatan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
99	13	4	1	2	01	02	00	00	00	Retribusi Pelayanan Persampahan/Kebersihan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
101	15	4	1	2	01	04	00	00	00	Retribusi Pelayanan Pemakaman dan Pengabuan Mayat	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
102	16	4	1	2	01	05	00	00	00	Retribusi Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
103	17	4	1	2	01	06	00	00	00	Retribusi Pelayanan Pasar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
104	18	4	1	2	01	07	00	00	00	Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
105	19	4	1	2	01	08	00	00	00	Retribusi Pemeriksaan Alat Pemadam Kebakaran	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
106	20	4	1	2	01	09	00	00	00	Retribusi Penggantian Biaya Cetak Peta	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
107	21	4	1	2	01	10	00	00	00	Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
48	6	4	1	1	06	01	00	00	00	Asbes	20	5000	\N	\N	2020-01-01	2022-12-31	Yes	0
108	22	4	1	2	01	11	00	00	00	Retribusi Pengolahan Limbah Cair	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
109	23	4	1	2	01	12	00	00	00	Retribusi Pelayanan Tera/Tera Ulang	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
110	24	4	1	2	01	13	00	00	00	Retribusi Pelayanan Pendidikan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
112	0	4	1	2	02	00	00	00	00	Retribusi Jasa Usaha	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
113	26	4	1	2	02	01	00	00	00	Retribusi Pemakaian Kekayaan Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
114	27	4	1	2	02	02	00	00	00	Retribusi Pasar Grosir dan/atau Pertokoan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
115	28	4	1	2	02	03	00	00	00	Retribusi Tempat Pelelangan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
117	30	4	1	2	02	05	00	00	00	Retribusi Tempat Khusus Parkir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
118	31	4	1	2	02	06	00	00	00	Retribusi Tempat Penginapan/Pesanggrahan/Villa	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
119	32	4	1	2	02	07	00	00	00	Retribusi Rumah Potong Hewan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
120	33	4	1	2	02	08	00	00	00	Retribusi Pelayanan Kepelabuhanan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
121	34	4	1	2	02	09	00	00	00	Retribusi Tempat Rekreasi dan Olahraga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
122	35	4	1	2	02	10	00	00	00	Retribusi Penyeberangan di Air	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
123	36	4	1	2	02	11	00	00	00	Retribusi Penjualan Produksi Usaha Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
124	0	4	1	2	03	00	00	00	00	Retribusi Perizinan Tertentu	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
126	38	4	1	2	03	02	00	00	00	Retribusi Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
128	40	4	1	2	03	04	00	00	00	Retribusi Izin Trayek	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
133	0	4	1	3	02	00	00	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Milik Negara/BUMN	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
134	0	4	1	3	02	01	00	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada BUMN ..............	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
135	0	4	1	3	03	00	00	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Milik Swasta	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
136	0	4	1	3	03	01	00	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Milik Swasta…….	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
137	0	4	1	4	0	0	00	00	00	LAIN-LAIN PENDAPATAN ASLI DAERAH YANG SAH	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
138	0	4	1	4	01	00	00	00	00	Hasil Penjualan Aset Daerah Yang Tidak Dipisahkan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
140	0	4	1	4	01	02	00	00	00	Hasil Penjualan Peralatan dan Mesin	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
141	0	4	1	4	01	03	00	00	00	Hasil Penjualan Gedung dan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
142	0	4	1	4	01	04	00	00	00	Hasil Penjualan Jalan, Irigasi dan Jaringan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
143	0	4	1	4	01	05	00	00	00	Hasil Penjualan Aset Tetap Lainnya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
144	0	4	1	4	02	00	00	00	00	Hasil Penjualan Aset Lainnya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
145	0	4	1	4	02	01	00	00	00	Hasil Penjualan Aset Lainnya	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
159	0	4	1	4	06	03	00	00	00	Penerimaan Keuntungan Selisih Nilai Tukar Rupiah dari ...	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
160	0	4	1	4	07	00	00	00	00	Pendapatan Denda Atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
161	0	4	1	4	07	01	00	00	00	Pendapatan Denda Atas Keterlambatan Pelaksanaan Pekerjaan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
164	2	4	1	4	08	02	00	00	00	Pendapatan Denda Pajak Restoran	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
165	3	4	1	4	08	03	00	00	00	Pendapatan Denda Pajak Hiburan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
166	4	4	1	4	08	04	00	00	00	Pendapatan Denda Pajak Reklame	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
167	5	4	1	4	08	05	00	00	00	Pendapatan Denda Pajak Penerangan Jalan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
173	11	4	1	4	08	11	00	00	00	Pendapatan Denda Bea Perolehan Hak Atas Tanah dan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
175	12	4	1	4	09	01	00	00	00	Pendapatan Denda Retribusi Pelayanan Kesehatan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
174	0	4	1	4	09	00	00	00	00	Pendapatan Denda Retribusi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
176	13	4	1	4	09	02	00	00	00	Pendapatan Denda Retribusi Pelayanan Persampahan/ Kebersihan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
179	16	4	1	4	09	05	00	00	00	Pendapatan Denda Retribusi Pelayanan Parkir di Tepi Jalan Umum	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
180	17	4	1	4	09	06	00	00	00	Pendapatan Denda Retribusi Pelayanan Pasar	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
203	40	4	1	4	09	29	00	00	00	Pendapatan Denda Retribusi Izin Trayek	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
204	41	4	1	4	09	30	00	00	00	Pendapatan Denda Retribusi Izin Perikanan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
169	7	4	1	4	08	07	00	00	00	Pendapatan Denda Pajak Parkir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
170	8	4	1	4	08	08	00	00	00	Pendapatan Denda Pajak Air Tanah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
171	9	4	1	4	08	09	00	00	00	Pendapatan Denda Pajak Sarang Burung Walet	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
88	8	4	1	1	08	01	00	00	00	Pajak Air Tanah	20	2668	\N	\N	2020-01-01	2022-12-31	Yes	0
147	0	4	1	4	03	01	00	00	00	Jasa Giro Kas Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
148	0	4	1	4	03	02	00	00	00	Jasa Giro Bendahara	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
90	9	4	1	1	09	01	00	00	00	Pajak Sarang Burung Walet	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
131	0	4	1	3	01	00	00	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Milik Daerah/BUMD	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
132	0	4	1	3	01	01	00	00	00	Bagian Laba yang dibagikan kepada Pemda (deviden) atas penyertaan modal pada Perusahaan Daerah/BUMD ........	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
111	25	4	1	2	01	14	00	00	00	Retribusi Pengendalian Menara Telekomunikasi	2	\N	\N	\N	2020-01-01	2022-12-31	\N	0
139	0	4	1	4	01	01	00	00	00	Hasil Penjualan Tanah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
168	6	4	1	4	08	06	00	00	00	Pendapatan Denda Pajak Mineral Bukan Logam dan Batuan	0	5000	\N	\N	2020-01-01	2022-12-31	\N	0
9	1	4	1	1	01	05	00	00	00	Wisma Pariwisata	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
10	1	4	1	1	01	06	00	00	00	Pesanggrahan	10	\N	\N	\N	2020-01-01	2022-12-31	Yes	0
127	39	4	1	2	03	03	00	00	00	Retribusi Izin Gangguan/ SIGTU	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
181	18	4	1	4	09	07	00	00	00	Pendapatan Denda Retribusi Pengujian Kendaraan Bermotor	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
182	19	4	1	4	09	08	00	00	00	Pendapatan Denda Retribusi Pemeriksaan Alat Pemadam Kebakaran	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
183	20	4	1	4	09	09	00	00	00	Pendapatan Denda Retribusi Penggantian Biaya Cetak Peta	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
184	21	4	1	4	09	10	00	00	00	Pendapatan Denda Retribusi Penyediaan dan/atau Penyedotan Kakus	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
185	22	4	1	4	09	11	00	00	00	Pendapatan Denda Retribusi Pengolahan Limbah Cair	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
186	23	4	1	4	09	12	00	00	00	Pendapatan Denda Retribusi Pelayanan Tera/Tera Ulang	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
187	24	4	1	4	09	13	00	00	00	Pendapatan Denda Retribusi Pelayanan Pendidikan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
188	25	4	1	4	09	14	00	00	00	Pendapatan Denda Retribusi Pengendalian Menara Telekomunikasi	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
189	26	4	1	4	09	15	00	00	00	Pendapatan Denda Retribusi Pemakaian Kekayaan Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
190	27	4	1	4	09	16	00	00	00	Pendapatan Denda Retribusi Pasar Grosir dan/ atau Pertokoan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
191	28	4	1	4	09	17	00	00	00	Pendapatan Denda Retribusi Tempat Pelelangan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
192	29	4	1	4	09	18	00	00	00	Pendapatan Denda Retribusi Terminal	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
193	30	4	1	4	09	19	00	00	00	Pendapatan Denda Retribusi Tempat Khusus Parkir	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
194	31	4	1	4	09	20	00	00	00	Pendapatan Denda Retribusi Tempat Penginapan/ Pesanggrahan/ Villa	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
195	32	4	1	4	09	21	00	00	00	Pendapatan Denda Retribusi Rumah Potong Hewan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
196	33	4	1	4	09	22	00	00	00	Pendapatan Denda Retribusi Pelayanan Kepelabuhan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
197	34	4	1	4	09	23	00	00	00	Pendapatan Denda Retribusi Tempat Rekreasi dan Olah raga	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
198	35	4	1	4	09	24	00	00	00	Pendapatan Denda Retribusi Penyeberangan Air	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
199	36	4	1	4	09	25	00	00	00	Pendapatan Denda Retribusi Penjualan Produksi Usaha Daerah	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
200	37	4	1	4	09	26	00	00	00	Pendapatan Denda Retribusi Izin Mendirikan Bangunan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
201	38	4	1	4	09	27	00	00	00	Pendapatan Denda Retribusi Izin Tempat Penjualan Minuman Beralkohol	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
202	39	4	1	4	09	28	00	00	00	Pendapatan Denda Retribusi Izin Gangguan	0	\N	\N	\N	2020-01-01	2022-12-31	\N	0
300	26	4	1	2	02	01	01	00	00	Kerja Sama Pemanfaatan Aset Daerah	0	0	0	0	2020-01-01	2021-12-31	\N	0
301	26	4	1	2	02	01	02	00	00	Sewa Penggunaan Rumah Dinas	0	0	0	0	2020-01-01	2021-12-31	\N	0
\.


--
-- Name: s_rekening_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_rekening_seq', 2, true);


--
-- Data for Name: s_reklame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame (s_idreklame, s_namareklame, s_ukuranreklame, s_satuanreklame, s_lokminggu1, s_lokbulan1, s_loktahun1, s_lokminggu2, s_lokbulan2, s_loktahun2, s_sewaminggu, s_sewabulan, s_sewatahun, s_idrekeningreklame) FROM stdin;
1	Spanduk/Layar/Umbul-umbul (kain,plastik)	1	m2	6625	20125	152625	5625	16875	115125	5025	13125	92625	49
2	Benner Rangka Besi Umbul-umbul (kain, plastik)	1	m2	7500	21000	153500	6500	18125	116000	5900	14000	93500	49
3	Billboard / Megatron ( bahan dominan kayu dan lainnya )	1	m2	9625	23125	155625	8625	21875	118125	8025	16125	95625	48
4	Billboard / Megatron ( Bahan dominan Logam/Plastik )	1	m2	10250	23750	156250	9250	23125	118750	8650	16750	96250	48
5	Billboard / Megatron (Bahan dominan Logam/ plastik dengan Acesoris)	1	m2	21500	35000	167500	20500	23125	130000	19900	28000	107500	48
6	Billboard / Megatron (Bahan dominan kayu dan lainnya dg Acesoris )	1	m2	14000	27500	160000	13000	28125	122500	12400	20500	100000	48
7	Billboard Bando Jalan	1	m2	17750	31250	163750	16750	33125	126250	16150	24250	103750	48
8	Video Tron	1	m2	21500	35000	167500	20500	38125	130000	19900	28000	107500	48
9	Poster, Stiker melekat ( Bahan Kertas )	1	lembar	1013	3825	37575	700	2625	25075	388	1325	12575	98
10	Melekat / Stiker ( Bahan plastik )	1	lembar	2650	5150	50150	2025	4000	37650	1400	2650	25150	98
11	Selebaran	1	lembar	188	938	9375	125	625	6250	63	313	3125	98
12	Suara	1	jam	16500	30000	162500	15500	38125	125000	14900	23000	102500	55
13	Udara ( bahan dominan kain )	1	m	6500	20000	152500	5500	18125	115000	4900	13000	92500	53
14	Udara ( bahan dominan plastik, karet)	1	m2	7750	21250	153750	6750	20625	116250	6150	14250	93750	53
15	Film / Slide	1	jam	11500	25000	157500	10500	28125	120000	9900	18000	97500	56
16	Peragaan ( bahan alat rumah tangga dan sejenisnya )	1	m2	10250	23750	156250	9250	23125	118750	8650	16750	96250	57
17	Peragaan ( bahan barang elektronik )	1	m2	35250	48750	181250	34250	63125	143750	33650	41750	121250	57
18	Peragaan ( bahan mesin motor )	1	m2	47750	61250	193750	46750	75625	156250	46150	54250	133750	57
\.


--
-- Data for Name: s_reklame_berjalan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_berjalan (s_idberjalan, s_jeniskendaraan, s_masareklame, s_nsrberjalan) FROM stdin;
2	0	1	5000
3	0	2	15000
4	0	3	30000
5	0	4	50000
6	0	5	75000
7	1	0	2000
8	1	1	10000
9	1	2	30000
10	1	3	60000
11	1	4	100000
12	1	5	150000
1	0	0	1000
\.


--
-- Name: s_reklame_berjalan_s_idberjalan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_berjalan_s_idberjalan_seq', 1, false);


--
-- Name: s_reklame_index_tinggi_s_idindex_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_index_tinggi_s_idindex_seq', 1, false);


--
-- Name: s_reklame_index_zona_s_idindex_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_index_zona_s_idindex_seq', 1, false);


--
-- Name: s_reklame_jangkawaktureklame_s_idjangkawaktureklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_jangkawaktureklame_s_idjangkawaktureklame_seq', 1, false);


--
-- Data for Name: s_reklame_jenis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_jenis (s_idjenis, s_nama, s_idkorek, s_kodekawasan, s_masa, s_tarif, s_ket) FROM stdin;
3	MEGATRON/VIDEOTRON/LED (Tahunan Kawasan Strategis)	34	1	4	1725000	PERBUP Supiori 2018
4	MEGATRON/VIDEOTRON/LED (Bulanan Kawasan Strategis)	34	1	3	143750	PERBUP  Kabupaten Supiori Tahun 2018
6	MEGATRON/VIDEOTRON/LED (Harian kawasan Strategis)	34	1	1	8000	PERBUP  Kabupaten Supiori 2018
49	SPANDUK/BANNER/SUNCRENT/UMBUL-UMBUL (Bulanan Kawasan Sedang)	35	2	3	3600	-
14	\tMEGATRON/VIDEOTRON/LED (Harian Kawasan Lainnya)	34	3	1	8000	-
50	SPANDUK/BANNER/SUNCRENT/UMBUL-UMBUL (Mingguan Kawasan Sedang)	35	2	2	900	-
51	SPANDUK/BANNER/SUNCRENT/UMBUL-UMBUL (Tahunan Kawasan Lainnya)	35	3	4	36250	-
52	SPANDUK/BANNER/SUNCRENT/UMBUL-UMBUL (Bulanan Kawasan Lainnya)	35	3	3	3000	-
10	MEGATRON/VIDEOTRON/LED (Harian Kawasan Sedang)	34	2	1	8000	-
53	SPANDUK/BANNER/SUNCRENT/UMBUL-UMBUL (Mingguan Kawasan Lainnya)	35	3	2	7600	-
7	MEGATRON/VIDEOTRON/LED (Tahunan Kawasan Sedang)	34	2	4	1481250	-
8	MEGATRON/VIDEOTRON/LED (Bulanan Kawasan Sedang)	34	2	3	123450	-
9	MEGATRON/VIDEOTRON/LED (Mingguan Kawasan Sedang)	34	2	2	300900	-
11	MEGATRON/VIDEOTRON/LED (Tahunan Kawasan Lainnya)	34	3	4	1250000	-
12	MEGATRON/VIDEOTRON/LED (Bulanan Kawasan Lainnya)	34	3	3	104200	-
13	MEGATRON/VIDEOTRON/LED (Mingguan Kawasan Lainnya)	34	3	2	26000	-
16	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/NEON BOX BERCAHAYA (Bulanan Kawasan Strategis)	34	1	3	28150	-
17	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/NEON BOX BERCAHAYA (Mingguan Kawasan Strategis)	34	1	2	7000	-
18	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/NEON BOX BERCAHAYA (Harian Kawasan Strategis)	34	1	1	5000	-
20	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/NEON BOX BERCAHAYA (Bulanan Kawasan Sedang)	34	2	3	26600	-
21	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/NEON BOX BERCAHAYA (Mingguan Kawasan Sedang)	34	2	2	6700	-
22	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/NEON BOX BERCAHAYA (Harian Kawasan Sedang)	34	2	1	5000	-
24	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/NEON BOX BERCAHAYA (Bulanan Kawasan Lainnya)	34	3	3	24900	-
25	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/NEON BOX BERCAHAYA (Mingguan Kawasan Lainnya)	34	3	2	6200	-
26	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/NEON BOX BERCAHAYA (Harian Kawasan Lainnya)	34	3	1	5000	-
27	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/WALL PAINTING TIDAK BERCAHAYA (Tahunan Kawasan Strategis)	216	1	4	68250	-
28	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/WALL PAINTING TIDAK BERCAHAYA (Bulanan Kawasan Strategis)	216	1	3	5600	-
29	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/WALL PAINTING TIDAK BERCAHAYA (Mingguan Kawasan Strategis)	216	1	2	1400	-
31	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/WALL PAINTING TIDAK BERCAHAYA (Bulanan Kawasan Sedang)	216	2	3	4600	-
32	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/WALL PAINTING TIDAK BERCAHAYA (Mingguan Kawasan Sedang)	216	2	2	1100	-
34	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/WALL PAINTING TIDAK BERCAHAYA (Bulanan Kawasan Lainnya))	216	3	3	3700	-
35	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/WALL PAINTING TIDAK BERCAHAYA (Mingguan Kawasan Lainnya))	216	3	2	900	-
37	MELEKAT/STRIKER/POSTER/TINPLATE (Bulanan Kawasan Strategis)	36	1	3	4100	-
38	MELEKAT/STRIKER/POSTER/TINPLATE (Mingguan Kawasan Strategis)	36	1	2	1000	-
39	MELEKAT/STRIKER/POSTER/TINPLATE (Tahunan Kawasan Sedang)	36	2	4	41600	-
40	MELEKAT/STRIKER/POSTER/TINPLATE (Bulanan Kawasan Sedang)	36	2	3	3500	-
41	MELEKAT/STRIKER/POSTER/TINPLATE (Mingguan Kawasan Sedang)	36	2	2	900	-
42	MELEKAT/STRIKER/POSTER/TINPLATE (Tahunan Kawasan Lainnya)	36	3	4	36250	-
5	MEGATRON/VIDEOTRON/LED (Mingguan Kawasan Strategis)	34	1	2	35900	PERBUP  Supiori Tahun 2018
43	MELEKAT/STRIKER/POSTER/TINPLATE (Bulanan Kawasan Lainnya)	36	3	3	2850	-
44	MELEKAT/STRIKER/POSTER/TINPLATE (Mingguan Kawasan Lainnya)	36	3	2	700	-
46	SPANDUK/BANNER/SUNCRENT/UMBUL-UMBUL (Bulanan Kawasan Strategis)	35	1	3	4300	-
47	SPANDUK/BANNER/SUNCRENT/UMBUL-UMBUL (Mingguan Kawasan Strategis)	35	1		1100	-
48	SPANDUK/BANNER/SUNCRENT/UMBUL-UMBUL (Tahunan Kawasan Sedang)	35	2	4	43750	-
55	SELEBARAN (Tidak Berwarna)	37	3	1	1000	-
30	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/WALL PAINTING TIDAK BERCAHAYA (Tahunan Kawasan Sedang)	216	2	4	54875	-
56	KENDARAAN/ BERJALAN	38	3	1	50000	-
57	SELEBARAN  (Berwarna)	37	1	1	2000	-
58	vgregtejt	42	2		68250	-
54	SELEBARAN  (Berwarna)	37	3	4	2000	-
15	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/NEON BOX BERCAHAYA (Tahunan Kawasan Strategis)	34	1	4	338000	-
33	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/WALL PAINTING TIDAK BERCAHAYA (Tahunan Kawasan Lainnya))	216	3	4	43875	-
23	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/NEON BOX BERCAHAYA (Tahunan Kawasan Lainnya)	34	3	4	299000	-
19	BALIHO/BILLBOARD/PAPAN NAMA SHOP SIGN/NEON BOX BERCAHAYA (Tahunan Kawasan Sedang))	34	2	4	320000	-
36	MELEKAT/STRIKER/POSTER/TINPLATE (Tahunan Kawasan Strategis)	36	1	4	48500	-
45	SPANDUK/BANNER/SUNCRENT/UMBUL-UMBUL (Tahunan Kawasan Strategis)	35	1	4	51250	-
\.


--
-- Name: s_reklame_jenis_s_idjenis_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_jenis_s_idjenis_seq', 58, true);


--
-- Data for Name: s_reklame_kawasan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_kawasan (s_idkawasan, s_kawasan, s_lokasi, s_kodekawasan) FROM stdin;
2	Kawasan Strategis	Sorendiweri - Duber	1
3	Kawasan Strategis	Sorendiweri – Sauyas	1
1	Kawasan Strategis	Sorendiweri - Waryesi	1
4	Kawasan Strategis	Sorendiweri Pasar Sentral	1
5	Kawasan Sedang	Waryesi – Douwbo	2
7	Kawasan Sedang	Pasar Sentral - Wombonda	2
8	Kawasan Lainnya	Yenggarbun – Mapia	3
9	Kawasan Lainnya	Wombonda – Kepulauan Aruri	3
10	Kawasan Strategis	Sorendiweri - Wafor	1
6	Kawasan Sedang	Wafor – Yenggarbun	2
\.


--
-- Name: s_reklame_kawasan_s_idkawasan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_kawasan_s_idkawasan_seq', 4, true);


--
-- Name: s_reklame_klarifikasi_jalan_s_idklj_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_klarifikasi_jalan_s_idklj_seq', 1, false);


--
-- Name: s_reklame_koefisienjenis_s_idkoefisienjenis_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_koefisienjenis_s_idkoefisienjenis_seq', 1, false);


--
-- Name: s_reklame_koefisienpemasangan_s_idkoefisienpemasangan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_koefisienpemasangan_s_idkoefisienpemasangan_seq', 1, false);


--
-- Name: s_reklame_lokasi_s_idlokasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_lokasi_s_idlokasi_seq', 1, false);


--
-- Data for Name: s_reklame_njopr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_njopr (s_idnjopr, s_idkorek, s_tarif_njopr, s_keterangan) FROM stdin;
1	62	33120	Papan tetap tanpa lampu / disinari / bersinar
2	170	4001280	Megatron Vidiotron
3	85	110400	Bandho tanpa lampu
4	86	140640	Bandho dengan lampu (disinari / bersinar)
5	53	62880	Billboard tanpa lampu
6	54	67680	Billboard Disinari
7	55	72960	Billboard Bersinar
8	56	31200	Papan kayu dan finil
9	57	41400	Papan Seng
10	58	46200	Papan Formika
11	59	51000	Papan Alumunium
12	60	51000	Papan Wall Painting
13	61	50000	Baliho
15	66	2000	Melekat / Stiker
14	64	10000	Spanduk - Umbul-umbul
16	68	300	Selebaran - Berwarna
17	69	200	Selebaran - tak berwarna
18	70	15000	Selebaran - Flag chain
19	72	720000	Berjalan - Bus
20	73	480000	Berjalan - Non Bus
21	75	800000	Udara
22	79	50000	Suara
\.


--
-- Name: s_reklame_njopr_s_idnjopr_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_njopr_s_idnjopr_seq', 1, false);


--
-- Data for Name: s_reklame_selebaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_selebaran (s_idselebaran, s_nsrselebaran, s_luasselebaran_min, s_luasselebaran_max) FROM stdin;
2	2000	0.260000000000000009	0.5
3	8000	0.510000000000000009	999999999
1	1000	0	0.25
\.


--
-- Name: s_reklame_selebaran_s_idselebaran_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_selebaran_s_idselebaran_seq', 1, false);


--
-- Name: s_reklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_seq', 1, false);


--
-- Data for Name: s_reklame_skorukuran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_skorukuran (s_idskorukuran, s_ukuran_min, s_ukuran_max, s_skor) FROM stdin;
1	0	5	1
2	6	10	2
3	11	15	3
4	16	20	4
5	21	30	6
6	31	40	8
7	41	999999999	10
\.


--
-- Name: s_reklame_skorukuran_s_idskorukuran_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_skorukuran_s_idskorukuran_seq', 1, false);


--
-- Data for Name: s_reklame_stiker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_stiker (s_idstiker, s_nsrstiker, s_luasstiker_min, s_luasstiker_max) FROM stdin;
2	4000	0.260000000000000009	0.5
3	10000	0.510000000000000009	1
4	40000	1.10000000000000009	999999999
1	2000	0	0.25
\.


--
-- Name: s_reklame_stiker_s_idstiker_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_stiker_s_idstiker_seq', 1, false);


--
-- Data for Name: s_reklame_sudutpandang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_sudutpandang (s_idsudutpandang, s_namasudutpandang, s_skorsudutpandang) FROM stdin;
1	Satu Arah	4
2	Dua Arah	6
3	Tiga Arah	8
\.


--
-- Data for Name: s_reklame_tarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_tarif (s_idtarif, s_idjenisreklame, s_njor1, s_njor2, s_njor3, s_njor4, s_njor_lainnya, s_satuan) FROM stdin;
1	1	20000	35000	50000	60000	0	m2
2	2	15000	20000	30000	40000	0	m2
3	3	15000	20000	25000	30000	0	m2
4	4	15000	20000	75000	75000	0	m2
5	5	17500	20000	22500	25000	0	m2
6	6	45000	75000	100000	125000	0	m2
7	7	25000	35000	50000	75000	0	m2
8	8	10000	12500	15000	17500	0	m2
9	9	0	0	0	0	500	/Rim
10	10	7500	10000	12500	15000	0	m2
11	11	0	0	0	0	1000000	Buah
12	12	0	0	0	0	1600000	
13	13	0	0	0	0	2000000	Roll
14	14	0	0	0	0	1600000	/Penyelenggara
\.


--
-- Data for Name: s_reklame_tarif_kawasan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_tarif_kawasan (s_idtarif, s_idwilayah, s_tarif1, s_tarif2, s_tarif3, s_tarif4, s_tarif_lainnya) FROM stdin;
1	1	50000	75000	100000	150000	120000
2	2	42500	65000	90000	125000	100000
3	3	41500	62500	70000	110000	95000
4	4	40000	60000	65000	100000	90000
5	5	25000	35000	45000	55000	70000
6	6	20000	25000	30000	35000	60000
7	7	17500	20000	25000	30000	50000
8	8	15000	17500	20000	25000	40000
9	9	12500	15000	17500	20000	30000
10	10	12500	15000	17500	20000	30000
\.


--
-- Name: s_reklame_tarif_kawasan_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_tarif_kawasan_s_idtarif_seq', 1, false);


--
-- Data for Name: s_reklame_tarif_klarifikasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_tarif_klarifikasi (s_idtarif, s_idklarifikasi, s_nspr1, s_nspr2, s_nspr3, s_nspr4, s_nspr_lainnya) FROM stdin;
1	1	20000	30000	40000	50000	50000
2	2	17500	25000	37500	47500	45000
3	3	15000	17500	27500	35000	35000
4	4	12500	10000	17500	20000	25000
\.


--
-- Name: s_reklame_tarif_klarifikasi_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_tarif_klarifikasi_s_idtarif_seq', 1, false);


--
-- Name: s_reklame_tarif_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_tarif_s_idtarif_seq', 1, false);


--
-- Data for Name: s_reklame_tarif_supiori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_tarif_supiori (s_idtarifsupiori, s_idjenisreklame, s_njopr, s_nspr, s_nsr, s_kodejangkawaktu, s_satuan, s_keterangan) FROM stdin;
1	4	4500000	2400000	6900000	2	m2	Dihitung pertahun apa- bila  kurang dari satu tahun maka di hitung satu tahun.
2	1	4500000	2400000	6900000	2	m2	Dihitung pertahun apa- bila  kurang dari satu tahun maka di hitung satu tahun.
3	2	4500000	2400000	6900000	2	m2	Dihitung pertahun apa- bila  kurang dari satu tahun maka di hitung satu tahun.
4	3	4500000	2400000	6900000	2	m2	Dihitung pertahun apa- bila  kurang dari satu tahun maka di hitung satu tahun.
\.


--
-- Name: s_reklame_tarif_supiori_s_idtarifsupiori_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_tarif_supiori_s_idtarifsupiori_seq', 5, true);


--
-- Data for Name: s_reklame_tarif_tinggi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_tarif_tinggi (s_idtarif, s_tariftinggi, s_tinggi_min, s_tinggi_max) FROM stdin;
1	10000	0	2
2	25000	2	4
3	35000	4	6
4	50000	6	8
5	55000	8	10
6	65000	10	1000
\.


--
-- Name: s_reklame_tarif_tinggi_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_tarif_tinggi_s_idtarif_seq', 1, false);


--
-- Data for Name: s_reklame_wilayah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_wilayah (s_idwilayah, s_nama) FROM stdin;
1	1 || Kawasan Khusus/Pariwisata
2	2 || Kawasan Selektif
3	3 || Pusat Perdagangan
4	4 || Kawasan Perdagangan
5	5 || Jembatan Penyebrangan
6	6 || Perumahan
7	7 || Kawasan Terbuka
8	8 || Industri
9	9 || Perkantoran
10	10 || Pendidikan
\.


--
-- Name: s_reklame_wilayah_s_idwilayah_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_wilayah_s_idwilayah_seq', 1, false);


--
-- Data for Name: s_reklame_zonawilayah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_reklame_zonawilayah (s_idzona, s_zona, s_nourut, s_lokasi) FROM stdin;
1	1	1	JALAN AHMAD YANI, CILACAP
2	1	2	JALAN JENDRAL SUDIRMAN, CILACAP
3	1	3	JALAN LE. MARTADINATA, CILACAP
4	1	4	JALAN MAYJEN. SUTOYO, CILACAP
5	1	5	JALAN DR. WAHIDIN, CILACAP
6	1	6	JALAN D.I. PANDJAITAN, CILACAP
7	1	7	JALAN LETJEN. SUPRAPTO, CILACAP
8	1	8	JALAN S.PARMAN, CILACAP
9	1	9	JALAN JENDRAL GATOT SUBROTO, CILACAP
10	1	10	JALAN BRIGJEN. KATAMSO, CILACAP
11	1	11	JALAN MT. HARYONO, CILACAP
12	1	12	JALAN PERINTIS KEMERDEKAAN, CILACAP
13	1	13	JALAN URIP SUMOHARDJO, CILACAP
14	1	14	JALAN JUANDA, CILACAP
15	1	15	JALAN TENTARA PELAJAR, CILACAP
16	1	16	JALAN RINJANI, CILACAP
17	1	17	JALAN DR. SUTOMO, CILACAP
18	1	18	JALAN KAPTEN PIERRE TENDEAN, CILACAP
19	1	19	JALAN TIDAR, CILACAP
20	1	20	JALAN LAUT, CILACAP
21	1	21	JALAN LINGKAR, CILACAP
22	1	22	JALAN RAYA JERUKLEGI, JERUKLEGI
23	1	23	JALAN RAYA KAWUNGANTEN, KAWUNGANTEN
24	1	24	JALAN RAYA KESUGIHAN, KESUGIHAN
25	1	25	JALAN RAYA BANTARSARI, BANTARSARI
26	1	26	JALAN AHMAD YANI, ADIPALA
27	1	27	JALAN AHMAD YANI, KROYA
28	1	28	JALAN JENDERAL SUDIRMAN, KROYA
29	1	29	JALAN RAYA KEDAWUNG, KROYA
30	1	30	JALAN JENDERAL GATOT SOEBROTO, KROYA
31	1	31	JALAN YOS SUDARSO, KROYA
32	1	32	JALAN RAYA TUGU BARAT, SAMPANG
33	1	33	JALAN RAYA TUGU TIMUR, SAMPANG
34	1	34	JALAN RAYA TUGU SELATAN, SAMPANG
35	1	35	JALAN RAYA MAOS, MAOS
36	1	36	JALAN RAYA PADANG JAYA, MAJENANG
37	1	37	JALAN RAYA DIPONEGORO, MAJENANG
38	1	38	JALAN BHAYANGKARA, MAJENANG
39	1	39	JALAN YOS SUDARSO, MAJENANG
40	1	40	JALAN RAYA PAHONJEAN, MAJENANG
41	1	41	JALAN YOS SUDARSO, SIDAREJA
42	1	42	JALAN AHMAD YANI, SIDAREJA
43	1	43	JALAN JENDERAL SUDIRMAN, SIDAREJA
44	1	44	JALAN AMPERA, SIDAREJA
45	1	45	JALAN RAYA WRINGINHARJO, GANDRUNGMANGU
46	1	46	JALAN JENDERAL GATOT SUBROTO, WANAREJA
47	1	47	JALAN RAYA KARANG PUCUNG, KARANG PUCUNG
48	1	48	JALAN RAYA CIMANGGU, CIMANGGU
49	1	49	JALAN RAYA PANULISAN, DALEUHLUHUR
51	2	2	KECAMATAN SIDAREJA, MAJENANG, KROYA DAN SAMAPANG SELATAN YANG TERMASUK DALAM ZONA WILAYAH I
50	2	1	WILAYAH KOTA CILACAP SELAIN YANG TERMASUK DALAM ZONA WILAYAH I
52	3	\N	SEMUA DAERAH DI WILAYAH KABUPATEN CILACAP SELAIN YANG TERMASUK DALAM ZONA WILAYAH I DAN II
\.


--
-- Name: s_reklame_zonawilayah_s_idzona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_reklame_zonawilayah_s_idzona_seq', 1, false);


--
-- Data for Name: s_satker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_satker (s_idsatker, s_kodesatker, s_namasatker) FROM stdin;
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
-- Name: s_satker_s_idsatker_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_satker_s_idsatker_seq', 1, false);


--
-- Data for Name: s_target; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_target (s_idtarget, s_tahuntarget, s_statustarget, s_keterangantarget) FROM stdin;
3	2020	1	Pajak Daerah (BAPENDA)
2	2020	1	Pajak Daerah 2020 (SIMDA)
1	2020	2	simpatda (perubahan 2020)
4	2021	1	Pendapatan Daerah 2021
\.


--
-- Name: s_target_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_target_seq', 4, true);


--
-- Data for Name: s_targetdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_targetdetail (s_idtargetdetail, s_idtargetheader, s_targetrekening, s_targetjumlah) FROM stdin;
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
-- Name: s_targetdetail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_targetdetail_seq', 88, true);


--
-- Data for Name: s_targetjenis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_targetjenis (s_idtargetjenis, s_namatargetjenis) FROM stdin;
1	Murni
2	Perubahan
\.


--
-- Name: s_targetjenis_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_targetjenis_seq', 1, false);


--
-- Data for Name: s_tarifbudidaya; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifbudidaya (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
\.


--
-- Name: s_tarifbudidaya_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifbudidaya_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tarifbudidayamutiara; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifbudidayamutiara (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
\.


--
-- Name: s_tarifbudidayamutiara_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifbudidayamutiara_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tarifgedung; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifgedung (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
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
-- Name: s_tarifgedung_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifgedung_seq', 1, false);


--
-- Data for Name: s_tarifkapal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifkapal (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
\.


--
-- Name: s_tarifkapal_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifkapal_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tarifkebersihan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifkebersihan (s_idtarif, s_idklasifikasi, s_keterangan, s_tarifdasar, s_satuan) FROM stdin;
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
-- Name: s_tarifkebersihan_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifkebersihan_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tarifkir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifkir (s_idtarif, s_keterangan, s_tarif, s_satuan) FROM stdin;
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
-- Name: s_tarifkir_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifkir_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tarifparkirtepi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifparkirtepi (s_idtarif, s_keterangan, s_tarif, s_satuan) FROM stdin;
1	Sedan, Jeep, Pickup, Minibus dan sejenisnya	2000	Sekali Parkir
2	Bus, Truk dan Alat Berat lainnya	3000	Sekali Parkir
3	Sepeda Motor	1000	Sekali Parkir
4	Gerobak	1000	Sekali Parkir
5	Roda Dua	60000	Berlangganan
6	Roda Empat	150000	Berlangganan
\.


--
-- Name: s_tarifparkirtepi_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifparkirtepi_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tarifpasar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifpasar (s_idtarif, s_idklasifikasi, s_keterangan, s_tarifdasar, s_luas, s_satuan) FROM stdin;
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
-- Name: s_tarifpasar_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifpasar_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tarifpasargrosir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifpasargrosir (s_idtarif, s_idklasifikasi, s_keterangan, s_tarifdasar, s_luas, s_satuan) FROM stdin;
1	1	Semi Permanen	5000	m2	bulan
2	1	Permanen	7500	m2	bulan
3	2	Semi Permanen	5000	m2	bulan
4	2	Permanen	7500	m2	bulan
5	3	Semi Permanen	4000	m2	bulan
6	3	Permanen	4000	m2	bulan
\.


--
-- Name: s_tarifpasargrosir_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifpasargrosir_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tarifpemadam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifpemadam (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
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
-- Name: s_tarifpemadam_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifpemadam_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tarifrumahdinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifrumahdinas (s_idtarifret, s_namatarif, s_luasawal, s_luasakhir, s_satuan, s_tarif) FROM stdin;
1	Luas s/d 36 m2	1	36	m2/bulan	3000
2	Luas s/d 50 m2	36	50	m2/bulan	3100
3	Luas s/d 70 m2	50	70	m2/bulan	3500
4	Luas s/d 120 m2	70	120	m2/bulan	4000
5	Luas s/d 250 m2	120	250	m2/bulan	4500
6	Luas lebih dari 250 m2	250	10000	m2/bulan	5000
\.


--
-- Name: s_tarifrumahdinas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifrumahdinas_seq', 1, false);


--
-- Data for Name: s_tariftanahreklame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tariftanahreklame (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
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
-- Name: s_tariftanahreklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tariftanahreklame_seq', 1, false);


--
-- Data for Name: s_tariftempatparkir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tariftempatparkir (s_idtarif, s_jeniskendaraan, s_tarifdasar) FROM stdin;
1	Sedan, Jeep, Pickup, Minibus dan sejenisnya	2000
2	Bus, Truk dan Alat Berat lainnya	3000
3	Sepeda Motor	1000
4	Gerobak	1000
\.


--
-- Name: s_tariftempatparkir_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tariftempatparkir_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tariftera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tariftera (s_idtarif, s_namatarif, s_tarif, s_satuan) FROM stdin;
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
-- Name: s_tariftera_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tariftera_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tarifterminal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tarifterminal (s_idtarif, s_idjenispelayanan, s_keterangan, s_tarifdasar, s_satuan) FROM stdin;
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
-- Name: s_tarifterminal_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tarifterminal_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tariftrayek; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tariftrayek (s_idtarif, s_keterangan, s_tarif, s_satuan) FROM stdin;
1	Mobil Penumpang s/d 8 Orang	200000	Per Kendaraan Pertahun
2	Mobil Bus 9 s/d 15 Orang	300000	Per Kendaraan Pertahun
3	Mini Bus 16 s/d 25 Orang	400000	Per Kendaraan Pertahun
4	Angkutan Pedesaan	300000	Per Kendaraan Pertahun
\.


--
-- Name: s_tariftrayek_s_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tariftrayek_s_idtarif_seq', 1, false);


--
-- Data for Name: s_tipeusaha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_tipeusaha (s_idusaha, s_kodeusaha, s_namausaha) FROM stdin;
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
-- Name: s_tipeusaha_s_idusaha_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_tipeusaha_s_idusaha_seq', 1, false);


--
-- Data for Name: s_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY s_users (s_iduser, s_username, s_password, s_akses, s_noidentitas, s_nama, s_alamat, s_email, s_notelp, s_usipad, s_tgldaftar, s_jenisidentitas, s_kewarganegaraan, s_jenisizin, s_jabatan, s_tipeoperator, s_passwordreset, s_passwordresetvalid, s_menu, s_wp) FROM stdin;
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
-- Name: s_users_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('s_users_seq', 15, true);


--
-- Data for Name: t_angsuran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_angsuran (t_idangsuran, t_idwpobjek, t_idketetapan, t_jenispajak, t_jenisketetapan, t_noangsuran, t_tglketetapanangsuran, t_jumlahkaliangsuran, t_tgljadwalangsuran, t_nominalangsuran, t_angsuranke, t_kodebayarangsuran, t_inputangsuran, t_pokokpembayaranangsuran, t_bungapembayaranangsuran, t_totalpembayaranangsuran, t_tglpembayaranangsuran, t_inputpembayaranangsuran) FROM stdin;
2	4735	1118	8	2	1	2020-08-25	4	2020-08-25	100000	1	8209081120000001	28	\N	\N	\N	\N	\N
3	4735	1118	8	2	2	2020-08-25	4	2020-09-25	10000	2	8209081120000002	28	\N	\N	\N	\N	\N
4	4735	1118	8	2	3	2020-08-25	4	2020-10-25	50000	3	8209081120000003	28	\N	\N	\N	\N	\N
5	4735	1118	8	2	4	2020-08-25	4	2020-11-25	106800	4	8209081120000004	28	\N	\N	\N	\N	\N
\.


--
-- Name: t_angsuran_t_idangsuran_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_angsuran_t_idangsuran_seq', 5, true);


--
-- Data for Name: t_dataop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_dataop (t_idop, t_npwpd, t_ayat) FROM stdin;
\.


--
-- Name: t_dataop_t_idop_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_dataop_t_idop_seq', 1, false);


--
-- Data for Name: t_datatransaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_datatransaksi (t_idtransaksi, t_npwpd, t_ayat, t_type, t_klas, t_tglditerima, t_tglawal, t_tglakhir, t_periode, t_pajak) FROM stdin;
\.


--
-- Name: t_datatransaksi_t_idtransaksi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_datatransaksi_t_idtransaksi_seq', 1, false);


--
-- Data for Name: t_datawpdaftar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_datawpdaftar (t_idwp, t_npwpd, t_namawp, t_alamatwp, t_tgldaftarwp) FROM stdin;
\.


--
-- Name: t_datawpdaftar_t_idwp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_datawpdaftar_t_idwp_seq', 1, false);


--
-- Data for Name: t_datawpusaha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_datawpusaha (t_idwp, t_npwpd, t_namausaha, t_alamatusaha, t_tgldaftarusaha) FROM stdin;
\.


--
-- Name: t_datawpusaha_t_idwp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_datawpusaha_t_idwp_seq', 1, false);


--
-- Data for Name: t_detailair; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailair (t_idair, t_idtransaksi, t_volume, t_kodekelompok, t_volumeair0, t_hargadasar0, t_tarif0, t_jumlah0, t_volumeair1, t_hargadasar1, t_tarif1, t_jumlah1, t_volumeair2, t_hargadasar2, t_tarif2, t_jumlah2, t_volumeair3, t_hargadasar3, t_tarif3, t_jumlah3, t_volumeair4, t_hargadasar4, t_tarif4, t_jumlah4, t_volumeair5, t_hargadasar5, t_tarif5, t_jumlah5, t_volumeair6, t_hargadasar6, t_tarif6, t_jumlah6, t_fna, t_tarifdasarkorek, t_perhitungan, t_totalnpa) FROM stdin;
2	1147	700	\N	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	0	2668	 ( Rp. 1.867.600 (Total NPA)  x 20% (Tarif Pajak) )	1867600
1	1118	500	\N	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	\N	\N	0	0	0	\N	 ( Rp. 1.334.000 (Total NPA)  x 20% (Tarif Pajak) )	1334000
\.


--
-- Name: t_detailair_t_idair_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailair_t_idair_seq', 2, true);


--
-- Data for Name: t_detailgedung; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailgedung (t_idgedung, t_idtransaksi, t_tarifdasar, t_jenis, t_jumlah, t_total) FROM stdin;
\.


--
-- Name: t_detailgedung_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailgedung_seq', 1, false);


--
-- Data for Name: t_detailho; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailho (t_idretho, t_idtransaksi, t_panjang, t_lebar, t_luas, t_indeksluas, t_kwslokasi, t_gangguan, t_skala, t_tarifdasar, t_jmlhpajak) FROM stdin;
\.


--
-- Name: t_detailho_t_idretho_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailho_t_idretho_seq', 1, false);


--
-- Data for Name: t_detailimb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailimb (t_idretimb, t_idtransaksi, t_jmlhbangunan, t_panjang, t_lebar, t_luas, t_imbluas, t_imblantai, t_imbgunabgn, t_imblokasi, t_imbkondisi, t_tarifdasar, t_jmlhpajak, t_peruntukan) FROM stdin;
\.


--
-- Name: t_detailimb_t_idretimb_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailimb_t_idretimb_seq', 1, false);


--
-- Data for Name: t_detailkebersihan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailkebersihan (t_idkebersihan, t_idtransaksi, t_idklasifikasi, t_idtarif, t_tarifdasar, t_jmlhbln, t_potongan) FROM stdin;
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
-- Name: t_detailkebersihan_t_idkebersihan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailkebersihan_t_idkebersihan_seq', 60, true);


--
-- Data for Name: t_detailkekayaan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailkekayaan (t_idkekayaan, t_idtransaksi, t_idklasifikasi, t_nilailuastanah, t_nilailuasbangunan, t_luastanah, t_luasbangunan, t_jmlhbln, t_potongan, t_kategorisatu, t_kategoridua, t_hargatanah, t_hargadasarsewa) FROM stdin;
\.


--
-- Name: t_detailkekayaan_t_idkekayaan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailkekayaan_t_idkekayaan_seq', 1, false);


--
-- Data for Name: t_detailkir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailkir (t_iddetailkir, t_idtransaksi, t_idtarif, t_hargadasar, t_jumlah) FROM stdin;
\.


--
-- Name: t_detailkir_t_iddetailkir_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailkir_t_iddetailkir_seq', 1, false);


--
-- Data for Name: t_detailminerba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailminerba (t_idminerba, t_idtransaksi, t_idkorek, t_volume, t_hargapasaran, t_jumlah, t_tarifpersen, t_pajak) FROM stdin;
1	1125	67	500.00	5000	2500000	20	500000
2	1150	52	1000.00	5000	5000000	20	1000000
3	1150	48	100.00	5000	500000	20	100000
4	1161	51	1000.00	5000	5000000	20	1000000
5	1161	48	100.00	5000	500000	20	100000
6	1162	48	100.00	5000	500000	20	100000
7	1162	51	150.00	5000	750000	20	150000
8	91	51	12.00	700000	8400000	20	1680000
9	91	48	50.00	10000	500000	20	100000
10	116	76	12.00	542162	6505944	20	1301189
11	116	71	10.00	722882	7228820	20	1445764
12	118	71	25.60	722882	18505779	20	3701156
13	118	51	13.80	602402	8313148	20	1662630
\.


--
-- Name: t_detailminerba_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailminerba_seq', 13, true);


--
-- Data for Name: t_detailpanggungreklame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailpanggungreklame (t_idrpangrek, t_idtransaksi, t_panjang, t_lebar, t_luas, t_tarifdasar, t_jmlhbln, t_potongan) FROM stdin;
\.


--
-- Name: t_detailpanggungreklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailpanggungreklame_seq', 1, false);


--
-- Data for Name: t_detailparkir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailparkir (t_idparkir, t_idtransaksi, t_idkorek, t_jmlh_kendaraan, t_hargadasar, t_jumlah, t_tarifpersen, t_pajak) FROM stdin;
\.


--
-- Name: t_detailparkir_t_idparkir_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailparkir_t_idparkir_seq', 1, false);


--
-- Data for Name: t_detailparkirtepi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailparkirtepi (t_iddetailret, t_idtransaksi, t_idtarif, t_volume, t_hargadasar, t_jumlah, t_uraianretribusi) FROM stdin;
\.


--
-- Name: t_detailparkirtepi_t_iddetailret_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailparkirtepi_t_iddetailret_seq', 1, false);


--
-- Data for Name: t_detailpasar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailpasar (t_idpasar, t_idtransaksi, t_idklasifikasi, t_jenisbangunan, t_panjang, t_lebar, t_luas, t_tarifdasar, t_jmlhbln, t_potongan, t_keteranganpasar, t_nokios) FROM stdin;
\.


--
-- Name: t_detailpasar_t_idpasar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailpasar_t_idpasar_seq', 1, false);


--
-- Data for Name: t_detailpasargrosir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailpasargrosir (t_idpasargrosir, t_idtransaksi, t_idklasifikasi, t_jenisbangunan, t_panjang, t_lebar, t_luas, t_tarifdasar, t_jmlhbln, t_potongan) FROM stdin;
\.


--
-- Name: t_detailpasargrosir_t_idpasargrosir_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailpasargrosir_t_idpasargrosir_seq', 1, false);


--
-- Data for Name: t_detailpemadam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailpemadam (t_idretpemadam, t_idtransaksi, t_idtarif, t_jmltitikbuah, t_tarifdasar, t_satuan, t_jumlah) FROM stdin;
\.


--
-- Name: t_detailpemadam_t_idretpemadam_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailpemadam_t_idretpemadam_seq', 1, false);


--
-- Data for Name: t_detailperikanan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailperikanan (t_idperikanan, t_idtransaksi, t_jeniskapal, t_jenisbudidaya, t_jmlhgt, t_hargadasar, t_jumlah) FROM stdin;
\.


--
-- Name: t_detailperikanan_t_idperikanan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailperikanan_t_idperikanan_seq', 1, false);


--
-- Data for Name: t_detailppj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailppj (t_iddetailppj, t_idtransaksi, t_idkorek, t_nilailistrik, t_subtotalpajak, t_pajak) FROM stdin;
\.


--
-- Name: t_detailppj_t_iddetailppj_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailppj_t_iddetailppj_seq', 1, false);


--
-- Data for Name: t_detailreklame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailreklame (t_iddetailreklame, t_idtransaksi, t_jenisreklame, t_naskah, t_lokasi, t_panjang, t_lebar, t_jumlah, t_jangkawaktu, t_tipewaktu, t_jenisreklameusaha, t_sudutpandang, t_nsr, t_tarifreklame, t_nspr, t_njopr, t_kodekawasan, t_idkawasan) FROM stdin;
19	2	27	CV.BEZMEEL	SORENDIWERI-WARYESI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
20	4	27	SARON	WARYESI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
21	7	27	cv.harapan abadi	kampung kobarijaya	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	4
22	8	27	WARUNG MAKAN	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	2
23	10	27	CV.EVOLET	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
24	11	27	CV.EVOLET	KAMPUNG WARYESI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
25	13	15	BENGKEL ABADI MOTOR	KAMPUNG WARYESI	1.00	1.00	1	1	4	\N	\N	\N	338000	\N	\N	1	1
26	14	15	WARUNG MAKAN REJEKI	KAMPUNG SAUYAS	1.00	1.00	1	1	4	\N	\N	\N	338000	\N	\N	1	3
27	16	33	KIOS USAHA BARU	KAMPUNG FANINDI	2.00	2.00	1	1	4	\N	\N	\N	43875	\N	\N	3	9
28	18	27	CV MAWAR SHARON	KAMPUNG WARYESI	4.00	1.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
29	20	27	CV BEZALEEL	KAMPUNG WARYESI	4.00	1.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
30	21	\N	CV WARANAI	KAMPUNG MARYAIDORI	4.00	1.00	1	1	4	\N	\N	\N	43875	\N	\N	3	9
31	23	27	CV ORISYUN	SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
32	25	33	CV ABABIADI	ABABIADI	2.00	2.00	1	1	4	\N	\N	\N	43875	\N	\N	3	9
33	27	33	TOKO MALIKA	ABABIADI	4.00	1.00	1	1	4	\N	\N	\N	43875	\N	\N	3	9
34	29	33	USAHA BATU TELA	KAMPUNG ABABIADI	4.00	1.00	1	1	4	\N	\N	\N	43875	\N	\N	3	9
35	31	33	PENGECER MINYAK TANAH 	KAMPUNG ABABIADI	4.00	1.00	1	1	4	\N	\N	\N	43875	\N	\N	3	9
36	33	27	CV KARYA PAPUA BEFONDI	KAMPUNG SORENDIWERI	4.00	1.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
37	35	\N	CV SAWABAS INDAH	KAMPUNG SAUYAS	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	3
38	36	45	KIOS SEMBAKO	SORENDIWERI	1.00	1.00	1	1	4	\N	\N	\N	388000	\N	\N	1	1
39	38	45	KIOS SEMBAKO MULIAWATI	SERENDIWERI	1.00	1.00	1	1	4	\N	\N	\N	388000	\N	\N	1	1
40	40	30	CV DAMONI STAR	KAMPUNG BINIKI	1.00	1.00	4	1	4	\N	\N	\N	54875	\N	\N	2	5
41	42	36	CV.SINAR WAKRE	KAMPUNG MARSRAM	2.00	2.00	2	1	4	\N	\N	\N	48500	\N	\N	1	4
42	43	30	CV AMPOMBAKEN	KAMPUNG  BINIKI	1.00	1.00	4	1	4	\N	\N	\N	54875	\N	\N	2	5
43	46	30	KIOS KELONTONG	KAMPUNG FANINDI	1.00	1.00	4	1	4	\N	\N	\N	54875	\N	\N	2	5
44	48	30	CV GERHANA	KAMPUNG WARBEFONDI	1.00	1.00	4	1	4	\N	\N	\N	54875	\N	\N	2	5
45	50	27	KIOS SINAR GOWA	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
46	52	30	CV MELSAN JAYA	KAMPUNG RAYORI	1.00	1.00	4	1	4	\N	\N	\N	54875	\N	\N	2	5
47	56	36	BENGKEL ABADI MOTOR	KAMPUNG SAUYAS	2.00	2.00	2	1	4	\N	\N	\N	48500	\N	\N	1	3
48	58	33	KIOS USAHA BARU	KAMPUNG FANINDI	2.00	2.00	1	1	4	\N	\N	\N	43875	\N	\N	3	9
49	61	27	CV.BAZALEEL	KAMPUNG WARYESI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
50	63	27	CV.EVOLET	KAMPUNG WARYESI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
51	64	33	CV. WARANAI	KAMPUNG MAYAIDORI	2.00	2.00	1	1	4	\N	\N	\N	43875	\N	\N	3	9
52	66	33	CV. WARANAI	KAMPUNG MARYAIDORI	2.00	2.00	1	1	4	\N	\N	\N	43875	\N	\N	3	9
53	68	27	WARUNG MAKAN GRACE TAMA	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
54	69	27	WARUNG MAKAN GRACE TAMA	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
55	72	27	CV.ORISYUN	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
56	74	30	CV.FAJAR UTARA	KAMPUNG FANJUR	2.00	2.00	1	1	4	\N	\N	\N	54875	\N	\N	2	6
57	76	42	CV.AUDREY	KAMPUNG ODORI	2.00	1.00	3	1	4	\N	\N	\N	36250	\N	\N	3	9
58	78	27	CV.ZALIKA ENGINEE	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
59	80	33	KIOS ANUGERAH SEJATI	KAMPUNG WAYORI	2.00	2.00	1	1	4	\N	\N	\N	43875	\N	\N	3	8
60	81	27	CV.AYIN PAPUA	KAMPUNG SAUYAS	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	3
61	83	27	CV.AUDREY	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
62	85	27	CV. MANDAUW SIWOSI	KAMPUNG MARSRAM	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	4
63	87	27	CV.PAPUA ANUGERAH JAYA	KAMPUNG SAUYAS	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	3
64	89	27	CV.ROMOS	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
65	92	27	PT. VICTORIA G.R	KAMPUNG SAUYAS	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	3
66	94	27	CV. SOTERIO	KAMPUNG DUBER	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	2
67	96	33	CV. OMKA	KAMPUNG ODORI	2.00	2.00	1	1	4	\N	\N	\N	43875	\N	\N	3	9
68	97	27	CV.WAFOR INDAH	KAMPUNG WAFOR	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	3
69	99	27	CV.BINTANG PERSADA	KAMPUNG SAUYAS	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	3
70	101	27	CV. BERKAT PAPUA INDAH	KAMPUNG SAUYAS	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	3
71	102	27	CV.BERKAT PAPUA INDAH	KAMPUNG SAUYAS	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	3
72	105	27	CV. WARMUN JAYA	KAMPUNG WAFOR	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	3
73	107	27	CV. MAROS JAYA	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
74	109	27	CV.EVIVANIS STAR	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
75	111	27	PT. VICTORIA G.R	KAMPUNG WAFOR	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	3
76	114	33	CV.MAASYAI KURIAKE	KAMPUNG MASYAI	2.00	2.00	1	1	4	\N	\N	\N	43875	\N	\N	3	8
77	117	15	CV. SONAI BARAKAS	WARYESI	1.00	2.00	1	1	4	\N	\N	\N	338000	\N	\N	1	1
78	119	15	SELAMAT HARI NATAL	sorendiweri	1.00	2.00	1	1	4	\N	\N	\N	338000	\N	\N	1	2
79	121	27	CV.WARSA PERKASA	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
80	123	27	CV.THALLIA PERSADA	KAMPUNG SORENDIWERI	2.00	2.00	1	1	4	\N	\N	\N	68250	\N	\N	1	1
81	125	46	SELAMAT HARI NATAL	sorendiweri	1.00	2.00	2	1	3	\N	\N	\N	4300	\N	\N	1	1
82	126	19	SELAMAT HARI NATAL	soreniweri	1.00	2.00	1	1	4	\N	\N	\N	320000	\N	\N	2	6
83	127	33	CV. AIMANDO SARISA	KAMPUNG MASYAI	2.00	2.00	1	1	4	\N	\N	\N	43875	\N	\N	3	8
\.


--
-- Name: t_detailreklame_t_iddetailreklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailreklame_t_iddetailreklame_seq', 83, true);


--
-- Data for Name: t_detailretribusi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailretribusi (t_iddetailret, t_idtransaksi, t_volume, t_hargadasar, t_jumlah, t_uraianretribusi) FROM stdin;
\.


--
-- Name: t_detailretribusi_t_iddetailret_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailretribusi_t_iddetailret_seq', 1, false);


--
-- Data for Name: t_detailrumahdinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailrumahdinas (t_idrumahdinas, t_idtransaksi, t_panjang, t_lebar, t_luas, t_tarifdasar, t_jmlhbln, t_potongan) FROM stdin;
\.


--
-- Name: t_detailrumahdinas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailrumahdinas_seq', 1, false);


--
-- Data for Name: t_detailtanahlain; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailtanahlain (t_idrpangrek, t_idtransaksi, t_panjang, t_lebar, t_luas, t_tarifdasar, t_jmlhbln, t_potongan) FROM stdin;
\.


--
-- Name: t_detailtanahlain_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailtanahlain_seq', 1, false);


--
-- Data for Name: t_detailtanahreklame; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailtanahreklame (t_idrpangrek, t_idtransaksi, t_panjang, t_lebar, t_luas, t_tarifdasar, t_jmlhblnhari, t_lokasitanah, t_potongan) FROM stdin;
\.


--
-- Name: t_detailtanahreklame_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailtanahreklame_seq', 1, false);


--
-- Data for Name: t_detailtempatparkir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailtempatparkir (t_idtempatparkir, t_idtransaksi, t_jeniskendaraan, t_jumlah, t_tarifdasar, t_potongan) FROM stdin;
\.


--
-- Name: t_detailtempatparkir_t_idtempatparkir_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailtempatparkir_t_idtempatparkir_seq', 1, false);


--
-- Data for Name: t_detailtera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailtera (t_idtera, t_idtransaksi, t_idtarif, t_jarak, t_volume, t_transportasi, t_hargadasar, t_jumlah, t_lokasi) FROM stdin;
\.


--
-- Name: t_detailtera_t_idtera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailtera_t_idtera_seq', 1, false);


--
-- Data for Name: t_detailterminal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailterminal (t_iddetailret, t_idtransaksi, t_idjenispelayanan, t_idtarif, t_volume, t_hargadasar, t_jumlah) FROM stdin;
\.


--
-- Name: t_detailterminal_t_iddetailret_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailterminal_t_iddetailret_seq', 1, false);


--
-- Data for Name: t_detailtrayek; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_detailtrayek (t_iddetailret, t_idtransaksi, t_idtarif, t_jmlhkendaraan, t_jmlhperjalanan, t_hargadasar, t_jumlah, t_satuan) FROM stdin;
\.


--
-- Name: t_detailtrayek_t_iddetailret_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_detailtrayek_t_iddetailret_seq', 1, false);


--
-- Data for Name: t_jenispelayanan_terminal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_jenispelayanan_terminal (t_idjenispelayanan, t_keterangan) FROM stdin;
\.


--
-- Name: t_jenispelayanan_terminal_t_idjenispelayanan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_jenispelayanan_terminal_t_idjenispelayanan_seq', 1, false);


--
-- Data for Name: t_kantorskpd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_kantorskpd (t_idskpd, t_tglbysistem, t_namaskpd, t_jalanskpd, t_idkecskpd, t_kecamatanskpd, t_idkelskpd, t_kelurahanskpd, is_userpendaftaran, t_tutupskpd, is_tutupskpd) FROM stdin;
\.


--
-- Name: t_kantorskpd_t_idskpd_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_kantorskpd_t_idskpd_seq', 1, false);


--
-- Data for Name: t_keberatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_keberatan (t_idkeberatan, t_idwpobjek, t_idketetapan, t_jenisketetapan, t_jenispajak, t_nokeberatan, t_tglketetapankeberatan, t_alasankeberatan, t_jmlhketetapanseharusnya, t_inputkeberatan, t_tglverifikasi, t_statusverifikasi, t_pejabatverifikasi, t_nilaipengurangan, t_jmlhpengurangan, t_jmlhditetapkan) FROM stdin;
\.


--
-- Name: t_keberatan_t_idkeberatan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_keberatan_t_idkeberatan_seq', 1, false);


--
-- Data for Name: t_klasifikasi_kebersihan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_klasifikasi_kebersihan (t_idklasifikasi, t_keterangan) FROM stdin;
3	Klasifikasi III ( Lainnya )
2	Klasifikasi II ( Sedang )
1	Klasifikasi I ( Strategis )
\.


--
-- Name: t_klasifikasi_kebersihan_t_idklasifikasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_klasifikasi_kebersihan_t_idklasifikasi_seq', 1, false);


--
-- Data for Name: t_klasifikasi_pasar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_klasifikasi_pasar (t_idklasifikasi, t_keterangan) FROM stdin;
\.


--
-- Name: t_klasifikasi_pasar_t_idklasifikasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_klasifikasi_pasar_t_idklasifikasi_seq', 1, false);


--
-- Data for Name: t_klasifikasi_pasargrosir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_klasifikasi_pasargrosir (t_idklasifikasi, t_keterangan) FROM stdin;
\.


--
-- Name: t_klasifikasi_pasargrosir_t_idklasifikasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_klasifikasi_pasargrosir_t_idklasifikasi_seq', 1, false);


--
-- Data for Name: t_lampiranppj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_lampiranppj (t_idlampiranppj, t_idtransaksi, t_goltarifpln, t_batasdaya, t_jmlpelanggan, t_jmlkwhterjual, t_tarifperkwh, t_jmllistrikterjual, t_jmlbiayabeban, t_jmlnilaijuallistrik, t_tarif, t_jumlah, t_row) FROM stdin;
\.


--
-- Name: t_lampiranppj_t_idlampiranppj_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_lampiranppj_t_idlampiranppj_seq', 1, false);


--
-- Data for Name: t_setoranlain; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_setoranlain (t_idsetoranlain, t_idsatker, t_idrekening, t_tahunpajak, t_jumlahsetor, t_tglsetor, t_viasetor, t_kodebukti, t_issetorandeleted, t_nomorurut) FROM stdin;
5	12	94	2020	30000000	2020-11-30	1	3	1	5
3	12	94	2020	5000000	2020-09-03	1	3	1	3
2	12	99	2020	100000000	2020-11-30	1	2	1	2
4	3	99	2020	20000000	2020-10-07	1	2	1	4
1	3	99	2020	10000000	2020-11-23	1	2	1	1
6	3	103	2020	1000000	2020-12-10	1	1	0	6
7	3	99	2020	2550000	2020-05-01	1	1	0	7
8	12	172	2020	250100	2020-12-10	1	1	0	8
9	12	176	2020	550000	2020-12-10	1	1	0	9
10	12	166	2020	355000	2020-12-10	1	1	0	10
\.


--
-- Name: t_setoranlain_t_idsetoranlain_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_setoranlain_t_idsetoranlain_seq', 10, true);


--
-- Name: t_setoranlain_t_nomorurut_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_setoranlain_t_nomorurut_seq', 10, true);


--
-- Data for Name: t_setorbankdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_setorbankdetail (t_idsbd, t_idsbh, t_idkoreksbd, t_jmlhsbd, t_issbddeleted, t_idtransaksi) FROM stdin;
1	1	34	575000	0	1163
2	1	21	50000	0	1160
\.


--
-- Name: t_setorbankdetail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_setorbankdetail_seq', 2, true);


--
-- Data for Name: t_setorbankheader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_setorbankheader (t_idsbh, t_tglsbh, t_nosbh, t_issbhdeleted) FROM stdin;
\.


--
-- Name: t_setorbankheader_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_setorbankheader_seq', 1, true);


--
-- Data for Name: t_skpdkb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_skpdkb (t_idskpdkb, t_idtransaksi, t_nopemeriksaan, t_noskpdkb, t_periodeskpdkb, t_tglskpdkb, t_tgljatuhtemposkpdkb, t_tarifpajak, t_dasarrevisi, t_selisihdasar, t_jmlhbln, t_tarifpersen, t_jmlhdendaskpdkb, t_jmlhpajakseharusnya, t_jmlhpajakskpdkb, t_kodebayarskpdkb, t_totalskpdkb, t_operatorskpdkb, t_tglbayarskpdkb, t_viabayarskpdkb, t_jmlhbayarskpdkb, t_operatorbayarskpdkb, t_jenispemeriksaan) FROM stdin;
\.


--
-- Name: t_skpdkb_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_skpdkb_seq', 2, true);


--
-- Data for Name: t_skpdkbt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_skpdkbt (t_idskpdkbt, t_idtransaksi, t_nopemeriksaan, t_noskpdkbt, t_periodeskpdkbt, t_tglskpdkbt, t_tgljatuhtemposkpdkbt, t_tarifpajak, t_dasarrevisi, t_selisihdasar, t_jmlhbln, t_tarifpersen, t_jmlhdendaskpdkbt, t_jmlhpajakseharusnya, t_jmlhpajakskpdkbt, t_kodebayarskpdkbt, t_totalskpdkbt, t_operatorskpdkbt, t_tglbayarskpdkbt, t_viabayarskpdkbt, t_jmlhbayarskpdkbt, t_operatorbayarskpdkbt, t_jenispemeriksaan) FROM stdin;
\.


--
-- Name: t_skpdkbt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_skpdkbt_seq', 1, true);


--
-- Data for Name: t_skpdlb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_skpdlb (t_idskpdlb, t_idtransaksi, t_nopemeriksaan, t_noskpdlb, t_periodeskpdlb, t_tglskpdlb, t_tarifpajak, t_dasarrevisi, t_selisihdasar, t_jmlhpajakseharusnya, t_totalskpdlb, t_kodebayarskpdlb, t_operatorskpdlb, t_tglpengembalianskpdlb, t_jmlhpengembalianskpdlb, t_operatorpengembalianskpdlb, t_jenispemeriksaan) FROM stdin;
\.


--
-- Name: t_skpdlb_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_skpdlb_seq', 1, false);


--
-- Data for Name: t_skpdn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_skpdn (t_idskpdn, t_idtransaksi, t_nopemeriksaan, t_noskpdn, t_periodeskpdn, t_tglskpdn, t_tarifpajak, t_dasarrevisi, t_selisihdasar, t_jmlhpajakseharusnya, t_totalskpdn, t_operatorskpdn, t_jenispemeriksaan) FROM stdin;
\.


--
-- Name: t_skpdn_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_skpdn_seq', 1, true);


--
-- Data for Name: t_skpdt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_skpdt (t_idskpdt, t_idtransaksi, t_nopemeriksaan, t_noskpdt, t_periodeskpdt, t_tglskpdt, t_tgljatuhtemposkpdt, t_tarifpajak, t_dasarrevisi, t_selisihdasar, t_jmlhbln, t_tarifpersen, t_jmlhdendaskpdt, t_jmlhpajakseharusnya, t_tarifkenaikan, t_jmlhkenaikan, t_jmlhpajakskpdt, t_kodebayarskpdt, t_totalskpdt, t_operatorskpdt, t_tglbayarskpdt, t_viabayarskpdt, t_jmlhbayarskpdt, t_operatorbayarskpdt) FROM stdin;
\.


--
-- Name: t_skpdt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_skpdt_seq', 5, true);


--
-- Data for Name: t_suratkesanggupan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_suratkesanggupan (t_idsurat, t_idwpobjek, t_noangsuran, t_tempatlahir, t_tgllahir, t_pekerjaan, t_jns_kelamin, t_jns_pemungutan, t_jns_izin, t_jmlhsetoran, t_start_setoran, t_operator, t_status_cetak) FROM stdin;
\.


--
-- Name: t_suratkesanggupan_t_idsurat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_suratkesanggupan_t_idsurat_seq', 1, false);


--
-- Data for Name: t_teguranlaporpajak; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_teguranlaporpajak (t_idteguran, t_noteguran, t_idobjekteguran, t_tglteguran, t_operatorinputteguran, t_bulanpajak, t_tahunpajak) FROM stdin;
\.


--
-- Name: t_teguranlaporpajak_t_idteguran_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_teguranlaporpajak_t_idteguran_seq', 1, true);


--
-- Data for Name: t_transaksi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_transaksi (t_idtransaksi, t_idwpobjek, t_idkorek, t_jenispajak, t_nourut, t_periodepajak, t_tglpendataan, t_masaawal, t_masaakhir, t_dasarpengenaan, t_nilaiperolehan, t_tarifpajak, t_tarifdasarkorek, t_jmlhpajak, t_namakegiatan, t_noskpdjab, t_tarifkenaikan, t_jmlhkenaikan, t_operatorpendataan, is_deluserpendataan, t_tglpenetapan, t_nopenetapan, t_operatorpenetapan, is_deluserpenetapan, t_tgljatuhtempo, t_kodebayar, t_viapembayaran, t_jmlhpembayaran, t_nopembayaran, t_tglpembayaran, t_operatorpembayaran, is_deluserpembayaran, t_nostpd, t_idkorekdenda, t_jmlhdendapembayaran, t_jmlhbulandendapembayaran, t_tgldendapembayaran, t_operatordendapembayaran, is_deluserdendapembayaran, t_viapembayarandenda, t_jmlhbayardenda, t_tglbayardenda, t_operatorbayardenda, is_deluserbayardenda, t_alasanpembatalanskpd, t_tglpembatalanskpd, t_nopembatalanskpd, is_esptpd, t_tglentry_system, t_file_berkas) FROM stdin;
18	4	216	4	17	2020	2020-01-16	2020-01-16	2021-01-15	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-01-16	10	25	\N	2020-02-15	821504022000017	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 12:16:39.568637	\N
19	19	99	13	18	2020	2020-01-16	2020-01-16	2021-01-15	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-16	8	0	\N	2020-02-15	821513092000018	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 12:23:56.489121	\N
20	20	216	4	19	2020	2020-01-16	2020-01-16	2021-01-15	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-01-16	11	25	\N	2020-02-15	821504022000019	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 12:31:03.810453	\N
21	21	216	4	20	2020	2020-01-20	2020-01-20	2021-01-19	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-01-20	12	25	\N	2020-02-19	821504022000020	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 12:48:00.686513	\N
22	22	99	13	21	2020	2020-01-20	2020-01-20	2021-01-19	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-20	9	0	\N	2020-02-19	821513092000021	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 12:53:12.895811	\N
23	23	216	4	22	2020	2020-01-21	2020-01-21	2021-01-20	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-01-21	13	25	\N	2020-02-20	821504022000022	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 13:04:00.346724	\N
24	24	99	13	23	2020	2020-01-21	2020-01-21	2021-01-20	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-21	10	0	\N	2020-02-20	821513092000023	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 13:09:18.114416	\N
25	25	216	4	24	2020	2020-01-22	2020-01-22	2021-01-21	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-01-22	14	25	\N	2020-02-21	821504022000024	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 10:32:11.845471	\N
26	26	99	13	25	2020	2020-01-22	2020-01-22	2021-01-21	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-22	11	0	\N	2020-02-21	821513092000025	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 10:40:53.79033	\N
2	2	216	4	1	2020	2020-01-16	2020-01-01	2020-12-31	0	\N	\N	\N	273000	\N	\N	0	0	28	0	2020-01-16	1	28	\N	2020-02-15	821504022000001	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-02 13:15:16.311617	\N
27	27	216	4	26	2020	2020-01-22	2020-01-22	2021-01-21	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-01-22	15	25	\N	2020-02-21	821504022000026	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 10:49:14.413916	\N
28	28	99	13	27	2020	2020-01-22	2020-01-22	2021-01-21	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-22	12	0	\N	2020-02-21	821513092000027	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 10:53:14.79009	\N
29	29	216	4	28	2020	2020-01-22	2020-01-22	2021-01-21	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-01-22	16	25	\N	2020-02-21	821504022000028	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 11:09:39.209376	\N
30	30	99	13	29	2020	2020-01-22	2020-01-22	2020-01-21	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-22	13	0	\N	2020-02-21	821513092000029	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 11:13:30.865513	\N
31	31	216	4	30	2020	2020-01-22	2020-11-01	2021-01-21	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-01-22	17	25	\N	2020-02-21	821504022000030	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 11:24:15.008048	\N
3	3	99	13	2	2020	2020-12-02	2020-12-02	2020-12-02	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-12-02	1	0	\N	2021-01-01	821513092000002	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-02 13:40:31.719367	\N
4	4	216	4	3	2020	2020-01-16	2020-01-01	2020-12-31	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-12-02	2	25	\N	2021-01-01	821504022000003	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-02 13:58:11.288313	\N
5	5	99	13	4	2020	2020-01-16	2020-01-01	2020-12-31	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-16	2	0	\N	2020-02-15	821513092000004	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-02 13:59:07.674893	\N
6	7	99	13	5	2020	2020-01-16	2020-01-16	2021-01-15	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-16	3	0	\N	2020-02-15	821513092000005	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 10:16:30.428997	\N
7	6	216	4	6	2020	2020-01-16	2020-01-16	2021-01-15	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-12-03	3	25	\N	2021-01-02	821504022000006	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 10:20:00.853021	\N
8	8	216	4	7	2020	2020-01-20	2020-01-20	2021-01-19	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-01-20	4	25	\N	2020-02-19	821504022000007	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 10:38:33.112173	\N
9	9	99	13	8	2020	2020-01-20	2020-01-20	2021-01-19	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-20	4	0	\N	2020-02-19	821513092000008	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 10:46:12.154545	\N
10	10	216	4	9	2020	2020-01-16	2020-01-16	2021-01-15	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-01-16	5	25	\N	2020-02-15	821504022000009	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 10:53:15.698645	\N
11	10	216	4	10	2020	2020-01-16	2020-01-16	2021-01-15	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-01-16	6	25	\N	2020-02-15	821504022000010	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 11:04:03.546835	\N
14	14	34	4	13	2020	2020-01-13	2020-01-13	2021-01-12	0	\N	\N	\N	338000	\N	\N	0	0	25	0	2020-01-13	8	25	\N	2020-02-12	821504022000013	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 11:46:39.813767	\N
15	15	99	13	14	2020	2020-01-13	2020-01-13	2021-01-12	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-13	6	0	\N	2020-02-12	821513092000014	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 11:51:26.189645	\N
16	16	216	4	15	2020	2020-01-13	2020-01-13	2021-01-12	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-01-13	9	25	\N	2020-02-12	821504022000015	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 11:59:21.167877	\N
17	17	99	13	16	2020	2020-01-13	2020-01-13	2021-01-12	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-13	7	0	\N	2020-02-12	821513092000016	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-03 12:05:00.675785	\N
32	32	99	13	31	2020	2020-01-22	2020-01-22	2020-01-21	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-22	14	0	\N	2020-02-21	821513092000031	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 11:29:14.807333	\N
33	33	216	4	32	2020	2020-01-28	2020-01-28	2021-01-27	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-01-28	18	25	\N	2020-02-27	821504022000032	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 11:45:02.459058	\N
34	35	99	13	33	2020	2020-01-28	2020-01-28	2021-01-27	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-28	15	0	\N	2020-02-27	821513092000033	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 11:53:03.930052	\N
35	37	216	4	34	2020	2020-01-28	2020-01-28	2021-01-27	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-01-28	19	25	\N	2020-02-27	821504022000034	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 12:07:18.827922	\N
36	34	35	4	35	2020	2020-04-01	2020-04-01	2020-03-31	0	\N	\N	\N	388000	\N	\N	0	0	25	0	2020-04-01	20	25	\N	2020-05-01	821504022000035	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 12:20:29.992197	\N
37	36	99	13	36	2020	2019-04-01	2019-04-01	2020-03-31	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2019-04-01	1	0	\N	2019-05-01	821513092000036	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 12:25:34.220884	\N
38	34	35	4	37	2020	2019-04-01	2019-04-01	2020-03-31	0	\N	\N	\N	388000	\N	\N	0	0	25	0	2019-04-01	1	25	\N	2019-05-01	821504022000037	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 12:29:49.02461	\N
39	38	99	13	38	2020	2020-01-28	2020-01-28	2021-01-27	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-28	16	0	\N	2020-02-27	821513092000038	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 12:29:54.622093	\N
42	42	36	4	41	2020	2019-04-05	2019-04-05	2020-03-31	0	\N	\N	\N	388000	\N	\N	0	0	25	0	2019-04-05	1	25	\N	2019-05-05	821504022000041	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 13:13:16.800412	\N
43	44	216	4	42	2020	2020-01-30	2020-01-30	2021-01-29	0	\N	\N	\N	219500	\N	\N	0	0	25	0	2020-01-30	22	25	\N	2020-02-29	821504022000042	1	219500	11	2020-01-30	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 13:16:56.750191	\N
41	43	99	13	40	2020	2020-01-30	2020-01-30	2021-01-29	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-30	17	0	\N	2020-02-29	821513092000040	1	420000	12	2020-01-30	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 13:08:09.688956	\N
40	41	216	4	39	2020	2020-01-30	2020-01-30	2020-01-01	0	\N	\N	\N	219500	\N	\N	0	0	25	0	2020-01-30	21	25	\N	2020-02-29	821504022000039	1	219500	13	2020-01-30	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 13:02:31.894281	\N
47	48	99	13	46	2020	2020-01-30	2020-01-30	2021-01-29	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-30	19	0	\N	2020-02-29	821513092000046	1	420000	1	2020-12-08	29	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-08 09:23:16.693026	\N
46	47	216	4	45	2020	2020-01-30	2020-01-30	2021-01-29	0	\N	\N	\N	219500	\N	\N	0	0	25	0	2020-01-30	23	25	\N	2020-02-29	821504022000045	1	219500	2	2020-01-30	29	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-08 09:18:30.143943	\N
53	54	99	13	52	2020	2020-01-30	2020-01-30	2021-01-29	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-30	22	0	\N	2020-02-29	821513092000052	1	420000	3	2020-01-29	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-08 10:27:48.554805	\N
52	53	216	4	51	2020	2020-01-30	2020-01-30	2021-01-29	0	\N	\N	\N	219500	\N	\N	0	0	25	0	2020-01-30	26	25	\N	2020-02-29	821504022000051	1	219500	4	2020-01-29	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-08 10:23:57.884547	\N
51	52	99	13	50	2020	2020-01-30	2020-01-30	2021-12-08	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-30	21	0	\N	2020-02-29	821513092000050	1	420000	5	2020-01-29	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-08 10:19:03.237939	\N
50	34	216	4	49	2020	2020-01-30	2020-01-30	2021-01-29	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-01-30	25	25	\N	2020-02-29	821504022000049	1	273000	6	2020-01-30	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-08 10:15:47.172885	\N
73	71	99	13	70	2020	2020-02-18	2020-02-18	2020-02-17	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-18	32	0	\N	2020-03-19	821513092000070	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-16 09:20:30.318484	\N
49	50	99	13	48	2020	2020-01-30	2020-01-30	2021-01-29	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-30	20	0	\N	2020-02-29	821513092000048	1	420000	8	2020-01-30	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-08 10:08:25.712662	\N
48	49	216	4	47	2020	2020-01-30	2020-01-30	2021-01-29	0	\N	\N	\N	219500	\N	\N	0	0	25	0	2020-01-30	24	25	\N	2020-02-29	821504022000047	1	219500	9	2019-12-29	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-08 10:00:38.715054	\N
45	46	99	13	44	2020	2019-04-05	2019-04-04	2020-04-03	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2019-04-05	1	0	\N	2019-05-05	821513092000044	1	420000	9	2020-01-30	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 13:50:45.455025	\N
44	45	99	13	43	2020	2020-01-30	2020-01-30	2021-01-29	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-30	18	0	\N	2020-02-29	821513092000043	1	420000	10	2020-01-30	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-04 13:22:43.531363	\N
54	56	99	13	53	2020	2020-12-14	2020-12-14	2021-01-13	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-12-14	23	0	\N	2021-01-13	821513092000053	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 11:10:34.279606	\N
58	60	216	4	57	2020	2020-01-13	2020-01-13	2021-01-12	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-01-13	28	25	\N	2020-02-12	821504022000057	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 12:16:01.74647	\N
59	17	99	13	58	2020	2020-01-13	2020-01-13	2020-01-12	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-13	26	0	\N	2020-02-12	821513092000058	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 12:18:43.951055	\N
60	62	99	13	59	2020	2020-01-16	2020-01-16	2021-01-15	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-16	27	0	\N	2020-02-15	821513092000059	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 12:32:25.704333	\N
61	63	216	4	60	2020	2020-01-16	2020-01-16	2021-01-15	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-01-16	29	25	\N	2020-02-15	821504022000060	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 12:59:30.44425	\N
62	3	99	13	61	2020	2020-01-16	2020-01-16	2020-01-15	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-16	28	0	\N	2020-02-15	821513092000061	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 13:01:16.152425	\N
63	10	216	4	62	2020	2020-01-16	2020-01-16	2021-01-15	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-12-14	30	25	\N	2021-01-13	821504022000062	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 13:07:05.029733	\N
64	64	216	4	63	2020	2020-01-20	2020-01-20	2021-01-19	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-01-20	31	25	\N	2020-02-19	821504022000063	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 13:16:12.469274	\N
65	65	99	13	64	2020	2020-01-20	2020-01-20	2020-01-19	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-20	29	0	\N	2020-02-19	821513092000064	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 13:21:58.504204	\N
66	64	216	4	65	2020	2020-01-20	2020-01-20	2020-01-19	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-01-20	32	25	\N	2020-02-19	821504022000065	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 13:25:27.288091	\N
67	65	99	13	66	2020	2020-01-20	2020-01-20	2020-01-19	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-20	30	0	\N	2020-02-19	821513092000066	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 13:26:40.106215	\N
68	66	216	4	67	2020	2020-01-20	2020-01-20	2020-01-19	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-01-20	33	25	\N	2020-02-19	821504022000067	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 13:33:20.657695	\N
69	66	216	4	68	2020	2020-01-20	2020-01-20	2020-01-19	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-01-20	34	25	\N	2020-02-19	821504022000068	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 13:39:14.209375	\N
70	67	99	13	69	2020	2020-01-20	2020-01-20	2021-01-19	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-20	31	0	\N	2020-02-19	821513092000069	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-14 13:40:30.982518	\N
74	70	216	4	71	2020	2020-02-18	2020-02-18	2021-02-17	0	\N	\N	\N	219500	\N	\N	0	0	25	0	2020-02-18	35	25	\N	2020-03-19	821504022000071	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-16 09:23:10.759275	\N
75	48	99	13	72	2020	2020-01-30	2020-01-30	2021-01-29	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-01-30	33	0	\N	2020-02-29	821513092000072	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-16 11:04:18.627361	\N
76	75	36	4	73	2020	2020-02-10	2020-02-10	2021-02-09	0	\N	\N	\N	217500	\N	\N	0	0	25	0	2020-02-10	36	25	\N	2020-03-11	821504022000073	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-16 11:45:13.962787	\N
77	77	99	13	74	2020	2020-02-11	2020-02-11	2021-02-10	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-11	34	0	\N	2020-03-12	821513092000074	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-16 11:58:48.359515	\N
78	76	216	4	75	2020	2020-02-11	2020-02-11	2021-02-10	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-11	37	25	\N	2020-03-12	821504022000075	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-16 12:01:02.42906	\N
79	79	99	13	76	2020	2020-02-11	2020-02-11	2021-02-10	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-11	35	0	\N	2020-03-12	821513092000076	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-16 12:34:00.007206	\N
80	78	216	4	77	2020	2020-02-11	2020-02-11	2021-02-10	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-02-11	38	25	\N	2020-03-12	821504022000077	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-16 12:37:47.653561	\N
81	80	216	4	78	2020	2020-02-11	2020-02-11	2021-02-10	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-11	39	25	\N	2020-03-12	821504022000078	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 09:12:14.200916	\N
82	81	99	13	79	2020	2020-02-11	2020-02-11	2021-02-10	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-11	36	0	\N	2020-03-12	821513092000079	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 09:13:18.57339	\N
83	82	216	4	80	2020	2020-02-12	2020-02-12	2021-02-11	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-12	40	25	\N	2020-03-13	821504022000080	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 09:44:43.748236	\N
84	83	99	13	81	2020	2020-02-12	2020-02-12	2021-02-11	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-12	37	0	\N	2020-03-13	821513092000081	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 09:45:46.511174	\N
85	84	216	4	82	2020	2020-02-17	2020-02-17	2021-02-16	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-17	41	25	\N	2020-03-18	821504022000082	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 09:57:38.37356	\N
86	85	99	13	83	2020	2020-02-17	2020-02-17	2021-02-16	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-17	38	0	\N	2020-03-18	821513092000083	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 09:58:33.165904	\N
87	86	216	4	84	2020	2020-02-17	2020-02-17	2020-02-17	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-17	42	25	\N	2020-03-18	821504022000084	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 10:05:27.685171	\N
88	87	99	13	85	2020	2020-02-17	2020-02-17	2021-02-16	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-17	39	0	\N	2020-03-18	821513092000085	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 10:10:13.712064	\N
89	90	216	4	86	2020	2020-02-17	2020-02-17	2020-02-16	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-17	43	25	\N	2020-03-18	821504022000086	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 10:28:59.177631	\N
90	91	99	13	87	2020	2020-02-17	2020-02-17	2021-02-16	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-17	40	0	\N	2020-03-18	821513092000087	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 10:29:52.074936	\N
92	93	216	4	89	2020	2020-02-17	2020-02-17	2021-02-16	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-17	44	25	\N	2020-03-18	821504022000089	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 11:10:13.439449	\N
93	94	99	13	90	2020	2020-02-17	2020-02-17	2021-02-16	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-17	41	0	\N	2020-03-18	821513092000090	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 11:29:44.173754	\N
94	95	216	4	91	2020	2020-07-21	2020-07-21	2020-07-20	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-07-21	45	25	\N	2020-08-20	821504022000091	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 12:07:58.386487	\N
95	96	99	13	92	2020	2020-07-21	2020-07-21	2020-07-20	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-07-21	42	0	\N	2020-08-20	821513092000092	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 12:09:22.484058	\N
96	97	216	4	93	2020	2020-07-24	2020-07-24	2020-07-23	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-07-24	46	25	\N	2020-08-23	821504022000093	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 12:29:16.328075	\N
97	99	216	4	94	2020	2020-02-17	2020-02-17	2021-02-16	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-17	47	25	\N	2020-03-18	821504022000094	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 12:40:25.451796	\N
98	100	99	13	95	2020	2020-02-17	2020-02-17	2020-02-16	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-17	43	0	\N	2020-03-18	821513092000095	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 12:41:40.26347	\N
99	101	216	4	96	2020	2020-02-17	2020-02-17	2021-02-16	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-17	48	25	\N	2020-03-18	821504022000096	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 12:59:16.081473	\N
100	102	99	13	97	2020	2020-02-17	2020-02-17	2020-02-16	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-17	44	0	\N	2020-03-18	821513092000097	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 13:00:30.83217	\N
101	103	216	4	98	2020	2020-02-17	2020-02-17	2021-02-16	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-17	49	25	\N	2020-03-18	821504022000098	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 13:13:09.67809	\N
102	103	216	4	99	2020	2020-12-17	2020-02-17	2021-02-16	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-12-17	50	25	\N	2021-01-16	821504022000099	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 13:14:59.934565	\N
103	104	99	13	100	2020	2020-02-17	2020-02-17	2020-12-16	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-17	45	0	\N	2020-03-18	821513092000100	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 13:16:00.773158	\N
104	106	99	13	101	2020	2020-02-18	2020-02-18	2021-02-17	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-18	46	0	\N	2020-03-19	821513092000101	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 13:35:04.885716	\N
105	107	216	4	102	2020	2020-02-18	2020-02-18	2021-02-17	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-18	51	25	\N	2020-03-19	821504022000102	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 13:44:09.706157	\N
106	108	99	13	103	2020	2020-02-18	2020-02-18	2020-02-17	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-18	47	0	\N	2020-03-19	821513092000103	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 13:45:11.590655	\N
107	109	216	4	104	2020	2020-02-18	2020-02-18	2021-02-17	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-18	52	25	\N	2020-03-19	821504022000104	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 13:54:20.773702	\N
108	110	99	13	105	2020	2020-02-18	2020-02-18	2021-02-17	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-18	48	0	\N	2020-03-19	821513092000105	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 13:55:06.506892	\N
109	111	216	4	106	2020	2020-12-17	2020-12-17	2020-12-16	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-12-17	53	25	\N	2021-01-16	821504022000106	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 14:13:11.444176	\N
110	112	99	13	107	2020	2020-12-17	2020-12-17	2020-12-16	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-12-17	49	0	\N	2021-01-16	821513092000107	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-17 14:13:54.240653	\N
111	114	216	4	108	2020	2020-02-17	2020-02-17	2021-02-16	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-17	54	25	\N	2020-03-18	821504022000108	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 08:57:51.61	\N
112	115	99	13	109	2020	2020-02-17	2020-02-17	2020-02-16	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-17	50	0	\N	2020-03-18	821513092000109	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 08:58:45.875973	\N
113	117	99	13	110	2020	2020-02-17	2020-02-17	2021-02-16	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-17	51	0	\N	2020-03-18	821513092000110	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 09:08:05.968652	\N
114	120	216	4	111	2020	2020-02-20	2020-02-20	2021-02-19	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-02-20	55	25	\N	2020-03-21	821504022000111	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 09:38:36.007063	\N
115	121	99	13	112	2020	2020-02-20	2020-02-20	2021-02-19	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-20	52	0	\N	2020-03-21	821513092000112	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 09:39:32.624179	\N
116	113	47	6	113	2020	2020-12-18	2020-11-17	2020-11-30	13734764	\N	20	\N	2746953	pembangunan rumah	\N	0	0	25	0	\N	\N	0	\N	2020-12-15	821506012000113	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 09:49:21.343105	\N
117	72	34	4	114	2020	2020-12-18	2020-11-10	2020-11-01	0	\N	\N	\N	676000	\N	\N	0	0	25	0	2020-12-18	56	25	\N	2021-01-17	821504022000114	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 09:59:35.447317	\N
118	113	47	6	115	2020	2020-12-18	1970-01-01	1970-01-31	26818927	\N	20	\N	5363786	Rehapan Rumah 	\N	0	0	25	0	\N	\N	0	\N	1970-01-15	821506012000115	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 10:25:51.291014	\N
119	34	34	4	116	2020	2020-12-18	2020-11-01	2020-11-01	0	\N	\N	\N	676000	\N	\N	0	0	25	0	2020-12-18	57	25	\N	2021-01-17	821504022000116	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 10:31:32.14705	\N
120	36	99	13	117	2020	2020-12-18	2020-12-18	2020-12-18	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-12-18	53	0	\N	2021-01-17	821513092000117	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 10:38:07.45719	\N
125	97	35	4	122	2020	2020-12-18	2020-11-01	2020-11-01	0	\N	\N	\N	17200	\N	\N	0	0	25	0	2020-12-18	60	25	\N	2021-01-17	821504022000122	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 11:06:01.627008	\N
126	95	34	4	123	2020	2020-12-18	2020-11-01	2020-11-01	0	\N	\N	\N	640000	\N	\N	0	0	25	0	2020-12-18	61	25	\N	2021-01-17	821504022000123	0	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 11:19:49.208252	\N
124	125	99	13	121	2020	2020-02-20	2020-02-20	2021-02-19	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-20	55	0	\N	2020-03-21	821513092000121	1	420000	14	2020-05-01	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 10:49:25.571097	\N
128	135	99	13	125	2020	2020-06-30	2020-06-30	2021-06-29	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-06-30	56	0	\N	2020-07-30	821513092000125	1	420000	15	2020-06-01	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-22 09:58:04.447969	\N
127	134	216	4	124	2020	2020-06-30	2020-06-30	2021-06-29	0	\N	\N	\N	175500	\N	\N	0	0	25	0	2020-06-30	62	25	\N	2020-07-30	821504022000124	1	175500	16	2020-12-24	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-22 09:57:06.933751	\N
122	127	99	13	119	2020	2020-02-24	2020-02-24	2021-02-23	0	\N	0	\N	420000	\N	\N	\N	\N	25	0	2020-02-24	54	0	\N	2020-03-25	821513092000119	1	420000	17	2020-02-01	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 10:43:17.687819	\N
123	124	216	4	120	2020	2020-02-20	2020-02-20	2021-02-19	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-20	59	25	\N	2020-03-21	821504022000120	1	273000	18	2020-02-20	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 10:46:57.90739	\N
121	126	216	4	118	2020	2020-02-24	2020-02-24	2021-02-23	0	\N	\N	\N	273000	\N	\N	0	0	25	0	2020-02-24	58	25	\N	2020-03-25	821504022000118	1	273000	19	2020-02-24	28	\N	\N	\N	\N	\N	\N	0	\N	0	\N	\N	0	\N	\N	\N	\N	0	2020-12-18 10:41:06.637903	\N
\.


--
-- Name: t_transaksi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_transaksi_seq', 128, true);


--
-- Data for Name: t_wp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_wp (t_idwp, t_tgldaftar, t_jenispendaftaran, t_bidangusaha, t_nopendaftaran, t_nik, t_nama, t_alamat, t_rt, t_rw, t_kelurahan, t_kecamatan, t_kelurahanluar, t_kecamatanluar, t_kabupaten, t_notelp, t_kodepos, t_email, t_operatorid, is_deluser, t_nama_badan, t_jalan_badan, t_rt_badan, t_rw_badan, t_kecamatan_badan, t_kelurahan_badan, t_kabupaten_badan, t_kecamatan_badan_luar, t_kelurahan_badan_luar, t_status_wp, t_tgl_tutup, t_ket_tutup, t_operatorid_tutup, t_noberita, t_tgl_buka, t_ket_buka, t_operatorid_buka, t_noberita_buka, t_photowp) FROM stdin;
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
81	2018-01-01	P	2	81		WELMINA MANDRIBO	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	2	\N	\N	SUPIORI		98163	\N	28	\N	TOKO MEKAR	WARSA RT/RW : - , Warsa , Distrik Supiori Utara Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	2	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
458	2018-01-01	R	2	49		KAREL SOMBA	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	   	   	7	1	\N	\N	SUPIORI		98163	\N	28	\N	TOKO LEON	SORENDIWERI RT/RW : - , Sorendiweri\n, Distrik Supiori Timur Kab./Kota SUPIORI Kode Pos. 98163	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
824	2020-12-03	R	2	413	0204330801	ISAK SEMUEL MANDOSIR	KAMPUNG WARYESI	000	00 	8	1			SUPIORI	0	98573	0	25	\N	CV.EVOLET	KAMPUNG WARYESI	000	00 	1	8	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
827	2020-01-13	P	1	415	0101970201	MAHMUDI	KAMPUNG SAUYAS	000	00 	2	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
828	2020-01-13	R	1	415	0101970201	MAHMUDI	KAMPUNG SAUYAS	000	00 	2	1			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
829	2020-01-13	P	1	416	0103802504	HENY IRIANI	KAMPUNG FANINDI	000	0  	25	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
830	2020-01-13	R	1	416	0103802504	HENY IRIANI	KAMPUNG FANINDI	000	00 	25	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
885	2020-01-30	P	1	446	0001	RAMA SUANI LINGGA	KAMPUNG FANINDI	01 	01 	25	4			SUPIORI	0	98573	0	25	\N	\N	\N	\N	\N	0	0	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
868	2020-12-14	P	2	436	20204523605	MARKUS FAINSENEM	KAMPUNG MANGGONSUN	01 	01 	36	5			SUPIORI	081266677135	98573	0	25	\N	CV.NOROSE STAR	KAMPUNG MANGGONSUAN	01 	01 	5	36	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
937	2020-12-18	P	2	472	0	DANIEL RUMBEKWAN		0  	0  	8	1			SUPIORI	0	98573	0	25	\N	CV. OMKA	JL. SORENDIWERI RAYA	\N	\N	1	7	SUPIORI	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N
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
\.


--
-- Name: t_wp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_wp_seq', 967, true);


--
-- Data for Name: t_wpobjek; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_wpobjek (t_idobjek, t_idwp, t_noobjek, t_tgldaftarobjek, t_namaobjekpj, t_alamatobjekpj, t_namaobjek, t_alamatobjek, t_rtobjek, t_rwobjek, t_kecamatanobjek, t_kelurahanobjek, t_kabupatenobjek, t_notelpobjek, t_jenisobjek, t_kodeposobjek, t_latitudeobjek, t_longitudeobjek, t_gambarobjek, t_operatorid, t_korekobjek, t_kamar, t_statusobjek, t_operatoridtutup, t_tipeusaha) FROM stdin;
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
111	919	59	2020-12-17	ELVIRA FRANSISKA KAWER	KAMPUNG SORENDIWERI	CV. EVIVANIS STAR	KAMPUNG SORENDIWERI	01 	01 	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
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
129	937	3	2020-12-18	DANIEL RUMBEKWAN	JL. SORENDIWERI	CV. OMKA	JL. SORENDIWERI RAYA	   	   	1	7	SUPIORI	0	6	0				25	\N	\N	t	\N	2
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
141	948	64	2020-03-03	DOLFINA MANOBA	KAMPUNG SAUYAS	CV. ANDINE JAYA	KAMPUNG SAUYAS	001	001	1	2	SUPIORI	0	13	98573				25	\N	\N	t	\N	2
142	949	74	2020-03-03	ABRAHAM MANSAWAN	KAMPUNG SORENDIWERI	CV. PAPUA BARAKAS	KAMPUNG SORENDIWERI	001	001	1	7	SUPIORI	0	4	98573				25	\N	\N	t	\N	2
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
\.


--
-- Name: t_wpobjek_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_wpobjek_seq', 161, true);


--
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: t_transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY t_transaksi
    ADD CONSTRAINT t_transaksi_pkey PRIMARY KEY (t_idtransaksi);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

