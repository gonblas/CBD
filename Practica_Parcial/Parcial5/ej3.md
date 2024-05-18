Dado el siguiente archivo dispersado más abajo, dibuje los estados sucesivos para las siguientes operaciones: +69, +34, +24, -34, -23. Técnica de resolución de colisiones: Dispersión Doble. Función de dispersión: Clave MOD 7. Segunda función de dispersión: Clave MOD 4. Al finalizar calcule la densidad de empaquetamiento. Justifique cada operación.

| Dirección | Registro |
| --------- | -------- |
| 0         |          |
| 1         | 50       |
| 2         | 23       |
| 3         |          |
| 4         |          |
| 5         |          |
| 6         | 47       |

- **Op +69:** Aplico F1: 69 _MOD_ 7 = 6, como la dirección 0 tiene el registro ocupado aplico la segunda funcion de hashing F2: 69 _MOD_ 4 = 1, y se la sumo mas 1 repetidas veces hasta encontrar una dirección con registro libre: (6 + (1 + 1) + (1 + 1)) _MOD_ 7 = 3.

| Dirección | Registro |
| --------- | -------- |
| 0         |          |
| 1         | 50       |
| 2         | 23       |
| 3         | 69       |
| 4         |          |
| 5         |          |
| 6         | 47       |

- **Op +34:** Aplico F1: 34 _MOD_ 7 = 6, como la dirección 6 tiene el registro ocupado aplico la segunda funcion de hashing F2: 34 _MOD_ 4 = 2, y se la sumo mas 1 repetidas veces hasta encontrar una dirección con registro libre: (6 + (2 + 1) + (2 + 1)) _MOD_ 7 = 5.

| Dirección | Registro |
| --------- | -------- |
| 0         |          |
| 1         | 50       |
| 2         | 23       |
| 3         | 69       |
| 4         |          |
| 5         | 34       |
| 6         | 47       |

- **Op +24:** Aplico F1: 24 _MOD_ 7 = 3, como la dirección 3 tiene el registro ocupado aplico la segunda funcion de hashing F2: 24 _MOD_ 4 = 0, y se la sumo mas 1 repetidas veces hasta encontrar una dirección con registro libre: (3 + (0 + 1)) _MOD_ 7 = 4.

| Dirección | Registro |
| --------- | -------- |
| 0         |          |
| 1         | 50       |
| 2         | 23       |
| 3         | 69       |
| 4         | 24       |
| 5         | 34       |
| 6         | 47       |

- **Op -34:** Aplico F1: 34 _MOD_ 7 = 6, como la dirección 6 no contiene al 34 aplico la segunda funcion de hashing F2: 34 _MOD_ 4 = 2, y se la sumo mas 1 repetidas veces hasta encontrar una dirección que contenga al 34, o recorrer todas las direcciones: (6 + (2 + 1) + (2 + 1)) _MOD_ 7 = 5. Agrego una marca de borrado para las no oobstruir las siguientes busquedas.

| Dirección | Registro |
| --------- | -------- |
| 0         |          |
| 1         | 50       |
| 2         | ####     |
| 3         | 69       |
| 4         | 24       |
| 5         | ####     |
| 6         | 47       |

- **Op -23:** Aplico F1: 23 _MOD_ 7 = 2, como la dirección 2 contiene al 23 lo elimino. Agrego una marca de borrado para las no oobstruir las siguientes busquedas.