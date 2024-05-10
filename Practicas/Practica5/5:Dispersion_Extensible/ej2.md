2. Para las claves siguientes, realice el proceso de dispersión mediante el método de hashing extensible, sabiendo que cada nodo tiene capacidad para dos registros. El número natural indica el orden de llegada de las claves. Se debe mostrar el estado del archivo para cada operación. **Justifique brevemente**.

|     |                |          |     |              |          |
| --- | -------------- | -------- | --- | ------------ | -------- |
| 1   | Chow chow      | 00111111 | 2   | Beagle       | 11110100 |
| 3   | Border terrier | 10100101 | 4   | Border Colie | 01010111 |
| 5   | Samoyedo       | 01101011 | 6   | Rottweiler   | 10101010 |
| 7   | Chihuahua      | 00111100 | 8   | Saluki       | 01100111 |
| 9   | Bóxer          | 01010100 | 10  | Gran dánes   | 01100001 |

## Resolución

- **Op 1:**

|     |                 |               |
| :-- | :-------------- | :------------ |
|     | Valor Tabla = 0 |               |
| 0   | Dirección       | (0) Chow chow |

- **Op 2:**

|     |                 |                              |
| :-- | :-------------- | :--------------------------- |
|     | Valor Tabla = 0 |                              |
| 0   | Dirección       | (0) Beagle $\quad$ Chow chow |

- **Op 3:** Overflow en el registro apuntado por 0.

|     |                 |                                      |
| :-- | :-------------- | :----------------------------------- |
|     | Valor Tabla = 1 |                                      |
| 0   | Dirección       | (1) Beagle                           |
| 1   | Dirección       | (1) Border terrier $\quad$ Chow chow |

- **Op 4:** Overflow en el registro apuntado por 1.

|     |                 |                                    |
| :-- | :-------------- | :--------------------------------- |
|     | Valor Tabla = 2 |                                    |
| 00  | Dirección       | (1) Beagle                         |
| 01  | Dirección       | (2) Border terrier                 |
| 10  | Dirección       | (1) Beagle                         |
| 11  | Dirección       | (2) Border Colie $\quad$ Chow chow |

- **Op 5:** Overflow en el registro apuntado por 11.

|     |                 |                                    |
| :-- | :-------------- | :--------------------------------- |
|     | Valor Tabla = 3 |                                    |
| 000 | Dirección       | (1) Beagle                         |
| 001 | Dirección       | (2) Border terrier                 |
| 010 | Dirección       | (1) Beagle                         |
| 011 | Dirección       | (3) Samoyedo                       |
| 100 | Dirección       | (1) Beagle                         |
| 101 | Dirección       | (2) Border terrier                 |
| 110 | Dirección       | (1) Beagle                         |
| 111 | Dirección       | (3) Border Colie $\quad$ Chow chow |

- **Op 6:**

|     |                 |                                    |
| :-- | :-------------- | :--------------------------------- |
|     | Valor Tabla = 3 |                                    |
| 000 | Dirección       | (1) Beagle $\quad$ Rottweiler      |
| 001 | Dirección       | (2) Border terrier                 |
| 010 | Dirección       | (1) Beagle $\quad$ Rottweiler      |
| 011 | Dirección       | (3) Samoyedo                       |
| 100 | Dirección       | (1) Beagle $\quad$ Rottweiler      |
| 101 | Dirección       | (2) Border terrier                 |
| 110 | Dirección       | (1) Beagle $\quad$ Rottweiler      |
| 111 | Dirección       | (3) Border Colie $\quad$ Chow chow |

- **Op 7:**

|     |                 |                                    |
| :-- | :-------------- | :--------------------------------- |
|     | Valor Tabla = 3 |                                    |
| 000 | Dirección       | (2) Beagle $\quad$ Chihuahua       |
| 001 | Dirección       | (2) Border terrier                 |
| 010 | Dirección       | (2) Rottweiler                     |
| 011 | Dirección       | (3) Samoyedo                       |
| 100 | Dirección       | (2) Beagle $\quad$ Chihuahua       |
| 101 | Dirección       | (2) Border terrier                 |
| 110 | Dirección       | (2) Rottweiler                     |
| 111 | Dirección       | (3) Border Colie $\quad$ Chow chow |

- **Op 8:** Overflow en el registro apuntado por 111.

|      |                 |                              |
| :--- | :-------------- | :--------------------------- |
|      | Valor Tabla = 4 |                              |
| 0000 | Dirección       | (2) Beagle $\quad$ Chihuahua |
| 0001 | Dirección       | (2) Border terrier           |
| 0010 | Dirección       | (2) Rottweiler               |
| 0011 | Dirección       | (3) Samoyedo                 |
| 0100 | Dirección       | (2) Beagle $\quad$ Chihuahua |
| 0101 | Dirección       | (2) Border terrier           |
| 0110 | Dirección       | (2) Rottweiler               |
| 0111 | Dirección       | (4) Chow chow $\quad$ Saluki |
| 1000 | Dirección       | (2) Beagle $\quad$ Chihuahua |
| 1001 | Dirección       | (2) Border terrier           |
| 1010 | Dirección       | (2) Rottweiler               |
| 1011 | Dirección       | (3) Samoyedo                 |
| 1100 | Dirección       | (2) Beagle $\quad$ Chihuahua |
| 1101 | Dirección       | (2) Border terrier           |
| 1110 | Dirección       | (2) Rottweiler               |
| 1111 | Dirección       | (4) Chow chow                |

- **Op 9:** Overflow en el registro apuntado por 0100, y luego Overflow en el registro apuntado por 0100.


|      |                 |                              |
| :--- | :-------------- | :--------------------------- |
|      | Valor Tabla = 4 |                              |
| 0000 | Dirección       | (2) Beagle $\quad$ Chihuahua |
| 0001 | Dirección       | (2) Border terrier           |
| 0010 | Dirección       | (2) Rottweiler               |
| 0011 | Dirección       | (3) Samoyedo                 |
| 0100 | Dirección       | (4) Beagle $\quad$ Bóxer     |
| 0101 | Dirección       | (2) Border terrier           |
| 0110 | Dirección       | (2) Rottweiler               |
| 0111 | Dirección       | (4) Chow chow $\quad$ Saluki |
| 1000 | Dirección       | (2) Beagle $\quad$ Chihuahua |
| 1001 | Dirección       | (2) Border terrier           |
| 1010 | Dirección       | (2) Rottweiler               |
| 1011 | Dirección       | (3) Samoyedo                 |
| 1100 | Dirección       | (4) Chihuahua                |
| 1101 | Dirección       | (2) Border terrier           |
| 1110 | Dirección       | (2) Rottweiler               |
| 1111 | Dirección       | (4) Chow chow                |

- **Op 10:**


