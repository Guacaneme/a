/* ********************************************************************** */
-- TABLA DIM_ESTUDIANTE
create table dim_estudiante (
sk_estudiante	integer primary key,
estudiante_id	integer,
nombres	 varchar(256),
apellidos varchar(256),	
estado_civil	varchar(20),
telefono_contacto	varchar(10),
direccion_residencia varchar(256)
);

insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1001,	1	,'FULANITO','REYES','SOLTERO','3102547896','CALLE DE LAS PALMAS');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1002,	2	,'SUTANITO','SANCHEZ','SOLTERO','3204567892','CALLE DE LAS SIRENAS');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1003,	3	,'MENGANITO','ROJAS','SOLTERO','3132114578','CALLE DE LAS MOJARRAS');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1004,	4	,'ANA','CASTRO','SOLTERO','3142563587','CALLE DE LA LOCURA');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1005,	5	,'JUAN','ALVAREZ','SOLTERO','3003236578','CALLE  DEL ANONIMATO');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1006,	6	,'PERENCEJA','FERNANDEZ','SOLTERO','3012582145','CALLE DE LA BUENA VIDA');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1007,	7	,'JOAQUIN','SEVILLA','SOLTERO','3206257896','CALLE  DE LAS PALMAS');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1008,	8	,'BERTA','MENDOZA','SOLTERO','3214589652','CALLE DE LA LOCURA');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1009,	9	,'MARUJA','DIAZ','SOLTERO','3212684785','CALLE DEL BUEN VIVIR');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1010,	10	,'MIGUEL','GOMEZ','SOLTERO','3002805637','CALLE Y NO HABLE');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1011,	1	,'FULANITO','REYES','SOLTERO','3102547896','CALLE DE LOS OCARROS');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1012,	10	,'MIGUEL','GOMEZ','SOLTERO','3002805637','CALLE DE LOS OCARROS');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1013,	3	,'MENGANITO','ROJAS','UNION LIBRE','3132114578','CALLE DE LAS MOJARRAS');
insert into dim_estudiante (sk_estudiante,estudiante_id,nombres,apellidos,estado_civil,telefono_contacto,direccion_residencia) values (1014,	8	,'BERTA','MENDOZA','SOLTERO','3002523225','CALLE DE LA LOCURA');

select * from dim_estudiante


/* *********************************************************************** */
-- TABLA DIM_PERIODO_ACADEMICO
create table dim_periodo_academico( 			
sk_periodo_acad_id integer primary key,
periodo_academico_id varchar(7),
anio_academico	integer,
rector varchar(256)
);


insert into dim_periodo_academico (sk_periodo_acad_id,periodo_academico_id,anio_academico,rector) values (1,'2020-01',2020,'Dr. Tazo');
insert into dim_periodo_academico (sk_periodo_acad_id,periodo_academico_id,anio_academico,rector) values (2,'2020-02',2020,'Dr. Tazo');
insert into dim_periodo_academico (sk_periodo_acad_id,periodo_academico_id,anio_academico,rector) values (3,'2021-01',2021,'Dr. Tazo');
insert into dim_periodo_academico (sk_periodo_acad_id,periodo_academico_id,anio_academico,rector) values (4,'2021-02',2021,'Pr. Alegria');
insert into dim_periodo_academico (sk_periodo_acad_id,periodo_academico_id,anio_academico,rector) values (5,'2022-01',2022,'Pr. Alegria');
insert into dim_periodo_academico (sk_periodo_acad_id,periodo_academico_id,anio_academico,rector) values (6,'2022-02',2022,NULL);

/* *********************************************************************** */
-- TABLA FCT_NOTAS_POR_PERIODO
create table fct_notas_por_periodo (
sk_estudiante	integer,
sk_periodo_acad_id	integer,
periodos_cursados	integer,
numero_materias		integer,
numero_creditos		integer,
promedio_ponderado_periodo numeric(3,2)
);

insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1001,	1,	1,	5,	16,	4.25);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1002,	1,	1,	4,	12,	3.75);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1003,	1,	1,	5,	16,	3.26);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1004,	1,	1,	4,	12,	4.01);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1005,	1,	1,	3,	9,	3.89);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1006,	1,	2,	4,	14,	3.79);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1007,	1,	1,	5,	15,	4.53);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1008,	1,	2,	3,	12,	4.37);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1009,	1,	3,	4,	12,	3.28);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1010,	1,	3,	3,	10,	3.86);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1011,	2,	2,	4,	15,	4.06);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1002,	2,	2,	3,	12,	4.12);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1013,	2,	2,	5,	15,	3.75);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1004,	2,	2,	4,	12,	3.95);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1005,	2,	2,	4,	14,	4.23);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1006,	2,	3,	5,	15,	3.57);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1007,	2,	2,	3,	12,	4.42);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1008,	2,	3,	4,	12,	4.07);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1009,	2,	4,	4,	13,	3.69);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1012,	2,	4,	4,	13,	3.72);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1011,	3,	3,	3,	9,	4.36);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1002,	3,	3,	4,	12,	3.85);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1013,	3,	3,	5,	15,	4.21);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1004,	3,	3,	5,	17,	3.56);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1005,	3,	3,	4,	12,	3.85);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1006,	3,	4,	3,	10,	3.92);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1007,	3,	3,	3,	10,	4.28);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1014,	3,	4,	2,	8,	4.15);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1009,	3,	5,	3,	10,	3.96);
insert into fct_notas_por_periodo (sk_estudiante,sk_periodo_acad_id,periodos_cursados,numero_materias,numero_creditos,promedio_ponderado_periodo) values(1012,	3,	5,	4,	13,	4.16);

-- Seleccionar todas las columnas de una unión de tablas
SELECT fct.*, de.*, dpa.*
FROM fct_notas_por_periodo fct
inner JOIN dim_estudiante de
on fct.sk_estudiante = de.sk_estudiante
INNER JOIN dim_periodo_academico dpa
on  fct.sk_estudiante = dpa.sk_periodo_acad_id


-- Cardinalidad del estado civil (cantidad de datos que puede tener)
SELECT DISTINCT estado_civil
from dim_estudiante de