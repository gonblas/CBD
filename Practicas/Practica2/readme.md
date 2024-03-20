# **_Practica 2_**: _Algorítmica Clásica - Archivos secuenciales._

## **Introducción**

Esta práctica permite ejercitar los tres tipos de algorítmica clásica de archivos: maestro
detalle, merge y corte de control. Brinda herramientas que permiten discernir cuándo
utilizar cada uno de los algoritmos de acuerdo al problema planteado.

## **_Ejercicios de la practica_**

**1.** El área de recursos humanos de un ministerio administra el personal del mismo
distribuido en 10 direcciones generales.

Entre otras funciones, recibe periódicamente un archivo detalle de cada una de las
direcciones conteniendo información de las licencias solicitadas por el personal.
Cada archivo detalle contiene información que indica: código de empleado, la fecha y
la cantidad de días de licencia solicitadas. El archivo maestro tiene información de
cada empleado: código de empleado, nombre y apellido, fecha de nacimiento,
dirección, cantidad de hijos, teléfono, cantidad de días que le corresponden de
vacaciones en ese periodo. Tanto el maestro como los detalles están ordenados por
código de empleado. Escriba el programa principal con la declaración de tipos
necesaria y realice un proceso que reciba los detalles y actualice el archivo maestro
con la información proveniente de los archivos detalles. Se debe actualizar la cantidad
de días que le restan de vacaciones. Si el empleado tiene menos días de los que
solicita deberá informarse en un archivo de texto indicando: código de empleado,
nombre y apellido, cantidad de días que tiene y cantidad de días que solicita.

**2.** Se necesita contabilizar los CD vendidos por una discográfica. Para ello se dispone de
un archivo con la siguiente información: código de autor, nombre del autor, nombre
disco, género y la cantidad vendida de ese CD. Realizar un programa que muestre un
listado como el que se detalla a continuación. Dicho listado debe ser mostrado en
pantalla y además listado en un archivo de texto. En el archivo de texto se debe listar
nombre del disco, nombre del autor y cantidad vendida. **El archivo origen está
ordenado por código de autor, género y nombre disco.**

```C
Autor: _____
Género: ----------
Nombre Disco: ---------- cantidad vendida: ------------
Nombre Disco: ---------- cantidad vendida: ------------
Total Género:
Género:----------
Nombre Disco: ---------- cantidad vendida: ------------
.......
Total Autor:
Total Discográfica:
```

**3.** Una zapatería cuenta con 20 locales de ventas. Cada local de ventas envía un listado
con los calzados vendidos indicando: código de calzado, número y cantidad vendida
del mismo.
El archivo maestro almacena la información de cada uno de los calzados que se
venden, para ello se registra el código de calzado, número, descripción, precio unitario,
color, el stock de cada producto y el stock mínimo.
Escriba el programa principal con la declaración de tipos necesaria y realice un
proceso que reciba los 20 detalles y actualice el archivo maestro con la información
proveniente de los archivos detalle. Tanto el maestro como los detalles se encuentran
ordenados por el código de calzado y el número.
Además, se deberá informar qué calzados no tuvieron ventas y cuáles quedaron por
debajo del stock mínimo. Los calzados sin ventas se informan por pantalla, mientras
que los calzados que quedaron por debajo del stock mínimo se deben informar en un
archivo de texto llamado calzadosinstock.txt.

> **Nota:** tenga en cuenta que no se realizan ventas si no se posee stock.

**4.** Una cadena de cines de renombre desea administrar la asistencia del público a las
diferentes películas que se exhiben actualmente. Para ello cada cine genera
semanalmente un archivo indicando: código de película, nombre de la película, género,
director, duración, fecha y cantidad de asistentes a la función. Se sabe que la cadena
tiene 20 cines. Escriba las declaraciones necesarias y un procedimiento que reciba los
20 archivos y un String indicando la ruta del archivo maestro y genere el archivo
maestro de la semana a partir de los 20 detalles (cada película deberá aparecer una
vez en el maestro con los datos propios de la película y el total de asistentes que tuvo
durante la semana). Todos los archivos detalles vienen ordenados por código de
película. Tenga en cuenta que en cada detalle la misma película aparecerá tantas
veces como funciones haya dentro de esa semana.

**5.** La Dirección de Población Vulnerable del Ministerio de Salud y Desarrollo Social
solicita información a cada municipio indicando cantidad de niños y de adultos mayores
que están en situación de riesgo debido a la situación socioeconómica del país. Para
ello se recibe un archivo indicando: partido, localidad, barrio, cantidad de niños y
cantidad de adultos mayores.

Se sabe que el archivo se encuentra ordenado por partido y localidad. Se pide imprimir
por pantalla con el siguiente formato:

```C
Partido:
Localidad 1:
Cantidad niños: ____ Cantidad adultos: ____
Total niños localidad 1:----------- Total adultos localidad 1:----------
Localidad 2:
Cantidad niños: ____ Cantidad adultos: ____
Total niños localidad 2:----------- Total adultos localidad 2:----------
TOTAL NIÑOS PARTIDO:----------- TOTAL ADULTOS PARTIDO:------------
```

**6.** Un restaurante posee un archivo con información de los montos por servicios cobrados
por cada mozo durante la semana. De cada servicio se conoce: código de mozo, fecha
y monto del servicio. La información del archivo se encuentra ordenada por código de
mozo y cada mozo puede tener n servicios cobrados en diferentes fechas. No se
conoce la cantidad de mozos del restaurante.

Realice un procedimiento que reciba el archivo anterior y lo compacte. En
consecuencia, deberá generar un nuevo archivo en el cual, cada mozo aparezca una
única vez con el valor total cobrado por los servicios. El archivo debe recorrerse una
única vez.

**7.** Se desea administrar el stock de los productos de un supermercado. Para ello se
cuenta con un archivo maestro donde figuran todos los productos que comercializa. De
cada producto se almacena la siguiente información: código de producto, nombre
comercial, descripción, precio de venta, stock actual y stock mínimo. Diariamente se
generan 10 archivos detalle que registran todas las ventas de productos registradas
por las cajas del supermercado. De cada venta se almacena: código de producto y
cantidad de unidades vendidas. Se pide realizar un programa con opciones para:

**a)** Crear el archivo maestro a partir de un archivo de texto llamado “productos.txt”.

**b)** Actualizar el archivo maestro con los archivos detalle, sabiendo que:

- Todos los archivos están ordenados por código de producto.
- Cada registro del maestro puede ser actualizado por 0, 1 ó más registros
  de los archivos detalle.
- Los archivos detalle sólo contienen ventas de productos que están en el
  archivo maestro. Además, siempre hay stock suficiente para realizar las ventas
  de productos que aparecen en los archivos de detalle.

> **Nota:** deberá implementar programa principal, todos los procedimientos y los tipos de datos necesarios.

**8.** La municipalidad de la Plata, en pos de minimizar los efectos de posibles inundaciones,
construye acueductos que permitan canalizar rápidamente el agua de la ciudad hacia
diferentes arroyos que circundan la misma. La construcción está dividida por zonas.
Los arquitectos encargados de las obras realizan recorridos diariamente y guardan
información de la zona, fecha y cantidad de metros construidos. Cada arquitecto envía
mensualmente un archivo que contiene la siguiente información: cod_zona, nombre de
la zona, descripción de ubicación geográfica, fecha, cantidad de metros construidos
ese día. Se sabe que en la obra trabajan 15 arquitectos y que durante el mes van
rotando de zona.

Escriba un procedimiento que reciba los 15 archivos correspondiente y genere un
archivo maestro indicando para cada zona: cod_zona, nombre de zona y cantidad de
metros construidos. Además se deberá informar en un archivo de texto, para cada
zona, la cantidad de metros construidos indicando: cod_zona, nombre, ubicación y
metros construidos.

> **Nota:** todos los archivos están ordenados por cod_zona.

**9.** Una federación de competidores de running organiza distintas carreras cada mes.
Cada carrera cuenta con DNI de corredor, apellido, nombre, kilómetros que corrió, y si
ganó o no la carrera (valor 1 indica que ganó, y valor 0 indica que no ganó la carrera). Puede haber distintas cantidades de carreras en el mes. Para el mes de abril se
organizaron 5 carreras.

Escriba el programa principal con la declaración de tipos necesaria y realice un
proceso que reciba los 5 archivos y genere el archivo maestro con la siguiente
información: DNI, apellido, nombre, kilómetros totales y cantidad de carreras ganadas.
Todos los archivos se encuentran ordenados por DNI del corredor. Cada persona
puede haber corrido una o más carreras.


**10.** Se desea administrar el stock de los productos de una tienda de electrodomésticos con
varias sucursales en el país. Para ello se cuenta con un archivo maestro donde figuran
todos los productos que comercializa. De cada producto se almacena la siguiente
información: código de producto, nombre comercial, descripción, precio de venta,
cantidad vendida, y mayor cantidad vendida en un mes. Mensualmente se genera un
archivo detalle en cada sucursal en el que registran todas las ventas de productos. De
cada venta se registra el código de producto y la cantidad de unidades vendidas.
Mensualmente la empresa recibe un archivo detalle de cada sucursal (son 8
sucursales) y debe actualizar el archivo maestro. Se pide realizar un programa que
realice la declaración de tipos e invoque un proceso que actualice el archivo maestro
con los archivos detalle sabiendo que:

**a.** Todos los archivos están ordenados por código de producto.

**b.** Cada registro del archivo maestro puede ser actualizado por 0, 1 ó más registros de
los archivos detalle.

**c.** Los archivos detalle sólo contienen ventas de productos que están en el archivo
maestro.

Además si la cantidad vendida en el mes actual supera a la mayor cantidad vendida en un mes
previo, se debe actualizar este dato y también se debe informar en pantalla el código del producto, nombre, mayor cantidad vendida hasta el mes anterior (la del archivo maestro) y cantidad vendida en el mes actual.

> **Nota:** deberá implementar el programa principal, todos los procedimientos y los tipos de datos necesarios.

---
