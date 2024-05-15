3. Dado el siguiente archivo dispersado más abajo, dibuje los estados sucesivos para las siguientes operaciones: +68, +34, +24, -59, -51. Función de dispersión: Clave **MOD** 11. Segunda función de dispersión: Clave **MOD** 6. Al finalizar calcule la densidad de empaquetamiento.

| Dirección | Registro |
| :-------- | :------- |
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
| 10        | 431      |

- **Op +68:** F1: 68 _MOD_ 11 = 2. Como esta libre lo meto de una.

| Dirección | Registro |
| :-------- | :------- |
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
| 10        | 431      |

- **Op +34:** F1: 34 _MOD_ 11 = 1. Como esta ocupado aplico la segunda funcion de hashing F2: 34 _MOD_ 6 = 4, sumo ambas mas 1: (1 + 4 + 1) _MOD_ 11 = 6, como esta ocupada la direccion 6, sumo repetidas veces hasta encontrar una posicion libre: (1 + 4 + 1 + 4 + 1) _MOD_ 11 = 0

| Dirección | Registro |
| :-------- | :------- |
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
| 10        | 431      |

- **Op +24:** F1: 24 _MOD_ 11 = 2. Como esta ocupado aplico la segunda funcion de hashing F2: 24 _MOD_ 6 = 0, sumo ambas mas 1: (2 + 0 + 1) _MOD_ 11 = 3, como esta ocupada la direccion 3, sumo repetidas veces hasta encontrar una posicion libre: (2 + 0 + 1 + 0 + 1 + 0 + 1) _MOD_ 11 = 5

| Dirección | Registro |
| :-------- | :------- |
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
| 10        | 431      |

- **Op -59:** F1: 59 _MOD_ 11 = 4. Como la clave se encuentra en la direccion 4 borro el 59 poniendo la marca de borrado.

| Dirección | Registro |
| :-------- | :------- |
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
| 10        | 431      |

- **Op -51:** F1: 51 _MOD_ 11 = 7. Como la clave se encuentra en la direccion 7 borro el 51 poniendo la marca de borrado.

| Dirección | Registro |
| :-------- | :------- |
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
| 10        | 431      |
