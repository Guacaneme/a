SELECT * from public.tmp_ejercicio

SELECT * from public.tmp_conteo_archivos


---------------------- CONSULTA TOTAL REGISTROS POR MUNICIPIO

SELECT municipio_id, municipio_nombre, count(*)
FROM tmp_ejercicio
GROUP BY municipio_id, municipio_nombre

----------------------- CREAR LA TABLA CON LA CONSULTA

SELECT municipio_id, municipio_nombre, count(*)
into tmp_conteo_en_clase
FROM tmp_ejercicio
GROUP BY municipio_id, municipio_nombre

SELECT * from tmp_conteo_en_clase

/*
CURSORES
	- Itera por las consultas
	- No es persistente, se crea en memoria
    1. Crear        2. Abrir       3. Recorrer        4. Cerrar
    - A nivel de sesión (se cierra la sesión, se cierra el cursor)
*/
