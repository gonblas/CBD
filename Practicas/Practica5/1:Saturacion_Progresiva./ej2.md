**2.** Dado el siguiente archivo dispersado más abajo, dibuje los estados sucesivos para las siguientes operaciones: +50, +14, +88, -20, -99. Función de dispersión: Clave **MOD** 10.

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

## Resolución

Op +50: 50 **Mod** 10 = 0 ➔ Como no hay espacio lo almaceno en el siguiente espacio libre:

| Dirección | Registro |
| --------- | -------- |
| 0         | 10       |
| 1         | 40       |
| 2         | 42       |
| 3         | 50       |
| 4         | 74       |
| 5         |          |
| 6         |          |
| 7         | 97       |
| 8         |          |
| 9         | 99       |

Op +14: 14 **Mod** 10 = 4 ➔ Como no hay espacio lo almaceno en el siguiente espacio libre:

| Dirección | Registro |
| --------- | -------- |
| 0         | 10       |
| 1         | 40       |
| 2         | 42       |
| 3         | 50       |
| 4         | 74       |
| 5         | 14       |
| 6         |          |
| 7         | 97       |
| 8         |          |
| 9         | 99       |

Op +88: 88 **Mod** 10 = 8 ➔ Hay espacio libre:

| Dirección | Registro |
| --------- | -------- |
| 0         | 10       |
| 1         | 40       |
| 2         | 42       |
| 3         | 50       |
| 4         | 74       |
| 5         | 14       |
| 6         |          |
| 7         | 97       |
| 8         | 88       |
| 9         | 99       |

Op -20: 20 **Mod** 10 = 0 ➔ Busco a partir de la dirección 0 hasta el espacio libe y no encontre al 20, por lo tanto, la tabla queda igual.

| Dirección | Registro |
| --------- | -------- |
| 0         | 10       |
| 1         | 40       |
| 2         | 42       |
| 3         | 50       |
| 4         | 74       |
| 5         | 14       |
| 6         |          |
| 7         | 97       |
| 8         | 88       |
| 9         | 99       |

Op -99: 99 **Mod** 10 = 9 ➔ Busco en la dirección 9 y el 99 esta alli, como la eliminacion no afecta a la busqueda no es necesaria la marca de inutilizacion (####).

| Dirección | Registro |
| --------- | -------- |
| 0         | 10       |
| 1         | 40       |
| 2         | 42       |
| 3         | 50       |
| 4         | 74       |
| 5         | 14       |
| 6         |          |
| 7         | 97       |
| 8         | 88       |
| 9         |          |

**Densidad de empaquetamiento:**

$$DE = \frac{\#registros}{RPN\cdot n}\cdot 100\% = \frac{8}{10\cdot 1}\cdot 100\% = 80\%$$
