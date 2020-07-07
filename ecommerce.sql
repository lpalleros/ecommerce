CREATE TABLE articulos ( 
    art_id SERIAL PRIMARY KEY,
    descripcion VARCHAR(100),
	habilitado BOOLEAN,
    lleva_stk BOOLEAN,
    cod_unistk CHAR(3),
    cod_univta CHAR(3),
    cod_categ CHAR(3), 
    porc_ivavta DECIMAL(6,3)
),

CREATE TABLE clientes ( 
    clien_id SERIAL PRIMARY KEY,
    razon_social VARCHAR(100),
	tipo_doc CHAR(4),
    nro_doc CHAR(11),
    domicilio VARCHAR(50),
    cod_provin CHAR(3),
    cod_pais CHAR(2),
    email VARCHAR(100)
),

CREATE TABLE usuarios ( 
    usr_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(50),
    habilitado BOOLEAN,
    tipo_usr CHAR(3),
    clien_id INTEGER
),


CREATE TABLE medios_cobro ( 
    cod_medcob SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    nro_comercio VARCHAR(20),
    habilitado BOOLEAN 
),

CREATE TABLE documentos (
    doc_docum CHAR(8) NOT NULL PRIMARY KEY,
    nombre VARCHAR(40),
    tipo_docum CHAR(4),
    pref_docum CHAR(2),
    habilitado BOOLEAN,
    ult_nro INTEGER NOT NULL,
    signo INTEGER
),

CREATE TABLE carrito_cab ( 
    cart_id SERIAL PRIMARY KEY,
    user_id INTEGER,
    cart_start DATETIME,
    cart_session VARCHAR(50),
    cart_ip VARCHAR(15)
),

CREATE TABLE carrito_det (
    art_id INTEGER NOT NULL PRIMARY KEY,
    cart_id INTEGER NOT NULL REFERENCES carrito_cab(cart_id),
    cantidad DECIMAL(8,3)
),

CREATE TABLE movstk_cab (
    movstk_id SERIAL PRIMARY KEY,
    cod_docum char(8) NOT NULL REFERENCES facturas_cab(cod_docum),
    pref_docum char(4),
    nro_docum INTEGER NOT NULL REFERENCES facturas_cab(nro_docum),
    signo INTEGER NOT NULL
),

CREATE TABLE movstk_det (
    art_id INTEGER NOT NULL PRIMARY KEY,
    movstk_id INTEGER NOT NULL REFERENCES facturas_cab(cod_docum),
    cantidad DECIMAL(8,3)
),

CREATE TABLE facturas_cab (
    fact_id SERIAL PRIMARY KEY,
    clien_id INTEGER NOT NULL,
    cart_id INTEGER,
    fecha DATE,
    cod_docum CHAR(8) NOT NULL,
    cod_docafip CHAR(2),
    pref_docum CHAR(4) NOT NULL,
    letra_docum CHAR(1) NOT NULL,
    nro_docum INTEGER NOT NULL,
    total_fact DECIMAL(14,2),
    cae VARCHAR(22)
),

CREATE TABLE facturas_det (
    fact_id INTEGER REFERENCES facturas_cab(fact_id),
    art_id INTEGER REFERENCES articulos(art_id),
    cantidad DECIMAL(8,3),
    precio DECIMAL(14,2),
    impor_bruto DECIMAL(14,2),
    neto_grav DECIMAL(14,2),
    porc_iva DECIMAL(14,2),
    impor_iva DECIMAL(14,2),
    total_item DECIMAL(14,2)
),

CREATE TABLE cobros_det (
    fact_id INTEGER NOT NULL REFERENCES facturas_cab(fact_id),
    cod_medcob INTEGER NOT NULL PRIMARY KEY,
    serie_cupon CHAR(4),
    nro_cupon VARCHAR(20),
    impor_bruto DECIMAL(14,2),
    cant_cuotas INTEGER,
    porc_recargo DECIMAL(6,3),
    impor_recargo DECIMAL(14,2),
    total_cobro DECIMAL(14,2)
)
