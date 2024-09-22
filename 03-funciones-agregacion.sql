
/* MIN y MAX */

-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.
SELECT "Milliseconds" FROM public."Track" order by "Milliseconds" limit 1; --1071  

-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.
SELECT "Milliseconds" FROM public."Track" order by "Milliseconds" DESC limit 1; --5286953

-- Ejercicio 3: Encontrar el precio mínimo de las pistas.
SELECT "UnitPrice" FROM public."Track" order by "UnitPrice" limit 1; --0.99  

-- Ejercicio 4: Encontrar el precio máximo de las pistas.
SELECT "UnitPrice" FROM public."Track" order by "UnitPrice" DESC limit 1; --1.99 

-- Ejercicio 5: Encontrar la fecha mínima de la factura.
SELECT "InvoiceDate" FROM public."Invoice" order by "InvoiceDate"  limit 1; --2009-01-01 00:00:00.000

-- Ejercicio 6: Encontrar la fecha máxima de la factura.
SELECT "InvoiceDate" FROM public."Invoice" order by "InvoiceDate" DESC  limit 1; --2013-12-22 00:00:00.000

/* COUNT y SUM */

-- Ejercicio 7: Contar el número total de pistas.
select SUM(*) FROM public."Track"; --6137256 

-- Ejercicio 8: Contar el número de clientes en Brasil.
select count(*) FROM public."Customer" where "Country" = 'Brazil';  

-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.
select SUM("Milliseconds") from public."Track" --1378778040

-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.
select count(*) from public."Employee" where "Title" = 'Sales Support Agent'; --3

-- Ejercicio 11: Sumar el total de las cantidades en las facturas.
select SUM("Total") from public."Invoice"; --2328.60 

/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.
select avg("Milliseconds") from public."Track"; --393599.212103910933

-- Ejercicio 13: Calcular el precio medio de las pistas.
select avg("UnitPrice") from public."Track"; --1.0508050242649158  

-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.
select stddev("Milliseconds") from public."Track"; --535005.43520662    

-- Ejercicio 15: Calcular la varianza de la duración de las pistas.
select variance("Milliseconds") from public."Track"; --286230815700.62861416

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.
select stddev("UnitPrice") from public."Track"; --0.23900644442633657538 

/* CONCAT */

-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.
select concat("FirstName", ' ' , "LastName") as "Name" from public."Customer";