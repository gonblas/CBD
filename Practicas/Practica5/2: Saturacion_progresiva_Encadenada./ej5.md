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

## Resolución

Op +18: 18 **MOD** 11 = 7 ➔ Como la posición 7 esta libre entonces simplemente lo coloco alli.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 11       |
| 1         | 2      | 12       |
| 2         | -1     | 23       |
| 3         | 5      | 25       |
| 4         | -1     | 37       |
| 5         | 6      | 47       |
| 6         | -1     | 58       |
| 7         | -1     | 18       |
| 8         | -1     |          |
| 9         | -1     |          |
| 10        | -1     |          |

Op +34: 34 **MOD** 11 = 1 ➔ Como en la dirección donde debe ser colocado el 34 esta ocupado por una clave que si debe estar alli (según indica la función de hash) entonces coloco al 34 en el registro de la siguiente dirección libre copiando alli el enlace de la dirección donde deberia ser colocado el mismo, el cual tendrá el enlace donde el 34 sea colocado.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 11       |
| 1         | 8      | 12       |
| 2         | -1     | 23       |
| 3         | 5      | 25       |
| 4         | -1     | 37       |
| 5         | 6      | 47       |
| 6         | -1     | 58       |
| 7         | -1     | 18       |
| 8         | 2      | 34       |
| 9         | -1     |          |
| 10        | -1     |          |

Op -25: 25 **MOD** 11 = 3 ➔ Como el 35 esta en la dirección que indica la función de hash lo borro y lo reemplazo por la clave que indica el enlace de la posición donde se encuentra el 25, dejando libre tal posición que referencia.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 11       |
| 1         | 8      | 12       |
| 2         | -1     | 23       |
| 3         | 6      | 47       |
| 4         | -1     | 37       |
| 5         | -1     |          |
| 6         | -1     | 58       |
| 7         | -1     | 18       |
| 8         | 2      | 34       |
| 9         | -1     |          |
| 10        | -1     |          |

Op -11: 11 **MOD** 11 = 0 ➔ Como el 11 se encuentra en la pocición que indica la función de hash directamente lo borro, y se termina la operación pues su enlace no referencia a ninguna otra clave.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     |          |
| 1         | 8      | 12       |
| 2         | -1     | 23       |
| 3         | 6      | 47       |
| 4         | -1     | 37       |
| 5         | -1     |          |
| 6         | -1     | 58       |
| 7         | -1     | 18       |
| 8         | 2      | 34       |
| 9         | -1     |          |
| 10        | -1     |          |

**Densidad de empaquetamiento:**

$$DE = \frac{\#registros}{RPN\cdot n}\cdot 100\% = \frac{7}{11\cdot 1}\cdot 100\% = 63.63\%$$
