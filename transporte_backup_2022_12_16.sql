PGDMP         :                z         
   transporte    14.6    14.6 R    |           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            }           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ~           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24586 
   transporte    DATABASE     i   CREATE DATABASE transporte WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE transporte;
                postgres    false                        3079    24969    dblink 	   EXTENSION     :   CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;
    DROP EXTENSION dblink;
                   false            �           0    0    EXTENSION dblink    COMMENT     _   COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';
                        false    2                        3079    25339    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                   false            �           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                        false    3                       1255    24908    adicion(integer)    FUNCTION       CREATE FUNCTION public.adicion(integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
DECLARE
-- Ejemplo 4: FUNCION QUE SUMA LOS n PRIMEROS NUMEROS ENTEROS.
-- ESTRUCTURA DE ITERACION
    cont int := 1;
    res int := 0;
    n int := $1;
BEGIN
-- Esto se va ir repitiendo siempre que el contador sea menor que n que, n es el limite de numero maximo de valores sobre los cuales quiero sumar.
    WHILE(cont <= n) 
        LOOP 
            res := res + cont;
            cont := cont + 1;
        END LOOP;
    RETURN res;
END;
$_$;
 '   DROP FUNCTION public.adicion(integer);
       public          postgres    false                       1255    24955    clientesctas()    FUNCTION       CREATE FUNCTION public.clientesctas() RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
DECLARE
    r record;
BEGIN
    FOR r IN SELECT pasajero.nombre,count(distinct tren.capacidad) +12,COUNT(DISTINCT viaje.id)
				FROM pasajero NATURAL JOIN viaje natural JOIN tren
				GROUP BY pasajero.id, viaje.id
        LOOP
            return next r;
        END LOOP;
    RETURN;
END;
$$;
 %   DROP FUNCTION public.clientesctas();
       public          postgres    false            
           1255    24875    ejefuncion()    FUNCTION       CREATE FUNCTION public.ejefuncion() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE 
    conta INTEGER := 30;
BEGIN
    RAISE NOTICE 'La cantidad aqui es: %', conta; -- Prints 30
    conta := 50;
    /*
    Creamos un subproceso
    */
    DECLARE
        conta INTEGER := 80;
    BEGIN
		RAISE NOTICE 'La cantidad aqui es: %', conta; -- Prints 80
        RAISE NOTICE 'La cantidad aqui es: %', pasajero.conta; --Prints 50
	END;
    RETURN conta;
	RAISE NOTICE 'La cantidad aqui es: %', conta; -- Prints to
END;
$$;
 #   DROP FUNCTION public.ejefuncion();
       public          postgres    false                       1255    24907    espositivo(integer)    FUNCTION     �  CREATE FUNCTION public.espositivo(integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
DECLARE
-- Ejemplo 3: determinar si un cierto numero es positivo o negativo
    a int;
    res boolean := false;
BEGIN
    a := $1; -- Aqui tomamos el parametro de la posicion 1 y lo asignamos a (a).
    IF (a > 0) THEN
        res := TRUE;
    ELSE
        IF (a = 0) THEN
            res := TRUE;
        END IF;
    END IF;
    RETURN res;
END;
$_$;
 *   DROP FUNCTION public.espositivo(integer);
       public          postgres    false                       1255    24905    fibonacci(integer)    FUNCTION     H  CREATE FUNCTION public.fibonacci(integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
    DECLARE
-- CREANDO UNA FUNCION PARA SERIE DE FIBONACCI
        a int; -- A la variable a vamos a asignarle la unica posicion del parametro que recibo.
        res int := 0;
    BEGIN
        a := $1;
        IF(a = 1 OR  a = 2) THEN
            res :=1;
        ELSE
            res := fibonacci(a - 2) + fibonacci(a - 1);
        END IF; -- Siempre que trabajemos con una estructura de condicion toca colocar la finalización de esa estructura de condicion.
        RETURN res;
 END; $_$;
 )   DROP FUNCTION public.fibonacci(integer);
       public          postgres    false                       1255    24914    fun_tiempo(date, date)    FUNCTION     -  CREATE FUNCTION public.fun_tiempo(date, date) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
DECLARE
    g varchar(150);
BEGIN
-- Esta variable g la estoy inicializando con el resultado de un
-- remplazamiento, estamos internamente invocando la funcion age para la fecha inicial y,
-- la fecha final y esto me devolver un tipo varchar y, sobre ese varchar incovamos
-- un manejo de cadenas que es replace, entonces donde quiera que se encuentre year se
-- remplazara con año, etc.
    g := replace(
            replace(
                replace(
                    replace(
                        upper(
                            (age($1,$2)) :: varchar)
                    ,'YEAR','AÑO')
                ,'MONS','MESES')
            ,'MON','MES')
        ,'DAY','DIAS');
    return g;
END;
$_$;
 -   DROP FUNCTION public.fun_tiempo(date, date);
       public          postgres    false            �            1259    24795    pasajero    TABLE     �   CREATE TABLE public.pasajero (
    id integer NOT NULL,
    nombre character varying(100),
    direccion_residencia character varying,
    fecha_nacimiento date
);
    DROP TABLE public.pasajero;
       public         heap    postgres    false            �           0    0    TABLE pasajero    ACL     I   GRANT SELECT,INSERT,UPDATE ON TABLE public.pasajero TO usuario_consulta;
          public          postgres    false    214                       1255    24956    getpasajeros()    FUNCTION     �   CREATE FUNCTION public.getpasajeros() RETURNS SETOF public.pasajero
    LANGUAGE sql
    AS $$SELECT * FROM pasajero WHERE id BETWEEN 1 AND 15$$;
 %   DROP FUNCTION public.getpasajeros();
       public          postgres    false    214                       1255    24964 "   getpasajeroviaje(integer, integer)    FUNCTION     �   CREATE FUNCTION public.getpasajeroviaje(integer, integer) RETURNS SETOF public.pasajero
    LANGUAGE sql
    AS $_$
SELECT * FROM pasajero AS p 
WHERE p.id >= $1 AND p.id <= $2
$_$;
 9   DROP FUNCTION public.getpasajeroviaje(integer, integer);
       public          postgres    false    214                       1255    24963 ,   getpasajeroviaje(character varying, integer)    FUNCTION     �   CREATE FUNCTION public.getpasajeroviaje(character varying, integer) RETURNS SETOF public.pasajero
    LANGUAGE sql
    AS $_$
SELECT * FROM pasajero AS p 
WHERE p.nombre ILIKE '$1%' AND p.id >= $2
$_$;
 C   DROP FUNCTION public.getpasajeroviaje(character varying, integer);
       public          postgres    false    214                       1255    24962 ,   getpasajeroviaje(character varying, numeric)    FUNCTION     �   CREATE FUNCTION public.getpasajeroviaje(character varying, numeric) RETURNS SETOF public.pasajero
    LANGUAGE sql
    AS $_$
SELECT * FROM pasajero AS p 
WHERE p.nombre ILIKE '$1%' AND p.id >= $2
$_$;
 C   DROP FUNCTION public.getpasajeroviaje(character varying, numeric);
       public          postgres    false    214            �            1255    24891    impl()    FUNCTION     1  CREATE FUNCTION public.impl() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
	rec record;
	contador INTEGER := 0;
BEGIN
	FOR rec IN SELECT * FROM pasajero LOOP
		contador := contador +1;
		END LOOP;
		INSERT INTO cont_pasajero ("Total","Time")
		VALUES (contador, now());
		
		RETURN NEW;
END
$$;
    DROP FUNCTION public.impl();
       public          postgres    false            �            1255    24902    impld()    FUNCTION     /  CREATE FUNCTION public.impld() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
	rec record;
	contador INTEGER := 0;
BEGIN
FOR rec IN SELECT * FROM pasajero LOOP
	contador := contador +1;
	END LOOP;
	
	INSERT INTO cont_pasajero ("Total","Time")
	VALUES (contador-1, now());
	
	RETURN OLD;
END
$$;
    DROP FUNCTION public.impld();
       public          postgres    false                       1255    24954    saldoprom()    FUNCTION     }  CREATE FUNCTION public.saldoprom() RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
DECLARE
    r record; -- Aqui estamos definiendo una variable de tipo registro
BEGIN
    FOR r in SELECT avg(capacidad)
             FROM tren -- Aqui estamos recuperando el saldo promedio.
             GROUP BY id
        LOOP
            return next r;
        END LOOP;
    RETURN;
END;
$$;
 "   DROP FUNCTION public.saldoprom();
       public          postgres    false                       1255    24904    suma(numeric, numeric)    FUNCTION     �   CREATE FUNCTION public.suma(numeric, numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $_$
	DECLARE 
		a numeric;
		b numeric;
		res numeric;
	BEGIN
		a := $1;
		b := $2;
		res := a + b;
		
		RETURN res;
	END;
$_$;
 -   DROP FUNCTION public.suma(numeric, numeric);
       public          postgres    false                       1255    24909 	   sumafor()    FUNCTION     �  CREATE FUNCTION public.sumafor() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
-- EJEMPLO 5
-- SUMA con FOR
    cont int;
    res int := 0;
BEGIN
-- En la itecion for tenemos que saber hasta donde deve terminar
-- por eso podemos ver que 1..10 es el rango q va a iterar, 
-- donde los dos puntos nos indican el limite.
    FOR cont in 1..15
        LOOP 
            res := res + cont;
        END LOOP;
    RETURN res;
END;
$$;
     DROP FUNCTION public.sumafor();
       public          postgres    false            %           1255    25063    sumafor(integer)    FUNCTION     �  CREATE FUNCTION public.sumafor(integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
DECLARE
-- EJEMPLO 5
-- SUMA con FOR
    cont int := $1;
    res int := 0;
BEGIN
-- En la itecion for tenemos que saber hasta donde deve terminar
-- por eso podemos ver que 1..10 es el rango q va a iterar, 
-- donde los dos puntos nos indican el limite.
    FOR cont in 1..15
        LOOP 
            res := res + cont;
        END LOOP;
    RETURN res;
END;
$_$;
 '   DROP FUNCTION public.sumafor(integer);
       public          postgres    false            �            1259    24878    cont_pasajero    TABLE     t   CREATE TABLE public.cont_pasajero (
    "Total" integer,
    "Time" time with time zone,
    id integer NOT NULL
);
 !   DROP TABLE public.cont_pasajero;
       public         heap    postgres    false            �           0    0    TABLE cont_pasajero    ACL     N   GRANT SELECT,INSERT,UPDATE ON TABLE public.cont_pasajero TO usuario_consulta;
          public          postgres    false    224            �            1259    24877    cont_pasajero_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cont_pasajero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.cont_pasajero_id_seq;
       public          postgres    false    224            �           0    0    cont_pasajero_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.cont_pasajero_id_seq OWNED BY public.cont_pasajero.id;
          public          postgres    false    223            �            1259    24785    estacion    TABLE     y   CREATE TABLE public.estacion (
    id integer NOT NULL,
    nombre character varying,
    direccion character varying
);
    DROP TABLE public.estacion;
       public         heap    postgres    false            �           0    0    TABLE estacion    ACL     I   GRANT SELECT,INSERT,UPDATE ON TABLE public.estacion TO usuario_consulta;
          public          postgres    false    212            �            1259    24784    estacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.estacion_id_seq;
       public          postgres    false    212            �           0    0    estacion_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.estacion_id_seq OWNED BY public.estacion.id;
          public          postgres    false    211            �            1259    24820    viaje    TABLE     �   CREATE TABLE public.viaje (
    id integer NOT NULL,
    id_pasajero integer,
    id_trayecto integer,
    inicio timestamp with time zone,
    fin timestamp with time zone
);
    DROP TABLE public.viaje;
       public         heap    postgres    false            �           0    0    TABLE viaje    ACL     F   GRANT SELECT,INSERT,UPDATE ON TABLE public.viaje TO usuario_consulta;
          public          postgres    false    220            �            1259    24851    inicio_fin_viaje_mview    MATERIALIZED VIEW     R  CREATE MATERIALIZED VIEW public.inicio_fin_viaje_mview AS
 SELECT viaje.id,
    viaje.id_pasajero,
    viaje.id_trayecto,
    viaje.inicio,
    viaje.fin
   FROM public.viaje
  WHERE ((viaje.inicio > '1987-01-01 00:00:00-05'::timestamp with time zone) AND (viaje.fin < '1999-01-01 00:00:00-05'::timestamp with time zone))
  WITH NO DATA;
 6   DROP MATERIALIZED VIEW public.inicio_fin_viaje_mview;
       public         heap    postgres    false    220    220    220    220    220            �            1259    24794    pasajero_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pasajero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.pasajero_id_seq;
       public          postgres    false    214            �           0    0    pasajero_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.pasajero_id_seq OWNED BY public.pasajero.id;
          public          postgres    false    213            �            1259    24847 
   range_view    VIEW     �  CREATE VIEW public.range_view AS
 SELECT pasajero.id,
    pasajero.nombre,
    pasajero.direccion_residencia,
    pasajero.fecha_nacimiento,
        CASE
            WHEN (pasajero.fecha_nacimiento > '1985-01-01'::date) THEN 'Mayor'::text
            ELSE 'Niño'::text
        END AS "case"
   FROM public.pasajero
  WHERE (pasajero.fecha_nacimiento > '1985-01-01'::date)
  ORDER BY pasajero.fecha_nacimiento;
    DROP VIEW public.range_view;
       public          postgres    false    214    214    214    214            �            1259    24813    trayecto    TABLE     �   CREATE TABLE public.trayecto (
    id integer NOT NULL,
    id_estacion integer,
    id_tren integer,
    nombre character varying(100)
);
    DROP TABLE public.trayecto;
       public         heap    postgres    false            �           0    0    TABLE trayecto    ACL     I   GRANT SELECT,INSERT,UPDATE ON TABLE public.trayecto TO usuario_consulta;
          public          postgres    false    218            �            1259    24812    trayecto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trayecto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.trayecto_id_seq;
       public          postgres    false    218            �           0    0    trayecto_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.trayecto_id_seq OWNED BY public.trayecto.id;
          public          postgres    false    217            �            1259    24804    tren    TABLE     k   CREATE TABLE public.tren (
    id integer NOT NULL,
    modelo character varying,
    capacidad integer
);
    DROP TABLE public.tren;
       public         heap    postgres    false            �           0    0 
   TABLE tren    ACL     E   GRANT SELECT,INSERT,UPDATE ON TABLE public.tren TO usuario_consulta;
          public          postgres    false    216            �            1259    24803    tren_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tren_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tren_id_seq;
       public          postgres    false    216            �           0    0    tren_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tren_id_seq OWNED BY public.tren.id;
          public          postgres    false    215            �            1259    24819    viaje_id_seq    SEQUENCE     �   CREATE SEQUENCE public.viaje_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.viaje_id_seq;
       public          postgres    false    220            �           0    0    viaje_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.viaje_id_seq OWNED BY public.viaje.id;
          public          postgres    false    219            �           2604    24881    cont_pasajero id    DEFAULT     t   ALTER TABLE ONLY public.cont_pasajero ALTER COLUMN id SET DEFAULT nextval('public.cont_pasajero_id_seq'::regclass);
 ?   ALTER TABLE public.cont_pasajero ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    24788    estacion id    DEFAULT     j   ALTER TABLE ONLY public.estacion ALTER COLUMN id SET DEFAULT nextval('public.estacion_id_seq'::regclass);
 :   ALTER TABLE public.estacion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            �           2604    24798    pasajero id    DEFAULT     j   ALTER TABLE ONLY public.pasajero ALTER COLUMN id SET DEFAULT nextval('public.pasajero_id_seq'::regclass);
 :   ALTER TABLE public.pasajero ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    24816    trayecto id    DEFAULT     j   ALTER TABLE ONLY public.trayecto ALTER COLUMN id SET DEFAULT nextval('public.trayecto_id_seq'::regclass);
 :   ALTER TABLE public.trayecto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    24807    tren id    DEFAULT     b   ALTER TABLE ONLY public.tren ALTER COLUMN id SET DEFAULT nextval('public.tren_id_seq'::regclass);
 6   ALTER TABLE public.tren ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    24823    viaje id    DEFAULT     d   ALTER TABLE ONLY public.viaje ALTER COLUMN id SET DEFAULT nextval('public.viaje_id_seq'::regclass);
 7   ALTER TABLE public.viaje ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            y          0    24878    cont_pasajero 
   TABLE DATA                 public          postgres    false    224   i       n          0    24785    estacion 
   TABLE DATA                 public          postgres    false    212   5j       p          0    24795    pasajero 
   TABLE DATA                 public          postgres    false    214   �t       t          0    24813    trayecto 
   TABLE DATA                 public          postgres    false    218   �~       r          0    24804    tren 
   TABLE DATA                 public          postgres    false    216   ��       v          0    24820    viaje 
   TABLE DATA                 public          postgres    false    220   U�       �           0    0    cont_pasajero_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cont_pasajero_id_seq', 13, true);
          public          postgres    false    223            �           0    0    estacion_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.estacion_id_seq', 106, true);
          public          postgres    false    211            �           0    0    pasajero_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pasajero_id_seq', 109, true);
          public          postgres    false    213            �           0    0    trayecto_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.trayecto_id_seq', 181, true);
          public          postgres    false    217            �           0    0    tren_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tren_id_seq', 110, true);
          public          postgres    false    215            �           0    0    viaje_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.viaje_id_seq', 119, true);
          public          postgres    false    219            �           2606    24883     cont_pasajero cont_pasajero_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.cont_pasajero
    ADD CONSTRAINT cont_pasajero_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.cont_pasajero DROP CONSTRAINT cont_pasajero_pkey;
       public            postgres    false    224            �           2606    24792    estacion estacion_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.estacion
    ADD CONSTRAINT estacion_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.estacion DROP CONSTRAINT estacion_pkey;
       public            postgres    false    212            �           2606    24802    pasajero pasajero_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.pasajero
    ADD CONSTRAINT pasajero_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.pasajero DROP CONSTRAINT pasajero_pkey;
       public            postgres    false    214            �           2606    24818    trayecto trayecto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.trayecto
    ADD CONSTRAINT trayecto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.trayecto DROP CONSTRAINT trayecto_pkey;
       public            postgres    false    218            �           2606    24811    tren tren_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tren
    ADD CONSTRAINT tren_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tren DROP CONSTRAINT tren_pkey;
       public            postgres    false    216            �           2606    24825    viaje viaje_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.viaje
    ADD CONSTRAINT viaje_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.viaje DROP CONSTRAINT viaje_pkey;
       public            postgres    false    220            �           1259    24864    idx_fecha_nacimiento    INDEX     U   CREATE INDEX idx_fecha_nacimiento ON public.pasajero USING btree (fecha_nacimiento);
 (   DROP INDEX public.idx_fecha_nacimiento;
       public            postgres    false    214            �           2620    24892    pasajero mitrigereje    TRIGGER     h   CREATE TRIGGER mitrigereje AFTER INSERT ON public.pasajero FOR EACH ROW EXECUTE FUNCTION public.impl();
 -   DROP TRIGGER mitrigereje ON public.pasajero;
       public          postgres    false    214    237            �           2620    24903    pasajero mitriggerd    TRIGGER     i   CREATE TRIGGER mitriggerd BEFORE DELETE ON public.pasajero FOR EACH ROW EXECUTE FUNCTION public.impld();
 ,   DROP TRIGGER mitriggerd ON public.pasajero;
       public          postgres    false    249    214            �           2606    24826    trayecto trayecto_estacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trayecto
    ADD CONSTRAINT trayecto_estacion_fkey FOREIGN KEY (id_estacion) REFERENCES public.estacion(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 I   ALTER TABLE ONLY public.trayecto DROP CONSTRAINT trayecto_estacion_fkey;
       public          postgres    false    218    212    3278            �           2606    24831    trayecto trayecto_tren_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trayecto
    ADD CONSTRAINT trayecto_tren_fkey FOREIGN KEY (id_tren) REFERENCES public.tren(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public.trayecto DROP CONSTRAINT trayecto_tren_fkey;
       public          postgres    false    3283    218    216            �           2606    24841    viaje viaje_pasajero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.viaje
    ADD CONSTRAINT viaje_pasajero_fkey FOREIGN KEY (id_pasajero) REFERENCES public.pasajero(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 C   ALTER TABLE ONLY public.viaje DROP CONSTRAINT viaje_pasajero_fkey;
       public          postgres    false    220    214    3281            �           2606    24836    viaje viaje_trayecto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.viaje
    ADD CONSTRAINT viaje_trayecto_fkey FOREIGN KEY (id_trayecto) REFERENCES public.trayecto(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 C   ALTER TABLE ONLY public.viaje DROP CONSTRAINT viaje_trayecto_fkey;
       public          postgres    false    3285    218    220            w           0    24851    inicio_fin_viaje_mview    MATERIALIZED VIEW DATA     9   REFRESH MATERIALIZED VIEW public.inicio_fin_viaje_mview;
          public          postgres    false    222    3451            y     x��ӽNA�~�b��,���s�,(H&��D

Q|7;�/�SM����9��v�ԛ��4�߷�qo����e���8|�ͼ���ݩ�L�?�{|_���������Igf�����I���ɬ3��k�Su.�(���(@ֱ�>f�1;Y�d�k���L�q������`�p��t|Y�{eV�ZR�|�v�AO�ފ���.ے�uI⭘T��1zP�ձ�X>��`ց�E��U��<�e�|᫬�>*��&�[74�M���/�      n   s
  x��ZKs�8��W�j�����~Ԟ,9�I���&U�A$$a
HZ#���nP��W�G����=�������3��������տD��J�����is�X1a����b�o����f��q�����?߼0�"��ZԜ�A���2"@��L�����XѲ?X�]=RX�њ��u��ϭӱ+G��L��It���Z<� �u<�L�;/�p8�8�E�|�7�`�u�?%�t-���h�&�7���ִ-�K[)16XNgb��vg��{�:�u͞dW����iV�f쉟ي�`��6ccx5�k���rmt��<367]g�ɘ�=*��ǆ+a�{�[�a��?R�0b�x۱���:x||"ê?��n'l!�^��~H�����zk�����!]`/���s�@T�*���l�.w
6�Jr��\\�Eu+�Ɯ&��KRmx�P�2�̜\�;[9�5��y���c�2e	�7:N�*PB$��+a�9�1Ł=[.��@ O��tik�vy-K�g.j�غ���F#\���v���̕w��ʖ�O~ �ܛ�Q\�^�=;�g%�+^���"+��W���+��B#'�G�! ��싦@![�ۛ�����/(B�Xq<N��Ԇ����U�Ȇף� ^|����.z�[wfx)�=����!b��Z\�+�� ������[1}�禉$���..
s(kt ���#�7��0T�Q�`3�v��t����(ک�6웱۾���C����� ��%4x���,�ٍm )x�<5:2���6r��@j@�癲��V���
�yw��^s���(�<Ȓ>���Rj�o�w�,��w�GyT� �D��ƈ���m�&eƾ˪3Vr�R�GgL����w����xRN"
dH
�9a.ޟ��#��֜'l}�*Ƙ�\�ۺrO��I﹭;v�=:.��޵�⨥ZWK(�a��9�n����Z�̠� � @���?�#�,U���;c�W�	_Ғ�x-x�	�cn���.](J�h`��'Y�/|�U~��� ?��';�aYT�s�����͋����Dz�Y�{���"Ƥu�s_���g�Vך�,@�B4��֒�d�NB�����"a
g��탃����^���?��^������	��+ܱ�TI"g�)\�Ϝ� ]��h�шJ����	��C�k���r9w�$wڟJIݸ�wf���܁	H�m;:���;��VX@Dj��a��Pk�V���$����� �H�����'(	�d�:��[�%�U �6�'#8�[\i_�>!��`���P
Xg��D:=�@1gq� w�����YX�gt�{�������ޚ~7؃,�0�x[K���qf����{�P�͞_�P��-��
IC�I��e�(%��+\�˓�N�T��%TT9�d':lg���4��&�� �Z��¼��suI�=���������+��H�g)�'��RcDVb���v+��NOV���H~zЙ)�	���/�S�n�S/jW{	�>,0H���"���R7|
re�wFA<�@����JU��䇴����ʎ(gKc�7^>(��T�!�	s�h$%;ܜ�@�I���ӫ&u'	<DV C���g�������h�J��K�n2���IΑ�CCn��N��]~<rvi�N�̊�q��Y�u�"���l�dݽ*p����Ȫ?ƃ}���B�Jx\~�?唃�'�!���U2D�o�{m��UΤ׭/��� ;4b��/=g+�gO����Wf�N����/dХ���Ҭ$��z�����~?o=�� ������杙{k����<�|h��=�[_��Β&	hȳ���i�ij����F�4/��G���#�rč��r4�ٴ{�f���{�C��O��OW�{u�;�|�ITS�g?�H%h�.m�"v������#8|�n��^'l����nǐ��৤�~��o�(,�q`�E}f�V���$��%�׊�a�n��:in��Z`֫	���
{��D���� n�茟�qA�؄6i
�\7[����W����8
���vi���"H���h!��q]��U�����Det��Fi;gw����N��e+�v�fl��/�,�3 ᡼�<�tS��b��7A��zz+7@*����j�=$�'cYd�m��9Y�l�a� .،���S3�@y7��$P�`��i+��ET��Iԉ�Zŀ*���r$9��^9�	"n}��n/R��0BQ�w�E��>���O�D\y2fsI� G8�+0�>�i��Pӧ,���2n)!)��[2�^EIS����Pa�;izG
�Ì����]sTy���z׾^�):����pp�t)$�**�S��)#�&9<}ׅ(C�[��PeF�ꬍ}��a�ݖ�$G�E_URRE��_~�� ΄��:Z��?�[>8�t#��4�w���;�y�%�M;��'בn0��`RP���G�
���p/V9eJo	���4`s��@`/�Y��������[X�w%�KU�kIgz��G҇�w�y�d�h���a�����f���F�}[��Z>f%����]%�]�A����c!��,N��|��q2̜��@��?x����� �+      p   �	  x��[�n�8}� 0=��wa��Ĺ�� v'���D[lӤ���U�f�el�H�rz�/T��I'f���9�������e)�ľZi��c��Ί�Uv!�ݭ���r2M�59Y�L�T��X�4���j��)��u2�>]�߻��4ۀw_�w��Dԣ/�d4�D���~��
��G]�QR��4A��E<Q�{�8�tG�Q��
�Z�W:�Jkѥ F�Gf���vY��Qs���pc��8��PMQ'�;��8�x��T&n�����'��-l�i�H:Q��1£�y��1]�8�eĳ2�h@:�D�N��c<���Č�����r��C�0'�n�&x�}ijť݄��֨�|$� �q�g͠t��;������ N6�)��7��[��QB���<0n,�F�#ؾ����C��R�5�S<H��|��n��ļq���ժ��р�ξgǲ�(13@�A&��[��V��ο�&�K�T�*��V���d�U�}-n+霄��������d���w�+�Ԕ*�����`m�Th�y�&D$�J��W��M�
~�(��۷�A>�%���K���ҷ�������D�.o}���&���Hf�&���J��m�.wu	)ϹB6�b�e�(B!�,�5��p�d	���%�,a�-�ʤ�ۖ�w�m������#j�Q�xs�,�?��<����N�p�2�]#������L������H�dMī�W�Ҿ-^�����22BF���o+ِ��Ve�T�!�}��^���B�V�qqE
�Y]�ҐO��wsP������\��7��+�eQ�ؾsH'��:�ŀk���q��ڋ[]�r\b6�2�����Mϫ�чh���if n,����0�c�y)����en���
0mR"��Y�$�fq�������D4m1C��|��:q�F6&����N4d_	t����bYV����ث�7b�+��"l�t�M�o�mRM�e�O����ÈE���'�Ŗy[�.{:�Rg�
1�6i��Kp[���A�`�:�D��h�e�-j�}��=۔���)�wW�'p*�ri~6MĄS�@��o� �M���9��_u�D��e`|ߖ�Ŗ�4вu�D뼑�Og�1b�7�K]�v����M^m�>��V��t?$
L3P݀;�5iGN��xy}�����qL����+���F�[f�i�o<☕���p���rـ�Rl�@#�y�r}�<�03��3jm���-��N��1�2'b�M v(��ݡ�h�@^���4�N��Q0�h�9v��F�ȏ���$.��
/R�<c=YW��J>yd^�$�fF\9��e��<M�۩t{)/o#��Y�	bfA�{P������{��~%�W%��c}i�&\����>bHLz&�yz�+���Ŵ���"��}�=Okt���}T�u,]�N+*�
�
bH����Z;�a^����~�1��Q��:a��E��`��b�ʼnx�E_��wG���H������&O�\�w.s2�R��jgI��wy,52������D���2u>�- n�<i���e^"E~f��,]����O�ۄ��IŒ���Z���ղU���3'ó*�$~�<}��6�zm4��SZ�+�Qϯ��g�P��`dÀ[iF}?=�������]8}Q҅^�hcJ3���U�@��+S�zr7X��;<�#�.q�Glѝ�E�C��!;pGg4��V�S�_H@&�������OTܕ��TiiI���H�?~.��[�{���^�/R4����z�<�;��I�	m��r��"���Ӽ/c�K�1q���BU��ʰ	YH����Wf~<C�ziW��鿚���m=z�.s=�I_�S���,�Ձ<v��exR�����t�9��氱hH�V��G��2'��U3V�Yo�4S6ċ�� ���Os͈�o�^m���!'�6?=Ih<<��9�řն7J�"\� ۟M�]�K��2�=�R�媔�~��ߟ|	-��o<�w�X"���?I���Q�G�`$O�����!�zm�@Ę��4�5���šF5`EP�꿭(F�b�y�t�+���]f�$��$G�D�;��K�s�?`+f`6k��K�r@�ܶ���I߻G�m�P���U�SxôVRg'�R�x%1!�}�N���ѨUS����A�V�bn��^Km�p�.	�ux��q���tf!J��}$�w�[פe������N	1�tE.d�Ϩ��弸<7/���'�ӳ�V��E�-��p�Ŀ#a��#�k�4���,�a+��C�Ў~�a���(3={�z[�R"rڻ�Q���8�ݥD��9�n���:-���\�<��'�4��8ϯ��eJ��-�21GCWg�2]~���t��Z="�����#�O��ds�S�Z�-��iz?����}6���%~���R��6����K�6���Z���M_t��k�s�h��b	�#=���/�)�c��忈k�      t   �  x��Z]o�6}ϯЛZ�D���6ی�{旁�i[�,�����������K ��C�~�s��O��d�y���/���2�j6�M޵�Y�n�5�7���?�`�ޞփy��=|��i��+f�p?��e�I����n�]�5K��d��f��%�Z1B׳$�%��`�.?n-8oM��qu��nN���h&�(������~��ᄧ�(��B�<���9����"���th{NtB�	]!2/�ƞ8�)�"�����ݴ�x�<���7�t��ЮY��:gťn����L�5kN*łn]���}ߚ�	�JGaRA���G���bR�u�1�A����hPddc9����),��e�^4T��J|��Y���lV𣢐���u2=l9�_6��Cw>���̩OY�Y����s����������t�]�����4g��,�tV:5�eNt`d�����4�����Q�k�вȨ�
�W(֕�	�7�ĥ��&�����;���		����	�	��P�����`A�E4�߱	���u�tiN���x?��"�);}l���c-!���!������)C�{% A�`f�_񪁀�A,cD����[�8j�")����d���:��A��ҩ��1[-�*(��c�f�il;f��s�E�#H����'�̙s(����?��h�8�d��&0i)�ג�?&N��t�2V	��K��&��A��>D�S����*�nK���z:�R�J@&1�UE��@��"����N�Y��=0s�㪐!(2�ZO ڢ���ZV�1Oz�$/�	>Թ��}���<1�*؊��5آ�B+T�<3��=`��0*h����Gy�)�Hc�^����ġ�����(̿��z�*���_^�U� ���n����̓��5�½�?�f�����t<���,`.8 Hp������+}oĀ�R�eY��� ��z�Z(և.3e�*��Ơ���]۳��/���%]�&n�_L����<�v;'gcS�V�xLM?X{�k�a�Ơ��b���u\�c�gs�/��c!���^#� cc�-���~�fE��Ū�C-Ma��_������~�;�G�,lS�8	�`�X��hm�	�b�d��_(�����!�,V)�A=AG�n����/gӱ��N���V�
ê[�} ������ا�-/yVa�튟�8�]Ծt߷8k�M-�[���������v�s      r   �  x����r�6н��$3vKLW�FV��N�R�;H�L)RCR��?�w����$Yq��]x�;$u��w{?=�������e\��5E���ե�ԫ��/�2l�2���z��|M����zs'�V�K50ɻ�.n�gXv����iJ�s�U<�e��9N���癄y�����a)���9��a��wE�|4"h� �5-�X�x.&خ���+�`��>i8����SeL�FVX4�.�(�0�������-���U���L��f_t]�g9&�Gm�$y&��Sm6�Z�2� ?�EU	xF|
��+� F{
�}'b���>�����P�w� _�����_b�X�eef��Ь���b���>�-v�"T��[2�S���-����G��RƼ�a��_����w�>�c�_�M��:Tv����?.�����@ְ�)�"x�W�]�>�-SZ
��G�0E�Q��{c���25�e��6E۾�#SZ:�]���U�u�V��-k�K+��B�P�jY�}!�+�5�e�K����j�2���4 �)�L��4�?�����������ǡ�j��uXmB�ɞ��Ȥ�bS�េ�t[7ݾ�S���Q�.���$c�п�q��6��m��p�����Ha�����1ڍ�<��`�s#��g��I��a���P��������ɾ��ج�̈́���V��ŧ���|8D�܂��?�J�'�.�0�-�?LÀ� oĂa�[s�sB�OÀ� ]nc��8F��_<#�B�ܨ;�����w�������A]�傾��X��a(�x�
�L䨀����ZF~��e�-�����tu�lL������ej G�zA�������2�s������UПLÀw�슇�0g�;i�g�a�;��i�X�����o�,sƸ����t�3���v�2g�;{踗�\a�s懵%g�;��I�xS�+/�.e�U}����x��>���__�K������!������G�������$1��,𤋮~�a���� _`0��}��8���Y�٢ S 0��]#�OM�`_'�s$q#����u�Ԍ*��ix
���R%�,jJ���]\����-���W%r�3��V%(����Lxj^�Vm���S�Dz����S3�D�#�*j\���wք��e���m���?��a4      v   �  x��[M�E��_1�$�j�wÉCOBA"�+
I����Ŀ����mv=p`� �*Z�a*�j�\�{|���7�����^>�����7��~|�ӻ����a9�����_���_�ǧ���x��~�?�9�?�?[���o��\����'�Z^�_][��\>�KO�'������{B��%�2���-(>�Bi�%�/,��J�\?�
����į����?ɶX�|B8��y%�.�CVW2L�m�X�\�?�Յ5�-�H�g�2WV�SrrÌ�@�qtj?�� )�����h������\��L&P&�b��[�8�t�JƓl�d��L�1���"�I9�$�TS4��L⃪i�T[I�M�|h�i<��3s��zG��W�W2��h��I���l�Ǎ�7�3_ǧ����-�
�&�Ҙ7(���:~'�AOČ��y�%�5T��׮���`+h���m�G� (e):[��q)�N8�h�ѮT�gLbH,����औ�Pz���M��bD��l�Z��l�Kf`�����J;Tm��-o�7�N���FۍtS���;� K;i������U���F�ok�
�$V���X�db��;��(�!o���	�3�MM��n��A2v�3gc�:���<� �p.H��Zʉr�l�x@:����t�8@��r��m/Vt]��Ks�U4�\��ND�Y 'O���$W�òmc"2�D��o��9HF�>����:$`�uN8�y'�o��<�����:a9�\քIi5��O�����*�qZ�Z��*Q:�^kϙ;�Tn��$�#8m�����k�wno8�uw�(QST+�1)w��F� �C�oxQ��f��֊��$5��0�;)��Qɗ�宅��9ږ�t����9<��T.g�ǚ<�;�݈�YY䠱������Ւ�r�Y�;�03y?nz�F7m���Y���|$
�O�qt�N�0|����M��-�� ���OOPz���@�Jx��kyY�Yv��Y@����5�D�6(E)���:^����Y4'C�r��d�jj��'����zQ���V��*����є�NC�Ne�40�YM��FW|ka��D뉧��NHCeU��
2g�-��(�D�"��(�)������NC�mS����QYBw))��D���;����$
mV�K��,�褓�E����b��s�)Q$"wЫ�Hkc}Z(��_�OWKU�$=�m	-�{����l�/{��0�␃`���ʘSL�f��":�au�hX�3�JHP]�����0�(T.��Q[��Ne|X����:*e�}w����2�d@�mtwNU`U��W���;Nɍ�B�h�AXqb���<�:�w�`��i(%?	��IwH��9H��b����W��*���j��T���E�I���;�A)��{�XV�A�;X��i��;�t7���6�KetQ�� �6¦,B�:�NQ�� ݸ��NJ��j�b�K[y�w(�XJ��C�MS ub��>c8b^ ��ݼ�������Eʗy��"�po�Ȼ��\_��<�5���Y����(ǡ"��0��p�$%����F���P�ݡϒyr �<�čq2��/(�%���\G|���|gP�A��i�vm̴��;�\���i��5L�Y������B�$@ss�"LV0P���)�lnȺV���r%�8�w���X����w#[&��Ú�,aD�O��{�*d��+kh�JO?�)bt<	��]�6���mө?	����2���[Iz����O�֞u|��^���Fn����P]6�Wtn���ß^�!�     