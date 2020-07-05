CREATE TABLE articulos ( 
    art_id SERIAL PRIMARY KEY,
    descripcion VARCHAR(100),
	habilitado BOOLEAN,
    lleva_stk BOOLEAN,
    cod_unistk CHAR(3),
    cod_univta CHAR(3),
    cod_categ CHAR(3), 
    porc_ivavta DECIMAL(6,3)
)

CREATE TABLE clientes ( 
    clien_id SERIAL PRIMARY KEY,
    razon_social VARCHAR(100),
	tipo_doc CHAR(4),
    nro_doc CHAR(11),
    domicilio VARCHAR(50),
    cod_provin CHAR(3),
    cod_pais CHAR(2),
    email VARCHAR(100)
)

CREATE TABLE usuarios ( 
    usr_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(50),
    habilitado BOOLEAN,
    tipo_usr CHAR(3),
    clien_id INTEGER
)

CREATE TABLE carrito_cab ( 
    cart_id SERIAL PRIMARY KEY,
    user_id INTEGER,
    cart_start DATETIME,
    cart_session VARCHAR(50),
    cart_ip VARCHAR(15)
)


