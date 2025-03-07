PGDMP  /                    }         	   Pesa_Link    17.4    17.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16551 	   Pesa_Link    DATABASE     q   CREATE DATABASE "Pesa_Link" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE "Pesa_Link";
                     postgres    false            �            1259    16560    attempt    TABLE     l   CREATE TABLE public.attempt (
    attempt_id integer NOT NULL,
    attempt_date date,
    amount numeric
);
    DROP TABLE public.attempt;
       public         heap r       postgres    false            �            1259    16559    attempt_attempt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.attempt_attempt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.attempt_attempt_id_seq;
       public               postgres    false    220            �           0    0    attempt_attempt_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.attempt_attempt_id_seq OWNED BY public.attempt.attempt_id;
          public               postgres    false    219            �            1259    16553    trans    TABLE     �   CREATE TABLE public.trans (
    trans_id integer NOT NULL,
    transname character varying(100),
    transemail character varying(100)
);
    DROP TABLE public.trans;
       public         heap r       postgres    false            �            1259    16552    trans_trans_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trans_trans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.trans_trans_id_seq;
       public               postgres    false    218                        0    0    trans_trans_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.trans_trans_id_seq OWNED BY public.trans.trans_id;
          public               postgres    false    217            ]           2604    16563    attempt attempt_id    DEFAULT     x   ALTER TABLE ONLY public.attempt ALTER COLUMN attempt_id SET DEFAULT nextval('public.attempt_attempt_id_seq'::regclass);
 A   ALTER TABLE public.attempt ALTER COLUMN attempt_id DROP DEFAULT;
       public               postgres    false    220    219    220            \           2604    16556    trans trans_id    DEFAULT     p   ALTER TABLE ONLY public.trans ALTER COLUMN trans_id SET DEFAULT nextval('public.trans_trans_id_seq'::regclass);
 =   ALTER TABLE public.trans ALTER COLUMN trans_id DROP DEFAULT;
       public               postgres    false    218    217    218            �          0    16560    attempt 
   TABLE DATA           C   COPY public.attempt (attempt_id, attempt_date, amount) FROM stdin;
    public               postgres    false    220   �       �          0    16553    trans 
   TABLE DATA           @   COPY public.trans (trans_id, transname, transemail) FROM stdin;
    public               postgres    false    218   �                  0    0    attempt_attempt_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.attempt_attempt_id_seq', 1, false);
          public               postgres    false    219                       0    0    trans_trans_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.trans_trans_id_seq', 1, false);
          public               postgres    false    217            a           2606    16567    attempt attempt_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.attempt
    ADD CONSTRAINT attempt_pkey PRIMARY KEY (attempt_id);
 >   ALTER TABLE ONLY public.attempt DROP CONSTRAINT attempt_pkey;
       public                 postgres    false    220            _           2606    16558    trans trans_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.trans
    ADD CONSTRAINT trans_pkey PRIMARY KEY (trans_id);
 :   ALTER TABLE ONLY public.trans DROP CONSTRAINT trans_pkey;
       public                 postgres    false    218            b           1259    16573    fki_r    INDEX     ?   CREATE INDEX fki_r ON public.attempt USING btree (attempt_id);
    DROP INDEX public.fki_r;
       public                 postgres    false    220            c           2606    16568    attempt trans_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.attempt
    ADD CONSTRAINT trans_id FOREIGN KEY (attempt_id) REFERENCES public.trans(trans_id) NOT VALID;
 :   ALTER TABLE ONLY public.attempt DROP CONSTRAINT trans_id;
       public               postgres    false    218    4703    220            �      x������ � �      �      x������ � �     