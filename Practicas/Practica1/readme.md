# **_Practica 1_**: _Variables compartidas._

## **Introducción**

Esta práctica permite ejercitar los diferentes modos de creación y apertura de archivos.
Definir tipos de datos para un archivo binario y un archivo de texto como así también,
utilizar como parámetros los archivos. Agregar o modificar información de un archivo
binario. Leer y escribir tanto en archivo binario como archivo de texto.

**Siempre que se crea un archivo de texto, tenga en cuenta las limitaciones para
poder leerlo desde el programa a futuro, siempre se tiene que crear un archivo
válido.**

## **_Ejercicios de la practica_**

**1.** Realizar un programa que permita crear un archivo conteniendo información de nombres de materiales de construcción, el archivo no es ordenado. Efectúe la
declaración de tipos correspondiente y luego realice un programa que permita la carga del archivo con datos ingresados por el usuario. El nombre del archivo debe
ser proporcionado por el usuario. La carga finaliza al procesar el nombre ‘cemento’ que debe incorporarse al archivo.

**2.** Desarrollar un programa que permita la apertura de un archivo de números enteros no ordenados. La información del archivo corresponde a la cantidad de votantes
de cada ciudad de la provincia de buenos aires en una elección presidencial. Recorriendo el archivo una única vez, informe por pantalla la cantidad mínima y
máxima de votantes. Además durante el recorrido, el programa, deberá listar el contenido del archivo en pantalla. El nombre del archivo a procesar debe ser
proporcionado por el usuario.

**3.** Realizar un programa que permita crear un archivo de texto. El archivo se debe cargar con la información ingresada mediante teclado. La información a cargar
representa los tipos de dinosaurios que habitaron en Sudamérica. La carga finaliza al procesar el nombre ‘zzz’ que no debe incorporarse al archivo.

**4.** Crear un procedimiento que reciba como parámetro el archivo del punto 2, y genere un archivo de texto con el contenido del mismo.

**5.** Realizar un programa, con la declaración de tipos correspondientes que permita crear un archivo de registros no ordenados con información de especies de flores
originarias de América. La información será suministrada mediante teclado. De cada especie se registra: número de especie, altura máxima, nombre científico,
nombre vulgar, color y altura máxima que alcanza. La carga del archivo debe finalizar cuando se reciba como nombre científico: ’zzz’.

Además se deberá contar con opciones del programa que posibiliten:

**a)** Reportar en pantalla la cantidad total de especies y la especie de menor y de mayor altura a alcanzar.

**b)** Listar todo el contenido del archivo de a una especie por línea.

**c)** Modificar el nombre científico de la especie flores cargada como: Victoria amazonia a: Victoria amazónica.

**d)** Añadir una o más especies al final del archivo con sus datos obtenidos por teclado. La carga finaliza al recibir especie “zzz”.

**e)** Listar todo el contenido del archivo, en un archivo de texto llamado “flores.txt”.

**6.** Realizar un programa que permita:

**a)** Crear un archivo binario a partir de la información almacenada en un archivo de texto. El nombre del archivo de texto es: “libros.txt”

**b)** Abrir el archivo binario y permitir la actualización del mismo. Se debe poder agregar un libro y modificar uno existente. Las búsquedas se realizan por
ISBN.

> **Nota:** La información en el archivo de texto consiste en: ISBN (nro de 13 dígitos), título del libro, género, editorial y año de edición. Cada libro se almacena en tres líneas en el archivo de texto. La primera línea contendrá la información de ISBN y título del libro, la segunda línea almacenará el año de edición y la editorial y en la tercera línea el género del libro. (Analice otras posibles formas de representar la información en el txt).

**7.** Realizar un programa con opciones para:

**a)** Crear un archivo de registros no ordenados con la información correspondiente a los alumnos de la facultad de ingeniería y cargarlo con datos obtenidos a partir de un archivo de texto denominado “alumnos.txt”.
Los registros deben contener DNI, legajo, nombre y apellido, dirección, año que cursa y fecha de nacimiento (longInt).

**b)** Listar en pantalla toda la información de los alumnos cuyos nombres comiencen con un carácter proporcionado por el usuario.

**c)** Listar en un archivo de texto denominado “alumnosAEgresar.txt” todos los registros del archivo de alumnos que cursen 5o año.

**d)** Añadir uno o más alumnos al final del archivo con sus datos obtenidos por teclado.

**e)** Modificar el año que cursa un alumno dado. Las búsquedas son por legajo del alumno.

---
