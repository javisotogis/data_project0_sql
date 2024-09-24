
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
SELECT "Name","Title"  FROM public."Track" a
JOIN public."Album" b
ON a."AlbumId" = b."AlbumId";
-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
SELECT a."Name", "Title" from public."Artist"  a
join public."Album" b
on a."ArtistId" = b."ArtistId"
order by a."Name";

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select "FirstName","Total" from public."Customer" a
join public."Invoice" b
on a."CustomerId" = b."CustomerId"
order by "Total" desc limit 5;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select a."FirstName", b."FirstName" from public."Employee" a
join public."Customer" b
on a."EmployeeId" = b."SupportRepId"; 

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select a."InvoiceId", b."Name"  from public."InvoiceLine" a
join public."Track" b 
on a."TrackId" = b."TrackId" 

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.

SELECT a."Name" AS "ArtistName", 
       --b."ArtistId", 
      -- b."AlbumId", 
       --c."Name" AS "TrackName", 
       --c."GenreId",
       d."Name" as genre
FROM public."Artist" a
JOIN public."Album" b
  ON a."ArtistId" = b."ArtistId"
JOIN public."Track" c
  ON b."AlbumId" = c."AlbumId"
join public."Genre" d
on c."GenreId" = d."GenreId"
group by a."Name", d."Name" ;


--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select a."Name" as pista, b."Name" as medio from public."Track" a 
join public."MediaType" b
on a."MediaTypeId" = b."MediaTypeId";

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select a.*, b.* FROM public."Track" a
LEFT JOIN public."Genre" b
on a."GenreId" = b."GenreId"

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
select a."FirstName", b.* from public."Customer" a
left join public."Invoice" b
on  a."CustomerId" = b."CustomerId";
-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. 
--Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select  a."Title", b."Name" from public."Album" a
left join public."Artist" b
on a."ArtistId" = b."ArtistId";
-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select count(a.*), b."Name" from public."Track" a
JOIN public."Genre" b
on a."GenreId" = b."GenreId" group by b."Name" order by count(a.*) desc;
--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
select a."Title", SUM(b."Milliseconds") from public."Album" a
left join public."Track" b
on a."AlbumId" = b."AlbumId" group by a."Title";

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select a."FirstName" , SUM(b."Total") from public."Customer" a
join public."Invoice" b
on a."CustomerId" =  b."CustomerId" group by a."FirstName";
-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select a.*, b."FirstName" FROM public."Employee" a
LEFT JOIN public."Customer" b
on "SupportRepId" = "EmployeeId";

