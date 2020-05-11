
alter system set archive_lag_target=0 scope=both;
ALTER SYSTEM SET FILESYSTEMIO_OPTIONS=DIRECTIO SCOPE=SPFILE;
ALTER SYSTEM SET DISK_ASYNCH_IO=FALSE SCOPE=SPFILE;

-- USER SQL
create user c##meli1 identified by meli;

-- ROLES
GRANT "DBA" TO c##meli1 WITH ADMIN OPTION;
GRANT CREATE ANY MATERIALIZED VIEW, CREATE JOB, CONNECT, RESOURCE, CREATE ANY VIEW TO c##meli1;
GRANT UNLIMITED TABLESPACE TO c##meli1;


-- Creamos las tablas

CREATE SEQUENCE c##meli1.SEQUENCE1 INCREMENT BY 1;

create table c##meli1.lote_site (
	id_lote number(10) NOT NULL,
	nombre_archivo varchar2(100),
	encode varchar2(10),
	extension varchar2(5),
	separador_columna varchar2(3),
	fecha_insercion date,
	estado varchar2(15),
	detalle varchar2(1000) 
);

ALTER TABLE c##meli1.lote_site
  ADD (CONSTRAINT lote_site_pk PRIMARY KEY (id_lote) );

create table c##meli1.detalle_lote_site (
	id_lote number(10),
 	site varchar2(20),
	id_item number,
	start_time date,
	price float,
	descripcion varchar2(1000),
	nickname varchar2(10),
	name varchar2(20),
	categoria varchar2(20),
	constraint pk_dls primary key
	(id_lote,site,id_item)
);




-- Creamos comentarios a las columnas de las tablas creadas
comment on column c##meli1.detalle_lote_site.id_lote is 'ID de lote conformado por numerico, pertenece a la PK.';
comment on column c##meli1.detalle_lote_site.site is 'Siglas de acuerdo al pais MLA (Argentina), MLB (Brasil), etc, pertenece a la PK.';
comment on column c##meli1.detalle_lote_site.id_item is 'ID del item, pertenece a la PK.';
comment on column c##meli1.detalle_lote_site.start_time is 'Fecha de inicio.';
comment on column c##meli1.detalle_lote_site.price is 'Valor del item con decimales.';
comment on column c##meli1.detalle_lote_site.descripcion is 'Descripcion del item.';
comment on column c##meli1.detalle_lote_site.nickname is 'Diminutivo para el item.';
comment on column c##meli1.detalle_lote_site.name is 'Nombre del item.';
comment on column c##meli1.detalle_lote_site.categoria is 'Categoria a la que pertenece.';
comment on column c##meli1.lote_site.id_lote is 'ID de lote conformado por numerico.';
comment on column c##meli1.lote_site.nombre_archivo is 'Nombre del archivo.';
comment on column c##meli1.lote_site.encode is 'Formato del archivo ASCII, UFT-8, etc.';
comment on column c##meli1.lote_site.extension is 'Extension que indica tipo de archivo CSV, JSON, etc.';
comment on column c##meli1.lote_site.separador_columna is 'Separador de columnas coma, punto, etc.';
comment on column c##meli1.lote_site.fecha_insercion is 'Fecha en que se inserto el registro en la base de datos.';
comment on column c##meli1.lote_site.tiempo_insercion is 'Tiempo en segundos que tardo la insercion.';
comment on column c##meli1.lote_site.estado is 'Indica el estado ACTIVE / NON ACTIVE.';
comment on column c##meli1.lote_site.detalle is 'Detalle del item.';


exit;