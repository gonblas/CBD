# **_Practica 5_**: _Dispersión Estática._

## **_Introducción_**

Esta práctica permite ejercitar las operaciones de altas y bajas sobre dispersión estática
mediante la utilización de las diferentes técnicas de resolución de colisiones en caso de ser necesario. O bien realizar las operaciones utilizando dispersión extensible

## **_Técnica de resolución de colisiones: Saturación progresiva._**

**1.** Dado el siguiente archivo dispersado más abajo, dibuje los estados sucesivos para las
siguientes operaciones: +44, +65, +30, +66. Función de dispersión: Clave **MOD** 11. Al finalizar calcule la densidad de empaquetamiento.

| Dirección | Registro | Registro |
| --------- | -------- | -------- |
| 0         | 33       | 22       |
| 1         | 23       | 45       |
| 2         |          |          |
| 3         | 36       |          |
| 4         | 48       |          |
| 5         |          |          |
| 6         |          |          |
| 7         | 51       |          |
| 8         |          |          |
| 9         |          |          |
| 10        | 76       | 54       |

**2.** Dado el siguiente archivo dispersado más abajo, dibuje los estados sucesivos para las
siguientes operaciones: +50, +14, +88, -20, -99. Función de dispersión: Clave **MOD** 10.

| Dirección | Registro |
| --------- | -------- |
| 0         | 10       |
| 1         | 40       |
| 2         | 42       |
| 3         |          |
| 4         | 74       |
| 5         |          |
| 6         |          |
| 7         | 97       |
| 8         |          |
| 9         | 99       |

## **_Técnica de resolución de colisiones: Saturación progresiva encadenada._**

**3.** Dado el siguiente archivo dispersado, dibuje los estados sucesivos para las
siguientes operaciones: +73, +45, -34, -24. Función de dispersión: **Clave MOD 8**.
Técnica de resolución de colisiones: **Saturación progresiva encadenada. Calcule la densidad de empaquetamiento. Justifique brevemente cada operación. Justifique cada operación.**

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 24       |
| 1         | 4      | 9        |
| 2         | 6      | 34       |
| 3         | -1     | 35       |
| 4         | -1     | 57       |
| 5         | -1     |          |
| 6         | -1     | 26       |
| 7         | -1     |          |

**4.** Dado el siguiente archivo dispersado, dibuje los estados sucesivos para las siguientes operaciones: +57, +59, +64, -43, -39. Función de dispersión: **Clave MOD 7**.
Técnica de resolución de colisiones: **Saturación progresiva encadenada. Calcule la densidad de empaquetamiento. Justifique brevemente cada operación.**

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     |          |
| 1         | -1     | 43       |
| 2         | -1     | 23       |
| 3         | -1     |          |
| 4         | -1     | 39       |
| 5         | -1     |          |
| 6         | -1     |          |

**5.** Dado el siguiente archivo dispersado, dibuje los estados sucesivos para las siguientes operaciones: +18, +34, -25, -11. Función de dispersión: **Clave MOD 11.**
Técnica de resolución de colisiones: **Saturación progresiva encadenada. Calcule la densidad de empaquetamiento. Justifique brevemente cada operación.**

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 11       |
| 1         | 2      | 12       |
| 2         | -1     | 23       |
| 3         | 5      | 25       |
| 4         | -1     | 37       |
| 5         | 6      | 47       |
| 6         | -1     | 58       |
| 7         | -1     |          |
| 8         | -1     |          |
| 9         | -1     |          |
| 10        | -1     |          |

## **_Técnica de resolución de colisiones: Saturación progresiva encadenada con área de desborde separada._**

**6.** Dado el siguiente archivo dispersado, dibuje los estados sucesivos para las siguientes operaciones: +59, +25, -39, -1. Función de dispersión: **Clave MOD 6**. Técnica de resolución de colisiones: Saturación progresiva encadenada con área de desborde separada. **Justifique brevemente cada operación.**

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 43       |
| 1         | -1     | 65       |
| 2         | 0      | 1        |
| 3         | -1     |          |
| 4         | -1     |          |

| Dirección | Enlace | Registro | Registro |
| --------- | ------ | -------- | -------- |
| 0         | -1     | 24       |          |
| 1         | 2      | 13       | 19       |
| 2         | -1     |          |          |
| 3         | -1     | 39       |          |
| 4         | -1     | 34       |          |
| 5         | 1      | 17       | 53       |

**7.** Dado el siguiente archivo dispersado, dibuje los estados sucesivos para las siguientes operaciones: +36, +62, -8, -41. Función de dispersión: **Clave MOD 7**.
Técnica de resolución de colisiones: **Saturación progresiva encadenada con área de desborde separada.** Justifique brevemente cada operación.

| Dirección | Enlace | Registro | Registro |
| --------- | ------ | -------- | -------- |
| 0         | -1     | 14       |          |
| 1         | -1     | 8        | 22       |
| 2         | -1     |          |          |
| 3         | -1     | 24       |          |
| 4         | 1      | 11       | 18       |
| 5         | -1     |          |          |
| 6         | 2      | 20       | 27       |

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 34       |
| 1         | -1     | 60       |
| 2         | 0      | 41       |
| 3         | -1     |          |
| 4         | -1     |          |

## **_Técnica de resolución de colisiones: Dispersión Doble._**

**8.** Dado el siguiente archivo dispersado más abajo, dibuje los estados sucesivos para las
siguientes operaciones: +68, +34, +24, -59, -51. Función de dispersión: Clave **MOD** 11.

Segunda función de dispersión: Clave **MOD** 6. Al finalizar calcule la densidad de
empaquetamiento.

| Dirección | Registro |
| --------- | -------- |
| 0         |          |
| 1         | 23       |
| 2         |          |
| 3         | 47       |
| 4         | 59       |
| 5         |          |
| 6         | 50       |
| 7         | 51       |
| 8         | 30       |
| 9         |          |
| 10        | 43       |

**9.** Dado el siguiente archivo dispersado a continuación, dibuje los estados sucesivos para las
siguientes operaciones: +34, +27, +18, -63, -14. Función de dispersión: Clave **MOD** 11. Segunda función de dispersión: Clave **MOD** 7. Al finalizar calcule la densidad de empaquetamiento. Justifique brevemente las operaciones.

| Dirección | Registro |
| --------- | -------- |
| 0         |          |
| 1         | 23       |
| 2         | 35       |
| 3         | 14       |
| 4         | 48       |
| 5         |          |
| 6         |          |
| 7         |          |
| 8         | 63       |
| 9         |          |
| 10        |          |

## **_Dispersión Extensible._**

1. Realice el proceso de dispersión mediante el método de hashing extensible, sabiendo que cada registro tiene capacidad para dos claves. El número natural indica el orden de llegada de las mismas. Deberá explicar los pasos que realiza en cada operación y dibujar los estados sucesivos correspondiente. **Justifique brevemente**.

   |     |         |          |     |          |          |
   | --- | ------- | -------- | --- | -------- | -------- |
   | 1   | Danubio | 10100111 | 2   | Arno     | 10101010 |
   | 3   | Rin     | 00111110 | 4   | Adigio   | 01101111 |
   | 5   | Tajo    | 0110101  | 6   | Rio Kama | 11110000 |
   | 7   | Po      | 01011101 | 8   | Tisza    | 01011011 |
   | 9   | Ebro    | 00110100 | 10  | Volga    | 11100011 |

2. Para las claves siguientes, realice el proceso de dispersión mediante el método de hashing extensible, sabiendo que cada nodo tiene capacidad para dos registros. El número natural indica el orden de llegada de las claves. Se debe mostrar el estado del archivo para cada operación. **Justifique brevemente**.

|     |                |          |     |              |          |
| --- | -------------- | -------- | --- | ------------ | -------- |
| 1   | Chow chow      | 00111111 | 2   | Beagle       | 11110100 |
| 3   | Border terrier | 10100101 | 4   | Border Colie | 01010111 |
| 5   | Samoyedo       | 01101011 | 6   | Rottweiler   | 10101010 |
| 7   | Chihuahua      | 00111100 | 8   | Saluki       | 01100111 |
| 9   | Bóxer          | 01010100 | 10  | Gran dánes   | 01100001 |

3. Para las claves siguientes, realice el proceso de dispersión mediante el método de hashing extensible, sabiendo que cada nodo tiene capacidad para dos registros. El número natural indica el orden de llegada de las claves. **Justifique brevemente**.

|     |       |          |     |         |          |
| --- | ----- | -------- | --- | ------- | -------- |
| 1   | Avena | 00000001 | 2   | Cebada  | 01100011 |
| 3   | Trigo | 11110101 | 4   | Centeno | 01010110 |
| 5   | Arroz | 00101000 | 6   | Maíz    | 00110100 |
| 7   | Sorgo | 10110010 | 8   | Quinoa  | 01111110 |
| 9   | Kamut | 01111100 | 10  | Mijo    | 00110000 |

4. Para las claves siguientes, realice el proceso de dispersión mediante el método de hashing extensible, sabiendo que cada nodo tiene capacidad para dos registros. El número natural indica el orden de llegada de las claves. Se debe mostrar el estado del archivo para cada operación. **Justifique brevemente**.

|     |          |          |     |            |          |
| --- | -------- | -------- | --- | ---------- | -------- |
| 1   | Barbos   | 00000001 | 2   | Pirañas    | 01100011 |
| 3   | Tetras   | 11110100 | 4   | Cíclidos   | 01010110 |
| 5   | Bettas   | 00101001 | 6   | GoldFish   | 00110101 |
| 7   | Danios   | 10110000 | 8   | Rásboras   | 01111110 |
| 9   | Gouramis | 01111000 | 10  | Peces Gato | 00110100 |

---
