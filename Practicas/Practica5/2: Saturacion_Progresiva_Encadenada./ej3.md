**3.** Dado el siguiente archivo dispersado, dibuje los estados sucesivos para las siguientes operaciones: +73, +45, -34, -24. Función de dispersión: **Clave MOD 8**. Técnica de resolución de colisiones: **Saturación progresiva encadenada. Calcule la densidad de empaquetamiento. Justifique brevemente cada operación. Justifique cada operación.**

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

## Resolución

- **Op +73:** 73 _MOD_ 8 = 1 ➔ Como no hay espacio lo almaceno en el siguiente espacio libre, cambio el enlace de la dirección 1 por la dirección en la cual coloco al 73, y la que estaba antes pasa a ser el enlace del 73:

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 24       |
| 1         | 5      | 9        |
| 2         | 6      | 34       |
| 3         | -1     | 35       |
| 4         | -1     | 57       |
| 5         | 4      | 73       |
| 6         | -1     | 26       |
| 7         | -1     |          |

- **Op +45:** 45 _MOD_ 8 = 5 ➔ Como no hay espacio y el que se encuentra en la posicion no lo debe estar naturalmente entonces lo reasigno a otra posicion para poner al 45 en su lugar.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 24       |
| 1         | 7      | 9        |
| 2         | 6      | 34       |
| 3         | -1     | 35       |
| 4         | -1     | 57       |
| 5         | -1     | 45       |
| 6         | -1     | 26       |
| 7         | 4      | 73       |

- **Op -34:** 34 _MOD_ 8 = 2 -> Como se encuentra el 34 en su posicion entonces lo elimino y en su lugar pongo al que se encuentra en la posicion que indica en enlace puesto que es distinto de -1.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 24       |
| 1         | 7      | 9        |
| 2         | -1     | 26       |
| 3         | -1     | 35       |
| 4         | -1     | 57       |
| 5         | -1     | 45       |
| 6         | -1     |          |
| 7         | 4      | 73       |

- **Op -24:** 24 _MOD_ 8 = 0 -> Como se encuentra el 34 en su posicion entonces lo elimino y como su enlace es -1 no debe realizar ninguna otra modificación.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     |          |
| 1         | 7      | 9        |
| 2         | -1     | 26       |
| 3         | -1     | 35       |
| 4         | -1     | 57       |
| 5         | -1     | 45       |
| 6         | -1     |          |
| 7         | 4      | 73       |

**Densidad de empaquetamiento:**

$$DE = \frac{\#registros}{RPN\cdot n}\cdot 100\% = \frac{6}{8\cdot 1}\cdot 100\% = 75\%$$
