
CREATE SEQUENCE public.user_id_seq;

CREATE TABLE public.user (
                id INTEGER NOT NULL DEFAULT nextval('public.user_id_seq'),
                password_hash VARCHAR(30) NOT NULL,
                login VARCHAR(30) NOT NULL,
                CONSTRAINT user_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.user_id_seq OWNED BY public.user.id;

CREATE UNIQUE INDEX user_idx
 ON public.user
 ( password_hash, login );

CREATE SEQUENCE public.ingredients_id_seq;

CREATE TABLE public.ingredients (
                id INTEGER NOT NULL DEFAULT nextval('public.ingredients_id_seq'),
                name VARCHAR(30) NOT NULL,
                CONSTRAINT ingredients_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;

CREATE SEQUENCE public.pizza_id_seq;

CREATE TABLE public.pizza (
                id INTEGER NOT NULL DEFAULT nextval('public.pizza_id_seq'),
                ingredients_id INTEGER NOT NULL,
                name VARCHAR(30) NOT NULL,
                price NUMERIC(4,2) NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.pizza_id_seq OWNED BY public.pizza.id;

CREATE SEQUENCE public.address_id_seq;

CREATE TABLE public.address (
                id INTEGER NOT NULL DEFAULT nextval('public.address_id_seq'),
                civility CHAR(1) NOT NULL,
                last_name VARCHAR(30) NOT NULL,
                first_name VARCHAR(30) NOT NULL,
                street TEXT NOT NULL,
                city VARCHAR(30) NOT NULL,
                postal_code CHAR(5) NOT NULL,
                phone CHAR(10) NOT NULL,
                CONSTRAINT address_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;

CREATE INDEX address_idx
 ON public.address
 ( city, postal_code );

CREATE SEQUENCE public.pizzeria_id_seq;

CREATE TABLE public.pizzeria (
                id INTEGER NOT NULL DEFAULT nextval('public.pizzeria_id_seq'),
                id_address INTEGER NOT NULL,
                name VARCHAR(20) NOT NULL,
                CONSTRAINT pizzeria_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.pizzeria_id_seq OWNED BY public.pizzeria.id;

CREATE TABLE public.bill (
                id INTEGER NOT NULL,
                id_pizzeria INTEGER NOT NULL,
                date TIMESTAMP NOT NULL,
                price NUMERIC(8,4) NOT NULL,
                CONSTRAINT bill_pk PRIMARY KEY (id)
);


CREATE TABLE public.stock (
                id_ingredients INTEGER NOT NULL,
                id_pizzeria INTEGER NOT NULL,
                quantity INTEGER NOT NULL
);


CREATE TABLE public.order (
                id INTEGER NOT NULL,
                date TIMESTAMP NOT NULL,
                total_price NUMERIC(8,4) NOT NULL,
                deliver BOOLEAN NOT NULL,
                id_address INTEGER NOT NULL,
                bill_id INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                CONSTRAINT order_pk PRIMARY KEY (id)
);


CREATE SEQUENCE public.admin_id_seq;

CREATE TABLE public.admin (
                id INTEGER NOT NULL DEFAULT nextval('public.admin_id_seq'),
                id_user INTEGER NOT NULL,
                id_address INTEGER NOT NULL,
                id_pizzeria INTEGER NOT NULL,
                CONSTRAINT admin_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;

CREATE SEQUENCE public.delivery_man_id_seq;

CREATE TABLE public.delivery_man (
                id INTEGER NOT NULL DEFAULT nextval('public.delivery_man_id_seq'),
                id_user INTEGER NOT NULL,
                id_address INTEGER NOT NULL,
                id_pizzeria INTEGER NOT NULL,
                CONSTRAINT delivery_man_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.delivery_man_id_seq OWNED BY public.delivery_man.id;

CREATE SEQUENCE public.pizzaiolo_id_seq;

CREATE TABLE public.pizzaiolo (
                id INTEGER NOT NULL DEFAULT nextval('public.pizzaiolo_id_seq'),
                id_user INTEGER NOT NULL,
                id_address INTEGER NOT NULL,
                id_pizzeria INTEGER NOT NULL,
                CONSTRAINT pizzaiolo_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.pizzaiolo_id_seq OWNED BY public.pizzaiolo.id;

CREATE TABLE public.customer (
                id INTEGER NOT NULL,
                id_user INTEGER NOT NULL,
                address_id INTEGER NOT NULL,
                CONSTRAINT customer_pk PRIMARY KEY (id)
);


ALTER TABLE public.customer ADD CONSTRAINT user_customer_fk1
FOREIGN KEY (id_user)
REFERENCES public.user (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizzaiolo ADD CONSTRAINT user_pizzaiolo_fk1
FOREIGN KEY (id_user)
REFERENCES public.user (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.delivery_man ADD CONSTRAINT user_delivery_man_fk1
FOREIGN KEY (id_user)
REFERENCES public.user (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.admin ADD CONSTRAINT user_admin_fk1
FOREIGN KEY (id_user)
REFERENCES public.user (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT ingredients_stock_fk
FOREIGN KEY (id_ingredients)
REFERENCES public.ingredients (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza ADD CONSTRAINT ingredients_pizza_fk
FOREIGN KEY (ingredients_id)
REFERENCES public.ingredients (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order ADD CONSTRAINT pizza_oder_fk
FOREIGN KEY (id)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order ADD CONSTRAINT pizza_order_fk
FOREIGN KEY (pizza_id)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.customer ADD CONSTRAINT user_customer_fk
FOREIGN KEY (address_id)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizzaiolo ADD CONSTRAINT user_pizzaiolo_fk
FOREIGN KEY (id_address)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.delivery_man ADD CONSTRAINT user_delivery_man_fk
FOREIGN KEY (id_address)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.admin ADD CONSTRAINT user_admin_fk
FOREIGN KEY (id_address)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order ADD CONSTRAINT user_oder_fk
FOREIGN KEY (id)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizzeria ADD CONSTRAINT address_pizzeria_fk
FOREIGN KEY (id_address)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order ADD CONSTRAINT address_order_fk
FOREIGN KEY (id_address)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT pizzeria_stock_fk
FOREIGN KEY (id_pizzeria)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.bill ADD CONSTRAINT pizzeria_bill_fk
FOREIGN KEY (id_pizzeria)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.admin ADD CONSTRAINT pizzeria_admin_fk
FOREIGN KEY (id_pizzeria)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.delivery_man ADD CONSTRAINT pizzeria_delivery_man_fk
FOREIGN KEY (id_pizzeria)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizzaiolo ADD CONSTRAINT pizzeria_pizzaiolo_fk
FOREIGN KEY (id_pizzeria)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order ADD CONSTRAINT bill_oder_fk
FOREIGN KEY (id)
REFERENCES public.bill (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order ADD CONSTRAINT bill_order_fk
FOREIGN KEY (bill_id)
REFERENCES public.bill (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
