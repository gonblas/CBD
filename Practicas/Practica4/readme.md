# **_Practica 4_**: _Árboles B y B+._

## **_Introducción_**

Esta práctica permite ejercitar las operaciones de alta y baja sobre árboles b y b+
manteniendo las propiedades del tipo de árbol correspondiente una vez realizada cada
operación.

1- No reenumerar nodos no afectados ante una operación.

2- En caso de underflow/subflujo balancear la carga de acuerdo a la política descripta en el
enunciado. Si el balanceo no resuelve el subflujo, deberá realizar la fusión de los nodos.

3- **Indicar en todos los ejercicios lecturas/escrituras realizadas.**

## **_Arboles B_**

**1.** Se cuenta con un archivo con la información de alumnos de la facultad de ciencias económicas. De cada alumno se conoce legajo y nombre apellido.

| NRR | Legajo | Nombre         | NRR | Legajo | Nombre           |
| --- | ------ | -------------- | --- | ------ | ---------------- |
| 0   | 1111/9 | Lopez Juan     | 6   | 2020/1 | Castro Marta     |
| 1   | 2154/3 | Castelli Jose  | 7   | 1980/5 | Jauregui Marcela |
| 2   | 4578/2 | Peretti Laura  | 8   | 4529/8 | Lopez Jaime      |
| 3   | 1238/9 | Garzon Alma    | 9   | 3248/9 | Vazzano Andres   |
| 4   | 3218/3 | Rossi Tatiana  | 10  | 7563/8 | Corsi Cesar      |
| 5   | 7845/6 | Venero Luciano | 11  | 4569/8 | Garcia Felipe    |

Se necesita poder ver la información contenida en el archivo ordenada por legajo. Para ello construya un árbol B de orden 4, insertando el legajo detallado en el archivo, asumiendo el orden de llegada de las claves indicado por el NRR.

**2.** Dado el árbol **B** que se detalla más abajo, con orden 5, es decir, capacidad de 4
claves como máximo. **Muestre los estados sucesivos** al realizar la siguiente
secuencia de operaciones: +150,+157, -135 , -136 y -145, además indicar nodos leídos
y escritos en el orden de ocurrencia. **Política de resolución underflow derecha**

```pascal
    Nodo 0: ,4 i, 2(100)3(130)1(145)4(200)5
    Nodo 2: 2, h, (88)(89)
    Nodo 3: 2, h, (110)(112)
    Nodo 1: 2, h, (135)(136)
    Nodo 4: 3, h, (146)(147)(148)
    Nodo 5: 2, h, (201)(207)
```

**3.** Dado el árbol B que se detalla más abajo, con orden 6, es decir, capacidad de 5
claves como máximo. Muestre los estados sucesivos al realizar la siguiente secuencia
de operaciones: -65, +97 y -187. **Indicar lecturas y escrituras para cada operación.
Utilice política izquierda para la resolución de underflow.**

```pascal
    Nodo 0: 5, i, 1(38)2(60)3(87)4(187)5(300)6
    Nodo 1: 2, h, (12)(31)
    Nodo 2: 2, h, (50)(53)
    Nodo 3: 2, h, (65)(77)
    Nodo 4: 5, h, (96)(99)(103)(115)(120)
    Nodo 5: 2, h, (224)(249)
    Nodo 6: 3, h, (329)(345)(486)
```

**4.** Dado el árbol B que se detalla más abajo, con orden 6, es decir, capacidad de 5
claves como máximo. Muestre los estados sucesivos al realizar la siguiente secuencia
de operaciones: +425, -60 y -22. **Utilice política izquierda y derecha para resolver
underflow.**

```pascal
    Nodo 0: 5, i, 2(60)1(90)3(107)4(287)5(400)6
    Nodo 2: 2, h, (12)(22)
    Nodo 1: 2, h, (63)(66)
    Nodo 3: 2, h, (94)(95)
    Nodo 4: 3, h, (116)(129)(280)
    Nodo 5: 2, h, (328)(358)
    Nodo 6: 5, h, (403)(404)(506)(518)(620)
```

**5.** Dado el árbol B que se detalla a continuación, con orden 6, es decir, capacidad de 5 claves
como máximo. Muestre los estados sucesivos al realizar la siguiente secuencia de operaciones: alta 756, baja 300 y baja 85. **Indique L/E de nodos. Dibuje el árbol resultante de cada operación. Política de resolución de underflow derecha.**

```pascal
    NODO 0: (i, 3 elem.), 1(85) 2(379) 3(755) 4
    NODO 1: (h, 2 elem.), (14)(80)
    NODO 2: (h, 2 elem.), (216)(300)
    NODO 3: (h, 3 elem.), (601)(682)(695)
    NODO 4: (h, 5 elem.), (771)(810)(853)(907)(964)
```

## **_Árboles B+_**

**6.** Dado el árbol B+ que se detalla a continuación, con orden 5, es decir, capacidad de 4 claves como máximo. Muestre los estados sucesivos al realizar la siguiente secuencia de
operaciones: alta de la clave 19, alta de 25 y finalmente baja de las claves 63 y 62. **Utilizando política de resolución de underflow izquierda y derecha. Dibuje el árbol resultante de cada operación. Indique lecturas y escrituras en cada operación.**

```pascal
    NODO 0 (i, 4 elemento/s) 2(23)1(54)3(62)4(79)5
    NODO 2 (h, 4 elemento/s) (18) (20) (21) (22) Siguiente hoja: 1
    NODO 1 (h, 4 elemento/s) (23) (26) (33) (38) Siguiente hoja: 3
    NODO 3 (h, 1 elemento/s) (54) Siguiente hoja: 4
    NODO 4 (h, 2 elemento/s) (62) (63) Siguiente hoja: 5
    NODO 5 (h, 3 elemento/s) (79)(80) (91) Siguiente hoja: -1
```

**7.** Dado el árbol B +que se detalla siguiendo, con orden 7, es decir, capacidad de 6 claves como máximo. Muestre los estados sucesivos al realizar la siguiente secuencia de operaciones: -173, +172 y -92. **Utilice política derecha.**

```pascal
0: 2(165) 9

2: 10(92) 1(104) 3(130)4    9: 5(178) 6(264) 7(378) 8
10: (59)( 85)( 89) 1        5: (166)(167)(168)(169)(171)(173)6
1: (92)(94) 3               6: (178)(187)(197)(198) 7
3: (104)(120) 4             7: (264)(266)(269) 8
4: (130)(163) 5             8: (378)(390)(395)(400) -1

```

**8.** Dado el árbol B+ que se detalla a continuación, con orden 4, es decir, capacidad de 3 claves como máximo. Muestre los estados sucesivos al realizar la siguiente secuencia de operaciones: baja de las claves 80 y 33, alta de las claves 39 y 57. Indique L/E de nodos. **Dibuje el árbol resultante de cada operación. Política de resolución de underflow derecha**

```pascal
Nodo 0: 1, i, 1(65)2
    Nodo 1: 2, i, 3(33)4(55)5
        Nodo 3: 3, h, (20)(22) (23) ->4
        Nodo 4: 3, h, (34)(35)(37) ->5
        Nodo 5: 3, h, (55) (62) (63)->6
    Nodo 2: 1, i, 6(79)7
        Nodo 6: 3, h, (74)(75) (76)->7
        Nodo 7: 1, h, (80) ->-1

```

**9.** Dado el árbol B+ que se detalla más abajo, con orden 6, es decir, capacidad de 5 claves como máximo. Muestre los estados sucesivos al realizar la siguiente secuencia de operaciones: +370, -230 y -103, además **indicar nodos leídos y escritos en el orden de ocurrencia. Política de resolución underflow izquierda.**

```pascal
Nodo 0: 5, i, 2(103)1(220)3(230)4(322)5(402)6
    Nodo 2: 2, h, (13)(102) -> 1
    Nodo 1: 2, h, (103)(145) -> 3
    Nodo 3: 2, h, (220)(223) -> 4
    Nodo 4: 4, h, (250)(261)(280)(293) -> 5
    Nodo 5: 5, h, (324)(331)(348)(355)(367) -> 6
    Nodo 6: 3, h, (402)(444)(465) -> -1

```

**10.** Dado el árbol B+ siguiente con capacidad para 5 claves en sus nodos, dibuje el árbol
resultante de realizar las operaciones que se detallan a continuación:

A – Dibuje cómo queda el árbol resultante para el alta de la clave 18.

B – Dibuje cómo queda el árbol resultante del punto A para la baja de la clave 2.

C- Dibuje cómo queda el árbol resultante del punto A para la baja de la clave 15.

**Utilice política de resolución de underflow izquierda.**

```pascal
0: 2(36) 8

2: 9(8) 1(15) 3(28) 4               8: 7 (48) 5(95) 6
9: (2)(6) 1                         7: (36)(40)(45) 5
1: (8)(9)(11) 3                     5: (48)(50) 6
3: (16)(17)(22) (24) (26) 4         6: (95)(111)(106) -1
4: (28)(30)(35) 7


```

> **NOTA:** Justifique y explique como obtiene el resultado en cada operación realizada sobre el árbol.

---
