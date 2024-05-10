4. Para las claves siguientes, realice el proceso de dispersión mediante el método de hashing extensible, sabiendo que cada nodo tiene capacidad para dos registros. El número natural indica el orden de llegada de las claves. Se debe mostrar el estado del archivo para cada operación. **Justifique brevemente**.

|     |          |          |     |            |          |
| --- | -------- | -------- | --- | ---------- | -------- |
| 1   | Barbos   | 00000001 | 2   | Pirañas    | 01100011 |
| 3   | Tetras   | 11110100 | 4   | Cíclidos   | 01010110 |
| 5   | Bettas   | 00101001 | 6   | GoldFish   | 00110101 |
| 7   | Danios   | 10110000 | 8   | Rásboras   | 01111110 |
| 9   | Gouramis | 01111000 | 10  | Peces Gato | 00110100 |

## Resolución

- **Op 1:**

|     |                 |            |
| :-- | :-------------- | :--------- |
|     | Valor Tabla = 0 |            |
| 0   | Dirección       | (0) Barbos |

- **Op 2:**

|     |                 |                            |
| :-- | :-------------- | :------------------------- |
|     | Valor Tabla = 0 |                            |
| 0   | Dirección       | (0) Barbos $\quad$ Pirañas |

- **Op 3:** Overflow en el registro apuntado por 0.

|     |                 |                            |
| :-- | :-------------- | :------------------------- |
|     | Valor Tabla = 1 |                            |
| 0   | Dirección       | (1) Tetras                 |
| 1   | Dirección       | (1) Barbos $\quad$ Pirañas |

- **Op 4:**

|     |                 |                             |
| :-- | :-------------- | :-------------------------- |
|     | Valor Tabla = 1 |                             |
| 0   | Dirección       | (1) Tetras $\quad$ Cíclidos |
| 1   | Dirección       | (1) Barbos $\quad$ Pirañas  |

- **Op 5:** Overflow en el registro apuntado por 1.

|     |                 |                             |
| :-- | :-------------- | :-------------------------- |
|     | Valor Tabla = 2 |                             |
| 00  | Dirección       | (1) Tetras $\quad$ Cíclidos |
| 01  | Dirección       | (2) Barbos $\quad$ Bettas   |
| 10  | Dirección       | (1) Tetras $\quad$ Cíclidos |
| 11  | Dirección       | (2) Pirañas                 |

- **Op 6:** Overflow en el registro apuntado por 01.

|     |                 |                             |
| :-- | :-------------- | :-------------------------- |
|     | Valor Tabla = 3 |                             |
| 000 | Dirección       | (1) Tetras $\quad$ Cíclidos |
| 001 | Dirección       | (3) Barbos $\quad$ Bettas   |
| 010 | Dirección       | (1) Tetras $\quad$ Cíclidos |
| 011 | Dirección       | (2) Pirañas                 |
| 100 | Dirección       | (1) Tetras $\quad$ Cíclidos |
| 101 | Dirección       | (3) GoldFish                |
| 110 | Dirección       | (1) Tetras $\quad$ Cíclidos |
| 111 | Dirección       | (2) Pirañas                 |

- **Op 7:** Overflow en el registro apuntado por 000.

|     |                 |                           |
| :-- | :-------------- | :------------------------ |
|     | Valor Tabla = 3 |                           |
| 000 | Dirección       | (2) Tetras $\quad$ Danios |
| 001 | Dirección       | (3) Barbos $\quad$ Bettas |
| 010 | Dirección       | (2) Cíclidos              |
| 011 | Dirección       | (2) Pirañas               |
| 100 | Dirección       | (2) Tetras $\quad$ Danios |
| 101 | Dirección       | (3) GoldFish              |
| 110 | Dirección       | (2) Cíclidos              |
| 111 | Dirección       | (2) Pirañas               |

- **Op 8:** Overflow en el registro apuntado por 110.

|     |                 |                               |
| :-- | :-------------- | :---------------------------- |
|     | Valor Tabla = 3 |                               |
| 000 | Dirección       | (2) Tetras $\quad$ Danios     |
| 001 | Dirección       | (3) Barbos $\quad$ Bettas     |
| 010 | Dirección       | (2) Cíclidos $\quad$ Rásboras |
| 011 | Dirección       | (2) Pirañas                   |
| 100 | Dirección       | (2) Tetras $\quad$ Danios     |
| 101 | Dirección       | (3) GoldFish                  |
| 110 | Dirección       | (2) Cíclidos $\quad$ Rásboras |
| 111 | Dirección       | (2) Pirañas                   |

- **Op 9:** Overflow en el registro apuntado por 000.

|     |                 |                               |
| :-- | :-------------- | :---------------------------- |
|     | Valor Tabla = 3 |                               |
| 000 | Dirección       | (3) Danios $\quad$ Gouramis   |
| 001 | Dirección       | (3) Barbos $\quad$ Bettas     |
| 010 | Dirección       | (2) Cíclidos $\quad$ Rásboras |
| 011 | Dirección       | (2) Pirañas                   |
| 100 | Dirección       | (3) Tetras                    |
| 101 | Dirección       | (3) GoldFish                  |
| 110 | Dirección       | (2) Cíclidos $\quad$ Rásboras |
| 111 | Dirección       | (2) Pirañas                   |

- **Op 10:**

|     |                 |                               |
| :-- | :-------------- | :---------------------------- |
|     | Valor Tabla = 3 |                               |
| 000 | Dirección       | (3) Danios $\quad$ Gouramis   |
| 001 | Dirección       | (3) Barbos $\quad$ Bettas     |
| 010 | Dirección       | (2) Cíclidos $\quad$ Rásboras |
| 011 | Dirección       | (2) Pirañas                   |
| 100 | Dirección       | (3) Tetras $\quad$ Peces Gato |
| 101 | Dirección       | (3) GoldFish                  |
| 110 | Dirección       | (2) Cíclidos $\quad$ Rásboras |
| 111 | Dirección       | (2) Pirañas                   |
