3. Dado el siguiente archivo dispersado, dibuje los estados sucesivos para las siguientes operaciones: +73, +45, −34, −24. Función de dispersión: Clave MOD 8. Técnica de resolución de colisiones: Saturación progresiva encadenada. Calcule la densidad de empaquetamiento. Justifique brevemente cada operación. Justifique cada operación.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 24       |
| 1         | 4      | 9        |
| 2         | 6      | 34       |
| 3         | -1     | 35       |
| 4         | -1     | 57       |
| 5         | -1     |          |
| 6         | -1     | 26       |
| 7         | -1     |          |

- **Op +73:** 73 _MOD_ 8 = 1. Como en la dirección 1 esta ocupado por un sinonimo entonces coloco al 73 en la siguiente direccion libre (5), y actualizo los enlaces de las direcciones nombradas.



| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 24       |
| 1         | 5      | 9        |
| 2         | 6      | 34       |
| 3         | -1     | 35       |
| 4         | -1     | 57       |
| 5         | 4      | 73       |
| 6         | -1     | 26       |
| 7         | -1     |          |

$$DE = \frac{7}{8}\cdot 100\% = 87.5\%$$

- **Op +45:** 45 _MOD_ 8 = 5. Como en la dirección indicada por la funció de hash hay una clave no hay un sinonimo del 45 entonces coloco alli el 45, luego de mover el valor que se encuentra alli a la siguiente dirección libre. Actualizo los indices necesarios.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 24       |
| 1         | 7      | 9        |
| 2         | 6      | 34       |
| 3         | -1     | 35       |
| 4         | -1     | 57       |
| 5         | -1     | 45       |
| 6         | -1     | 26       |
| 7         | 4      | 73       |

$$DE = \frac{8}{8}\cdot 100\% = 100\%$$

- **Op -34:** 34 _MOD_ 8 = 2. Elimino el valor que se encuentra en la dirección que determinó la función de hash, poniendo en su posición la clave que se encuentra en la dirección que indica el enlace de la dirección 2.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 24       |
| 1         | 7      | 9        |
| 2         | -1     | 26       |
| 3         | -1     | 35       |
| 4         | -1     | 57       |
| 5         | -1     | 45       |
| 6         | -1     |          |
| 7         | 4      | 73       |

$$DE = \frac{7}{8}\cdot 100\% = 87.5\%$$

- **Op -24:** 24 _MOD_ 8 = 0. Elimino la clave.

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     |          |
| 1         | 7      | 9        |
| 2         | -1     | 26       |
| 3         | -1     | 35       |
| 4         | -1     | 57       |
| 5         | -1     | 45       |
| 6         | -1     |          |
| 7         | 4      | 73       |

$$DE = \frac{6}{8}\cdot 100\% = 75\%$$
