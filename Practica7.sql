

SELECT*FROM Usuarios
SELECT*FROM Artistas
SELECT*FROM Eventos

create view v_1
as
SELECT * FROM USUARIOS
WHERE EDAD > 21

SELECT * FROM V_1

create view v_2
as
SELECT DIRECCION_ID,CIUDAD,PAIS FROM DIRECCIONUSUARIOS
WHERE CIUDAD LIKE '[A-M]%'

SELECT * FROM V_2

create view v_3
as
SELECT ARTISTAS.NOMBREARTISTA,ARTISTAS.GENERO,EVENTOS.NOMBRE,
EVENTOS.FECHAINICIO,EVENTOS.FECHAVENTA 
FROM ARTISTAS INNER JOIN EVENTOS 
ON ARTISTAS.ARTISTA_ID=EVENTOS.ARTISTA_ID 

SELECT * FROM V_3

create view v_4
as
SELECT USUARIOS.PRIMERNOMBRE,USUARIOS.APELLIDO,
USUARIOS.GENERO,DIRECCIONUSUARIOS.PAIS,DIRECCIONUSUARIOS.CIUDAD,DIRECCIONUSUARIOS.TELEFONO
FROM USUARIOS INNER JOIN DIRECCIONUSUARIOS 
ON USUARIOS.DIRECCION_ID=DIRECCIONUSUARIOS.DIRECCION_ID

SELECT PRIMERNOMBRE + ',' + APELLIDO AS 'NOMBRECOMPLETO'
	   ,GENERO,PAIS,CIUDAD,TELEFONO
	   FROM V_4
	   WHERE PRIMERNOMBRE LIKE 'J%'
	   ORDER BY PRIMERNOMBRE

SELECT * FROM V_4

create view v_5
as
SELECT * FROM Usuarios

SELECT * FROM v_5

create view v_6
as
SELECT * FROM Eventos 

SELECT * FROM V_6

SELECT GENERO FROM Artistas GROUP BY GENERO

create view v_7
as
Select * FROM SedeDireccion

SELECT * FROM V_7

create view v_8
as
Select * from Artistas where noticias like 'Nueva cancion%' 

SELECT * FROM v_8

create view v_9
as
Select Usuarios.primerNombre,Usuarios.apellido,DireccionUsuarios.pais,DireccionUsuarios.ciudad,SedeEvento.nombreSede
from Usuarios,DireccionUsuarios,SedeEvento
where Usuarios.primerNombre like 'Alan%' and Usuarios.apellido like 'Contreras%'

SELECT * FROM v_9

create view v_10
as
Select * from DireccionUsuarios where pais like 'Mexico%'

SELECT * FROM v_10

SELECT * INTO SEDEFILASBACKUP FROM SEDEEVENTO

DROP TABLE SEDEFILASBACKUP
