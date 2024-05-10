3. Para las claves siguientes, realice el proceso de dispersión mediante el método de hashing extensible, sabiendo que cada nodo tiene capacidad para dos registros. El número natural indica el orden de llegada de las claves. **Justifique brevemente**.

|     |       |          |     |         |          |
| --- | ----- | -------- | --- | ------- | -------- |
| 1   | Avena | 00000001 | 2   | Cebada  | 01100011 |
| 3   | Trigo | 11110101 | 4   | Centeno | 01010110 |
| 5   | Arroz | 00101000 | 6   | Maíz    | 00110100 |
| 7   | Sorgo | 10110010 | 8   | Quinoa  | 01111110 |
| 9   | Kamut | 01111100 | 10  | Mijo    | 00110000 |

## Resolución

- **Op 1:**

|     |                 |           |
| :-- | :-------------- | :-------- |
|     | Valor Tabla = 0 |           |
| 0   | Dirección       | (0) Avena |

- **Op 2:**

|     |                 |                          |
| :-- | :-------------- | :----------------------- |
|     | Valor Tabla = 0 |                          |
| 0   | Dirección       | (0) Avena $\quad$ Cebada |

- **Op 3:** Overflow en el registro apuntado por 0, luego hay overflow en el registro apuntado por 1.

|     |                 |                                        |
| :-- | :-------------- | :------------------------------------- |
|     | Valor Tabla = 1 |                                        |
| 0   | Dirección       | (1)                                    |
| 1   | Dirección       | (1) Avena $\quad$ Cebada $\quad$ Trigo |

|     |                 |                         |
| :-- | :-------------- | :---------------------- |
|     | Valor Tabla = 2 |                         |
| 00  | Dirección       | (1)                     |
| 01  | Dirección       | (2) Avena $\quad$ Trigo |
| 10  | Dirección       | (1)                     |
| 11  | Dirección       | (2) Cebada              |

- **Op 4:**

|     |                 |                         |
| :-- | :-------------- | :---------------------- |
|     | Valor Tabla = 2 |                         |
| 00  | Dirección       | (1)                     |
| 01  | Dirección       | (2) Avena $\quad$ Trigo |
| 10  | Dirección       | (1) Centeno             |
| 11  | Dirección       | (2) Cebada              |

- **Op 5:**

|     |                 |                           |
| :-- | :-------------- | :------------------------ |
|     | Valor Tabla = 2 |                           |
| 00  | Dirección       | (1) Arroz $\quad$ Centeno |
| 01  | Dirección       | (2) Avena $\quad$ Trigo   |
| 10  | Dirección       | (1) Arroz $\quad$ Centeno |
| 11  | Dirección       | (2) Cebada                |

- **Op 6:**

|     |                 |                         |
| :-- | :-------------- | :---------------------- |
|     | Valor Tabla = 2 |                         |
| 00  | Dirección       | (2) Arroz $\quad$ Maíz  |
| 01  | Dirección       | (2) Avena $\quad$ Trigo |
| 10  | Dirección       | (2) Centeno             |
| 11  | Dirección       | (2) Cebada              |

- **Op 7:**

|     |                 |                           |
| :-- | :-------------- | :------------------------ |
|     | Valor Tabla = 2 |                           |
| 00  | Dirección       | (2) Arroz $\quad$ Maíz    |
| 01  | Dirección       | (2) Avena $\quad$ Trigo   |
| 10  | Dirección       | (2) Centeno $\quad$ Sorgo |
| 11  | Dirección       | (2) Cebada                |

- **Op 8:** Overflow en el registro apuntado por 10.

|     |                 |                            |
| :-- | :-------------- | :------------------------- |
|     | Valor Tabla = 2 |                            |
| 000 | Dirección       | (2) Arroz $\quad$ Maíz     |
| 001 | Dirección       | (2) Avena $\quad$ Trigo    |
| 010 | Dirección       | (3) Sorgo                  |
| 011 | Dirección       | (2) Cebada                 |
| 100 | Dirección       | (2) Arroz $\quad$ Maíz     |
| 101 | Dirección       | (2) Avena $\quad$ Trigo    |
| 110 | Dirección       | (3) Centeno $\quad$ Quinoa |
| 111 | Dirección       | (2) Cebada                 |

- **Op 9:** Overflow en el registro apuntado por 100.

|     |                 |                            |
| :-- | :-------------- | :------------------------- |
|     | Valor Tabla = 2 |                            |
| 000 | Dirección       | (3) Arroz                  |
| 001 | Dirección       | (2) Avena $\quad$ Trigo    |
| 010 | Dirección       | (3) Sorgo                  |
| 011 | Dirección       | (2) Cebada                 |
| 100 | Dirección       | (3) Kamut $\quad$ Maíz     |
| 101 | Dirección       | (2) Avena $\quad$ Trigo    |
| 110 | Dirección       | (3) Centeno $\quad$ Quinoa |
| 111 | Dirección       | (2) Cebada                 |

- **Op 10:**

|     |                 |                            |
| :-- | :-------------- | :------------------------- |
|     | Valor Tabla = 2 |                            |
| 000 | Dirección       | (3) Arroz $\quad$ Mijo     |
| 001 | Dirección       | (2) Avena $\quad$ Trigo    |
| 010 | Dirección       | (3) Sorgo                  |
| 011 | Dirección       | (2) Cebada                 |
| 100 | Dirección       | (3) Kamut $\quad$ Maíz     |
| 101 | Dirección       | (2) Avena $\quad$ Trigo    |
| 110 | Dirección       | (3) Centeno $\quad$ Quinoa |
| 111 | Dirección       | (2) Cebada                 |
