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

## Resolución

Op +44: 44 **Mod** 11 = 0 ➔ Como no hay espacio lo almaceno en el siguiente espacio libre:

| Dirección | Registro | Registro |
| --------- | -------- | -------- |
| 0         | 33       | 22       |
| 1         | 23       | 45       |
| 2         | 44       |          |
| 3         | 36       |          |
| 4         | 48       |          |
| 5         |          |          |
| 6         |          |          |
| 7         | 51       |          |
| 8         |          |          |
| 9         |          |          |
| 10        | 76       | 54       |

Op +65: 65 **Mod** 11 = 10 ➔ Como no hay espacio lo almaceno en el siguiente espacio libre:

| Dirección | Registro | Registro |
| --------- | -------- | -------- |
| 0         | 33       | 22       |
| 1         | 23       | 45       |
| 2         | 44       | 65       |
| 3         | 36       |          |
| 4         | 48       |          |
| 5         |          |          |
| 6         |          |          |
| 7         | 51       |          |
| 8         |          |          |
| 9         |          |          |
| 10        | 76       | 54       |

Op +30: 30 **Mod** 11 = 8 ➔ Hay espacio para almacenarlo.

| Dirección | Registro | Registro |
| --------- | -------- | -------- |
| 0         | 33       | 22       |
| 1         | 23       | 45       |
| 2         | 44       | 65       |
| 3         | 36       |          |
| 4         | 48       |          |
| 5         |          |          |
| 6         |          |          |
| 7         | 51       |          |
| 8         | 30       |          |
| 9         |          |          |
| 10        | 76       | 54       |

Op +66: 66 **Mod** 11 = 0 ➔ Como no hay espacio lo almaceno en el siguiente espacio libre:

| Dirección | Registro | Registro |
| --------- | -------- | -------- |
| 0         | 33       | 22       |
| 1         | 23       | 45       |
| 2         | 44       | 65       |
| 3         | 36       | 66       |
| 4         | 48       |          |
| 5         |          |          |
| 6         |          |          |
| 7         | 51       |          |
| 8         | 30       |          |
| 9         |          |          |
| 10        | 76       | 54       |

**Densidad de empaquetamiento:**

$$DE = \frac{\#registros}{RPN\cdot n}\cdot 100\% = \frac{13}{11\cdot 2}\cdot 100\% = 59.09\%$$
