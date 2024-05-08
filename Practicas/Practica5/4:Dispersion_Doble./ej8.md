
**8.** Dado el siguiente archivo dispersado más abajo, dibuje los estados sucesivos para las
siguientes operaciones: +68, +34, +24, -59, -51. Función de dispersión: Clave **MOD** 11.

Segunda función de dispersión: Clave **MOD** 6. Al finalizar calcule la densidad de empaquetamiento.

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

## Resolución

* **Op +68:** 68 *MOD* 11 = 2 ➔ Lo agrego pues en la dirección 2 el registro se encuentra libre.

| Dirección | Registro |
| --------- | -------- |
| 0         |          |
| 1         | 23       |
| 2         | 68       |
| 3         | 47       |
| 4         | 59       |
| 5         |          |
| 6         | 50       |
| 7         | 51       |
| 8         | 30       |
| 9         |          |
| 10        | 43       |


* **Op +34:** 34 *MOD* 11 = 1 ➔ En la dirección 1 no puede ser agregado pues está ocupada, por lo tanto, aplico la segunda función de dispersión 34 *MOD* 6 = 4, por lo tanto, lo intento colocar en el registro de la dirección F2: (1 + 4 + 1) *MOD* 11 = 6, el cual esta ocupado, por lo tanto, sigo aplicando la segunda función hasta encontrar una dirección libre F2:(1 + 4 + 1 + 4 + 1) *MOD* 11 = 0:

| Dirección | Registro |
| --------- | -------- |
| 0         | 34       |
| 1         | 23       |
| 2         | 68       |
| 3         | 47       |
| 4         | 59       |
| 5         |          |
| 6         | 50       |
| 7         | 51       |
| 8         | 30       |
| 9         |          |
| 10        | 43       |


* **Op +24:** 24 *MOD* 11 = 2 ➔ En la dirección 2 no puede ser agregado pues está ocupada, por lo tanto, aplico la segunda función de dispersión 24 *MOD* 6 = 0, por lo tanto, lo intento colocar en el registro de la dirección F2: (2 + 0 + 1) *MOD* 11 = 3, el cual esta ocupado, por lo tanto, sigo aplicando la segunda función hasta encontrar una dirección libre F2:(2 + 0 + 1 + 0 + 1 + 0 + 1) *MOD* 11 = 5:

| Dirección | Registro |
| --------- | -------- |
| 0         | 34       |
| 1         | 23       |
| 2         | 68       |
| 3         | 47       |
| 4         | 59       |
| 5         | 24       |
| 6         | 50       |
| 7         | 51       |
| 8         | 30       |
| 9         |          |
| 10        | 43       |


* **Op -59:** 59 *MOD* 11 = 4 ➔ Como se encuentra en la posición que indica la primer función de hashing lo borro poniendo la resectiva marca de inutilización.

| Dirección | Registro |
| --------- | -------- |
| 0         | 34       |
| 1         | 23       |
| 2         | 68       |
| 3         | 47       |
| 4         | ####     |
| 5         | 24       |
| 6         | 50       |
| 7         | 51       |
| 8         | 30       |
| 9         |          |
| 10        | 43       |

* **Op -51:** 51 *MOD* 11 = 7 ➔ Como se encuentra en la posición que indica la primer función de hashing lo borro poniendo la resectiva marca de inutilización.

| Dirección | Registro |
| --------- | -------- |
| 0         | 34       |
| 1         | 23       |
| 2         | 68       |
| 3         | 47       |
| 4         | ####     |
| 5         | 24       |
| 6         | 50       |
| 7         | ####     |
| 8         | 30       |
| 9         |          |
| 10        | 43       |


**Densidad de empaquetamiento:**

$$DE = \frac{\#registros}{RPN\cdot n}\cdot 100\% = \frac{8}{11\cdot 1}\cdot 100\% = 72.72\%$$
