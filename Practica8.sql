

create trigger tri1
on SedeFilas
for insert
as
begin
declare @cuenta_asientos int
set @cuenta_asientos = (Select sum (numeroFila) from SedeFilas)
update SedeEvento
set SedeEvento.capacidadAsientos =@cuenta_asientos
end

Select * from SedeFilas
Select * from SedeEvento
go

create trigger tri2
on Eventos
for insert
as
if (Select nombre  from inserted) <0
begin 
	print 'Machacafest'
	RollBack 
end
go

create trigger tri3
on Artistas
after insert,update,delete
as
	begin 
	select * from inserted
	select * from deleted
end
go

update Artistas
set genero ='Pop'
where artista_id = '58809512-4960-486f-a620-d6246c0fbb20'
go

SELECT*FROM Usuarios
SELECT*FROM SedeEvento
SELECT*FROM Eventos
go

create procedure p_1
as
SELECT * FROM USUARIOS
WHERE EDAD > 21

EXEC p_1
go

create procedure p_2
as
SELECT DIRECCION_ID,CIUDAD,PAIS FROM DIRECCIONUSUARIOS
WHERE CIUDAD LIKE '[A-M]%'

EXEC p_2
go

create procedure p_3
as
SELECT ARTISTAS.NOMBREARTISTA,ARTISTAS.GENERO,EVENTOS.NOMBRE,
EVENTOS.FECHAINICIO,EVENTOS.FECHAVENTA 
FROM ARTISTAS INNER JOIN EVENTOS 
ON ARTISTAS.ARTISTA_ID=EVENTOS.ARTISTA_ID 

EXEC p_3
go

create procedure p_4
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

EXEC p_4
go

create procedure p_5
as
SELECT * FROM Usuarios

EXEC p_5
go

create procedure p_6
as
SELECT * FROM Eventos 

EXEC p_6

SELECT GENERO FROM Artistas GROUP BY GENERO
go

create procedure p_7
as
Select * FROM SedeDireccion

EXEC p_7
go

create procedure p_8
as
Select * from Artistas where noticias like 'Nueva cancion%' 

EXEC p_8
go

create procedure p_9
as
Select Usuarios.primerNombre,Usuarios.apellido,DireccionUsuarios.pais,DireccionUsuarios.ciudad,SedeEvento.nombreSede
from Usuarios,DireccionUsuarios,SedeEvento
where Usuarios.primerNombre like 'Alan%' and Usuarios.apellido like 'Contreras%'

EXEC p_9
go

create procedure p_10
as
Select * from DireccionUsuarios where pais like 'Mexico%'

EXEC p_10

SELECT * INTO SEDEFILASBACKUP FROM SEDEEVENTO

DROP TABLE SEDEFILASBACKUP
go


create function fun_1 (@capacidadAsientos int) returns int 
as
begin
declare @SedeFilas int
Select @SedeFilas =(numeroFila )/1 from ReservacionAsiento 
where @capacidadAsientos =@capacidadAsientos
return @SedeFilas
end
go

Declare @Artista_id int = 1
Declare @query varchar(2000)
set @query ='Select nombreArtista,genero from dbo.Astistas where artista_id='
Declare @sql varchar (2000) = CONCAT (@query,@Artista_id)
Select @sql
Exec (@sql)

go

Select * from Artistas