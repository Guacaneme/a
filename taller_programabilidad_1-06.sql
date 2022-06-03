-- SE PUEDE INICIAR A GENERAR CODIFICACION EN POSTGRES
-- UTILIZANDO LA CLAUSULA DO $$
-- ESTA CLAUSULA PERMITE CREAR PROGRAMAS SIN SER ALMACENADOS COMO UNA FUNCION
DO $$

$$;


-- Las variables existen sólo mientras se realiza la ejecución
-- IGAC para el taller xd
-------------------------------------------------------------------------
DO $$

-- CREACION DE VARIABLES
DECLARE <nombre_variable> <tipo dato>;
DECLARE <nombre_variable> <tipo dato>;

-- INICIO DEL BLOQUE DE INSTRUCCIONES
begin
 -- instrucciones sql 
END 
-- FIN DEL BLOQUE DE INSTRUCCIONES 

$$; 
---------------------------------------------------------------------------



/* **************************************************************************************** */
-- INICIO DE EJERCICIO
/* **************************************************************************************** */

CREATE table a ( COL1 VARCHAR(5), col2 timestamp,col3 integer, col4 numeric(10,3));



/* *************-- ASIGNACION DE VALORES A VARIABLES ********* */
DO $$
---------------------- FORMA 1: ASIGNACION DIRECTA
DECLARE v_valor_producto  numeric(10,3);

begin 
 v_valor_producto = 1250.35;
end

$$

----------------------- FORMA 2: INSTRUCCION SELECT CON CLAUSULA INTO  
-- ASIGNACION DE VALORES A VARIABLES 
DO $$
-- FORMA 1: ASIGNACION DIRECTA
DECLARE v_valor_producto  numeric(10,3);
declare v_fecha_insercion timestamp;

begin 
 v_valor_producto = 1250.35;
 select into v_fecha_insercion now();
 
 insert into a (col4,col2) values (v_valor_producto,v_fecha_insercion);
 
end

$$



-- desarrollar un script que inserte dos registros adicionales 
-- ***cada registro insertado debe tener en la columna col2 una diferencia de 1 segundo
    -- truco: utilice o documéntese de la cláusula "interval" para adicionar tiempo
-- ***cada registro insertado debe tener en la columna col3 un valor generado de manera aleatoria
   --- truco utilice funciones random()  y ceiling()


date '2001-09-28' + interval '1 hour' 
select  into v_random  ceiling (random()*1000000) ;

DO $$
-- FORMA 1: ASIGNACION DIRECTA
DECLARE v_valor_producto  numeric(10,3);
declare v_fecha_insercion timestamp;

begin 
 v_valor_producto = 1250.35;
 select into v_fecha_insercion now();
 
 insert into a (col4,col2,col3) values (v_valor_producto,v_fecha_insercion,  ceiling (random()*1000000));
 insert into a (col4,col2,col3) values (v_valor_producto,v_fecha_insercion + interval '1 seconds', ceiling (random()*1000000));
 
end

$$
