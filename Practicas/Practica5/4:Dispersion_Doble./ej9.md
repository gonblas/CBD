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

## Resolución



* **Op +34:** 34 *MOD* 11 = 1 ➔ Como el registro de la dirección 1 esta ocupado aplico la segunda función de hashing F2: 34 *MOD* 7 = 6, entonces lo intento colocar en la posición  (1 + 6 + 1) *MOD* 11 = 8, la cual esta ocupada, por lo tanto, aplico la segunda función de hash hasta encontrar una función libre: (1 + 6 + 1 + 6 + 1 + 6 + 1) *MOD* 11 = 0

| Dirección | Registro |
| --------- | -------- |
| 0         | 34       |
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


* **Op +27:** 27 *MOD* 11 = 5 ➔ Lo coloco en la dirección que indica la primer función de hashing, pues esta libre.

| Dirección | Registro |
| --------- | -------- |
| 0         | 34       |
| 1         | 23       |
| 2         | 35       |
| 3         | 14       |
| 4         | 48       |
| 5         | 27       |
| 6         |          |
| 7         |          |
| 8         | 63       |
| 9         |          |
| 10        |          |


* **Op +18:** 18 *MOD* 11 = 7 ➔ Lo coloco en la dirección que indica la primer función de hashing, pues esta libre.

| Dirección | Registro |
| --------- | -------- |
| 0         | 34       |
| 1         | 23       |
| 2         | 35       |
| 3         | 14       |
| 4         | 48       |
| 5         | 27       |
| 6         |          |
| 7         | 18       |
| 8         | 63       |
| 9         |          |
| 10        |          |


* **Op -63:** 63 *MOD* 11 = 8 ➔ Elimino la clave en la dirección que indica la primer función de hash pues alli se encuentra el valor a eliminar y pongo la marca de inutilización.


| Dirección | Registro |
| --------- | -------- |
| 0         | 34       |
| 1         | 23       |
| 2         | 35       |
| 3         | 14       |
| 4         | 48       |
| 5         | 27       |
| 6         |          |
| 7         | 18       |
| 8         | ####     |
| 9         |          |
| 10        |          |


* **Op -14:** 14 *MOD* 11 = 3 ➔ Elimino la clave en la dirección que indica la primer función de hash pues alli se encuentra el valor a eliminar y pongo la marca de inutilización.

| Dirección | Registro |
| --------- | -------- |
| 0         | 34       |
| 1         | 23       |
| 2         | 35       |
| 3         | ####     |
| 4         | 48       |
| 5         | 27       |
| 6         |          |
| 7         | 18       |
| 8         | ####     |
| 9         |          |
| 10        |          |





**Densidad de empaquetamiento:**

$$DE = \frac{\#registros}{RPN\cdot n}\cdot 100\% = \frac{6}{11\cdot 1}\cdot 100\% = 54.54\%$$