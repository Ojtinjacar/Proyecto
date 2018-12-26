/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     23/12/2018 9:27:29 p. m.                     */
/*==============================================================*/


drop index EMPLEADO_PK;

drop table EMPLEADO;

drop index FACTURAR_FK;

drop index FACTURA_PK;

drop table FACTURA;

drop index REALIZAR_FK;

drop index GASTOS_PK;

drop table GASTOS;

drop index TIENE_FK;

drop index NOMINA_PK;

drop table NOMINA;

drop index POSEENOVEDAD_FK;

drop index POSEE_FK;

drop index NOVEDADES_PK;

drop table NOVEDADES;

drop index PIDE_FK;

drop index PERMISOS_PK;

drop table PERMISOS;

drop index PLATO_PK;

drop table PLATO;

drop index PLATOPRODUCTO_FK;

drop index PLATOPRODUCTO2_FK;

drop index PLATOPRODUCTO_PK;

drop table PLATOPRODUCTO;

drop index POSEER2_FK;

drop index POSEER_FK;

drop index POSEER_PK;

drop table POSEER;

drop index PRODUCTO_PK;

drop table PRODUCTO;

drop index CREA_FK;

drop index TURNO_PK;

drop table TURNO;

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   IDENTIFICACION       INT4                 not null,
   NOMBRE               VARCHAR(100)         not null,
   APELLIDO             VARCHAR(100)         not null,
   EDAD                 INT4                 not null,
   FECHADENACIMIENTO    DATE                 not null,
   CORREO               VARCHAR(100)         not null,
   SUELDOBASICO         DECIMAL              not null,
   CONTRASENA           VARCHAR(100)         not null,
   PENSIONES            VARCHAR(100)         not null,
   EPS                  VARCHAR(100)         not null,
   CARGO                VARCHAR(100)         not null,
   FECHAINGRESO         DATE                 not null,
   FOTO                 VARCHAR(1024)        null,
   constraint PK_EMPLEADO primary key (IDENTIFICACION, CARGO)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
IDENTIFICACION,
CARGO
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   IDFACTURA            INT4                 not null,
   IDENTIFICACION       INT4                 not null,
   CARGO                VARCHAR(100)         not null
      constraint CKC_CARGO_FACTURA check (CARGO in ('Cajero','cajero')),
   NITRESTAURANTE       INT4                 not null,
   TOTAL                DECIMAL              null,
   constraint PK_FACTURA primary key (IDFACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
IDFACTURA
);

/*==============================================================*/
/* Index: FACTURAR_FK                                           */
/*==============================================================*/
create  index FACTURAR_FK on FACTURA (
IDENTIFICACION,
CARGO
);

/*==============================================================*/
/* Table: GASTOS                                                */
/*==============================================================*/
create table GASTOS (
   IDGASTO              INT4                 not null,
   IDENTIFICACION       INT4                 not null,
   CARGO                VARCHAR(100)         not null
      constraint CKC_CARGO_GASTOS check (CARGO in ('Administrador','administrador')),
   MOTIVOGASTO          VARCHAR(1024)        not null,
   FECHAGASTO           DATE                 not null,
   VALORGASTO           DECIMAL              not null,
   constraint PK_GASTOS primary key (IDGASTO)
);

/*==============================================================*/
/* Index: GASTOS_PK                                             */
/*==============================================================*/
create unique index GASTOS_PK on GASTOS (
IDGASTO
);

/*==============================================================*/
/* Index: REALIZAR_FK                                           */
/*==============================================================*/
create  index REALIZAR_FK on GASTOS (
IDENTIFICACION,
CARGO
);

/*==============================================================*/
/* Table: NOMINA                                                */
/*==============================================================*/
create table NOMINA (
   IDNOMINA             INT4                 not null,
   IDENTIFICACION       INT4                 not null,
   CARGO                VARCHAR(100)         not null,
   FECHAINICIO          DATE                 not null,
   FECHAFIN             DATE                 not null,
   SUELDOQUINCENAL      DECIMAL              not null,
   constraint PK_NOMINA primary key (IDNOMINA)
);

/*==============================================================*/
/* Index: NOMINA_PK                                             */
/*==============================================================*/
create unique index NOMINA_PK on NOMINA (
IDNOMINA
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on NOMINA (
IDENTIFICACION,
CARGO
);

/*==============================================================*/
/* Table: NOVEDADES                                             */
/*==============================================================*/
create table NOVEDADES (
   IDNOVEDAD            INT4                 not null,
   IDENTIFICACION       INT4                 not null,
   CARGO                VARCHAR(100)         not null,
   IDNOMINA             INT4                 not null,
   HORASADICIONALES     INT4                 not null,
   CODIGOHORA           INT4                 not null,
   DINEROADICIONAL      DECIMAL              not null,
   MOTIVONOVEDAD        VARCHAR(1024)        not null,
   constraint PK_NOVEDADES primary key (IDNOVEDAD)
);

/*==============================================================*/
/* Index: NOVEDADES_PK                                          */
/*==============================================================*/
create unique index NOVEDADES_PK on NOVEDADES (
IDNOVEDAD
);

/*==============================================================*/
/* Index: POSEE_FK                                              */
/*==============================================================*/
create  index POSEE_FK on NOVEDADES (
IDENTIFICACION,
CARGO
);

/*==============================================================*/
/* Index: POSEENOVEDAD_FK                                       */
/*==============================================================*/
create  index POSEENOVEDAD_FK on NOVEDADES (
IDNOMINA
);

/*==============================================================*/
/* Table: PERMISOS                                              */
/*==============================================================*/
create table PERMISOS (
   IDPERMISO            INT4                 not null,
   IDENTIFICACION       INT4                 not null,
   CARGO                VARCHAR(100)         not null,
   FECHAPERMISO         DATE                 not null,
   MOTIVOPERMISO        VARCHAR(1024)        not null,
   TIPOPERMISO          VARCHAR(30)          not null,
   HORAPERMISO          TIME                 null,
   constraint PK_PERMISOS primary key (IDPERMISO)
);

/*==============================================================*/
/* Index: PERMISOS_PK                                           */
/*==============================================================*/
create unique index PERMISOS_PK on PERMISOS (
IDPERMISO
);

/*==============================================================*/
/* Index: PIDE_FK                                               */
/*==============================================================*/
create  index PIDE_FK on PERMISOS (
IDENTIFICACION,
CARGO
);

/*==============================================================*/
/* Table: PLATO                                                 */
/*==============================================================*/
create table PLATO (
   IDPLATO              INT4                 not null,
   NOMBREPLATO          VARCHAR(1024)        not null,
   PRECIOCLIENTE        DECIMAL              not null,
   TIPOPLATO            VARCHAR(1024)        not null,
   constraint PK_PLATO primary key (IDPLATO)
);

/*==============================================================*/
/* Index: PLATO_PK                                              */
/*==============================================================*/
create unique index PLATO_PK on PLATO (
IDPLATO
);

/*==============================================================*/
/* Table: PLATOPRODUCTO                                         */
/*==============================================================*/
create table PLATOPRODUCTO (
   IDPRODUCTO           VARCHAR(1024)        not null,
   IDPLATO              INT4                 not null,
   CANTIDADPORCION      DECIMAL              not null,
   constraint PK_PLATOPRODUCTO primary key (IDPRODUCTO, IDPLATO)
);

/*==============================================================*/
/* Index: PLATOPRODUCTO_PK                                      */
/*==============================================================*/
create unique index PLATOPRODUCTO_PK on PLATOPRODUCTO (
IDPRODUCTO,
IDPLATO
);

/*==============================================================*/
/* Index: PLATOPRODUCTO2_FK                                     */
/*==============================================================*/
create  index PLATOPRODUCTO2_FK on PLATOPRODUCTO (
IDPLATO
);

/*==============================================================*/
/* Index: PLATOPRODUCTO_FK                                      */
/*==============================================================*/
create  index PLATOPRODUCTO_FK on PLATOPRODUCTO (
IDPRODUCTO
);

/*==============================================================*/
/* Table: POSEER                                                */
/*==============================================================*/
create table POSEER (
   IDFACTURA            INT4                 not null,
   IDPLATO              INT4                 not null,
   HORA                 TIME                 not null,
   FECHA                DATE                 not null,
   constraint PK_POSEER primary key (IDFACTURA, IDPLATO)
);

/*==============================================================*/
/* Index: POSEER_PK                                             */
/*==============================================================*/
create unique index POSEER_PK on POSEER (
IDFACTURA,
IDPLATO
);

/*==============================================================*/
/* Index: POSEER_FK                                             */
/*==============================================================*/
create  index POSEER_FK on POSEER (
IDFACTURA
);

/*==============================================================*/
/* Index: POSEER2_FK                                            */
/*==============================================================*/
create  index POSEER2_FK on POSEER (
IDPLATO
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   IDPRODUCTO           VARCHAR(1024)        not null,
   NOMBREPRODUCTO       VARCHAR(1024)        not null,
   TIPOPRODUCTO         VARCHAR(100)         not null,
   DESCRIPCIONPRODUCTO  VARCHAR(100)         not null,
   CANTIDADINVENTARIO   INT4                 not null,
   COSTO                DECIMAL              not null,
   CANTIDADPORCION      DECIMAL              not null,
   constraint PK_PRODUCTO primary key (IDPRODUCTO)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
IDPRODUCTO
);

/*==============================================================*/
/* Table: TURNO                                                 */
/*==============================================================*/
create table TURNO (
   IDTURNO              INT4                 not null,
   IDENTIFICACION       INT4                 not null,
   CARGO                VARCHAR(100)         not null,
   DIA                  VARCHAR(1024)        not null,
   FECHATURNO           DATE                 not null,
   TURNOINICIAL         TIME                 not null,
   TURNOFINAL           TIME                 not null,
   ADMINTURNO           VARCHAR(1024)        not null,
   HORAENTRADA          TIME                 null,
   HORASALIDA           TIME                 null,
   HORASTRABAJADAS      INT4                 null,
   constraint PK_TURNO primary key (IDTURNO)
);

/*==============================================================*/
/* Index: TURNO_PK                                              */
/*==============================================================*/
create unique index TURNO_PK on TURNO (
IDTURNO
);

/*==============================================================*/
/* Index: CREA_FK                                               */
/*==============================================================*/
create  index CREA_FK on TURNO (
IDENTIFICACION,
CARGO
);

alter table FACTURA
   add constraint FK_FACTURA_FACTURAR_EMPLEADO foreign key (IDENTIFICACION, CARGO)
      references EMPLEADO (IDENTIFICACION, CARGO)
      on delete restrict on update restrict;

alter table GASTOS
   add constraint FK_GASTOS_REALIZAR_EMPLEADO foreign key (IDENTIFICACION, CARGO)
      references EMPLEADO (IDENTIFICACION, CARGO)
      on delete restrict on update restrict;

alter table NOMINA
   add constraint FK_NOMINA_TIENE_EMPLEADO foreign key (IDENTIFICACION, CARGO)
      references EMPLEADO (IDENTIFICACION, CARGO)
      on delete restrict on update restrict;

alter table NOVEDADES
   add constraint FK_NOVEDADE_POSEE_EMPLEADO foreign key (IDENTIFICACION, CARGO)
      references EMPLEADO (IDENTIFICACION, CARGO)
      on delete restrict on update restrict;

alter table NOVEDADES
   add constraint FK_NOVEDADE_POSEENOVE_NOMINA foreign key (IDNOMINA)
      references NOMINA (IDNOMINA)
      on delete restrict on update restrict;

alter table PERMISOS
   add constraint FK_PERMISOS_PIDE_EMPLEADO foreign key (IDENTIFICACION, CARGO)
      references EMPLEADO (IDENTIFICACION, CARGO)
      on delete restrict on update restrict;

alter table PLATOPRODUCTO
   add constraint FK_PLATOPRO_PLATOPROD_PRODUCTO foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO)
      on delete restrict on update restrict;

alter table PLATOPRODUCTO
   add constraint FK_PLATOPRO_PLATOPROD_PLATO foreign key (IDPLATO)
      references PLATO (IDPLATO)
      on delete restrict on update restrict;

alter table POSEER
   add constraint FK_POSEER_POSEER_FACTURA foreign key (IDFACTURA)
      references FACTURA (IDFACTURA)
      on delete restrict on update restrict;

alter table POSEER
   add constraint FK_POSEER_POSEER2_PLATO foreign key (IDPLATO)
      references PLATO (IDPLATO)
      on delete restrict on update restrict;

alter table TURNO
   add constraint FK_TURNO_CREA_EMPLEADO foreign key (IDENTIFICACION, CARGO)
      references EMPLEADO (IDENTIFICACION, CARGO)
      on delete restrict on update restrict;

