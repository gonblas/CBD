
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

## Resolución

* **Op +57:** 57 *MOD* 7 = 1 ➔ Como el lugar esta ocupado por una clave que debe estar en esa direccion entonces lo coloco en el siguiente lugar libre, y cambio el enlace en la dirección 1 por la dirección en la cual coloco al 57.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     |          |
| 1         | 3      | 43       |
| 2         | -1     | 23       |
| 3         | -1     | 57       |
| 4         | -1     | 39       |
| 5         | -1     |          |
| 6         | -1     |          |


* **Op +59:** 59 *MOD* 7 = 3 ➔ Como el lugar esta ocupado por una clave que no corresponde (segun indica la función de hash) entonces muevo la clave al siguiente registro libre para poder colocar la clave 59. Tambien modifico el enlace de la dirección 1 que referencia al valor movido.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     |          |
| 1         | 5      | 43       |
| 2         | -1     | 23       |
| 3         | -1     | 59       |
| 4         | -1     | 39       |
| 5         | -1     | 57       |
| 6         | -1     |          |


* **Op +64:** 64 *MOD* 7 = 1 ➔ Como el lugar esta ocupado por una clave que debe estar en esa direccion entonces lo coloco en el siguiente lugar libre, y cambio el enlace en la dirección 1 por la dirección en la cual coloco al 64, y pongo como enlace de la dirección donde coloco al 64 la que tiene la dirección 1.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     |          |
| 1         | 6      | 43       |
| 2         | -1     | 23       |
| 3         | -1     | 59       |
| 4         | -1     | 39       |
| 5         | -1     | 57       |
| 6         | 5      | 64       |



* **Op -43:** 43 *MOD* 7 = 1 ➔ Como la clave se encuentra en la dirección en la que debe estar la elimino y pongo en su lugar el valor al cual referencia su respectivo enlace.


| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     |          |
| 1         | 5      | 64       |
| 2         | -1     | 23       |
| 3         | -1     | 59       |
| 4         | -1     | 39       |
| 5         | -1     | 57       |
| 6         | -1     |          |


* **Op -39:** 39 *MOD* 7 = 4 ➔ Como la clave se encuentra su posición y no referencia a ninguna otra clave simplemente la borro.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     |          |
| 1         | 5      | 64       |
| 2         | -1     | 23       |
| 3         | -1     | 59       |
| 4         | -1     |          |
| 5         | -1     | 57       |
| 6         | -1     |          |


**Densidad de empaquetamiento:**

$$DE = \frac{\#registros}{RPN\cdot n}\cdot 100\% = \frac{4}{7\cdot 1}\cdot 100\% = 57.14\%$$
