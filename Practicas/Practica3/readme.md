# **_Practica 3_**: _Archivos secuenciales - Bajas._

## **_Ejercicios de la practica_**

**1.** Se cuenta con un archivo que almacena información sobre especies de plantas originarias de
Europa, de cada especie se almacena: código especie, nombre vulgar, nombre científico, altura
promedio, descripción y zona geográfica. El archivo no está ordenado por ningún criterio.
Realice un programa que elimine especies de plantas trepadoras. Para ello se recibe por
teclado los códigos de especies a eliminar.

**a)** Implemente una alternativa para borrar especies, que inicialmente marque los
registros a borrar y posteriormente compacte el archivo, creando un nuevo archivo
sin los registros eliminados.

**b)** Implemente otra alternativa donde para quitar los registros se deberá copiar el
último registro del archivo en la posición del registro a borrar y luego eliminar del
archivo el último registro de forma tal de evitar registros duplicados.

> **Nota:** Las bajas deben finalizar al recibir el código 100000

**2.** Se dispone de un archivo que contiene información de autos en alquiler de una rentadora. Se
sabe que el archivo utiliza la técnica de lista invertida para aprovechamiento de espacio. Es
decir las bajas se realizan apilando registros borrados y las altas reutilizando registros
borrados. El registro en la posición 0 del archivo se usa como cabecera de la pila de registros
borrados.

```pascal
Type
    tVehiculo= Record
        codigoVehiculo:integer;
        patente: String;
        #motor:String;
        cantidadPuertas: integer;
        precio:real;
        descripcion:String
    end;
    tArchivo = File of tVehiculo;
```

> **Nota:** El valor ‘0’ en el campo descripción significa que no existen registros borrados, y ‘N’ indica que el próximo registro a reutilizar es el N, siendo éste un número relativo de registro válido.

Se solicita implementar los siguientes módulos:

{Abre el archivo y agrega un vehículo para alquiler, el mismo se recibe como parámetro y debe utilizar la política descripta anteriormente para recuperación de espacio}

```pascal
    Procedure agregar (var arch: tArchivo; vehiculo: tVehiculo);
    var
    Begin
    End;
```

{Abre el archivo y elimina el vehículo que posea el código recibido como parámetro manteniendo la política descripta anteriormente}

```pascal
    Procedure eliminar (var arch: tArchivo; codigoVehiculo: integer);
    var
    Begin
    End;
```

**3.** Una tienda de indumentaria desea almacenar sus productos en un archivo de datos para la
posterior actualización de stock con las compras y ventas de indumentario. Para ello cuenta
con un archivo de texto donde tiene almacenada la siguiente información: código de producto,
nombre, descripción y stock.

**a)** Deberá realizar un procedimiento que tomando como entrada el archivo de texto, genere el correspondiente archivo binario de datos.

**b)** Se reciben por pantalla códigos de indumentaria obsoletos, los cuales deben eliminarse del archivo de datos, utilizando una marca de borrado. La marca de borrado consiste en poner valor negativo al stock. Realice el procedimiento correspondiente.

**c)** A continuación, se solicita realizar un procedimiento que permita realizar el alta de
una nueva indumentaria con los valores obtenidos por teclado.

**d)** Realice un nuevo procedimiento de baja, suponiendo que la creación del archivo
supuso la utilización de la técnica de lista invertida para reutilización de espacio
(dejó un registro obsoleto al comienzo del archivo como cabecera de lista).

**e)** Re implemente c, sabiendo que se utiliza la técnica de lista en invertida.

**f)** Re implementa a, para poder utilizar la técnica de lista invertida.

**g)** Enumere ventajas que encuentra entre agregar y eliminar indumentaria con o sin utilización de la técnica de recuperación de espacio libre.

**4.** Una disquera cuenta con un archivo conteniendo la información de discos (cd) que posee a la
venta. De cada cd se conoce: un código único, nombre álbum, género, artista, una descripción
asociada, año de edición y cantidad de copias en stock. Al archivo no tiene orden.

Trimestralmente la disquera actualiza el archivo modificando los discos de los que ya no posee
stock. Implementar un procedimiento que modifique el stock a 0 de los discos obsoletos e informe
por pantalla nombre de álbumes que quedaron sin stock. Se deberá además declarar los tipos de
datos necesarios y la llamada al procedimiento de modificación. Para ello el usuario ingresará por
teclado los códigos de cd que ya no tienen stock.

Además, se deberá implementar la compactación del archivo, es decir un procedimiento que
reciba el archivo de discos y elimine físicamente los discos que no tienen stock.

**5.** Se cuenta con un archivo de artículos deportivos a la venta. De cada artículo se almacena: nro de
artículo, descripción, color, talle, stock disponible y precio del producto. Se reciben por teclado los
nros de artículos a eliminar, ya que no se fabricarán más. Se deberá realizar la baja lógica de los
artículos correspondientes. Además, se requiere listar en un archivo de texto todos los artículos eliminados, para ello debe almacenar toda la información del artículo eliminado en el archivo de
texto. (**No debe recorrer nuevamente** el archivo maestro, deberá hacerlo en simultáneo).
Escriba el programa principal con la declaración de tipos necesaria y realice un proceso que
reciba el archivo maestro y actualice el archivo maestro a partir de los códigos de artículos a
borrar. El archivo maestro se encuentra **ordenado** por el código de artículo.

**6.** Modificar el programa del ejercicio anterior (ejercicio 5) agregándole opciones para:

**a)** Efectivizar las bajas compactando el archivo. Para esto debe copiar el archivo sin
los registros borrados lógicamente, eliminar el archivo viejo y renombrar el nuevo
con el nombre original.

**7.** Se dispone de un archivo que contiene información de empleados de la facultad. Se sabe que el
archivo utiliza la técnica de lista invertida para aprovechamiento de espacio. Es decir las bajas se
realizan apilando registros borrados y las altas reutilizando registros borrados. El registro en la
posición 0 del archivo se usa como cabecera de la pila de registros borrados.

```pascal
Type
    persona= Record
        DNI:integer;
        nombre: String;
        apellido:String;
        sueldo: real;
    end;
    tArchivo = File of persona;
```

> **Nota:** El valor 0 en el campo DNI significa que no existen registros borrados, y -N indica que el próximo registro a reutilizar es el N, siendo éste un número relativo de registro válido.

Se solicita implementar los siguientes módulos:

{Crear el Archivo Maestro con un archivo de texto que se recibe como parámetro. Asumir que en el
programa principal sólo está hecho el assign de los archivos. Tenga en cuenta la restricción de
lectura de los campos en los archivos de texto}

```pascal
Procedure crear(var arch: tArchivo; var info:TEXT);
```

{Abre el archivo y agrega una persona. La persona se recibe como parámetro y debe utilizar la
política descripta anteriormente para recuperación de espacio}

```pascal
Procedure agregar (var arch: tArchivo; p: persona);
```

{Abre el archivo y elimina la persona que tiene el DNI que se recibe como parámetro manteniendo
la política descripta anteriormente. La persona puede no existir}

```pascal
Procedure eliminar (var arch: tArchivo; DNI: integer);
```

---
