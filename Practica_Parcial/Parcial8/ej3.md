### Hashing

Dado el siguiente archivo dispersado, dibuje los estados sucesivos para las siguientes operaciones: +50 , +57, −8, −34, −57. Función de dispersión: Clave MOD 7. Técnica de resolución de colisiones: Saturación progresiva encadenada con área de desborde separada. Justifique brevemente cada operación. Calcular la densidad de empaquetamiento.

| Dirección | Enlace | Registro | Registro |
| --------- | ------ | -------- | -------- |
| 0         | -1     | 14       |          |
| 1         | -1     | 8        | 22       |
| 2         | -1     |          |          |
| 3         | -1     | 24       |          |
| 4         | 1      | 11       | 18       |
| 5         | -1     |          |          |
| 6         | 2      | 20       | 27       |

Área de Desborde

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 34       |
| 1         | -1     | 60       |
| 2         | 0      | 41       |
| 3         | -1     |          |
| 4         | -1     |          |

- **Op +50:** Aplico F1: 50 _MOD_ 7 = 1. Como en la dirección 1 los registros estan ocupados, meto al 50 en el área de desborde, en el primer espacio libre recorriendo secuencialmente, y actualizo los enlaces.

| Dirección | Enlace | Registro | Registro |
| --------- | ------ | -------- | -------- |
| 0         | -1     | 14       |          |
| 1         | 3      | 8        | 22       |
| 2         | -1     |          |          |
| 3         | -1     | 24       |          |
| 4         | 1      | 11       | 18       |
| 5         | -1     |          |          |
| 6         | 2      | 20       | 27       |

Área de Desborde

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 34       |
| 1         | -1     | 60       |
| 2         | 0      | 41       |
| 3         | -1     | 50       |
| 4         | -1     |          |

- **Op +57:** Aplico F1: 57 _MOD_ 7 = 1. Como en la dirección 1 los registros estan ocupados, meto al 50 en el área de desborde, en el primer espacio libre recorriendo secuencialmente, y actualizo los enlaces.

| Dirección | Enlace | Registro | Registro |
| --------- | ------ | -------- | -------- |
| 0         | -1     | 14       |          |
| 1         | 4      | 8        | 22       |
| 2         | -1     |          |          |
| 3         | -1     | 24       |          |
| 4         | 1      | 11       | 18       |
| 5         | -1     |          |          |
| 6         | 2      | 20       | 27       |

Área de Desborde

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 34       |
| 1         | -1     | 60       |
| 2         | 0      | 41       |
| 3         | -1     | 50       |
| 4         | 3      | 57       |

$$DE_{principal} = \frac{8}{7\cdot 2}\cdot 100\% = 57.14\%$$

$$DE_{desborde} = \frac{5}{5\cdot 1}\cdot 100\% = 100\%$$

- **Op -8:** Aplico F1: 8 _MOD_ 7 = 1. El valor 8 se encuentra en el primer registro de la dirección 1, simplemente lo elimino y reacomodo los registros.

| Dirección | Enlace | Registro | Registro |
| --------- | ------ | -------- | -------- |
| 0         | -1     | 14       |          |
| 1         | 4      |          | 22       |
| 2         | -1     |          |          |
| 3         | -1     | 24       |          |
| 4         | 1      | 11       | 18       |
| 5         | -1     |          |          |
| 6         | 2      | 20       | 27       |

Área de Desborde

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 34       |
| 1         | -1     | 60       |
| 2         | 0      | 41       |
| 3         | -1     | 50       |
| 4         | 3      | 57       |

- **Op -57:** Aplico F1: 57 _MOD_ 7 = 1. La clave 57 no se encuentra en los registros de la dirección 1, por lo tanto, busco en el área de desborde utilizando el enlace de la direccion 1, como el enlace tiene el 4, y el 57 se encuentra alli entonces lo elimino del área de desborde y actualizo los enlaces.

| Dirección | Enlace | Registro | Registro |
| --------- | ------ | -------- | -------- |
| 0         | -1     | 14       |          |
| 1         | 3      |          | 22       |
| 2         | -1     |          |          |
| 3         | -1     | 24       |          |
| 4         | 1      | 11       | 18       |
| 5         | -1     |          |          |
| 6         | 2      | 20       | 27       |

Área de Desborde

| Dirección | Enlace | Registro |
| --------- | ------ | -------- |
| 0         | -1     | 34       |
| 1         | -1     | 60       |
| 2         | 0      | 41       |
| 3         | -1     | 50       |
| 4         | -1     |          |

$$DE_{principal} = \frac{7}{7\cdot 2}\cdot 100\% = 50\%$$

$$DE_{desborde} = \frac{4}{5\cdot 1}\cdot 100\% = 80\%$$
